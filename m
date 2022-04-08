Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53044F8BCC
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 03:03:55 +0200 (CEST)
Received: from localhost ([::1]:44170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncd2Y-0001qF-JE
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 21:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ncd1G-0000cL-Ji
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 21:02:34 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ncd1C-0002MY-GK
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 21:02:33 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 237KpJ7v000849; 
 Fri, 8 Apr 2022 01:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=gVHEdRHtPfbqSRr/+WIi9Yt/ArvPooRcO4rpEJnKLwg=;
 b=LBSAvhoGGHV/LBAtW7s/bxjaHHap6IzwHVEDTbvSOhb+A6Az2kbZ6xJSeVzKIJOTRo/H
 EP8ejjT2xvQvbW4589eE2106e+/n6ZCfL6XRpUM5qQirvqk2Mr2sSmuO4qW+LHlLDUdx
 F5YJUnfyUgHq9aPFiHLffLwr60YwezI3Sl80ZOay5E7oLKG7r6fn3txcxq/V2Bgl+4Yn
 LGL2GuheIbKWqmjkBif3YGzsZdugPNXvwlj5Ux2qlV9iL+gjaRI0k2c4ATiA9LbGzu2G
 4e99PFJDxrNrkGLC/4pgCGnFMyjPGcSp1aPgJGXXKlT3cqKxADKCk43ncYYVH6EVkn5l cQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6e3swdy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Apr 2022 01:02:21 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 237N7HmK009591; Fri, 8 Apr 2022 01:02:21 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f97wrym7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Apr 2022 01:02:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HsvKDbPEjzA0azWBSm+hSCUSOFvTEFFlOJumBYt8NDadeg6Q28dPWsU8RJbDgeSmsnu/m5GK6XGrI4MnPYr7lAfip3j53SXz+KnvmMG/BM57rDq+/3WUijKf2Z3grIDS1dzyFfjxJxL97dRynuOE+TQKjUqXH5rQe+atdKPnSm1R3GBTRd0W6ZOO0PwTZV5hvOGqHqcXoF0rKL+7j19pTpZRkdIGvfEDL5pTCmSg+yryrvU4a1GfchFwAO5HtuI9DRi50E2amod5beoJxBuRRcWcmTZQCRBDKr8eyBK+sYvVRP74V/zBmjfa6PIwo0Q5X/YuERPuhipkuRA5ezYiIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVHEdRHtPfbqSRr/+WIi9Yt/ArvPooRcO4rpEJnKLwg=;
 b=ds0W0YtNm2iccdogfW6t4HN7Evmu2fUpSiVVeqkfqvN4aPg6MSmsf3/zXP/QC8wnSb6CQQsAs655/3RVMGQEDVAKqe3lRuYiBKwvM3jG8qA3eyLBsp0Y3s9kmiWM1eIiV6+I3YHIejJNZjIYpumdco5ud8WD4BnFtvbW5AGED2d6KFyoHtnveRcRVR6wseJCSwcCAkgWol/FfboNB6lPe2cWYS2HpDIkhs1CJhJGbU+7ivaFjNQRGJ5iwyN2f/1rtBLvC1mzJ4riQumaD8R3woZaUdHkvK4+8KGo3l0i3Zj/VO59OZBB+P47uskxuW9lG7YNLD9F9LT9dB9I6NAL+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVHEdRHtPfbqSRr/+WIi9Yt/ArvPooRcO4rpEJnKLwg=;
 b=Q2Auvf/PXLV0UfU01D4PDutAPgOIn5Uo8TS1OhZKMsw4r8cmJb4S2oNIdlAW4flEROvLvOeGy7A6G2TPmbyCgnEyA/FzAzZAdbt+7OTshY5/XdKb2k53mZ68Wkri0tvVdCB0fOkSMeP/C/RMY4WwZxfr+t6N7ebwNOR7W9GhvDA=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by MN2PR10MB4061.namprd10.prod.outlook.com (2603:10b6:208:182::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Fri, 8 Apr
 2022 01:02:18 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::fcff:70e5:ceb0:4947]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::fcff:70e5:ceb0:4947%7]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 01:02:18 +0000
Message-ID: <4ee63dfb-d023-ad31-fff8-169e0cbc9d51@oracle.com>
Date: Thu, 7 Apr 2022 18:02:13 -0700
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
 <8f8ea4e4-2398-6d94-88fe-93b2c0f6f9ca@oracle.com>
 <393aebd3-34d3-b196-43fd-47fbd1901a5d@redhat.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <393aebd3-34d3-b196-43fd-47fbd1901a5d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0081.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::22) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bef8f23f-2096-48e2-0bf6-08da18fb6d87
