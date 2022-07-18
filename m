Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 831F657850A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:13:47 +0200 (CEST)
Received: from localhost ([::1]:34370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRVK-0008Hy-DU
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDRAI-0004DR-KZ
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:52:02 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oDRAG-0002LC-2P
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:52:02 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IDZbsJ024696;
 Mon, 18 Jul 2022 13:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=cw4NYuiZhA9HBXe8gjXAFDa4AH8OcREqMReQ+LJ0IeY=;
 b=GnWq+NIFJ7HIzJNzbEp71pRoOKQpwL36tfJCQfKxAe1/zYNb+L+20+bJG9anr1ASQCCv
 QSEDYyRmaVI3X+dNdhW7zP08m/hfGh0Zan5/9dJ6ChBcqZa4cHjjNNw8asjsFTUQG20b
 3WAYOgR2mCnhcPrTmY3Aph7DCLsN/+B0s7kBYWQ4H6jA5I2H24NlfrHagfJj6+cxbyLc
 DhnL8fKBRykyMl9oKxcGw0jjgxuhYOzCkhdjskgatacz52osJaV9E99RRx05LW1ScoNk
 3mUcydl8kBpBlubkpYkSEcFH/VtyGId1J36jL36eV8T1qIikV87dH+a62Yh0vG7IHJLs hA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbkrc3b3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jul 2022 13:51:49 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 26ICZ9Lq007376; Mon, 18 Jul 2022 13:51:47 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hc1gfk9vs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Jul 2022 13:51:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkZ1dLZwC154a9QphmsTwr8qzufiFWlLvgRj4tNFOMCxcf79YKKDmFecfNn10OTcsl3wn9EpoUe6uZOfpxWMirAPTKKFdga2UdinvooWaRG1HT7WJEvN1uDusOvYHTNC1sE0hFeuL9fiOTGiBuxyW/jGmUJlLaiEvjYjZCLfe6Mz524LVoXDVhCWZiMo387lLKF0IGHEhjFlZeSBS5OHQ+EHGbLuthO02L+Bj8t/868PP3tpHqJTRlhYhEqHROVfZuMc9wMDqmckGuRoO2pLoT2O5XtnSua4l0dNM4+U6cbyoHmv7TvfLWInGX3C3YCZT+iS1qla3UiVuE3lDri2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cw4NYuiZhA9HBXe8gjXAFDa4AH8OcREqMReQ+LJ0IeY=;
 b=MU1PHtGJfBIaHxoLZv7HbU/9mVdEPgbdWQvLULQRJUiz+XOPOgxC+TijVfFPyOZ52MPT5d9GQZet4AwMHdM3XXDrzXve0amEQjJ7rQ1JgkVG+7wQFi5UcPcPPjpQrXenvrdKfIwOwfSrpp7Lzp2F4G9jfaU6QvqEN0rHS3XWkbHtNOmgplYrvI/okPpUlbxSTL9+7+5dmdD6jZCPXxjxE4uput6h9oXO6j/nprflHa2/LLD/Fa612+D3aaaig5WLXZ1XzWAyRuqV42i0Uwl+Com3wML7eXpGnYBi/YkwHN2s2VkxEhGDsCTQKnuzX+OPowBl7EY6/z6hJwiueOtOQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cw4NYuiZhA9HBXe8gjXAFDa4AH8OcREqMReQ+LJ0IeY=;
 b=iDqkAdQoYk/p1H05QQDjG73hmnDo5rhBb21ecsRL0bFrbpD6I7UQB5D1SyRJE5H39+bpSfrT7SFam7oIOUnRLtVGfAMgKGD/7mcgSGYbhA7Ytdy2kS0iblhNmiwpwFGXFMHCQlupUBMzVSJrNQmdW5KSSySRgE8RUfhitoT108g=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM6PR10MB3177.namprd10.prod.outlook.com (2603:10b6:5:1a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Mon, 18 Jul
 2022 13:51:44 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%8]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 13:51:41 +0000
Message-ID: <4c86333d-fa8b-2001-0fae-a872378579b6@oracle.com>
Date: Mon, 18 Jul 2022 14:51:35 +0100
Subject: Re: [PATCH v8 06/11] i386/pc: factor out cxl range start to helper
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
 <20220715171628.21437-7-joao.m.martins@oracle.com>
 <20220718145233.0b2bdeb8@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220718145233.0b2bdeb8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0043.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::31) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 291d7484-2ba5-413b-08da-08da68c4a4f3
