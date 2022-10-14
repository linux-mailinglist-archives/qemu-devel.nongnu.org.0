Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBA85FECA7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 12:40:42 +0200 (CEST)
Received: from localhost ([::1]:43472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojI7M-0007yW-FD
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 06:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ojI4Z-0004yJ-9e; Fri, 14 Oct 2022 06:37:47 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1ojI4V-00013q-0w; Fri, 14 Oct 2022 06:37:47 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29E9ibhu026347;
 Fri, 14 Oct 2022 10:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : subject : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=5r1GAmUMBBtSziLB0DEq0/P5t/7C3+MmKvkIOn433WU=;
 b=ZpvqEuaQ1Vo5iOQOASDJGDxrP8oPhtdYHO9E4hqNj23sBH6pALCPnUMPyf2+0VsEa7gw
 t9nr2vmdvAMWJmCl/qAftT3JGzPnXctPu3fFB1mXS/IfxLEjuQZtFP7yOuv7uVci/6NU
 0+xKL4cMO+VZynLWhX6WcWG5Dw2kcTuV9k8JmjNMtDQejw4mlFC0EqR4fsHUJxi6rpFF
 1oc4AhHvwkcaqI1EsMBepFzNKhgxmCPNvTKe0uGAVQkAuHmAHrqjoVA67LE8mzNpxus0
 v7J3Taqg/TJBWqrgerlYNnJpJwteohyNQzlSi3jPHxWlAiLDkQt6n5ZR23WzL/zltJes 9Q== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3k6kgmtp3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Oct 2022 10:37:04 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29E9xa69014604; Fri, 14 Oct 2022 10:37:03 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3k2yndqcq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Oct 2022 10:37:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGyZwiJbO58Sr4LqmUc1kf7yoVi7cuGBkSgab1+DHme5T+zAaKyj6rySkp4sxEepXsCoJ8HqpNWWHaxP22ldiYCooJ7NPcF6dYrKW6w9IhMGU+iQhDkvuAyotwdJLvWhzocH5U+dNI73/DutQLbwdvK7o/RSdpjaJ4Uq2T6NfE3sWW5MpfZXloAcY0KtjwP2ll8UjfRuSojf7ztpPLXV7D0e1OSI+ZyUImGkWuzA3Nc8EmqWIxi0yhBTakA2BVD7QRWDQ264NfQ1sVt0maTM4LEKlIOaZtCZBqT10+c40OfsctZIXW6l3ZYk0s36XFhUeNrIXFmLLnislcBq525LPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5r1GAmUMBBtSziLB0DEq0/P5t/7C3+MmKvkIOn433WU=;
 b=IsRtLqkzoWh4nUDcR6CiU17JVkiw2efOk5dpINmQCItPYFUkC13oZVzmV6rNO9jB5Z+aEhKL2qmLEnioU0yreanfQT7Y6p2E3pGMx6fRfvlFSX6YZE1mcTFeltP5aWGegC0MY8OuEJ53+30Qzxd3ACcg63olA6r/i9kDbRh0LYYm2nkoJCn13vgYYnoE6M0MSsHWxWY42hW+L9GhrcZR/7a5+IlqU5ljhpEgDoIwoL6YZz+slBUVgNbrgvNuGFABxiuYcJ83Wr5gdLddO+Eb6c/dnkX7XiFcDci2rX1D+Ev+IngQAkCekOo8mNT5VNut3WGIruQBTYfJbcqocCyK8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r1GAmUMBBtSziLB0DEq0/P5t/7C3+MmKvkIOn433WU=;
 b=Gp4E5LK6fqx8wedgTsveSuvV0cuFLO0kjqqe9hQqr6LeL60gMXE/cm+BfcgwwQNRGFbK+Nu++cp7bJgrzQsvGnfnTsSOwJOMT67CJGLJFjNK5RaMnu7sY8jfy3vWqV3jWOsDM8YKJTBEPCWYcw9ueSYnCPA41/aV4BLTXcQgH34=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SJ0PR10MB5785.namprd10.prod.outlook.com (2603:10b6:a03:3d1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 14 Oct
 2022 10:36:59 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::29f3:99bc:a5f0:10ec]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::29f3:99bc:a5f0:10ec%2]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 10:36:59 +0000
Message-ID: <803b7e06-d379-1115-a2f7-8bf09ec5a1e1@oracle.com>
Date: Fri, 14 Oct 2022 11:36:51 +0100
From: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [RFC 7/7] migration: call qemu_savevm_state_pending_exact() with
 the guest stopped