X-MS-TrafficTypeDiagnostic: MN2PR10MB4061:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB40610B6C6D70804564618B03B1E99@MN2PR10MB4061.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JOLewIUw3NzijZes3LdFuH4tflI1Zwx4sq3RLsdV71GVP2R6ZzO4uhAnCQfMFzzWIBdo5zHdU3sy5nPzf/CEmcRUphFDlXsQQORso1Q6kNw3/s9jYsmfPSUD0KROS3tG99fpAYlE+PlFdGqpjIQn03X8sYJ/6c2yxaVwwSVpKx6mbLcxQYkenTt6wavnSv4/QlSAwFFpRTaoi6jgAgd14/pydJ5JibVH9oO+7JuhZ88gbKMPEnqFhGJtVC2ezMWmxWmXRr0LlEt0J4co7OlzJVxpNz0vk0sMZPP3cCx8HlEH7z7+vaqkou4CNH3Y+MCAQBPY69jRlDQqzUcNN9RGSdgMPp25Qn9DomWhlK8nCWyM1yknL2Ex51DVx1w11v5SyTIIdmq/5CaNATVOd+Hk1rn88tPOwGO76TdMKMZlTqSshvmST0fWvmSkGzUtMzIRmLiCtuc4l74D3DbbuTyyxD+WCsYoDrMSEnBUjd2Kj3kJypXLmo+0Dj4FkcvtWXtKfD4B3Pk5w6Lxha0+AvRr+GeVRBEzlNPRnRJWayiljHafbqIdF8BREopCl9c24kcgN93kalZVDkzql1whuY8mQJAnfW7VQqQ3GTBUZ7M04fCUnDWc/Or24+zxRvMM88F6Qdg7OdadLUfSG/vl6CBiqYKTCtPWJJk3pzMNYMcQc23j3dnIHgJmRWjP4AlXd4P0LOR+NQyZCsQ2LuoKxyhIL8dBGeucCcFnypwhCvaz7cs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(30864003)(186003)(26005)(83380400001)(5660300002)(8936002)(38100700002)(2906002)(31686004)(36756003)(2616005)(66946007)(316002)(6666004)(6506007)(36916002)(53546011)(6512007)(86362001)(66476007)(8676002)(66556008)(4326008)(6486002)(54906003)(508600001)(6916009)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDhkbWNhK3ZPaTlqK2lsN3VoMTFBTWpENFd6cjJ3QzZZQ2VGOE1iOFZ4QWZT?=
 =?utf-8?B?cHZrUncrMFBRYStoOFRMQjJXcjE3c1IzWWxOM2Q2dEY4TW0vRnRIckNJa1lR?=
 =?utf-8?B?VVJLMTBiMjlIVmo2clhQUk9oUjNzQ2JtZXRWTDBqZzExaURsdmlNOWk1SUE4?=
 =?utf-8?B?dDR0c0dzZXFPWHNnd3BTaERaUVR5TkVGR2pKUGl1dnkzcERJSHkwMy84bnQ1?=
 =?utf-8?B?aVBGOGRkRGRMTmJoVEIwU2FuT3crSXNHZ2gyTndiYTkxVUlNc2JIYTh6RTVD?=
 =?utf-8?B?T25QVVluRTd2OUcrbmZuSXFnYkt2TlZ1WEt4SUZobWxLRUJnMkZ4R290aGEy?=
 =?utf-8?B?UUZpc0UyeFZhdi9BQUlna0RKbko3a2M3UVJJeVpnWXFpWHhWRndJTTVEWXpn?=
 =?utf-8?B?MWJKejU5Si9SYm0rb3k0cHJudndmY2ZjbEVUU3JKSjJCRjZsSWhlU3NDYU94?=
 =?utf-8?B?QzNKeWlBSVNGY0RnL2c0eTRjRUxuaE5YMVpyM1pLOHZXcTByVUxrUTdyVUYz?=
 =?utf-8?B?ODVLNXYzcXEzOHUycXREQkVsNElYV1FET01RbHlVWXRPcU83QXNWTjlLYlR6?=
 =?utf-8?B?WllOeWd6c21hdGw5VnhxREFuNHcvektqMVh2RzZ2eGg1bkFrVDROYktoZ3Ny?=
 =?utf-8?B?cUxwbUsrMnlyMWNES1Vnc1IxK3k3bksrckJQa01ydmhiR1JRS25aOXBmcEtr?=
 =?utf-8?B?VjdpMllOQTdMRU0vS2gxamJyZDl0b1RjUjdKY0JyZndFTWtPenI3SW9MYXVU?=
 =?utf-8?B?Y2ZLdVZjRXZ6ZHRlclJNeFk1MWloeFlqbVVTbTlHQ3V3bE5TMy9RWHI1enJ0?=
 =?utf-8?B?ZzZ2VENtSk0zZnYra2g4Mm9ZTy93V2U2cVhVVmFCTm5Fc05qSWZGRkU1WEJQ?=
 =?utf-8?B?Z1R5MjdabkVsd2thazRVemplZHNDb3dLSmtDT1YxS0NhTHhqQVlEaVd4ZzlL?=
 =?utf-8?B?VE5JWjAxSS9CcFJQejlqTCszaXFONkVpUXI3YVY1Z2QzampHUGl1cnBud3Fh?=
 =?utf-8?B?WlRDdDBYNGV0S2dSYmRjNjR4cThwT2JKMm5iWmIwS2lVMVlLdnE3Q2c1L3Za?=
 =?utf-8?B?a2ErSkxwTFl3MktmdHVaMDVzSm5kY1h2RmpzM2JKeFcyM2xaUzNpc0c5aUNM?=
 =?utf-8?B?WWM0ckExVTBIOEtzb2Noc2xNaUlRbXNUV3RoOE1sRVNhZXNtd3IyelhIODRj?=
 =?utf-8?B?OTlSbDNNL1l4MUpuZ0ZUaFM5aElhUmh4c0ZlRFJjdVdXb2ZxQ2RqMFcxY09j?=
 =?utf-8?B?bkhGUzNJUkp1cEZFcEFvbUlzNks1OTAwUmptcVYwbnlDWjZlZCtUSmtTSGM0?=
 =?utf-8?B?bXdDUk1FV2ZVWktSZStJSU5rSVhOZDJOalVWelZ0czc5YVk1L3EyZzBOYlZM?=
 =?utf-8?B?RlkzampMeHhFUEFhK1ZBRFlyRU5RZGhrRzR5QXVxcXM5UlZ6Z3IwY2VnWHNr?=
 =?utf-8?B?c2FnbnNGeUgzMzhXamRtRTJmcTVGRE5QYjZyTFladE8va0ZCeXcrcjRZdnVy?=
 =?utf-8?B?cEFUblNCdWsrQlhGTzhoWTNBQmR0VzAzZ1ZucExjY0NoUXg4dnpsWHpKWlV1?=
 =?utf-8?B?NmtIYjdtbWd6aFl5TVJpaDI5SUQ4Y1VTZGU2dWh1QmJZTkh5d3J0Vk8xS0M0?=
 =?utf-8?B?cGJxcVBOcVAyT1AzRzZWeXEvamFvbUZLeGxLdDJaWDRTQzB3ODFwMktwK25p?=
 =?utf-8?B?d3RHOUlPMTVHemo4WnJNYTN1OThpcXBJRzNGUnc1alRwcGVDenl3enBESWt1?=
 =?utf-8?B?ckxGQ1c5d3EzNk02bzA0dmMzZkhvM1ZNN1FISHhwMzZoMUN2NEdCRnZQZWNE?=
 =?utf-8?B?bnFyL010WDBLcWtJZnR5YjFwUUsxNlVUMHl0cnFjVUM4ZS9OVnNYbE8vRzFR?=
 =?utf-8?B?UmtsVEVoVkR3cmU3S3VNQmg3N2VLNDFQYTBRV0RORFhKOWh3Q1dvQnNqRjc3?=
 =?utf-8?B?UFdEM211RzRSL3ZFdnJPK3dtNmlzb3NWT3JTZno5djNBSU9TQlZqd0txZEtz?=
 =?utf-8?B?eGdpV2ZJNVRkTGUvNUh3UG80NXdEMm5LV3RsRExQcitHQkVmdmFXTnkzd0N0?=
 =?utf-8?B?V1hzMlhWOENNa3M1akxuRDExUnVEMGlNTnpYb0x1bkJTZFV4Z3pjNkQ5UEpS?=
 =?utf-8?B?ZWhVRC9HaFFVaUxsMXUzVnAxNmpHT09BU2Q3MTBoWmpsZUROTWlkTXpmTUxp?=
 =?utf-8?B?VkExaHQ4TzhzM3ZydnpKK2c0T0MzeHBGZkxCRHFYOERXUVVYbUdLdUpJM09U?=
 =?utf-8?B?dEJlOEEwdlM2NHBjRWFCV3FJZzI4a2d5aldNZVZ4T0ZkVlpBclp0Qk13N2pX?=
 =?utf-8?B?TUIzbWtzWWFDZ0NkQTFrNnFreW9FRkNXSjJmZ1BQZGxmT3BOSGk2Zz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bef8f23f-2096-48e2-0bf6-08da18fb6d87
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 01:02:18.2896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CAY+sMm1n4CeGyZU2vUUCdAGItuxAzfPS3Rsp2EPPX/BjIVkU33cHdPl9UIZqyw1ngxhI2QmW3tit/Qc4fJhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4061
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-07_01:2022-04-07,
 2022-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204070064
