using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Clinic.Models;

namespace Clinic.Data.Helpers
{
    public static class DataFiller
    {
        public static void InitData()
        {
            using (ClinicModelContainer container = new ClinicModelContainer())
            {
                if (container.Doctors.Count() == 0)
                {
                    container.DoctorTypes.AddRange(InitDoctorTypes());
                    container.Specials.AddRange(InitSpecials());
                    container.Categories.AddRange(InitCategories());
                    container.SaveChanges();

                    container.Doctors.AddRange(InitDoctors(container.Specials.ToList(),
                        container.DoctorTypes.ToList(), container.Categories.ToList()));

                    container.SaveChanges();

                    container.SexSet.AddRange(InitSexes());
                    container.AddressSet.AddRange(InitAddresses());

                    container.SaveChanges();

                    container.PatientCards.AddRange(InitPatientCards(container.AddressSet.ToList(),
                        container.SexSet.ToList()));

                    container.SaveChanges();

                    container.CardPages.AddRange(InitCardPages(container.PatientCards.ToList(),
                        container.Doctors.ToList()));

                    container.SaveChanges();

                    container.Sites.AddRange(InitSites());

                    container.SaveChanges();

                    container.SiteAddresses.AddRange(InitSiteAddresses(container.Sites.ToList(),
                        container.AddressSet.ToList()));

                    container.SaveChanges();

                    container.Surgeries.AddRange(InitSurgeries());
                    container.SiteDoctors.AddRange(InitSiteDoctors(container.Sites.ToList(),
                        container.Doctors.ToList()));

                    container.SaveChanges();
                }
            }
        }

        private static List<DoctorType> InitDoctorTypes()
        {
            var types = new List<DoctorType>()
            {
                new DoctorType()
                {
                    Name = "Участковый врач"
                },
                new DoctorType()
                {
                    Name = "Узкий специалист"
                },
                new DoctorType()
                {
                    Name = "Начальник отделения"
                }
            };

            return types;
        }

        private static List<Special> InitSpecials()
        {
            return new List<Special>
            {
                new Special()
                {
                    Description = "Терапевт"
                },
                new Special()
                {
                    Description = "Хирург"
                },
                new Special()
                {
                    Description = "Отоларинголог"
                }
            };
        }

        private static List<Category> InitCategories()
        {
            return new List<Category>()
            {
                new Category()
                {
                    Description = "Врач высшей категории"
                },
                new Category()
                {
                    Description = "Врач первой категории"
                },
                new Category()
                {
                    Description = "Врач второй категории"
                }
            };
        }

        private static List<Doctor> InitDoctors(List<Special> specials,
            List<DoctorType> types, List<Category> categories)
        {
            return new List<Doctor>()
            {
                new Doctor()
                {
                    Name = "Иванов",
                    Surname = "Иван",
                    Patrynum = "Иванович",
                    SpecialId = specials[0].SpecialId,
                    DoctorTypeId = types[0].DoctorTypeId,
                    BirthDate = new DateTime(1987, 03, 22),
                    CategoryId = categories[1].CategoryId,
                    Expirience = 10,
                    Icon = "therapist_1.jpg",
                    Category = categories[1],
                    Special = specials[0],
                    DoctorType = types[0]
                },
                new Doctor()
                {
                    Name = "Алексей",
                    Surname = "Сергиенко",
                    Patrynum = "Сергеевич",
                    SpecialId = specials[1].SpecialId,
                    DoctorTypeId = types[1].DoctorTypeId,
                    BirthDate = new DateTime(1985, 05, 16),
                    CategoryId = categories[0].CategoryId,
                    Expirience = 15,
                    Icon = "surgey_1.jpg",
                    Category = categories[0],
                    Special = specials[1],
                    DoctorType = types[1]
                },
                new Doctor()
                {
                    Name = "Максим",
                    Surname = "Шевцов",
                    Patrynum = "Антонович",
                    SpecialId = specials[2].SpecialId,
                    DoctorTypeId = types[1].DoctorTypeId,
                    BirthDate = new DateTime(1983, 01, 08),
                    CategoryId = categories[2].CategoryId,
                    Expirience = 7,
                    Icon = "lor_1.jpg",
                    Category = categories[2],
                    Special = specials[2],
                    DoctorType = types[1]
                },
                new Doctor()
                {
                    Name = "Мария",
                    Surname = "Павлова",
                    Patrynum = "Никитична",
                    SpecialId = specials[0].SpecialId,
                    DoctorTypeId = types[0].DoctorTypeId,
                    BirthDate = new DateTime(1987, 07, 18),
                    CategoryId = categories[1].CategoryId,
                    Category = categories[1],
                    Special = specials[0],
                    Expirience = 7,
                    Icon = "therapist_2.jpg",
                    DoctorType = types[0]
                }
            };
        }

        private static List<Address> InitAddresses() 
        {
            return new List<Address>()
            {
                new Address()
                {
                    Name = "г. Челябинск, ул. Кирова 2, кв 25"
                },
                new Address()
                {
                    Name = "г. Челябинск, ул. Проспект победы 21, кв 37"
                },
                new Address()
                {
                    Name = "г. Челябинск, ул. Кранснопольский проспект 4, кв 84"
                },
                new Address()
                {
                    Name = "г. Челябинск, ул. Игнатия Вандышева 8, кв 4"
                }
            };
        }

