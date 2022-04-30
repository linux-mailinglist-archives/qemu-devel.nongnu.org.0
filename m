Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E1F5159C1
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 04:09:03 +0200 (CEST)
Received: from localhost ([::1]:47684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkcXd-0008Sl-MY
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 22:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nkcWA-0007dg-TJ
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 22:07:31 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:6342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nkcW4-0006af-P3
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 22:07:28 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23TKT9qK011286;
 Sat, 30 Apr 2022 02:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=mDrVpkDLg2TA+Kls2zs97WRVZUxejY+4nW/BtMlxwiY=;
 b=utOhfBSCvigsX3lL/CpXZRDQm1FHuaeFv4qIKjCiWjazQCiCptV/63kO87aCqHk5L5NP
 2kfkV357BuobFD5CVUNUPfNM3gfaVD2FAp9hHVxsOFHolOmtJINq2mP+ZNZj+mSdc4sA
 JN6Mx11gvJcHwCSDnyxOC7P5qTnmnj2odGwnAOhUIzRe1YtgF5zk9GFjYTl68t3CR+k+
 xXP6IR9NDDlHFnH5JSP1KDjaAwhFwHAWAtMxJZtabuuRV8qRlnWO9CG7YFcvPNizdCWM
 dHv6QnjARoUBCG5ku43xyo0sNgWhgrFdV2hPhtiYPdqJ2pOO6d+KXgsS2AjvQod0kmcB qw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmaw4r8f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 30 Apr 2022 02:07:17 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23U21Fmu030140; Sat, 30 Apr 2022 02:07:17 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fruj68gnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 30 Apr 2022 02:07:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNhaiFSdV0ODsgtMX8I8yuzUEJxctldgnNSd0w+kFQoZG2fUkXHtp47c02xwIhQoqvIMCoKTlmWzIhpFpj8zL7tneN4ExsWd6VH7W3CILER4opdZXzIgxNXfihRcCl9BaoZ9tX0RTXikJHMHeow/Z/AT2MfA6YYvO8/6phchC7iVI6gjqFuPg2ZDD6dT/nxGlVu9CGjDPXUmdhUhFIvokLZBQDHskQAt22hgGwCo4eiWPu07u7U4NiSMxh6OTSMbQqqJYc+4UJf86EAwxbDgUvHkTvOZHfRhT729xaIgBpCIMbGXKZrHSF6Sf4kgGfKwmxJQXDNt+/KGy42Qq5mkMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDrVpkDLg2TA+Kls2zs97WRVZUxejY+4nW/BtMlxwiY=;
 b=f3YPjstUmgaqYckUDcZjqeEU3dN2aBHmKLnedEGKw5dwK2hBV43lt8Zwv+/FnL9WjEP1u3q4/iM57CeTdERyKSw8cXE82SGdkP8h+gGkspCOInR++5h4xfm7ip8nngrFQUdXyYnL+9Vbpjn4gMApUfxLAUFz3rWK93y94FhjiU2jlAMLoz8snDphU2GeJeN5LBe61eoOsWRtr4BGG+h1hW8wcxSLYA1VOh81fVs3RAtaDH+x8whdduFmjrIGNDhioqwfzCduyGT7qo53wuNNKyttVSqfMYcwvmDPeDtiKqYw6q+MmiEAs+DNxvLYWPwwoJr4QhMbxUblrfUm0qQ2XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDrVpkDLg2TA+Kls2zs97WRVZUxejY+4nW/BtMlxwiY=;
 b=IUsQ9GM7+G1EpxJgqCHtz5J/tz83rqZhI9hZ8lHCfsh/NGI0Xe57fGI0EBxLl1c+2nHrDIzRDfM2ovbfYl09OmC9Jm+6i/wXDDEVFgESeC3y4ZsHhc7d70BV2UHTCfJqKiTiVUR96x00q/s7IiTlRmIhxBuXHRjtltRkyYZOVvc=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Sat, 30 Apr
 2022 02:07:15 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5206.013; Sat, 30 Apr 2022
 02:07:14 +0000
Message-ID: <4f655f0f-c1ad-b8ae-2edd-b6a3524583cd@oracle.com>
Date: Fri, 29 Apr 2022 19:07:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/7] vhost-vdpa multiqueue fixes
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <6d7d0a27-beca-6693-ebea-780bca80fd9f@redhat.com>
 <ee09f73a-3a60-ae02-ebd3-12f954a19793@oracle.com>
 <CACGkMEv-sbYsA42rp-58ea0HnE1p12SgS=p2bE0xFni5qXyRPA@mail.gmail.com>
 <7dce3f0f-a71b-9800-b462-f5406a9c95a2@oracle.com>
 <CACGkMEtkf=B03NFEJfbPs2ZkurCJMi99TXYOHfucH9Ticqv+XA@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEtkf=B03NFEJfbPs2ZkurCJMi99TXYOHfucH9Ticqv+XA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0382.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::27) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62d7eb0b-572e-4b22-35db-08da2a4e251d
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB47594260BE1B4AEC0E858FECB1FF9@PH0PR10MB4759.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i/Hex6xqZQc5yknzOgVqdmrdhZiHzXbxTYxsrgyXJIpAiHS/mhGszPzTgzYeSkX/eanwH3s1gT6CJ7TMaRHLfl45JT3HIoBfL9jWXQ7ic/wB8P+id7QzNnH4jcChh/OaetSYr1WGpNPT9MRqe1ZkdsQv30ohBeMA8nLGFkARWzA5UoCrkbtAaE+GBhCVIPH+/A4nBIzQKAxbsg7zLHMc+llEBo7s00SayHxxWCqEQKZhBvRQ3n3Re/nHZasJu5DVcUfG6MZ8NG7ST4Yellb/jbsMVEF0zGnVyYD0EQlJwxbbsM9uNBZFYeCgHTiNkaoP6tvEuN/b7FncK6dlqUAeu8Y3OAGLy2Aqo/7EQWmgCx5a6R6+oXVDBadMAXTM4sS0WlHphq6a8oG0m3+gg4Upz9WpaheL7VKBDXgtzaNdz+x9l5NgUWlFgDhhZ+WIXaJZb/wdm8yyC6PnYxFeaYExDuFXmEcZEvKJNNlWznW8gECC0VXC0fmeulwxd4ICIAbNrbwX6GMAw9bBPydN6Y5INu59yu0J2P7e0ELajZmZYozXtq5DGjiUPpHSpNrRbPAArmn8ZOwPOcNivha9Ru6Gw+UTsGF7JsrRtd6oWYsw0YBalv+a1qeNNX5UtZFzOKVyqndaw25TDLMW/dzN1H0iEf7Go6TAdVFo1QRwwvCscgYZhevrAxM/W60Bobxz1h5JJH0jyEobiF+AP/lU04sThp5LPzLbizkTorbYO5Ig/5YIK+PpQhaEM63LqlccJkX9AIZ4kfb4WtrF3dicDAZb58rc9KNw/TUiUrA5oxy7X4zI/4nbUjL9umImMf6RaIhPN9mOQsg6CEo0mBY3NwrZl4XwJVWZgtzH3bmaUHDsj94=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36916002)(66946007)(8676002)(38100700002)(66556008)(66476007)(36756003)(4326008)(6666004)(5660300002)(2906002)(186003)(66574015)(6486002)(83380400001)(86362001)(316002)(966005)(31686004)(31696002)(8936002)(508600001)(6916009)(6512007)(54906003)(2616005)(6506007)(53546011)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFl1Q3BZUFgzMnJIY2xVQkxYTWlOODVHbGo4V09UU2Rta1Jack1zZ3dvMFJj?=
 =?utf-8?B?WWdET3JnaC9oTXgzTjBHUG1kajhndVBuL3JNNnFNdUExZGV1b1VSdGlDdHZQ?=
 =?utf-8?B?QlFRRUVTMXpXbFR1amd1dDRjcFY0ZDNVdHNxOE9ZSTlWRHNlRGtVQVFabnE4?=
 =?utf-8?B?Y1ZPZkN1SENTa2VST1lsRmJFS0VFcXRubXBTYm04d1l5UCtEVm5TU2lFaUZj?=
 =?utf-8?B?Ly95MTRSTHV0aXVxSzdUNGFqdUpPRkVTZHdXcnhWVEs1T3JDWUZlRUliL05M?=
 =?utf-8?B?Y1VzRmpGZnVUOVFHRXJodk1zdnZqN3Q5NHNnTCtNY0NycENxOWRsZm1TQVlG?=
 =?utf-8?B?ak1oVXFYUm0yUlRmMW1DbkFiSHJhZG11eE5pdnFaZlprYlN4TGMxNUY1T3Zx?=
 =?utf-8?B?NlBQWFEyOTJsb1pYY2p1M2hucHZpTkVLeGl3TUtpcmZoUFlpangzQmxpVW5P?=
 =?utf-8?B?QzFyektFdlZoTzYyK2plYzJuMkNuSnpvWVlVSUtXSWFycUgwRDIxWjlSNkRV?=
 =?utf-8?B?QzYyM3YyNnhldjAzbEpQbWRhMlpDVXJTanhxSUJPbFQwTEs4RFJSR0locnhp?=
 =?utf-8?B?NlBTdEJwVmdCK0x4SEt5T0pPUmtYenVnS0lucDFzUXF3MzRTcjRML3B3QXBt?=
 =?utf-8?B?QlE2MzZzT2kxK2g4UmhLejNjNkttd3U4YkczZUUyTzVQMUp0L1VyQUVSQUdL?=
 =?utf-8?B?TkFlN0h4QmlTZFBvQk1iQXI0WlovblhJVENBTHIxMmJwOFQ3eTRHcmpzcG9a?=
 =?utf-8?B?NUVNakk4M09MQjBjN1hlMGJIZlB3NlNRbmlDbk40L1laSlcrOUs5ejIzZHB5?=
 =?utf-8?B?RjZabG9WUUtZZklPb0RxN3ZmWGwxTkxyTXYvSFlIeUlXQkVXVTJ1VzBsSWZz?=
 =?utf-8?B?bHBFNG5peldVbUJ0eXhxbXQxWlVta2owVFdQNVBwUVJKSFBCaFFWZjVXejBI?=
 =?utf-8?B?ekIzZERSVXN5M05HS0RTYXQxdHZMRnJySmJTYWNYMi9rRUJtMVVQME5HVEkr?=
 =?utf-8?B?Z0lvTVhqTGRNd29QR3B1dUVVMG5TKy8yZlJyVHhGRTNmSVplakdrMjVxdW5k?=
 =?utf-8?B?SXY1bm8wbTRIN3NLZFU2aW5HUlNGcGxWbmg5ZVVQY25HbGczUDQ3N2Nna2VZ?=
 =?utf-8?B?aGJEejVCWGVWRkVrUFkzVEsvbE0vdXh6K3BGRkJsTjBZTXRtSjZ6dEpFTHNU?=
 =?utf-8?B?VXVoWlJJaW1YUm5zSWloZVVLcHpvdm9oV2lGLytKS1U1YVczYk90UUtuTXlD?=
 =?utf-8?B?MitLNWgzWi9mbWVsQ0RxWFhac1ZFT2x2Qm9IRFRtcDlIRnJoM1VMcmR4dnVV?=
 =?utf-8?B?a3JIVXdtL1VLZTZqSTRWdEVuU3FmYTErRjYzSmthc3VmZ1RXdjdnUmhtR3Bm?=
 =?utf-8?B?NDZ1OHhFRU01cjhKREJDVVlOZVQ5d1ZyN2FtK0ZSbHphZ3plN0R0LzdjYmhx?=
 =?utf-8?B?UmUyUnhMMHZkZklqRE1VM3dMZWpIdk1pcDU1UkJIVmwxaklsY0hCS0M0d3Jj?=
 =?utf-8?B?M1JHYTdDbFVYcy90UEtuY0FBQkFGbUNDVkYvWmUxU2ErbG9ZcXpTYWFFSU5I?=
 =?utf-8?B?MEtscGlibSt0MXlCQ0pwRXdzeUZsODQ1R01zNEVwVk9iOW5UK2pST0gvK2xY?=
 =?utf-8?B?NWZENDJHVTNNQ3J6a3M1c3BNUittZ243RXVQZnVDMlg1RjIrMGNEZHpjb2Q2?=
 =?utf-8?B?bWhndG9jYmtOUWxaeG1SbytjVVRSWUp1emVxRlRQRXYrQkw4elh4M3BRUFJ3?=
 =?utf-8?B?STZJNTI1Qnd6ckU3dVdaWStnTUhObUJ6aEc3akdlUHM0SE5CWXcwSDhxMXFS?=
 =?utf-8?B?MVBiSzZEWHM3MXhqWGFVNTV2ZktwS2JOb2sxd2tUV3BNTllyUkp5UUUxNzJl?=
 =?utf-8?B?cGJDeFJjVW9DVnZndDZRNzJNMUtnRk9Xdis3dThNN0RNdDZaWWo2MFBEeVpI?=
 =?utf-8?B?U3ljMEhjMytTVkduOWpIekRjRm5tbmVoWWp0WVM3STMyTXpldE9wd0c2NGlt?=
 =?utf-8?B?bnlTSTNRanh6R2VKSlJsdDh4VE9nYVFEYkNUSC9kUXNzb1pOaWxuNFEvOUZq?=
 =?utf-8?B?WTdvcjkrNncvQlBEV3BnQ2NaUFc0MDMzMjV1SW52clA3N1hvZmQ4Wmx2U2xN?=
 =?utf-8?B?bzErNVNVZEdvS3oxdVdXdFFOWlV6Q1ZGTURXOVRqL2lIS2Z5VzRTbHR5bi9S?=
 =?utf-8?B?MkZnT3pLUVp6Vmx6SEpwVm9JMWtlYlhQWnRsZ1RadGhRNXdRWlpNUU1xck9G?=
 =?utf-8?B?aVh6SWszd0plSGxydFlNQWpRelNYSkY2LzZYbm81SWkxME1RY3dpeG9PMDBk?=
 =?utf-8?B?TW01QkZuL2pJUHNqSmJoQlR5QUhJeU4vMDQ4YjRZOUE0WnprcTIxOURXVWdh?=
 =?utf-8?Q?r/JEkTdSbnahtFCo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d7eb0b-572e-4b22-35db-08da2a4e251d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2022 02:07:14.7177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6u/jHmF7lw3R5zjAPZoAREem0dWvrS2Avq1yUIirKZ075IfLTUK+NG+HTmQd5oBI210GZLOB1Rku4sG1l+II/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4759
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-29_08:2022-04-28,
 2022-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 adultscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204300012