X-Proofpoint-ORIG-GUID: FdoFZs9CzTZhTOksdA-ullS0eYZYKcXR
X-Proofpoint-GUID: FdoFZs9CzTZhTOksdA-ullS0eYZYKcXR
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
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



On 4/7/2022 12:05 AM, Jason Wang wrote:
>
> 在 2022/4/6 上午3:18, Si-Wei Liu 写道:
>>
>>
>> On 4/1/2022 7:00 PM, Jason Wang wrote:
>>> On Sat, Apr 2, 2022 at 4:37 AM Si-Wei Liu <si-wei.liu@oracle.com> 
>>> wrote:
>>>>
>>>>
>>>> On 3/31/2022 1:36 AM, Jason Wang wrote:
>>>>> On Thu, Mar 31, 2022 at 12:41 AM Si-Wei Liu 
>>>>> <si-wei.liu@oracle.com> wrote:
>>>>>>
>>>>>> On 3/30/2022 2:14 AM, Jason Wang wrote:
>>>>>>> On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu 
>>>>>>> <si-wei.liu@oracle.com> wrote:
>>>>>>>> Previous commit prevents vhost-user and vhost-vdpa from using
>>>>>>>> userland vq handler via disable_ioeventfd_handler. The same
>>>>>>>> needs to be done for host notifier cleanup too, as the
>>>>>>>> virtio_queue_host_notifier_read handler still tends to read
>>>>>>>> pending event left behind on ioeventfd and attempts to handle
>>>>>>>> outstanding kicks from QEMU userland vq.
>>>>>>>>
>>>>>>>> If vq handler is not disabled on cleanup, it may lead to sigsegv
>>>>>>>> with recursive virtio_net_set_status call on the control vq:
>>>>>>>>
>>>>>>>> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
>>>>>>>> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
>>>>>>>> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
>>>>>>>> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
>>>>>>>> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index 
>>>>>>>> (dev=<optimized out>, idx=<optimized out>) at 
>>>>>>>> ../hw/virtio/vhost-vdpa.c:563
>>>>>>>> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index 
>>>>>>>> (dev=<optimized out>, idx=<optimized out>) at 
>>>>>>>> ../hw/virtio/vhost-vdpa.c:558
>>>>>>>> 6  0x0000558f52d7329a in vhost_virtqueue_mask 
>>>>>>>> (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized 
>>>>>>>> out>) at ../hw/virtio/vhost.c:1557
>>>>>>> I feel it's probably a bug elsewhere e.g when we fail to start
>>>>>>> vhost-vDPA, it's the charge of the Qemu to poll host notifier 
>>>>>>> and we
>>>>>>> will fallback to the userspace vq handler.
>>>>>> Apologies, an incorrect stack trace was pasted which actually 
>>>>>> came from
>>>>>> patch #1. I will post a v2 with the corresponding one as below:
>>>>>>
>>>>>> 0  0x000055f800df1780 in qdev_get_parent_bus (dev=0x0) at
>>>>>> ../hw/core/qdev.c:376
>>>>>> 1  0x000055f800c68ad8 in virtio_bus_device_iommu_enabled
>>>>>> (vdev=vdev@entry=0x0) at ../hw/virtio/virtio-bus.c:331
>>>>>> 2  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>) at
>>>>>> ../hw/virtio/vhost.c:318
>>>>>> 3  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>,
>>>>>> buffer=0x7fc19bec5240, len=2052, is_write=1, access_len=2052) at
>>>>>> ../hw/virtio/vhost.c:336
>>>>>> 4  0x000055f800d71867 in vhost_virtqueue_stop
>>>>>> (dev=dev@entry=0x55f8037ccc30, vdev=vdev@entry=0x55f8044ec590,
>>>>>> vq=0x55f8037cceb0, idx=0) at ../hw/virtio/vhost.c:1241
>>>>>> 5  0x000055f800d7406c in vhost_dev_stop 
>>>>>> (hdev=hdev@entry=0x55f8037ccc30,
>>>>>> vdev=vdev@entry=0x55f8044ec590) at ../hw/virtio/vhost.c:1839
>>>>>> 6  0x000055f800bf00a7 in vhost_net_stop_one (net=0x55f8037ccc30,
>>>>>> dev=0x55f8044ec590) at ../hw/net/vhost_net.c:315
>>>>>> 7  0x000055f800bf0678 in vhost_net_stop 
>>>>>> (dev=dev@entry=0x55f8044ec590,
>>>>>> ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7,
>>>>>> cvq=cvq@entry=1)
>>>>>>       at ../hw/net/vhost_net.c:423
>>>>>> 8  0x000055f800d4e628 in virtio_net_set_status (status=<optimized 
>>>>>> out>,
>>>>>> n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
>>>>>> 9  0x000055f800d4e628 in virtio_net_set_status
>>>>>> (vdev=vdev@entry=0x55f8044ec590, status=15 '\017') at
>>>>>> ../hw/net/virtio-net.c:370
>>>>> I don't understand why virtio_net_handle_ctrl() call 
>>>>> virtio_net_set_stauts()...
>>>> The pending request left over on the ctrl vq was a VIRTIO_NET_CTRL_MQ
>>>> command, i.e. in virtio_net_handle_mq():
>>> Completely forget that the code was actually written by me :\
>>>
>>>> 1413     n->curr_queue_pairs = queue_pairs;
>>>> 1414     /* stop the backend before changing the number of queue_pairs
>>>> to avoid handling a
>>>> 1415      * disabled queue */
>>>> 1416     virtio_net_set_status(vdev, vdev->status);
>>>> 1417     virtio_net_set_queue_pairs(n);
>>>>
>>>> Noted before the vdpa multiqueue support, there was never a vhost_dev
>>>> for ctrl_vq exposed, i.e. there's no host notifier set up for the
>>>> ctrl_vq on vhost_kernel as it is emulated in QEMU software.
>>>>
>>>>>> 10 0x000055f800d534d8 in virtio_net_handle_ctrl (iov_cnt=<optimized
>>>>>> out>, iov=<optimized out>, cmd=0 '\000', n=0x55f8044ec590) at
>>>>>> ../hw/net/virtio-net.c:1408
>>>>>> 11 0x000055f800d534d8 in virtio_net_handle_ctrl 
>>>>>> (vdev=0x55f8044ec590,
>>>>>> vq=0x7fc1a7e888d0) at ../hw/net/virtio-net.c:1452
>>>>>> 12 0x000055f800d69f37 in virtio_queue_host_notifier_read
>>>>>> (vq=0x7fc1a7e888d0) at ../hw/virtio/virtio.c:2331
>>>>>> 13 0x000055f800d69f37 in virtio_queue_host_notifier_read
>>>>>> (n=n@entry=0x7fc1a7e8894c) at ../hw/virtio/virtio.c:3575
>>>>>> 14 0x000055f800c688e6 in virtio_bus_cleanup_host_notifier
>>>>>> (bus=<optimized out>, n=n@entry=14) at ../hw/virtio/virtio-bus.c:312
>>>>>> 15 0x000055f800d73106 in vhost_dev_disable_notifiers
>>>>>> (hdev=hdev@entry=0x55f8035b51b0, vdev=vdev@entry=0x55f8044ec590)
>>>>>>       at ../../../include/hw/virtio/virtio-bus.h:35
>>>>>> 16 0x000055f800bf00b2 in vhost_net_stop_one (net=0x55f8035b51b0,
>>>>>> dev=0x55f8044ec590) at ../hw/net/vhost_net.c:316
>>>>>> 17 0x000055f800bf0678 in vhost_net_stop 
>>>>>> (dev=dev@entry=0x55f8044ec590,
>>>>>> ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7,
>>>>>> cvq=cvq@entry=1)
>>>>>>       at ../hw/net/vhost_net.c:423
>>>>>> 18 0x000055f800d4e628 in virtio_net_set_status (status=<optimized 
>>>>>> out>,
>>>>>> n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
>>>>>> 19 0x000055f800d4e628 in virtio_net_set_status (vdev=0x55f8044ec590,
>>>>>> status=15 '\017') at ../hw/net/virtio-net.c:370
>>>>>> 20 0x000055f800d6c4b2 in virtio_set_status (vdev=0x55f8044ec590,
>>>>>> val=<optimized out>) at ../hw/virtio/virtio.c:1945
>>>>>> 21 0x000055f800d11d9d in vm_state_notify 
>>>>>> (running=running@entry=false,
>>>>>> state=state@entry=RUN_STATE_SHUTDOWN) at ../softmmu/runstate.c:333
>>>>>> 22 0x000055f800d04e7a in do_vm_stop
>>>>>> (state=state@entry=RUN_STATE_SHUTDOWN, 
>>>>>> send_stop=send_stop@entry=false)
>>>>>> at ../softmmu/cpus.c:262
>>>>>> 23 0x000055f800d04e99 in vm_shutdown () at ../softmmu/cpus.c:280
>>>>>> 24 0x000055f800d126af in qemu_cleanup () at 
>>>>>> ../softmmu/runstate.c:812
>>>>>> 25 0x000055f800ad5b13 in main (argc=<optimized out>, argv=<optimized
>>>>>> out>, envp=<optimized out>) at ../softmmu/main.c:51
>>>>>>
>>>>>>    From the trace pending read only occurs in stop path. The 
>>>>>> recursive
>>>>>> virtio_net_set_status from virtio_net_handle_ctrl doesn't make 
>>>>>> sense to me.
>>>>> Yes, we need to figure this out to know the root cause.
>>>> I think it has something to do with the virtqueue unready issue 
>>>> that the
>>>> vhost_reset_device() refactoring series attempt to fix. If that is 
>>>> fixed
>>>> we should not see this sigsegv with mlx5_vdpa. However I guess we both
>>>> agreed that the vq_unready support would need new uAPI (some flag) to
>>>> define, hence this fix applies to the situation where uAPI doesn't 
>>>> exist
>>>> on the kernel or the vq_unready is not supported by vdpa vendor 
>>>> driver.
>>>>
>>> Yes.
>>>
>>>>> The code should work for the case when vhost-vdp fails to start.
>>>> Unlike the other datapath queues for net vdpa, the events left 
>>>> behind in
>>>> the control queue can't be processed by the userspace, as unlike
>>>> vhost-kernel we don't have a fallback path in the userspace.
>>> So that's the question, we should have a safe fallback.
>>>
>>>> To ignore
>>>> the pending event and let vhost vdpa process it on resume/start is
>>>> perhaps the best thing to do. This is even true for datapath queues 
>>>> for
>>>> other vdpa devices than of network.
>>>>
>>>>>> Not sure I got the reason why we need to handle pending host
>>>>>> notification in userland vq, can you elaborate?
>>>>> Because vhost-vDPA fails to start, we will "fallback" to a dummy 
>>>>> userspace.
>>>> Is the dummy userspace working or operational? What's the use case of
>>>> this "fallback" dummy if what guest user can get is a busted NIC?
>>> The problem is we can't do better in this case now. Such fallack (e.g
>>> for vhost-user) has been used for years. Or do you have any better
>>> ideas?
>> In my opinion if vhost-vdpa or vhost-user fails to start, maybe we 
>> should try to disable the device via virtio_error(), which would set 
>> broken to true and set NEEDS_RESET in case of VERSION_1. That way the 
>> device won't move forward further and the guest may get the 
>> indication via config interrupt that something had gone wrong 
>> underneath. If device reset is well supported there the guest driver 
>> would retry.
>
>
> Note that the NEEDS_RESET is not implemented in the current Linux 
> drivers.
Yes, I am aware of that. I think the point to set NEEDS_RESET is to stop 
the device from moving forward, as when it comes to start failure, the 
vhost backend is already bogged down or in a bogus state unable to move 
further. And it's the standardized way to explicitly inform guest of 
failure on the device side, although the corresponding NEEDS_RESET 
handling hadn't been implemented in any Linux driver yet. Of coz 
alternatively, guest can figure it out itself implicitly via watchdog 
timer, as you indicated below.

>
>
>> This can at least give the backend some chance to recover if running 
>> into intermittent error. The worst result would be the device keeps 
>> resetting repeatedly, for which we may introduce tunable to control 
>> the rate if seeing reset occurs too often.. Did this ever get 
>> considered before?
>
>
> I don't know, but we manage to survive with such fallback for years. 
I wonder how vhost-user client may restart in this case i.e. when 
running into transient backend failure. Haven't yet checked the code, do 
you mean there's never error recovery (or error detection at least) 
implemented in the vhost-user client for e.g. DPDK? Or it just tries to 
reconnect if the socket connection gets closed, but never cares about 
any vhost-user backend start failure?

> We can do this, but can virtio_error() fix the issue you describe here?
It doesn't fix the sigsegv issue for certain. Actually the issue I ran 
into has little to do with error handling, but thinking with the 
assumption of virtio_error() in the start error path we can just live 
without falling back to the dummy userspace or handling any request (as 
all vqs are effectively stopped/disabled). Which is exactly consistent 
with the handling in the stop (success) path: ignore pending event on 
the host notifier. In other word, it doesn't necessarily have to assume 
the existence of dummy userspace fallback, which IMHO does nothing more 
compared to marking NEEDS_RESET with virtio_error(). While on the 
contrary, if there's ever a good use case for the dummy userspace (which 
I might not be aware), I thought the fallback to userspace emulation 
would be even needed for the stop path. But I doubted the need for 
adding such complex code without seeing a convincing case.