X-MS-TrafficTypeDiagnostic: DM6PR10MB3177:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +WLsL0dRrsrvH94R/rP1yo0EHhxaHFtCgtWNshtTZUWfZv2pmz6aQvSBL2Eywo2HZACqJwgaZm5RvVkJTrP7Bv+yJz9KxmbaxH4OTxjjlV6pYWqDW/qpBzH9hRadVNGGbOcn0F6mCVNAAFKAWotLmDZdnWKSNhWoMM1gOVSiNJSTNk3f7ek1M3qcLcisWsAR1NjjuukJ4ECTmUGHmYohi8RP1gEjnu6x+cARP0Ts6Q1vGI9354pkZFxYg0G98tlTmUaEeTDwdDNzLur113zmRXjJ+RF/BnITGRA8yoZ71sIhggsOZxtnHS+VESIgGW3HBpW7yZ0Dp1WhBVo8JKEDu3mHQwwYi5Pfsp9zbSYxxWAUjzASytHLP6jVVR/7fOmK/SuUCsj1rGAcbhxa/0Oy/hi5jnbmZFO1VczXsIKyUn5vcZvvjfeVeHuuDfnDPqQBs28evnCXVv0V/VW3/GgrRl7M39+3sALSD3WIqzTF13MgQcf4C2nH7zt7ywcfUvYK00F5DfQtwqeeIrXWgJv5emM7WB6HQpIcHehFv7Qeer5Zj1qOdTXThWZUEbi0ndEJhpkYElhpNRdBU9KlFvqHJPC9hiDy8fHqzqso5SSGK86fu4WVjNu30wctH8/1qyclzopiHIZWvRqkIkVvysGELy2g1RIvQO7lA26YYFw14thmhOuAQyZsBD2dVQtSBPkQeB9vYm7393BfIB7+G+v5NL5JqKmuJD6egbZYgrzprg7aYoARaeB80C0zpOd2Glve7uPd8Xy5SC5vrvB7k9Vo/Cg//Qr83lZgx2mAVX+VOx672TT8hBWDP9IAbM/E07s7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(39860400002)(136003)(396003)(346002)(8936002)(86362001)(66556008)(4326008)(66946007)(66476007)(31696002)(8676002)(316002)(6916009)(6506007)(54906003)(53546011)(38100700002)(36756003)(31686004)(83380400001)(6512007)(6666004)(26005)(41300700001)(2616005)(186003)(478600001)(6486002)(5660300002)(7416002)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjR6VUVlKzZDdi9XdzR2a0lCZmlsbWg2MERYdGdtU2U1TzdUb0lXR1FHcGJi?=
 =?utf-8?B?Z3lhTXR3ZDE2WUVaaEljLzFyV2lNdHpPS1NNaGxGNm8wZUZOWGQ3Z0crRkta?=
 =?utf-8?B?dWtSdnFGSWpvR1phOUN6MHQvV2xYWjZnL3ErOVlTeHZqZnJuRDFYTW03YVMy?=
 =?utf-8?B?WWVoTjJYeVJlZEpIZGhWaDVudVdZV0Y5Y1JRT3RnTXdSa1dwbE4ydjlDMndq?=
 =?utf-8?B?NkNNVS9RcHhNOWNNVFBLQWhRemxIdUkvNDN3VEFiSTdnRWtvalZ0NmwzVzAy?=
 =?utf-8?B?QzlxdmJxdWdzaExzdktqL041ZXkrS3BXOTZSYXVVUVlMdmUwSEdOY3lrZExi?=
 =?utf-8?B?em14Q0wrdjBBeGVqRThGUFpUUERydzJ5eUU5TXhKWUJ5T2FLR1pJRERlOEdO?=
 =?utf-8?B?QjZBMU5IcWpKL1ZZdjM3dzZRbXpwV1RkR09GdDhUWGtCOTBRb2VmRGFHcjFW?=
 =?utf-8?B?NkZGcXpyaFhPbHJrcHNVY0cwN1IwMGs5WFpleGVOOTAwbjAyMkRNMTQzK09O?=
 =?utf-8?B?NWVUTEhHeDF1UFVacGFiU1o3Q1pGMGlUMmFVSUF1Q1JvZVBGdklNNGhPSUpN?=
 =?utf-8?B?L2I2SmNFUnBkcmduTzQvaFFVREtHV3c5ME5iY0RJWno5dG13eE03SHJ1LzFP?=
 =?utf-8?B?WVljSnAxNU5JZURnemw0U0xiWHhYRDVLWVZwaG05bmJpSFozVmlVbmNSWHls?=
 =?utf-8?B?Z3UyMDhMS2c2RFZHTmNhMFNQN21TaXN3bTdKckFuRFkzdXhPUXo4c2lZVUxD?=
 =?utf-8?B?aTA0VWVtZVAzMG5SNzFsN3ExYVROUFRuanlYVi9LdzI4cmN2dHRDTDRsWFJw?=
 =?utf-8?B?S0tOejVOcC9VVm1xZkUwa0hBRmNJRlNVY1ZsN0oybjNONjYxdUNWZmJvbFlv?=
 =?utf-8?B?N1VXMVZZU3pYQVlnOFVBY1pEdFU0VWl1dGc2cFRsV0E2UGdSVzVsaW9iZGM3?=
 =?utf-8?B?SG5GcDJXelJpYVdPTFFJL3ZYcXF5YjlQbWFQRU52WHl5a09kL1gzNmEwbDZZ?=
 =?utf-8?B?dkE1enkrZG5TMW9UcktUZ1UxdnRmOEkxTFUxYWRSTXoyL2grSGNMVW9OS3cw?=
 =?utf-8?B?ZUVQRm42OXRsMS93NVBFYmE1T1c0NHB2cEdqd2tmWE9tRUhkNUNGWmpDOVVH?=
 =?utf-8?B?SDMwTWN5RXVodHFEclNSNE8wZFlCZ0hCSlhxNURweHJMcStHY2l6YVNob2F0?=
 =?utf-8?B?ODdOeXZ0UGg2S2VvcVNLR3FzTm1EalRmeFlzaGh5MXlmbUFGbVdpbHErODdo?=
 =?utf-8?B?d3Q5UGxUUE1HV0lJc3I3NFUrOWNRSWpSTmRqYzlOeXlHbkJSVEpjN3VGWXho?=
 =?utf-8?B?dHVXN3ZabDhNZG44NG5wWFJmaGZhalhYY1Z5TVZyaklwYVl3N0g3R1BWc3Aw?=
 =?utf-8?B?L0hRTTRLN0dkU2ZqcDFnVkxBeVNyUXFqMktYeWZCSXNic2tOdEdBSkgyZTRO?=
 =?utf-8?B?dmszb1ZHbVpvNUFBYVpFeFIxUzdUd1JRYlBnRERpVHBIRTZnT1hnUjIzcWt5?=
 =?utf-8?B?SHhPQk9Ib0RSMWZDYnVrVnd4RHUrMkdRZE1tY3lpN3BnV3BySFRYV2tqSmlw?=
 =?utf-8?B?Q3FHZWNBd2QxbGErejVOaGFwQlR4VWg4WjNsUWhyQ0hSQmh1Z2hjbm5iT2Z6?=
 =?utf-8?B?YWV1NXZjNDFrL21kYWxRM0dOUllWcTltNDQ3SkZBbURnM3lFSUQ0K3BnUzYw?=
 =?utf-8?B?THlYU0JRcXo0RVJXTzQxU1ZobURTaVEvQmlDVEJrc0c2eXdReE56Ti80ZFJH?=
 =?utf-8?B?L3NwcEYwMURCWnhoam5GdW9DZEdUZGVPRVF5OFNQSWtUaGwyNmtHaEJXVkI0?=
 =?utf-8?B?alpub3c0dXp4RVZLditMK2p5YWJGQXZKVHNXZFIxOUhVbDJjTXltODJKMkIw?=
 =?utf-8?B?aUJpdUhidkppN3d0NFo1UjZOcng2ZzZadnEvMkxKa1BLSWdXdjhjdDdtTnFh?=
 =?utf-8?B?bm9qa1JDdXF5V2QvVmdPQ0NqYXo1eFRiZXh3WGM2MWtNV2Z6K0VZNDV2blNI?=
 =?utf-8?B?M3oxeEl5VXlRZ3VUcG5ZaEFKb0NQdzNoMDIzaWVJK1ZUK0FBcnE4b2VnM0l6?=
 =?utf-8?B?UlRyb1pVVngrSzUyWVFIZ0JmZE43WXozbFIraFZxY0pwaW14Ry92NFE2VVFI?=
 =?utf-8?B?MnFuVUN1UTcyQitLdnRZNFRPMTdPMVhKY2c2Kzl1Wm5LZk5iUTAxV0dkeHNu?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291d7484-2ba5-413b-08da-08da68c4a4f3
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 13:51:41.8803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CL16y9ADc2myBPzzDa571kQRixIVsNtN7pHaQyxbNkHPMwZ6gV+FZF4b4lLcHROtX/eXl3WkCGY6eZS2KzL5VoNcv+rvlb31n+XdLns49ZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3177
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_12,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207180060
X-Proofpoint-GUID: VZBq28ePjiLNSDjezVsh6CSnlMhtDSJC
X-Proofpoint-ORIG-GUID: VZBq28ePjiLNSDjezVsh6CSnlMhtDSJC
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