To: quintela@redhat.com
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Laurent Vivier <lvivier@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Avihai Horon <avihaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 qemu-devel@nongnu.org
References: <20221003031600.20084-1-quintela@redhat.com>
 <20221003031600.20084-8-quintela@redhat.com>
 <bf945182-5c73-b1cc-13b2-5594bc21823f@oracle.com>
 <87ilknemef.fsf@secure.mitica>
Content-Language: en-US
In-Reply-To: <87ilknemef.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0016.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::21) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|SJ0PR10MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b5989e-34d9-4907-1b25-08daadd0062a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E8/s6S/QX1XCu+9Ur2UNNxntHqkvmgomg1ke053njbAIfW2rxe1G9OlFP9V8RctyuekQx6LBlmToXjqO2pJtizavQOMA4T9HGYvBFgQVW44S8vgIVSyk5UWhbOX3GihFNCtCWwLm2whdSn9i/d+AZsFJBT4+HzX+Tzdk+VX32S6HOKw9AAW/kr8McLfXHXDAnu2TryDaO7oWq/ZjxgIPG0M12qjoVUaJzUhKQy8cwSB54y/vopaiCiZ9sVoUyGmXqhHxOYo4m2WqZ8NztLEmIY9Qk0PJkYbOHyk6QMyAAZO7Pt0JcbfkWhMTuxwtH2tM1HDJ60rsOzPlbT6S4+Fu3hH2ZPrMOcZGOtWQincOwN5LhwRS7fhtAWQTiq3jwGF5Y05FwWPNsfWxg9xYoQGr07fYhVBeaREHHe8eHWNgrhWcAUV3jPYDMoFVwehFxP91X7sKMeRlBxz5xxRnfnzLM5WnuytUHjIPxlzJwiHqgZpSUfCuCGNPXyybJ2SGifEghVXd1fiJdQKfOTGRaIlXpmpTCpblbTwxwU+iS+w7JusP9LaPDEN8SLZrnFvGkiU49bzHa8O/oifud/WTUGg3ohNYVs1EeXa63tJwejNyLN9yFGx5+qHJtuNouA99viIE+b66hAGktdFPuMFbtw/WhovdsRXgMwDaxytjq6Detvfr+UtVWwImmZqv0xcqP0qwQ5EKZ36H03Z7Iq4AtzgaRtwuLVnQuXVLC6DkEwNbfINquvuaaeBgIjWVhGHSyJk2EiFnm1FVf7CcaBlx4NWbuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199015)(5660300002)(8936002)(2616005)(7416002)(2906002)(186003)(53546011)(6506007)(26005)(6512007)(41300700001)(38100700002)(86362001)(83380400001)(36756003)(31696002)(316002)(54906003)(6916009)(31686004)(66899015)(6486002)(6666004)(66946007)(66556008)(478600001)(8676002)(4326008)(66476007)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1lRZGovU2kwRGhxOEZmNWhKL0NMMGpMSTA3TjRsTnNmVkFuTjZWQ2dTUlpa?=
 =?utf-8?B?Umt6SnBQbmdsbDhMTndPY1gwTHd4ZnJIcUhVTGZMdE5hdzZoRjUxeUYvMkJY?=
 =?utf-8?B?TXVEMXhUTVVqb3NLcGJZclRqeVUxVjZRRE41VkUrS2hQL09VemtnbytBSzhY?=
 =?utf-8?B?UzVOVGwzMzhzeFNIUFczMXdlTDFwTy9xbVdXZHF0K3FaRnNYTFk2R2ptU1VX?=
 =?utf-8?B?c25DRGRyYWxkVWlZTVE4SXNydlF1MmlBbU0za3lzTWZNUFphOCtUWThQNzB0?=
 =?utf-8?B?N2ZCV2lwS0VTRTNwQUZHc2FVRVk0Z2VGeVJSb1pnQnpZTSs1NzB6RmV3bGtR?=
 =?utf-8?B?NUZLL2JhdmxpWjFIZFFKaUJHL2JGQ1JpN2dlV25xVExma2N3bTdiR0gyNUlD?=
 =?utf-8?B?YzF4R3VSNjh0VHhpbm1oTXpGaTRBR0o0RUY5MzdoWGhiUG8zMEhPdGUyNld3?=
 =?utf-8?B?c1V6a1JPcXlUN0dDN0hibDhPN2lTUnpBSU1HL2xRRlVkbTU3c1RYY09iMTJ5?=
 =?utf-8?B?UVNzY3FUL1RuSlZRYU9QakdBbnVmaDd2dEh6ek9JaWlqNVo3NzBWVUtNS2I0?=
 =?utf-8?B?cXFOcUFla0FweWt2ckNNSGxaUWlXUlgrL0ZtMUVIZk5ZS3JqYmdhWjJSSkIv?=
 =?utf-8?B?ZVZPekhkUFV5QzNCVkhKV2MwSmhuU0FQcDRtdGx0L3JBcWpZRmtuZklnWGYx?=
 =?utf-8?B?dXVGMlhza2lDSVl3MG5naG9oWGs2V3dZOGgvZXJJS2IvUzk5b01oaHhJNDha?=
 =?utf-8?B?Q2pPdDVoMHhrcVZXWXZaMHVYM203SjNLV3IzTXQzL3VOaEF0OG5idjRSSFFW?=
 =?utf-8?B?aHNObXFuYzVMMWtYbEk0Qy80bUZuem1tZ0F6K3paNGFwSWd5cDhTaDNraGdJ?=
 =?utf-8?B?V3UwUWFNRTRvalVxNjdUdXE3eUZRL05PRHU3ODdHajMzZXd3OVVvSW5nNkd2?=
 =?utf-8?B?T0NtZU5URjNLcEwvYUE4RExERE9JODEvRDg2S0pLUkRYeEV4SUJUWXc4YVdM?=
 =?utf-8?B?OWF5SjhWNmZBek1FM1FKYjlZZ1pRV1YrcUdrWWgzbWMzdDVsQVlKMktZN25v?=
 =?utf-8?B?akZ4VTlUVVJpd3czZEtseDZIY29qemsvVGptaEdJNWlpRitvWFZlRDlrb3FS?=
 =?utf-8?B?Ylk5ajhnK0gyS295V0xTU2c3bEVtZ1dmZFRaQ1dPcFJtZmw5Q2NEWm94RVV6?=
 =?utf-8?B?cjRKc0dZdy9QcHBTcGpZaWs3V2U4MmxkQkFhbnRHV1NBRGdZVDNkeFkxcmt3?=
 =?utf-8?B?V1dNZWxLUWx5MFlyRU9aOGluODI0aWFadEpxdnlTN3IxZ3VnL1g4YUFtRW90?=
 =?utf-8?B?L3U5UXExTURGalE3NVRQWllJZDI5WXpVR2Y3Zmd2L2ozTHQ4d1FjYjRzNUF2?=
 =?utf-8?B?WXQvKzVEaHNaUWwveUpyNlJTWnRFK1pFMmYySi9qQXB2U09Sd0NQazkycWpR?=
 =?utf-8?B?OXNJVTM0OGRKQWt2OHVKR2Q3elc2d0hMcG1ETEJ6MEg5S1krOFc0YzFteHQ1?=
 =?utf-8?B?anBGNWpNek9YdDJXZVhRaWRGV2VFaUFoZy9JU1djSFdrWURHelVHWEoxNW1U?=
 =?utf-8?B?MkQ4NVk2SC9wenMreFpySkxXd0hYTlN2TVVCUVp0bk0xN2tYTTVUS3lOaU1j?=
 =?utf-8?B?TlptRnhRVFZRRlA5QzBxUko0Q3VFb0x6M3YyZFdEazgyZmpYRWJLV2krcFBN?=
 =?utf-8?B?cm5odDRnZElhZjQ2U2dDRnhESE9KRFlRSFJxWVViR0hzbmtYM1ZwZ09kYk0z?=
 =?utf-8?B?SFpUbk1oSVp1UHpVUi9EMjh4eTZHMDUreEtKZUpvTjFwQzcxaFoyN1ZHUTEy?=
 =?utf-8?B?SUwrOHNSZU5FY3VlU0N3RHp6R1JCczVmZ1FrMUlhOVJ5L0xYOTB3eDhWb21C?=
 =?utf-8?B?Q0ZlT2JTQ0pTeXhjRjlZUGF0UWhmWnpScERnWjIzNmZNZGR5UU1HSmdxRnpK?=
 =?utf-8?B?UEg3eGZRbTdzcjIybE1nVlBNZ2pTelZHQ0hPQzNObnJtS2RSRCsrU1ZVUEgr?=
 =?utf-8?B?ellMZW9PZ0VPaWJHSGhtRVprM1VRbm1JRHEyby9YMWEyVks1N3pYQ0h3c0dV?=
 =?utf-8?B?TEp3VHpocE5pcnEvYVQ0M3JtdnRBMFBIR1kyK1p6NDRKTVJ5RXlsNFlVbFZG?=
 =?utf-8?B?elRYN004UlFjMy9icWt3RGhOY29ZMHZxb2ZhcStvczFqbnpKY2huNTJZUE1S?=
 =?utf-8?B?NFE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b5989e-34d9-4907-1b25-08daadd0062a
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 10:36:59.7540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEpAx2SxlWwMuWiYJLRksNwsk6c53pff9M7ryzLumb59uaM8rJLibxHV3CcpJSQ+zl6pHbTUp5U5gE5j602tkFNDkGZ4Gnv6KIjdKm42Hxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5785
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_05,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140060
X-Proofpoint-ORIG-GUID: wcyBw_jUoCwE3fk5mnB8FeQpm0rS-vF9
X-Proofpoint-GUID: wcyBw_jUoCwE3fk5mnB8FeQpm0rS-vF9
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/10/2022 17:08, Juan Quintela wrote:
> Oops.  My understanding was that once the guest is stopped you can say
> how big is it. 

