Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83D14F3D53
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 21:21:56 +0200 (CEST)
Received: from localhost ([::1]:60610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbokV-0001K4-7N
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 15:21:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nbohZ-00089z-E9
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 15:18:53 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:54328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nbohU-0005Cy-3A
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 15:18:51 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 235J496j006378; 
 Tue, 5 Apr 2022 19:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Sh4bzJ75cNX9kjBZEHsSwgskinxw0YCW1VDWoXfg4lg=;
 b=HkiQwafDy0UgOLjBVUVyeIlMmKovRvMHCwHRHAgySU0CyFppeqvMmWygu37C0djJzY+G
 9Pcscjq+WsNyUiMLsil9PsqZN8eJCKuOuhBUU/TGFg3HAFqkrfGTgnNKEW2nsl1rP5hR
 oqDthhXWeW6dnxbbkKDdrJcZiP694Gny3YJfJOr835UUYPr1fSspooho6NVxdHr8SYNq
 mi1hdySJFINu5SE4zcRaNbDo6V19XgX8wGBXydwWFBGwx81YSq+xhZB46QB0QxuJc2BM
 zZWtpNSq3rcLeYBw0AFHyMDukiHkYe5UpnFdApwU3AMbaFB1RmHm2SOCnujjZx9k3MDl oQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6d31f12n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Apr 2022 19:18:37 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 235JGhnE004385; Tue, 5 Apr 2022 19:18:35 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f6cx3v2st-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Apr 2022 19:18:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVkRFBuRc8wMH6IK47LmIhSZD8uGFLCAAWG9IrjXh0HRvQpIcRNkokG4WfamFfpQlAEq0+yo7N1wAohj7D20Kibnk9E6OK5/ZmOZlgWOjn33lRl2qxBIpkwYwyxTtJRIbyw/SjNi4e0QFgeNdZQ9RpXESSatAbyBNqy8NQGHqQj/uiUS7Hb+TtE1kiq51JlJZl81OSWqRnQVsES9Q2aqblyT/Gwqb+ttRIXtO5+oI935DP+tWycgNPvN6wdxwa5HSCgJVoKOJLIA2zSQAEy6ojGIsOjqg8MKLCL9J41oOj7y1Ivz77ZzfFTKGP3a1U/EAKEYFtYQ4oTdu/9RkSWOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sh4bzJ75cNX9kjBZEHsSwgskinxw0YCW1VDWoXfg4lg=;
 b=F1/U0pnuJl6MV7MhnHRYrVC3RH0ZAGhz35GuSuu4wa0iV7OKmxcTR7oXvfxfx765YFJCIS9XWbafNouyy+Hu7Qcb3gv/HKUxKj06CRYRXBkviLIVAlOlNdGicQayOS+u6GNW55sll2uqCCuStcJ3KH+4ljSzkT2CFQlj30Dbg27iaH891r/J++6rrNKydVbatDoFiTZ6OXpfjAkcZVAdMp9xydsxXT7Bcq+fIdck6lHlVqSFPp3FzVqwy1YU0dUKBKwuvhyXtubI8p2F2rx3p8G3jBNgKdvdn54KIlBcjS3NBcBBnqU2z/Dj/2pwJttjlg5qB90So5czXckLfNMCtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sh4bzJ75cNX9kjBZEHsSwgskinxw0YCW1VDWoXfg4lg=;
 b=vWVeQo6+UF+KkEtMCwvn3axwQcvXLuAjxxhmANUCo+JnPB2WDD0rsvTzK88/dRxWWPO+CKz+D4qJ1CxT1twN1howLUI4FBsk75BC1rNSmewu4nHmPe/PHop3dqOf0caTNbiOSwslUBAI+iOlYr9frnKpt4oJR+cLnBh18Dd8Pa8=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM5PR1001MB2331.namprd10.prod.outlook.com (2603:10b6:4:2f::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Tue, 5 Apr
 2022 19:18:33 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::fcff:70e5:ceb0:4947]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::fcff:70e5:ceb0:4947%7]) with mapi id 15.20.5123.031; Tue, 5 Apr 2022
 19:18:33 +0000