        private static List<Sex> InitSexes()
        {
            return new List<Sex>()
            {
                new Sex()
                {
                    Name = "Мужской"
                },
                new Sex()
                {
                    Name = "Женский"
                }
            };
        }

        private static List<PatientCard> InitPatientCards(List<Address> addreses, List<Sex> sexes)
        {
            return new List<PatientCard>()
            {
                new PatientCard()
                {
                    Name = "Иван",
                    Surname = "Иванович",
                    Patrynum = "Иванов",
                    Age = 23,
                    AddressId = addreses[0].AddressId,
                    Address = addreses[0],
                    Icon = "patient_1.jpg",
                    Number = 00000001,
                    SexId = sexes[0].SexId,
                    Sex = sexes[0]
                },
                new PatientCard()
                {
                    Name = "Игорь",
                    Surname = "Дикопольцев",
                    Patrynum = "Александрович",
                    Age = 20,
                    AddressId = addreses[1].AddressId,
                    Address = addreses[1],
                    Icon = "patient_2.jpg",
                    Number = 00000002,
                    SexId = sexes[0].SexId,
                    Sex = sexes[0]
                },
                new PatientCard()
                {
                    Name = "Ольга",
                    Surname = "Захарова",
                    Patrynum = "Фёдоровна",
                    Age = 33,
                    AddressId = addreses[2].AddressId,
                    Address = addreses[2],
                    Icon = "patient_3.jpg",
                    Number = 00000003,
                    SexId = sexes[1].SexId,
                    Sex = sexes[1]
                },
                new PatientCard()
                {
                    Name = "Алексей",
                    Surname = "Баутин",
                    Patrynum = "Сергеевич",
                    Age = 27,
                    AddressId = addreses[3].AddressId,
                    Address = addreses[3],
                    Icon = "patient_4.jpg",
                    Number = 00000004,
                    SexId = sexes[0].SexId,
                    Sex = sexes[0]
                }
            };
        }

        private static List<CardPage> InitCardPages(List<PatientCard> cards, List<Doctor> doctors)
        {
            return new List<CardPage>()
            {
                new CardPage()
                {
                    PatientCardId = cards[0].PatientCardId,
                    PatientCard = cards[0],
                    DoctorId = doctors[0].DoctorId,
                    Doctor = doctors[0],
                    PageNumber = 1,
                    Complaints = "Кашель, сопли, горло, температура",
                    Diagnosis = "ОРВИ",
                    Treatment = "Принимать препараты от кашля, полоскать горло," +
                    " брызгать сосудосуживающие в нос",
                    Date = new DateTime(2020, 04, 17)
                },
                new CardPage()
                {
                    PatientCardId = cards[0].PatientCardId,
                    PatientCard = cards[0],
                    DoctorId = doctors[0].DoctorId,
                    Doctor = doctors[0],
                    PageNumber = 2,
                    Complaints = "Повышенная утомляемость",
                    Diagnosis = "Стресс, недостаток сна",
                    Treatment = "Гулять на свежем воздухе, принимать мульти витамины, больше спать",
                    Date = new DateTime(2020, 05, 1)
                },
                new CardPage()
                {
                    PatientCardId = cards[2].PatientCardId,
                    PatientCard = cards[2],
                    DoctorId = doctors[3].DoctorId,
                    Doctor = doctors[3],
                    PageNumber = 1,
                    Complaints = "Кашель, сопли, горло, температура",
                    Diagnosis = "ОРВИ",
                    Treatment = "Принимать препараты от кашля, полоскать горло," +
                    " брызгать сосудосуживающие в нос",
                    Date = new DateTime(2020, 02, 9)
                }
            };
        }

        private static List<Surgery> InitSurgeries()
        {
            return new List<Surgery>()
            {
                new Surgery()
                {
                    Number = 101
                },
                new Surgery()
                {
                    Number = 202
                }
            };
        }

        private static List<Site> InitSites()
        {
            return new List<Site>()
            {
                new Site()
                {
                    Number = 1
                },
                new Site()
                {
                    Number = 2
                }
            };
        }

        private static List<SiteAddress> InitSiteAddresses(List<Site> sites, List<Address> addresses)
        {
            return new List<SiteAddress>()
            {
                new SiteAddress()
                {
                    SiteId = sites[0].SiteId,
                    Site = sites[0],
                    AddressId = addresses[0].AddressId,
                    Address = addresses[0]
                },
                new SiteAddress()
                {
                    SiteId = sites[0].SiteId,
                    Site = sites[0],
                    AddressId = addresses[1].AddressId,
                    Address = addresses[1]
                },
                new SiteAddress()
                {
                    SiteId = sites[1].SiteId,
                    Site = sites[1],
                    AddressId = addresses[2].AddressId,
                    Address = addresses[2]
                },
                new SiteAddress()
                {
                    SiteId = sites[1].SiteId,
                    Site = sites[1],
                    AddressId = addresses[3].AddressId,
                    Address = addresses[3]
                }
            };
        }

        private static List<SiteDoctors> InitSiteDoctors(List<Site> sites, List<Doctor> doctors)
        {
            return new List<SiteDoctors>()
            {
                new SiteDoctors()
                {
                    SiteId = sites[0].SiteId,
                    Site = sites[0],
                    DoctorId = doctors[0].DoctorId,
                    Doctor = doctors[0]
                },
                new SiteDoctors()
                {
                    SiteId = sites[1].SiteId,
                    Site = sites[1],
                    DoctorId = doctors[1].DoctorId,
                    Doctor = doctors[1]
                }
            };
        }
    }
}