It's worth keeping in mind that conceptually a VF won't stop (e.g. DMA) until
really told through VFIO. So, stopping CPUs (guest) just means that guest code
does not arm the VF for more I/O but still is a weak guarantee as VF still has
outstanding I/O to deal with until VFIO tells it to quiesce DMA (for devices
that support it).

> That is a deal breaker.  We can't continue if we don't
> know the size.  Copying the whole state to know the size looks too much.
> 

It's fair to say that the kernel could know the size of the state once the VF is
stopped but right now it is only on the STOP -> STOP_COPY arc (which is when it
is saved to kernel pages, regardless of userspace reading it). And it will block
read() until device has finished transferring it (unless you do a nonblocking
read ofc). Knowing the device state would need to be reflected in the vfio UAPI
and needs that adjustment. Providing total length ahead of device transfer might
depend on the hardware, but current vfio vendor drivers look capable of that
(from looking at the code).

>> It would need a @data_size in addition to @data_fd in
>> vfio_device_feature_mig_state, or getting fseek supported over the fd
> 
> Ok, we can decided how to do it, but I think that putting fseek into it
> will only make things more complicated.
>

fseek() was just a suggestion as a way to calculate file length (device state
length) with current file APIs:

	fseek(data_fd, 0L, SEEK_END);
	size = ftell(data_fd);

