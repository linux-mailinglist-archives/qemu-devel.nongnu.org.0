Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CBC5785B8
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:45:03 +0200 (CEST)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRza-00036b-LK
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDRdA-0004eS-HU
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:21:58 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:25680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDRd7-0006x0-Kz
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:21:52 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IDZkWw014109;
 Mon, 18 Jul 2022 14:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=cY+bteRCIvI+R1K6pGCZHPqDeuhcjai3CjhBID8nUKA=;
 b=TSKbWY7MJ1LEUbpeVIyBu7pn4i82RJMPMQZqgEIVrAaPJm0Sfc5xMABQJ6ul/4juCttA
 R0SGM1qoChXV68ZWW048L58EKEr2k2k0t63OUe/FECewuzONVCrsBY9o4GjDn4kUUayD
 rD9gsx6GGDjPizWI8h+KgblAgnVnZnMO603iPbiDYlu7LxbDuWGMPslWcYU2GRS0LUz8
 93fgWAVzTzQnjZfa+IB36983FIy24+D41pBu9sQOmEwfNXZLn24pSVAiajJmMtyDfq6q
 f97DIq2HgccEhriw8SVVqV2mFpdbfDM7xgVn8/nblZJWEsWwSZojV81IqJj/kXPkWyaj Hg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbn7a3d95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jul 2022 14:21:40 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26ICJG66006580; Mon, 18 Jul 2022 14:21:39 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hc1gfm0pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jul 2022 14:21:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cv8rdYBwnikC441p89SwtUWx0VV0e7/hp397RAfRbPF6OrQ4z0jWQxfp+kki9EKOT/lJuwjCItnygviKyNqXu41ckG4Ru8pN6b66JVGSrerGLU3s1VJraEFpnse2CjQU1qbWOCZ9/xK+clwthNSqeNSY+TdDSf8VP5CtJUqndBEXjCvUA4yrcabiuYT/OEln5zYg0Q/YvFG8OFdYyE6GEkp0DIkDgpMOYFPz6yhJgylnwVDUPKnhI0A5ZXcy/8+TgXAE0WUg6Y4xwznne7oT1R3s92Evds+5/Fonv7XS9ggddpE53Z9Cka1XDsNnGlc90ODt4TaLf8/zLXWnYuKW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cY+bteRCIvI+R1K6pGCZHPqDeuhcjai3CjhBID8nUKA=;
 b=GwZlgL3QD4sIjjZPjCzUjkLuIvkIpb9Dpf8/Tk76UXAnhkJkmdOWFtq4shdB/Yx99h1+BNZ6Xo8AKehguj/Gt5EN8xKU4LZLE41e6sW4Jt3czGwX2FQZj1ku5i4p9xyxTR3jUF1KU0bhBb8zaj7EbjKxQHJKh5Ub2k/C3eiMP/OhzldInT3OTwwiNWIawiNY6woDG92MYftMSxV7yaxj3HmJI8uxP9gdLYiC/ij+/FYZWTDgn3MkserDChJ8NDZpLqQ6cTFUqRqSxlcfUcqk+oXrNCgjLHdxEYH51Dt1c3NfbhahCEx3/1EyFwexQ2IFabEeVUZdA2bGfLCO9SRhlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cY+bteRCIvI+R1K6pGCZHPqDeuhcjai3CjhBID8nUKA=;
 b=j/aL/Yr3EFKzKh6tnLeMZwmtPUZ56EinSVzb8ededjAqvMIjoBkrXlU8z2EGpGkouTFyUKxl7IGk+elKcRJwmdfTMWgPUQdg3RaboKyJu+Io76FI/A0vJBH4N1lUfoUMNJR2lzu6BZJsBJQZHKveOT1grsgTI1S5QuAxujSj3zU=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 14:21:37 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%8]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 14:21:37 +0000
Message-ID: <797c3477-e943-a894-0781-607cc175b8ef@oracle.com>
Date: Mon, 18 Jul 2022 15:21:31 +0100
Subject: Re: [PATCH v8 09/11] i386/pc: bounds check phys-bits against max used
 GPA
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220715171628.21437-1-joao.m.martins@oracle.com>
 <20220715171628.21437-10-joao.m.martins@oracle.com>
 <20220718151622.3c38f261@redhat.com> <20220718155657.5f975c50@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220718155657.5f975c50@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::22) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2cc69af-a62f-4e8b-8cac-08da68c8d2ff
