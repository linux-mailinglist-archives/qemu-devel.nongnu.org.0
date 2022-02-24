Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1F44C30FD
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 17:09:17 +0100 (CET)
Received: from localhost ([::1]:53894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNGg8-0003bI-Bo
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 11:09:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNGed-0002t5-Uz
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:07:43 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:16222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNGeZ-0003qY-2o
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 11:07:43 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21OFWbMM007287; 
 Thu, 24 Feb 2022 16:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=5iWRCnUpNTU2BbF6UwvkGHY0dVdkuykEIsj+XI2Hms0=;
 b=Gwa930fHDqkat1smW32MvPS5F1f0OKre0w/Npi6PR4cujBMoZJtIwljvaW98MiISGurm
 ltUgae+zIqFTbkwVcaZUZaAb/BWliqgufoQ5SO14sJMReZ8IQLGYjE+IjvWRLZTixQD4
 29S5igV4MFuHtKoFvIY8rvOzToxmlXzr892I5Kq3BZ6L+AvG94skjw4AHSUFGWumYaQ/
 it6GeYSv1Vrt405PYv8fwxfLw3EW0UAKCNzQ3LeN/rwrrtYS0Zt9jggZqEUCa+Yh6TdU
 r+vWuLjJukcaAT3J2wqvRgDHO+O0guAHx7KPAUKatplUcvGqBieQ6wWh1dVf+NZsSgWh 6g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ectsx7ufa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 16:07:34 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21OG5gus183748;
 Thu, 24 Feb 2022 16:07:33 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2046.outbound.protection.outlook.com [104.47.56.46])
 by userp3030.oracle.com with ESMTP id 3eannxp6bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 16:07:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYKGa9EmIjDVNdXswyXw2yEIKbBgB8PHIE32zD+jwJPVKTl5V90audEauGrvEfLmTzUSX5wI914KSgbeZrHm4m+7qlCGJTD1muyrA+PkG0+IrFkRcIiUuROjj2r5KxHpqC1fPapbhTw9jdO1xpGV30df5doDttYBri0wjc/OQ2//9Xu7Xx9Al8SAgXrTJmcB1KCHqjoxXz3qcZyLICvOTqjWn3w4DUNHA2aKKZn/ezkN5EDZhPs+KzeVBHrvhxv2C62F082fwSfONsKw6NgcdiL8m15BrC14mG0fYzCLdcS3Mm16wsAUFCNrHbSI6fkenGA9pRvfAv8jYFvcHQ/Ndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iWRCnUpNTU2BbF6UwvkGHY0dVdkuykEIsj+XI2Hms0=;
 b=SuKIUoRcQdPpR2PuIgfc5x0stgkUCjaMhc6yKXfNzdwlSE6Ie7dx0/PfTuyEwyK0AMQTznMcqOq46tYr0CmDwU4SopCFY5INJ+NslM524erCp3bE0Yp9tW0sSXOK4RI+HGnUlfwTYuuFPxNnwXiDkSeG7viU4QVrfJJ3MOgbGtNi4+z30CRoMV5PEMWato2jZK6FRjRmY1orrJ6+frYZ+ZcOdLLwLNZmE1+vksIg3Nzgad6KnkxcngcFe6RN/5nnaXdm7RXvjI8g6dUrm0X231xfeEkhURXjTAJ+QGCXmfQAp/Kd6jrLKAg+tlxWlC7wCUQPr+ZIbcA1Flad4rirgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iWRCnUpNTU2BbF6UwvkGHY0dVdkuykEIsj+XI2Hms0=;
 b=pvS211u7nvHU97WDyueXA5/yIkbX0jfSnArJxwKYGZPnRs0yrUQUQSs5xxf//yhafRYuVS+4obe5K+IZUaSkWzZ3bGG6GEUgnxiJTw1uQTOQ8pOe18hLIHlTCTYeyV0usRzIShiSqQtAg3VIF+jjKII3M458Z9ZihP8fl87d8h4=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BYAPR10MB3350.namprd10.prod.outlook.com (2603:10b6:a03:152::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Thu, 24 Feb
 2022 16:07:30 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 16:07:30 +0000
Message-ID: <c28ade30-fbea-4d3a-3b11-356c02abaabb@oracle.com>
Date: Thu, 24 Feb 2022 16:07:22 +0000
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220223184455.9057-1-joao.m.martins@oracle.com>
 <20220223184455.9057-5-joao.m.martins@oracle.com>
 <20220223161744-mutt-send-email-mst@kernel.org>
 <5fee0e05-e4d1-712b-9ad1-f009aba431ea@oracle.com>
