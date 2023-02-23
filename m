Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE286A1260
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:55:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJYI-0005WB-5J; Thu, 23 Feb 2023 16:54:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pVJY9-0005Vp-4v
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:54:49 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pVJY3-0000Lg-Ud
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:54:46 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NGwi29003630; Thu, 23 Feb 2023 21:54:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=b+almVdraf2a05finPGndMyQ+yD2Uud6xAvKxSGFHoo=;
 b=rx7H2HGWJBqmMovAoJCCYlGm2e5KxoSkE4l/sIJ8yoqemd9loH4kGp4poGGqOlEhbBW+
 BlVtACHvGQE7iTksc90Unp+//VBn0W+YmY64uFRtXU6rb64A8Fb9sO79KN+387D4/qHp
 S6RQ8G0NUjJVpwDrFlKy9O7FkAyTOXqvGTlqyjy9O72pJBZqcol+k5XX7K61DXN5EFys
 CR3id6DQn9GX0dQPY0GqhjS6qP1owB7yam0pKnMkFqG728ZQmdia9hNAiIRlmPStrUCD
 wusQ3MR+R5KoP+9wWMtwBnqZ+YDBRZFDjrb9yYil7UADpz8OwQ270l3Rx4qaCN7uh+zD qQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntn3durnx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 21:54:40 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31NK9GVx032045; Thu, 23 Feb 2023 21:54:39 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn48rqbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 21:54:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guYGBpkyTgTR2BJC5ySFgKGQFa/trel8d3/sLSf7N+mh0w2qSHDWu/9e0hCuIVAlMDTihxEmEQbazpq4RkGfLgTEeRvB6hgCjofA9Dl0XBXHUkjR5f4cmGSCKoUyD+k5OZAf8r1IeewEdzLNJ1dM+ntXc4uXUxlySxdFZIEhKBdyw6GdYV26X2imJS+TtCjGExF/lmqRx6+9YUpIBz805lP1S7/VxCOg9Jmdfry1+K7tHvKQVyDI5Ugsoyfmrr7e19c8OEIiwfR1hUHJDCRs4vsSHnF8jSccTHiZNVCzIFwMtoaqkszS+oNx+K2S9qNeO0lWCbMt8aUJqmyZQ7rX/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+almVdraf2a05finPGndMyQ+yD2Uud6xAvKxSGFHoo=;
 b=Kyff/KYRK0KEKBFbaU0q+/d8BmZQm6gooo61e4JaIScgouqMBuYYQzv+pZQVXXJl3gVMnIEhoBERAJJ6d152AVJFTQQxRk2nZazQBiNKzCUm/B1MASjnQT55PY2GDwdi34YRq8uKCecZx/N6FmFEzhJKprGI5xLrUmSToa4uCZiKp3F/wQtXqTBDOqYbBFuObTkwNRVLPmMaZGFHL1cj3Tm6/HIEsuXjnGOMRgHIzD/CaEei7iCPPe9sdoSP1TkRjEaweGoFL/nhkGA2/ZqwdMOPCzY2iUqS7i+W7QCG2wIJ0+mrSp8y1njRs9KIJQG2rxGFVuyKwv64zEYxIE81Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+almVdraf2a05finPGndMyQ+yD2Uud6xAvKxSGFHoo=;
 b=EJoRm7r1/F5QWBzd1S2Tx0YqGdCANv4fBpIof81/gRhZTXMgJCkVJxG5YbOlbhv5wSPKuYvY0hgJ4WqrA/pCblHTGkpT1GkHuap2UuokShIepkYZQqVRvoXaQ5neGSxPXK8MKW5ulPT48r5/AGGg6PrBRCSNANm1OkK2rxiOH2s=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SA2PR10MB4444.namprd10.prod.outlook.com (2603:10b6:806:11f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.10; Thu, 23 Feb
 2023 21:54:37 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 21:54:37 +0000
Message-ID: <f67b3b1e-81ef-4ecc-ac48-a8e266373972@oracle.com>
Date: Thu, 23 Feb 2023 21:54:14 +0000
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
X-ClientProxiedBy: SG2PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:3:18::35) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|SA2PR10MB4444:EE_
X-MS-Office365-Filtering-Correlation-Id: 86cedbdb-beb9-4179-c30b-08db15e88e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XE18kCHmgFtmaK5j8QVocd3Zas2VnL3UNThT4zdPaq6V5Y4o2y+KQVxViEE0LBlMTO/Xg1DL9j2es9almQQHpx5d10xxoHgBc1pcSoRK6JirN2B9mhl20KjRWPPFg5G0pG+Sl48Q6tOGwX6JgzMS73RRg3CCNJLeBHNm1seLXMF5hPvbkJp86zM44r8qq8mnB8GduM54MLgowv6R0BI6Usgo/UBxkfWABqwAbSkcjiyghXAbis63bv210b7M2QKEk/5jTvxmpTy8Y0RxTqy3JoY2HTDhb0EcAQKKS1UxGIjMosvY9MkX81lOn5tQoHozCOoUxppXJOiAN0ZdOqIJtyAGmQ++PMFCLnVC+6RQO8hjzaf2/rv+D8jXV5ymPHYaTukse8K943V0A8K7bDjy13Z8jfVWM0qDkXGkmPgPR73OzX5T2HqRvvMrJs9aZMHg50/Q1leVEKaPe09+/uns0grSN9aCOceZ1X/Tao70+YnGZtMAupGG+4hAmAOSPmMWwnb+nz//r4VnWrjuyRUOX9jfte/pIUhIP6dVpd4bwbYACY353pIEHzoEZ8izBMAfMTKLnf86W0wBkJxYg9fOg8N06+e87n+Wn7gsR6CZBB8mK1hrM+okw4Dyhp1xmQt27mXI/K15zfWWwvzHyENZIIIMuipaaoRtxZ11wlWmk51hNJZDBer7zbny9JrUzlsgcbSJbO7pkyaDo9L7/Y41RA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(66899018)(5660300002)(7416002)(2906002)(86362001)(31696002)(38100700002)(31686004)(6486002)(6512007)(478600001)(53546011)(36756003)(26005)(186003)(66946007)(316002)(66476007)(41300700001)(8676002)(4326008)(2616005)(6506007)(6666004)(6916009)(66556008)(54906003)(83380400001)(8936002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHM4ZTdSNWV2ckd5cDJkdmVOVkQwZkFsTVRFaG92RU9FT2IxZDVDWkpZSmtm?=
 =?utf-8?B?WG8wVmwrZkRjOVlGNFN2V2pPNG5JRjRGT050d2w5Zks1NUMrZmtMajc3Kzlq?=
 =?utf-8?B?RW5JNEhWUE53ZG5tRDBMR2FNaFU2MDJXTjViMTZ0cGsrMzJqWVBBWktuRjVx?=
 =?utf-8?B?dzE1K1JQOUt5aU5ldnd3NGdhN2RrK1I1S0xOR1ExTzZBbWlNWHIrcmdPKzk1?=
 =?utf-8?B?YjRZTDBpdGhMTmlPZm5qYjcyaXVtYjBZays0d2hlYlp3aUxlM3NFbFgzWnNZ?=
 =?utf-8?B?enBnbkR0K2V0M3dpRlA4VXlxTXV3dG9xT2kySTdDRllBOTdSQnQvYkxISWpt?=
 =?utf-8?B?QTRBN09RUW1qUkpmdFgyQ0dpOXFnRU9GcCtOb2NwRHdJSzJUNVgyelV2eXg5?=
 =?utf-8?B?Y0s0emNOZlR5bjBpaFJRSzFjSHZ4bGdiOWsyRUZBdHU1cjRRRTlUdHdObkZU?=
 =?utf-8?B?WUMyMUR4a1NCYmNYQ0QzR1NhYkZZQTdndXI0YXhhRDZveDcydmhmYnl5cTdp?=
 =?utf-8?B?NW5WY2RoRGhHRytySTNsSGk3SzJST3ZkSjdCL0hNWHhpNGNZY2w1M09YVi8x?=
 =?utf-8?B?MlpOY2ZEREZzc2RrOHhYeHlzamViNDFyYitUSmtLa2lma0d0cXBMZTNrRWtn?=
 =?utf-8?B?MXgxNW9Qbkx3N0tCYTZFY0ZlNEtTcDRhSzI4VHNCSllkWjRoL2cvQVh1YlVF?=
 =?utf-8?B?c0ZiNHJFdExMa3BoNHNGTThPRlNxNStkaDNaS1BpTjVkc0FEaDk0NkVQRGhy?=
 =?utf-8?B?LzJBRmY5YkNEY1MydkZEd3ZoZjYvUGwwQ3dGSGZmRmZQUVN0bTdCVitIOTdj?=
 =?utf-8?B?aFNvQVNMMENUQXNDN2dOUkl3R1E3R3RiQUV4MkJuZS9MOThDR3hlSlViaHhY?=
 =?utf-8?B?SC9XeGFndVN6YUNxaXZrc0VWS1ZabGczK2tFelpNZnoyTS9PVDJIUURYY1dx?=
 =?utf-8?B?dE44UVoxYVVmVTQ0M0NzMVdwdlBzd1JWNk5KS1NZeTRpLytXQ1A0NUVSRmZX?=
 =?utf-8?B?QXZ0NjRkWVY5emoxSlk4dHQvckc3NktwYk5HK2NnUXRCeE5DeWR1NlpIbEV0?=
 =?utf-8?B?MjZPM3YrRHlTZW1CdGsvOVpvbVNBMmh2Yjh1R1RtdmJwbFRxY1A5MTZsb0Q1?=
 =?utf-8?B?M200R3pDdkxUT0M0bWRWS3dsQ0ordmRFSWNlcW1jaHpCUFpxU2ZMeGx6RExX?=
 =?utf-8?B?dmdQUjNKTisvQ0ZQWkNzeHNSeUdEanovaFNqWVRNYmg3eGh0bUVrTUkyRk4y?=
 =?utf-8?B?VGYrMlhwNGZFeHlQTEdJeDlCTEFUK0x2TkZ2RkVYVDFZTTBVSm1INVJpT2lU?=
 =?utf-8?B?SWQ1aG5pMGZzRWhFa2tYRHBvWWZNSStKZDFYdGcxQzVORGU3aEVTK2gvR0N6?=
 =?utf-8?B?VFR6OGJVMXNmcXVPbkt0d3lNV1doMStoTGZwVmJGTlJ2RWh2OHAvdjNwaHps?=
 =?utf-8?B?WkhXNzhwci96MFhnVEdGdndBa0UrMTdRTGQ1SWFtRWRkUGNES3FzZDYxVW5r?=
 =?utf-8?B?S290YnU2d2pyTXd4UEVLd05DNEc4Tk5FQ1k0dDNPWWlxZjBGbFVPeE42UUlO?=
 =?utf-8?B?SXEwc29POVhYamJJbitTSzFDMjNKVTA4Y1Y0clgyZnk3SUpsOVRHb1NNRnRH?=
 =?utf-8?B?blBBdDUzVHJmSUI2Q2xHVUxkZi9IWmRCSnl2ZXRPZnJkREczTU84VFFiclJp?=
 =?utf-8?B?T2dTczQ4T1dJUURkVEErVUNvUWpCMUdvVEYrTkc2RlFNVWowSmx3NG5MSnoz?=
 =?utf-8?B?Qk90N0tZUG4wZHNjcjBKQ0kxRkNQU29EaDNMQmZ5dkpsaE5XeGQ0bFBRV0po?=
 =?utf-8?B?L01QWGpCcW12L1FpOWlQNmFSMkRadk40eEZIUm8wVngzOWlxTlRXN01vMG1Z?=
 =?utf-8?B?bzZncDhPWXFnV1QyWU4yS2NPaFNpUnE5NDFRaThkYjRORTR4ZTM5S1BLUTRv?=
 =?utf-8?B?OXhodmI0bDU2Q0k0WkJ1SWtzYUZXMS9wcGx0Q3pFdDl0RkJBNEtlVTc4UmNK?=
 =?utf-8?B?YThhbUtqSmxpWXlhcy9GRk1Sc2ZCWG1BdHMrT2tYd3pjN1QwT29aUzdnOVpX?=
 =?utf-8?B?cjVLd2h6S0NZeDE0dWRxUk81U2NsbkJqQ2JBNUJ6Z2V1cWhscWI3OENXZ1kx?=
 =?utf-8?B?UzVmZ0FCTHVEdyszUHRmeEZ2dXhBbUc5SnkrN0cxdklqVVBSbys1bmJsbGxF?=
 =?utf-8?B?ZGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Uim83p1JDhc8ol/WWw5p7tnAiX4rcOnn4NAXmfsBKc3lmvt/ZCg8SkprdeIcEJ2yZzeSE3yrjcRSay7GKlE5AgOsmNnCrCPH7l/nKYQlh+FCBv2vFd/V6bn41tRMDd9U+/za55Ik7YF+ARxftu+FH6Zx6AaKGHXOM7RnYgQI0rMDxEGZxzzbQZyBv1T2IyEZef4RRUlEv1vz8fhgPdTtzIwjQeRJA3aqFjl7VMx/4CGwl21zZX91hFkLvF3YoQFnB91vWxl2Usob5Z6yKJwInaLWlHbx37aCf+bNN4wxIsLkVXF5+Sl0ECa8YmOypOjjhD/fWF1KKHVcjC3jxgvTLtNjnrdm0CKAwc2ePxQ3y/WHjKszs9C1QfK+cXLQ8JxZ0Keq2XUnN4tfR8ziGYW1zfszaQ/Jhkr4XW9nWmlroUwshRjVTF3B+pvGuPt+XO6tTKFMi94qsajTxXbX5SU652VPnfd4kWt4F0JJOOqR4uqyccRpJ7NCYWHjHcJAUprlEpeLULliBj65Z1i1VaXin+Dg3/KB/qZuEqQ5iCs/TqbSsg99aHVO8ZWtcdl5gcFaCP6Jbe1A722MSA1bgH2wfEW3hAiluA5dSrTuvaIJC41lS6TdRHkL0KBoIdRtlEKwSlPDqyBY7Hq2GagKq6J235SpOvuRnwBKvvCCm1CFMpWBtchACeqdVnf4/vLCprVCA9xbkH3EI9UctEAkdNmXwrcBf5COSX/LSmTj7VN/Dm5tYZyNFpY8IBXtJraHt0bB76WjfWT+KPxNs6GckbbMo6YYXgUtehIgV0b0mCKnzF+y86oBuwsd8q+fp8kUeeyIRl+CCpw3ZZ356bk5Xt2jFITmBZUgqldYT9aqG4/uRtoqQiAgWesN+8uRLw8q2twtg0UuUctjUWlaRDyyHF/0Nw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86cedbdb-beb9-4179-c30b-08db15e88e39
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 21:54:36.9708 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DmbTvagQCI4u75Dk3Nwb6C7tb3EiLaxZJs7BmzJIplJs8y/NawLK6WnSNSLR8KarW9zFtDYTVgtSEBsds+IxSgsGNf9sTORuuQOYSjA07pw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4444
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_13,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230181
X-Proofpoint-GUID: FdNs_UYnv7n6VUlBuQq-GI49ofBkV9-L
X-Proofpoint-ORIG-GUID: FdNs_UYnv7n6VUlBuQq-GI49ofBkV9-L
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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
> 
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

I was just checking memory_global_dirty_log_start() (as when dirty tracking
starts getting enabled) and yes you're definitively right.

I thought this was asynchronous given that there are so many mrs, but I must be
confusing with something elsewhere.

