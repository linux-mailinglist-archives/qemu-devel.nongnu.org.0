Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9290768A7BF
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 03:05:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO7uj-0005d3-9t; Fri, 03 Feb 2023 21:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pO7ug-0005cl-Kt
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 21:04:22 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1pO7ud-0001oN-JC
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 21:04:22 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3141WM3O022113; Sat, 4 Feb 2023 02:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=qTXXi4z0SpXj6uw0KON/0y/WrBvRkglNF1ycXR5lbc4=;
 b=KMXO+i7HMS/i+BUYYLiIWOPC9p2/ZYe2xIAG8HIyh3uTboINfrz1R8eJMVTr9d12Vn0m
 AHJRplc/fbmdBlFlbbsh6TF2eTs3LLAAYMoR51ZEEgdPnjEBoKofGAM6gNwWrk71mfO8
 gRqKU+mTI/uZ7DEvzDVzKAW0LdINW1Q4XspVizqXSsyXEdVpEod+44aCJex/9BjKiCku
 xqJdGd468+IUpoUu+auwQ73GdMKtOA7Ey/TKF4MSHegsc4IJTmMx2VPumDPjBjCxgtvo
 VRpRhpn+iOQPSYNRjjw6bQ6iPKR/sr7ODqkWqnut5HXFPinX+y2Kfs0xw/iyGRkElIw6 JA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhdsdg113-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 04 Feb 2023 02:04:05 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3141XwfI037575; Sat, 4 Feb 2023 02:04:05 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdt88khv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 04 Feb 2023 02:04:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiDmGOvzVW0ImQfbAXVWuVfcBLSbq/0Qqt2HUQfCsoJECpISmD6VUxV0Gfsf43YVHaj1UaH9sRwOnTXr8FDR4lgR+NXnGMOKrD8JiJm+7XBK1forjvpq27mh/RR98gKp9g7ugy3gBmmHAOAV+lK6qn2vFxwCbjwtATD9STkPQrhVj4nMSsh+S6JV9fkLqj3gbiuoto+iPQffBvyRradn9YcpQYn4ZyBTd76K/HwEw1fuHW36N8GCFEBmZLZ5B0MIC+i5UCkgT8RkzRUJIZxt0V4w6XCMQgBFpAmxRAQR1DIeuwSOCbtXEA+qIhavChJBD/EwNM7NTCma+U0dEqjS8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTXXi4z0SpXj6uw0KON/0y/WrBvRkglNF1ycXR5lbc4=;
 b=eHme6a+68/K1hxZ73flf/sX5qy5EB4S2TCePfmTE9xNnnpyWl4MKSP6ZKuz77HWW8W0rSnkASTIbv1YbwBaKxrS6WVQpBqs8RwQjNgrbGabjbqgZMsyGM/6BAK2MI3SJKduX12C3YKk1+1tiTdC6lQk+3YU4QRDvq/1Y35+0z/iSyC35oj5ZjaRVdtdfLjPUCRtFhH864x10P62nglsLWX85TOAf+RkUsh8lpkteqh865Bf2/waWiUL8hTO7a9OoDqAYJN2cBD9EsyN+k72Kco+ayg9Weyh4cu3BV5z6DKHH6fsTOqvay/mPOY/xUuwZKfCpRPpJZmXMZ8aFZJ9vog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTXXi4z0SpXj6uw0KON/0y/WrBvRkglNF1ycXR5lbc4=;
 b=dw04qbpUWC/qvIf1/ckqzUQDqd1TMlV95u7wiojnB7BGqTfw5FpHu5jPmXos0h7VGvDl2HRNth564IvtZVX1HnNb8TELu2oAyRvz5OtYNwq8RbMTZoMfkpvyfOiBajSRVqtO8s+4266Owp2lF2MaESjxOuQ2FkdkID6W1jILqqE=
Received: from MW4PR10MB6535.namprd10.prod.outlook.com (2603:10b6:303:225::12)
 by SJ0PR10MB4718.namprd10.prod.outlook.com (2603:10b6:a03:2dd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.8; Sat, 4 Feb
 2023 02:04:01 +0000
Received: from MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::cd0e:bbf4:4b15:308b]) by MW4PR10MB6535.namprd10.prod.outlook.com
 ([fe80::cd0e:bbf4:4b15:308b%6]) with mapi id 15.20.6086.009; Sat, 4 Feb 2023
 02:04:01 +0000
