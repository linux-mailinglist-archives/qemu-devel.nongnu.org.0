Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376406ACE42
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 20:40:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZGgK-0001fM-07; Mon, 06 Mar 2023 14:39:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZGgG-0001f7-Ot
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:39:32 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZGgE-00029H-At
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:39:32 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326HTK6r012926; Mon, 6 Mar 2023 19:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=5RCuBxcQlbZlok8zMhnTYzbHCoZp5lnjSuvfvg9T5BE=;
 b=H9ztGhuIayNKPxVuiqb/unpFbQM4o+BAFUJgqs1EtK0IIp8vKuogkciTdxsxiVmYND+f
 cxHHlI2AnWqaqKWQd37rqKattbc2p5RIuK44u59qAQKPEWdPTQBkx5WoZjLqy1edayPY
 4JUEiqdyEKei6HztQz0IovQ/pivuaz5ij2I0P04l0zpYnBAAt5O0hN6MoGL2FPTDqvT3
 0SZ+gLuCnN/eqxhnqZTpue41LsuEZBT4P9/Zt7vKc8HuPgVUj7E0zXUhzPTELnWMOFGK
 Wxqf9KeCxXuCWOlbe0I884bdcwsvGACS/Y+OfOMhMe5t5KCyyrgiMrbJ0IiJjnZ2Gk79 Fg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p418xutd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 19:39:27 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 326IFess025835; Mon, 6 Mar 2023 19:39:26 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4tthxhce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 19:39:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXpapK9KZldJWJQEOzGbrYFbJgKr7vtIx6dVkNYUUkV751+BTBLe6/0xsAmqPrx9k6bRtNpnRAxiL0acms0MnNB1VrY7ZkXKCZm0dr9gY6SElGsFZ8bI5GcMlytf0M7dZ8NYLOjrQe7KkUnRZ6XOgAcOdYbRcO7qi1Xf46+0U0IcQKpWXbUdZMrHhgKAQseCIqzHxi/Mj1PBdMHTqgefUQZE9VagtBjbr3qtpifvQYyKrUQgs36DAIPPuhVUXOFch0K27T0NuKt3fhzaUvSrP9Sl+RMI25Na/R+nfJslyM5zx+UClu2KUrzPrkH3ZNFflHxMCgXnqi7gK/K/pAZOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RCuBxcQlbZlok8zMhnTYzbHCoZp5lnjSuvfvg9T5BE=;
 b=VYYAIq2nnCNniQhRmXWwofyZZkztSEr3JiyhbERQAx2gxzEqviez1SkzX5WXDRBKvL/OlOA/biqFjjj7Tc2bHvJhvo9Md+nsu9J68iUTNl4BVno3+Jwc71gOFgBagoXZGYg3nWo2jRgxjmyxiAAUI9bi/52Oa9sQU3C4O82CGKC/6jrDlT5e7FZOxFUY/KuTclPlOYtWC3vqPCImIuGW5/j0jVy5/s1cel5N0BehpiUK7xLMHjCXN1w7Kfm7FPGdOoSWqeODDWnej81cMelsh69C+mJcaKKXtABUHDb5ie0McQoxtUypw8FSYnJP8eTV5CKV5u7NSKu0toQo2EyLJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RCuBxcQlbZlok8zMhnTYzbHCoZp5lnjSuvfvg9T5BE=;
 b=pAK4K71fM+PCI3jW91ERQOiY5PVhJbXbETvXL7aFHeXp26cHPVvqtyJ9wtAXaJJfttDOss+p8AzzNLr2jXOiK7upcCMWz/m/n+U/b4ftsf3sXC+BPj8SWqV/Mb8wasSwv36f9SGSt5rAbdEaFcxhdNTQM9LgSFJWWrOPDQFI5ss=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by DM4PR10MB6768.namprd10.prod.outlook.com (2603:10b6:8:10c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:39:23 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 19:39:23 +0000
Message-ID: <6b716cb6-2b75-bf6e-bb8b-907fd17e8040@oracle.com>
Date: Mon, 6 Mar 2023 19:39:15 +0000
Subject: Re: [PATCH v3 08/13] vfio/common: Add device dirty page tracking
 start/stop
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-9-joao.m.martins@oracle.com>
 <20230306114228.722419ea.alex.williamson@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20230306114228.722419ea.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0031.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::6) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|DM4PR10MB6768:EE_