On 7/18/22 13:52, Igor Mammedov wrote:
> On Fri, 15 Jul 2022 18:16:23 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> Factor out the calculation of the base address of the memory region.
>> It will be used later on for the cxl range end counterpart calculation
>> and as well in pc_memory_init() CXL memory region initialization, thus
>> avoiding duplication.
>>
>> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> 
> Acked-by: Igor Mammedov <imammedo@redhat.com>
> 
Thanks!

> PS:
> see note below in case series respin
> 
>> ---
>>  hw/i386/pc.c | 26 +++++++++++++++++---------
>>  1 file changed, 17 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 1f42f194d7b7..3fdcab4bb4f3 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -825,6 +825,22 @@ static hwaddr pc_above_4g_end(PCMachineState *pcms)
>>      return x86ms->above_4g_mem_start + x86ms->above_4g_mem_size;
>>  }
>>  
>> +static uint64_t pc_get_cxl_range_start(PCMachineState *pcms)
>> +{
>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>> +    MachineState *machine = MACHINE(pcms);
>> +    hwaddr cxl_base;
>> +
>> +    if (pcmc->has_reserved_memory && machine->device_memory->base) {
>> +        cxl_base = machine->device_memory->base
>> +            + memory_region_size(&machine->device_memory->mr);
>> +    } else {
>> +        cxl_base = pc_above_4g_end(pcms);
>> +    }
>> +
>> +    return cxl_base;
>> +}
>> +
>>  static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>>  {
>>      uint64_t start = 0;
>> @@ -946,15 +962,7 @@ void pc_memory_init(PCMachineState *pcms,
>>          MemoryRegion *mr = &pcms->cxl_devices_state.host_mr;
>>          hwaddr cxl_size = MiB;
>>  
>> -        if (pcmc->has_reserved_memory && machine->device_memory->base) {
>> -            cxl_base = machine->device_memory->base
>> -                + memory_region_size(&machine->device_memory->mr);
> 
>> -        } else if (pcms->sgx_epc.size != 0) {
>> -            cxl_base = sgx_epc_above_4g_end(&pcms->sgx_epc);
>> -        } else {
> shouldn't be this hunk be a part of 4/11?
> (otherwise it looks like it's been dropped by mistake)

It is a mistake :/ in v8 I must have forgot to delete those 2 lines upon conflict
resolution.

> end result is fine as pc_above_4g_end() already has this hunk (hence Ack)
> 
Let me fix that for the next respin.

>> -            cxl_base = pc_above_4g_end(pcms);
>> -        }
>> -
>> +        cxl_base = pc_get_cxl_range_start(pcms);
>>          e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
>>          memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
>>          memory_region_add_subregion(system_memory, cxl_base, mr);
> 