Message-ID: <ab75ec37-763b-2055-01e9-10e87ef6e956@oracle.com>
Date: Fri, 3 Feb 2023 18:03:56 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC v2 11/13] vdpa: add vdpa net migration state notifier
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>
Cc: qemu-devel@nongnu.org, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-12-eperezma@redhat.com>
 <d434e204-6847-f34f-258a-9ae1cf6328ce@oracle.com>
 <CAJaqyWf5mNxjeAskVjLTFu08LpPxiHffhrtknKB75aUAEayEcQ@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJaqyWf5mNxjeAskVjLTFu08LpPxiHffhrtknKB75aUAEayEcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::31) To MW4PR10MB6535.namprd10.prod.outlook.com
 (2603:10b6:303:225::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6535:EE_|SJ0PR10MB4718:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e4966b-f62e-45f2-3b26-08db0654154b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0887yTHJTfG1xMrDU2eHlmDrFapFEHM6eR24idQ93HJTllkGAtCQx2rhIYo1OJZvqdEJvKxb34VZdDnRE4NGa6PGt2aH2EQ55uay2/1prY429MYukv7lO37MElKfD42DheE0ECdKy3G3NKdXOu55HHED3BHppMryC0/DGCNkkvriOMp+8OaZ5QXMFOnZzNw7YeuPGc8eFQMPA99WYUpbxPUwLRbdMgBWP00se8NI3ZjotFGswbJbzEx7CM/5pltlHl25nc5xZsvqiMq6yeVeBvgBgVV/TfYQcDz5TNEUmxItyyFLaUGWoixDCyM8pteWFrlxsw8OZxsChPBNdxIz9/VtWPa7rieaYYXPCOqWajc4RsMQd/z9NknqZ0qqdpyHi/KiPQnw2t7cNiwyQoR9Ay0LLUwXQtYew/OIHLRo3RdLVWcZgs9kQxzt+7KG6QOFnRdRnprICgjY75Rg40VGuRKKGfGyKsms40OP/naUbHqSchIYILahzv46gKJ4C5JvYibooU1lrRRLgvcqPMitx6n3+3jlABYiFKxkOH73IBdjOzKoI6Q/vogv3ZDMo+Hj44A2saQ+ULuHyQ/RMJpQeWVfRLOWI+EScTf+4W9ao/A3LQTlcA0DVFsp8npiq4oTAhFcYEaM7FSl3qs2S0sH5iemkz5sm+7yoCRaxxTXnuNvl24je00gPglKmbTv0yq3qhBxq+TEIX1SJNfM4Uz72PNwBaX0vGmqyCTFK3a0/Uc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR10MB6535.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199018)(66899018)(6666004)(31686004)(2906002)(36916002)(36756003)(6486002)(30864003)(66556008)(6512007)(186003)(53546011)(5660300002)(478600001)(26005)(66574015)(31696002)(2616005)(8936002)(86362001)(66476007)(41300700001)(7416002)(66946007)(83380400001)(8676002)(4326008)(54906003)(6506007)(316002)(38100700002)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3lQMkJvWnp4OFVYTGFrVnZDdEgwc2pIZnhSUGEzVjloMk9YWXl3N0lvZTh6?=
 =?utf-8?B?akdBZ1dGb3NsWUsrSjJIYld0NjV3RGdvNFo0Rmk3ZFpkc3NLYXhISEc5Z1NX?=
 =?utf-8?B?MHBLb2NNTmJRSzhJSHIrcElJd1VsYm1KelhjSUE1Y0YwL0tNVzNxWHJ4Y2ZB?=
 =?utf-8?B?Z2xoNEltTmRxd1pBVno3cEVrQmN1VzFGWEFjazRTdHI4Wm1GSXRzdTZsTE1U?=
 =?utf-8?B?WDVIV1llR1FTa2w4VDVZdExJMmF3c0lnaFRaUFlXbHVaQkk1b09UeW5DYTFF?=
 =?utf-8?B?VmZyUFBVSHZPRFBMRVFndisrRnd5N2lSZUpoRmgxbUtUbWovU29DZ2RzWDhl?=
 =?utf-8?B?SWpqVHd2cU1TNmJVdmlnc0wrZFRMQUlHaUpVdUM4Uy9abjZwZkxzME9jY2V6?=
 =?utf-8?B?RE5ObzJLMlNsdXBlZGZtUTVTUVU2a0VsSUpNNFNRVzBRZFJZUkErV2ErQncr?=
 =?utf-8?B?c1A2ZzJIOVhURlc4NXRmQ1E2RHVhNXN2QXJNWnk4T3JINlVFSHpTSFZYQTJG?=
 =?utf-8?B?OXBBQVdSOFE5UjJFSzlNWXRKSWNYQmY2WC82WkkzRUJWRmFPeEpzQWVVMU11?=
 =?utf-8?B?eVhjczJKK3VYaFppUVhOVkEvL0tUYUZpZW5aQ2NOK2NmVHpWdHZXNTVwZG1a?=
 =?utf-8?B?TnBlSUhYbWNsNEZOWjBQbzBaU0d6VkpzZzN2NlphTU9ZQlh4azh6MkxHc05Q?=
 =?utf-8?B?K2hnMjh0UGdOYloyRE9MczFUZ1B6WFVUUHZlVEJMNXdlRHYveHNZV08xYVBs?=
 =?utf-8?B?ZWtKWDBML1dsWDdNMEpDOTE1endVMEVXVTRmMkxMYUh5ckZiSTg5anNpM0dv?=
 =?utf-8?B?UHduTDA2SGt3KzZCVXhXNXpzYjRwZ0h5aSt4OEpjZ2pma0N3L1REa3pEZzAy?=
 =?utf-8?B?OUtkOEV5dnZtbFg3WDdDTXZQSXBJQytQM0xCZkM1TXNxS0pvd2NLSFVLOW9J?=
 =?utf-8?B?UlB2MWlySnQ5VGNnUktLaVBscVRpeWNGZldCWk5zOURjVGFDNytveW1xbHRx?=
 =?utf-8?B?RWJlYmllckd3Q2lNWU9ZLys5VDlWTmVOYVprcEczNjJ2akRWUzRIb0RZb2J4?=
 =?utf-8?B?UldtbG94cnZSVm5UOUl2UzhrWGN3SG5FL2F6aFRDMko4V1Z5RHhieFQ2UFJz?=
 =?utf-8?B?LzVUSXVjVmk4YzJEbmsrd1pPTHpBZm5odEVSZENSOE83T0IyYzlQR2l0ZWlQ?=
 =?utf-8?B?TWRtSDBtdjFDLzIxR2lDVzZkOXhrVUdUZ3NndDl3WFQxNDQ4TjBsZzVmUnBv?=
 =?utf-8?B?cFlRK2NsRnViNlhVMEhKTFRvU1YzSDY0ekRrYlp1MGExVGNESndaR2NFRUl0?=
 =?utf-8?B?Qmo1b3BUOTZKb09kU3NOU01Kbk5SU05vMFZKZklpN1VXT0hUbXRFYjgvd0tk?=
 =?utf-8?B?OWJlVXZBVDV4c3ZYcHJJQXFDaENpUzJuQ1NBNDNQc2pSVC9XMEpnN3VWVUJx?=
 =?utf-8?B?WHBuWXdDSDAxVXZoWGQ1dFNSWGk4MEtHZDRKQU5aeTZkVHY2cDV2OXF6V1Fp?=
 =?utf-8?B?TkxmdjZhQVBjNldtTWZnTEVEbmtGb0QwY0dlb200L09jVjBVVGNZTE9JNDJH?=
 =?utf-8?B?Mm9ZUll3U1VKcXJjblFLUThIdVkrTTZQVWw2aTZTcGpCSHZQeE5UaFIxak1s?=
 =?utf-8?B?Z0h2ZGlJelJBcXpFRjB6RVIyVTYvM3dCQjRYOW1IbXoySWZkRTFjc3hxZ0tK?=
 =?utf-8?B?WmFDQVRqOFJFN3prV1pWLzJUVXYzZzBmaHdiWGxnNyt2cmczOXJReGNtRmp1?=
 =?utf-8?B?YUt3Q29ZaHVJK1Q3UUJXMnNQemhTOXpEY0UwNWx0VHFoQmFoaG1EdlVlUG1P?=
 =?utf-8?B?NmxjeW94ZXhrTEpRWEI2L3lOTENJRTgwQ3JlNUhOeDRIRzluR1JkTm82aE5U?=
 =?utf-8?B?dHF3SXg4MlJ4Y2dkaGMwajB4U1NBRVAzUzFuUCtUYi9NSkFEc01HZlpjQWgw?=
 =?utf-8?B?dXJ4blpnSTFLU3RrMkE5ajZmL0pYc21OdGN1bDZjY1NLdnVmMUpaYkF0VDRl?=
 =?utf-8?B?T1VVK0I2V3V1am92SFFRVVRDM3pBS2RHSHlOaGJUL3BzOW1IRUpyRExCZW9Z?=
 =?utf-8?B?UGcwblEwYUpMNEwrcTdvZlpKaGN2amIyMG1jaG9KYTZBOXovTGk2OWM1WlNh?=
 =?utf-8?Q?fBJ6aOMv8S7fJ8D0vWgrp0GZY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?NHZRL1drVU1vTGJrTmRNcEhvQ1dYbnBtQ1cvTFg5algwL3Z3OEpUamRtdys5?=
 =?utf-8?B?SFZORnpEdVJtK3JuME91SWxTNXl2a1BYY2lQUHNodFhVclNQc1J1R0Y1WEFF?=
 =?utf-8?B?MFU3TmcvR05rNzJIeU94cDY4QVU1U2o2UmRCNm1hbnVtRlAxY2pweXB3ek53?=
 =?utf-8?B?WStnZW41cCtwTk44bzFDc1dtUVRRMVdPMHliVEZtWU1SaFJpMU1KTkk4WWJH?=
 =?utf-8?B?ZzdORkUrRFJUOVVwUUEyTnVraHNyNys1WDBQbWtMb0NLVElLZDJ1YmdxUXNU?=
 =?utf-8?B?bk5XNnUxTFZXQlZIS042aGhENWd4WDJHNHdBMWd2N0oyNm9oYmNoMUthbWNT?=
 =?utf-8?B?ZEYyUUJWSnlOSEVwY2ptelQrYld1SlozUVF0UGw1eklFTkNRNEZmUjVoM1hp?=
 =?utf-8?B?SEhhSzZGWEZWYTJLYS9HbW44dkI2ckYxLzRRQTJSdXFOellKT1JjcTNpbG9P?=
 =?utf-8?B?Wkl3bmNneTFpK254ZkhoLzdGNE90RFFtOU44ZXBuRjBLQXhRT0M0UStkTHNT?=
 =?utf-8?B?VG1qOEozZm50MVVicG1SdmFubTVJSlZ3alk1MnRaYlVIcysvUW1PU1NseGxD?=
 =?utf-8?B?TEJpR2NaM0FPelUzRlFidHJPVWp1emV1bjA3dWNYNVhrYUUwT3BCQkU1azMy?=
 =?utf-8?B?RDhhN2I2R1RrZElOL3dOcHVWR3VSU29GTThoVXpMaXFaQkMzaG9BTkx0bHNE?=
 =?utf-8?B?VEp1OGszeWNyb0F4NjNrRDNDd1BUQlRnb2IzYm02VjF4REhuTG1UamRMOWd0?=
 =?utf-8?B?TXViakZPbW1zUUMwZGN2K2hYOWNXVVN3aUY0VFV2a2ZRZlJ5RzcyZFdjemFz?=
 =?utf-8?B?NnpDWmlxVW5CRnlyeWI1akcxUVM3aUx0THRjZXk3MFNYWUJhLzM4ZEMrejBq?=
 =?utf-8?B?clhTc3J5aXJXNFEvVC9WOGUvNHZ1UDVZaWowRXJkNm8zVHN0eUFDeFlHZnRy?=
 =?utf-8?B?aHcyb3cwSGFBUFR2K2YrK20yajd0ZW95bjh2Vm5uckpvWWxvOVhpditMTjV2?=
 =?utf-8?B?NVNZbXBWV1I2SDM3OFlHS3kwQ1JVdTZnNXEzdHRyRUV3bGc5RUt2a1U5T1Ja?=
 =?utf-8?B?KzN4WWtvNi91QWVIVDdWMmI2cGNOYmNadXAwejNXcVBvZUxZaGxXamV4cjBY?=
 =?utf-8?B?M3BvaXI4QVJKaldrUjVrWkprOGw2MlJZSzNoLzI1eWxwTlk0eTRyNmtuYUI4?=
 =?utf-8?B?dmZtTW5IbzlEaEdnK2JFdkdxM1VsM2RLR0FZNGRvSkxIUDhWcnRxZDVpbzNa?=
 =?utf-8?B?ckwzUEZWM2NVRGNxajdJbFk0ZW5TeTVJd1ZLNXpEdnFLa1pHZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e4966b-f62e-45f2-3b26-08db0654154b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6535.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2023 02:04:00.8733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMdB2Q3ujKEs5kLwVNPFJHugZ0VupcRtIiMSOCB5S/XLdy7qGs+rbZ0Q5pq6y/9Fffs1R7jJ+g037g+o9PcmHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4718
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_21,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 adultscore=0
 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302040018