X-MS-Office365-Filtering-Correlation-Id: 7103d932-9003-4c66-5650-08db1e7a7c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZfdG/Qi1TUIfaaW6tZPkfKtyIZq2XOMoouxQ4WkY7KbMpXm26bVbpIFy8n1Qq+rNtxgV8XCDOgt5lY7B1boU7aJyAhNsyFEDCYIly2dFODGGXIGTXPm0VNQN+dUdDTPCgOdGQ5PjCLkKR2vvDW70P1vA3Lyz47+9saql4h33lNTwK4rpXvOJSNJcm7Q3W/vjr+B0+M9RMNldAFp1RChaeLz1/g7D0oZE6ogy1PiP19B6pg0j8x2WhvP+VVZdrIbtASAzYvZJuxKzEuzmsLGG4LVR8IFhAm2xLErz0S5/8G39CwHfSCvYC02BVR8uH+S/Pisw7ArB3Z+sYdS2/tudFlurLWyW3o1wjRWYiz/7fxJgVIJNBSkfUPALwXfU1pOwAChQmOJb8PUMfwkTCqYR27Mg2PmX07uHZGmBqocCJ3qj8OAKBeqPh/EXPXft0YBkqbDg+kJ69bbZ0S6R51D38D0TO8bp5fuvXGfj4hmjKobU5pwQremQmoSUmVcl2JT4lgqsI5E2KbDZ8wPNFc4of1bTSzGMxZBjGcedk8zeRHbZ+X2KyTp0AGHE2usfIz1DSFlvk6lVctr4/RSCLjaSieZA+1l88OGgR2DXd0nPAuuhkj06AYjfsU2Fi3HURplojvjaoXt3MKpWBvWC/nIfPZV7dcxppwDtU4sf+lbMbZThLFrY6afqAEaIu4JTciKW9Mdh5B+4zougeZsadfw8PLZ0pmC9HXsfW9IJ0IPPbxIGMh4fH9Djqrv7bNYEXAYs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199018)(31686004)(478600001)(83380400001)(316002)(54906003)(36756003)(6916009)(4326008)(38100700002)(8676002)(6512007)(53546011)(6506007)(186003)(6666004)(6486002)(26005)(2616005)(2906002)(66476007)(86362001)(66946007)(31696002)(66556008)(8936002)(41300700001)(5660300002)(14143004)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTJDd1VQVWRBbVRyZk9DcENOL1VGZENhUk9Lck9DT0lHajVDOXVEb0E3L00y?=
 =?utf-8?B?S3ZUMERQM1RkYS9tNi9xMnFOTUovSCtYM2FxbC81UE52OXE5Q09pcmtWUkJB?=
 =?utf-8?B?Q2c3V01EYjREUk8ya2hjNmt6Ri9rbGlzZldZcXNWblRYek5KUkpvakpiY1cy?=
 =?utf-8?B?YWhUWCt2TFRUYnBEYmVhZUh1L0JzcUNDUVVyQ1JlenprMG5DZGhJZndtQTZj?=
 =?utf-8?B?dDNnVDMwUU53OHdEVjFwamRQUzFiTHg5bjBMZnpBMWRocHFKOW5KZGhZU1Zs?=
 =?utf-8?B?RmNZNFZBMXQ2cWgwY2pVRm8zaGVJS0szYS9JUmtqZlorbU1wVFZRbzAwYlRs?=
 =?utf-8?B?RXo0bkVRZ2Z5akdoR2dTZ21Qd011bmZ6TlcyL3lkMmdtQzYwWUV0dUFLNGVQ?=
 =?utf-8?B?cEdLV29tbWltVDZ3Z1pkZTZaU2c2UStsUXRBUlBoZ1dnMnorRVRvZlB2VGxB?=
 =?utf-8?B?ZTNKdWxFV3IxTmpRY1hGTndLeDJmbFhGejJ5aW5zeVc0M0JTUkQ2SytmUkhX?=
 =?utf-8?B?UHZRckVRNTd5YUFCRnhUZWFTYzJibEpEbGFrcmwrcGE3a2pVbi9iaVRVMXpw?=
 =?utf-8?B?R0ovSDQwNTNoTUxGa29sRjVnTkhzNFpPMWoxUmxTSDRrVjB1azZ3aThHQ3My?=
 =?utf-8?B?K0tORjhUQTN3enlFNlhicXZqeWpVK0RGcERmRElNY0ZZOUlpbngzY3pPbFls?=
 =?utf-8?B?bGViTHJIUmtsYy9udEE0YUVlbE1kaHRERGFDVjNiaDY3SjVDK3pTY090MXNj?=
 =?utf-8?B?dzAyZUlMQzBVWTF3YlA4NlI3ZVZGS0JxeXkxOGFqUXd3QmVRSlpaeE1GbXJq?=
 =?utf-8?B?RXJlNG13eWJKN0hpaWl4VFhZMzJ4T3EvREhEcTRRUzc1SDhUeFAybGpPV0Nz?=
 =?utf-8?B?a3pZT2t5Q3B5SUc5ay9LMWtscGszb2NiM0tRQUM0R1QvN01xS0tlVW5NUnJM?=
 =?utf-8?B?VzhPNDNvdkhGYzk2VG5VdnM3MzlsWEFCczZVcnFiNWtGbGt2dmxuRUp4Mld5?=
 =?utf-8?B?WEQvcE4wendpYXl2MFFxVlVZRW5wWU5kekpKU0lXZE40Q2NIczdSWkVMajF2?=
 =?utf-8?B?MFhEK2ZIelpKMzYvWWVvRkpCNDR4b2tGMU5qWm1xeERkWVdiQk9EMS8xTUhm?=
 =?utf-8?B?QmpwZ01RZHphYjNnNVpEY05SN3Y1bDQzMWJKSG5CaVQ2NEs1aTdNclVIeHVH?=
 =?utf-8?B?NitVWU5SaHVkWXNQclYxa2tiR1NKUS9TZTMzMDkySkFEZTFRL2NkVUJibGgr?=
 =?utf-8?B?LzFNUFhwNGhrUzJlOExKeWcxdmg4cVRBVWprSVlDcit1TXJOUFE3QnJVM3lU?=
 =?utf-8?B?aktSV0dTRHJ6cmdCK3dYNXhwMXpSb1NRMXhhRG80Ky9ZR25rKzNuS3FmaGtT?=
 =?utf-8?B?WlhGeHdlSVRwNU40Y05sMThQYmlsM3FmSFkzV1MyVjZvKzJLM3IrYkZLdFMx?=
 =?utf-8?B?azBSOUswOGtKdHRhNW1aOTZ1SCtncDZtaFlkcE54QUs3aWxBY3ZnelRGc1hG?=
 =?utf-8?B?dUNCb3hmdjJuQisyTEhXaWszZS9UVnpGVko4VmJmdUpIaVhqd1hWaUNidTFo?=
 =?utf-8?B?VkFaMWJNS0xvdTU4L3p5WUcwclVnb3NMQkFPSVpSYlVpTDk1bEJGM0VzTVBx?=
 =?utf-8?B?czhDUnpUV3JhU2JxdFhtNjVleTNJTVMvVEFZSGFBNkxNTWJNL0kzNVJYYWFt?=
 =?utf-8?B?ODVMQ2ZXMWU2OFdyVjVOVnlCQ1BPWnNXK3ZzbnNvZFF1M3ZieUs1WFFYaGQy?=
 =?utf-8?B?VWxMMjl4SXdzQmZkVFlnZWdmMmFIc1R6Q3ZqVDBmcnlvcUlEamwrekk5dHhW?=
 =?utf-8?B?aWhGd003aktmZW00ZEFmWVNBOXhET045Q2dKWldoaGZjb2dnNzB2aE1LanRt?=
 =?utf-8?B?VUdPbWtkQng3ZTZMRUNiRmQ2cGhicFJ0YUpUSUZIRmk4bGtPSDBwcE5RQjNT?=
 =?utf-8?B?TmNaMzcvbHlqcUFLTm44aXZVa05hYU8xZ1JLQ213WXBROW94RXYyYXcvaEMz?=
 =?utf-8?B?TjA1VG03eHJQUElqNnRML3NyWHozMXY3Y3NvNlpDNU5xZ2o4UWM0RjI5MVlH?=
 =?utf-8?B?cE1FK3dPTDlaKytQREh5SzVJdFkyM200MTRlNUp2RDdWdmptOWIrQklBSWZv?=
 =?utf-8?B?OTIyMll2TW9LdytCREduMU95clM2b1RnNXAyTGZSTkhqK0ZTSkhPMFh6d2pz?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: lYCh8SY+JN01+PrlKt0z08IL5VTgkk/iKgdfOL8Qmn7xm0iRvuWf1ZjYvamuXuDREJe195jnR7hz7TlGsa6O29IrdVMzNELUyMtgLOELQlYFHIEeNCc4WVVzMssNAUwfsHTCBrkUEwVtGkxgL1evzz4ZtthSKknq6nJssWViZIqmQJnvpIeaYbhsqXCR/rbr05+ks6Eo20LkmpX8IijEHg5Bg3DWqdcRDi1WXRkvi+13NgZfjNWXXFjIzZA4eke+TRezUwpAm/1R5ffgFePXwfn3PNwXCdpxPJgFS21i8OLFDUnUNn/UkcQg4yXbRL1qV3nM9Bk1oT97OLNd6SXrgS6hChcVVXS6Cju3ElgIcRXefo2R+SxKPa+How+UChJaTZMaTJfFVsStcBgNZanCGcS4fiCT69PV9A9qg3g03yctIUXD1r0+hQAFox81Pl02/vjXkFVbYNOXgYZ18NpI3MWA7rNFIKxzbzwEPKdgVkcvcNAsPzwkaUjiFYAv8SBFltc2Lduas6n08nCkLzVC6EFB3gipDspIepAK03GxoWJJ9oOrWvoamB0Dca7m3c7l3LgZ10M/xAeeWqSihWudocu3Ud6JE/+WmlWxs1oR30NptTfND+uwVDUTymIFunuyx3w1V2whSm7IroasqYflK6rWz38xbupqIhizsztcf3yd4stFW6ZMq3DTPXFIAiyKtaRNSvQTHbe1iqEslGjTGv5yP4wjdluUtoVc4ib+8puiSKcklfEIrtSycTqwlojGv5ur9LfuLoVv9DMqiA9eN94M3cwXKFetQ8Z1Gm8Bv1oGkbYD8mtTdxuGjY/FcpLD
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7103d932-9003-4c66-5650-08db1e7a7c98
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:39:23.0602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TveZXyzrIhLVRDLAsrz1iXZZa/gWGRoiHqLF45mluSnnKTgi75mkXQs0KJ6Bulz9gmMn8BN5vOwzjYxdjhOrItBdja01FHwoMScFlghI3kY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6768
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_12,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060171
X-Proofpoint-GUID: 9oiwR5y-O-qgWguoQtbWrDBiy-HHYfPu
X-Proofpoint-ORIG-GUID: 9oiwR5y-O-qgWguoQtbWrDBiy-HHYfPu
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

