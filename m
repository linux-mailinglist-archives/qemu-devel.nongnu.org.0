Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468615A1F91
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 05:59:56 +0200 (CEST)
Received: from localhost ([::1]:45648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRQVe-0005RC-Ot
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 23:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1oRQUY-000470-1c
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 23:58:46 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:65362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1oRQUV-0004DK-Th
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 23:58:45 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27Q3Xamo016915;
 Fri, 26 Aug 2022 03:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=pVsOwsmJfrDCjLSB8jvpfSJIb+8lvmqOFKIlXD63zU4=;
 b=Q5kLE7gdbzy4zoIDLahOflzyRor0IMtEXVaUmcI9LBSTf00gBGvvypzPyAQz3a3p0mCE
 lsM/bsmtBipjZfIA3obVHKdpHOJE4ZkSOQPjAOrxoFOFAEXYjwlOQN/YwblkI+/OAsZC
 DPk/AI120XBKMNV8twQJOXuXzN8dFjJOL3CcgZInbcJhn9yYWyfoNpDaGTqBGm9FL6CQ
 hRIi44DNFlGNf00q4GTGAayGVOSaBVETonz4twvAdOwcMTpkxl9B/m3c+JvAptuh9y/w
 KWYStZ3cQBqRpK4ST357NsfM0zJcqBO/DfrdHHDvkLyiD1ctyTIsJAXhEIIKFXaeZUwn 3g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j5awvp5bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Aug 2022 03:58:10 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27Q311AS017873; Fri, 26 Aug 2022 03:58:09 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3j5n7cj5w8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Aug 2022 03:58:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lb62apbombNfcJiT2NlbpCk2puQ8II+fwYbd85V57CjdgTZQoVV1qUyNJfb4wk4CMvxFlCJHL9GPpxqy38Vr1kBhiQdTtqJ8edIO4Egani65RiuQtvXh9xGFt2Skt1gBPwhCYuAlt6P/dk4G1I6MbPHthm9b8wh7aSwaNFl78Q22UuQznP1DwK9LCCc8QxhWI5A4KerWIsvlDjZMy97CXxJ1qnwPhwVMlsnBrk+8IOPmJIUX5s6yeeI3w//2kDx0fmrpUSdkgcLRtvcZFoNkRRd6s1wH0dquPqFDenkd5HTr/LEGYgFYYfGgIHErgbDAq8gJwP/jxiIpnSTo2kmAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVsOwsmJfrDCjLSB8jvpfSJIb+8lvmqOFKIlXD63zU4=;
 b=ZFj2Je9ry+IvpE64Zi2tRdtyUAVpYmFLO4fCVhj0KNECT5CAGZulqbEfUiPL7LIBD533D6B6flXMo2g36nqD8uGgG3/FIujyn2wYryeW8/CVWE0YiZ5JeZgpP3vExd4fdbzUQR/AfQh59Dsvt+hw/aejx6oJ56sCF+zUg3VRDfEVnfZzEABLb0iPq9J6Ois78SR761+inc+gFaVKCHAV/2e4BiBWtYy/a0/eSzzwn/Lt/ilTeXuNxwIydZlml0nwbySnjAqXelYzSYJ5t0m4wicWz9+bIgXQHMy3P3/DDetCqW8ZnqMEIYg6y7JMweTFl2vaf3quKYow01zVY5UP+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVsOwsmJfrDCjLSB8jvpfSJIb+8lvmqOFKIlXD63zU4=;
 b=kh+LcvB1picdPg4BTwM0X8EQRnsuX1sFMvOKa7JYoYVMCsNtMdHY52PpfqkO02oQJ6xnJ7Vl9wjt36puccir0uhSAQMA/oXMkjdN+HgL34iczfpaKQdW4JIfuQBvKqZyHeAKOSwQwk8GVXOOWCg2wk+sZuE48OlQKW7scTJJZxI=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM6PR10MB3196.namprd10.prod.outlook.com (2603:10b6:5:1a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 03:58:07 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::dcf7:95c3:9991:e649]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::dcf7:95c3:9991:e649%7]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 03:58:06 +0000
Message-ID: <bc138c4c-9295-ddcf-01d0-d6db2b32baa1@oracle.com>
Date: Thu, 25 Aug 2022 20:58:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/5] virtio-net: Update virtio-net curr_queue_pairs in
 vdpa backends
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
Cc: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Liuxiangdong
 <liuxiangdong5@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
