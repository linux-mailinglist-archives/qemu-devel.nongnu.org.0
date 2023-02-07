Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2108768E2BB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 22:19:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPVLl-0004TT-Sf; Tue, 07 Feb 2023 16:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPVLc-0004Sy-Ke
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:17:52 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPVLU-0003Kj-Bu
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:17:52 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317KTePY004371; Tue, 7 Feb 2023 21:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=j2QWk8oPbI3swZml4f3VGFxHC4u6+J4pwVa8qzqtcCU=;
 b=C3lxECgkMv3SdILuKp+YiD6Wy4J4COwzSerWqXx80klLruGZi5XbWEE5r7AvhZWf8URz
 /0BknGEvJxH/b9+XL7qECjCtuU+4M4MPcp5megv48a58EIl20I/RU+b0IUrUM61rzsWc
 gCFHsXB1Jz6EPV2STLQds7EEWXkDVy12zP6Rm4uljl3AFGj7nTaoMhnRBFRB/U4GSO6K
 3u8b5Cj9tksL4mh6MrcXnSWddgK7/L6T7WDAed1soj91oybgXTLRnu2jhHoqPfCLc/mW
 J+5zRsCw+lHliMHL2+0etv5Gd5DY7PUVIce9KUXogRzYISo85Xnha98TedLhB3yOron+ CQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhfwu6mtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 21:17:41 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 317L8mbI012350; Tue, 7 Feb 2023 21:17:40 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdtcss0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 21:17:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A1lI5wailQS0aYZ8lMv/O5FKSuvYkI4QtlGqHyMskoYO1NUgDURKS+nDI3w3AQ9OBRlha1RONpDuCpE3MkOrmGmjbtp0ZvKLx0gQhOZLNWySbhAq9Nj33FTVXEsdA2Xmsymp9ZFqNwN+J11h+tOCgQdKrfoxwGbrxVP4sc0Xz5ZB5BHoOKO6VJn4Pb06G8KPh/r8yIODKo3jI1lXAVwvbtT5TliO0vB/4n6JNDy3j/trw69yQRvg6YqpdcQur9iFvG6/DH7wxfBSEsuVk1mm5fOUcklU9yFb25dx83NILo+qzFUsN1hMPKO9pS7jwJ5wxrSkHS857DTkYJeL+CDxQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2QWk8oPbI3swZml4f3VGFxHC4u6+J4pwVa8qzqtcCU=;
 b=obcjLz5LDOHXv8ckqMQOlAV0+43AWcpU4HZ5NoCWA+ELjD8NDLiNGbYUMbalk35MrAKcFfMr37fSTuHLKlqWom8vgLw8rQ9iUpZ18CMvbYjocYzCatBBOM0KPxvld8VI1u4dx9ky6y7kGObsk44zNOSG3+0ZacdfOVNKHS+Eq9SgaCDgwFa2paqsH9wbNzt+6eOi3rqn4aqksUj5q77sxT0LOUskhhwnTLgms17gFGF4756DAAbnqS8/ciJm27xYcNtpQyz7pZzgncVakiObiBQQ6m0La/MS2bJNJGd8R5/KcyLBXlqQAqeCihEd24DkWK0miurx7XaSporKHqEvog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2QWk8oPbI3swZml4f3VGFxHC4u6+J4pwVa8qzqtcCU=;
 b=IgM9SYFhBkkYshQSHO40v5GjxE5U4jZEqX6CumzZZutBIoI/Vz/WF+Pj1emqFeg8txx1mtbx1o6LzsPdiXwy4ow1HTsusMPnVQRFqShffy5Rk+zojlmJ9hPqVyTbXUw5pQYlFVkOApGz3ELDyolw8SHppggdfsh9nsky12o0FQI=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by PH7PR10MB6156.namprd10.prod.outlook.com (2603:10b6:510:1f3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.7; Tue, 7 Feb
 2023 21:17:37 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c%9]) with mapi id 15.20.6086.016; Tue, 7 Feb 2023
 21:17:37 +0000