X-Proofpoint-ORIG-GUID: 1I4BnqmOEFpaSjbos8NvOl5lvV5nfA79
X-Proofpoint-GUID: 1I4BnqmOEFpaSjbos8NvOl5lvV5nfA79
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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



On 2/2/2023 7:28 AM, Eugenio Perez Martin wrote:
> On Thu, Feb 2, 2023 at 2:53 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 1/12/2023 9:24 AM, Eugenio Pérez wrote:
>>> This allows net to restart the device backend to configure SVQ on it.
>>>
>>> Ideally, these changes should not be net specific. However, the vdpa net
>>> backend is the one with enough knowledge to configure everything because
>>> of some reasons:
>>> * Queues might need to be shadowed or not depending on its kind (control
>>>     vs data).
>>> * Queues need to share the same map translations (iova tree).
>>>
>>> Because of that it is cleaner to restart the whole net backend and
>>> configure again as expected, similar to how vhost-kernel moves between
>>> userspace and passthrough.
>>>
>>> If more kinds of devices need dynamic switching to SVQ we can create a
>>> callback struct like VhostOps and move most of the code there.
>>> VhostOps cannot be reused since all vdpa backend share them, and to
>>> personalize just for networking would be too heavy.
>>>
>>> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>>> ---
>>>    net/vhost-vdpa.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>    1 file changed, 84 insertions(+)
>>>
>>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>>> index 5d7ad6e4d7..f38532b1df 100644
>>> --- a/net/vhost-vdpa.c
>>> +++ b/net/vhost-vdpa.c
>>> @@ -26,6 +26,8 @@
>>>    #include <err.h>
>>>    #include "standard-headers/linux/virtio_net.h"
>>>    #include "monitor/monitor.h"
>>> +#include "migration/migration.h"
>>> +#include "migration/misc.h"
>>>    #include "migration/blocker.h"
>>>    #include "hw/virtio/vhost.h"
>>>
>>> @@ -33,6 +35,7 @@
>>>    typedef struct VhostVDPAState {
>>>        NetClientState nc;
>>>        struct vhost_vdpa vhost_vdpa;
>>> +    Notifier migration_state;
>>>        Error *migration_blocker;
>>>        VHostNetState *vhost_net;
>>>
>>> @@ -243,10 +246,86 @@ static VhostVDPAState *vhost_vdpa_net_first_nc_vdpa(VhostVDPAState *s)
>>>        return DO_UPCAST(VhostVDPAState, nc, nc0);
>>>    }
>>>
>>> +static void vhost_vdpa_net_log_global_enable(VhostVDPAState *s, bool enable)
>>> +{
>>> +    struct vhost_vdpa *v = &s->vhost_vdpa;
>>> +    VirtIONet *n;
>>> +    VirtIODevice *vdev;
>>> +    int data_queue_pairs, cvq, r;
>>> +    NetClientState *peer;
>>> +
>>> +    /* We are only called on the first data vqs and only if x-svq is not set */
>>> +    if (s->vhost_vdpa.shadow_vqs_enabled == enable) {
>>> +        return;
>>> +    }
>>> +
>>> +    vdev = v->dev->vdev;
>>> +    n = VIRTIO_NET(vdev);
>>> +    if (!n->vhost_started) {
>>> +        return;
>>> +    }
>>> +
>>> +    if (enable) {
>>> +        ioctl(v->device_fd, VHOST_VDPA_SUSPEND);
>>> +    }
>>> +    data_queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
>>> +    cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
>>> +                                  n->max_ncs - n->max_queue_pairs : 0;
>>> +    vhost_net_stop(vdev, n->nic->ncs, data_queue_pairs, cvq);
>>> +
>>> +    peer = s->nc.peer;
>>> +    for (int i = 0; i < data_queue_pairs + cvq; i++) {
>>> +        VhostVDPAState *vdpa_state;
>>> +        NetClientState *nc;
>>> +
>>> +        if (i < data_queue_pairs) {
>>> +            nc = qemu_get_peer(peer, i);
>>> +        } else {
>>> +            nc = qemu_get_peer(peer, n->max_queue_pairs);
>>> +        }
>>> +
>>> +        vdpa_state = DO_UPCAST(VhostVDPAState, nc, nc);
>>> +        vdpa_state->vhost_vdpa.shadow_data = enable;
>>> +
>>> +        if (i < data_queue_pairs) {
>>> +            /* Do not override CVQ shadow_vqs_enabled */
>>> +            vdpa_state->vhost_vdpa.shadow_vqs_enabled = enable;
>>> +        }
>>> +    }
>>> +
>>> +    r = vhost_net_start(vdev, n->nic->ncs, data_queue_pairs, cvq);
>> As the first revision, this method (vhost_net_stop followed by
>> vhost_net_start) should be fine for software vhost-vdpa backend for e.g.
>> vp_vdpa and vdpa_sim_net. However, I would like to get your attention
>> that this method implies substantial blackout time for mode switching on
>> real hardware - get a full cycle of device reset of getting memory
>> mappings torn down, unpin & repin same set of pages, and set up new
>> mapping would take very significant amount of time, especially for a
>> large VM. Maybe we can do:
>>
> Right, I think this is something that deserves optimization in the future.
>
> Note that we must replace the mappings anyway, with all passthrough
> queues stopped.
Yes, unmap and remap is needed indeed. I haven't checked, does shadow vq 
keep mapping to the same GPA where passthrough data virtqueues were 
associated with across switch (so that the mode switch is transparent to 
the guest)? For platform IOMMU the mapping and remapping cost is 
inevitable, though I wonder for the on-chip IOMMU case could it take 
some fast path to just replace IOVA in place without destroying and 
setting up all mapping entries, if the same GPA is going to be used for 
the data rings (copy Eli for his input).

>   This is because SVQ vrings are not in the guest space.
> The pin can be skipped though, I think that's a low hand fruit here.
Yes, that's right. For a large VM pining overhead usually overweighs the 
mapping cost. It would be a great amount of time saving if pin can be 
skipped.

>
> If any, we can track guest's IOVA and add SVQ vrings in a hole. If
> guest's IOVA layout changes, we can translate it then to a new
> location. That way we only need one map operation in the worst case.
> I'm omitting the lookup time here, but I still should be worth it.
>
> But as you mention I think it is not worth complicating this series
> and we can think about it on top.
Yes, agreed. I'll just let you aware of the need of this optimization 
for real hardware device.

>   We can start building it on top of
> your suggestions for sure.
>
>> 1) replace reset with the RESUME feature that was just added to the
>> vhost-vdpa ioctls in kernel
> We cannot change vring addresses just with a SUSPEND / RESUME.
I wonder if we can make SUSPEND (via some flag or new backend feature is 
fine) accept updating internal state like the vring addresses, while 
defer applying it to the device until RESUME? That way we don't lose a 
lot of other states that otherwise would need to re-instantiate at large 
with _F_RING_RESET or device reset.

