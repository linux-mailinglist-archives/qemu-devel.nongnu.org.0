Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C25B578542
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:23:12 +0200 (CEST)
Received: from localhost ([::1]:56744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDReR-0007Gt-EJ
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDREc-0004jD-FE
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:56:30 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:35178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDREQ-0002se-3w
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:56:30 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IDZK2Q028417;
 Mon, 18 Jul 2022 13:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=PgY3hmUcxdjCaEmDYAr27r3DNPVADyFNzrUifb8KoUU=;
 b=ep/akmpU1AEzDkRpCHw3AujbP1mgal5wHzaQSR4H1HF2mSffzzRITU1iVkwffZ8wtRjA
 HsCwwI8oL+9TksXKmoTEG2umpCkd7z2xf4Y3aYQF5jXQ8hUpGjAXQyWccGGh7tG2sGwH
 XjVkk7Q91Z3WEi5RgE36XJGMVxVi+m6wMKC9Io9o64+kt/PizrvYR0FrIA51ODQElMJk
 WzCjUqyvvYrCDvtkMfVqn9u0fl+t7BZQC6MfurWePv6DApS6aES3qPZMFMmwL2B38M6f
 2un9nKhAUhcMhq7Om8X10Z8cNgyGu98llR7Jvy3jMzYGMY/88NqNK+1SQ3958L1c5nQR 9g== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbkx0udt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jul 2022 13:55:56 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26IB3be4027463; Mon, 18 Jul 2022 13:55:55 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3hc1ma975c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jul 2022 13:55:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LNDqbXfayW5DKeZe5VQvfYev4H8+fy3IWa7jEqbFZU4PXP0pmIhXJasS3xaMCDf7zVL4RH/fuKH2Bd1Eh5yIL23679nJjANl61t31dcovCRnH63VNaomhraIv5dH+FcOJxk2XctDsZAl3FYXsKyQoKE5csfqMrdxqGGTJ4Ji6ON0Akd4qGfjz49pMK07krxNsiCclLdrIUH4yCdDjBzMehp1ndhIRvmikUM/vW9NmGJoM+xkCnPlnpaGfJ68G9cs5IxjVSaKKiY16hFaRcWyDCZQ6v40ShJYsagD8nGk/IlSirK4j36RXbfrwvbI1Brjx256StXU/lA4xOXFMrNsyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PgY3hmUcxdjCaEmDYAr27r3DNPVADyFNzrUifb8KoUU=;
 b=E/PyMyOtt1QuetPHZ1vb063+Zxp3mG4rTNm4CNPnRK9An13BsNKqImb4TzrdZjSfMl0rhccZWDz2TYL1gXf1ZdsXjDAnWUqmQqRQVlA3ZwoA7G8FwFxpLRnnt50pGht3AekSNuKh4hx5PK/fhiFzqme5St+RiM+BL78oWxvpwvrQ9QYQHaICvIcMzHgLg/eO1DGkYMhL7IXmuA2RdjOd/5geFG6CHLS7vYW7iHoTSV9diID9r0qG8isV7MlW+q5HKVZ1o4gvt7IOdw8Mk9/eGmFc6vUbZsymZbTSjNj2WoEAE5IPDQZXv8jpeO/QjOd2auTbuO2w9jPbf/J/g3C50A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PgY3hmUcxdjCaEmDYAr27r3DNPVADyFNzrUifb8KoUU=;
 b=ilqnipgx/hP+Td0CoYHbfrpv8Qm1ro901KX/fkfiAKAelJDcGHaI75VYWNtcpOfWUp3ZMDVrozJRzdms6ypFgxjD5TU/E6c9YNN3GpqA9pLlvm0m/pYrcgTJKbRHrZtQpMVQiANyGInaJFVY8iu9H5JYZ7G/ZvsjOD5r9kdPrOg=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH7PR10MB6131.namprd10.prod.outlook.com (2603:10b6:510:1f5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 13:55:52 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%8]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 13:55:52 +0000
Message-ID: <66ddd4c1-1aaf-a99d-747e-4a434c09c157@oracle.com>
Date: Mon, 18 Jul 2022 14:55:45 +0100
Subject: Re: [PATCH v8 07/11] i386/pc: handle unitialized mr in
 pc_get_cxl_range_end()
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
References: <20220715171628.21437-1-joao.m.martins@oracle.com>
 <20220715171628.21437-8-joao.m.martins@oracle.com>
 <20220718145829.6a9f2235@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220718145829.6a9f2235@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::14) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5126849e-bbcf-456b-620c-08da68c53a0e