Message-ID: <0a757102-0378-db4e-d889-9872f3a2d529@oracle.com>
Date: Tue, 7 Feb 2023 16:17:34 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V2] migration: simplify blockers
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>
References: <1675796593-235541-1-git-send-email-steven.sistare@oracle.com>
 <Y+Ku/zQOoFogmx0j@x1n>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <Y+Ku/zQOoFogmx0j@x1n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR12CA0028.namprd12.prod.outlook.com
 (2603:10b6:5:1c0::41) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|PH7PR10MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ded356d-b839-450c-e8a4-08db0950bc9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yg3z1mLm/KrcIMbvxt8NkowwYYA1zruwW6BHl8ts5GlQ7QNG8WO+glYc0bGyXeb+3dFVkyMx6rLl4XhVR4eUz8YcU/WTveW3L1CiQd3C38+qcOslTcy9GGqwx2I4QNOdHYRCbBZ8uZOYOMNaB5JN/X+2xsHn5LGMvm7tQVF1f116+zHgVmhL/Bk2vwz1HzpeyQx+UpvyJwQez97kNLj0GCvT9VT2hmWoe0JAaPUZBhA7YVE2owBVCWOM1Lc4jbuWy1zj8kbTp6iPlMaAbjFBvEf75j/A+F3OeGwzirzLFmKaozscgCpxYlOH6Xzw/Lfr9ag9ptpM5PKFBabJ8nLODgMfo1mIl8h1MxzBNtCmymJ/hzBxMdz8R65bsfoVAZRI8nZpwl4pl9cqECAz5+rRCU8pl+EmXAjejqZTwzk/Uq06sb7tgA2jct5SpO4FyqlXlyaBsXCCd12vNXolzrtO7cCK3yHTD6rrtXc9jMKK1BttFzDcyPKd9ToTbuz6YMCMSjyNixhP/9+nh38syf0OnK+arShJAUrp6ujn9IRKWbjqku2y1R6iVH9Ih6DOtd5M0maUIPPE/KPPQyFIGVv54gPF1gcNUze6bv1S5uah0tBPOLah4e6kaL8Kc/KVy28ufIn0Qx1ehAVUF9o89O86Xomu7Yf8h7N+Kc9xXHMnnLbZwC7HpafOCL49VlSsX9vBM5ADYQuflWSPenpTCsM45PGDwzBese8vC9e49wLBGPg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199018)(6916009)(2906002)(31686004)(6506007)(44832011)(36756003)(41300700001)(8936002)(2616005)(66946007)(8676002)(4326008)(83380400001)(66556008)(54906003)(6512007)(66476007)(478600001)(38100700002)(186003)(316002)(53546011)(6486002)(5660300002)(31696002)(6666004)(36916002)(26005)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVhkMW1aQ25EUjFFV1N1cy8vQmVFWWhBWUMrL1RJWWxGYW8zT1BrVDg4cGZo?=
 =?utf-8?B?dEVFV3FzbjV4V3RWQmp3NE9lcGNmN2dEbFlVZUdSWlNnZ0dWNjdkYWs0ME5H?=
 =?utf-8?B?NzBuL2JNWDZmN0NIYzJSVG1pZW92L2hnUWJ5czNqOXFPeEFNSXlwUCtiVkoz?=
 =?utf-8?B?NTNTR21rMlI5V0ZINTBEbllZNFBGdWZNTkl3ZWRDam1FRWdyY29VOUI4alBG?=
 =?utf-8?B?Sm5UQ2tMN0VJYmF4VU9PZEordUNEdHVlenN3SmQ5Zm43WjVWdmRvc1ZqN1M2?=
 =?utf-8?B?dGpMalFKeHF4eDl3eldvd1lUUFVwRmNtOWN4MjgxZW5CeGFYUWRqcEEySzda?=
 =?utf-8?B?TEplQUI3dWpDZElEa3Y3ekpxUnE5c01wOEwxdUFxMFg2cDRncU1XNzE2K2Nm?=
 =?utf-8?B?aU5JanR3NzBpaHc4NDN2UTFzNkFsL0lqR3o1eVVNNkVsMEd4aGFtT09tdTh1?=
 =?utf-8?B?NGZYTU1iVStZcDBFUkNjWis2OHdGaVl6aEVidTRXcVlDQ0dJdzBlZVlhcGVG?=
 =?utf-8?B?UVVxODlNZmN0T0dIK1JKR3ZibTIrS1kzNk9BdTJVQzhHRHR0TWpJT2Vqa1Z6?=
 =?utf-8?B?OFIyK1lkdlN3eEZ5WWJITG9pZjFkb2NzNzczTndMbUsxczMvYjRLVExpck92?=
 =?utf-8?B?d1lsYzZqNzh1dlI2UVFjK0Z6eCswZlZSVjlGcnRSZk1TOS9wWFV2cmZOaVha?=
 =?utf-8?B?TGxyRnNGandrNm40a0IyTDJwalhNbjI5V2dMR3owMllxTjh3cTd6cmJjbUZt?=
 =?utf-8?B?S09KckhpcG04TW1lbm1GWmxTY25iVjJhVUhKZXo0aFg4UTN5SDF4dlRaSk9S?=
 =?utf-8?B?L2VrMTFZT09yZUhUS3FqOWRFQzNITnV3a3p1NFlrWC9maUloRnBjdEM5eGNC?=
 =?utf-8?B?MUNFcDlhQ2ZHMTNEcmd1alNCZk5ZbklhK3NkeUVFZllEczRiMXNSQTZteU1N?=
 =?utf-8?B?enA5WDJNT3hVZHJ2SzRFSHVhaGVrOWcwYnNPbHVLazduNzZIcjBaTjZtRHFo?=
 =?utf-8?B?Z3RVME1NaURjajdUcnFCV2QyTUNvYXVreUJZQksxcUV0c0JFSDRzQ2c1aGFo?=
 =?utf-8?B?ZW9mVXcvTW9vcjRMemRSc1FXd3l5R2svUkFQUFJDWUo5bWFiK1RjNUMwZHFn?=
 =?utf-8?B?dXNvTDdUeHlMd2VaMVZGclppbnE2aGtQbFRGZGpYcmJBUDMxdEs3eS9vSmlG?=
 =?utf-8?B?WDZNeUNIWWt0K0M0b1A0ZTJDWjlWVnNsQ3h6RVJNUEcvZS9Ed0JGUlZYQnRK?=
 =?utf-8?B?bWRXczV4TGx3azhZcjFlZGx6RTg0LzF0ZzB3ZllWOTFFQWZpR3ZSUzdjMWxt?=
 =?utf-8?B?Z0FSUTN3ak1pbjlIa1M5L3IwUzBMMTBiWFhDS21OZlRtZE9VSFFTOVc4YzVL?=
 =?utf-8?B?WEZqcDREN1VyUmhZNkZmTDRScU5WbWUydzhReUdyeXVvQ3FkMHJkQlQybUR5?=
 =?utf-8?B?VDJGVkxkdEkrU3NoU2c5T3cybHRaZ1lIeUY2Z0d5QU9YdVR4RXRheFk3NWp2?=
 =?utf-8?B?dVRqNUNySU9XdS9ZcmJGR1FVcCtKNXRSYWFTWmRvK2huVVdFY2E2V2ltcG8v?=
 =?utf-8?B?M0ZEVzF5alpwSElERmVoeDRpTmVRQjBZb0tDNWo3T0NwcWo2b2NQVmlwTENN?=
 =?utf-8?B?VWRRa0FsNHE2cHpjWlhrUnRxRHJuTFU1NWNPSUUwbHpFclZ1djhhTnhFUlNZ?=
 =?utf-8?B?b1QzRU5xRHgvSE9CYmhGMXlzUFlLQVc4eEs2ZTVraEFtSVExN1NjY3RNd3pN?=
 =?utf-8?B?d2xUUTl1Z1hZelJTdnhwSUQ3Nlc4QmtkOVR0NDVGL0lLVFYvdnBrOXNzMXlj?=
 =?utf-8?B?cHU0aXRPK0Q3QmtpQzVxZ2V0WUk1NTVNbU1mVzJYWHg4cGxEVDlLa1Fkb1Z2?=
 =?utf-8?B?NGZLbGFXTHJtcjl6NFd3am8yanVHZG1uZjVaMkIveHhBb0ZqQmxlLzFVdGpK?=
 =?utf-8?B?K3lSSlZYVWJVYW9pRVNranZ6Tjcyajdtd040YmpONmRXckZKMUppMXV4aHI5?=
 =?utf-8?B?TEhNZjRDZ0twUTBxbUZSd09xK0F3MnpKejlQb1V4bHpZTDl4cXRRNm5OTFov?=
 =?utf-8?B?anVEYU1rdEJLZ0t2UmtFRmI2aTVTUFhIeTBidGJobkROMUtvcjV4MVorb3Nx?=
 =?utf-8?B?RnhhRnhoZ3VqSERSeTEvRldFVHhaSzFrWTl6ZWQzRUw4clU0UTVZU3VGQWlz?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: KwVy3i0mBatoiKBhq2gpA/AGVZg828ChjwbZiQaEdaA+HjnkaTzTrEjZmFNwxmm1nQTo3ggcBJwINVd6QWe+b+c2EwbUnZw24f6KfW1C/Fkhqsr8TfDfS+Z3/WTlnOgkaojkQwb1OX8sZM0tLdYGGSsRKVrhM8lNkfnvOkUEM4gNx5ZH+r9k//3XPUCpGxC6yo9ktcVK8dVRUy9wL5Za6MQy3HTjruK4sU3Jr/AQqOReFJoQyYVWkY7OIMM/xfHP7R+KtmPCMwgmzTC4/LmW9s8f71J8a3a6pa1K8bc1pMARyx+psY4gLijSkJ8znZPUOKpvM4mUngo1cZrAbgIPH02yoNaeREwJ8rgRelJ4ZJQmAJCKhisykdMnopdbiZd2sbikl3dAFZeeD5wKCj+lkZpDfJ5m6W2rmSwyzb2flgB73RAS+Z/ayGo3BePXL9UU6wrtFm0AtU9Cjok7CNDcdK2pPPiT0+XT7LjNmIemSUjOMxGFJ2jITr08d+y0/GfdoHD+gDOzombd/twNU+Y2OCBoJOZ8S/M8ZFUZCVLXTOHiYezoEt9q0/x4bSCoK3NJYihYtKQiVBP/wRWyyCZEkxFdvnYKDeGd9BS2MHci1Eli3XHwn8HcpmK5rm7hdAY5mEkKKyiyHz4PnjC4HYyBOY3+uKLFQweT/8II5ppGpo9JknXKFJiy4DfmZ0eLrr7S/ti6z354ZwGLy1ucQZlkw6/1MsgTLNmvyiZ4/pMFsF56U82acwITBqBl+yS4v+eslzUgTwPj8PkQxZ0txr490A==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ded356d-b839-450c-e8a4-08db0950bc9b
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 21:17:37.0675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXDu8Br2f7RC0uXOJFZhKXyzE5Xug2q7/QLDcwDpWsCXDLsdM/S96pWVIfvulHzL8qkLPg/xAKWks4MiQ2a0mizDuoS4XY49vMJKVd5yMfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6156
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_13,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 mlxscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302070183
X-Proofpoint-GUID: W3uA_Qc2vCD0POPjnea1ShmhcgypSoZ7
X-Proofpoint-ORIG-GUID: W3uA_Qc2vCD0POPjnea1ShmhcgypSoZ7
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/7/2023 3:05 PM, Peter Xu wrote:
> On Tue, Feb 07, 2023 at 11:03:13AM -0800, Steve Sistare wrote:
>> Modify migrate_add_blocker and migrate_del_blocker to take an Error **
>> reason.  This allows migration to own the Error object, so that if
>> an error occurs, migration code can free the Error and clear the client
>> handle, simplifying client code.  This is a pre-requisite for a future
>> patch that will allow one Error blocker to be registered for multiple
>> migration modes.
>>
>> No functional change.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> 
> Acked-by: Peter Xu <peterx@redhat.com>
> 
> One trivial comment below.
> 
> [...]
> 
>> diff --git a/include/migration/blocker.h b/include/migration/blocker.h
>> index 9cebe2b..7c8d326 100644
>> --- a/include/migration/blocker.h
>> +++ b/include/migration/blocker.h
>> @@ -17,19 +17,22 @@
>>  /**
>>   * @migrate_add_blocker - prevent migration from proceeding
>>   *
>> - * @reason - an error to be returned whenever migration is attempted
>> + * @reasonp - address of an error to be returned whenever migration is attempted
>>   *
>>   * @errp - [out] The reason (if any) we cannot block migration right now.
>>   *
>>   * @returns - 0 on success, -EBUSY/-EACCES on failure, with errp set.
>> + *
>> + * *@reasonp is freed and set to NULL if failure is returned.
>> + * On success, the caller no longer owns *@reasonp and must not free it.
> 
> This statement reads weird.  IMHO the caller still owns @reasonp, but if it
> succeeded it should only free it with a migrate_del_blocker() later.

How about:
  On success, the caller must not free @reasonp, except by calling migrate_del_blocker.

Same below.

- Steve

>>   */
>> -int migrate_add_blocker(Error *reason, Error **errp);
>> +int migrate_add_blocker(Error **reasonp, Error **errp);
>>  
>>  /**
>>   * @migrate_add_blocker_internal - prevent migration from proceeding without
>>   *                                 only-migrate implications
>>   *
>> - * @reason - an error to be returned whenever migration is attempted
>> + * @reasonp - address of an error to be returned whenever migration is attempted
>>   *
>>   * @errp - [out] The reason (if any) we cannot block migration right now.
>>   *
>> @@ -38,14 +41,19 @@ int migrate_add_blocker(Error *reason, Error **errp);
>>   * Some of the migration blockers can be temporary (e.g., for a few seconds),
>>   * so it shouldn't need to conflict with "-only-migratable".  For those cases,
>>   * we can call this function rather than @migrate_add_blocker().
>> + *
>> + * *@reasonp is freed and set to NULL if failure is returned.
>> + * On success, the caller no longer owns *@reasonp and must not free it.
> 
> Same here?
> 
>>   */
> 

