Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D897441C3F
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 15:08:00 +0100 (CET)
Received: from localhost ([::1]:35570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhXyg-0005zU-MD
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 10:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mhXxD-00059k-IL
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:06:27 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:20498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1mhXx9-0000Vn-Ma
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 10:06:27 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A1DRUF0014433; 
 Mon, 1 Nov 2021 14:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 from : subject : to : cc : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=cAp2mBgs10abStRSnWX06xjxlDkhJp8BUBKtUfbF2O8=;
 b=FPbg9d7y0qlSlOiEOTRJobXZgdlA1k9vhuLZut9VfWYRsipgnvRiQa4KE7tRf/OSvPDx
 VRN+paZfjvyOiLopIoBkFR9R9SGWFR9ofAjlT4N34h+bIwZ8an3rvCD2y0T4xNpBXsRe
 sxKVqbbFCZmWCMCVkP9N3Me7dOVGA4l6DaWvR0H6B+0AZbEYe5DETzt2QwZDhCiX5j5q
 nmL9NH376SX/qq34MnhO0lvra69rakXb4cnQq4lqFCOX57NrVPOX94f6KkGfe7utIofF
 X4IAPve8/EHuw+z4sDnd/VygF5OH9qr//j4uhCpFgsyp58dXBawGe2wfU/ZCGR+ygWa5 Ig== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c2aa39pev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Nov 2021 14:06:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A1E6D7H101981;
 Mon, 1 Nov 2021 14:06:16 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by userp3020.oracle.com with ESMTP id 3c1khrx4ea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 01 Nov 2021 14:06:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S38rb0lUtjYaEDBsxZvr8tmyY9ETdPvF/sSAjmEsUXaDEWHYaS5+5Pt3Ey0jctzImJ2JhS16WezHkb9WRWAI/ukmBooLnf9jkmqxJFqgTJ2F830klFYLdT3/PvaLfV+KZotxxxr7AgP1XJYKG+parzfv3nQMQTyROKygL2aauPGgbA26UYyMtO2ygpNcfJmBO+IYrHoPN9kf2Cf6Cb7Gwe/jDEByIse4ONI5ptrhge6zJtQLYZeIIynHe0HmcT68ZdIQO32bu3w6VzH3o+Pa0v3ggIJM8qUq92X6rmlpGeodpdcGdsl/Cq/IKiEaQCWSOPFP85FVeW2P/vfCWkPU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAp2mBgs10abStRSnWX06xjxlDkhJp8BUBKtUfbF2O8=;
 b=QcI6IYda8tZDXlRZvrDv5ksP1cleYCJ6S+vxYh3JV+IVH+/o8rsVNe8qiKSikgh7spNJgmfz44xXJjFUNwvE1AXxO6BykqnFLZVMNS+MTXI+eH7dNWox9tzbwou1ttXQL1a5PtNqYLxIWuI9GPBxZEr6KJVp5yH21CfR+MikbdugUZ8z92Kf+XF+nPHmw/zyiNRSImnNX7yr8SN1QI8sah6ls9erGi2/a+msFx4YC0b5Ba038sY9pMIlNMxfiAU55mIBm9RXpws011PyCrMG+GmCTgwY8rgmw9sekWlR5gvsy0kB6cjyIdn0SY7csvoDVBVN2H4XVZ+efgD4KUi1ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAp2mBgs10abStRSnWX06xjxlDkhJp8BUBKtUfbF2O8=;
 b=j175IAgNsd4AN0u537uNx0jIENFVggAxuGEhrJQkMWf3/zrG3yfaiLoK8L9DL8xej1lNEF/2bhhNjVykiM2Tuoduc2JOq3/ggQkx+wuppwQSCxK7+CzA66LaGpjbrvlKckugOx0smHsl6pg9lIP3/6B6OAvbcSrCq83JNdmel1k=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB2523.namprd10.prod.outlook.com (2603:10b6:5:b2::27) by
 DM6PR10MB4331.namprd10.prod.outlook.com (2603:10b6:5:222::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15; Mon, 1 Nov 2021 14:06:14 +0000
Received: from DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::6491:6cd2:c4d5:c1b7]) by DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::6491:6cd2:c4d5:c1b7%3]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 14:06:14 +0000
Message-ID: <57170d20-635b-95fd-171e-e84de0d2d84e@oracle.com>
Date: Mon, 1 Nov 2021 10:06:09 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
From: "Annie.li" <annie.li@oracle.com>
Subject: Failure of hot plugging secondary virtio_blk into q35 Windows 2019
Content-Language: en-US
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To DM6PR10MB2523.namprd10.prod.outlook.com
 (2603:10b6:5:b2::27)