>
> We could do it with the VIRTIO_F_RING_RESET feature though. Would it
> be advantageous to the device?
>
>> 2) add new vdpa ioctls to allow iova range rebound to new virtual
>> address for QEMU's shadow vq or back to device's vq
> Actually, if the device supports ASID we can allocate ASID 1 to that
> purpose. At this moment only CVQ vrings and control buffers are there
> when the device is passthrough.
Yep, we can get SVQ mapping pre-cooked in another ASID before dismantle 
the mapping for the passthrough VQ. This will help the general IOMMU case.

>
> But this doesn't solve the problem if we need to send all SVQ
> translation to the device on-chip IOMMU, doesn't it? We must clear all
> of it and send the new one to the device anyway.
>
>> 3) use a light-weighted sequence of suspend+rebind+resume to switch mode
>> on the fly instead of getting through the whole reset+restart cycle
>>
> I think this is the same as 1, isn't it?
I mean do all three together: 1,2 in kernel and 3 in QEMU.

>
>> I suspect the same idea could even be used to address high live
>> migration downtime seen on hardware vdpa device. What do you think?
>>
> I think this is a great start for sure! Some questions:
> a) Is the time on reprogramming on-chip IOMMU comparable to program
> regular IOMMU?
I would think this largely depends on the hardware implementation of 
on-chip IOMMU, the performance characteristics of which is very device 
specific. Some times driver software implementation and API for on-chip 
MMU also matters. Which would require vendor specific work to optimize 
based on the specific use case.