X-MS-TrafficTypeDiagnostic: MN2PR10MB4013:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2B50juFqKT9JXHGreKJ89cKDmvrwSYPOgmnGNdluVTYaUBhOWs7BLc6mYPRk5/UvKkc/YWZU9+4WzCp8ycoDFoNAmwnyrTo11JqLdkfZLnDQpJ6kuQZPbCwcGGO6tfwrd6kMAKDc82j5pk2OuxDVab6JKT/VrRRnTqNpoN4wBfKnSBrWi7fGc2Ul90DwuWiWU/x3B0z4tqkrSk2Pi5gUUMVr84XQnDDGX8/EFy6YfYqACm3GtTn5g4qySW1v+nW9KaFYb6jVaIGoNKZePmrECW7zpD9STztabVvBLRwytocRJmtthqVZsmGDyshOCVzKSsAquk/W6U3nQ+wpEujR2BazUxokWMRMgnh2e59EXBIdRAKn9SRCIF0haVJILcmJrfw16rLkPbk0f/uuTl/IdITjttSeGPG0tnWr0ZoA5xEhTnAaGL+QmL4gdlCJJxLPPHRR3tC9podoMzWEHoEp1yV1xTes2ydY3boNqaqb/bUGdoCOcf5p3p4KK0uU/KogXTxbDHE4tu8VqTwroHr3ILR5TEntRNOeMOvkK4y6pdzr47NNRu65UoRU8KKRXJIS9VFVpwMbToJSJj70dtouRbGtyO2OY4PllQlD2vymeGMd9AzeMxyEpuNjgfwkrFs77dexw2d+YiBtl2geOl2yBE7u4d72YoltPdkVDPGym7cwTGRpiL9LDjOeNvJwePtg/uL94cHao411cDmLqKnaIFeP0IA/DsokFhWRVycn4TG2P6IUqU3W376WhGTXu2dXDqzZV1vH1Un9W49TdoxanUgjXB9P1thnfyAnRhgcFlVjIIPaVXcxBdQwkO1LIgim
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(366004)(396003)(376002)(346002)(2616005)(186003)(31686004)(26005)(6666004)(41300700001)(5660300002)(7416002)(6486002)(2906002)(6512007)(478600001)(31696002)(4326008)(8676002)(66476007)(66946007)(66556008)(8936002)(86362001)(54906003)(6916009)(6506007)(38100700002)(316002)(53546011)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YytaZlo4NjREL2MzWU5wblB3MFdPSXphS0piUUZNK1JYeEQ4dFhiR0grcUFU?=
 =?utf-8?B?QnJTQ0pRbEIyZVd2aVdVbVVlUnpqU29DOVc4bS9xdjlwcDJ4UDNxVHBqM2V6?=
 =?utf-8?B?U1JqT0sxckczOFArOGdweE5RelRiN3UzLzRGUmw0cGFuaVdxcGtEWVZlRkFQ?=
 =?utf-8?B?VmtLSWlsQmhMMy91cWlVOUtLNzFpaWMzVWRIeVdTY3liV2NTODh3aVYwNFZ2?=
 =?utf-8?B?WWlqb2NPcWNJKytrRkVGeWwrSkZCdm9OSXdtN1NOMUFBVndhbjRQK2FxTnVE?=
 =?utf-8?B?dkZwRm1tNkhuTW9STzI3OVlJYU1haVlFNWo0NWQ4ZW9EeXFQSW5kQmdEUDUy?=
 =?utf-8?B?T0IzM0RSUmNuZ0NodmtiL0JJL1dqUEJRSlJHMEdnb0FidjFFaVE1QnpqMUto?=
 =?utf-8?B?UXUyUWdFME5MOUFNcXg2NGgwZjNPQmQ5ek13RkJFcXcydC9OZXdha3FxdTNm?=
 =?utf-8?B?MXNTeUxzdWYxN2F1OTEwbmRrTkhqV2NyTC82cVVucVlXbEtTNjdkTFNpaEFZ?=
 =?utf-8?B?MDFTeTIwRlFSemJZbVhJd2IwNTV3S1Q0dy9QcmF2cXNyRlc1UnBBN0pPL0dP?=
 =?utf-8?B?bkYxM2NzMFRMb1hrQ3MzclI2M1JKa3JkWU5BajhwYU9wZGVkUmI1OW1KNkgz?=
 =?utf-8?B?dUlFQUVZOFlyN2dTTVpRUmZmR09aZDJZVFhRZzZPS2ZEcU9YbkFvalJITmlx?=
 =?utf-8?B?eUxVRzdpSGZyZy9PY1NHcVVVMUo3ZHJhUjhmNURlN3RmejNDK3BSMU1VWm50?=
 =?utf-8?B?VUwxRHJLakVhelliNzI5a1l2cEhidG95WG1qNFV0TnljMWdQNkF4bjdsMkJI?=
 =?utf-8?B?dlVYZmZxZU9reGpnSXZKVHgvMmVxYSt4V25PWVF4cXBZbVkzNDBpa0RxOFpS?=
 =?utf-8?B?UGYvSmV3dG9UM1JmaUF4bHA2aVkvamZPNkl3OXFrcjdLUUt3QTAyT3ZUYTdZ?=
 =?utf-8?B?WmNNcDQrVitWWk56K3ZMRzlTeTlvbW1UczlYTEVjYThVZHdtdENSZ1BXdWFT?=
 =?utf-8?B?bUhJUHJ6MFU4amVNalQyMlFibWFqSjFRdUw0cktoQTlXem5QaEZzYy9BOEIx?=
 =?utf-8?B?VDFDZlBDRDYwK3JmaXB0L25sMFV2WTdDMXpBY1ZnRFh2QjZZeXVpUG82SDJK?=
 =?utf-8?B?ZkVvcVljV2d4TmV4Nkx0TlczdSthS1BiUjJUYWdqWFRscGxuQlFubVcvWFcv?=
 =?utf-8?B?NnQyNlFXTXpDM3ZYQ3YwR1FoTXlkWjNkV0ZKTStLVFlUcDQ1eXNKTXgrUXNE?=
 =?utf-8?B?RWpaNFc4a25XZGpQNFpEaWVBL3BZbjMxZitENVBaVnZhUmh6Vm5GNk5rWjIv?=
 =?utf-8?B?RlArdGdsMm5YY0poM1RGN0VvYjFFSnMxUUo2UDFxbDVwMzVNMDdkZTA1VlVV?=
 =?utf-8?B?dW90ZG9OYXNObVQ3OHh3cmxyTTlGME92WEkrV2M1bm02UVdqRUY4QVhaRG9R?=
 =?utf-8?B?Y0d5SWJiRGhQQWwwTWM3RlpFZE9yRmVId1ZLT3ZsWUFyLy9kb3V6eURqa0xj?=
 =?utf-8?B?RWU0NTRqQldDem5yQTdiKzZjNEFORk1RR1IyRllWNU9ZMCtLMXpjaGx5TVND?=
 =?utf-8?B?WmRHdHI2V2tZdndBUnFtcGNmNHdYUjRLM2VMczQ4RUhSVkdOeFlPanhnOWdO?=
 =?utf-8?B?aHl4T1kzWHUvUmJQb09nM01qRVlzdG90NzJGN09MR3R6OEhpUmw1SEFqb1Bp?=
 =?utf-8?B?NHpreHFpdDZhaXNnaFhRd1ljWUcrRm5KOWM3NE5xUW44eFN4ZUdUalRQTWNl?=
 =?utf-8?B?WTFSVGFDR2tXUTBxczlCMndkKzlOZFNFNlA0Z1VteUd0ODZlRDFpbTV2NWxX?=
 =?utf-8?B?ZlhFY0l1MEFCakhycXZrc0VKNlN4TXVhcEZwVzN3WTNkcmUvcFlTeXhLQTFq?=
 =?utf-8?B?MUtseUJoaTZzSTV3dnFEUkNVbXh6SE1UUnhpMzFRNC9JSEIwVDNUZmt5VkNs?=
 =?utf-8?B?ZVc5TitXWXhZUjNuNmZzSU9FMmp2YitEeU9IYmFHK2ZhUG1HQ1ozOHRTdTk0?=
 =?utf-8?B?dHVYMUlzQXhkNTREZlF2RzQ0d3QvaUpudkYrYjdxUk5RR2RhZDBrV0lIOWk1?=
 =?utf-8?B?clNESVk1dDlGWVJLNFZONkx2cTBlUE5DZnU4bDMxbHFvQWxkUjR0S1RPTnd3?=
 =?utf-8?B?MHJvb2E4M1BmVFJSNks2b01uYTQ1VDlIL0pTUVB4YlJBMURLb1FhNG84dEN2?=
 =?utf-8?B?bHc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2cc69af-a62f-4e8b-8cac-08da68c8d2ff
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 14:21:37.0775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUrOt/gJZT8l1XNNwzW+WrUUhAC2y6xxLUwSfXXv2sOskCQLnzGQkAyoRZLJxmnjUfR0S4lBK65KeT5uUJm88K0vlI23f3g2oo4i49dcu3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4013
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_13,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207180062
X-Proofpoint-ORIG-GUID: k2dzFvWC4NtnZ6GJCRp53cdGJFKTPjUQ
X-Proofpoint-GUID: k2dzFvWC4NtnZ6GJCRp53cdGJFKTPjUQ
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