Message-ID: <8f8ea4e4-2398-6d94-88fe-93b2c0f6f9ca@oracle.com>
Date: Tue, 5 Apr 2022 12:18:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 4/7] virtio: don't read pending event on host notifier if
 disabled
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-5-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEt=Bs7XPWQaMOQB5iBece1CH9HJZ69YEF_m-e2Tj95qDg@mail.gmail.com>
 <4f2acb7a-d436-9d97-80b1-3308c1b396b5@oracle.com>
 <CACGkMEtsV6e6LOYCfVZb7_-SvSAWRk1XHom+neXR=d3aQQwXmg@mail.gmail.com>
 <b190a762-1d21-4fec-b138-e4c09a949525@oracle.com>
 <CACGkMEv-ddVvrwSXGsvajiVXq5X3ZXy8mM41fvwQTYTGGnyznQ@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEv-ddVvrwSXGsvajiVXq5X3ZXy8mM41fvwQTYTGGnyznQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::31) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afa3c01a-df67-40ff-f797-08da1739135e
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2331:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB23312BE099912EA73B423039B1E49@DM5PR1001MB2331.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xkjqgOiQ0EtFZ9Eq/ML4vM4YUecBdfoShKFrWnmEVDGdpMZxI4sdKR+e195P5FkRVZk2Qm42QzMywJhZm6XBJw5G2dlUJ4mWXV8fU9LqfzOV1DYWlLuKT1IqGBOl6++7NGiLEXgwxbxpjenup6ifyX7ayz1Wj6J/f4zSV3yo5wXQl1R69RZ5iJAZKbPzgxDCmxOpxkBoZU9ZN/CccuQPkPYE46ZUlx///vs1J2bCIXh4Gw2Iy+ql1ZE4Cz2p7jzQ26z1Ig/jF8W80GP7sh83hc3x6zebc9n6b6tPwH3tKYbDa+stHEMlJImevvlg0Tyl9LA8wY3BFc4WkHI1HiZbuKVfcBd7tkuKhaS0WVOpWLNHt5XdKXn7o6R2RSLhcImbXd3JrWwn0HqkmjtEHx5ZHpiuQZRIdmjKQoU7OGo9wLiCQeu4Og15yYy4QYv/yPWl0klk601AOilOojd7URpvsbqR2pd3jojqU7c4y++iaQVtCPiuD95mZm0oBjsQY0Du7nrbN3L5vFMeddLqcIXMgc1zMclmhlTzryEpNT5i/tZ41bFskCDYsdEkt6sT+oJr7CeYNJZ9LGlzZo9pp2HcFdsKsHD43JljI7LcIc6G813GHWvYDs+F53t6qXPZi1+SDj0ln9qdcHzsUbaiIXnSgVFpbIJ6TC+LiiW+f0hb/p+ibZ+9Ma2BTSn3vHT1qnNcyJumdhHERu3vaFC8JKT/bkUeN7N7DitHAFrqeZv3yByJSGbEjF09sDv36tELYlNo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(2906002)(30864003)(66946007)(5660300002)(38100700002)(8936002)(8676002)(4326008)(31696002)(31686004)(66556008)(66476007)(2616005)(6486002)(53546011)(26005)(186003)(54906003)(316002)(36756003)(6916009)(6512007)(6506007)(508600001)(36916002)(6666004)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFFYdDlnZEJEQ1cxTm9RQWVCY2tJdDlDOXIxd3ZuV0UrS3J0Sy9QVmVZTy9Q?=
 =?utf-8?B?TUltWENRTitIWDBSbytnL08vclB6SVI3K05XcW5MQWdYMHQzM2w1TFIzZGhY?=
 =?utf-8?B?eHFHLzN1QzR5NHB5M0R4NmpiWnlaTWIrb3c1Sk1FQnVicHZTOG1IL01DQ1FG?=
 =?utf-8?B?UlpLaXI0dnVwTkJFQnNWV1NDZkgzeStPWENjNVhiQmlTSWxSanE2V2t3QnNS?=
 =?utf-8?B?L3ZJbHd6K2t5M3l6azhFMXFPN3ZXMHIxOEx0OVhqRnB4cmM5cWRqNE51WmFD?=
 =?utf-8?B?WGpJVExHSEF5STRycTVOU2lPUnNzQzZpZmI4enlYdGl0ZkhySUxMNFE5UUla?=
 =?utf-8?B?UC81TUpPL3orMktwTW9GUGMwS2lNOU5YQmxCZEd3MjdWZTl5dXpBblM3dWdo?=
 =?utf-8?B?cHVDRlZwZXFzbjJKUmNtcXlrRTBjS3NIbEdtNzI0NWdFOFpNSWRhTEk0OFBY?=
 =?utf-8?B?ZlRUQjErSWMyWkJOK25mSnJUcVBHWjFUU2d4VGN6YnZSQnZqRVFCb0JieGo3?=
 =?utf-8?B?aXBlOVQ1ZGxYa0dzOXlVazRFbEI1aG5LZ1k1YUJoUUthRm9WY2gvdFFxYnlQ?=
 =?utf-8?B?TnVYblZxRG9VTCtvenlCYVgwTUN1VncwdTZNL2pEakhnRndEWGdaNHNQdjdG?=
 =?utf-8?B?Q3ZtNkkzZkpRdWlFeENNcjFVVjgrQmJLdkRYdUFsYUNpNGtWK1ZhVmZUbjls?=
 =?utf-8?B?clY3VEtGNnlWZGc2d0tnRXlXaWpHdXFsL2Jja0JYMFRtanlXS0RtOC9nanpx?=
 =?utf-8?B?S3ZCVTRFL3dCeC9rVE41b3poakgrNW1CQldhd284d2t5TW9BWmZnUyt1WTF0?=
 =?utf-8?B?TUJURjRtOS9KdVZXZkhVTkpyb014QlhaY0RPMDBKSlhFS3pWTWxMYTF6ZzFn?=
 =?utf-8?B?a29tdHlxME04RDVWbURnbkN6Nm5qNGMrdUxuOEthZUhkOE9CY3htZ213MTRq?=
 =?utf-8?B?N3oxQlFXNzFvTmpQQVRtYUZBbjBPU0tBV21UQXorODd1aTYzQS8yd01xQlZs?=
 =?utf-8?B?TENSUUg2MWVJckxkNlhLMjdGQjczTU9jOXMvMTBFMDh5OVJiaVFGTFBEaTNo?=
 =?utf-8?B?OFNvdEhRLzFEVm1XQmovaW9nY1FJT3VkcUpwa1hoQ1dzWTd4YkRTNmJwc3Zw?=
 =?utf-8?B?MkwzbWwxOHZJQ3dqV21ObFJ5b0xkaUIyMzVOQkZ1YXFpZm42RUlMbkk0Sm5m?=
 =?utf-8?B?M29YRzVwNGI3dWpuVkQrZFVkM0lsVDd3bmdRSlBCeVdWeUZ5bUd2cnUzZTBV?=
 =?utf-8?B?aWFvZ0lER3RlNUVKVGVnYk95b3hFZ1hSSWlZL1F2dVFxdlI0bm84VndkZVFC?=
 =?utf-8?B?OGFCbTBVTUpkazlZU2M4dlVrb3VhL0NWbnE5ZGRvQ1liZnpaZ2pUc0E0bTRR?=
 =?utf-8?B?amlaRGdwNkdJMXZRSWlIQUpieUdDam1Cck5mRmE2TTM0emNQTjdXdGhaazlr?=
 =?utf-8?B?QjNGdUpBdjd4SFdIVU05N2UwZkZFQnlMSm9XZEtKaHFvZlJoQk9JbC9KcHlV?=
 =?utf-8?B?T3NuNVlwWnNYeEhxYm9TS05PZ28ySkJZL0YvV2N5Y1VTTVA3SEdQMTVpOUZE?=
 =?utf-8?B?djhqNHF3aWUzZyszSHN3SDlmZWdGd3hkMm5ybGJvVDRtTWE0V09Ld1RtNHlP?=
 =?utf-8?B?ankrenpNTllSdmFNd0xrNkd1aXZLODFEd3EwZWxxY3laUkd3OUk0cGx6cTlp?=
 =?utf-8?B?bHVLejlZbHFaL2VUU3ZJaUVwN3R3M2RlWXdKK29qVUpuZkUyWmgxTlp6ZDhJ?=
 =?utf-8?B?WDRjcVkxTUdpcDRQTmJOVStNckpKeDVKVGMva0pxK3F6UFAyU0pLQTlZZHg0?=
 =?utf-8?B?L1NEdW9DOE80OGIrWFRRKzB3a25zeWVNdGFxcmFJT2tCSjJqMFlrejVWd3Np?=
 =?utf-8?B?SkZEZnpUdlhqdnR2QUp1WmFYNEdFcjBGTjE0WUVJZE5EUnUxOVFaOFFBcjQ3?=
 =?utf-8?B?bUdRT3ZmaDlYNkVMbkhDVmFIZ2ZiM2d2NkZTY0Y4MzF2SDVwanFYTkpKazFx?=
 =?utf-8?B?VXg0VCtUcGIwbjhzN3dXeVFHZDUvLzZjdkdWVjlveXFNeWlzaVFPd1VtbUVU?=
 =?utf-8?B?UHdSVEFEQi83cjB0L1JTZENBK3hPUk1zcHVrWFk4a2lsR1ZyU3V1cnYxamtY?=
 =?utf-8?B?N2hsdTJYNWVNWXhUUXRHQWdlVkxCY0xpR0Y3NVROU0tKTjk2RVh4TXd3alBR?=
 =?utf-8?B?ZmF2TU1Yb2t4TXhmUGcvV2NQam5jSmFqWE8rUmhEYVlBZC9kWk4vMDlFb3VU?=
 =?utf-8?B?cU96L0IxQ1JTVjdTaExEMGRiR0d1TUhSeTFTZkdZV09INjRyRmRqcUl1L1My?=
 =?utf-8?B?cmJIdnRaQ294UFR1clJNNHdDRWJFaGNTYWRMaWNsbUpHUGpBQ3ZBTDk3ZHE3?=
 =?utf-8?Q?i6i0QOGFvuvmQ+2k=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa3c01a-df67-40ff-f797-08da1739135e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 19:18:33.3005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JdLRXxpl31MKYo9Vjfszy3T8CbRUVkdT5BHi7fdGuDKsCrLwRtFZmqzNib7xuiQFVjGHuIjn5q24UPLlU4EHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2331
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-05_06:2022-04-04,
 2022-04-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204050109