>   If it is the case it should be easier to find vdpa
> devices with support for _F_RESET soon.
> b) Not to merge on master, but it is possible to add an artificial
> delay on vdpa_sim that simulates the properties of the delay of IOMMU?
> In that line, have you observed if it is linear with the size of the
> memory, with the number of maps, other factors..?
As I said this is very device specific and hard to quantify, but I agree 
it's a good idea to simulate the delay and measure the effect. For the 
on-chip MMU device I'm looking, large proportion of the time was spent 
on software side in allocating a range of memory for hosting mapping 
entries (don't know how to quantify this part but the allocation time is 
not a constant nor linear to the size of memory), walking all iotlb 
entries passed down from vdpa layer and building corresponding memory 
key objects for a range of pages. For each iotlb entry the time to build 
memory mapping looks grow linearly with the size of memory. Not sure if 
there's room to improve, I'll let the owner to clarify.

Thanks,
-Siwei





>
> Thanks!
>
>> Thanks,
>> -Siwei
>>
>>> +    if (unlikely(r < 0)) {
>>> +        error_report("unable to start vhost net: %s(%d)", g_strerror(-r), -r);
>>> +    }
>>> +}
>>> +
>>> +static void vdpa_net_migration_state_notifier(Notifier *notifier, void *data)
>>> +{
>>> +    MigrationState *migration = data;
>>> +    VhostVDPAState *s = container_of(notifier, VhostVDPAState,
>>> +                                     migration_state);
>>> +
>>> +    switch (migration->state) {
>>> +    case MIGRATION_STATUS_SETUP:
>>> +        vhost_vdpa_net_log_global_enable(s, true);
>>> +        return;
>>> +
>>> +    case MIGRATION_STATUS_CANCELLING:
>>> +    case MIGRATION_STATUS_CANCELLED:
>>> +    case MIGRATION_STATUS_FAILED:
>>> +        vhost_vdpa_net_log_global_enable(s, false);
>>> +        return;
>>> +    };
>>> +}
>>> +
>>>    static void vhost_vdpa_net_data_start_first(VhostVDPAState *s)
>>>    {
>>>        struct vhost_vdpa *v = &s->vhost_vdpa;
>>>
>>> +    if (v->feature_log) {
>>> +        add_migration_state_change_notifier(&s->migration_state);
>>> +    }
>>> +
>>>        if (v->shadow_vqs_enabled) {
>>>            v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
>>>                                               v->iova_range.last);
>>> @@ -280,6 +359,10 @@ static void vhost_vdpa_net_client_stop(NetClientState *nc)
>>>
>>>        assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>>>
>>> +    if (s->vhost_vdpa.index == 0 && s->vhost_vdpa.feature_log) {
>>> +        remove_migration_state_change_notifier(&s->migration_state);
>>> +    }
>>> +
>>>        dev = s->vhost_vdpa.dev;
>>>        if (dev->vq_index + dev->nvqs == dev->vq_index_end) {
>>>            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
>>> @@ -767,6 +850,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>>>        s->vhost_vdpa.device_fd = vdpa_device_fd;
>>>        s->vhost_vdpa.index = queue_pair_index;
>>>        s->always_svq = svq;
>>> +    s->migration_state.notify = vdpa_net_migration_state_notifier;
>>>        s->vhost_vdpa.shadow_vqs_enabled = svq;
>>>        s->vhost_vdpa.iova_range = iova_range;
>>>        s->vhost_vdpa.shadow_data = svq;


