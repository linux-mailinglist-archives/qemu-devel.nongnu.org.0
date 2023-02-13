Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7E36947C5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:15:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZcQ-0008EI-NE; Mon, 13 Feb 2023 09:15:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRZcE-00089S-BU
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:15:34 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1pRZcC-00006Z-6Z
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:15:34 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31DASxR8027484; Mon, 13 Feb 2023 14:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=fKTtU3T06pxk9h6a2G8EGJsxjj1w5oiyTCcFAuGF27s=;
 b=YHlys/+kKS5PYL7QalSYkgXJawzKB4g0d6l29qsE2fq4EWSqPIxzOZQjTJy+1nKkb6bt
 Oiok8daad35y5iM2LTPAzG54kdCOk6OV88wmpmHtHTXUKi3SF7XP8av3VlIdQrBlsj2x
 NIfvbPgvycZdcuObEd9h+O5F9ZlSeE9OXdrnPXP4KvqcoIxLonUXZbA9LfKCHZ/bqo/F
 wzyBumsRAjFHY6ZozU0vAc+0zT90YPe3r3SC7P4/RxPzdDm34DHSog97nGIaMtm4YkN3
 oYicV0Pi1OiYTBAl2WSLnjYC9qlaiPS7TgMlOkyrfAE7PqaMjEnF+sAkiBZZIkFtOHFU Bg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3np2mtattf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:15:27 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31DDoxFx017956; Mon, 13 Feb 2023 14:15:27 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3np1f4mgmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Feb 2023 14:15:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n6WcrGeMtCDwji8xpvFRmGaACGprW/6HU6xjYedfDl5IiayHTOtAMPzEzv/GXejdYLJOuc+OoIrngKq3/HWapfSX0/t20lXlEbA04PCUKZW7ZKJxeat97swXZxA/CChNvYpJIGZ3eMgHhGr9d+H2itSIBjNIGOZUh37QdinQK7HLGyQwMT5TMSKto+i8XEPWosmBUwzbDSuETz7lj4gUp8lb2aCsxzLZOiFZATkmHjc9Caua3Kem53QJUQqW13WDxN17xbzeLhb1JxEIfWOTZYFZq5ZvN+V2t2Z4QdFDKq5yKHSEWrQgpUhRtA6jjBlnyfnYRpODy+KJnXEtepH98w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKTtU3T06pxk9h6a2G8EGJsxjj1w5oiyTCcFAuGF27s=;
 b=aE5KdngTrmMf/vU59H9I6OOth+B74PWl3h86I31umxT8wjpHfrLXy9/SEekdRYYQaNPMjNevxTPD0uKZoXUKPO5xTgDZUq1MRCRtyDOg06kgjkWaKK6U8WaVBD1xC2fbs85h90RNjjj7OQVDOoRHTLypmHMj75hnXaL3/EfxKTNVvYD4skUEwcEAADB0p8S4I7OJlwDQjgZyuZGpltN0Q8bJUxrpYnzyFNhjVVFVi5BiGPGjpl+NBy8foldK3p1lpfbhn/IaykA7libLXuMFtlVQOt4ehFJz4QZ4bs2bDunYQDHA0LOjwdzKxhZ3XAFp4642gZl/bOx2bGq4tGRgTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKTtU3T06pxk9h6a2G8EGJsxjj1w5oiyTCcFAuGF27s=;
 b=aaJOSjBAmlqj/U7ZoeNyiYdcQjO0zBCDEyFp33cH4VaWdlXR45uGMloX9dTHEVE1M6BMTIF3S3bRGfD4w59F1KVPi+WS0ownaw5AUV6Z2msZrg2QRmjHQc2UAEGS3oqDQKRRY7gAo+DGUZel3aNk8PhRq9hJKvE5hSrGqaieUk0=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by DS7PR10MB4880.namprd10.prod.outlook.com (2603:10b6:5:3ac::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.14; Mon, 13 Feb
 2023 14:15:25 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::8a7d:60c:7965:98c3%7]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 14:15:25 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Alexander
 Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH 01/10] hw/sparse-mem: clear memory on reset