In-Reply-To: <5fee0e05-e4d1-712b-9ad1-f009aba431ea@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0085.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::18) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abc5f8c3-cafe-4dbb-f74a-08d9f7afc279
X-MS-TrafficTypeDiagnostic: BYAPR10MB3350:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB3350D7A33B8C1EC5BD1370FDBB3D9@BYAPR10MB3350.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SMkQJ0u/9XM/66DBWQ0qI3eild9FpYT54bf6yDUu9ITSFxGc93WICH3zOjhJgFpOOWnvN9e9zFTwwDvPpCq2EHcWJViZM+1dEe4ChASmcuH12IyYnzMpHya+O+cuTVFZrgwONtp7yurHx4H6DqQO+UHNk6lHPdv9k2QR6mci0/WnR6a6WeC0OhsUrEj2eItU3iAk06SpBG8DJ6XtIoeTYFfHVO6XfYbtOucyuMk09/VYWcn67I3heno+HiWt/cgWKhElGZC/g0LZfaH1K2juGua/0WbTlAKF+sqUuP3s6k7AuELGMG86YDgf4dxVcyIP7xRKn+ZrfQMS5LJGpQUuB5iMJif8BX/uy+Gs5xdXFgAGFGD5UHhRl3yZ2XgMX5nNbP1Bh+xwwL+faFTQDQ4EP+gUZxqi2PefqIsjO49T5mXRzSccPrQ/giGk/38mP+mczJyPKvcjqxnR7//u6ENn6MjrRDzAstvwi/F/JgFPmP12PkqzdoVpIz5OsMRqLIUhTDz2KTrNwYsmUGc0pn8G6B3/g+/ZHHCQWvwpRXWJN6n/laqRoHFilwvEhW7vJ/OBFCAyWJjpi7a/s0XncZaFYPs9PILaQnaXfRK2mTviXy4GMKzDWi3Cn0UrObJivhkfoQUro01iVCmBFq9q2g+36ePUYkkYBsJRJPij1RAiJhoInccQkyybEFqNOLf2J7gWcxeG2hCJCj8kLL2rZ28XfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(66476007)(316002)(508600001)(54906003)(6916009)(26005)(38100700002)(4326008)(66556008)(8676002)(66946007)(6486002)(2616005)(31696002)(83380400001)(6512007)(31686004)(186003)(53546011)(8936002)(7416002)(86362001)(5660300002)(6506007)(2906002)(6666004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUxRUlJsblJOdDR6Tk9PRjJ5TURZTUFMK0dNQnpSSlQrWC9NMUFxcXJTTG5V?=
 =?utf-8?B?R2hrVHhLWll3d1VXYWhPQ2ZiRVRQc05zOXIzZ0VUSU1TaUt4V3g4Rk9nQ25G?=
 =?utf-8?B?bG42Y05WMVRiWUxWWU5tcFB1cnhzdkRia2ZxSStLQi9GMzVCbEVhbjRMUmdV?=
 =?utf-8?B?Uzd4czcrc3grQXloL0xKK2c3S0Q5R2pVZmdRMko0b2JKcW5LV0pqdFBLNnFX?=
 =?utf-8?B?U20rU1RRc3ZNcmhNekxkNVR4MGNnOTltcUd2UEgwQWhqQVZsUmFoblZlVC9W?=
 =?utf-8?B?WXBCWVNxbkxzNUplUHgzdlV2d0I0RlluM1RVUmhMajB4WmZmRGJPSStwbGJH?=
 =?utf-8?B?R0ppclZFS0dDK1FxL25pR3U0Ymp1WmtYeUJ2ZGZLWk1kcWMrblBxbS9ic0JC?=
 =?utf-8?B?UEJLZS82cGl1WVJ6eDRYQjIyL3FjTi94aDBLdXIvZDdBcGlDVnBUcUs4Z3J1?=
 =?utf-8?B?ZVJYdnB1UFJuZG1GcEMvVjBkV0hCWlYrNDBWK0EzOFZ4L28veVZVSUVyUFVq?=
 =?utf-8?B?WFVZeTJaV3Zra1ZmRmtyN0psYUJxcXl2MURKeW00cytQMDFaNmNZdGNhTVFR?=
 =?utf-8?B?SE54L1B1WWVVcmFhK2FPUjJWL0RwWS9IUElCVG1SQUFBbE52Mi9nQStuYmp0?=
 =?utf-8?B?S2I3Q0RPVnUvUW00L1FNTm1BQXIzRkpYWlR5aVBJUTNyZDBXQ1FMbHZ0U0Z4?=
 =?utf-8?B?d2ViZTN1a1F0dWtiM3ZSOGkrdnZzZmF3QnJrd3FEOHppaFZRalEzVnhYclYr?=
 =?utf-8?B?V01JN3VYR3JCaXE2QktVajJ5ekZHd3hWL01CRm11dUE5Vk9kc01kcjRXb21n?=
 =?utf-8?B?MTdSaEg4bTBKWGNpWlNrc09uVTBEcWduUGpFUXlzUzR3RFZlaS9nV25DYW9t?=
 =?utf-8?B?MUx2NEN3TFpTaGRFcys1UWpyeENVeTFoaDhJT2ZLTHowMTZpWURxK0xMT0xD?=
 =?utf-8?B?UkI0UkM4cjl3dkV4ZExGV1JEb0lCYWU3WUN6KzZRUFdJRExqL3BrRU5RQ2FJ?=
 =?utf-8?B?U2I0aFM1MFJzWUpJMDNtQmZsSW1VZTZNY1NtMWFQRmtBaG13bzc4N3g3Wlk4?=
 =?utf-8?B?L1RBSVlQTkd6dEd3QmJ3Nm9QVjJmWW4zKzgxdnZsU0Q0c1RCRlc2am9EMVJP?=
 =?utf-8?B?eEI4c3FHOEM0RTdtZEx5SUcwMXZqRTc2dWdTaWU0bzhOU1BYN01oQVRZVkxM?=
 =?utf-8?B?ajlEd08zWnBLL001c01SU0hMQ3MyVEVnTXdLRjY5K0YvZWZoK3dwRU1tenFS?=
 =?utf-8?B?bG5vcFE5c0RrNGZJN2pDM3dCWURIRnM4dnJGa20xRFpUejl0VU9iM0p4OVlt?=
 =?utf-8?B?ZW4xSkMxTDBXMTJ3RWJhTVc2VHB4QXhnTWFxcGQ0TEpKZmVFUnk0b0p6VzZ0?=
 =?utf-8?B?SGVlTVJlUEpBTFNPWGgxUHhCYS84bm9Tck5vUUljY3VxcWI4OG9CUWZaZUw0?=
 =?utf-8?B?WVY0MGJPQ0lsYkZaRk9wS2xRZEpJNFZOSXlra0kvVGpxZDh5bVAycG5GVEJY?=
 =?utf-8?B?UnkwaXRXUnN4dFJCa2lnYXJQQ1dVRkN4VFIvQU41VUNzNzdxcDFadzVwK1ln?=
 =?utf-8?B?d25nUjAzbXU0UWwrSkFCRUhrZUVpK3h6RDZVVFpMNnptbGJneW1EaERJMDVP?=
 =?utf-8?B?QjhCcnB0Sk5XUUg5Nk5DVDFCckpRVmNNUldEenZQcEt3aHZBUXhieVZGMnpU?=
 =?utf-8?B?N1JmaHRjYmFzMFNKZXRFT2xsN0kxVm5lSE41SUd0ZlhRUkFvZVNyN2tWVWhn?=
 =?utf-8?B?aXR6OVk5UTV5cllkMGVnR0lERDk3K2JFT29wdUNqd1huVVo4aVp4S2VnYUhi?=
 =?utf-8?B?QTZCdUVOY056OVBZRDAzN2FSOCtZSjdyS2srT0xrbDhwOHB4cXI5WFNudTNh?=
 =?utf-8?B?eGxzK2xvMkhLTURGMi9LUElOWEI2K1VBQkdWYkNPc2dBVGdjYm53bVRLMkd5?=
 =?utf-8?B?dUgxbkdoaHkvdXM1alQxRmgybC83bmdjUDBqbjIxWU9FcWY2TkJiSDJWTTdP?=
 =?utf-8?B?Vzh0czEwWlBCdVFOOWRudTJYRnhwTlY5Ynhoci82QUdxRGtvVEhmYjFyeHd6?=
 =?utf-8?B?QnZZR0hnbkhuV3BvRjFkWVg1SlVLV3JTdDF6aHZFQ1Rnd0hHemZrNXNLLzVG?=
 =?utf-8?B?U285ajBvUFFoRlJ1NkJIV0pMRmhjZzJtS1AydnpZSnRFUi9pdUtQY0h4eXp3?=
 =?utf-8?B?NFg1YjNEalNWcVovdzBPRERlR1ZOQjVqV2Q4N3NiaDRGREhsMXl0eUFGN09i?=
 =?utf-8?Q?NLptMo2vZx3bPUmGpS8oiGVfEY5XtecFjq1aM884Zg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abc5f8c3-cafe-4dbb-f74a-08d9f7afc279
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 16:07:30.6870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1cLSwGyiBxfpXkiVDy2NCWEpbsjantnvsWw88w6ipHJyilWMQ3xDTZqv3qf8rUI+VC8D6u+qamGRtvRQxLBWI0MGhOb+MoAEFqaSEuhUDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3350
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10268
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202240095
X-Proofpoint-ORIG-GUID: 15DEDXBWl4Xe3KEnkvtvbdfNalrX4YVy
X-Proofpoint-GUID: 15DEDXBWl4Xe3KEnkvtvbdfNalrX4YVy
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/22 23:35, Joao Martins wrote:
> On 2/23/22 21:22, Michael S. Tsirkin wrote:
>>> +static void x86_update_above_4g_mem_start(PCMachineState *pcms,
>>> +                                          uint64_t pci_hole64_size)
>>> +{
>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>> +    uint32_t eax, vendor[3];
>>> +
>>> +    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>>> +    if (!IS_AMD_VENDOR(vendor)) {
>>> +        return;
>>> +    }
>>
>> Wait a sec, should this actually be tying things to the host CPU ID?
>> It's really about what we present to the guest though,
>> isn't it?
> 
> It was the easier catch all to use cpuid without going into
> Linux UAPI specifics. But it doesn't have to tie in there, it is only
> for systems with an IOMMU present.
> 
>> Also, can't we tie this to whether the AMD IOMMU is present?
>>
> I think so, I can add that. Something like a amd_iommu_exists() helper
> in util/vfio-helpers.c which checks if there's any sysfs child entries
> that start with ivhd in /sys/class/iommu/. Given that this HT region is
> hardcoded in iommu reserved regions since >=4.11 (to latest) I don't think it's
> even worth checking the range exists in:
> 
> 	/sys/kernel/iommu_groups/0/reserved_regions
> 
> (Also that sysfs ABI is >= 4.11 only)

Here's what I have staged in local tree, to address your comment.

Naturally the first chunk is what's affected by this patch the rest is a
precedessor patch to introduce qemu_amd_iommu_is_present(). Seems to pass
all the tests and what not.

I am not entirely sure this is the right place to put such a helper, open
to suggestions. wrt to the naming of the helper, I tried to follow the rest
of the file's style.

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index a9be5d33a291..2ea4430d5dcc 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -868,10 +868,8 @@ static void x86_update_above_4g_mem_start(PCMachineState *pcms,
                                           uint64_t pci_hole64_size)
 {
     X86MachineState *x86ms = X86_MACHINE(pcms);
-    uint32_t eax, vendor[3];

-    host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
-    if (!IS_AMD_VENDOR(vendor)) {
+    if (!qemu_amd_iommu_is_present()) {
         return;
     }

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 7bcce3bceb0f..eb4ea071ecec 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -637,6 +637,15 @@ char *qemu_get_host_name(Error **errp);
  */
 size_t qemu_get_host_physmem(void);

+/**
+ * qemu_amd_iommu_is_present:
+ *
+ * Operating system agnostic way of querying if an AMD IOMMU
+ * is present.
+ *
+ */
+bool qemu_amd_iommu_is_present(void);
+
 /*
  * Toggle write/execute on the pages marked MAP_JIT
  * for the current thread.
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index f2be7321c59f..54cef21217c4 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -982,3 +982,32 @@ size_t qemu_get_host_physmem(void)
 #endif
     return 0;
 }
+
+bool qemu_amd_iommu_is_present(void)
+{
+    bool found = false;
+#ifdef CONFIG_LINUX
+    struct dirent *entry;
+    char *path;
+    DIR *dir;
+
+    path = g_strdup_printf("/sys/class/iommu");
+    dir = opendir(path);
+    if (!dir) {
+        g_free(path);
+        return found;
+    }
+
+    do {
+            entry = readdir(dir);
+            if (entry && !strncmp(entry->d_name, "ivhd", 4)) {
+                found = true;
+                break;
+            }
+    } while (entry);
+
+    g_free(path);
+    closedir(dir);
+#endif
+    return found;
+}
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index af559ef3398d..c08826e7e19b 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -652,3 +652,8 @@ size_t qemu_get_host_physmem(void)
     }
     return 0;
 }
+
+bool qemu_amd_iommu_is_present(void)
+{
+    return false;
+}

