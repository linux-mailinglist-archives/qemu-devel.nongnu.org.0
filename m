Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8576A5960
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 13:48:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWypQ-0002aI-P2; Tue, 28 Feb 2023 07:11:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pWypL-0002a5-KS
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:11:27 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pWypI-0005gk-Jr
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:11:26 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31S6D8op027473; Tue, 28 Feb 2023 12:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=pIDRfjCs8M0RjA6Vn90KmXd37XlClAX5rk8ZGZtP9t8=;
 b=JPTDKT3gkJBPDWM/322mnRUw+Bsfhjsp6eVNBbsyUFmQg8Ztr/Jbwsr18YeOoLDx9XVL
 76JY8q8nA1+Z0Fx9UE4bc9NgjEv1WaamZz0qVt1pkfb+jkQ/S9+p8ZW3hKFC+4ZhlVul
 iQ5hrCBCAoItdQDMpKt0W//GpKPl3OL/UhUZdnEeRj/59f5guJ2SSzlY105tNpq4UyMF
 JF9UpCbbbaemDRHGkQIlpQlgJCmE20uRBDBsR+SBrTdyx9hxjTk6JQzoEyJtqF8jZTlB
 9X8IaSJCPbRJS3G/UhXUtOpCDBkNjeLe1DRmTRZJ5IY0wwhpUMd+kw3pGmU150iiOMiW WA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nyb9ae058-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Feb 2023 12:11:18 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31SBTFgG001585; Tue, 28 Feb 2023 12:11:17 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8s6evck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Feb 2023 12:11:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4XcVaYrh6PgLNplGOEFVV3EL2J2jceNXoo/yeuC0ihqbySCxzueA7YkLmiZMeRKA6k834exTO2HCajiu8XVsB3eUk0WBE8eGXMgaiWCqhYxoSt6XzAMvUPvE/kaheZdSxVbGFg0OkLwvYbMUBImGVv3Iai4t2zl3O6YJiE5+/ulRBqIW3UnEzXuzkm4+n+MxGtmfTHfebc4VDVQ15KR/iTPemkdnn/0ZrxDSHn5dz7zyurZB4dfJkIoauPTtfrWtBRgh0ZrgwnCT1+zxX3rvke99MktvCwsmM3lHoE3iD+wYyLuaWdrC3NOcWVKjy5qzWpG2eztFiwnQOPfMAoqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIDRfjCs8M0RjA6Vn90KmXd37XlClAX5rk8ZGZtP9t8=;
 b=cIOcy0eSiAH64XGehr8TFz3B7N3T/h+a7iF3J2OtNcN65TwjNay4+NgfD9Hcr9gPSkOvg5BYzhkZu30mRVOuwif+ArFq6590EM0I43mhX//b2tQIWk9Q1ssuB+bSp7FEZ0ZRCOOh0rB0oOWHIaSd+KlK9eqc2A2EI4cFgGxfIrR//Q+Rh3QfuROksqLLy5TB8ZujJGorDGr4mt8Ssx5qMQmVAFRSPMKlyvP1rI94UHmsvjp6O5a8tAzxdhrEcjlol3XsrhvGwcx1xzXt2kE7JhCzGBP/47528RrS1oddWBy1t5QGoRjEUq7x7E5piIaRjaLwekNeUZnj7+U9Ox8OGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIDRfjCs8M0RjA6Vn90KmXd37XlClAX5rk8ZGZtP9t8=;
 b=a62JhtqQy4EQpL11iyUIZN84U7f0l4UExhCFkAeiiNHKwkL1+epl/9Cmin42bSv6AFfBauOQgM13pemXUd+FVpsJnglAZu3gqAyH2ZhTHKc9IvzQTYTRKnFcqs71+xlJcGV4WTzXBxS6ErZrL89siqAIEdWXT16s++2EwvJiMlI=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DS7PR10MB5359.namprd10.prod.outlook.com (2603:10b6:5:3a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Tue, 28 Feb
 2023 12:11:15 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%5]) with mapi id 15.20.6156.017; Tue, 28 Feb 2023
 12:11:14 +0000