In-Reply-To: <077b9581-5b16-13c8-f134-e7e190f75206@linaro.org>
References: <20230205042951.3570008-1-alxndr@bu.edu>
 <20230205042951.3570008-2-alxndr@bu.edu>
 <077b9581-5b16-13c8-f134-e7e190f75206@linaro.org>
Date: Mon, 13 Feb 2023 14:15:20 +0000
Message-ID: <m2ttzpr6rr.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB9PR02CA0019.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::24) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5138:EE_|DS7PR10MB4880:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a3b46ab-46bb-4fff-b7e2-08db0dccc009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bgX/ql84/IkWOaDCYRhQ0tZgfd7EsGbxyXzzpN8//+FRxPzSNz2XqmUEmIZJWygN5xSwJge5jRRoEIa8qkSwAW52JwhUCgxZiyolQXBeScqxhv+4CDwvmCruxLGZzRddHwiGJP0x9ggJdHC+yQCtEL5REamKd+AtAfJunhWlc6NIwavfSL/P1RuwtzhHnenOBZNHbzfnLATkjwcqI3YzrjP6cnA3llhV5tM6acb1sZpu/4dPs/ZgMDAkundwR/TAfh8klXP4FHLIKE0eMpHAxXpkl0TTiC+gI1jH+Ea0HxQVJVJIQEv1BMDlau6u1jBCN4Cr/Brfo0y4IaojjOudbiwYA2UrXX/Hz4Pkplt1mZGbFX4utS3BDL2TKLvDiELjH+rUzngNBr+JW0Ga/TZgh8HjgEI0Blel7epyLOqvn59BW/yY8oiDeVi//PVgNd8WHOvZSOkhAFQlsT2HwIMA5ty/2CX6EQJJzEGSjpMfYN3vOH+GrF5yJrPqvxxijDgEZdfxpuoC2jXrYE3dBDYOqV0uDtGsXh+3PeR0nPKD7qkH43ZVMGF0gr/pjew73u7/1It8YOWlTRuCpG7w5ocUQhlW2pG1+OVJsTrhySoLEvCMrd8bGHboert++JlF55waopRzHNuu8RWUXA58rzj6yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(136003)(396003)(376002)(346002)(39860400002)(451199018)(2906002)(8676002)(53546011)(36756003)(4744005)(41300700001)(5660300002)(8936002)(110136005)(54906003)(4326008)(66476007)(6486002)(478600001)(86362001)(316002)(66556008)(6506007)(44832011)(66946007)(26005)(38100700002)(186003)(2616005)(83380400001)(6512007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0o1T3lXYWJYbkFUQU1LNnJONWQwdXRvSmFSeGxsVVFGTmJzay9hZ0VkZFBR?=
 =?utf-8?B?QlZOeW94RjlQRnlDV1grcFF2MWYrc0paNTIzQTRkTXlzbmQxM0lHVWtmY2Ni?=
 =?utf-8?B?ZmZOR1pjTi9Va1F0cVdMeUJKUjJhSy84clNlNHVqMVJXN3JLSC9nN0hyT3Fv?=
 =?utf-8?B?M0lZVzVEdHNrVXNhR1dPelBXQktYdiszRUsrT01GcHJweUxPZ0ZxbjlyNjFY?=
 =?utf-8?B?bE5Mdjl5NC9pZDdoblUwcjZLT1FWeDUvMmsralY2dVJzeWIvd0JHM0VTWGtG?=
 =?utf-8?B?Y1RLa0dLRXdObzZ4cmZlVk5Ma2g3ZEdhTUN2bDVpTDlSTzlod0ZmNEVXV0xO?=
 =?utf-8?B?RWp3eFNKQ0pxYTMrU1ZhWklVd1diUGlRcmRTY0tPQm9wQnl6cytoMTE5aVlt?=
 =?utf-8?B?MDErK0N2TUJPUzhrUWx3L2hHMnIxUlp5dW1YTXB3NUVSZTlDTzg3Zkg0NTZE?=
 =?utf-8?B?UWxYYndsbWtEMDNkM3lDUUFhSys3Z0d3dDlSU0VKT3FYNVJSL2I4VFoxL2Mx?=
 =?utf-8?B?Qlh5UDh1Vkw4UnNZNGVrWVR0Sm9CTFJmR3NDNzZud05sSmxUMUhsZ2svVElV?=
 =?utf-8?B?dDZsOFpIMG1GTTI4SDVLTXdDcEtIZWpjSmN5R0MzMTNrVmRoNVY0M09PbFFH?=
 =?utf-8?B?MFUyc09kcWttbGJVZ2o1ZGNhNVZlR1A2dmZkZU4yRVVpUUZtSzhROUcwTm1B?=
 =?utf-8?B?S01rZjFqRE8xVTFCV1R4RFd0OU9SUjRDOUZQYkZYclJhVHBXU0duUkRhVnBI?=
 =?utf-8?B?aGgzU2VtRmNzaTY1TkxlWGhLNDRHTGRFdE9SUHQxZDcvVVo4UWU1MXk2L0I3?=
 =?utf-8?B?cXZRbnlCOE0zK1JVbXBLTUJ3MGtLdFMxdjFDQmZVbUtzZjNuakFjSVl0ZmFt?=
 =?utf-8?B?eExrdStCQzM1b0pTZlc0YXE2Q3o3Wk9QdW5ualdVZ1d3bU5FNzlwQ05ibnVT?=
 =?utf-8?B?OEVJK1l1amhVKzlDaVZZWWpYMlBaTkswNjgzZ3RRWjZwTCtVbm81bW93Smc1?=
 =?utf-8?B?TElMVThLQ1YvWUtrTG4xc2hyTmVRclVOYVUxVy9SVjkxaXd6WUlWck0ydmhi?=
 =?utf-8?B?V3IzVzhUUXQ5bFVjTzFheFNBT0NMSFlzcG9uMDQ1Y3VuL0w4ZkFqZkpJNnhN?=
 =?utf-8?B?R0dKOHk4YStkNXVmWGN5QzU2K3gxMDlaelJtcTRvaGRZbFRyNUtUY3VUMUtK?=
 =?utf-8?B?ZnQ2NU5neDBFbExOa2pTdTVRS2hzMERJelNTR2lYL3Y5SlJDUVVHeUNYdWl1?=
 =?utf-8?B?THVnaVhtV2hKUFl1OFBDeUhIUWVQVy96L3dyd1d0T0dMaWJreklVN1BNMjQ1?=
 =?utf-8?B?UVJQRytRSWlEWk02ZEhoWWxvazN1UE1tTmxmYU9acEE4Tk1HelVCa1FMTU5C?=
 =?utf-8?B?cnluK3ZvUURtdzZYZEhFYkRFUU0yNlNzaTFSaFFPTFcyeU4yWDJzVzV0YzNN?=
 =?utf-8?B?eFcrY3I1aFlKb2xjMWQ3bytKS1Y0cnJqeDE5QWlHTWl4TDdpTWNEZ2JEdVB5?=
 =?utf-8?B?bGs5dTMrU3JBaWN6R09IaWdJV2gvY2NPN2tlbncvTUZqUHloUmRiT0Z2YzlK?=
 =?utf-8?B?L3FVQzZ5SEU1SU90dUlUaUJ4cUpxbTJFUjUzbjAzdHhaWE1lT3RBVEd3R0Y2?=
 =?utf-8?B?ekUrRUFOMnRGbk1QbW9UdU9xbjZMMWEzWGNMNWFkRmJFQk8zUHVnUFh6a3dM?=
 =?utf-8?B?S0tsYjFLdGJKbUppWDFvYmhwNnNhWXVJVHZkbmxrWU1hcW0rRU9MQWt2cUM4?=
 =?utf-8?B?Y3RobG9TeEFsVjcvNlZYNTY4a2pjMlA2MzkyN0R6TkdkVmRGb1JvbUlRUWRY?=
 =?utf-8?B?bDU3cTFmV04rKzY1ZmxYR2ZvVTU4OUdkS1h2Uy9wNU05bHBvbVRsR1N0cmlq?=
 =?utf-8?B?Vi8wZGFmSUhVQmZMQ2dvRnU4OGlzUlNsQmpteTU0d0QxdkVOZ2laWm5PWTMy?=
 =?utf-8?B?Ym5VWi9VbzF5VUlFVkpZTFIwNzJBVk9GSmJKamRYdzN5d2ZwNlV6KytOYXBU?=
 =?utf-8?B?T3VDTGVWU2FnVjZuK0ROTnlhajBZZkI5Z2I1Y0dVMHUzTTJ0ZDRQbXJ0MFBM?=
 =?utf-8?B?bkxYWmQ1QjVRQVdkUVVXZnRrOUZHczFhMUhWYnlWdFNXWG0vUERzQzdvVmVr?=
 =?utf-8?B?ajhlUTBHUDk4TUZ4eW5Gd0t3VllOQ3JEZXB3TEtFVXdwOVFsdUFBc0tCUVQ3?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Xhd7mj55JwHMwLJdgCdVmA4IEprr9TQRDUa0CUWQrXRXW+nQxq8bXpnHoXRWXGeLqaoxzWkaz5fJdSS0Vdz/Ubfog3zC3TT58OO8aMEfwTJkfszfY0QBHXmJkpbBtez1HqDtR+oXHTma6tSmjPYsHEhoS9cioDSbHUZu61dvS8xgtjYUBsjPfDcsHcDhyRAz0aF/5tEv+bO1cvkyn7JyuyFnGiUPXsEpZI1uNiY/4ImhX2B3dBmpnMU1zjnsNcxdyqf9YU03tubPicrWeZH5g1hv5tlpnTobY0dvLT4tu7R5x8NMPO/KSmph2+6iKouNI+ay9tZCrtNjZeo5ksXshWQ2xEWmRgKIfv8DXSYx2sg8WzHR/RVXmn87JQAYmdl2sa2mSJo25CY+LphuNztO+RLRGemfXWhQZ/NWU0fKNz97HUJjVj5LA/WJwP+U0bQnhsEDI2VJWyey7YNpWyijqvP3pMqnaVmVpsIofrLxCrJOSmzLI7G86V2/7riBx9q+DD5JPnNyMTLDE7FLEBR9lBaBZEVpVsEQFL6eaHvKKsDaMnEw2CqND9+Gw2m+Nm1muG7g19b9R4VLnF7kdm4CpShEafAyjAAypWPwtS8TVHes3k5NQUFzih/sBSVGL0snisGBcMkNG8tdxSff6NEwuK5K4ISwIBIeDi44vSS9BUza7ezuFfSh2YJTiYn4W3bS8KOW+fIINV3WNc3E2w4OHLiDND0PoSgRtSGgvUiVsDBykYayFs6AbNBt5Y2b5Y6BW7hE/fbwvar1s1yqWuITVGBaChK2PEKjra3xNko3th7TSmeaKaLT5ZXQ5/g+Cdmy/5FfM+gnI8on58Df60fEA5568YIFQ2dra7g1/XkSBjY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3b46ab-46bb-4fff-b7e2-08db0dccc009
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:15:25.1128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKvH6x3sZ2qEyz63omrvGgnVGfu+z8kXElcYz6zoooH4FTs69p2LJ0KVjUCgHT6ZdMRWXauEWo5nwCdGESBG8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4880
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_09,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=935
 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302130128
X-Proofpoint-GUID: DX3Mct2r2qHJdrxBfOp-phJpV89YRZZS
X-Proofpoint-ORIG-GUID: DX3Mct2r2qHJdrxBfOp-phJpV89YRZZS
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
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

On Sunday, 2023-02-05 at 11:40:55 +01, Philippe Mathieu-Daud=C3=A9 wrote:
> On 5/2/23 05:29, Alexander Bulekov wrote:
>> We use sparse-mem for fuzzing. For long-running fuzzing processes, we
>> eventually end up with many allocated sparse-mem pages. To avoid this,
>> clear the allocated pages on system-reset.
>>=20
>> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>> ---
>>   hw/mem/sparse-mem.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