>
>
>>
>> Noted that the dummy userspace can't handle any control vq command 
>> effectively once the vhost backend fails, for e.g. how does it handle 
>> those guest offload, rx mode, MAC or VLAN filter changes without 
>> sending the request down to the backend? 
>
>
> It should be no difference compared to the real hardware. The device 
> is just malfunction. The driver can detect this in many ways. E.g in 
> the past I suggest to implement the device watchdog for virtio-net, 
> the prototype is posted but for some reason it was stalled. Maybe we 
> can consider to continue the work.
Would you mind pointing me to the thread? What was the blocker then?

I feel it might be nice to consider NEEDS_RESET handling for guest 
drivers as it is more relevant here.

>
>
>> This could easily get inconsistent state to the guest if somehow we 
>> are able to resume the virtqueue without a reset. Even so, I suspect 
>> the device reset eventually is still needed on the other part, which 
>> is subject to the specific failure. It looks to me at least for 
>> vhost-vdpa, it might be the safest fallback so far to ignore pending 
>> event in ctrl_vq, and disable the device from moving forward in case 
>> of backend start failure.
>
>
> I don't get here, if we fail to start vhost-vdpa, the Qemu should do a 
> safe rewind otherwise it would be a bug.
In the ideal world, yes QEMU should back off to where it was. However, I 
worried that not all of the operations has a corresponding undo op 
symmetrically, for e.g. there's no unready op for vq_ready(), 
reset_owner() contains device reset internally to undo what set_owner() 
effects. It would be easier to just reset as a safe fallback in this case.

