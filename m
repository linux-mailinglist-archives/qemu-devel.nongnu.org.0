Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0433C698A67
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 03:16:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSTnf-00047X-Ba; Wed, 15 Feb 2023 21:15:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pSTnc-00046d-Ch
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:15:04 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pSTnY-0004ij-GQ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 21:15:03 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31FMx6J4028714; Thu, 16 Feb 2023 02:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=veUKd7e+NJGyi9nISkDMZ8KPfaTlBSAvt+rZmIMd7ic=;
 b=eQ6RJLqXV24kBa9UTRH6RYFiYjpglA2MgpkcP1OsQEZ6Q94O+Q5L7WUCOibG92ejSB3c
 PhpLVPWu1VL0PeA00vP3SB1jyQrcSr/Tsvlm16vdxLLBR6EWuQ5gnMRrmBYPcsd6zItc
 LLFsIOrol5CnNTsriC6+nolKq0DjVCuJcjaryvLzdAOopv+KLum4YmDl7emFe66cnXNo
 ZnpfmAnBJwmieX2T9d1ztF+Coi+Ul0b4gfOVFpX0nvTL0stuFfeFCB45E6khNaAHzMXP
 ZA42qwSBzjSysfoa/O5wyXnjoJLNkoWNsBjbCJqPcuE6FjTilozDcBEbG8TTec+1KcIi Yg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np1m123bd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Feb 2023 02:14:43 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31G0kgup017069; Thu, 16 Feb 2023 02:14:41 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f80yb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Feb 2023 02:14:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIT+H1R5DiElCvUTPryvfvQ5DvYnf7/pkXruiDqX5iiYgSPoAzIbqv2VL9ia2S34K6RBUmSWc8Wh3wFwmiJ41CUgORIoxeG5OnNFMA0cwt9hO/cJHp2uim2YkBfUwmy+Tx6N8XRTDm7xwtnRnWYMyqulXv8Bk73faWtpKHyWJe5MCejHvv1Zq3hUpB4XPj9o5W3FHkuFX8MreGKe0B1qW8uWWvpk2WGh8Yeh9m4wwvyvyCG3LAZu8qXpkPhoKtxKGeJHYeR31t7L9fnStz/e25uOcTPcLpZauRmSUBX5zDZ9RAZiOrxToLF5esYVXa7z+9n6/c0zIMAmOvsHRGU5dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veUKd7e+NJGyi9nISkDMZ8KPfaTlBSAvt+rZmIMd7ic=;
 b=Z51iqhJyZ38eF+SBau/2DF+aau+uFfxlhluSq1amqVbw1tzijJQBRK6vTsBMZ2pWadDaNAXnA/QS4e4XNixerlrGzDJxTpsq8bF5ga3CmjDdEZbQgKQE/NeF/2lTzXZ/N11mU8dN1UjjTeRuVaQ9iqVSZ2PPiUTYDX6YuurGjQrVOFxYCg11DsJRBSaW8FOnAtFaY0mmtTcNhKm0xd/2DCNUYUJ5PR9tSo7wTCX19zHln5K3dGtWxu655HwvVESrDPOYC4INM55pu9ddbkBC/mYpgBVJcf/ke7/f/Q+iOvzrhckJ4ouPWGQBFswhylGDMC2928CCWwrfXu1EBj7WEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veUKd7e+NJGyi9nISkDMZ8KPfaTlBSAvt+rZmIMd7ic=;
 b=NEkcKbHgv67AQbiCVpjY3CKDLpnpXemjj/CSvtL2MYIBXsKJYsS4DM63G1ANDhs0DTYfvTHRHQ5X8zJcXq0D9+wd5IGKcXxeeRn1ldxmILt+HqScahJ7s5G1fN1ojSwX/dWdKNWc0ZTGV+h7MNoXuGlBmFHEa1xoFgrQr1urHWg=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by BLAPR10MB5074.namprd10.prod.outlook.com (2603:10b6:208:30d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 02:14:38 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::25da:8594:cf75:8ef3]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::25da:8594:cf75:8ef3%9]) with mapi id 15.20.6111.012; Thu, 16 Feb 2023
 02:14:38 +0000