References: <20220819171329.3597027-1-eperezma@redhat.com>
 <20220819171329.3597027-5-eperezma@redhat.com>
 <7debe883-819a-f083-aa72-8b9e05ca5be8@redhat.com>
 <8aafb501-a852-bc45-8989-b48644c5e1f5@oracle.com>
 <CACGkMEuzxCRn9AqMiu_MJ_6QuQ1n_puEECvXvO3mCNRoYJuemA@mail.gmail.com>
 <CACGkMEsuokKQiE68g0GkEGi30uSk5km96m=achrVK1DFrw77tg@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEsuokKQiE68g0GkEGi30uSk5km96m=achrVK1DFrw77tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR08CA0055.namprd08.prod.outlook.com
 (2603:10b6:5:1e0::29) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed041f3a-67a5-4696-669b-08da87172e9a
X-MS-TrafficTypeDiagnostic: DM6PR10MB3196:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bIlol0menE0PWIgQkpBbl9BQ3PvFgiSjr7kpeTyrznJhudNfpMjlwDLp2bWGOgJXOnwIsvcDQ57zoTTiHkkTG4nk/bY0pYBRWGTJEN3GtM3N9ZVukYL5DsWt/aHD/6QIcG79x3MhzxCzek+cyvzhwKn28apEFSD3n9c2V6LD1vKL/bKct6Jg/mpcuyNo0HfgmBdkPs/b/wdbLAVamysIerS7MLTr5h2Bw5qdOhI077QvRWZgA9eBM9xK8M1G+SY4vQoqbWJCZoga73xWYzYphj3SgSdVTe8ji5/xtCVS4WG9R/6r7ZV8Nwh8+rUY8s/+L6njnSz1ZUE53Ejhzz0OV+udU4/pDzxQctHa5y9L5SR08mIMLXQDaYrzxFDFg0gW+2Q1ISFWL4219itO1o+T1wCyS46ypodkwfTCTz99itP36mRzkmXi76Udz4jiNZdIWlM2g+Oukf4BQFoaisaUkyP80KWBX3wHdFJsVyYl3RppfvdQwzt3/tGXMg6j6n/fgtIyT/9vsbSc1/Bm6f729MALeHutNiWfWsbrt70spDEMRINBBaM0Gsqv3LnbaimS+jOPBVieJbU8tpds7KU5PpX3FeRAmlA9xI/NEcvvNkjas3x3rhIQ9k8YGwYPmrBoDQEfcjDirik3opx+Isyndun3J8mwfZgy3VZ1V8krB7WZWwHo0CLxSjbNCqAj/efzkAeW9DwdlnXL4hLpBgIb30Qgd6+y+DkVYE8i/nFgS8XrxzltEFMt/fWbDcusfH1pdRMeMyCJIGLNTa7UHRVf3AsPrJ2ci5xSERRKbmJXXzQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(346002)(396003)(136003)(39860400002)(41300700001)(6512007)(36916002)(26005)(6666004)(31696002)(53546011)(86362001)(6506007)(36756003)(31686004)(186003)(2616005)(6486002)(478600001)(66574015)(66556008)(8676002)(66476007)(4326008)(83380400001)(66946007)(6916009)(316002)(54906003)(38100700002)(7416002)(8936002)(2906002)(15650500001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1M4Q3QyT3FqdEw3MW5XakZRdzFyQjVENUt3V200aW9JcHhRVlZNRloySzhz?=
 =?utf-8?B?RjlsVmNCQ0hCaFcwV1RkVHlJdlMycE5EVjRYeXBGU000VzlGcGVLb0hyd0w0?=
 =?utf-8?B?Mm5SRGFQempHQXZmTnhhT0hEV2JWdzNyRWlXZUJFSzVBYXoyUGY4bjBZckJY?=
 =?utf-8?B?NjVYcEFIcVRycit6QXMrNHBWdmJpT1JtejVtQm1hbFhmRXNCazRhd3FwTFlq?=
 =?utf-8?B?RTJwZHVKRWswZlZYV1FGUnB0Rng2eENvVnZ4YnFDaVV3MkpWajd1Nmtvb3hW?=
 =?utf-8?B?eVlTV01OeEtkTEZMcWtmRjk5d0RXS2lYSGVtYUFsYVVZdGM0QUV6WktETmxS?=
 =?utf-8?B?T2h5NXpmeGpCd0Z4dHdZeDRrZWRqc3pySWVvQUZ1VFA0YUxmOHEveGZ4ZlFS?=
 =?utf-8?B?Rmh5eEFOKzJIMklycGRiTlVLUFJ5MkwrME9DTXg3eWovZ1RmNFBwWVh3c2JJ?=
 =?utf-8?B?Y1RZL2tsY3RMZjJidk5vOS96M2wzQTRqUUl6SjhiRUwyR1NpY253aUJyZHRW?=
 =?utf-8?B?UUtTWE5kNzVvak5ob3JsM3lVY2h0bEhUMmhaQ3RRWDZtcVRGTGpuY3RPYnhQ?=
 =?utf-8?B?dDRIcDNHUEVBMUJzTm9DQk10blJ4d3VIdTJpY21PWEtXaDhOY053djU1OEhH?=
 =?utf-8?B?TXBGYmUvejViekdqb2RZRXIxMllBU2tLRXFIRFRKbTFCVlc0UjhkZ0FXMm9q?=
 =?utf-8?B?NDZPSFFGRDlHa0FlOE5kR0J6MitmYlJua21YczUyRDJqdVZIOEVRYXVkMDAz?=
 =?utf-8?B?LzFkUE5oNUdHSTF2US9mRncyeWd5cWcrZ2NNKzR5eDN4dEhNZU9aOGF0UXVy?=
 =?utf-8?B?eEpDU09uMEh3Sjl1TlNRZ1IzQTFFdi9yYTF6R1plZlRyUERab1hpUFpGZXJR?=
 =?utf-8?B?YTVKWFErTHR0YmlrL2ppNXlYNnNhZS9qa0ZkeUZwS3hRcmIwOUhhS1kzZCtH?=
 =?utf-8?B?MEt0NVRrL0JpRFErbDBmUytablhhS3IrbHowWGt0ekpVZlJWV2dzRGM1d2hB?=
 =?utf-8?B?blVoaG52cG0rVzEyTFhkdHRqMzhoRVJWcDhyV3hLWmpRb3AwSFpHeUdtV1hj?=
 =?utf-8?B?b1FCSzNZVHVXSDc1ZkhRVWh4ajFtR21DQkcxdzYvV21XWW56Z2lqQUc2MUdk?=
 =?utf-8?B?aEhtcFVpYkxMdk16dUo5N3hQekF1dUZKbTFPZ2pzMDVEdFd1Q1N6STFlY3pN?=
 =?utf-8?B?WE9OU3dNM1h6WllRejR5REVDNHpXWnhDbjRPMGs3TVRVbDV1a0UrcHhQUFhX?=
 =?utf-8?B?cGp4N2RrdE9rOEh2NHpLL2dCRWpZSnMxL2hwd2ZhLzBtVmd4VXRXQzlnWU9y?=
 =?utf-8?B?STRlWGR4VGFVOUJyalQ5VTRnTXloK3BDVTd0ZGRkdllyR0dxeDB5WUtZQXhV?=
 =?utf-8?B?MEpUamVzUUw5ZUNReVFQa0hUaUFwcUNFcmhlQlF6QThraExOQkVoU2hXbnNW?=
 =?utf-8?B?cTV2M1h2TDJEelFnVWwzNFE3cVpNeWNFWUhiaG1Cem02QVdQd3QrbjRndjc2?=
 =?utf-8?B?eUtzcWhOcHh2dkpsN01Vc0xVZWN1MXdBWWJlZVRsT2Y4NmdleGdROVNwQkFu?=
 =?utf-8?B?VnlLZ3pnQjdjTVJPc1RZT1pWNTlxZE9vbTZtWGt0TkZHUnRJVmtqVTZFRmwz?=
 =?utf-8?B?dGFFM3FabTNZNmdkTlNPaUM4dno1eHNYclg1bXVqVTZoWGFBLzlQMXJTa1ZE?=
 =?utf-8?B?Z2IwVTVlQ0tJbzlxSDRQaG9VN1U0SmV2UXU0bWNoa1Qzc3U0RVdZanlJUDBH?=
 =?utf-8?B?elhKWjFVSVo1Tnd5MEZkY0crWitTeUlVc0tmTWlCL1NNUVNmclFBV21CZkkw?=
 =?utf-8?B?aXY1eW9vbzVvSFlyZnBPYUNITEh0eTRoWHJNV1czdzFiS2cxd281VzFjb3N6?=
 =?utf-8?B?VWszVTVkMXd6V2pFZTdBTHRpZTVpSjVQT2paREh5T1NIQ2tuUitsRzdVM2ls?=
 =?utf-8?B?Qk9JcHBGOFVibFg5ZTlHOVdkeVU3LzdFYkREckQ4d3I5RWIvejdwbkNONnMx?=
 =?utf-8?B?U3hPVlR5MFFwV3BuenlVd0x2eXRiUnVzL01RTGNkS3RyQ1Z6VjBBL2d5WkhK?=
 =?utf-8?B?OWxTeEVyTXVoUkNpaHdTa2xRYUlPVkZQcUgwenFBSC9admVlWXliRFlWUUlV?=
 =?utf-8?Q?vvuDdFvu0DOERkW1bAZdzUZc7?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed041f3a-67a5-4696-669b-08da87172e9a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 03:58:06.3777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTedeYhxzE3ZVNWw70EVBZMkP7GaWdllTt9qQVjvZ7lqhFPWGUu47La7ppRyUAMCJPGLT2nb3CanBO9hmod+8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3196
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-26_02,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208260014
X-Proofpoint-ORIG-GUID: 6X-TH8KdD7_mskAWL0cFgPafY617nTo8
X-Proofpoint-GUID: 6X-TH8KdD7_mskAWL0cFgPafY617nTo8
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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



On 8/24/2022 8:05 PM, Jason Wang wrote:
> On Thu, Aug 25, 2022 at 10:53 AM Jason Wang <jasowang@redhat.com> wrote:
>> On Thu, Aug 25, 2022 at 8:38 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>
>>>
>>> On 8/23/2022 9:27 PM, Jason Wang wrote:
>>>> 在 2022/8/20 01:13, Eugenio Pérez 写道:
>>>>> It was returned as error before. Instead of it, simply update the
>>>>> corresponding field so qemu can send it in the migration data.
>>>>>
>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>> ---
>>>>
>>>> Looks correct.
>>>>
>>>> Adding Si Wei for double check.
>>> Hmmm, I understand why this change is needed for live migration, but
>>> this would easily cause userspace out of sync with the kernel for other
>>> use cases, such as link down or userspace fallback due to vdpa ioctl
>>> error. Yes, these are edge cases.
>> Considering 7.2 will start, maybe it's time to fix the root cause
>> instead of having a workaround like this?
> Btw, the patch actually tries its best to limit the behaviour, e.g it
> doesn't do the following set_status() stuff. So I think it won't
> trigger the issue you mentioned here?
Well, we can claim we don't support the link down+up case while changing 
queue numbers in between. On the other hand, the error recovery from 
fallback userspace is another story, which would need more attention and 
care on the error path. Yes, if see it from that perspective the change 
is fine. For completeness, please refer to the patch in the other email.

-Siwei

>
> Thanks
>
>> THanks
>>
>>> Not completely against it, but I
>>> wonder if there's a way we can limit the change scope to live migration
>>> case only?
>>>
>>> -Siwei
>>>
>>>> Thanks
>>>>
>>>>
>>>>>    hw/net/virtio-net.c | 17 ++++++-----------
>>>>>    1 file changed, 6 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>>>> index dd0d056fde..63a8332cd0 100644
>>>>> --- a/hw/net/virtio-net.c
>>>>> +++ b/hw/net/virtio-net.c
>>>>> @@ -1412,19 +1412,14 @@ static int virtio_net_handle_mq(VirtIONet *n,
>>>>> uint8_t cmd,
>>>>>            return VIRTIO_NET_ERR;
>>>>>        }
>>>>>    -    /* Avoid changing the number of queue_pairs for vdpa device in
>>>>> -     * userspace handler. A future fix is needed to handle the mq
>>>>> -     * change in userspace handler with vhost-vdpa. Let's disable
>>>>> -     * the mq handling from userspace for now and only allow get
>>>>> -     * done through the kernel. Ripples may be seen when falling
>>>>> -     * back to userspace, but without doing it qemu process would
>>>>> -     * crash on a recursive entry to virtio_net_set_status().
>>>>> -     */
>>>>> +    n->curr_queue_pairs = queue_pairs;
>>>>>        if (nc->peer && nc->peer->info->type ==
>>>>> NET_CLIENT_DRIVER_VHOST_VDPA) {
>>>>> -        return VIRTIO_NET_ERR;
>>>>> +        /*
>>>>> +         * Avoid updating the backend for a vdpa device: We're only
>>>>> interested
>>>>> +         * in updating the device model queues.
>>>>> +         */
>>>>> +        return VIRTIO_NET_OK;
>>>>>        }
>>>>> -
>>>>> -    n->curr_queue_pairs = queue_pairs;
>>>>>        /* stop the backend before changing the number of queue_pairs
>>>>> to avoid handling a
>>>>>         * disabled queue */
>>>>>        virtio_net_set_status(vdev, vdev->status);