>
>
>>
>>>
>>> It doesn't differ too much of the two approaches:
>>>
>>> 1) dummy fallback which can do even cvq
>>>
>>> and
>>>
>>> 2) disable host notifiers
>>>
>>> Especially consider 2) requires more changes.
>> I'm not clear if 2) really needs more changes, as it seems to me that 
>> it would take more unwarranted changes to make dummy fallback to work 
>> on cvq? And suppose we can fallback to disabling device via 
>> virtio_error(), we don't even need to change any code on cvq?
>
>
> So let me explain my points:
>
> 1) we use dummy receive as a fallback as vhost-user
>
> 2) the code should safely fallback to that otherwise it could be a bug 
> elsewhere
>
> 3) if we think the dummy fallback doesn't make sense, we can improve, 
> but we need to figure out why we can crash for 2) since the code could 
> be used in other path.
I think we may either ignore pending request left behind on the vhost 
host notifier or even flush the queue in the stop path, since when 
reaching to this point all of the data vqs have been effectively stopped 
via vhost_dev_stop() and vhost_dev_disable_notifiers(). It looks that's 
what the dummy fallback did on the data vqs, too? i.e. receive_disabled 
is set until queues for the dummy backend are eventually flushed when 
device is fully stopped.

What "could be used in other path" is the key question to answer in my 
opinion. Without knowing the (potential) use cases, it'd be hard to 
imagine what level of emulation needs to be done. I hope we don't have 
to involve complex code change to emulate changing the no. of queues 
when it's known all the heavy lifting done earlier will be effectively 
destroyed with a follow-up reset in the stop path.

