Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 454716A8192
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:52:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhUF-0006Mo-Ui; Thu, 02 Mar 2023 06:52:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1pXhUB-0006Kp-8F
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:52:35 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1pXhTz-00072E-Rf
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:52:25 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322AvokN031180; Thu, 2 Mar 2023 11:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=references : from :
 to : cc : subject : date : in-reply-to : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=n+lNzOMjQ9gxo4oVVzeAOnvNFWfTv64+rcVdcv7y94o=;
 b=U6C6wyS71SA6Ll0ij3/PCpxSb+CkqpfOAB8GZn0xKaA/k4r/fRMUur4aUwxsB+a2UkZW
 wfNVKUn0L+5ZNVEnLaOBVeIMiy8MThUbqrDtL3XczSOb0hWCRLfpgGqHE+cP08HmGs7H
 wLVOcZ9ezmZMeGVoBuWoMRqRKkyJvWJFLmueKI7eAuG23XRKT1rXkCJ7F5aNDhbYuT7j
 wBdAGCvCKonWvdVGy2l3HVtjVd+SROvvB65rwFXAg7lqPy7nR1l3lS++8gQymv6gKNGt
 uFGnaStYbkIAcjyW0M++ikkuxu5iuYar3srbS9UaXuvc2r15XVxogQmBvNDcFeXTRCQe Hw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nybb2kqhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Mar 2023 11:52:21 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 322BjJwR001270; Thu, 2 Mar 2023 11:52:21 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3ny8s9p8mc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Mar 2023 11:52:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgPDYyleoeCca3r22+4Y3EZglBPiRvt4WBbhyyfqTUYlos2F5qoRffTn8AlYF1WBKlVblZAsm+5tm43pEleqdcv477akDoFlX/DSMia/fp7D2Vn/HK1hnAtcDB7oz8fE+WDCNgrd07inFgCoE7DJf68Ak5rIKQyxWM0Z0Koiz/8ymqzRwZ96jddR1KlxkNwcvlPKzuNdx6JXGf1b8nvUi8VS/Zt82Stoy9v08ca/LaOrLfSwzzC5NLuPvndlQhj+P0pAIn77s5rr3Jefj20d1s1nqR6QLaDJiK5KkGioTwYsshuSD0O/eM6omhISxl7Bh86QuWRByxkJfrO4Rpjx5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+lNzOMjQ9gxo4oVVzeAOnvNFWfTv64+rcVdcv7y94o=;
 b=QQWPoE7eFGca22BXCjuUc1yGAW9hP6fiGlAZ1QZLXa8nBHXkbWlitD0XqaIOfV9H4G+mSW0HRlIf7U8j0hAVDd8Z3P/v+cu63cWjXQ1zhVT0Uwwtf0hMzK3J5fbdj91DGI86vkwITCVF84YmIkzSE5z7AAnozm+4Sf1Ev2+cT1HFPx67fZIic7dvjFWffYsqdpYRoS9kTchJCTjSyvh7chFCE1NtuRsZcP35xAft8jG5LZCwIL3qxXJGrClOe4wsqPoXEaaVTUTYW4iOkVTVlKtyGMhfxJz0104ybOPcGWhZ8SYEyNBF1ea+jtKR/AsYAZpapoyoR9AUaCHWgxqPIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+lNzOMjQ9gxo4oVVzeAOnvNFWfTv64+rcVdcv7y94o=;
 b=BR73Ao0M7IwVQgpfGbMtSzSM9g1VN60U8nR4VLE9e+kOVHgZSHkinqpYNq6T4vRzhyaXfg9hHWeIeTQ5b/ltif08Mc3l78en1b5Yi1/tsoZoknKtDOGnsTN4332mDiY2bnhkGR8HzAHjIrj8HumaWRF3TVkv3Rjt6w3hDcaOfdc=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by IA1PR10MB7198.namprd10.prod.outlook.com (2603:10b6:208:3f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 11:52:19 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::9ee4:1e8a:76b6:959b]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::9ee4:1e8a:76b6:959b%2]) with mapi id 15.20.6156.019; Thu, 2 Mar 2023
 11:52:19 +0000
References: <20230301124026.2930-1-quintela@redhat.com>
 <20230301124026.2930-4-quintela@redhat.com>