Message-ID: <617b396a-d5e2-8c10-9717-1cc6fc9d43dd@oracle.com>
Date: Tue, 28 Feb 2023 12:11:06 +0000
Subject: Re: [PATCH v2 10/20] vfio/common: Record DMA mapped IOVA ranges
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-11-avihaih@nvidia.com>
 <20230222151039.1de95db4.alex.williamson@redhat.com>
 <83238759-4808-1e41-824b-865c330a431a@oracle.com>
 <20230223140527.096dc42b.alex.williamson@redhat.com>
 <a53767f9-b630-8f2e-0523-bd47d4539c61@oracle.com>
 <20230223145018.3c46a966.alex.williamson@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230223145018.3c46a966.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0066.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::17) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|DS7PR10MB5359:EE_
X-MS-Office365-Filtering-Correlation-Id: c336f4b3-1280-4cd7-fd6d-08db1984e34e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wEkbtl2IlZfCCEs+/nzIY4GoU15ar3GGlbrdvIgqeOGg3qE/0pLIb3lWXvQ0RyhGZx2KyCS9tNeA6Ntr8RZMcnRJLg89PgN+DWbRavGD0x9MEh1Ojy0unfrdlNhouGp7iujN4CwqCAxKbE3ORjgJ5RM/adsCT3FiUlmQ/93QvJZ6/lF/a3mmnm5sEQyWyYp+SRq4H5nU3P6zndygqulaG6ElkOgU3ndA0ne8sWVPlQwASWQUob39HLs8PiFmZfug7mrpCK5XQIjmT32UFj94xOw0Sqw6nyeN9EGL7t7FAeUnUZTo2lAct25QbS5gj67HtB/CD74RuFlTwdTuzOmoVxgK8wXLs7U0vtZDjqvIBZ+8JLNuQTFYcyq8gxxbfGv9vQHUjvHhWccyBbRUcPQk2Hhf4h/+B1X6Jh5WZwpwIHIuaKSpCe6OKLRoAkmjMbb17H5qNdltn1G5OAUJtgMiUss+YyT6Dg7VURR51yYtQS8l+G3LW8bvzBYY5cayWP805JyskW3p5VgG02lp49uty1Der97XAiAsnTvxi/bFdghz5gdnt6Pf1G2IHDaAYxaKCz0A2dvfvJGGOdHlJiYOCdJUJWrIdm4hCICe4nlT+qv6UhEJBDA6Oex+w4XPMradMHXzzTZKE5mh3bGnEg8QPL1uwFlMy6Z5TZUeEANTb5sKoVCZSvmrru+whu9prSIOnJBITqbxnhww6LahK/kjOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199018)(31686004)(8936002)(7416002)(5660300002)(31696002)(26005)(186003)(66899018)(66556008)(66476007)(8676002)(66946007)(41300700001)(6916009)(4326008)(316002)(36756003)(54906003)(83380400001)(6486002)(478600001)(86362001)(53546011)(2906002)(6506007)(6512007)(6666004)(2616005)(38100700002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjB0WVBYU0NuUWFodGx6Uy9LeFErdHVPTVljdXpyckxrVGpyN0FVVy9XdktT?=
 =?utf-8?B?d1ZPU0pTZ2JyOWR6VkhBRWsxZ2xqRER1SiszSkpydTI3aVVwdzVVUXFZYWpB?=
 =?utf-8?B?ckErQmRsMkxoQm1rUEZGZXU3KzRzelZ2SURPb2syWFcvVFZZcjBvK0cxazFY?=
 =?utf-8?B?RHhyOTBhbHlLbDJOeTVsMjJrM3B6VkYzTjF4aHRyTGtFSXI5OGNXMDUrOXJW?=
 =?utf-8?B?YkNBMTJvZWJLd1ArZnRjaU1YNkJsYVpMSmV2NFJoNE5FNXlKeS92TnpOVFg5?=
 =?utf-8?B?bDgzMlNtNHFSTythNjJoL0RBYVZLa0Z0T3ZYbGlJZ1VHaE1aVXkyMWhucU5u?=
 =?utf-8?B?R1kxNCtJd0djWWl5REg0QmhGRklKVUlDVnVvNmxON01ZUWcyVmd1RlBIWEhJ?=
 =?utf-8?B?WFUrTFhyZy9VamlKZnNzRCtqeHRrYTk5S25LUVU5VTNOSlQxTHhoTEw3dzBV?=
 =?utf-8?B?NlFVcTBISXk2N1ZTSXpyWGpwSHhxSlBLUk04dHJrMm51dU9BbVZySmY2SVB2?=
 =?utf-8?B?UGpSUUhSVkJjRGx4NitkT3NLamVmZUtkcGI5U3gvT2FwREhzMTRVR1NpN3c0?=
 =?utf-8?B?TENMWHQ1b3NUSHVIWnExMVlLMjlGQlR4dHc5NXNFZk5HajQzVVpkUGVKbk50?=
 =?utf-8?B?ZFZkN1M3bGQ5azN5NXBDQWdDR0JrNklwMGgzRFY0YkpuYjdTQWVIM0FUOHZJ?=
 =?utf-8?B?dU01U2lRT3RMcEJFRW55akYwbWJlTWphSk1zbEFOcHpmN0NjeTNDS0E4Nlp3?=
 =?utf-8?B?RTdDZHV4bEs0MW5ncjhiMmhTbE5IeTc3Ris2STZIZTBUUWhSV3V3YThCc0Nr?=
 =?utf-8?B?NVE2MTZ5LzFLanNyN2Z3dDc4SWxkSGE0RzhZb3Z4TkFmWWNKWlVqN3dWbEFB?=
 =?utf-8?B?S0VhRklTSWcvTlBpRDcraXorWU85WTA4MjhhdDRwdTVSV0VYTzZ2eEJZTDlU?=
 =?utf-8?B?S3JzRXRibklLL0ROaE1WUVhKaktvZGlOaWJKLzRhQm5nWGdtVlZ1eG1qUHNs?=
 =?utf-8?B?RjF1Nk5mWWMvc0w5dkczdDhOSUhsT2JuVHM1aGZ4UHpaL1B2VE9vZ0RWdS9i?=
 =?utf-8?B?Z0E1ek9NTUczYjVEVHZFOW5rWm5TVmkyMVZ0STF5eEtadlBWSmI1Nm5TU2t0?=
 =?utf-8?B?OWozTVFsTWhXbkprMHREOFRnc05jL3ZpMFF5eC9qRm9tSk0vV1k5d0ZRanZT?=
 =?utf-8?B?cCsrZ0hpbWNkQi9CNjRQOElaQzlTYkdxc0V6ME9PQjZkM1JXZVlILy9USWxF?=
 =?utf-8?B?WEhlVXgxMW85dTdCNVgxQVhuUnB0K0hVS1lLOGY5UGViYTFIMUVhVllibW9m?=
 =?utf-8?B?VEIySUduVXN0Mm9kdHo1ZGYrWHFkcW9VVVJ0VHl5a1dLVUdLbVdheGVSNnFP?=
 =?utf-8?B?R280SmRnazlOVUlaVzhyQTUrclhRWHVYbktYMmRVNS9ISFU0cmUwYmFieEU1?=
 =?utf-8?B?REJOTlc0VFg0WldBYzBjcXlkZ1hzRStPeDdlVEZ6bDFvL0hIb0lXOGxPeWtQ?=
 =?utf-8?B?VFdVaEtoWjE1WWdNRDVkS2lwb1V6N1ZmdmZ3RUY5VFc3ZzRkZTlVSi9GRDEx?=
 =?utf-8?B?T21nWFc5SDNoRE41RTFYSmVVeG5pd3h5c2ExM1hrYXd4VnNxVjZkNXNVVDFt?=
 =?utf-8?B?ZktSWkE5K2tSOXZlTlM1ZG1ZYjdZcnN6eXdOcStHVU40SFlvSWNuVndBcHlq?=
 =?utf-8?B?RGFIQmw3ditoNVZOYjByTjZlSUVvMFg1MndvMkhnQituWTltbGF0bFNSY3hm?=
 =?utf-8?B?cDMvRG8vYWR0NkdxOXcvNFhDdW5LamtuOG9VLzFjUEtMTE1jUVVUWXc5SExZ?=
 =?utf-8?B?WTllTzR6eDRGRVZMZFU1TVNXRzdvMElwbURWaTBPOGNhM2ZBMS81d1VWYXlW?=
 =?utf-8?B?WDNIcTRyRjlFb1hQbGVzQVU3N1dhNmpQZWQ3bXR2KytJQ25yTHZzWlRiL0Nv?=
 =?utf-8?B?MXRyR3FZNnNRWDNMM3ZrZ2IxdzBaN3F6SDJsRWF6WlpWd3lSNWM4UCs2TUR3?=
 =?utf-8?B?QjQwN0gvUm5majVpci93UkYyR2lXNmptSGVuQTR3RTl3VzkxTXNRZk11MERN?=
 =?utf-8?B?ZUZUTFNlRHRVVmpoK293YUxYSUJINGFiU3pWV24xck9IUElJOW9nWTdSZDMy?=
 =?utf-8?B?Y0JSUU1iT1hnenR0R3dDMy94aXZhcTlTc1BGZTJJczlZc3pRQnE3SS9pOU1D?=
 =?utf-8?B?blE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 8Xq758tMSAoJ7L3zLrBGbKHPX+N4JkgfNzMifWVQyx5BP7TL1tOnkhW/i2j3QriFcijZkZ5hF5mKrK2Lcdi8mOmNZ5PPZMKQOIfU8wI2rampxSbyT6sPaxgtxmyKg//3reVWzsEERtBYjt5X40mZB5WW0gdE6RTsaaOouXSOTw/SenilMSbTrNKhadMDLjDRP0JAewDZtw/p/p4mq8c2WkxmBVwSGB2iUwKKXUMvQX4kdLlp3R3kpsSEgNSiYBJrxs17Hab65CYHDh965jkLGBaI1SjhqyWW2qebGLPgMlQAhu8eDL3nL6zW0aM2d2YEfq4vFdAp6uwibMd8b46cmRhDkDLmweE3dDi+4DOEh0iMCWEHmj9oHK7tER02JTByWA3lpkjvfg8mr5G4JV/dDysod3ykcISsjvGpy8dWXws+AphIVndDqYqLOdBJ6Yot21hNiFukzVHFULzfnhMsXlh4P4WtAmwiddNHO2pFFQAKIbWJZHmHePTs7qT8IWxjF/xkDV555EXo0OkUx7oNlJDhcgselDZYriygN+GkCi8ptKJV026x5vf6CsOjPxK4o0lrCBzfQFzWkLjDTI2rJWHNIAxHZCebowYt5/U3wyvxrbs3UEIj2HJAt9Y2B0+5x5pjLVEKuYEuE04CaLFJEYv0RryHylOjzzcTCB1svzRiTq19VlL0Hx/ITOkyJdBaa8dEAORgoSeiQxue+vBBoK431cYV/uRgpxBKHUXqPSUW+WKoj8o1XcplN/WAvKVH25TtM6rKCtcd1v7LrGj1WGpiOxtngxXRkFtN8OADXnsZThSiRIX7mIGpIuPUrTMoQDb85gh2TabuviqGa/syapJEsfPKTlKuHWyRRo0teCyqlp8tbzBcSIPiRoZAPh8haG61mEbts/ZTSd1AOZJO/w==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c336f4b3-1280-4cd7-fd6d-08db1984e34e
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 12:11:14.5538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwYQbLgYcnIq6W/02pmqsT7QydLr+UhNfgagyKsM9dqqzG4rAVVQfXBZVRJGTZbji3mqOeeIcE7NSa4QOf48hNtBomsgQ/f93VuqC66bAT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5359
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-02-28_08,2023-02-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxlogscore=938 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302280098
X-Proofpoint-GUID: CZCNj9-QXguMR5h2n0-s7L7ivX2TwL7u
X-Proofpoint-ORIG-GUID: CZCNj9-QXguMR5h2n0-s7L7ivX2TwL7u
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23/02/2023 21:50, Alex Williamson wrote:
> On Thu, 23 Feb 2023 21:19:12 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
>> On 23/02/2023 21:05, Alex Williamson wrote:
>>> On Thu, 23 Feb 2023 10:37:10 +0000
>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>> On 22/02/2023 22:10, Alex Williamson wrote:  
>>>>> On Wed, 22 Feb 2023 19:49:05 +0200
>>>>> Avihai Horon <avihaih@nvidia.com> wrote:    
>>>>>> From: Joao Martins <joao.m.martins@oracle.com>
>>>>>> @@ -612,6 +665,16 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
>>>>>>          .iova = iova,
>>>>>>          .size = size,
>>>>>>      };
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    ret = vfio_record_mapping(container, iova, size, readonly);
>>>>>> +    if (ret) {
>>>>>> +        error_report("vfio: Failed to record mapping, iova: 0x%" HWADDR_PRIx
>>>>>> +                     ", size: 0x" RAM_ADDR_FMT ", ret: %d (%s)",
>>>>>> +                     iova, size, ret, strerror(-ret));
>>>>>> +
>>>>>> +        return ret;
>>>>>> +    }    
>>>>>
>>>>> Is there no way to replay the mappings when a migration is started?
>>>>> This seems like a horrible latency and bloat trade-off for the
>>>>> possibility that the VM might migrate and the device might support
>>>>> these features.  Our performance with vIOMMU is already terrible, I
>>>>> can't help but believe this makes it worse.  Thanks,
>>>>>     
>>>>
>>>> It is a nop if the vIOMMU is being used (entries in container->giommu_list) as
>>>> that uses a max-iova based IOVA range. So this is really for iommu identity
>>>> mapping and no-VIOMMU.  
>>>
>>> Ok, yes, there are no mappings recorded for any containers that have a
>>> non-empty giommu_list.
>>>   
>>>> We could replay them if they were tracked/stored anywhere.  
>>>
>>> Rather than piggybacking on vfio_memory_listener, why not simply
>>> register a new MemoryListener when migration is started?  That will
>>> replay all the existing ranges and allow tracking to happen separate
>>> from mapping, and only when needed.
>>>   
>>
>> The problem with that is that *starting* dirty tracking needs to have all the
>> range, we aren't supposed to start each range separately. So on a memory
>> listener callback you don't have introspection when you are dealing with the
>> last range, do we?
> 
> As soon as memory_listener_register() returns, all your callbacks to
> build the IOVATree have been called and you can act on the result the
> same as if you were relying on the vfio mapping MemoryListener.  I'm
> not seeing the problem.  Thanks,
> 

While doing these changes, the nice thing of the current patch is that whatever
changes apply to vfio_listener_region_add() will be reflected in the mappings
tree that stores what we will dirty track. If we move the mappings calculation
necessary for dirty tracking only when we start, we will have to duplicate the
same checks, and open for bugs where we ask things to be dirty track-ed that
haven't been DMA mapped. These two aren't necessarily tied, but felt like I
should raise the potentially duplication of the checks (and the same thing
applies for handling virtio-mem and what not).

I understand that if we were going to store *a lot* of mappings that this would
add up in space requirements. But for no-vIOMMU (or iommu=pt) case this is only
about 12ranges or so, it is much simpler to piggyback the existing listener.
Would you still want to move this to its own dedicated memory listener?

	Joao

