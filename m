Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6573A429F6E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 10:12:04 +0200 (CEST)
Received: from localhost ([::1]:47476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maCtH-0006jZ-Fd
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 04:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1maCY3-0000ch-Qk; Tue, 12 Oct 2021 03:50:11 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:17364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1maCY0-0002qm-Gy; Tue, 12 Oct 2021 03:50:07 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19C7K4c9015549; 
 Tue, 12 Oct 2021 07:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=XGPsf8b6RIWdMM8AIhY4hp8W7CBwBv4NNe9ebzUwrfM=;
 b=GX/dE3b/3TYTgqQwL3NiKXq7hjxDUL7jQiPE0irs/+/eKGqpPmmL4TCnmjX0APAJhCZ4
 Z02mDIU/PYqpDbqg5f2mhjqihggAQZLYR4Rq9Hbok8GvLg7aZ08nFqyDxPvk7/gMcru6
 P6N2Kbx/ZPfBvbXAPQg2ow0PuXmvFWBH/QoSZsn5DnAzOH4mrP4FscVTfM26/a+GEbVk
 rXDjDvK47sclIXeVCMggfg7E6g861LRoP8Lb7K1CyD6adk5uidj+6M8qULkXCGdfO2qD
 jOi2Ox8Z1kmHEU5pScXdL9X/3NG3p4YL2Ph9+3Kq4/q0S5d58DuNIfbSE1QOpk0UzRO4 IA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bmq3bd9wf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 07:49:53 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19C7kQxD190691;
 Tue, 12 Oct 2021 07:49:52 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2171.outbound.protection.outlook.com [104.47.73.171])
 by userp3020.oracle.com with ESMTP id 3bkyv9pe3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Oct 2021 07:49:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UO28Lsny5yfZJstpJ+QuNMawOnpoGQ2urApOrssq7auWnja2Gz/81Or+lrjTgwt2YNb2tZn21wADNIF7TuEGsu5cv0aGwLAZi3IVdTZ+SbaPv5jOMLKYgyTxOOJfqIpOBJmeOLagMcatnLoSAqW//vUdEYuxRaV9OsKmJxKqKDGMno0+Ty4ut88WkOcG+lCP730ox3mCqidNG5UoIXbaqvi3h9kiCBKSUOqtY+qFuU7lHRNn5pL73HznRWFP0pTuFdD9Hjzx2dfLuUlczUoBnPL/z4DolmIV0OnVoHD9UBOdQKFPCDOhM/aVoZIzoYFgZPdh3+DJyCSawFU2cKpxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGPsf8b6RIWdMM8AIhY4hp8W7CBwBv4NNe9ebzUwrfM=;
 b=NuZXY+DZ9Mpul8A0tB4Ew59cy9fSI2GBcJSIGXclBjXXLWUjoQdOotnRWx1lOl31A6kvQKJKmip20X/uzaecCE6hi56Jw0Dexw82zm8RNHscN5prSj93ArQCEEZWPZ9C7US7PYuMYQcsVA3DyLD5Xn/HFTLyaWSpd+1ekoyFmgomX41eVea7xOWPJNoANMiqcZHaM/prJ2PiHrczONIwRHGOGe1uPyP10k6TUvLhFBglCV8etsvnTOXfqWP3vNRSCSuNU0GgowMKpZ2lKCujT0bcP23i+dqR/TihIBokskUH6Vag4fpLWyi+P1OQ2ndH1EEzRcA6YelC5RRkdGp6iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGPsf8b6RIWdMM8AIhY4hp8W7CBwBv4NNe9ebzUwrfM=;
 b=lJSL/13bMpcHdzrdP0vAI3UetmWfBaQ2V3TCzTlCO2j1VyoCBMbgoSFhZDTueuNfxivM3LTlAdU934cJ0oPZnbvw/qvj2m1QxV530lPs/wM9BpV44k5/TXoY1zOqxabWFsiyzeeHxoNm44gBBK+8B579+kQJQIP/iCcbONmjLFU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11)
 by PH0PR10MB4453.namprd10.prod.outlook.com (2603:10b6:510:37::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Tue, 12 Oct
 2021 07:49:49 +0000
Received: from PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517]) by PH0PR10MB4664.namprd10.prod.outlook.com
 ([fe80::3446:f4ea:c037:4517%5]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 07:49:49 +0000
Subject: Re: [PATCH v7 1/8] virtio: drop name parameter for virtio_init()
To: Eric Blake <eblake@redhat.com>
References: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
 <1633452353-7169-2-git-send-email-jonah.palmer@oracle.com>
 <20211005211424.kxa65zl4r6qoekqd@redhat.com>
From: Jonah Palmer <jonah.palmer@oracle.com>
Message-ID: <37d12449-60e6-d6eb-a4c8-663e456f6bf7@oracle.com>
Date: Tue, 12 Oct 2021 03:49:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211005211424.kxa65zl4r6qoekqd@redhat.com>
Content-Type: multipart/alternative;
 boundary="------------B9702BCE0AD61B4B7CEEAFD9"
Content-Language: en-US
X-ClientProxiedBy: BY3PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::6) To PH0PR10MB4664.namprd10.prod.outlook.com
 (2603:10b6:510:41::11)