X-MS-TrafficTypeDiagnostic: PH7PR10MB6131:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h4Ca+tmkU7EN2ab2PJPPoNe4Cw0zZviqMd90Ci/IiljkL7eD8tCkiNzCtDC6w5KrXC8S0fAosdPaQYTKikJBy93fd9NGwXvqWZfByQ2mn8k5xJchYVZ0DhXS3eZwZWuCqYFCUm7mm+SwT03tPLczoq7l5mOtIOqJwtdYWZLiBAY4mS2hrpG+vGEB/Mts6F5I99xsnWtK+A+VE6CukzdmJ7KqXstShu7TclphzWc/3aLEHBwj4iaLUXAuSEh0OUaP5Qi0CFrrlV64RmLet2nvrLDmjmd0oI73C6kvHnpDixznpoHg40gT5N29Ki9glC791IP8IZTwTvom4xaIucSvdBR8m5vMLYHokPzcYJbE5GN0u3RlXUUn5Nqv/DJEdDyfeTcLQNWmRPmVkDOkGYpWC2+zET4AZwo+JVFYbZ2cNxfqs8yNpyhq61NDfvZr7GyNO9kHtpp2LTJzuA6D4JuYt8tIcjM5R4xz7+potIBgbYP2rt7HaWN3igZFrppqrkeaftvkh26WeIi0TsdlFZRBUjE4bvYETMfoKit6I9pNA3B6bigXvArVI1VxI7iDRyMli9HYe2325S3RIcp32yDETtXLlhRsAD/gBa8ZQbb7p4CLcxZTEYv3H2r8FCXj4rSQfxFJdR9ZcWAyoP8JMDbJw2qCj/Deg+R6s3OdIp+QzCDZsMAM6cdaWgr3FNSayfrMQPqex1WWWXJ03/O3XUTntyuEG4XRhijxEjz9cM5QxITrumErEkzjOXDV3ueIYMIUnx9UVoxOUh0lzYSDxv9MtoXXvR3REeIZaApIJu5j5cTSL/sQFiBqfg7lq0absgA/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(136003)(39860400002)(346002)(366004)(396003)(66476007)(66556008)(8676002)(66946007)(4326008)(8936002)(6916009)(316002)(54906003)(31696002)(2906002)(7416002)(86362001)(31686004)(38100700002)(36756003)(83380400001)(478600001)(26005)(53546011)(41300700001)(6666004)(6506007)(6486002)(6512007)(2616005)(5660300002)(186003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VU1YMjN4eXB5NXZHWmptdGJ1NXpsU3Q0VjZCQjk5M0R6VzJjUjBFSEQ2dVhq?=
 =?utf-8?B?NHZuRjFtZWJWbmprbGg4MVNjaFVtUlc4ZDR1dko2TmJsd3pUQ1R4eGFpeXBi?=
 =?utf-8?B?WHhRbjM0YnBkRDJTZmNNdFEyYkVCMktQYysxUWY0OGRlUy93RmVpcWFERFB1?=
 =?utf-8?B?ZS9xSU50VHQvQTJiUmppR3BDMERlLzN6Y3Fobzk3ZmwyOWZxVnhGL0U5VFRR?=
 =?utf-8?B?TWlLY1cyWHNBL2w4RGxGcnR3V2dveFA5UXJORmt3SGpnT0FjNWRuTE8vK1dY?=
 =?utf-8?B?azBKSmc5STN2RWQyV2VhZDZZOXlpUXd1QzJBQ2lTZ3RJVVhIRmx4eHlRVisx?=
 =?utf-8?B?OUtQdFZaT1ZraWljdUlMZGJrOGh3KzVjWDNtT0crVlBLWWMwdGJkNUdWRXcr?=
 =?utf-8?B?bnlMN2pSWmFYelFweGErVytVazMvOSs3bHhZWEdVeVRUVHFobzdvaFBMQjF4?=
 =?utf-8?B?VGwxamhvVFhEbXdEVkNtQnphbVREQjZYRGdYWFE2TXJ2RXM4R1JmeEJrWWhM?=
 =?utf-8?B?NUpNd2tZb015VERuSWgyczdzV0tIKzAzY200RVNPVkJncDV3bHhta0FEN2Zs?=
 =?utf-8?B?UlBXU3JWTnY0NlpvTWo4N1IxZ3NsK0wwb1ZibkM5eWltbks5WDE4YVh2a3BJ?=
 =?utf-8?B?WC95blVQNmRlL0lsYTNkZEl6RmN6MDBQOForYVRWN2s0a010SDdCQnEyY0l4?=
 =?utf-8?B?bFdGN3F5STZrT08yS2lBVGtXS2d2Zyt0dnpTZ24rSGtDQWJFMWp4Z2o3V3kx?=
 =?utf-8?B?ZlJHSnBBZ2NsUTNRRktrVUlYL1NteGlabnRtVVJXa2Q0UW1RUUZKSC9JWCt6?=
 =?utf-8?B?K1JJZDVVYW0yMHNVZHNabkk1T0VyVWRsdU4vVmZmQkkrMTAzaE5XdldFbTJU?=
 =?utf-8?B?NWRSNVVOVjZTVkgvcXMwQXMrKzdnVE4wQWZOemtmZGVaUEpWYUJYbEw4ZlRQ?=
 =?utf-8?B?YlhjWmkwMlVzUldlREovajRycXN3VWQrc3kzV21CVHBad051dmwwK2VGVE5C?=
 =?utf-8?B?cnI2UzcrV2N0ZHpjOTQ0OXZLWm51aFlSYmR1RXFtNS90ZzF5UmFnZ21mNStk?=
 =?utf-8?B?ZHp2endiV29ybmRxWElDQjBqMDhsWlVKc1N3aFRRL05rdURJT1FiMHFKVVBN?=
 =?utf-8?B?VU0xeng1cWRvSzNVWkM2cnpYd3FFbUNlWFM0amovOUxrWktFQ2xEQTVieEJ2?=
 =?utf-8?B?TVJJWU90WUtoYUpLNWVZZ3JSSGVzemxadkJsZjU4ZnRTNXRHZURGK2RIT2Zt?=
 =?utf-8?B?YlRKR053emc4c2xaQTdSZjBVY0s3NzhLdy9ZaGh2SDJxMnNlS2RuOGorVlJ4?=
 =?utf-8?B?ajBtdHJlcS82VTdxUitIZFBjY2V0NCtZUkpJQUNyS1Z1Szl5S2xqVWJoRWRE?=
 =?utf-8?B?dlNRRUUwM29hMkxSVTJ5Q2tKbkxpTFY3MWFMNXh5Zy9yVzN3akFGakltWE5H?=
 =?utf-8?B?YWQ3R2xTZWZrc3h4SnEvMW5SdE05QWVMc1AyWlhjY2VNMlQ0dTkwMlhkMDcx?=
 =?utf-8?B?V3l5SWgzNWpFZVppSmZVWTMzOXJOOVFzYkNCNStFTTZFczA4b2JuQkJHNCtm?=
 =?utf-8?B?Y2o0dmR0MFVRdjdIcFlKeFlwZjNGdWM3Qys5NFZDTGN2bkFrNXplaDNQZEVt?=
 =?utf-8?B?bG9hcWF6aHp1NmY0Qi9TKys2alB1K24vKzVzNE0rL0tJdERHRDN0TW1CWGlt?=
 =?utf-8?B?UDJDMTNyaVg0S0lmb1BQV1UxczdyclA0MTdZRzN0SThYWnBIaXNxR1IwVW9k?=
 =?utf-8?B?YVZSYkFLZWJZdUhsWFdhdzVYUEN5RHlaY2xETWZia1kySExRVlRZVVhnRlJ6?=
 =?utf-8?B?YkJsZW1qaFoybm8xSFczU0FjVWR1ZlZ5eXB4cFRzQlh1Ukx5cGt3S2RHb0J1?=
 =?utf-8?B?ZmJSUUxCSnZNZHBhaTcveVptenNxNnlrQnc0NTNPYVZCY2ZnM2hXeVB1SG4v?=
 =?utf-8?B?YzFhdHNRdG1DbjlXdGZsRWtQQ3M1RjA2eVhVWXpBWmNDNjFIOFo2RjBQOXBF?=
 =?utf-8?B?RU1jdzdNUjRLUkg2aHAySXhRaDBHRlFHSzdIaUJ5VS9CSTBUZHIrYi9YUDJu?=
 =?utf-8?B?cURKckhIMG15bGVJNnVMbHRkMUJxbkxkMmVCWmN4S1pZYnhCWkZ6YjR1OHI3?=
 =?utf-8?B?UWtoY1dBdWRLN2REQTRnUkY0cXZWajdhdjlYN21YdDlrUk5BSFRYVG5nOWxL?=
 =?utf-8?B?QVE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5126849e-bbcf-456b-620c-08da68c53a0e
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 13:55:52.0556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DdbSFl3jWp0nHWZtbYNan+MOlLWqPKtk2ORPP1HCBY55SfH3XYM9VMyuLEy34tpDtLjJPxl0e537QiKzgcxze2al8sm00oClFVsd7r8rPy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6131
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_13,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207180060
X-Proofpoint-GUID: QD5VXBgvPRaWsHlXWL3a_EzCgBJB3I27
X-Proofpoint-ORIG-GUID: QD5VXBgvPRaWsHlXWL3a_EzCgBJB3I27
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On 7/18/22 13:58, Igor Mammedov wrote:
> On Fri, 15 Jul 2022 18:16:24 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> Remove pc_get_cxl_range_end() dependency on the CXL memory region,
>> and replace with one that does not require the CXL host_mr to determine
>> the start of CXL start.
>>
>> This in preparation to allow pc_pci_hole64_start() to be called early
>> in pc_memory_init(), handle CXL memory region end when its underlying
>> memory region isn't yet initialized.
>>
>> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/pc.c | 18 ++++++++----------
>>  1 file changed, 8 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 3fdcab4bb4f3..c654be6cf0bd 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -843,17 +843,15 @@ static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
>>  
>>  static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>>  {
>> -    uint64_t start = 0;
>> +    uint64_t start = pc_get_cxl_range_start(pcms) + MiB;
>                                                      ^^^^^
> why it's here?
> 
MiB is the size of CXL region

It's essentially logic inherited by pc_memory_init() that got replaced by
cxl_range_start():

@@ -946,15 +962,7 @@ void pc_memory_init(PCMachineState *pcms,
         MemoryRegion *mr = &pcms->cxl_devices_state.host_mr;
         hwaddr cxl_size = MiB;
         ^^^^^^^^^^^^^^^^^^^^^^

-        if (pcmc->has_reserved_memory && machine->device_memory->base) {
-            cxl_base = machine->device_memory->base
-                + memory_region_size(&machine->device_memory->mr);
-        } else if (pcms->sgx_epc.size != 0) {
-            cxl_base = sgx_epc_above_4g_end(&pcms->sgx_epc);
-        } else {
-            cxl_base = pc_above_4g_end(pcms);
-        }
-
+        cxl_base = pc_get_cxl_range_start(pcms);



>>  
>> -    if (pcms->cxl_devices_state.host_mr.addr) {
>> -        start = pcms->cxl_devices_state.host_mr.addr +
>> -            memory_region_size(&pcms->cxl_devices_state.host_mr);
>> -        if (pcms->cxl_devices_state.fixed_windows) {
>> -            GList *it;
>> -            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
>> -                CXLFixedWindow *fw = it->data;
>> -                start = fw->mr.addr + memory_region_size(&fw->mr);
>> -            }
>> +    if (pcms->cxl_devices_state.fixed_windows) {
>> +        GList *it;
>> +
>> +        start = ROUND_UP(start, 256 * MiB);
> 
> and also this unexplained alignment.
> 
It's part of what CXL fixed windows logic in pc_memory_init().
And the hunks I added is the same calculation.
Let me copy here below:

            cxl_fmw_base = ROUND_UP(cxl_base + cxl_size, 256 * MiB);
            for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
                CXLFixedWindow *fw = it->data;

                fw->base = cxl_fmw_base;
                memory_region_init_io(&fw->mr, OBJECT(machine), &cfmws_ops, fw,
                                      "cxl-fixed-memory-region", fw->size);
                memory_region_add_subregion(system_memory, fw->base, &fw->mr);
                e820_add_entry(fw->base, fw->size, E820_RESERVED);
                cxl_fmw_base += fw->size;
                cxl_resv_end = cxl_fmw_base;
            }


>> +        for (it = pcms->cxl_devices_state.fixed_windows; it; it = it->next) {
>> +            CXLFixedWindow *fw = it->data;
>> +            start += fw->size;
>>          }
>>      }
>>  
> 