Message-ID: <5e54b6ed-ae07-d6bf-e143-084c82f1f428@oracle.com>
Date: Wed, 15 Feb 2023 18:14:33 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 01/13] vdpa net: move iova tree creation from init to
 start
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: qemu-devel@nongnu.org, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>,
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>,
 Lei Yang <leiyang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>,
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, longpeng2@huawei.com,
 virtualization@lists.linux-foundation.org,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-2-eperezma@redhat.com>
 <a71b4dfc-67ea-ef8b-023b-8e18638bd8b2@oracle.com>
 <CAJaqyWfVOmVs5j_O=TMRSO3ZkDWuX-ZRJMY_nTYicAev8+QMHA@mail.gmail.com>
 <bdd4531e-1616-8513-bb33-80fabb7b2074@oracle.com>
 <CAJaqyWfTPHseAg9fdku00xtvC7kkJyAKMiN5wqoRVioN3zWDFw@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJaqyWfTPHseAg9fdku00xtvC7kkJyAKMiN5wqoRVioN3zWDFw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR04CA0075.namprd04.prod.outlook.com
 (2603:10b6:805:f2::16) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|BLAPR10MB5074:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b965586-671a-4e44-ce77-08db0fc38e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NLbqEYV3UBx42hQavEwYtE9dRfxZavQjSt0vyGRNhzFTPR6BKeqikHCTP9AdHaFLRaNRfqt1w2t1QK6s5Vb11VBLo2op1+c5zGZup+i8fH1ejq9lnR3XnQQrrL87OHBZsmtc10eWVTCY+NLw8Dyb5mXiMdDgaELnONrIPaY8irywsVHdsZ27KDsJ+Ng5sVmZjFtK/kL2vsITtq/b+2djltuXdmYU7GAjA/a6LW29jp74Mi6PwhCTDFShrEzTJBKaeAVOmnlJ6Lc5ZJFQHt644GwuKhWS1Jr8E1KYpaoRCweJ7SwpHXUyYNApjvHJRqCgEAnPHVCc0KEtrx3YV9UJVJG91wwo7qMwsdombR8wNXeVIgQ6dwOG4n7zPMfZjTQGc2Rmi9xn3UyDnfnHCEAfqQ8ZJ6Ra61Q5gVi9AjH77Pw7zeFh2QmFOsYWWk1AY4V/bTU9HWTWsGFGiUDe2cgC6ru1wwdUxei722mUQf3ZfqqSvbcJ6nwFpBPnupeKc5i41oVVuBHuClwYjE7HAANI6UtyAQVdFBE/ee/YY39ieJe8KOZ++dFtqUe4lnUKuoXJU4Cr3C+AcDaLnKLK/QAUPwDTzOT1PhgevjxkqgriN5cyyWrOW9aL7LmbRbmxqf3BASsz1kh2bJxa2/Lxu/6z6DXAauwfhMBR2oEC2441nDjFwCw0mTWicjmetqMcYL/OP2/CboVD0nPH0sqTmxvSI0K4P7oTAPkuAVFteG7H8bI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199018)(8936002)(30864003)(5660300002)(41300700001)(36756003)(2906002)(7416002)(36916002)(4326008)(478600001)(6666004)(8676002)(66946007)(6916009)(66476007)(66556008)(316002)(6486002)(54906003)(38100700002)(31686004)(186003)(66574015)(2616005)(53546011)(6506007)(6512007)(86362001)(26005)(31696002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnU4VCtTM0VScVpaYzR4RVFmSzdhdHp3cnhQd1lIWHZMZXN4RS9Qd2V6WHFM?=
 =?utf-8?B?TnE0UmNLbEJTRWZFWW95dlBJL2o2NHc2d3FDY3pQOWYrVmtHTU5rcFNPL1JO?=
 =?utf-8?B?alFoakRvUUMxbGFaaVJSVjl1bE1rOTdwdGxhZy84NHcvY09YditTa1ZMZDdk?=
 =?utf-8?B?Y0o3Y2x3c0pWcHZ6b1cyUlF6d3hpTWFpSnFJQzJuSTByOGwyVWg0S2FyUkZM?=
 =?utf-8?B?anhmL2U4OUp0UGpkMnRoUXRRcHoyT2dWcFcvMnM1amtQOEh1N0ZWMWNYQ2Rt?=
 =?utf-8?B?QW15eDBvL290TGc5UkFWMUxCQkZSSVIvdkIySzA3cjhrdTF5Zk5tWnFVSXc2?=
 =?utf-8?B?U3NveSsva3ZSdEZoTlN3RUtjemVUczl2WTNsUzhUWi9ZdkJoYWoxdzlQWGhV?=
 =?utf-8?B?bWZBRCtwanZuOXBFeCs3S1p5ZjBGNEh1NzFuc1JScVh2OElLVWtsTWxoNWZD?=
 =?utf-8?B?U1BhVy9MbHpCcUpyeFNCUUwyenlwNnh2UE9XaEtyV1ZGS2ROMmJwRTBaV0pE?=
 =?utf-8?B?MU5HN0pYQmxYdkVFemhUQlFzZ25qKytlZkJXa0l4czd3czJZQnRldFI2K3Ry?=
 =?utf-8?B?T3BOdFBUcmR1MkVJaEl6VHdxMU1mUHUyZFJGL0NRWmRZaUNtK0Y4blhLM3ZQ?=
 =?utf-8?B?TnVIeTR4OGwvQVJRRTVpTUpJUDl4c0d6M2MvWWpUc3VHd1l1U0ZiQStZWE5H?=
 =?utf-8?B?c2pDZ0tzb2pSNkF3dXpheHNWaTR0RktzZndEeE0vYThPWVg4eHE0ODVQMU1y?=
 =?utf-8?B?RHlMcG1CcFJMWlZjRGxyaHYxdVpibjZaZ0U0MjVMSE1iNEtnOWdNU09xZEFl?=
 =?utf-8?B?NmZ2eWRjb1BYZ3I5dUg5Yk84MGUwbEZkSDRPbit6eWErZkRpenJqK2MwRkxC?=
 =?utf-8?B?dTFidEtoZEQyaEhyTDFHTmxpQWh1SEZJRUdrb25nRlcxWnMyemk1bE1uT0xY?=
 =?utf-8?B?S0ZaS0k4R3JIUlB0Vk9SZFd0cjNtZElKaCs3SU9YUE01dDFLT1BkK0F1S0x5?=
 =?utf-8?B?cGd5U0E1Z3BIYk1VbWh1L1pYUW9PdkdDTmQ0cUVFK3Q0Y25iZWdQOU4xNCsz?=
 =?utf-8?B?Mk51Lys2NEszRWd2UjNsRkp2aUg5V1pQeGZJR3VQMGc3MGZNOUNBREZIMEpq?=
 =?utf-8?B?MUQza2FiQjg4ME9ZWTVZemJGWUozV3FpUnhPcS8vRzRHSDhKZjFXWnZEZUhF?=
 =?utf-8?B?K3lkVGltb09rUDRmVnNvRUZ0RGFrYTd4S1BvYW8xUXJqVHZ2a1B3VmN6VkQx?=
 =?utf-8?B?L1R1WEMrclhsbVFpZHJWcEpvMWFJUXlPS1VYUUYxMitGdUtxakNteWFEUm1F?=
 =?utf-8?B?WS80eWttdXNiMGtEcnkzSzl6ZGR0RGdBYkJlN05PWThGMGF1RVc4d3lIbEJz?=
 =?utf-8?B?Q3I2N25KRkVEZjdPNUo1dTBGbzc5bTVMemg3eHlCbjg3d1IwWUlWaHpYblkx?=
 =?utf-8?B?clM0UFZyYlZVaVVaSGxHR0pnSmNtVnErRGFnSElSYTdlb0hhVUorcTFPVXVX?=
 =?utf-8?B?MmNZdTZ1ODRtMlNzUkJRM1hWMXFud2pYT3l6NUk0ekdFNmFTUm95M24xTHNk?=
 =?utf-8?B?RGZESHB3akRWZU5ZS1JwSldiRXZJOWRvZjlaeS9zMXhaazg2VDZJelk0Y1Vw?=
 =?utf-8?B?dFNQT2VxTEJlNU9Wb0t3Mmg5c2xpY2ttOS92dC81aG03eGpnTGxMUGoxSjdl?=
 =?utf-8?B?ZDl3dFRuVTUreEVnRlJMOVZiaHlvOUlvNHg0NVNFdTB1MjRDSjJnam9pRHNN?=
 =?utf-8?B?WFpzQm5xQ1JvcU4yYTJkVnBaelR0cG9JeGlxZVRLTzdLWnNIVnYrOWdDZmdE?=
 =?utf-8?B?ZjMzeWxOVngraXM3L1dFbTZMOUZoeFVldVZVZG5MY3VXbFNuc2x6U2FrcW1o?=
 =?utf-8?B?N0RZc1htK0twVFgxeUNHZ0hDbmpKQjNWa0ZHQ3lBcGNhenA1K3ZmZ0pNNGU3?=
 =?utf-8?B?cTMxV1RZMlh5WmhrYVo0cWFJZTgwOHJqbkFWM2UvQzd2b3J3eTRvcDcrWWtD?=
 =?utf-8?B?VHIyekc4a3kxSGI0dVlZRmxMTkpZMjA2T0J6QnQ4TmFMektJb2ZXZjI1UExY?=
 =?utf-8?B?Ymp6c3ZQTVlxOUlQMC9Fa1RCN3BiTitzUnlBZHlRN1R5ckZ5U2NValRjK0to?=
 =?utf-8?Q?l34o6YjEeZFoQfOJO1VdF0phN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?ZDF3T0treDZlTkdoZDA5N0RSOEhZZHg0R1ppOG0zblU0d0x0Mk41Mzg4c3M0?=
 =?utf-8?B?TlloTlNibG1FL01KSDdOcWMyTjBSTXZ6QzNnTnR3Skp6RlF2d09qc0t5OXVv?=
 =?utf-8?B?amx6TkpIbkdwR3ZkSHMwRzFvUk94ajZNSERZSFFJNXV2cXlYUUJUNzVvVlpt?=
 =?utf-8?B?VkZXa09EaHQ1WXJiNjEyTUVJWlhSYXVFRS82cXg3UU9PTzF1VWpDNXhqVXNX?=
 =?utf-8?B?cDdMYmRoODVhRXdhWmF4eVJkRm9oUGxFR25jS3RJV0ZwU044b2ZkKzM2eXN6?=
 =?utf-8?B?V2hXdkowdGcvdktuZUJBSDJ1U3Y5VUE4VGVhM3FvTWZLYVIzWDRBM0ZvWkt6?=
 =?utf-8?B?SU5kVDgwOFNXZkhBRW9NZ0VsTmt6OEZBR2VKKzFWSHA4NXFsbWs1RW8vSG8z?=
 =?utf-8?B?Sm1aNFptZWRMOGlDNmJhL3FydHdwa3c5SWNIb3BwK2gxdkQyOHhYYnQ2NFpP?=
 =?utf-8?B?czR0UFhqeWd3K3U2MC9FdXZlV1I2ajBjNXdLcTB2WmtXRG5NZzBEWHZSMmsv?=
 =?utf-8?B?Uk5NcEhIV0NHM2xhVUNjbFAyWVloVG5jSDNwU29DL0pqY21sY0ZHaVBmVHRO?=
 =?utf-8?B?SFRkbGE1V0JvbUF2RmE2YW9XcXFkZDFwL2ViTWZESVlNVkgyL0J3RzR4a3B2?=
 =?utf-8?B?YWZDc2NxY1c0NG9abTUvYURONjhid1BSTUJRMG5keGsvNVdycjlyOUtMTUlh?=
 =?utf-8?B?S2gxY0I2NVhrcy82RlY4UTZrTlJYSStPSmIydVJ5UUd5TjBESVl3dVR2YkxM?=
 =?utf-8?B?VitvVG44VTBoZ2VPU05pYlV2bDZUL0FUNXpTSmVBRUZxWDVOZ3k1QzFHbGpY?=
 =?utf-8?B?ZytwOE5jMk13Z1pOSEttYkhoY1ZhRUVJOFVEOGVjRFVZbkFEVWhmcWdqY1cv?=
 =?utf-8?B?aHJWUkVzMExNUXU4a29nQzYrWlBqd0R4S3AyZE5QdFFXL29JUGJWNGtzS3VW?=
 =?utf-8?B?cmk1Rnp5ei9nZzNmSDdqem1jTzUrNHA5VGUwUTRMSGVvb2k0bit4MkRxN0k3?=
 =?utf-8?B?eU1TdWRkajNUU0JWR3h4dEFQem9TZHRRYTFpR3JNOHRLbWlnazZ2TG5FYUtF?=
 =?utf-8?B?dHJnUElSZzh0NTVhNHRJdDhoem8ySnNjUzlsTmoyWVhIQkVKT3poalVDdHc5?=
 =?utf-8?B?bHN5TThVTFVmRW9TaVlNaGtDTWhDbXZoZnVjNE5jOGVPZGlIZ1NhV1Y1MGlK?=
 =?utf-8?B?OFBVdjRLQlBSUUFWMGFZSHlUUUhWZk85dG5vcCthVW1US2dhWG02UlMzUkZP?=
 =?utf-8?B?TjJXalpXVmR3a25OVHR2aG5md2I5MVRoc096UWhiVi9rSER2N0E2QWc2WEdX?=
 =?utf-8?B?OVNRbWNrNXZJSW81ZVY5cW11YkJvY3RjbkRoWndjd1hvV2VaTnFmZVlad2Za?=
 =?utf-8?Q?bhrOTGiQPn7w6JhqRHjKaUtBkArDgoYs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b965586-671a-4e44-ce77-08db0fc38e3f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 02:14:38.4673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGb6TnNgpa461iCnJFYNpw1MkbWJ4rW6V6JxJUP8dDC6irC1LS5AjjQ8g0tNbDGFe+37keTCYToZKItj6pCs7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5074
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-15_15,2023-02-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302160016
X-Proofpoint-GUID: zqJWXMsVa8TIRwTG8_GUn4dk0-BnfB1r
X-Proofpoint-ORIG-GUID: zqJWXMsVa8TIRwTG8_GUn4dk0-BnfB1r
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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



On 2/14/2023 11:07 AM, Eugenio Perez Martin wrote:
> On Tue, Feb 14, 2023 at 2:45 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 2/13/2023 3:14 AM, Eugenio Perez Martin wrote:
>>> On Mon, Feb 13, 2023 at 7:51 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>>
>>>> On 2/8/2023 1:42 AM, Eugenio Pérez wrote:
>>>>> Only create iova_tree if and when it is needed.
>>>>>
>>>>> The cleanup keeps being responsible of last VQ but this change allows it
>>>>> to merge both cleanup functions.
>>>>>
>>>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>>>> Acked-by: Jason Wang <jasowang@redhat.com>
>>>>> ---
>>>>>     net/vhost-vdpa.c | 99 ++++++++++++++++++++++++++++++++++--------------
>>>>>     1 file changed, 71 insertions(+), 28 deletions(-)
>>>>>
>>>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>>>> index de5ed8ff22..a9e6c8f28e 100644
>>>>> --- a/net/vhost-vdpa.c
>>>>> +++ b/net/vhost-vdpa.c
>>>>> @@ -178,13 +178,9 @@ err_init:
>>>>>     static void vhost_vdpa_cleanup(NetClientState *nc)
>>>>>     {
>>>>>         VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>>>> -    struct vhost_dev *dev = &s->vhost_net->dev;
>>>>>
>>>>>         qemu_vfree(s->cvq_cmd_out_buffer);
>>>>>         qemu_vfree(s->status);
>>>>> -    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>>>>> -        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>>>> -    }
>>>>>         if (s->vhost_net) {
>>>>>             vhost_net_cleanup(s->vhost_net);
>>>>>             g_free(s->vhost_net);
>>>>> @@ -234,10 +230,64 @@ static ssize_t vhost_vdpa_receive(NetClientState *nc, const uint8_t *buf,
>>>>>         return size;
>>>>>     }
>>>>>
>>>>> +/** From any vdpa net client, get the netclient of first queue pair */
>>>>> +static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
>>>>> +{
>>>>> +    NICState *nic = qemu_get_nic(s->nc.peer);
>>>>> +    NetClientState *nc0 = qemu_get_peer(nic->ncs, 0);
>>>>> +
>>>>> +    return DO_UPCAST(VhostVDPAState, nc, nc0);
>>>>> +}
>>>>> +
>>>>> +static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
>>>>> +{
>>>>> +    struct vhost_vdpa *v = &s->vhost_vdpa;
>>>>> +
>>>>> +    if (v->shadow_vqs_enabled) {
>>>>> +        v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>>>> +                                           v->iova_range.last);
>>>>> +    }
>>>>> +}
>>>>> +
>>>>> +static int vhost_vdpa_net_data_start(NetClientState *nc)
>>>>> +{
>>>>> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>>>> +    struct vhost_vdpa *v = &s->vhost_vdpa;
>>>>> +
>>>>> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>>>> +
>>>>> +    if (v->index == 0) {
>>>>> +        vhost_vdpa_net_data_start_first(s);
>>>>> +        return 0;
>>>>> +    }
>>>>> +
>>>>> +    if (v->shadow_vqs_enabled) {
>>>>> +        VhostVDPAState *s0 = vhost_vdpa_net_first_nc_vdpa(s);
>>>>> +        v->iova_tree = s0->vhost_vdpa.iova_tree;
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static void vhost_vdpa_net_client_stop(NetClientState *nc)
>>>>> +{
>>>>> +    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
>>>>> +    struct vhost_dev *dev;
>>>>> +
>>>>> +    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>>>> +
>>>>> +    dev = s->vhost_vdpa.dev;
>>>>> +    if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>>>>> +        g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>>>> +    }
>>>>> +}
>>>>> +
>>>>>     static NetClientInfo net_vhost_vdpa_info = {
>>>>>             .type = NET_CLIENT_DRIVER_VHOST_VDPA,
>>>>>             .size = sizeof(VhostVDPAState),
>>>>>             .receive = vhost_vdpa_receive,
>>>>> +        .start = vhost_vdpa_net_data_start,
>>>>> +        .stop = vhost_vdpa_net_client_stop,
>>>>>             .cleanup = vhost_vdpa_cleanup,
>>>>>             .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
>>>>>             .has_ufo = vhost_vdpa_has_ufo,
>>>>> @@ -351,7 +401,7 @@ dma_map_err:
>>>>>
>>>>>     static int vhost_vdpa_net_cvq_start(NetClientState *nc)
>>>>>     {
>>>>> -    VhostVDPAState *s;
>>>>> +    VhostVDPAState *s, *s0;
>>>>>         struct vhost_vdpa *v;
>>>>>         uint64_t backend_features;
>>>>>         int64_t cvq_group;
>>>>> @@ -425,6 +475,15 @@ out:
>>>>>             return 0;
>>>>>         }
>>>>>
>>>>> +    s0 = vhost_vdpa_net_first_nc_vdpa(s);
>>>>> +    if (s0->vhost_vdpa.iova_tree) {
>>>>> +        /* SVQ is already configured for all virtqueues */
>>>>> +        v->iova_tree = s0->vhost_vdpa.iova_tree;
>>>>> +    } else {
>>>>> +        v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>>>> +                                           v->iova_range.last);
>>>> I wonder how this case could happen, vhost_vdpa_net_data_start_first()
>>>> should've allocated an iova tree on the first data vq. Is zero data vq
>>>> ever possible on net vhost-vdpa?
>>>>
>>> It's the case of the current qemu master when only CVQ is being
>>> shadowed. It's not that "there are no data vq": If that case were
>>> possible, CVQ vhost-vdpa state would be s0.
>>>
>>> The case is that since only CVQ vhost-vdpa is the one being migrated,
>>> only CVQ has an iova tree.
>> OK, so this corresponds to the case where live migration is not started
>> and CVQ starts in its own address space of VHOST_VDPA_NET_CVQ_ASID.
>> Thanks for explaining it!
>>
>>> With this series applied and with no migration running, the case is
>>> the same as before: only SVQ gets shadowed. When migration starts, all
>>> vqs are migrated, and share iova tree.
>> I wonder what is the reason to share the iova tree when migration
>> starts, I think CVQ may stay on its own VHOST_VDPA_NET_CVQ_ASID still?
>>
>> Actually there's discrepancy in vhost_vdpa_net_log_global_enable(), I
>> don't see explicit code to switch from VHOST_VDPA_NET_CVQ_ASID to
>> VHOST_VDPA_GUEST_PA_ASID for the CVQ. This is the address space I
>> collision I mentioned earlier:
>>
> There is no such change. This code only migrates devices with no CVQ,
> as they have their own difficulties.
>
> In the previous RFC there was no such change either. Since it's hard
> to modify passthrough devices IOVA tree, CVQ AS updates keep being
> VHOST_VDPA_NET_CVQ_ASID.
That's my understanding too, the current code doesn't support changing 
AS once it is set, although uAPI doesn't prohibit it.

> They both share the same IOVA tree though, just for simplicity.
It would be good to document this assumption somewhere in the code, it's 
not easy to infer userspace doesn't have the same view as that in the 
kernel in terms of the iova tree being used.

>   If
> address space exhaustion is a problem we can make them independent,
> but this complicates the code a little bit.
>
>> 9585@1676093788.259201:vhost_vdpa_dma_map vdpa:0x7ff13088a190 fd: 16
>> msg_type: 2 asid: 0 iova: 0x1000 size: 0x2000 uaddr: 0x55a5a7ff3000
>> perm: 0x1 type: 2
>> 9585@1676093788.279923:vhost_vdpa_dma_map vdpa:0x7ff13088a190 fd: 16
>> msg_type: 2 asid: 0 iova: 0x3000 size: 0x1000 uaddr: 0x55a5a7ff6000
>> perm: 0x3 type: 2
>> 9585@1676093788.290529:vhost_vdpa_set_vring_addr dev: 0x55a5a77cec20
>> index: 0 flags: 0x0 desc_user_addr: 0x1000 used_user_addr: 0x3000
>> avail_user_addr: 0x2000 log_guest_addr: 0x0
>> :
>> :
>> 9585@1676093788.543567:vhost_vdpa_dma_map vdpa:0x7ff1302b6190 fd: 16
>> msg_type: 2 asid: 0 iova: 0x16000 size: 0x2000 uaddr: 0x55a5a7959000
>> perm: 0x1 type: 2
>> 9585@1676093788.576923:vhost_vdpa_dma_map vdpa:0x7ff1302b6190 fd: 16
>> msg_type: 2 asid: 0 iova: 0x18000 size: 0x1000 uaddr: 0x55a5a795c000
>> perm: 0x3 type: 2
>> 9585@1676093788.593881:vhost_vdpa_set_vring_addr dev: 0x55a5a7580930
>> index: 7 flags: 0x0 desc_user_addr: 0x16000 used_user_addr: 0x18000
>> avail_user_addr: 0x17000 log_guest_addr: 0x0
>> 9585@1676093788.593904:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16
>> msg_type: 2 asid: 1 iova: 0x19000 size: 0x1000 uaddr: 0x55a5a77f8000
>> perm: 0x1 type: 2
>> 9585@1676093788.606448:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16
>> msg_type: 2 asid: 1 iova: 0x1a000 size: 0x1000 uaddr: 0x55a5a77fa000
>> perm: 0x3 type: 2
>> 9585@1676093788.616253:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16
>> msg_type: 2 asid: 1 iova: 0x1b000 size: 0x1000 uaddr: 0x55a5a795f000
>> perm: 0x1 type: 2
>> 9585@1676093788.625956:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16
>> msg_type: 2 asid: 1 iova: 0x1c000 size: 0x1000 uaddr: 0x55a5a7f4e000
>> perm: 0x3 type: 2
>> 9585@1676093788.635655:vhost_vdpa_set_vring_addr dev: 0x55a5a7580ec0
>> index: 8 flags: 0x0 desc_user_addr: 0x1b000 used_user_addr: 0x1c000
>> avail_user_addr: 0x1b400 log_guest_addr: 0x0
>> 9585@1676093788.635667:vhost_vdpa_listener_region_add vdpa:
>> 0x7ff13026d190 iova 0x0 llend 0xa0000 vaddr: 0x7fef1fe00000 read-only: 0
>> 9585@1676093788.635670:vhost_vdpa_listener_begin_batch
>> vdpa:0x7ff13026d190 fd: 16 msg_type: 2 type: 5
>> 9585@1676093788.635677:vhost_vdpa_dma_map vdpa:0x7ff13026d190 fd: 16
>> msg_type: 2 asid: 0 iova: 0x0 size: 0xa0000 uaddr: 0x7fef1fe00000 perm:
>> 0x3 type: 2
>> 2023-02-11T05:36:28.635686Z qemu-system-x86_64: failed to write, fd=16,
>> errno=14 (Bad address)
>> 2023-02-11T05:36:28.635721Z qemu-system-x86_64: vhost vdpa map fail!
>> 2023-02-11T05:36:28.635744Z qemu-system-x86_64: vhost-vdpa: DMA mapping
>> failed, unable to continue
>>
> I'm not sure how you get to this. Maybe you were able to start the
> migration because the CVQ migration blocker was not effectively added?
It's something else, below line at the start of 
vhost_vdpa_net_cvq_start() would override the shadow_data on the CVQ.

     v->shadow_data = s->always_svq;

Which leads to my previous question why shadow_data needs to apply to 
the CVQ, and why the userspace iova is shared between data queues and CVQ.

-Siwei


>
> Thanks!
>
>
>> Regards,
>> -Siwei
>>> Thanks!
>>>
>>>> Thanks,
>>>> -Siwei
>>>>> +    }
>>>>> +
>>>>>         r = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer,
>>>>>                                    vhost_vdpa_net_cvq_cmd_page_len(), false);
>>>>>         if (unlikely(r < 0)) {
>>>>> @@ -449,15 +508,9 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
>>>>>         if (s->vhost_vdpa.shadow_vqs_enabled) {
>>>>>             vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
>>>>>             vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
>>>>> -        if (!s->always_svq) {
>>>>> -            /*
>>>>> -             * If only the CVQ is shadowed we can delete this safely.
>>>>> -             * If all the VQs are shadows this will be needed by the time the
>>>>> -             * device is started again to register SVQ vrings and similar.
>>>>> -             */
>>>>> -            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>>>> -        }
>>>>>         }
>>>>> +
>>>>> +    vhost_vdpa_net_client_stop(nc);
>>>>>     }
>>>>>
>>>>>     static ssize_t vhost_vdpa_net_cvq_add(VhostVDPAState *s, size_t out_len,
>>>>> @@ -667,8 +720,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>>>                                            int nvqs,
>>>>>                                            bool is_datapath,
>>>>>                                            bool svq,
>>>>> -                                       struct vhost_vdpa_iova_range iova_range,
>>>>> -                                       VhostIOVATree *iova_tree)
>>>>> +                                       struct vhost_vdpa_iova_range iova_range)
>>>>>     {
>>>>>         NetClientState *nc = NULL;
>>>>>         VhostVDPAState *s;
>>>>> @@ -690,7 +742,6 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>>>         s->vhost_vdpa.shadow_vqs_enabled = svq;
>>>>>         s->vhost_vdpa.iova_range = iova_range;
>>>>>         s->vhost_vdpa.shadow_data = svq;
>>>>> -    s->vhost_vdpa.iova_tree = iova_tree;
>>>>>         if (!is_datapath) {
>>>>>             s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
>>>>>                                                 vhost_vdpa_net_cvq_cmd_page_len());
>>>>> @@ -760,7 +811,6 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>>>         uint64_t features;
>>>>>         int vdpa_device_fd;
>>>>>         g_autofree NetClientState **ncs = NULL;
>>>>> -    g_autoptr(VhostIOVATree) iova_tree = NULL;
>>>>>         struct vhost_vdpa_iova_range iova_range;
>>>>>         NetClientState *nc;
>>>>>         int queue_pairs, r, i = 0, has_cvq = 0;
>>>>> @@ -812,12 +862,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>>>             goto err;
>>>>>         }
>>>>>
>>>>> -    if (opts->x_svq) {
>>>>> -        if (!vhost_vdpa_net_valid_svq_features(features, errp)) {
>>>>> -            goto err_svq;
>>>>> -        }
>>>>> -
>>>>> -        iova_tree = vhost_iova_tree_new(iova_range.first, iova_range.last);
>>>>> +    if (opts->x_svq && !vhost_vdpa_net_valid_svq_features(features, errp)) {
>>>>> +        goto err;
>>>>>         }
>>>>>
>>>>>         ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
>>>>> @@ -825,7 +871,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>>>         for (i = 0; i < queue_pairs; i++) {
>>>>>             ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>>>>>                                          vdpa_device_fd, i, 2, true, opts->x_svq,
>>>>> -                                     iova_range, iova_tree);
>>>>> +                                     iova_range);
>>>>>             if (!ncs[i])
>>>>>                 goto err;
>>>>>         }
>>>>> @@ -833,13 +879,11 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>>>>>         if (has_cvq) {
>>>>>             nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
>>>>>                                      vdpa_device_fd, i, 1, false,
>>>>> -                                 opts->x_svq, iova_range, iova_tree);
>>>>> +                                 opts->x_svq, iova_range);
>>>>>             if (!nc)
>>>>>                 goto err;
>>>>>         }
>>>>>
>>>>> -    /* iova_tree ownership belongs to last NetClientState */
>>>>> -    g_steal_pointer(&iova_tree);
>>>>>         return 0;
>>>>>
>>>>>     err:
>>>>> @@ -849,7 +893,6 @@ err:
>>>>>             }
>>>>>         }
>>>>>
>>>>> -err_svq:
>>>>>         qemu_close(vdpa_device_fd);
>>>>>
>>>>>         return -1;