On 06/03/2023 18:42, Alex Williamson wrote:
> On Sat,  4 Mar 2023 01:43:38 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> Add device dirty page tracking start/stop functionality. This uses the
>> device DMA logging uAPI to start and stop dirty page tracking by device.
>>
>> Device dirty page tracking is used only if all devices within a
>> container support device dirty page tracking.
>>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/vfio/common.c              | 166 +++++++++++++++++++++++++++++++++-
>>  hw/vfio/trace-events          |   1 +
>>  include/hw/vfio/vfio-common.h |   2 +
>>  3 files changed, 166 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index d84e5fd86bb4..aa0df0604704 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -453,6 +453,22 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>>      return true;
>>  }
>>  
>> +static bool vfio_devices_all_device_dirty_tracking(VFIOContainer *container)
>> +{
>> +    VFIOGroup *group;
>> +    VFIODevice *vbasedev;
>> +
>> +    QLIST_FOREACH(group, &container->group_list, container_next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            if (!vbasedev->dirty_pages_supported) {
>> +                return false;
>> +            }
>> +        }
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>  /*
>>   * Check if all VFIO devices are running and migration is active, which is
>>   * essentially equivalent to the migration being in pre-copy phase.
>> @@ -1395,15 +1411,152 @@ static void vfio_dirty_tracking_init(VFIOContainer *container)
>>      qemu_mutex_destroy(&container->tracking_mutex);
>>  }
>>  
>> +static int vfio_devices_dma_logging_set(VFIOContainer *container,
>> +                                        struct vfio_device_feature *feature)
>> +{
>> +    bool status = (feature->flags & VFIO_DEVICE_FEATURE_MASK) ==
>> +                  VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
>> +    VFIODevice *vbasedev;
>> +    VFIOGroup *group;
>> +    int ret = 0;
>> +
>> +    QLIST_FOREACH(group, &container->group_list, container_next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            if (vbasedev->dirty_tracking == status) {
>> +                continue;
>> +            }
>> +
>> +            ret = ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
>> +            if (ret) {
>> +                ret = -errno;
>> +                error_report("%s: Failed to set DMA logging %s, err %d (%s)",
>> +                             vbasedev->name, status ? "start" : "stop", ret,
>> +                             strerror(errno));
>> +                goto out;
>> +            }
> 
> Exiting and returning an error on the first failure when starting dirty
> tracking makes sense.  Does that behavior still make sense for the stop
> path?  Maybe since we only support a single device it doesn't really
> matter, but this needs to be revisited for multiple devices.  Thanks,
> 

How about I test for @status and exit earlier based on that?
(maybe variable should be renamed too) e.g.

if (ret) {
  ret = -errno;
  error_report("%s: Failed to set DMA logging %s, err %d (%s)",
               vbasedev->name, status ? "start" : "stop", ret,
               strerror(errno))
  if (status) {
      goto out;
  }
}

> Alex
> 
>> +            vbasedev->dirty_tracking = status;
>> +        }
>> +    }
>> +
>> +out:
>> +    return ret;
>> +}
>> +
>> +static int vfio_devices_dma_logging_stop(VFIOContainer *container)
>> +{
>> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature),
>> +                              sizeof(uint64_t))] = {};
>> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
>> +
>> +    feature->argsz = sizeof(buf);
>> +    feature->flags = VFIO_DEVICE_FEATURE_SET;
>> +    feature->flags |= VFIO_DEVICE_FEATURE_DMA_LOGGING_STOP;
>> +
>> +    return vfio_devices_dma_logging_set(container, feature);
>> +}
>> +
>> +static struct vfio_device_feature *
>> +vfio_device_feature_dma_logging_start_create(VFIOContainer *container)
>> +{
>> +    struct vfio_device_feature *feature;
>> +    size_t feature_size;
>> +    struct vfio_device_feature_dma_logging_control *control;
>> +    struct vfio_device_feature_dma_logging_range *ranges;
>> +    VFIODirtyTrackingRange *tracking = &container->tracking_range;
>> +
>> +    feature_size = sizeof(struct vfio_device_feature) +
>> +                   sizeof(struct vfio_device_feature_dma_logging_control);
>> +    feature = g_try_malloc0(feature_size);
>> +    if (!feature) {
>> +        errno = ENOMEM;
>> +        return NULL;
>> +    }
>> +    feature->argsz = feature_size;
>> +    feature->flags = VFIO_DEVICE_FEATURE_SET;
>> +    feature->flags |= VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
>> +
>> +    control = (struct vfio_device_feature_dma_logging_control *)feature->data;
>> +    control->page_size = qemu_real_host_page_size();
>> +
>> +    /*
>> +     * DMA logging uAPI guarantees to support at least a number of ranges that
>> +     * fits into a single host kernel base page.
>> +     */
>> +    control->num_ranges = !!tracking->max32 + !!tracking->max64;
>> +    ranges = g_try_new0(struct vfio_device_feature_dma_logging_range,
>> +                        control->num_ranges);
>> +    if (!ranges) {
>> +        g_free(feature);
>> +        errno = ENOMEM;
>> +
>> +        return NULL;
>> +    }
>> +
>> +    control->ranges = (__aligned_u64)ranges;
>> +    if (tracking->max32) {
>> +        ranges->iova = tracking->min32;
>> +        ranges->length = (tracking->max32 - tracking->min32) + 1;
>> +        ranges++;
>> +    }
>> +    if (tracking->max64) {
>> +        ranges->iova = tracking->min64;
>> +        ranges->length = (tracking->max64 - tracking->min64) + 1;
>> +    }
>> +
>> +    trace_vfio_device_dirty_tracking_start(control->num_ranges,
>> +                                           tracking->min32, tracking->max32,
>> +                                           tracking->min64, tracking->max64);
>> +
>> +    return feature;
>> +}
>> +
>> +static void vfio_device_feature_dma_logging_start_destroy(
>> +    struct vfio_device_feature *feature)
>> +{
>> +    struct vfio_device_feature_dma_logging_control *control =
>> +        (struct vfio_device_feature_dma_logging_control *)feature->data;
>> +    struct vfio_device_feature_dma_logging_range *ranges =
>> +        (struct vfio_device_feature_dma_logging_range *)control->ranges;
>> +
>> +    g_free(ranges);
>> +    g_free(feature);
>> +}
>> +
>> +static int vfio_devices_dma_logging_start(VFIOContainer *container)
>> +{
>> +    struct vfio_device_feature *feature;
>> +    int ret = 0;
>> +
>> +    vfio_dirty_tracking_init(container);
>> +    feature = vfio_device_feature_dma_logging_start_create(container);
>> +    if (!feature) {
>> +        return -errno;
>> +    }
>> +
>> +    ret = vfio_devices_dma_logging_set(container, feature);
>> +    if (ret) {
>> +        vfio_devices_dma_logging_stop(container);
>> +    }
>> +
>> +    vfio_device_feature_dma_logging_start_destroy(feature);
>> +
>> +    return ret;
>> +}
>> +
>>  static void vfio_listener_log_global_start(MemoryListener *listener)
>>  {
>>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>      int ret;
>>  
>> -    vfio_dirty_tracking_init(container);
>> +    if (vfio_devices_all_device_dirty_tracking(container)) {
>> +        ret = vfio_devices_dma_logging_start(container);
>> +    } else {
>> +        ret = vfio_set_dirty_page_tracking(container, true);
>> +    }
>>  
>> -    ret = vfio_set_dirty_page_tracking(container, true);
>>      if (ret) {
>> +        error_report("vfio: Could not start dirty page tracking, err: %d (%s)",
>> +                     ret, strerror(-ret));
>>          vfio_set_migration_error(ret);
>>      }
>>  }
>> @@ -1413,8 +1566,15 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
>>      VFIOContainer *container = container_of(listener, VFIOContainer, listener);
>>      int ret;
>>  
>> -    ret = vfio_set_dirty_page_tracking(container, false);
>> +    if (vfio_devices_all_device_dirty_tracking(container)) {
>> +        ret = vfio_devices_dma_logging_stop(container);
>> +    } else {
>> +        ret = vfio_set_dirty_page_tracking(container, false);
>> +    }
>> +
>>      if (ret) {
>> +        error_report("vfio: Could not stop dirty page tracking, err: %d (%s)",
>> +                     ret, strerror(-ret));
>>          vfio_set_migration_error(ret);
>>      }
>>  }
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index d97a6de17921..7a7e0cfe5b23 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -105,6 +105,7 @@ vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t si
>>  vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
>>  vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64
>>  vfio_device_dirty_tracking_update(uint64_t start, uint64_t end, uint64_t min, uint64_t max) "section 0x%"PRIx64" - 0x%"PRIx64" -> update [0x%"PRIx64" - 0x%"PRIx64"]"
>> +vfio_device_dirty_tracking_start(int nr_ranges, uint64_t min32, uint64_t max32, uint64_t min64, uint64_t max64) "nr_ranges %d 32:[0x%"PRIx64" - 0x%"PRIx64"], 64:[0x%"PRIx64" - 0x%"PRIx64"]"
>>  vfio_disconnect_container(int fd) "close container->fd=%d"
>>  vfio_put_group(int fd) "close group->fd=%d"
>>  vfio_get_device(const char * name, unsigned int flags, unsigned int num_regions, unsigned int num_irqs) "Device %s flags: %u, regions: %u, irqs: %u"
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 96791add2719..1cbbccd91e11 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -154,6 +154,8 @@ typedef struct VFIODevice {
>>      VFIOMigration *migration;
>>      Error *migration_blocker;
>>      OnOffAuto pre_copy_dirty_page_tracking;
>> +    bool dirty_pages_supported;
>> +    bool dirty_tracking;
>>  } VFIODevice;
>>  
>>  struct VFIODeviceOps {
> 