On 7/18/22 14:56, Igor Mammedov wrote:
> On Mon, 18 Jul 2022 15:16:22 +0200
> Igor Mammedov <imammedo@redhat.com> wrote:
> 
>> On Fri, 15 Jul 2022 18:16:26 +0100
>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>
>>> Calculate max *used* GPA against the CPU maximum possible address
>>> and error out if the former surprasses the latter. This ensures
>>> max used GPA is reacheable by configured phys-bits. Default phys-bits
>>> on Qemu is TCG_PHYS_ADDR_BITS (40) which is enough for the CPU to
>>> address 1Tb (0xff ffff ffff) or 1010G (0xfc ffff ffff) in AMD hosts
>>> with IOMMU.
>>>
>>> This is preparation for AMD guests with >1010G, where it will want relocate
>>> ram-above-4g to be after 1Tb instead of 4G.
>>>
>>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>  
>>
>> Acked-by: Igor Mammedov <imammedo@redhat.com>
> [...]
> 
>>> +    return pc_pci_hole64_start() + pci_hole64_size - 1;
> 
> off by 1?
> 

If you add a size to a start of range, you get past the end, not
the actual end address. And given that we are supposed to return the
end address ... or am I seeing a non issue here?

[Also this was new in v8 predecessor patches didn't have it.]

>>> +}
>>> +
> [...]
> 