As said, I'm fine with not touching the dummy fallback part, but at 
least we should figure out a simple way to fix the vhost-vdpa control vq 
issue.

>
>
>>
>> On the other hand, for the specific code path this patch tries to 
>> fix, it is not due to failure to start vhost-vdpa backend, but more 
>> of a control flow flaw in the stop path due to lack of VQ stop uAPI. 
>> Let alone dummy or host notifier, considering currently it's in the 
>> stop path followed by a reset, I feel it should be pretty safe to 
>> just ignore the pending event on the control vq rather than process 
>> it prematurely in userspace. What do you think? I can leave without 
>> the host notifier handler change for sure.
>
>
> I wonder how vhost-user deal with this.
vhost-user doesn't expose host notifier for control vq. This path is not 
even involved. All requests on the control vq are handled by the 
emulated virtio_net_handle_ctrl handler in the QEMU process.

>
>
>>
>>>
>>>> I
>>>> think this is very different from the vhost-kernel case in that once
>>>> vhost fails, we can fallback to userspace to emulate the network 
>>>> through
>>>> the tap fd in a good way. However, there's no equivalent yet for
>>>> vhost-vdpa...
>>>>
>>> As said previously, technically we can have vhost-vDPA network backend
>>> as a fallback.
>> But this is working as yet. And how do you envision the datapath may 
>> work given that we don't have a fallback tap fd?
>
>
> I mean we can treat vhost-vdpa as a kind of general networking backend 
> that could be used by all NIC model like e1000e. Then we can use that 
> as a fallback.
>
> But I'm not sure it's worth to bother.
Well, perhaps that's another story. I think to support that it would 
need more code refactoring than just the ioeventfd handler change alone...