X-Proofpoint-GUID: hXNpjCSPRkLQyXrlowT5uDaSjr6B09LU
X-Proofpoint-ORIG-GUID: hXNpjCSPRkLQyXrlowT5uDaSjr6B09LU
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/1/2022 7:00 PM, Jason Wang wrote:
> On Sat, Apr 2, 2022 at 4:37 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 3/31/2022 1:36 AM, Jason Wang wrote:
>>> On Thu, Mar 31, 2022 at 12:41 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>>
>>>> On 3/30/2022 2:14 AM, Jason Wang wrote:
>>>>> On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>>>> Previous commit prevents vhost-user and vhost-vdpa from using
>>>>>> userland vq handler via disable_ioeventfd_handler. The same
>>>>>> needs to be done for host notifier cleanup too, as the
>>>>>> virtio_queue_host_notifier_read handler still tends to read
>>>>>> pending event left behind on ioeventfd and attempts to handle
>>>>>> outstanding kicks from QEMU userland vq.
>>>>>>
>>>>>> If vq handler is not disabled on cleanup, it may lead to sigsegv
>>>>>> with recursive virtio_net_set_status call on the control vq:
>>>>>>
>>>>>> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
>>>>>> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
>>>>>> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
>>>>>> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
>>>>>> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
>>>>>> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
>>>>>> 6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized out>) at ../hw/virtio/vhost.c:1557
>>>>> I feel it's probably a bug elsewhere e.g when we fail to start
>>>>> vhost-vDPA, it's the charge of the Qemu to poll host notifier and we
>>>>> will fallback to the userspace vq handler.
>>>> Apologies, an incorrect stack trace was pasted which actually came from
>>>> patch #1. I will post a v2 with the corresponding one as below:
>>>>
>>>> 0  0x000055f800df1780 in qdev_get_parent_bus (dev=0x0) at
>>>> ../hw/core/qdev.c:376
>>>> 1  0x000055f800c68ad8 in virtio_bus_device_iommu_enabled
>>>> (vdev=vdev@entry=0x0) at ../hw/virtio/virtio-bus.c:331
>>>> 2  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>) at
>>>> ../hw/virtio/vhost.c:318
>>>> 3  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>,
>>>> buffer=0x7fc19bec5240, len=2052, is_write=1, access_len=2052) at
>>>> ../hw/virtio/vhost.c:336
>>>> 4  0x000055f800d71867 in vhost_virtqueue_stop
>>>> (dev=dev@entry=0x55f8037ccc30, vdev=vdev@entry=0x55f8044ec590,
>>>> vq=0x55f8037cceb0, idx=0) at ../hw/virtio/vhost.c:1241
>>>> 5  0x000055f800d7406c in vhost_dev_stop (hdev=hdev@entry=0x55f8037ccc30,
>>>> vdev=vdev@entry=0x55f8044ec590) at ../hw/virtio/vhost.c:1839
>>>> 6  0x000055f800bf00a7 in vhost_net_stop_one (net=0x55f8037ccc30,
>>>> dev=0x55f8044ec590) at ../hw/net/vhost_net.c:315
>>>> 7  0x000055f800bf0678 in vhost_net_stop (dev=dev@entry=0x55f8044ec590,
>>>> ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7,
>>>> cvq=cvq@entry=1)
>>>>       at ../hw/net/vhost_net.c:423
>>>> 8  0x000055f800d4e628 in virtio_net_set_status (status=<optimized out>,
>>>> n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
>>>> 9  0x000055f800d4e628 in virtio_net_set_status
>>>> (vdev=vdev@entry=0x55f8044ec590, status=15 '\017') at
>>>> ../hw/net/virtio-net.c:370
>>> I don't understand why virtio_net_handle_ctrl() call virtio_net_set_stauts()...
>> The pending request left over on the ctrl vq was a VIRTIO_NET_CTRL_MQ
>> command, i.e. in virtio_net_handle_mq():
> Completely forget that the code was actually written by me :\
>
>> 1413     n->curr_queue_pairs = queue_pairs;
>> 1414     /* stop the backend before changing the number of queue_pairs
>> to avoid handling a
>> 1415      * disabled queue */
>> 1416     virtio_net_set_status(vdev, vdev->status);
>> 1417     virtio_net_set_queue_pairs(n);
>>
>> Noted before the vdpa multiqueue support, there was never a vhost_dev
>> for ctrl_vq exposed, i.e. there's no host notifier set up for the
>> ctrl_vq on vhost_kernel as it is emulated in QEMU software.
>>
>>>> 10 0x000055f800d534d8 in virtio_net_handle_ctrl (iov_cnt=<optimized
>>>> out>, iov=<optimized out>, cmd=0 '\000', n=0x55f8044ec590) at
>>>> ../hw/net/virtio-net.c:1408
>>>> 11 0x000055f800d534d8 in virtio_net_handle_ctrl (vdev=0x55f8044ec590,
>>>> vq=0x7fc1a7e888d0) at ../hw/net/virtio-net.c:1452
>>>> 12 0x000055f800d69f37 in virtio_queue_host_notifier_read
>>>> (vq=0x7fc1a7e888d0) at ../hw/virtio/virtio.c:2331
>>>> 13 0x000055f800d69f37 in virtio_queue_host_notifier_read
>>>> (n=n@entry=0x7fc1a7e8894c) at ../hw/virtio/virtio.c:3575
>>>> 14 0x000055f800c688e6 in virtio_bus_cleanup_host_notifier
>>>> (bus=<optimized out>, n=n@entry=14) at ../hw/virtio/virtio-bus.c:312
>>>> 15 0x000055f800d73106 in vhost_dev_disable_notifiers
>>>> (hdev=hdev@entry=0x55f8035b51b0, vdev=vdev@entry=0x55f8044ec590)
>>>>       at ../../../include/hw/virtio/virtio-bus.h:35
>>>> 16 0x000055f800bf00b2 in vhost_net_stop_one (net=0x55f8035b51b0,
>>>> dev=0x55f8044ec590) at ../hw/net/vhost_net.c:316
>>>> 17 0x000055f800bf0678 in vhost_net_stop (dev=dev@entry=0x55f8044ec590,
>>>> ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7,
>>>> cvq=cvq@entry=1)
>>>>       at ../hw/net/vhost_net.c:423
>>>> 18 0x000055f800d4e628 in virtio_net_set_status (status=<optimized out>,
>>>> n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
>>>> 19 0x000055f800d4e628 in virtio_net_set_status (vdev=0x55f8044ec590,
>>>> status=15 '\017') at ../hw/net/virtio-net.c:370
>>>> 20 0x000055f800d6c4b2 in virtio_set_status (vdev=0x55f8044ec590,
>>>> val=<optimized out>) at ../hw/virtio/virtio.c:1945
>>>> 21 0x000055f800d11d9d in vm_state_notify (running=running@entry=false,
>>>> state=state@entry=RUN_STATE_SHUTDOWN) at ../softmmu/runstate.c:333
>>>> 22 0x000055f800d04e7a in do_vm_stop
>>>> (state=state@entry=RUN_STATE_SHUTDOWN, send_stop=send_stop@entry=false)
>>>> at ../softmmu/cpus.c:262
>>>> 23 0x000055f800d04e99 in vm_shutdown () at ../softmmu/cpus.c:280
>>>> 24 0x000055f800d126af in qemu_cleanup () at ../softmmu/runstate.c:812
>>>> 25 0x000055f800ad5b13 in main (argc=<optimized out>, argv=<optimized
>>>> out>, envp=<optimized out>) at ../softmmu/main.c:51
>>>>
>>>>    From the trace pending read only occurs in stop path. The recursive
>>>> virtio_net_set_status from virtio_net_handle_ctrl doesn't make sense to me.
>>> Yes, we need to figure this out to know the root cause.
>> I think it has something to do with the virtqueue unready issue that the
>> vhost_reset_device() refactoring series attempt to fix. If that is fixed
>> we should not see this sigsegv with mlx5_vdpa. However I guess we both
>> agreed that the vq_unready support would need new uAPI (some flag) to
>> define, hence this fix applies to the situation where uAPI doesn't exist
>> on the kernel or the vq_unready is not supported by vdpa vendor driver.
>>
> Yes.
>
>>> The code should work for the case when vhost-vdp fails to start.
>> Unlike the other datapath queues for net vdpa, the events left behind in
>> the control queue can't be processed by the userspace, as unlike
>> vhost-kernel we don't have a fallback path in the userspace.
> So that's the question, we should have a safe fallback.
>
>> To ignore
>> the pending event and let vhost vdpa process it on resume/start is
>> perhaps the best thing to do. This is even true for datapath queues for
>> other vdpa devices than of network.
>>
>>>> Not sure I got the reason why we need to handle pending host
>>>> notification in userland vq, can you elaborate?
>>> Because vhost-vDPA fails to start, we will "fallback" to a dummy userspace.
>> Is the dummy userspace working or operational? What's the use case of
>> this "fallback" dummy if what guest user can get is a busted NIC?
> The problem is we can't do better in this case now. Such fallack (e.g
> for vhost-user) has been used for years. Or do you have any better
> ideas?
In my opinion if vhost-vdpa or vhost-user fails to start, maybe we 
should try to disable the device via virtio_error(), which would set 
broken to true and set NEEDS_RESET in case of VERSION_1. That way the 
device won't move forward further and the guest may get the indication 
via config interrupt that something had gone wrong underneath. If device 
reset is well supported there the guest driver would retry. This can at 
least give the backend some chance to recover if running into 
intermittent error. The worst result would be the device keeps resetting 
repeatedly, for which we may introduce tunable to control the rate if 
seeing reset occurs too often.. Did this ever get considered before?

Noted that the dummy userspace can't handle any control vq command 
effectively once the vhost backend fails, for e.g. how does it handle 
those guest offload, rx mode, MAC or VLAN filter changes without sending 
the request down to the backend? This could easily get inconsistent 
state to the guest if somehow we are able to resume the virtqueue 
without a reset. Even so, I suspect the device reset eventually is still 
needed on the other part, which is subject to the specific failure. It 
looks to me at least for vhost-vdpa, it might be the safest fallback so 
far to ignore pending event in ctrl_vq, and disable the device from 
moving forward in case of backend start failure.

>
> It doesn't differ too much of the two approaches:
>
> 1) dummy fallback which can do even cvq
>
> and
>
> 2) disable host notifiers
>
> Especially consider 2) requires more changes.
I'm not clear if 2) really needs more changes, as it seems to me that it 
would take more unwarranted changes to make dummy fallback to work on 
cvq? And suppose we can fallback to disabling device via virtio_error(), 
we don't even need to change any code on cvq?

