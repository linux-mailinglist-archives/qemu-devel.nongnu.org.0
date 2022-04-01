Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B124EFCFD
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 01:09:35 +0200 (CEST)
Received: from localhost ([::1]:39190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naQOc-0001ca-DX
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 19:09:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1naQNI-0000wb-PK
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 19:08:12 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:49744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1naQNE-0000ON-Lq
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 19:08:11 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231JXt6o017617; 
 Fri, 1 Apr 2022 23:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=7TKvjo6qKBoxoM5kxJ9j+nCl9R2B6Hq0BDpPr6y4KmM=;
 b=gTqfTxWlEr5VrzSZcBiLeiPoSeiC4qBD460pnuc/mYi/HRHwENa57ras9OCwJ6iWrQBj
 3gEZfYPX4gqGn+gSQ/zDiCv/isVBTO+kbVqE+rAML9clE2wT1nFI21iHyamJDZq/DBfY
 9RMBBikZLY1a4Yn8Re93oPSU36AwCiep6x48tWc2ZFgRDBVbqMjPp20KrupbN88wCnBg
 mqLqzZcVWc+XEAHbceONFxQRLZGVXp/GTY0+eMALb3Rwa7cIta94J//lFPqUuZVPhdtv
 7qBQ1pDpdIwM1AkwHCrsCU7LKKqBkLBLOHdUIhUgB2VqlFrFhU60Ct79btmY4qoQa8Lc 5Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1ucu0e8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 23:08:00 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 231N7OjO025176; Fri, 1 Apr 2022 23:07:59 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f1s96e3cf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Apr 2022 23:07:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLQQZbEKG9v6WxsMMH0IxiRMiPO8EXx/++UcmkgdnkMU3Q+XlCIHZ+KCr/0PGVGrlD8Gj51KGKHVxzJaEhgMcdGglVEuKDpgTpAbYt8k3HzqObk2FFMQ4eLzZsqYZp6eXZXaMUfj1HIOYkQaFvKd84dbKEkSCHOn736vg/xnjUU/TLQlIZVGkrhNxMKrWHcw9Fy+2dK7Ux7V3dLMEjQnhH19HU85A8bS7z9dJXpqAM2RLut681XoItTa5P3RjY66VCDPev1cAtlWz6u3eWgcIjw/AUspFAREftQd0QAeVGxcxpIktkpVo5+wd25UM++2F+D0BJNnVo3gsnNsGL56vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TKvjo6qKBoxoM5kxJ9j+nCl9R2B6Hq0BDpPr6y4KmM=;
 b=Xd4NEIyK4PH67ZctH66bboVbnvb2ujtmBl84TGk6n92r5bZBI0Pnc2Jcfg7qvJoUcfMcSPdc+w77imeUaqyILIHZWIiC216BWmZtVBLALo6yyEyBdSU+CEaD/+fh68hDczXilFvW7y/9jPIZ+Yu7ve3DyxaTKGKnmchWTxRoZjRk9X7ve5lvC1mfzF3z7RpzjSOT2LFPsaYVJ3GMHzmfnnYHaj0UNWuheYerui7UgiQB6W+FPouv1Rp5pYL1ttLsNNWPMuBOMvKtIlKawYJP/TCCiKqQzzo5J/JErxHoGpq4m70j2KmJs1E0Jaw3wek1PPol1Oo5BDKc+PaNSvYYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TKvjo6qKBoxoM5kxJ9j+nCl9R2B6Hq0BDpPr6y4KmM=;
 b=bCKYADu2yfFJ4ZhDqHEXVdTw+RNPhENCaYJS4nE6AhJNHld8CjhMYLognY1pWQEphn5ujNV8J5dld4tcqmIFbiqIyDE8xGe7fWAgMfuueyVjhcYzsWzoKVfTRRryhwofpI56pxx/i1inINGC3+MnUMOR2phtMnI6XcqbOKnVc/0=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by SA2PR10MB4619.namprd10.prod.outlook.com (2603:10b6:806:11e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.28; Fri, 1 Apr
 2022 23:07:57 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::9d4f:2df4:8bd8:f468]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::9d4f:2df4:8bd8:f468%3]) with mapi id 15.20.5123.023; Fri, 1 Apr 2022
 23:07:57 +0000
