Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1554A566572
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:51:57 +0200 (CEST)
Received: from localhost ([::1]:47602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8eHk-0004o7-5R
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o8eEX-0002kp-Oo
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:48:37 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:19316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o8eES-0006aG-Ub
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:48:37 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2658BW6V027058;
 Tue, 5 Jul 2022 08:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=BCO+JXx4wTtAtklUj00xe89nIGq8TTUf43gehxT6B4U=;
 b=q14AuCs+C7DMph7oOQ/y26UMbi/s6EKZR9wEL7wqaNGm5oH8fOQydU/X4w4uMeYJmE+a
 SHClkXStqRN4z1+7cjMtl1xT+B66mxEHTkDUXWWF+4INRHLUNLoYEDysA6gDNpTJzixc
 0EMHiDiARozmBq5meCwV6wuOBtXHnjjpbXfvbzE0M9GAfObGK0Qo/Pg9gpPtzHFnEEDb
 cf2XCy3+RKz/nUntY0T62RRyQs2LyYCBNblIUJlrLDXRtjGC/6SF7DlzSfk2FJ4HoO8o
 0wf6AYkMYnpD1s0KPLh9g5ajsMDnQYy8bS10vn8glIGr4urfNaQ0BWjlMxUjtTU8BgCE hQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2dmsw87f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 08:48:25 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2658eu76031520; Tue, 5 Jul 2022 08:48:24 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h32mj3asd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 08:48:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dElwDFypOVQGiheq7Lw5Sx8a7OgbvtuyweUHtzZxWHBTt6PTVK6TDKi/TAXvnYI2AbRWFcsYJOOHHEbh2fbQ5fFySmV7OgpqjdQrrK9INk7/KVUIDhjKVms5+gObvYLmscLSpSbVBmAp7cRzXSJUknlI0UKb/vE3ZPDe9wRH9CCswXpWctHQD2ISjDssNHlLH9vsnGCuU9vQATLXKm2q3/nzithmLkhcWLCbOeafkBzpsOB05T7btx5szraG8sxehhSTdzTmwU3dTM6ERq/84X50U6lBEZVFVQS9Xz+dGu/YRs0Fx7V9wywA5rtjA8w28NxDrUovrom0Uh7fjfAbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCO+JXx4wTtAtklUj00xe89nIGq8TTUf43gehxT6B4U=;
 b=Apb1w78SVNHl20LuT9PHTxOdCQT0+hpXVPxYSoxJf57lfMNYHhKVOYM9ULPjFO8E46aiCviROv65QAJ4JuPAqcv5vaYMsZoszvF7E8IGNJSzOoC++gYs0UxslEJ+g2Qw0JBBu8xSqcfXAPKSxinO88eROkGVigAnYvgsgGzE8A/l+v7QkIgYbZQxfQs0qkD/pGCCSVdbUw6HfLtzCVM2D/2/psH5Gdr7W4WavW9T/ROx1nlLw8Q+MAndjbNCEdl4LvuOFoKxGAa1YIICc02uM2UltbojorGe9cqVbAQQDHLD3K8OHfiWHMLBqhq89FDHTmypCy1WGBthfL+A7dVfvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCO+JXx4wTtAtklUj00xe89nIGq8TTUf43gehxT6B4U=;
 b=djWIFk178TX8ZyJwkR9kRAUEpqJSrlm47Ss+h3pMmTfhzTfUlw3SmXb9Z2ETVuvGmCpo2mPafDLrCvG9wWItcEQjLdw6amRLJZ3mE5Ms3DxnjPLblre9kVHw2eb9XwAQPgowW/6i0iFqN5nHnD0J1HqFgvIJHeqbR6jwowezoDo=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CY4PR10MB1991.namprd10.prod.outlook.com (2603:10b6:903:122::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Tue, 5 Jul
 2022 08:48:22 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%8]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 08:48:22 +0000
Message-ID: <c3a2b88d-f794-4f2f-6e2f-60ae91f727fd@oracle.com>
Date: Tue, 5 Jul 2022 09:48:16 +0100
Subject: Re: [PATCH v6 10/10] i386/pc: restrict AMD only enforcing of valid
 IOVAs to new machine type
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-11-joao.m.martins@oracle.com> <YsL44oyg8HVzu1YC@work-vm>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <YsL44oyg8HVzu1YC@work-vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0090.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::11) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f670e913-c53a-43b0-495e-08da5e631df8
X-MS-TrafficTypeDiagnostic: CY4PR10MB1991:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h5a7QqH60Ew8N2oOC0s6hxVPo6iEBZw59X/3CAJ1tgpDDRiJYAzgXlxxFYUWhZOgi8VFYBoDu6394k7nIxuHyDnqmc15cr7W3tKiNJhqsAwxPItX3ucJKrMO9zQaXVOWShGGwdysyJ9hWAECzcFKmTQhluuInVmAWO5D86dSZ8/91QBZ6OesZTXEGHqgnvhOSaL0vwkiTkL2IofHi+ja6kNJ1iFCocQlumbqL4m6+wEhJ1l5LHzBXmq2H9UEMNa/IRI09E9HUaNZ026K5ddPs5em3KSgrA870Q3OiLRJcFYxHgdbxuMue4gI9hQjvEulADNBJXrlEjAt5xW5/LTNfQjmNLM5dWbbRvuKeMbO2MaOAx/e0g8EQt0vWVu4osKHykEv5SNu1cyUnVlKuQTlt4VYGcK2iYQDrP6aEhpX6+L09/CGS5A32Se7c4xaN6mip8gqqeZJ+n9hfpWE8eufPJxdvC5kEQ+uRPXMedJddtzXr/Xzlw8KvyqpAY0h5G82pgQE2OmMLIR2goFN2WkHu0U3Z2zJTO4bJlorz20vk161OoYm8BnzSB3rJpiJnhHSYhYHRhiblvoo+PV42TX/vv+pSwDqgOpWrvP0ZdDjzeIy9SPkzAyb0W3aSIsdumRdZACf8JViyV29/SZ+61jya5KFgD2nA3KyX4DeAZ95mNdDFiOobwp/u90TYbPJFJuYBj/pYt4cYnJ1bfbQHnI6O4S0Ahcv765ileBw7orFfvk0BWUCXrq4evAm6G2MWrgIGdtWn9ygOcoZeid8/So5C9+yHGwrRVqMkggeaecCeYB2hNII/aadSolLWMkk58sC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(346002)(396003)(136003)(366004)(41300700001)(6512007)(8936002)(6486002)(7416002)(53546011)(2616005)(6506007)(6666004)(26005)(478600001)(86362001)(31696002)(38100700002)(2906002)(4744005)(5660300002)(83380400001)(186003)(6916009)(316002)(36756003)(31686004)(66476007)(54906003)(66556008)(8676002)(4326008)(66946007)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1Z2ZnMrZllBUmZoZ2xxVHN0YjZsTElwWU51QUFYYkF5Rm9nSlJtdFprZm5J?=
 =?utf-8?B?TWkwa1FCcDZndDhGa0cwMEZJWUhWU21GUjZLQ0JUNCtuWktuUktDR25UQjVp?=
 =?utf-8?B?dUpBTEV3eWkwT3g5cG54bitOQ2JkemFaZWROdTlYbStYVjVRejg2K09paE80?=
 =?utf-8?B?OUIrV3NrYXZqd1MvNVF2ck5YWm9EcEdzc0V5STFBV0w3OWdQVWFGNHAxbjAy?=
 =?utf-8?B?Rmcxc2R6VytteEJkb3hpZVo1b1grUTk1Qk5YQkhaak5neEFOM0w3MWU2bHB3?=
 =?utf-8?B?NFdGL2szTWU2YVJsWWY0UGhkVnFQSyt2YlRtc0VXMS95dlVnS1BDVFFTTXRt?=
 =?utf-8?B?ZDk4TTh1UWRzUjhucEpWR1JyYjVQWnlGTmY4bzg2SEpRUTZUL2l5Wm1FSjVO?=
 =?utf-8?B?eXAyc0plVjZMZjVwdWNud0FySFlreXd0Z1VPSFJpbkNIT1J2V21JSEdHNU9Y?=
 =?utf-8?B?c1dmNGtJZWR3M0ZkMytkUFBqdjV4c2VqUHl1VWFYd1lCVldPTHdxUXJsaE9D?=
 =?utf-8?B?bWl4SWJSaWpnamk1dklabTV2ZVNIQzBwdlBDcS9qUXg5d0FCaXh3eVVKTDhD?=
 =?utf-8?B?akNTZVdOSXU2S29EMEY5Z09JblZlVFFKTjJTQXE1cTN2Qm1MVEo3dHNPblZt?=
 =?utf-8?B?NkZKUi9uS0NEa21tUEw5NGJPVnk4TWNCRXFhSno3NlU5NmpHRFFkakhFUThr?=
 =?utf-8?B?MHlKTU5FRUpkZ2Z4bXVZV3hZRy80cDVYZE5BYmRPenl3ekdGT0JyNEpjcld5?=
 =?utf-8?B?Z3ZuZEpPelRrZDU4bHZFQkVpSzN4dG5jb0dYaHdCQytzWTZaSElYd0hYN0Rz?=
 =?utf-8?B?WnI2cFdVQkZ0S3RTWXU5WU1oMVYzbC9pL0UrR2w1OEtsN3FwUWRqak5OTnla?=
 =?utf-8?B?dkgzYmY3ZkoxQ2VVYnh4ZWZuYUFDbTFqai9xWG4xZzlhNzczR2dUQUp1RmJp?=
 =?utf-8?B?ZDM3Ni9wWGl2eVdnZ0JmaFpuOFRXK1dGbzY2QWxXR2t3cE5Za1pmU3hpNWR1?=
 =?utf-8?B?U2VVN1BmWGxQQncxaEcxMmNxOXVjd3Q2TG9hdEhFeTV4ck9leU9YdEZUOXAz?=
 =?utf-8?B?Q3Fpd1BuNDNYZ0ZtcE5qWHJoMURqR0dsTmtONC9TcXBWQTNPdzZvMk5HZTZN?=
 =?utf-8?B?ZVk2dlZ2clJrdUVIelFEMisyNFdlekI1RVQwYjlrRkR0K0l6U2Rnakx0MHNy?=
 =?utf-8?B?S3RJamNzdVI3WlpDT0F2SGtYOGFJRGhKYmFzeFhmM1dscW5JWnVISHRuOFdK?=
 =?utf-8?B?d2UyZ1FudktBSW5FeU1qeDdRWFBXcC90Z0JjTytHSFBEOWphRWkrNHAxUUVx?=
 =?utf-8?B?Q216dk4rVGl0ZUVaQldJUEpBZ3JUR0Z5d1lzZWM5Q3hWclpWUXhUOG81ajBY?=
 =?utf-8?B?N0FCMnFoam5ubU9DRjAwN0VRSjdkV0pJazYvT3F3d08vZ21uOG9NNXA1VE5y?=
 =?utf-8?B?dXNoa0JGdllJTEhIQmUxd2lHWVNWWmRabm90RXJXcnRnYnl0SitUbnZmQ0Y4?=
 =?utf-8?B?MEJRVHNLM29pUVp1SXppck9lV1V0V3Iwb015ZWQvK2xISUt0Q05RS2tEb0lu?=
 =?utf-8?B?czh3cGRQVVV1OGpBb1N6bDA0b3BGRFhPeDcwTS95eXZVZVZDOHpqUU5aekdE?=
 =?utf-8?B?MWJNeXlpQjdyUkRjc004b3RLVlRtTklOL21sZlRKNHMyNGQwUWt1Q29oem5W?=
 =?utf-8?B?VHV3QTVnaGVWd1U2cVBEYVNSL0NVUThEYWp1VUNDNVFBS2lZSHdhQmtRcnZV?=
 =?utf-8?B?SFducCtHb2Z4YmkwQXRsSXpGOHdxall1VTQrTHRkRnU1ejEyT2xTK3dWVXdt?=
 =?utf-8?B?V3djK1FZTllqM3JiSnZFYVlPNzFyajBxWHZvZEpsaEtJdDdNY1ZJdVBlZjIv?=
 =?utf-8?B?WWVJTlJHNGlOOWFQcGdIYnZqQk5nR25FclNwYmRGRzVzR3dJMlJVcFpveTBr?=
 =?utf-8?B?MmJaNXA5bnZtUU9qVysvd3kySXdJMjhQTTBZYnM5c2NHOHpDMlYyNXZVOTR3?=
 =?utf-8?B?amNFQTIweFBrUGJ6WUUrOVF5aTc4QkpDbTdEcmYzbjlPczBZT0dFMVkralJP?=
 =?utf-8?B?bjlvZDdMRlptTzFmajduUU5ROE5aaElnVGE2cFl2Y3drcXRjc01VWVB2bGZN?=
 =?utf-8?B?RVg5UXcrWmZzejgrSmZVVG8rOVFKQmhPWDQvaHU4ZWFyQmJGcVNkM2lJK0ds?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f670e913-c53a-43b0-495e-08da5e631df8
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 08:48:22.5805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJrsgCryvLQ9+q5lg+21D1sVGSw+7SBMmNGOEZnAcRm60ufKw1qB8oSotetA9RqNCIoAKE04F0eBVxWs7Klv0mO2MbphTNPLQdaZ5WTCFg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1991
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-05_06:2022-06-28,
 2022-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207050036
X-Proofpoint-GUID: xU96nAoQ7dAUfOZKZ-PGtT1uutQgzh2X
X-Proofpoint-ORIG-GUID: xU96nAoQ7dAUfOZKZ-PGtT1uutQgzh2X
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/4/22 15:27, Dr. David Alan Gilbert wrote:
> * Joao Martins (joao.m.martins@oracle.com) wrote:
>> The added enforcing is only relevant in the case of AMD where the
>> range right before the 1TB is restricted and cannot be DMA mapped
>> by the kernel consequently leading to IOMMU INVALID_DEVICE_REQUEST
>> or possibly other kinds of IOMMU events in the AMD IOMMU.
>>
>> Although, there's a case where it may make sense to disable the
>> IOVA relocation/validation when migrating from a
>> non-valid-IOVA-aware qemu to one that supports it.
>>
>> Relocating RAM regions to after the 1Tb hole has consequences for
>> guest ABI because we are changing the memory mapping, so make
>> sure that only new machine enforce but not older ones.
>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> 
> Thanks for keeping the migration compatibility, so for migration:
> 
> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 

Thank you!