MIME-Version: 1.0
Received: from [10.39.210.1] (138.3.201.1) by
 SA9PR11CA0005.namprd11.prod.outlook.com (2603:10b6:806:6e::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Mon, 1 Nov 2021 14:06:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef2386a0-9621-4969-6c04-08d99d40c3f3
X-MS-TrafficTypeDiagnostic: DM6PR10MB4331:
X-Microsoft-Antispam-PRVS: <DM6PR10MB433189617501BD3541FCF9AAE58A9@DM6PR10MB4331.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UWHp8y6gYi6BG9aQdmWMdiQ2n7lSwjsxotMDTbM7Eu27sRjaA3SS6kdbHq1YctkMKFLxZWz7lPh5VJU2Hfye7xOJSrPRxPoa5MpDlAtiPlpuB/8843z2m0MdEWm1qFRamsGY8VihvmEO7eq9pYW7ewNWRS7Y8jKrz5BGMyQGruZTQ+cg4wdgGXxHiiQDBb1YwK+1bzO3K2Cz53J8ked7yjYoGFdg5C2srVi3QLxwougkJFJMsPAtZpM5Q96ZCge2ZHkuLNzbJTQKVIS6/FvTLl2quR11tF8N4a4EvK7L+XrHR/iI9OhuHAaN/BaHNoTmt2CkbX5rj3My5NlfGmIU5pMTBeJQbrMn1FiU46dR0+4MB5U4xvVFV5gy+6VFazCR0KdumGiALIlrM037u9xI68ekeKfO9RFlXFkZY33qy1IUZtt8LzVu5rlyNWeEQ2el4fa6PF4fUPD2+bXECY4IjDOYSY6kBHW7aE8zSHiiOCW4DQ3okd9JXqq0u4yUn0ssEp7a0OnfWmZs825VdTVidq4oBmNjZux1WXOFQahfejmsO3N+FiPyHhtT/1idy2CaHF0e8nY0X8dx8ByLzUbIIaRZP9bJcQFwvgCa7Q2QTYX7WeFludmwlTpuOjym3VqyqCz0VaWYR/iW0zoL76tTT0vlvh8cZ14Ny1HI0Ry+VEl7RA/rtk/1jV3sMLjVv7oaTYPiRgExC+JnXabw4pn7KA6Be0xOIgJH8xF6ipnNXvaSZ6rW/IlbIdoq23vjIe+4cXjgcNH2FJvx9ybXbd9u4aK4syO1i36rTulQ4WfVH4lPwVYY8SNDjrtYFi9StROg92DvVpuSqDUFJ+ekcGHoJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2523.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(16576012)(316002)(6666004)(508600001)(83380400001)(966005)(956004)(6486002)(6916009)(2616005)(2906002)(86362001)(8936002)(66556008)(66476007)(5660300002)(8676002)(4326008)(66946007)(36756003)(31696002)(186003)(31686004)(38100700002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm5NS0JnWWNXRndyNUpSK29BNTZac3oxY1V1Q0RLVmlzWjM2Sis5VnRBQW5k?=
 =?utf-8?B?TXRRY3M1N3RSR3NlS0dveWZ5YVBqenVMNDgzajcrRWkrZHhadVFmZWNIQ2da?=
 =?utf-8?B?NTNWNVU5VUFMWHgwalBzcU9udEFQVGxqT0hrSEJXczlUeVliNGc1MldyNFBu?=
 =?utf-8?B?MmR1dVNQMksrdWk1aHpxa3JxZWNiaVFRMllqRFJMYStOZkNjWXpJUVh3RGp5?=
 =?utf-8?B?OW93OEdvR0paSUJzdWx3L1k1NERWV0VrNy9meldoSFdnaVdoWGNSajBKQWt4?=
 =?utf-8?B?cHM0WFQ4ckk1OFNjaUp6a3BKRFA3c0w1b2hLVWpvUHlrbVJjSmJTVHJMMGE3?=
 =?utf-8?B?YXJERnB1bmU5ZDRhSU5MOXhOckxVTGNWV09rNmR6SjY1QkNWOHJTOVhuQTFH?=
 =?utf-8?B?Z2RhQjVqY0htZUcxeHpweThmMEs2eVpiV1NSK0VJd2dPS2pzWnJNcGxKUktR?=
 =?utf-8?B?ZDFiaGhINUpOWHFjQmFPZXY3b2ZEeDZ5U0hNNkNOTlY3S1pYU1IydVBuZXlK?=
 =?utf-8?B?N1ZMRHpnN0dMendFWDF0MjUxN20wTElKNitWOEpEZ3FkWVRpS2FzamZUbWJz?=
 =?utf-8?B?TktCRGdzd2ZGdXlzdXRsZ2RSbWdzeGVaRDFUR2E5ZTlBcFNOZGpDUFN2V1ZI?=
 =?utf-8?B?a3l0RFZScmhMYkV6eEptNzZud2R2SCtTekRVcDdBODBvSngvV0w4cjc4YWxp?=
 =?utf-8?B?clcyMHpObEFidlE2NXJNN0dBRG0yYzczZWQwOTA2MDlNNi9EcjRsd2RoSTJX?=
 =?utf-8?B?dGJuQnBpZlNtQ0ttNDJGc0tOQUU2TkEwL090eHJiYklvQjlMYm1CZ2s2UjNG?=
 =?utf-8?B?clBRNUlEdWJEWWs0MzJWVlBNVldVUTIxcmE1eXNlay8ySUJkelpCeDQvUzg1?=
 =?utf-8?B?cWR1L29VRjg0OStZVlpwS0xEdCs1SC95WDBBMHB4SmpiMHY3YzBKMUpmVmli?=
 =?utf-8?B?bG15VU9Iek5BeUFqTjBxOTYzRnhEdk1IZEJCbFRtMXR6K3JxbVRUK2xqM2Y3?=
 =?utf-8?B?Z2c5OUJDTG1JM1RiaTQwbVRwdkxaRVFDUUJnN0FtaDZaL0pndG5TTXFwcmJP?=
 =?utf-8?B?blY4cFRBN2g4cUJjNW9Bb1lhTXVDU1Y2U3hmMXVXckk1VEM3TGcwbWNxd1pj?=
 =?utf-8?B?ZjY0ZjRNYTVrUHQ5UEtyOHVRN2pMRWF1R2dXNVM3N0J4MGkyQ1B5V2pVMXdp?=
 =?utf-8?B?cmc5bDA1MEs0TGF1WVIrVUptYWZRVDNzWmhOL08rOENLS3hSbmRIUWJrV3pB?=
 =?utf-8?B?L1I2TFJ4UHlRVmlkUFM0dnRPNzlmcHdzLzViUTFGNWdxRkdxSTBFQkJjVytT?=
 =?utf-8?B?TitvYTRkWjN1L2NnbFFuWTNjWUkwOC9aOFRPWDBURVhzZFlYT2pIOXVSOWRG?=
 =?utf-8?B?eUhSMlp3STVpQVdLbkdPNWEva3Fic2hxZS9CVXJOM3dna2ZtQ0ZocW9EaHhQ?=
 =?utf-8?B?S01Xd2plS0tsZXRZVFNOZTBTT1ZnODNURzEvWGxYNEI3dXNybnhFZmtjM3Ew?=
 =?utf-8?B?RE9QWnVHWDNYTXpCR2lPdUF5N1J3SkZ3eXFVdjlyeDcyNWptSi9udFVOaVRV?=
 =?utf-8?B?UlpuZm8ybUFqcjRrK2k0U1NHN3VDT3BReXQ0Ylk3T0llejk1Z0hySlhEYWV6?=
 =?utf-8?B?aGxzM3NQaGxGWlFzckQ2c1B2NTJ3M3lGY21NY3lFWHdjak9tZWFIakwxdks0?=
 =?utf-8?B?WUhJdHNZeVpFWVpWY1Fzc3JKcCtCQThwTGdtbktVV2RIdVZsakg5d1QrdEtS?=
 =?utf-8?B?TWpITnc3UEdJdkRiWU9wbVNHWHRhM2dvendyRHdmaFl3VEtlNHdoVGdjRzZD?=
 =?utf-8?B?ek83OG1qODFpbERpSXlFWisxVlN5bjVwQ1VVUU9HQUM4MVFCQUI2Skt4Y1JQ?=
 =?utf-8?B?SjVyb2FPZTl1amR6WTZKVG5qMmNpcENON290dFpWdE04bndaTDQ0U1BhU3hy?=
 =?utf-8?B?dXFFQnRRMjhIdlFrdW1tQlk1MUJId3UrV25xNFVFd0x0WWkvamRIc3FZVGdP?=
 =?utf-8?B?Rk9Bd3JORW1sVnBuVTJYa2dERytjTG9nU0hqd0ZUMnB0S2JCdTZhYzBITjBa?=
 =?utf-8?B?UFFzSEtEVGhRMHBJNVk2WjB5RkVkN1JOS3pjc2VOUXBRcGErZmNOZkpYOHNj?=
 =?utf-8?B?V1JvYzdMb0xudXFqbkVVN1I2blpvQmY1OUhzZzE0SWY2UnBFY04xOEt3NnBR?=
 =?utf-8?Q?Z7SD5QiMqmMpzldCFom7plA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2386a0-9621-4969-6c04-08d99d40c3f3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2523.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 14:06:14.2032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V63hCX5wov1IVT6PXG1YR9+NiMRl9udVt522em8sMcsA5rLAdCjHe975d1vYqgK4P2VCISWmarq8NgvEgR+pyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4331
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10154
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=931 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111010082
X-Proofpoint-GUID: a3hWFCb8UYVpCHms7dWEUkSUn1AAqIoJ
X-Proofpoint-ORIG-GUID: a3hWFCb8UYVpCHms7dWEUkSUn1AAqIoJ
Received-SPF: pass client-ip=205.220.165.32; envelope-from=annie.li@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: ani@anisinha.ca, "imammedo@redhat.com" <imammedo@redhat.com>,
 jusual@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I've found an issue when hot-plugging the secondary virtio_blk device 
into q35 Windows guest(2019) with upstream qemu 6.1.0(+1 patch). The 
first disk can be hot-plugged successfully.

The qemu options for PCIe root port is,

  -device 
pcie-root-port,port=2,chassis=2,id=pciroot2,bus=pcie.0,addr=0x2,multifunction=on 
\
  -device 
pcie-root-port,port=3,chassis=3,id=pciroot3,bus=pcie.0,addr=0x3,multifunction=on 
\
  -device 
pcie-root-port,port=4,chassis=4,id=pciroot4,bus=pcie.0,addr=0x4,multifunction=on 
\
  -device 
pcie-root-port,port=5,chassis=5,id=pciroot5,bus=pcie.0,addr=0x5,multifunction=on 
\
  -device 
pcie-root-port,port=6,chassis=6,id=pciroot6,bus=pcie.0,addr=0x6,multifunction=on 
\

The command to hotplug 1st virtio_blk disk is following, the PCI slot of 
the 1st virtio_blk is Pci slot 0(PCI bus 1, device 0, function 0).

  drive_add auto 
file=block_10.qcow2,format=qcow2,if=none,id=drive10,cache=none

  device_add virtio-blk-pci,drive=drive10,id=block-disk10,bus=pciroot2

Following is the related "info mtree" after the 1st virtio_blk device is 
hot plugged

memory-region: pci_bridge_pci
   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci
     00000000febff000-00000000febfffff (prio 1, i/o): virtio-blk-pci-msix
       00000000febff000-00000000febff01f (prio 0, i/o): msix-table
       00000000febff800-00000000febff807 (prio 0, i/o): msix-pba
     0000000fffffc000-0000000fffffffff (prio 1, i/o): virtio-pci
       0000000fffffc000-0000000fffffcfff (prio 0, i/o): virtio-pci-common
       0000000fffffd000-0000000fffffdfff (prio 0, i/o): virtio-pci-isr
       0000000fffffe000-0000000fffffefff (prio 0, i/o): virtio-pci-device
       0000000ffffff000-0000000fffffffff (prio 0, i/o): virtio-pci-notify

memory-region: pci_bridge_pci
   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci

memory-region: pci_bridge_pci
   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci

memory-region: pci_bridge_pci
   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci

memory-region: pci_bridge_pci
   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci

Right after the secondary virtio_blk device is hot-plugged, a yellow 
mark shows on the first virtio_blk device in the Windows guest. The PCI 
slot info of the 2nd virtio_blk is Pci slot 0(PCI bus 2, device 0, 
function 0). The debug log of Windows virtio_blk driver shows a 
"ScsiStopAdapter" adapter control operation is triggered first, and then 
"StorSurpriseRemoval". From the following "info mtree", it seems the 2nd 
virtio_blk device is occupying the same memory resource as the above 1st 
virtio_blk device. Maybe this causes the failure of the 1st virtio_blk 
device and then the system assume it is surprisingly removed?

The command to hotplug 2nd virtio_blk disk,

  drive_add auto 
file=block_11.qcow2,format=qcow2,if=none,id=drive11,cache=none

  device_add virtio-blk-pci,drive=drive11,id=block-disk11,bus=pciroot3

Following is the related "info mtree" after the 2nd virtio_blk device is 
hot-plugged,

memory-region: pci_bridge_pci
   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci

memory-region: pci_bridge_pci
   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci
     00000000febff000-00000000febfffff (prio 1, i/o): virtio-blk-pci-msix
       00000000febff000-00000000febff01f (prio 0, i/o): msix-table
       00000000febff800-00000000febff807 (prio 0, i/o): msix-pba
     0000000fffffc000-0000000fffffffff (prio 1, i/o): virtio-pci
       0000000fffffc000-0000000fffffcfff (prio 0, i/o): virtio-pci-common
       0000000fffffd000-0000000fffffdfff (prio 0, i/o): virtio-pci-isr
       0000000fffffe000-0000000fffffefff (prio 0, i/o): virtio-pci-device
       0000000ffffff000-0000000fffffffff (prio 0, i/o): virtio-pci-notify

memory-region: pci_bridge_pci
   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci

memory-region: pci_bridge_pci
   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci

memory-region: pci_bridge_pci
   0000000000000000-ffffffffffffffff (prio 0, i/o): pci_bridge_pci


Note: I've patched the upstream 6.1.0 qemu with following patch,

https://patchwork.kernel.org/project/qemu-devel/patch/20210916132838.3469580-3-ani@anisinha.ca/

the acpi-pci-hotplug memory is following as expected,

   0000000000000cc0-0000000000000cd7 (prio 0, i/o): acpi-pci-hotplug
   0000000000000cd8-0000000000000ce3 (prio 0, i/o): acpi-mem-hotplug

Thanks

Annie