Message-ID: <ab772bc3-4acd-bb79-7f97-0518e04bb7fe@oracle.com>
Date: Fri, 1 Apr 2022 16:07:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4] vdpa: reset the backend device in the end of
 vhost_net_stop()
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, Michael Qiu <qiudayu@archeros.com>
References: <1648718713-7637-1-git-send-email-qiudayu@archeros.com>
 <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
 <CACGkMEuQ_YW+aSysnFtDrjy=Wjq_U3KouOobYSC+e5+5SR0zEA@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEuQ_YW+aSysnFtDrjy=Wjq_U3KouOobYSC+e5+5SR0zEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR06CA0029.namprd06.prod.outlook.com
 (2603:10b6:8:54::29) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 686b14b7-0613-45e2-74c2-08da143475c4
X-MS-TrafficTypeDiagnostic: SA2PR10MB4619:EE_
X-Microsoft-Antispam-PRVS: <SA2PR10MB46196B00AD1346E105FDDA65B1E09@SA2PR10MB4619.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DF3E/fWklmDcWo6P2fV2TpcTlh38E5wnQnYdYEokizuDonXo44ezJOwlLobC8X/gnSaCByfPouEGr1BAIapHXA7geKk24gzoBNFhluV9UZRpz8ISvuP/NXz7VNcTZLr8KHe5I26Mx2JmqnXwz0m+akj/Ea7ApyjGruk2jseoNSS9VykrWlj87sY6Vl0YI4i7HbEr92JCZ/p0pJA9nYOvi3h8LdRFK+nQdtzIQr1ieiuFDUGYnBNaYpk0uHCw+Uc/qGZnTKXkxMAI/1zL4VvuBEe/FnseRrd6Vttd0WOJRZ6QLMijNiLEgKRlZWpe7wSpKEeo9Pp8Mpsced05k8wQY8J6kVRqmmJ4XvuopegKZjVHQxsjB4MTmoq2kaRemlDLeAX4hCD41EnBbHHmDTEIc7G3lgYSgPtVf/dc36HNXukoaLA9Q+S3rEh6Mxl0nkr3+C5x1xXZxGgNqGZee8PeCVyQzI71E0gipCeRvfqpGnyYnsMvLVJk8jnlKQjxI5KkUYFHSyacwSEOqF3vuhNmjqk3BY4m3U9PJL0u0x8CWN+EoQyFb3Z7YVOa057bafmPzNoFJ71GPhJ7XrbXGDOMJoZE0HkDqxFyOvldlvD3nQDwOXhKr9DYBxUj9Dy0Z4hjWt8I/pLP+/PSgQ5JdGOF5QqK0b3WW6tO118HQq50MrgT+L+528jllDd5s7+jyjDMyNtxqDlKvlUa7PRigpV2ZI+3RuGzngNrgDxqmEL4VKT0WYj6jYJCDul3lQ5E0Ng4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(66556008)(66476007)(8676002)(508600001)(6512007)(53546011)(36916002)(66946007)(316002)(31696002)(6486002)(86362001)(54906003)(110136005)(6506007)(83380400001)(6666004)(38100700002)(186003)(26005)(2616005)(5660300002)(31686004)(36756003)(2906002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K29OYWR4ZjU3TnNpelgxQXFQVldzMU1LU1d5UmN2blJjSXlCQS91aVcyZXFt?=
 =?utf-8?B?V3d6bzZoT09LeWM3Skd4NU54UzZPVTR2SEl5MjJtZ0tKTTRWalV2RmRpNlhP?=
 =?utf-8?B?Y2Z3ZWVKRHZISmU0cVdPVng0ZWk0eDl6Y1o5UDhmMS84VjJFa3N0azROMmcv?=
 =?utf-8?B?T3ptU05BcUF1VXkvSXJKKzN4b3FJRFBvSys5Q29nNDVIc096U2VhaEc1ZnA5?=
 =?utf-8?B?eTVjTUpTWUZoeWtDYUg4MkloS3Z6SFZTTHFBQ0RWQVVja3czZENwYkF4RHQ5?=
 =?utf-8?B?bXVEKzh2UE5WRVVyU2hrNjhBTjVTYU9ld1AyYTVydkMvZTNuZVg3WHR5OXZS?=
 =?utf-8?B?MlNZQ0JvVHFXTk9xTWM0SzJkMGFCYmYxNzBGdzY3KzJmZFkzd1BjV1R4KzFI?=
 =?utf-8?B?WXJ1c3VENm02UkQ5b1oyY0FVUlczNmFBdEhXNjI1UlByVzZMUzVYRlIxSTBR?=
 =?utf-8?B?d3A1bnFYdHhqZ0xmdnBsekd5MlVZWTBhK25IK3IxeW1lQitHWnRoWC9mQ0RS?=
 =?utf-8?B?cG9XekJkNk1sVlRueWFpYzJ5c2xMaHYrRjFGREVlUmFyd0dleFBJRzVRNXdk?=
 =?utf-8?B?MDB6ejVxcDZHdDEzckNBRFppMVlZTFpZc2gwWHdoUjJzdjduZTR2SjhLREJW?=
 =?utf-8?B?R3BYMy9jU0w3SGpianM1emNiQjczd0NvOEZjVmJPTGpDcjRWSkZmQkJhRndO?=
 =?utf-8?B?aTJXKzNleUNCcGVxcGFwYThUR1RlZ1NOUCtTU2xBeUFGOHkvT3I2TjdkZTdO?=
 =?utf-8?B?d3NpVUJZRE1iTUFPaDFMUlNrMzB3aE04RS9CZHZkZ1VqRTZ5TmpjZmlwMjl3?=
 =?utf-8?B?aDljcHUwZXJUZ2gwd1lLRWtlQjFpb3pMcGRPSVRaUkF3REl1ZFErbjdxVGFG?=
 =?utf-8?B?WnBUNDhJTHpYaElUdWlTSVhTdnYxajk3cEhWenFFUW1EcG5kMkVaSVZJcTRM?=
 =?utf-8?B?QWZYSjhGK2ZzRkpnYjBjNGkvQlNaTm9mY1RXTHEycEltM3pjbzNzNkFNMU9p?=
 =?utf-8?B?VWg0R0JzenBZQmxFZ1pSb0ZxOS9rRmFqY1dSWEdndnN3SDQzTGZIVGNERldn?=
 =?utf-8?B?QXozcWMxa0tCSGllTE9sYlg0TktVWHBVOU9Ua3hvNHk5YkoxSjZoaGtXWWVO?=
 =?utf-8?B?Y0F2d291Y3IvcEQydkJlOG0raFJ0dlY3WW1OV1E3S0swVFdkT0ZPZHI3WU9I?=
 =?utf-8?B?OVNVSytZa0hpVldnd0RMWGptMmg4MjJjT1dINlhUTjBIS3BiUlZKcldQQjdP?=
 =?utf-8?B?dmIxVCtxaStuYmJVWmMwVXRaUUNzME1ROWl5M1F4L0lGN3VKczBQc3RYS1Iz?=
 =?utf-8?B?TndOSklUMEhNNkJETXRFaWN6ZjFYZlN0R0ZUNG4rd1g4QkVxRS9RNDBJSHZy?=
 =?utf-8?B?a1U3Mkk1Rm50bEhqcWNCOW9zT3R5WGxwZEhJaVo4WXRQRHBtcmZ2K3pwMko0?=
 =?utf-8?B?K3p0NDVZeTJoRUdscFdwZElDT0pJNFp1Wjd3Q2hwNkdFeENsNHZBd0U3Y0pE?=
 =?utf-8?B?RXBJaG5ybWJZTkZsRUYxbDlBeFpEZHcwZzdtQzZiaERtZGUwT3p2ZGwwT2Q1?=
 =?utf-8?B?THFNTG13UzB6dk9EdmF0TnlLUGdVRDVudGVoeEhWS0VGVzNwVG9odnkvRVZZ?=
 =?utf-8?B?UzZ2WmxqWmtJMGwwbCtVNlRRL3VNRjdiM0hZM3U2T0gvZWY0OEdST2FpTnkv?=
 =?utf-8?B?Mjk1ZytQK25VME1hSUxmYng4VnVxR1Facmw0cWpyeUZjdXIwdERtOFB5a3FC?=
 =?utf-8?B?dEdFMFgvdXFmcVk4QWhFQ0hWNHhQTWd5SVFyQ1ppYXY3QllLTEo3TS9pamh4?=
 =?utf-8?B?elZ1Z3BKVFEzc3pORERteHFjNFYwSUE5MmUxKytYc1NLRWlqTjQyTzgyWkxu?=
 =?utf-8?B?S096UmJOeGtCaVRHK1hqSTVnWllDQS9zTzhmcitEemxlelVUY3JZc01Wamcz?=
 =?utf-8?B?M0h4bng4RXBXNS93TXJnNkFFZUVpNjZaYm5aTVhKcjZKZitJa29TaXJRbFpT?=
 =?utf-8?B?U2U1dUR2Sk5iZkhpaXRtTHkya0NFRnJyK21HZVZ1NkdEUVUyVXJPRnJkMUZL?=
 =?utf-8?B?NVZZbmdIaHo5TXh2ektSUEVUV1dGNXNoOTFCN3BEWVFYYXIzNTY5N2lIemw2?=
 =?utf-8?B?ZEFKSm5BMlVHS3hqM1ZRb29qbmdDaDFLQnJTbTRQR3l0M0VGTkZoTFQyT1VL?=
 =?utf-8?B?Y0hHcTdqSVVBSlR3UlkxK01ESitMTkk3MHNrWS96Y2RFZXVQYXdwYzB6d0sz?=
 =?utf-8?B?NXpadEthNmZGUkNwbnd2NEt6dmhkLzIwbE9IbXFTS0JWV284ckdOMXh3ZmdL?=
 =?utf-8?B?YTlHcHBNNVhWZzkxUW9WTUhKMVdwM1UxbGx5SVVKcUFjcklIVkEzKzU5a1V2?=
 =?utf-8?Q?3664MiUVX0Onsc6Q=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686b14b7-0613-45e2-74c2-08da143475c4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 23:07:57.4573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRzoaM0QNSLhl5B05Qfmv7Iz4XUecZBeqVe25DcnEGCxCkOVCZOVFSH67s9Q1FtPVoxlcnIenkbEC7nd+vvifg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4619
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-01_08:2022-03-30,
 2022-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010112
X-Proofpoint-ORIG-GUID: BrfK-GoTfLYh9LTa-Zk3Jfqwl1LWAlBn
X-Proofpoint-GUID: BrfK-GoTfLYh9LTa-Zk3Jfqwl1LWAlBn
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eperezma <eperezma@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>,
 mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/31/2022 7:53 PM, Jason Wang wrote:
> On Fri, Apr 1, 2022 at 9:31 AM Michael Qiu <qiudayu@archeros.com> wrote:
>> Currently, when VM poweroff, it will trigger vdpa
>> device(such as mlx bluefield2 VF) reset many times(with 1 datapath
>> queue pair and one control queue, triggered 3 times), this
>> leads to below issue:
>>
>> vhost VQ 2 ring restore failed: -22: Invalid argument (22)
>>
>> This because in vhost_net_stop(), it will stop all vhost device bind to
>> this virtio device, and in vhost_dev_stop(), qemu tries to stop the device
>> , then stop the queue: vhost_virtqueue_stop().
>>
>> In vhost_dev_stop(), it resets the device, which clear some flags
>> in low level driver, and in next loop(stop other vhost backends),
>> qemu try to stop the queue corresponding to the vhost backend,
>>   the driver finds that the VQ is invalied, this is the root cause.
>>
>> To solve the issue, vdpa should set vring unready, and
>> remove reset ops in device stop: vhost_dev_start(hdev, false).
>>
>> and implement a new function vhost_dev_reset, only reset backend
>> device after all vhost(per-queue) stoped.
> Typo.
>
>> Signed-off-by: Michael Qiu<qiudayu@archeros.com>
>> Acked-by: Jason Wang <jasowang@redhat.com>
> Rethink this patch, consider there're devices that don't support
> set_vq_ready(). I wonder if we need
>
> 1) uAPI to tell the user space whether or not it supports set_vq_ready()
I guess what's more relevant here is to define the uAPI semantics for 
unready i.e. set_vq_ready(0) for resuming/stopping virtqueue processing, 
as starting vq is comparatively less ambiguous. Considering the 
likelihood that this interface may be used for live migration, it would 
be nice to come up with variants such as 1) discard inflight request 
v.s. 2) waiting for inflight processing to be done, and 3) timeout in 
waiting.