On the other hand, for the specific code path this patch tries to fix, 
it is not due to failure to start vhost-vdpa backend, but more of a 
control flow flaw in the stop path due to lack of VQ stop uAPI. Let 
alone dummy or host notifier, considering currently it's in the stop 
path followed by a reset, I feel it should be pretty safe to just ignore 
the pending event on the control vq rather than process it prematurely 
in userspace. What do you think? I can leave without the host notifier 
handler change for sure.

>
>> I
>> think this is very different from the vhost-kernel case in that once
>> vhost fails, we can fallback to userspace to emulate the network through
>> the tap fd in a good way. However, there's no equivalent yet for
>> vhost-vdpa...
>>
> As said previously, technically we can have vhost-vDPA network backend
> as a fallback.
But this is working as yet. And how do you envision the datapath may 
work given that we don't have a fallback tap fd?

-Siwei


>   (So did for vhost-user).
>
> Thanks
>
>> Thanks,
>> -Siwei
>>
>>> Thanks
>>>
>>>> Thanks,
>>>> -Siwei
>>>>
>>>>> Thanks
>>>>>
>>>>>> 7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=d@entry=0x558f568f0f60, n=n@entry=2, assign=assign@entry=true, with_irqfd=with_irqfd@entry=false)
>>>>>>       at ../hw/virtio/virtio-pci.c:974
>>>>>> 8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=0x558f568f0f60, nvqs=3, assign=true) at ../hw/virtio/virtio-pci.c:1019
>>>>>> 9  0x0000558f52bf091d in vhost_net_start (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
>>>>>>       at ../hw/net/vhost_net.c:361
>>>>>> 10 0x0000558f52d4e5e7 in virtio_net_set_status (status=<optimized out>, n=0x558f568f91f0) at ../hw/net/virtio-net.c:289
>>>>>> 11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=0x558f568f91f0, status=15 '\017') at ../hw/net/virtio-net.c:370
>>>>>> 12 0x0000558f52d6c4b2 in virtio_set_status (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at ../hw/virtio/virtio.c:1945
>>>>>> 13 0x0000558f52c69eff in virtio_pci_common_write (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized out>, size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
>>>>>> 14 0x0000558f52d15d6e in memory_region_write_accessor (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, shift=<optimized out>, mask=<optimized out>, attrs=...)
>>>>>>       at ../softmmu/memory.c:492
>>>>>> 15 0x0000558f52d127de in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, size=size@entry=1, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x558f52d15cf0 <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) at ../softmmu/memory.c:554
>>>>>> 16 0x0000558f52d157ef in memory_region_dispatch_write (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, op=<optimized out>, attrs=attrs@entry=...)
>>>>>>       at ../softmmu/memory.c:1504
>>>>>> 17 0x0000558f52d078e7 in flatview_write_continue (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at ../../../include/qemu/host-utils.h:165
>>>>>> 18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at ../softmmu/physmem.c:2822
>>>>>> 19 0x0000558f52d0b36b in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>)
>>>>>>       at ../softmmu/physmem.c:2914
>>>>>> 20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=...,
>>>>>>       attrs@entry=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>, is_write=<optimized out>) at ../softmmu/physmem.c:2924
>>>>>> 21 0x0000558f52dced09 in kvm_cpu_exec (cpu=cpu@entry=0x558f55c2da60) at ../accel/kvm/kvm-all.c:2903
>>>>>> 22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
>>>>>> 23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:556
>>>>>> 24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
>>>>>> 25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6
>>>>>>
>>>>>> Fixes: 4023784 ("vhost-vdpa: multiqueue support")
>>>>>> Cc: Jason Wang <jasowang@redhat.com>
>>>>>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>>>>>> ---
>>>>>>     hw/virtio/virtio-bus.c | 3 ++-
>>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
>>>>>> index 0f69d1c..3159b58 100644
>>>>>> --- a/hw/virtio/virtio-bus.c
>>>>>> +++ b/hw/virtio/virtio-bus.c
>>>>>> @@ -311,7 +311,8 @@ void virtio_bus_cleanup_host_notifier(VirtioBusState *bus, int n)
>>>>>>         /* Test and clear notifier after disabling event,
>>>>>>          * in case poll callback didn't have time to run.
>>>>>>          */
>>>>>> -    virtio_queue_host_notifier_read(notifier);
>>>>>> +    if (!vdev->disable_ioeventfd_handler)
>>>>>> +        virtio_queue_host_notifier_read(notifier);
>>>>>>         event_notifier_cleanup(notifier);
>>>>>>     }
>>>>>>
>>>>>> --
>>>>>> 1.8.3.1
>>>>>>