@data_size way is likely better (or simpler), but it would need to get an extra
u64 added into  VFIO_DEVICE_FEATURE_MIG_DEVICE_STATE ioctl

I am sure there are other alternatives

>>> So we need to stop the vm "before" we
>>> cal the functions.
>>>
>>> It is a hack because:
>>> - we are "starting" the guest again to stop it in migration_complete()
>>>   I know, I know, but it is not trivial to get all the information
>>>   easily to migration_complete(), so this hack.
>>>
>>
>> Could you expand on that? Naively, I was assuming that by 'all information' the
>> locally stored counters in migration_iteration_run() that aren't present in
>> MigrateState?
> 
> This is not related to vfio at all.
> > The problem is that current code assumes that the guest is still
> running, and then do qemu_mutex_lock_iothread() and unlock() inside the
> pending handlers.  To stop the guest, we need to lock the iothread
> first.  So this was going to hang.  I fixed it doing the lock/unlock
> twice.  That is the hack.  I will change the callers once that we decide
> what is the right path ahead.  This is not a problem related to vfio. it
> is a problem related about how we can stop/resume guests programatically
> in the middle of qemu code.
>
/me nods

>>> - auto_converge test fails with this hack.  I think that it is related
>>>   to previous problem.  We start the guest when it is supposed to be
>>>   stopped for convergence reasons.
>>>
>>> - All experiments that I did to do the proper thing failed with having
>>>   the iothread_locked() or try to unlock() it when not locked.
>>>
>>> - several of the pending functions are using the iothread lock
>>>   themselves, so I need to split it to have two versions (one for the
>>>   _estimate() case with the iothread lock), and another for the
>>>   _exact() case without the iothread_lock().  I want comments about
>>>   this approach before I try to continue on this direction.
>>>
>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>> ---
>>>  migration/migration.c        | 13 +++++++++++++
>>>  tests/qtest/migration-test.c |  3 ++-
>>>  2 files changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/migration/migration.c b/migration/migration.c
>>> index 35e512887a..7374884818 100644
>>> --- a/migration/migration.c
>>> +++ b/migration/migration.c
>>> @@ -3742,7 +3742,20 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>>>      trace_migrate_pending_estimate(pending_size, s->threshold_size, pend_pre, pend_post);
>>>  
>>>      if (pend_pre <= s->threshold_size) {
>>> +        int old_state = s->state;
>>> +        qemu_mutex_lock_iothread();
>>> +        // is this really necessary?  it works for me both ways.
>>> +        qemu_system_wakeup_request(QEMU_WAKEUP_REASON_OTHER, NULL);
>>> +        s->vm_was_running = runstate_is_running();
>>> +        vm_stop_force_state(RUN_STATE_FINISH_MIGRATE);
>>> +        qemu_mutex_unlock_iothread();
>>>          qemu_savevm_state_pending_exact(&pend_pre, &pend_post);
>>> +        qemu_mutex_lock_iothread();
>>> +        runstate_set(old_state);
>>> +        if (s->vm_was_running) {
>>> +            vm_start();
>>> +        }
>>> +        qemu_mutex_unlock_iothread();
>>
>> Couldn't we just have an extra patch that just stores pend_pre and pending_size
>> in MigrateState, which would allow all this check to be moved into
>> migration_completion(). Or maybe that wasn't an option for some other reason?
> 
> This is not an option, because we don't have a way to get back from
> migration_completion() to migrate_iteration_run() if there is not enough
> space to send all the state.
> 
>> Additionally what about having a migration helper function that
>> vfio_save_complete_precopy() callback needs to use into to check if the
>> expected-device state size meets the threshold/downtime as it is saving the
>> device state and otherwise fail earlier accordingly when saving beyond the
>> threshold?
> 
> That is what I tried to do with the code.
> See patch 4. ram.c
> 
So what I was saying earlier was to have something like a:

	migration_check_pending(ms, device_state_size)

Which would call into migration core to check the SLA is still met. But callable
from the client (hw/vfio/migration) as opposed to the core calling into the
client. This allows that the client controls when to stop the VF

The copy to userspace one could probably be amortized via pread() at
at an arbritary offset to read 1 byte, and get an estimate size. Say you could
check that the size is readable with a @threshold_size + 1 offset without
necessarily copying the whole thing to userspace. If it reads succesfully it
would bailing off earlier (failing the migration) -- and it would avoid doing
the full copy to userspace.

But the one gotcha is the STOP -> STOP_COPY needs to
happen and that is what triggers the transfer the device state into
kernel-managed pages before userspace decides to do anything to access/copy said
state.

> How I have two functions:
> - ram_state_pending_estimate()
> - ram_state_pending_exact()
> 
> 1st should work without any locking, i.e. just best estimation without
> too much work, second should give the real value.
> 
Right -- I did notice that

> What we had discussed before for vfio is that the device will "cache"
> the value returned from previous ram_state_pending_exact().
>

A concern I see is that if we stop and resume the VF on a regular basis to
accommodate a calculation just to be made available throughout all migration
flow -- it is going to be a little invasive from guest performance/behaviour PoV?

Perhaps this check ought to be amortized at different major stage transitions of
migration (as opposed to any iteration) as this can end up happening very often
as soon as non-VFIO state + dirty pages get to a small enough threshold?

> 
>> It would allow supporting both the (current UAPI) case where you need to
>> transfer the state to get device state size (so checking against threshold_size
>> pending_pre constantly would allow to not violate the SLA) as well as any other
>> UAPI improvement to fseek()/data_size that lets you fail even earlier.
>>
>> Seems like at least it keeps some of the rules (both under iothread lock) as
>> this patch
> 
> Coming to worse thing, you need to read the state into a local buffer
> and then calculate the size in exact?  Looks overkill, but in your case,
> I can't see other way to do it.
> 
> My understanding was that for new hardware you have an easy way to
> calculate this value "if the guest was stopped".
> 
s/guest/VF

> My next series are a way to do in parallel the read/send of the state
> with respect to the migration_thread(), but that is a different
> problem. 

There's also non-blocking reads not sure it helps towards the asynchronous transfer?

> I need a way to calculate sizes to start with, 
> otherwise  I
> have no way to decide if I can enter the completion stage (or for old
> devices one can lie and assume than size is zero, 

to be fair that's what happens right now with migration v1 protocol -- it's not
unprecedented IIUC

> but then you are going
> to have bigger downtimes).
> 
> Later, Juan.
> 
Thanks