> 2) userspace will call SET_VRING_ENABLE() when the device supports
> otherwise it will use RESET.
Are you looking to making virtqueue resume-able through the new 
SET_VRING_ENABLE() uAPI?

I think RESET is inevitable in some case, i.e. when guest initiates 
device reset by writing 0 to the status register. For suspend/resume and 
live migration use cases, indeed RESET can be substituted with 
SET_VRING_ENABLE. Again, it'd need quite some code refactoring to 
accommodate this change. Although I'm all for it, it'd be the best to 
lay out the plan for multiple phases rather than overload this single 
patch too much. You can count my time on this endeavor if you don't mind. :)

>
> And for safety, I suggest tagging this as 7.1.
+1

Regards,
-Siwei

>
>> ---
>> v4 --> v3
>>      Nothing changed, becasue of issue with mimecast,
>>      when the From: tag is different from the sender,
>>      the some mail client will take the patch as an
>>      attachment, RESEND v3 does not work, So resend
>>      the patch as v4
>>
>> v3 --> v2:
>>      Call vhost_dev_reset() at the end of vhost_net_stop().
>>
>>      Since the vDPA device need re-add the status bit
>>      VIRTIO_CONFIG_S_ACKNOWLEDGE and VIRTIO_CONFIG_S_DRIVER,
>>      simply, add them inside vhost_vdpa_reset_device, and
>>      the only way calling vhost_vdpa_reset_device is in
>>      vhost_net_stop(), so it keeps the same behavior as before.
>>
>> v2 --> v1:
>>     Implement a new function vhost_dev_reset,
>>     reset the backend kernel device at last.
>> ---
>>   hw/net/vhost_net.c        | 24 +++++++++++++++++++++---
>>   hw/virtio/vhost-vdpa.c    | 15 +++++++++------
>>   hw/virtio/vhost.c         | 15 ++++++++++++++-
>>   include/hw/virtio/vhost.h |  1 +
>>   4 files changed, 45 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> index 30379d2..422c9bf 100644
>> --- a/hw/net/vhost_net.c
>> +++ b/hw/net/vhost_net.c
>> @@ -325,7 +325,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>       int total_notifiers = data_queue_pairs * 2 + cvq;
>>       VirtIONet *n = VIRTIO_NET(dev);
>>       int nvhosts = data_queue_pairs + cvq;
>> -    struct vhost_net *net;
>> +    struct vhost_net *net = NULL;
>>       int r, e, i, index_end = data_queue_pairs * 2;
>>       NetClientState *peer;
>>
>> @@ -391,8 +391,17 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>   err_start:
>>       while (--i >= 0) {
>>           peer = qemu_get_peer(ncs , i);
>> -        vhost_net_stop_one(get_vhost_net(peer), dev);
>> +
>> +        net = get_vhost_net(peer);
>> +
>> +        vhost_net_stop_one(net, dev);
>>       }
>> +
>> +    /* We only reset backend vdpa device */
>> +    if (net && net->dev.vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA) {
>> +        vhost_dev_reset(&net->dev);
>> +    }
>> +
>>       e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>>       if (e < 0) {
>>           fprintf(stderr, "vhost guest notifier cleanup failed: %d\n", e);
>> @@ -410,6 +419,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>>       VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
>>       VirtIONet *n = VIRTIO_NET(dev);
>>       NetClientState *peer;
>> +    struct vhost_net *net = NULL;
>>       int total_notifiers = data_queue_pairs * 2 + cvq;
>>       int nvhosts = data_queue_pairs + cvq;
>>       int i, r;
>> @@ -420,7 +430,15 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>>           } else {
>>               peer = qemu_get_peer(ncs, n->max_queue_pairs);
>>           }
>> -        vhost_net_stop_one(get_vhost_net(peer), dev);
>> +
>> +        net = get_vhost_net(peer);
>> +
>> +        vhost_net_stop_one(net, dev);
>> +    }
>> +
>> +    /* We only reset backend vdpa device */
>> +    if (net && net->dev.vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA) {
>> +        vhost_dev_reset(&net->dev);
>>       }
> So we've already reset the device in vhost_vdpa_dev_start(), any
> reason we need to do it again here?
>
>>       r = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> index c5ed7a3..3ef0199 100644
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -708,6 +708,11 @@ static int vhost_vdpa_reset_device(struct vhost_dev *dev)
>>
>>       ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
>>       trace_vhost_vdpa_reset_device(dev, status);
>> +
>> +    /* Add back this status, so that the device could work next time*/
>> +    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>> +                               VIRTIO_CONFIG_S_DRIVER);
> This seems to contradict the semantic of reset.
>
>> +
>>       return ret;
>>   }
>>
>> @@ -719,14 +724,14 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
>>       return idx;
>>   }
>>
>> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, unsigned int ready)
>>   {
>>       int i;
>>       trace_vhost_vdpa_set_vring_ready(dev);
>>       for (i = 0; i < dev->nvqs; ++i) {
>>           struct vhost_vring_state state = {
>>               .index = dev->vq_index + i,
>> -            .num = 1,
>> +            .num = ready,
>>           };
>>           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>>       }
>> @@ -1088,8 +1093,9 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>>           if (unlikely(!ok)) {
>>               return -1;
>>           }
>> -        vhost_vdpa_set_vring_ready(dev);
>> +        vhost_vdpa_set_vring_ready(dev, 1);
>>       } else {
>> +        vhost_vdpa_set_vring_ready(dev, 0);
>>           ok = vhost_vdpa_svqs_stop(dev);
>>           if (unlikely(!ok)) {
>>               return -1;
>> @@ -1105,9 +1111,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>>           memory_listener_register(&v->listener, &address_space_memory);
>>           return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>>       } else {
>> -        vhost_vdpa_reset_device(dev);
>> -        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>> -                                   VIRTIO_CONFIG_S_DRIVER);
>>           memory_listener_unregister(&v->listener);
>>
>>           return 0;
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index b643f42..7e0cdb6 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -1820,7 +1820,6 @@ fail_features:
>>   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
>>   {
>>       int i;
>> -
> Unnecessary changes.
>
>>       /* should only be called after backend is connected */
>>       assert(hdev->vhost_ops);
>>
>> @@ -1854,3 +1853,17 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>>
>>       return -ENOSYS;
>>   }
>> +
>> +int vhost_dev_reset(struct vhost_dev *hdev)
>> +{
> Let's use a separate patch for this.
>
> Thanks
>
>> +    int ret = 0;
>> +
>> +    /* should only be called after backend is connected */
>> +    assert(hdev->vhost_ops);
>> +
>> +    if (hdev->vhost_ops->vhost_reset_device) {
>> +        ret = hdev->vhost_ops->vhost_reset_device(hdev);
>> +    }
>> +
>> +    return ret;
>> +}
>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>> index 58a73e7..b8b7c20 100644
>> --- a/include/hw/virtio/vhost.h
>> +++ b/include/hw/virtio/vhost.h
>> @@ -114,6 +114,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
>>   void vhost_dev_cleanup(struct vhost_dev *hdev);
>>   int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
>>   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
>> +int vhost_dev_reset(struct vhost_dev *hdev);
>>   int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
>>   void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
>>
>> --
>> 1.8.3.1
>>
>>
>>