User-agent: mu4e 1.8.14; emacs 30.0.50
From: David Edmondson <david.edmondson@oracle.com>
To: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 3/3] migration: Make multifd_bytes atomic
Date: Thu, 02 Mar 2023 11:52:11 +0000
In-reply-to: <20230301124026.2930-4-quintela@redhat.com>
Message-ID: <m28rgf1ic1.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0302CA0013.eurprd03.prod.outlook.com
 (2603:10a6:205:2::26) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB4926:EE_|IA1PR10MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 52494f03-2778-49e6-c0ba-08db1b14936c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1xEWYkhdEQF8Z41HG7+3MEpEWP8wc3Ph/8rvhx9KoAzezKtklSajI9+6ZGj5HAI3++k3PvkviU7DdtCbCdbPC5YH+AoyFWx0jGwXqB9LTclVy6AIG9UHnqUVVNhGpNHVDJ7F1WIEgXldOL9vEBhA4nP55F3MQiM+SWmihtqFCNDhN5fMFRNWMOMRWkL/sdQddagbNc3tUifj6ckbNFXmew4Qj+9EpXyOM/L7iwmr27KYHMgrmaa1uJiXjPT6ud4q2kFx4q/uWJKfMWVbxadUoxpinODUmzK+s+5JixZ6Fao3iDC8ubNC5Zno4dQjamYE2iyTXMjB+oj04H3kMAsjZ3hTD2NYVISGxdGW52gT2jOoF/AvqdANUUzmvsMRtZcdF4JZNhCNKVM1258zGOhJCpkC3i/iDm7nXLB93pHDZHCItIx4pScFiNs7NZe/BDlh2gAVOJyTGhX318P1KsomPQvqFoW1WrIrmg6nZtmYMsB0Yn0cuP9FvldwfPu7l8+3efFcrBaa1LuZMr5Lkz9azLXbYlrrmr5kWskAK13JExw1HlNGRR5zCS+OGEsUtw8FkzYEw7e4kclUrn/jeniCjVauEE3VtyyWXJjKWNMpsNKEs0ctAV/0VK4ceuHHw8ktnP58NI0C90mEgwYCcF76hA/6KdwMuCdhIq1CiDs1MiJ8Uay00qM8VZm+eB/6Ks0/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(39860400002)(366004)(396003)(346002)(451199018)(86362001)(36756003)(38100700002)(66946007)(66556008)(66476007)(8676002)(41300700001)(6916009)(316002)(4326008)(8936002)(2906002)(44832011)(5660300002)(2616005)(83380400001)(478600001)(6486002)(6512007)(186003)(26005)(6506007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nlia4Sompm19599Id4TBIPdqJeEgl+dE/0QFg+ivjoyjGijJkwzp4jG5dXT1?=
 =?us-ascii?Q?kSmJpJm+TSQYKMaUyKIoiY/tL+blxvbneAuPAykII0LuGr2mPYY5ntxgJd10?=
 =?us-ascii?Q?h1lfv6ZzMTATBdAl07t3vU+DIcqJhg9pR9dn3W8x1+dWqyYlvjWtCtweQEFb?=
 =?us-ascii?Q?Cut/rxCa8laiLgX7Lg+EyHqYd+CGDVwvWVE3cQWONHaplBFm3bf047NTfHTO?=
 =?us-ascii?Q?/C2dQoGiHXV3uBitLr02qt/4qGWvk7IaO3TvT7sUuc2dOZQbqLPiDB+Pbd1K?=
 =?us-ascii?Q?VsmoCpSWuFPPitEAVspneQsRkh762DctF/NEr6W2QCyrBUqn6ba/LkfHLJ+F?=
 =?us-ascii?Q?SwGBB/vQKGHYfwqXPFoPeJjWdI8EBe9chSMTUffHtG1SBQJXmnhZgcqmx7Lc?=
 =?us-ascii?Q?55+1j3MLLXcj3JCRIeE5CIzzadGR8wK9p84ITxnThADZAR6B1jp3lA3xMh4n?=
 =?us-ascii?Q?AIRoK2G+8HJ9xYYabS6vHthhRcdoiOl5enqJyburYmqzX/c+fO/Te5G84Xeu?=
 =?us-ascii?Q?zemgSjAmVRUJObPHrA8ZtqataKqPUrd/ddOKQkDm/B2o0oTpW629S7izroVW?=
 =?us-ascii?Q?2K0o0XsBje/M0DVjZi0UvcASG9jG5LoMtNwpfOtlEe7DaFSqNI1rLol49jAu?=
 =?us-ascii?Q?rvWzRaVvGvCnh14WrD3/m4TxEaqhYodmpDw2c5cEFQfiGmQ5yXT5fQpH4QSs?=
 =?us-ascii?Q?h1lQO2VGYWcSFH/q5xr2Q85lmyXidLcXK1bdsYAEQa7Je/RNCx0xq/cw5eRj?=
 =?us-ascii?Q?8qUF2DX2GyauL3jfrzerai2TEAmd/cJ2mIwBXGUt77fBToIy/6YQqyw2NEyG?=
 =?us-ascii?Q?vtfLEd1/2MpGU6tZvupU5n2G1quiAfmtorRNCHz91a9AmwA/mPD8lKEJ47BI?=
 =?us-ascii?Q?9NCRpNhLD6knWMzQG62DD/x6s61ravVt2yDdhgukOlLpZwzlR8x+xnd7lUDT?=
 =?us-ascii?Q?KXa9P/DzCOeypbJpgZRR4i6zbO5+QLCYUV2ExDuaKUDS7HXibCzEyF9S1B4s?=
 =?us-ascii?Q?rTWfJ/nMleccc1r+rvlBFcG6aNs3rY3Z+N3/zDRIYTx5lAs2EYXWgwjbkhSq?=
 =?us-ascii?Q?J+K22z7BaZg5D7P7dhfO8A+NfrvRWHkQEiffLIUIYDW/07DO/uoJ9bJtgBAN?=
 =?us-ascii?Q?wwZOcD8t9aF8+E2XEMfEgkhTlKyXhzwK2rlc7B9Cr6TbRh8WQIixyEaft806?=
 =?us-ascii?Q?yyfEbDIShMO1qvJkLc+22CUrP1ruwvSGZQvSEXQpGAPVgcWbWfVfpIjS/hLP?=
 =?us-ascii?Q?uCVLVbLn9i4m13vVYTZ3sMYmE4LJUUf5Fncwji9QQ97488Yar8b1mgqa5cNz?=
 =?us-ascii?Q?crA8WxfrC/Dy3N4dn6AIF40HUZozr6o9BOCTzD4a0k44LRt+8B/bCceQM8DX?=
 =?us-ascii?Q?yCw4zvw/QXHpPpYpbx6yQDhVl+iCus+Z7ILUV6+WiNVTyTr/3h7hVx6SP0Pr?=
 =?us-ascii?Q?5Z6NBjWcxz8wzZUs954aSlTLG14l0cEJG8FtjiSFMP2BHF+zIcz06/U6ODa2?=
 =?us-ascii?Q?NRu9rOrHXmLx2eQqRbwVwS3wpPCzwfbdBNJKPifA95UKxtdmvXEmQBbXkYbz?=
 =?us-ascii?Q?IBsyKBsc21PSF+QJjD+4b67+Mhb6cQOzgofTA0x87hHlBmYck71sVVeY7tsk?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: IYiiK19DlByknU9scwjLJylN4Vqpxgeiy3YIMuKiJ4vPKflVqAg+6789swRcWmMvwgUYyY3u7L3LnJ6wg3m4FJbzA4O4LTwFXbc9B1muzvzWH8KfI8quN04YH6VjR22LVe3GEG13xqmH+yK/1XhxXMf2qGwJNMGuYlcPE1kR2vNCvhaNtgoVWFoFHVjTdnH6CKrLZXUqLjScKcxcRB2LuRtW3z3ukqV4SXL6tP0ICZBShTGRQkEqUnFgHUMc0PRmB5bDzTQsrbgxHtRpY8+tMtifB9NIzUqLHkd8qO5JAg2+XWnhsA4lG8OozqTeAyrdHzREF15u6K9GflOxPASVY96HIrJFUCbRMBk7t+DbL8wTa39BqXup3YqRMKOziaCormeJaZ1LKNQ8qW1AO8VrEO3u93jFfbYuu4+dxhyAJ0NtR2Bci7ZCwYQB2KBM8aMW8KksQ6V95KYEVPyVnt0iUD9YTF4uqtWcpYrKvjmT/gwSwphwrTT+03/wtvLz36d6canov3a6fAUrJ4SjOlAW2N5Xexs8yjmir9HivofBuLGPR3aSC60c9qM2N/upemaY3++9CIgoTaUVGObGUvYHjaQp3H0TZwEvGsrA+rIV/asU/4ec03nlTjE937ytRIKY3EoWmOSZfJJM+ePWmLlejp6YAd5aeWclukeiehd1J56D4W4BO/l6RopYQ9G1YX0V+RoryFHAjuWiN2IiJJ7qjdu32AOF+VgDuqki23+daAj5ttvbJrZNRUfUBohywnCUBGoUUCNKp1gytl/nE14TSQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52494f03-2778-49e6-c0ba-08db1b14936c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 11:52:19.1293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDYDBSGP5giTHHwELH5pWl3oFeTLAsypWYGqB0l2y53R7Dpf7h8mG/s3fpcVCHxxpaaHWkdH8NKal/WQGLMGPeL4mU9aY/zYna0eWWmdjAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7198
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_06,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303020103
X-Proofpoint-GUID: K9D_OFJvS4CYqSOs6sYqWytLn3hVH-hT
X-Proofpoint-ORIG-GUID: K9D_OFJvS4CYqSOs6sYqWytLn3hVH-hT
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0a-00069f02.pphosted.com
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


On Wednesday, 2023-03-01 at 13:40:26 +01, Juan Quintela wrote:
> In the spirit of:
>
> commit 394d323bc3451e4d07f13341cb8817fac8dfbadd
> Author: Peter Xu <peterx@redhat.com>
> Date:   Tue Oct 11 17:55:51 2022 -0400
>
>     migration: Use atomic ops properly for page accountings
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  migration/ram.h       | 2 +-
>  migration/migration.c | 4 ++--
>  migration/multifd.c   | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/migration/ram.h b/migration/ram.h
> index ca9adcb2ad..41fcec73ba 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -45,11 +45,11 @@ typedef struct {
>      Stat64 duplicate;
>      Stat64 normal;
>      Stat64 postcopy_bytes;
> +    Stat64 multifd_bytes;
>      int64_t remaining;
>      int64_t dirty_pages_rate;
>      int64_t dirty_sync_count;
>      int64_t postcopy_requests;
> -    uint64_t multifd_bytes;
>      uint64_t precopy_bytes;
>      uint64_t downtime_bytes;
>      uint64_t dirty_sync_missed_zero_copy;
> diff --git a/migration/migration.c b/migration/migration.c
> index 923f4762f4..ca52c8aab3 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1153,7 +1153,7 @@ static void populate_ram_info(MigrationInfo *info, MigrationState *s)
>              ram_counters.dirty_sync_missed_zero_copy;
>      info->ram->postcopy_requests = ram_counters.postcopy_requests;
>      info->ram->page_size = page_size;
> -    info->ram->multifd_bytes = ram_counters.multifd_bytes;
> +    info->ram->multifd_bytes = stat64_get(&ram_counters.multifd_bytes);
>      info->ram->pages_per_second = s->pages_per_second;
>      info->ram->precopy_bytes = ram_counters.precopy_bytes;
>      info->ram->downtime_bytes = ram_counters.downtime_bytes;
> @@ -3774,7 +3774,7 @@ static MigThrError migration_detect_error(MigrationState *s)
>  static uint64_t migration_total_bytes(MigrationState *s)
>  {
>      return qemu_file_total_transferred(s->to_dst_file) +
> -        ram_counters.multifd_bytes;
> +        stat64_get(&ram_counters.multifd_bytes);
>  }
>  
>  static void migration_calculate_complete(MigrationState *s)
> diff --git a/migration/multifd.c b/migration/multifd.c
> index f558169e37..91552d33bf 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -432,9 +432,9 @@ static int multifd_send_pages(QEMUFile *f)
>      p->pages = pages;
>      transferred = ((uint64_t) pages->num) * p->page_size + p->packet_len;
>      qemu_file_acct_rate_limit(f, transferred);
> -    ram_counters.multifd_bytes += transferred;
>      qemu_mutex_unlock(&p->mutex);
>      stat64_add(&ram_counters.transferred, transferred);
> +    stat64_add(&ram_counters.multifd_bytes, transferred);
>      qemu_sem_post(&p->sem);
>  
>      return 1;
> @@ -627,9 +627,9 @@ int multifd_send_sync_main(QEMUFile *f)
>          p->flags |= MULTIFD_FLAG_SYNC;
>          p->pending_job++;
>          qemu_file_acct_rate_limit(f, p->packet_len);
> -        ram_counters.multifd_bytes += p->packet_len;
>          qemu_mutex_unlock(&p->mutex);
>          stat64_add(&ram_counters.transferred, p->packet_len);
> +        stat64_add(&ram_counters.multifd_bytes, p->packet_len);
>          qemu_sem_post(&p->sem);
>      }
>      for (i = 0; i < migrate_multifd_channels(); i++) {
-- 
I can't explain, you would not understand. This is not how I am.