MIME-Version: 1.0
Received: from jonpalme-lnx.us.oracle.com (209.17.40.42) by
 BY3PR05CA0031.namprd05.prod.outlook.com (2603:10b6:a03:39b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.4 via Frontend Transport; Tue, 12 Oct 2021 07:49:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7358fc4-7268-4f87-3935-08d98d54ddc5
X-MS-TrafficTypeDiagnostic: PH0PR10MB4453:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB4453C70E3FB2BE01043D9AA5E8B69@PH0PR10MB4453.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8L1d9EU85SzofF0VvWzOwa381SzCwUaxTIhzOzNjhAkkI5MNAfyF7PkgCftul0qrUu6jmdIRkg0WFguij0U5EC8cGXWqL2Ps+B2P9mbDiVYdsJx9ePAvr0/OWhycR+oFpNBE7pwxd7w8CFLPC3UZZxPxkTZogj2A8lNo6CTq3euMpDsP2VPS91eOoJDmTrWfzMQmjXEEoZSp8kHG13aav4IN+Vp7X789HjolPDC6v/wZvlcS2ekv5KmIGAfu1LDnWbR3BjGjwzY8A7N/BL1zVPGnfBSW2LNWCZmvQ8lWlISpWvtCGtp+dT+vdsl1RnsJ6rg86/pw32vuX3sVXNqnpVVBPkEtmCVHS1CHEftBu2XTF3ZxJ0ucSLlqNogUT+q4nutlH+/u+vKZCUHS75BIPN0tcbfxAemYyX0E4oFoj3rfE02fd5FqGfzZgVPH5IKOW4qwLXEhdS64BhIlXEl4syBfuh/mZfNdpy8kHKV/fVu5zRXeKbA+c5jftODfHCVhi32TEClKeUfWqdkMo0HJ5GSo728Drz+6HdW2evT1HRGWr1n0zXAWqpTxjG7WnGPwuHJEo6U4R9akytUednoBCxK7VuCYym46afLcFMf2GP5vJ1CgZ6eK8acICS0Zl0/MyKMq/rmt6qNSRvZRNLzcNt3Ceq5/wTa2k0AseIrwRiYpAVKmWGXUds9cMrJrh/X/KZ/iFHHDxRJaSMppHUwN1+n+8NqBxsc3/hVLGwu/dkDDnuM3/0a7y0xPx8VbEkom
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4664.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(33964004)(36756003)(186003)(4326008)(83380400001)(8936002)(316002)(508600001)(44832011)(26005)(53546011)(2616005)(38100700002)(2906002)(6916009)(7416002)(86362001)(956004)(5660300002)(6486002)(31696002)(66946007)(66476007)(7696005)(31686004)(66556008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0k0T3h4aDJtNTQ1bWhlSkt3ZTFrNGYxSy91b2FGTG5oeStLT3FsUktFeVkv?=
 =?utf-8?B?bytmV1dqVWMvM1FIc2Rwd3ZpYmdDL051V2IyR29kMjNtZVRvZmZnd1kxZlov?=
 =?utf-8?B?N2tuMzhmWTlNanBhZG9LQjdZSFhQRjNnQkxXWm1lTlZrS1lwdGcrSjJud0Fa?=
 =?utf-8?B?UTVwSW9OTFd2NzJhMDlCYVJ5OGtYUGFkRjJDcVdud3lPM1ZOcCtSRGlCdnAv?=
 =?utf-8?B?dUIrTVZ2UXU3ZkFUMXdqZEpiRGZwSXFyQW1iNzU1dTRsbWpYR2w0NVpMYVUv?=
 =?utf-8?B?VUpTaGJKS095YkVIYzJzOWtNUmd2QzdPbXhVaG83WmJybDYwM09UbHpXODFi?=
 =?utf-8?B?bVBFd2crWk9weWJQN20xS24xSnExVXk5WHdZOGkyRlZ4cWVRM3AxYTR6bVhn?=
 =?utf-8?B?ZEFYUGtQSk1aa1BrMk1yY2JRK293TmRWZlhxSTBNNVBpSXl1T3crb2RIeTYr?=
 =?utf-8?B?cGdQd0M5VHdBRmNWS1B5eHp3RTVQcHYwTXNwZkoyUXdNTFF0NnVMN0V0TWM0?=
 =?utf-8?B?UGkyelZlcTBSVDdweklqODVJaHhIMGF2YVJyS2xHZFRGQjdYZnZKdWx6K2s3?=
 =?utf-8?B?LzBMRjhzZFJRRC9Qc2x6dnl1dTJBd3JqbWg5L3I4Wk03NzNKWnZoWlYzdVNh?=
 =?utf-8?B?YmZTblh6QnZqbzEyQ2xrT1EwVEZQbzFMZnliVStiRHI0cEpCbU9WL0hDSmdR?=
 =?utf-8?B?N2lzQjhsMEovbkt4VGRmNXJqZlBYUFN6aDRwQTVYdEY5QUF3VXFnTk9ZY2xx?=
 =?utf-8?B?Uk1ybWdrQ2lDdWgzcU9FeWdieTJiV1FWOFVmUi9RT3FJWk9KYURHK05YSDFu?=
 =?utf-8?B?eER3Z0p1ZWk1M0VtVWIwdFU2RXQ3TnVzaXc5SElGMm9vZGlpMGU4Mms3RFJV?=
 =?utf-8?B?bTlFNzE2U2tLd3lmc2VSTGpRUWdYNlNCN2JrbXA2Sy9wN0Z4dEJUZ3hhUXdz?=
 =?utf-8?B?YkRrY29tWnhmQlQxZUp2ZGNtYTVFUkQ2R0s4U2RkT3JNMkpDTzY2TTVxUERp?=
 =?utf-8?B?Wkd3Q2liTi80ZHdaa0p0Nk10RU9wUG5BZEh3Uk51SGI3amx5KzlqQW9BNFhu?=
 =?utf-8?B?dEZxcjVJTGhSaW0wQno4ZTJKM1Yxd3o4YUk5WjRHaU1IaWlTWlprL2FmVjFp?=
 =?utf-8?B?N1JTTG93VFZSeDdmekRyZmowMVQ3QmRmcVlTd1dXUVdYSW9GRkIxQVgxS1NF?=
 =?utf-8?B?a2FnT2NOSGxRVkhBQndlTGJxeGYxVlBnSEFVNXhWSERkK3Ivd0M2VmJpd296?=
 =?utf-8?B?RlNOOUg2WE9lbDJrUUdEM2dMSzltMUtxc1B5OFdoQk43UjMzVGxJS2FGTGk4?=
 =?utf-8?B?MmRhS21zMUFSbmxaOWVxZkV0NFZlVVBtYjBER2JMRFQzZHpXYVg3eGtMK3NU?=
 =?utf-8?B?U1VDdDRmL284RC9aYUtRY2djblB5Rkg3Nk5zdUJUdUFRN3lTeDcvelhFTmN6?=
 =?utf-8?B?WVVzWWVCMUlqMFVRYXZZaVlYeGNUWS9pVFFrK0NPRzJ3N0xnMnlkZFk0L3li?=
 =?utf-8?B?SXNKTFIzSURSYTI5QzQ4Rmcyakp4bWhYMDdIUGZnRXRhOCtJcGtocHZTNVRz?=
 =?utf-8?B?UlFCQy9JQS9FTUUySkNvNzhLQWhIMUtWeXRyVks1ZlNOV2VydmNwTUhOdXBr?=
 =?utf-8?B?cExPaDYvbnFTdno3cWhNcE9WU0lIcU00NkRpVTlKa0tVN1N4K2NKVFN5MFMy?=
 =?utf-8?B?MzZEVzRHQzh0eEZoUHBwZnVsM1VuYWlMVVV6MmNYakNhM3BaM21mVXZhSjlR?=
 =?utf-8?Q?tF4ss0RLu40+/NCnDSrebBcBV/j/hTpIz7ZNXuk?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7358fc4-7268-4f87-3935-08d98d54ddc5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4664.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 07:49:48.9205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DmzsgCHhjVE7MIxr6zz79HHyzN62vR4pbv2AnqLatPvsLkJgYf6P7PisrrLe/TjWdQkaNGl1/QArew0E/TOt/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4453
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10134
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110120042
X-Proofpoint-GUID: hp5mGxDl6W2zhIqkuXTh2L62RF66prez
X-Proofpoint-ORIG-GUID: hp5mGxDl6W2zhIqkuXTh2L62RF66prez
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, amit@kernel.org, michael.roth@amd.com, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 boris.ostrovsky@oracle.com, kwolf@redhat.com, laurent@vivier.eu,
 mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------B9702BCE0AD61B4B7CEEAFD9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/5/21 5:18 PM, Eric Blake wrote:
> On Tue, Oct 05, 2021 at 12:45:46PM -0400, Jonah Palmer wrote:
>> This patch drops the name parameter for the virtio_init function.
>>
>> The pair between the numeric device ID and the string device ID
>> (name) of a virtio device already exists, but not in a way that
>> let's us map between them.
> s/let's/lets/
>
>> This patch will let us do this and removes the need for the name
>> parameter in virtio_init().
>>
>> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
>> ---
>> +++ b/hw/virtio/virtio.c
>> @@ -133,6 +133,43 @@ struct VirtQueue
>>       QLIST_ENTRY(VirtQueue) node;
>>   };
>>   
>> +const char *virtio_device_names[] = {
>> +    [VIRTIO_ID_NET] = "virtio-net",
>> +    [VIRTIO_ID_BLOCK] = "virtio-blk",
>> +    [VIRTIO_ID_CONSOLE] = "virtio-serial",
>> +    [VIRTIO_ID_RNG] = "virtio-rng",
>> +    [VIRTIO_ID_BALLOON] = "virtio-balloon",
>> +    [VIRTIO_ID_IOMEM] = "virtio-iomem",
>> +    [VIRTIO_ID_RPMSG] = "virtio-rpmsg",
>> +    [VIRTIO_ID_SCSI] = "virtio-scsi",
>> +    [VIRTIO_ID_9P] = "virtio-9p",
>> +    [VIRTIO_ID_MAC80211_WLAN] = "virtio-mac-wlan",
>> +    [VIRTIO_ID_RPROC_SERIAL] = "virtio-rproc-serial",
>> +    [VIRTIO_ID_CAIF] = "virtio-caif",
>> +    [VIRTIO_ID_MEMORY_BALLOON] = "virtio-mem-balloon",
>> +    [VIRTIO_ID_GPU] = "virtio-gpu",
>> +    [VIRTIO_ID_CLOCK] = "virtio-clk",
>> +    [VIRTIO_ID_INPUT] = "virtio-input",
>> +    [VIRTIO_ID_VSOCK] = "vhost-vsock",
>> +    [VIRTIO_ID_CRYPTO] = "virtio-crypto",
>> +    [VIRTIO_ID_SIGNAL_DIST] = "virtio-signal",
>> +    [VIRTIO_ID_PSTORE] = "virtio-pstore",
>> +    [VIRTIO_ID_IOMMU] = "virtio-iommu",
>> +    [VIRTIO_ID_MEM] = "virtio-mem",
>> +    [VIRTIO_ID_SOUND] = "virtio-sound",
>> +    [VIRTIO_ID_FS] = "vhost-user-fs",
>> +    [VIRTIO_ID_PMEM] = "virtio-pmem",
>> +    [VIRTIO_ID_MAC80211_HWSIM] = "virtio-mac-hwsim",
>> +    [VIRTIO_ID_I2C_ADAPTER] = "vhost-user-i2c",
>> +    [VIRTIO_ID_BT] = "virtio-bluetooth"
>> +};
> Are these IDs consecutive, or can the array have gaps?
>
>> +
>> +static const char *virtio_id_to_name(uint16_t device_id)
>> +{
>> +    assert(device_id < G_N_ELEMENTS(virtio_device_names));
>> +    return virtio_device_names[device_id];
> If the latter, you may also want to assert that you aren't returning NULL.

Gotcha, will do!

Jonah

>
>> +++ b/include/standard-headers/linux/virtio_ids.h
>> @@ -55,6 +55,7 @@
>>   #define VIRTIO_ID_FS			26 /* virtio filesystem */
>>   #define VIRTIO_ID_PMEM			27 /* virtio pmem */
>>   #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
>> +#define VIRTIO_ID_I2C_ADAPTER           34 /* virtio I2C adapater */
>>   #define VIRTIO_ID_BT			40 /* virtio bluetooth */
> And it looks like the array has gaps.
>

--------------B9702BCE0AD61B4B7CEEAFD9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/5/21 5:18 PM, Eric Blake wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20211005211424.kxa65zl4r6qoekqd@redhat.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Oct 05, 2021 at 12:45:46PM -0400, Jonah Palmer wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This patch drops the name parameter for the virtio_init function.

The pair between the numeric device ID and the string device ID
(name) of a virtio device already exists, but not in a way that
let's us map between them.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
s/let's/lets/

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
This patch will let us do this and removes the need for the name
parameter in virtio_init().

Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
---
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+++ b/hw/virtio/virtio.c
@@ -133,6 +133,43 @@ struct VirtQueue
     QLIST_ENTRY(VirtQueue) node;
 };
 
+const char *virtio_device_names[] = {
+    [VIRTIO_ID_NET] = &quot;virtio-net&quot;,
+    [VIRTIO_ID_BLOCK] = &quot;virtio-blk&quot;,
+    [VIRTIO_ID_CONSOLE] = &quot;virtio-serial&quot;,
+    [VIRTIO_ID_RNG] = &quot;virtio-rng&quot;,
+    [VIRTIO_ID_BALLOON] = &quot;virtio-balloon&quot;,
+    [VIRTIO_ID_IOMEM] = &quot;virtio-iomem&quot;,
+    [VIRTIO_ID_RPMSG] = &quot;virtio-rpmsg&quot;,
+    [VIRTIO_ID_SCSI] = &quot;virtio-scsi&quot;,
+    [VIRTIO_ID_9P] = &quot;virtio-9p&quot;,
+    [VIRTIO_ID_MAC80211_WLAN] = &quot;virtio-mac-wlan&quot;,
+    [VIRTIO_ID_RPROC_SERIAL] = &quot;virtio-rproc-serial&quot;,
+    [VIRTIO_ID_CAIF] = &quot;virtio-caif&quot;,
+    [VIRTIO_ID_MEMORY_BALLOON] = &quot;virtio-mem-balloon&quot;,
+    [VIRTIO_ID_GPU] = &quot;virtio-gpu&quot;,
+    [VIRTIO_ID_CLOCK] = &quot;virtio-clk&quot;,
+    [VIRTIO_ID_INPUT] = &quot;virtio-input&quot;,
+    [VIRTIO_ID_VSOCK] = &quot;vhost-vsock&quot;,
+    [VIRTIO_ID_CRYPTO] = &quot;virtio-crypto&quot;,
+    [VIRTIO_ID_SIGNAL_DIST] = &quot;virtio-signal&quot;,
+    [VIRTIO_ID_PSTORE] = &quot;virtio-pstore&quot;,
+    [VIRTIO_ID_IOMMU] = &quot;virtio-iommu&quot;,
+    [VIRTIO_ID_MEM] = &quot;virtio-mem&quot;,
+    [VIRTIO_ID_SOUND] = &quot;virtio-sound&quot;,
+    [VIRTIO_ID_FS] = &quot;vhost-user-fs&quot;,
+    [VIRTIO_ID_PMEM] = &quot;virtio-pmem&quot;,
+    [VIRTIO_ID_MAC80211_HWSIM] = &quot;virtio-mac-hwsim&quot;,
+    [VIRTIO_ID_I2C_ADAPTER] = &quot;vhost-user-i2c&quot;,
+    [VIRTIO_ID_BT] = &quot;virtio-bluetooth&quot;
+};
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Are these IDs consecutive, or can the array have gaps?

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+static const char *virtio_id_to_name(uint16_t device_id)
+{
+    assert(device_id &lt; G_N_ELEMENTS(virtio_device_names));
+    return virtio_device_names[device_id];
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
If the latter, you may also want to assert that you aren't returning NULL.</pre>
    </blockquote>
    <pre>Gotcha, will do!

Jonah
</pre>
    <blockquote type="cite" cite="mid:20211005211424.kxa65zl4r6qoekqd@redhat.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+++ b/include/standard-headers/linux/virtio_ids.h
@@ -55,6 +55,7 @@
 #define VIRTIO_ID_FS			26 /* virtio filesystem */
 #define VIRTIO_ID_PMEM			27 /* virtio pmem */
 #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
+#define VIRTIO_ID_I2C_ADAPTER           34 /* virtio I2C adapater */
 #define VIRTIO_ID_BT			40 /* virtio bluetooth */
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
And it looks like the array has gaps.

</pre>
    </blockquote>
  </body>
</html>

--------------B9702BCE0AD61B4B7CEEAFD9--