Thanks,
-Siwei

>
> Thanks
>
>
>>
>> -Siwei
>>
>>
>>>   (So did for vhost-user).
>>>
>>> Thanks
>>>
>>>> Thanks,
>>>> -Siwei
>>>>
>>>>> Thanks
>>>>>
>>>>>> Thanks,
>>>>>> -Siwei
>>>>>>
>>>>>>> Thanks
>>>>>>>
>>>>>>>> 7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier 
>>>>>>>> (d=d@entry=0x558f568f0f60, n=n@entry=2, 
>>>>>>>> assign=assign@entry=true, with_irqfd=with_irqfd@entry=false)
>>>>>>>>       at ../hw/virtio/virtio-pci.c:974
>>>>>>>> 8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers 
>>>>>>>> (d=0x558f568f0f60, nvqs=3, assign=true) at 
>>>>>>>> ../hw/virtio/virtio-pci.c:1019
>>>>>>>> 9  0x0000558f52bf091d in vhost_net_start 
>>>>>>>> (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, 
>>>>>>>> data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
>>>>>>>>       at ../hw/net/vhost_net.c:361
>>>>>>>> 10 0x0000558f52d4e5e7 in virtio_net_set_status 
>>>>>>>> (status=<optimized out>, n=0x558f568f91f0) at 
>>>>>>>> ../hw/net/virtio-net.c:289
>>>>>>>> 11 0x0000558f52d4e5e7 in virtio_net_set_status 
>>>>>>>> (vdev=0x558f568f91f0, status=15 '\017') at 
>>>>>>>> ../hw/net/virtio-net.c:370
>>>>>>>> 12 0x0000558f52d6c4b2 in virtio_set_status 
>>>>>>>> (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at 
>>>>>>>> ../hw/virtio/virtio.c:1945
>>>>>>>> 13 0x0000558f52c69eff in virtio_pci_common_write 
>>>>>>>> (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized 
>>>>>>>> out>, size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
>>>>>>>> 14 0x0000558f52d15d6e in memory_region_write_accessor 
>>>>>>>> (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, 
>>>>>>>> shift=<optimized out>, mask=<optimized out>, attrs=...)
>>>>>>>>       at ../softmmu/memory.c:492
>>>>>>>> 15 0x0000558f52d127de in access_with_adjusted_size 
>>>>>>>> (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, 
>>>>>>>> size=size@entry=1, access_size_min=<optimized out>, 
>>>>>>>> access_size_max=<optimized out>, access_fn=0x558f52d15cf0 
>>>>>>>> <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) 
>>>>>>>> at ../softmmu/memory.c:554
>>>>>>>> 16 0x0000558f52d157ef in memory_region_dispatch_write 
>>>>>>>> (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, 
>>>>>>>> op=<optimized out>, attrs=attrs@entry=...)
>>>>>>>>       at ../softmmu/memory.c:1504
>>>>>>>> 17 0x0000558f52d078e7 in flatview_write_continue 
>>>>>>>> (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, 
>>>>>>>> attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, 
>>>>>>>> addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at 
>>>>>>>> ../../../include/qemu/host-utils.h:165
>>>>>>>> 18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, 
>>>>>>>> addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at 
>>>>>>>> ../softmmu/physmem.c:2822
>>>>>>>> 19 0x0000558f52d0b36b in address_space_write (as=<optimized 
>>>>>>>> out>, addr=<optimized out>, attrs=..., 
>>>>>>>> buf=buf@entry=0x7f8ce6300028, len=<optimized out>)
>>>>>>>>       at ../softmmu/physmem.c:2914
>>>>>>>> 20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, 
>>>>>>>> addr=<optimized out>, attrs=...,
>>>>>>>>       attrs@entry=..., buf=buf@entry=0x7f8ce6300028, 
>>>>>>>> len=<optimized out>, is_write=<optimized out>) at 
>>>>>>>> ../softmmu/physmem.c:2924
>>>>>>>> 21 0x0000558f52dced09 in kvm_cpu_exec 
>>>>>>>> (cpu=cpu@entry=0x558f55c2da60) at ../accel/kvm/kvm-all.c:2903
>>>>>>>> 22 0x0000558f52dcfabd in kvm_vcpu_thread_fn 
>>>>>>>> (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
>>>>>>>> 23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized 
>>>>>>>> out>) at ../util/qemu-thread-posix.c:556
>>>>>>>> 24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
>>>>>>>> 25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6
>>>>>>>>
>>>>>>>> Fixes: 4023784 ("vhost-vdpa: multiqueue support")
>>>>>>>> Cc: Jason Wang <jasowang@redhat.com>
>>>>>>>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>>>>>>>> ---
>>>>>>>>     hw/virtio/virtio-bus.c | 3 ++-
>>>>>>>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
>>>>>>>> index 0f69d1c..3159b58 100644
>>>>>>>> --- a/hw/virtio/virtio-bus.c
>>>>>>>> +++ b/hw/virtio/virtio-bus.c
>>>>>>>> @@ -311,7 +311,8 @@ void 
>>>>>>>> virtio_bus_cleanup_host_notifier(VirtioBusState *bus, int n)
>>>>>>>>         /* Test and clear notifier after disabling event,
>>>>>>>>          * in case poll callback didn't have time to run.
>>>>>>>>          */
>>>>>>>> -    virtio_queue_host_notifier_read(notifier);
>>>>>>>> +    if (!vdev->disable_ioeventfd_handler)
>>>>>>>> +        virtio_queue_host_notifier_read(notifier);
>>>>>>>>         event_notifier_cleanup(notifier);
>>>>>>>>     }
>>>>>>>>
>>>>>>>> -- 
>>>>>>>> 1.8.3.1
>>>>>>>>
>>
>


