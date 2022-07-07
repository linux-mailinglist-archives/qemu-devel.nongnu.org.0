Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B1756A6C8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 17:19:50 +0200 (CEST)
Received: from localhost ([::1]:52338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9TID-0002l4-SY
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 11:19:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o9TGX-00023E-0k
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:18:05 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o9TGS-0006Ak-0Q
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 11:18:04 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267EnHwY026135;
 Thu, 7 Jul 2022 15:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=A3/4Wc7G6fk0wLw+5ysfQLWJDehR+yIicPMa1Eh4G90=;
 b=0TTLga/vS3W5PnLh4EVexha6JDdQjrwF8tshS3ui6p8laVQ9aCOIiUSvVzfJQCS9hWeJ
 OzM5GQBiLerUeAKR6Zit+nhbtTqW5ouiba1s3V8dMavcWac9pXwrZcS63QPjbnREWGgW
 oiQwvuWDqFENggsaIY99zXzj8i3VX6/SyNP7csLLaZ/lPMAcmKbbFek1X9v36TlgrWHM
 eqHtmBUtMFB73ATGI9c9UxN2kJbfdb0qcq5eplJp3M2bHi33cDfF7lX5ijohAUcvhMI2
 TWE3NWISn9N9v5TqT43vPNPL1NUOflo8R0J4mWPsbUVzGHcJ8UVZG9KMKfG0SBm91zr6 yg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h4ubywcsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jul 2022 15:17:51 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 267FFJI3031170; Thu, 7 Jul 2022 15:17:50 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h4ud5vf72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Jul 2022 15:17:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDMa2PQdR+cNd7dlPx6bvhkDnXsIbq/ub2sF1daqu7Y+EhDB/kqycuCLZZJVDX7JfXfyriGD9uEfGnQMzwkq/7Dheu+kpzO2J9n0Ha/OMwxb9dNGsBKVoiAWwIEE1eZeb/sVKpzHNI0UHXQyhOVJKBuzoIk9/DSu3pcsiIlRCUafJnaq8xtIwKYWHrz8o9CTFnKtBN+ZfSdbXy9qTJ5PsnDUcV2X7GbDhGsveWJfGO8iJqVG8AhtmU/j3c3/c7V4xUBpbxt1wdZdhD7+zklFP73N5KIuTa8EDJqR7epWIyC1d3rB+y7/vWO1IU2F3zSSW91C3LiPSwCnWk/qi0XC3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3/4Wc7G6fk0wLw+5ysfQLWJDehR+yIicPMa1Eh4G90=;
 b=FN7ARfeVoQb9pb4u8akEd36NJZMcO8yy0gpe7P3FAZgLTROlBAt8d0gRgpltvJ8mqZlw3xVwqxeiGz+yNf1DFopDAAy9yzRmEAYp9RooY/kH4W+fPAlHCFYq0a9b4aAS+jBKLZQADA5BCpUanTkrfaGqT6iVT/KIE80fQo4jIa0G2zbNUEjbD6DbtBJ2PENWPBaupSDkBKBLKk0bm+pPwnaOluYE+XaYZ/rdBZZt8VZfiF3oAOlSPG8KtJANPIpgNI2FIvjljCinWLSxnvpUTQI5Do/KHu576TLciSQuLeIwSVtRWZ/+5c2tYpzDHvGtNmeb0nuAy/59XsuW0zfZNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3/4Wc7G6fk0wLw+5ysfQLWJDehR+yIicPMa1Eh4G90=;
 b=FZjT5gJGGF5GyyHf19zJZ1n73nu3plzrFrQM5/ro9LivFKWEuQ99yH3k59tm8WyOegLnh0r3l3vr6iy7w2q2uGHrH4DlhzxPB8bcSaBwl6cNFn7bnoWjtvPEqswI5k5VZx/+q0JhCPM39bquy7dSKrPKuFwGqsEDr+KhqXsXKFs=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SN6PR10MB2813.namprd10.prod.outlook.com (2603:10b6:805:cc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Thu, 7 Jul
 2022 15:17:48 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 15:17:48 +0000
Message-ID: <64875b79-f2e0-4477-151d-5c5c9125509c@oracle.com>
Date: Thu, 7 Jul 2022 16:17:27 +0100
Subject: Re: [PATCH v6 05/10] i386/pc: factor out cxl range end to helper
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-6-joao.m.martins@oracle.com>
 <20220707145755.280abc54@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220707145755.280abc54@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 597d636c-1f88-448e-c721-08da602bd9da
X-MS-TrafficTypeDiagnostic: SN6PR10MB2813:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WzcIEBViTyIQ4okEWII0yWJvbYbUDhMIWy8IgP6vAnZD/ReB3OYAwvIeE90M//zpeiXievVTj1S/HTDy8HCo5NUTvbsOFDjr04yBtNzfHPBBQbSs2CwpoYqFed1QI+SOhUCeHzOwDKy+4+ClRSz/fA6pJUOgdSKSS8s8R6OzkqgYe+uEaPsxqirg9VNf9GmB7DZqNMP+tjoy9Z5AXkcugJQJsnjDZ0Yu2ttw44S2P1EzNI/mQ8emOJ/ClIcmEx2fgSSo9yE9oYOS/e17iLmZY9NRvi3CCfCvtPHsT8cHB1nGA2VJq/VvtjWojprkGTgYbiMuv08FI8H/9FEuBZHN/7q+AbTnHKTAjpa/OqRYTuKCNBgTIFCe25T2ezzMEjn0WSiMSbao7B0Nkn7t+w7nTEpWKs56zCuRfI0HMCbRbalg1lWREC30J/F0cE+pbrsuSO6WSQSFqsYJwkjEKlwZLCXZ9z2QFzD9CM4n9ILl2f7mY9KisG57LtsYhmZkXpIklUlhYT4q5dzIUc4z3TC3HDzlqKxYXOPiOxTg6NjiSseqX3l+6zTHQeM30jEdsDdq3KsmYOZVSNJIvB5uGBU/bjw2YTU9pX7Dr4OqnKln9BZQ3MNY40ysEBIYO9z1NgziqbQDzHwdoYut44T/6SuQapdiQf0YMDrhLNqlcd7F3kosSX5Z3Tu5IPSLboWXQE8wZnxLOJ/h57UTqHX2FxvkrPnmGkdzabKMcKK2CWv+KHTv84jpJjMKCsOx/bIX6DnmwtkEaQiPQDfuvyryjScMM6wxtwsrwkMe3+XQSIKz8G3O4kQRZegLspSDTdZCT91t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(39860400002)(346002)(136003)(396003)(7416002)(316002)(38100700002)(6512007)(8936002)(5660300002)(66476007)(86362001)(53546011)(26005)(2616005)(6486002)(6506007)(41300700001)(6666004)(2906002)(31696002)(478600001)(31686004)(36756003)(83380400001)(186003)(6916009)(8676002)(54906003)(66556008)(66946007)(4326008)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjlaUjRLQUkzOTQxTmxFeXl4aVkzUDMvR0hld3I3NFBMdE9TWjQ5KzFLdnYy?=
 =?utf-8?B?bXhXY0xIREt3djdEUzJZaFlPSU1GMDlETU1QWFdTeVFGVGxRd2ZmUEdhUVFX?=
 =?utf-8?B?RzF6SkNoU2NkTHgrS2hoMDdlTDMvbGZvZVZIcUo5MmlDdGN5NXBPQTYwQVVp?=
 =?utf-8?B?UFpvT1pvVGNQOWpWWmlMb1RoV2J4eW1ZK3VUaUdodWpYYkZLeEhtSndpNnBI?=
 =?utf-8?B?Q0twTDJ5TE10VDFVdW5Wc3JJbEcyUjdLdDMzZC9JUkRXZ2xWRHdNcGRlZ0xp?=
 =?utf-8?B?aHFuZjRYZk5wMG1CMmdFeWkvTllleVNWaEg5SE5UL1NyOEFUa3lUby96L3Jt?=
 =?utf-8?B?bE9paDlZL1RUb2RTWFN3SDk0MnpvVWwyMVZLWjAvaE1uT1VJMHQ3RnBmaDlp?=
 =?utf-8?B?aWdUM2hlZlpramphRjNHaVpCWGhDeGw2d0FtTTdxZHNqb3hLZ282c3JLRWhl?=
 =?utf-8?B?V21NTXVpRXRRS3piVHc2OUpnM1drZlBJa0lnSWNLZURoVWZiaVlKRDVpcHBs?=
 =?utf-8?B?ZnEyb0lxeHhLem4rVjVLQ29Tc1Nvc2YxWlM5ak5wSVZmVjZDUFdKb0dJN013?=
 =?utf-8?B?cy9qa1dHSVRXMnNlbkQ2UjZvV1JkRGg4VTZXTUlCanE0eWFXRVA2Q3p4OTJz?=
 =?utf-8?B?eFlScGhyOUw2b0pxQzNsZVRGN3BUOVdBUEkxaUx6dXlXNnNTYWpaZk1SRmtW?=
 =?utf-8?B?OHFsOGxMRlNpWUNaTWRZa3Y3VU92ajRrczZ5aDBaV250ZFRWL2IzTHd4UTBp?=
 =?utf-8?B?VFpzQ3lFTEZlMTRROTl3VWIwczBLemdOd3AvaUpmaTUrWUhwZEczMlZOemxk?=
 =?utf-8?B?Q0tEYk5MSGpDY1d3WjBTQmZYcWRVT2MwWXNSKzB0Zy94ZWhhNU1RbzkyVWR5?=
 =?utf-8?B?YUR2bG5yVVBiU05SM0FQeUp5RTJvdmk3UFhiMGt6cjY3d3JtMC9XMkZxRktk?=
 =?utf-8?B?ZnJ4TzQwcHUvcUZEcW1sbzZWWUI4M0RZdnUzZ3NaK3liS2pmN1VlZFNNQ08z?=
 =?utf-8?B?OU1NOUFHOXEvK3BGRDNGRmM4OWJjQkdOcjhwMDNtamxOR0dwWGpvRllhdkJo?=
 =?utf-8?B?NnhmRjVQbW1sT0o3UkF5blp5RnJYMGZpNEwyUzU1U0dTQjExRzZuUW4zdENp?=
 =?utf-8?B?aWRpODI5aEFqU1ZpWDkwUW9VM0RlV3NLcVI1RHo1ZjNwM1A0WFE2aVVGWHBI?=
 =?utf-8?B?dWhIOFJuSHh6K0dQZG1WL0dhVHlLYW13Z0pMTXU2aHNqbGRXeVNrcUFxZWZW?=
 =?utf-8?B?eE95UW1raUYrS1N0VkJvOEwyS1RHRE1sU2FBaFRmdXJMQ0w1WGtUU2RRanVx?=
 =?utf-8?B?VWVaMmd6ZGpJbVJFQ1hoK0k2RTlkSHdPRlIxVW12Z2h2NXBpZmdJSmVRczFV?=
 =?utf-8?B?Zll4NUx3aVJNTVdpYU5oMGpQOE9TbjlMWHBzdExiZnpubDNVcWdrQXRuajFh?=
 =?utf-8?B?QlJrMTdxU0xZTy9vZzhlR0EwWE5vTHp6dUdyNVNyc2plangyM2s0UmZSWFVJ?=
 =?utf-8?B?c0w4YXloNDM0Mml5eHY2WEoyOVNQMm5qNVdNcU44SmxXcDRZMnF1WUY4c0xI?=
 =?utf-8?B?WURiYytsOW15Y05MOWgwMGVLTGY1czlUVUQ2VTVBdm5DVUNQZUVqNUh3K1dW?=
 =?utf-8?B?ZGtXSG5HN082ZVh6djFKRDBZUGI4WWpIaTNpakN0Q0Y3ZFlKS2g5dEJWb0Z3?=
 =?utf-8?B?ZFFBMjlySHU4N25HMHZ6djZYT1RMb04vM0dLSHY4VG8zSEdNVG9LL1dObDRM?=
 =?utf-8?B?UktpZUNSL1c5bW44SFpHMTR3NFUrUDNnZTI3REJXdHJLVHhqYThsWGdNNXk3?=
 =?utf-8?B?alQ5MkpUTnBOVFZhQ1dWVEsvdmhFWE1Ta2dzWWtuclZpNmRWanRRdWZzUXp3?=
 =?utf-8?B?L2FPYnZ4RVBuQ294TUVzTEh5eVg3Q1ozYTkvSjRYTEtYaTBnT1ZyYWJoSE42?=
 =?utf-8?B?OXlqbGlRTUJ5SXlKSUR1NHNoMHNKdHJXbWdSczVvWnpnNWdxR3h0NDg1ZmVw?=
 =?utf-8?B?ckVHajJlKzlkTm5ENkdpN3E0dnAvUWlQN2VpRWhJeGhrSitxNW03NmtlWExW?=
 =?utf-8?B?OVMvdEYvV1BlQUw5OFZaOGJLZUE2TDdMVmd4QkxndWk5TmlzL0dkaE9QSEg1?=
 =?utf-8?B?TUc0RnhZOHBuNzVtQzRadUVHN1BDK0IwU0R3N1FkMzhvRU1qZU8zVVBFcnFK?=
 =?utf-8?B?aFE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 597d636c-1f88-448e-c721-08da602bd9da
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 15:17:48.4481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cy458tebUTh8jP2yLqO54k4idK/9Q1ox9eLi+ILk+w7Ra8zyeSQb2l6XK38oZFbaA20baxE52ygcJ9azF4wGqYVhIxN0cBEqWxvwBLKQp/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2813
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-07_12:2022-06-28,
 2022-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=994 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207070061
X-Proofpoint-ORIG-GUID: M6RBsPtXgJjOzPU8ifqM8NS8Brsv_31o
X-Proofpoint-GUID: M6RBsPtXgJjOzPU8ifqM8NS8Brsv_31o
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 7/7/22 13:57, Igor Mammedov wrote:
> On Fri,  1 Jul 2022 17:10:09 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> Move calculation of CXL memory region end to separate helper in
>> preparation to allow pc_pci_hole64_start() to be called before
>> any mrs are initialized.
> s/mrs/memory regions/
> 
Will fix.

> 
> 
>>
>> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/pc.c | 31 +++++++++++++++++++++----------
>>  1 file changed, 21 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 6c7c49ca5a32..0abbf81841a9 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -825,6 +825,25 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
>>      return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>>  }
>>  
>> +static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>> +{
>> +    uint64_t start = 0;
>> +
>> +    if (pcms->cxl_devices_state.host_mr.addr) {
>> +        start = pcms->cxl_devices_state.host_mr.addr +
>> +            memory_region_size(&pcms->cxl_devices_state.host_mr);
>> +        if (pcms->cxl_devices_state.fixed_windows) {
>> +            GList *it;
>> +            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
>> +                CXLFixedWindow *fw = it->data;
>> +                start = fw->mr.addr + memory_region_size(&fw->mr);
>> +            }
> 
> this block deals with 'initialized' memory regions,
> so claim 'before any mrs are initialized' in commit message is
> confusing at least or outright wrong.
> 

But the commit message is pretty clear on its purpose.

"Move calculation of CXL memory region end to separate helper"

Then it justifies why we are adding.. that is in preparation
for a patch that will come after. I am not implying at all
that I am dealing with unitiliazed MRs in this patch.

Anyhow, I can drop the part after 'in preparation' or just drop the
mention to unitialized MRs if confuses folks.

>> +        }
>> +    }
>> +
>> +    return start;
>> +}
>> +
>>  void pc_memory_init(PCMachineState *pcms,
>>                      MemoryRegion *system_memory,
>>                      MemoryRegion *rom_memory,
>> @@ -1022,16 +1041,8 @@ uint64_t pc_pci_hole64_start(void)
>>      MachineState *ms = MACHINE(pcms);
>>      uint64_t hole64_start = 0;
>>  
>> -    if (pcms->cxl_devices_state.host_mr.addr) {
>> -        hole64_start = pcms->cxl_devices_state.host_mr.addr +
>> -            memory_region_size(&pcms->cxl_devices_state.host_mr);
>> -        if (pcms->cxl_devices_state.fixed_windows) {
>> -            GList *it;
>> -            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
>> -                CXLFixedWindow *fw = it->data;
>> -                hole64_start = fw->mr.addr + memory_region_size(&fw->mr);
>> -            }
>> -        }
>> +    if (pcms->cxl_devices_state.is_enabled) {
>> +        hole64_start = pc_get_cxl_range_end(pcms);
>>      } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
>>          hole64_start = ms->device_memory->base;
>>          if (!pcmc->broken_reserved_end) {
> 