X-Proofpoint-GUID: j2nKKaX1N5hUkKSzmVm7s0cFsYe6Tt7G
X-Proofpoint-ORIG-GUID: j2nKKaX1N5hUkKSzmVm7s0cFsYe6Tt7G
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 4/28/2022 7:30 PM, Jason Wang wrote:
> On Wed, Apr 27, 2022 at 5:09 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 4/27/2022 1:38 AM, Jason Wang wrote:
>>> On Wed, Apr 27, 2022 at 4:30 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>>
>>>> On 4/26/2022 9:28 PM, Jason Wang wrote:
>>>>> 在 2022/3/30 14:33, Si-Wei Liu 写道:
>>>>>> Hi,
>>>>>>
>>>>>> This patch series attempt to fix a few issues in vhost-vdpa
>>>>>> multiqueue functionality.
>>>>>>
>>>>>> Patch #1 is the formal submission for RFC patch in:
>>>>>> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/c3e931ee-1a1b-9c2f-2f59-cb4395c230f9@oracle.com/__;!!ACWV5N9M2RV99hQ!OoUKcyWauHGQOM4MTAUn88TINQo5ZP4aaYyvyUCK9ggrI_L6diSZo5Nmq55moGH769SD87drxQyqg3ysNsk$
>>>>>>
>>>>>> Patch #2 and #3 were taken from a previous patchset posted on
>>>>>> qemu-devel:
>>>>>> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/20211117192851.65529-1-eperezma@redhat.com/__;!!ACWV5N9M2RV99hQ!OoUKcyWauHGQOM4MTAUn88TINQo5ZP4aaYyvyUCK9ggrI_L6diSZo5Nmq55moGH769SD87drxQyqc3mXqDs$
>>>>>>
>>>>>> albeit abandoned, two patches in that set turn out to be useful for
>>>>>> patch #4, which is to fix a QEMU crash due to race condition.
>>>>>>
>>>>>> Patch #5 through #7 are obviously small bug fixes. Please find the
>>>>>> description of each in the commit log.
>>>>>>
>>>>>> Thanks,
>>>>>> -Siwei
>>>>> Hi Si Wei:
>>>>>
>>>>> I think we need another version of this series?
>>>> Hi Jason,
>>>>
>>>> Apologies for the long delay. I was in the middle of reworking the patch
>>>> "virtio: don't read pending event on host notifier if disabled", but
>>>> found out that it would need quite some code change for the userspace
>>>> fallback handler to work properly (for the queue no. change case
>>>> specifically).
>>> We probably need this fix for -stable, so I wonder if we can have a
>>> workaround first and do refactoring on top?
>> Hmmm, a nasty fix but may well address the segfault is something like this:
>>
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index 8ca0b80..3ac93a4 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -368,6 +368,10 @@ static void virtio_net_set_status(struct
>> VirtIODevice *vdev, uint8_t status)
>>        int i;
>>        uint8_t queue_status;
>>
>> +    if (n->status_pending)
>> +        return;
>> +
>> +    n->status_pending = true;
>>        virtio_net_vnet_endian_status(n, status);
>>        virtio_net_vhost_status(n, status);
>>
>> @@ -416,6 +420,7 @@ static void virtio_net_set_status(struct
>> VirtIODevice *vdev, uint8_t status)
>>                }
>>            }
>>        }
>> +    n->status_pending = false;
>>    }
>>
>>    static void virtio_net_set_link_status(NetClientState *nc)
>> diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
>> index eb87032..95efea8 100644
>> --- a/include/hw/virtio/virtio-net.h
>> +++ b/include/hw/virtio/virtio-net.h
>> @@ -216,6 +216,7 @@ struct VirtIONet {
>>        VirtioNetRssData rss_data;
>>        struct NetRxPkt *rx_pkt;
>>        struct EBPFRSSContext ebpf_rss;
>> +    bool status_pending;
>>    };
>>
>>    void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
>>
>> To be honest, I am not sure if this is worth a full blown fix to make it
>> completely work. Without applying vq suspend patch (the one I posted in
>> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/df7c9a87-b2bd-7758-a6b6-bd834a7336fe@oracle.com/__;!!ACWV5N9M2RV99hQ!L4qque3YpPr-CGp12NrNdMMT1HROfEY_Juw2vnfZXHjOhtT0XJCR9GB8cvWEbJL9Aeh-WhDogBVArJn91P0$ ),
>> it's very hard for me to effectively verify my code change - it's very
>> easy for the guest vq index to be out of sync if not stopping the vq
>> once the vhost is up and running (I tested it with repeatedly set_link
>> off and on).
> Can we test via vmstop?
Yes, of coz, that's where the segfault happened. The tight loop of 
set_link on/off doesn't even work for the single queue case, hence 
that's why I doubted it ever worked for vhost-vdpa.

>
>> I am not sure if there's real chance we can run into issue
>> in practice due to the incomplete fix, if we don't fix the vq
>> stop/suspend issue first. Anyway I will try, as other use case e.g, live
>> migration is likely to get stumbled on it, too.
> Ok, so I think we probably don't need the "nasty" fix above. Let's fix
> it with the issue of stop/resume.
Ok, then does below tentative code change suffice the need? i.e. it 
would fail the request of changing queue pairs when the vhost-vdpa 
backend falls back to the userspace handler, but it's probably the 
easiest way to fix the vmstop segfault.

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index ed231f9..8ba9f09 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1177,6 +1177,7 @@ static int virtio_net_handle_mq(VirtIONet *n, 
uint8_t cmd,
      struct virtio_net_ctrl_mq mq;
      size_t s;
      uint16_t queue_pairs;
+    NetClientState *nc = qemu_get_queue(n->nic);

      s = iov_to_buf(iov, iov_cnt, 0, &mq, sizeof(mq));
      if (s != sizeof(mq)) {
@@ -1196,6 +1197,13 @@ static int virtio_net_handle_mq(VirtIONet *n, 
uint8_t cmd,
          return VIRTIO_NET_ERR;
      }

+    /* avoid changing the number of queue_pairs for vdpa device in
+     * userspace handler.
+     * TODO: get userspace fallback to work with future patch */
+    if (nc->peer && nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_VDPA) {
+        return VIRTIO_NET_ERR;
+    }
+
      n->curr_queue_pairs = queue_pairs;
      /* stop the backend before changing the number of queue_pairs to 
avoid handling a
       * disabled queue */

Thanks,
-Siwei
>
> Thanks
>
>> -Siwei
>>
>>
>>>> I have to drop it from the series and posted it later on
>>>> when ready. Will post a v2 with relevant patches removed.
>>> Thanks
>>>
>>>> Regards,
>>>> -Siwei
>>>>
>>>>> Thanks
>>>>>
>>>>>
>>>>>> ---
>>>>>>
>>>>>> Eugenio Pérez (2):
>>>>>>      virtio-net: Fix indentation
>>>>>>      virtio-net: Only enable userland vq if using tap backend
>>>>>>
>>>>>> Si-Wei Liu (5):
>>>>>>      virtio-net: align ctrl_vq index for non-mq guest for vhost_vdpa
>>>>>>      virtio: don't read pending event on host notifier if disabled
>>>>>>      vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
>>>>>>      vhost-net: fix improper cleanup in vhost_net_start
>>>>>>      vhost-vdpa: backend feature should set only once
>>>>>>
>>>>>>     hw/net/vhost_net.c         |  4 +++-
>>>>>>     hw/net/virtio-net.c        | 25 +++++++++++++++++++++----
>>>>>>     hw/virtio/vhost-vdpa.c     |  2 +-
>>>>>>     hw/virtio/virtio-bus.c     |  3 ++-
>>>>>>     hw/virtio/virtio.c         | 21 +++++++++++++--------
>>>>>>     include/hw/virtio/virtio.h |  2 ++
>>>>>>     net/vhost-vdpa.c           |  4 +++-
>>>>>>     7 files changed, 45 insertions(+), 16 deletions(-)
>>>>>>


