Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37C8511431
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 11:13:40 +0200 (CEST)
Received: from localhost ([::1]:53330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njdjw-0005dH-3h
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 05:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1njdfy-0002th-Vr
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 05:09:35 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:4176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1njdfv-0003Np-4G
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 05:09:33 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23R8kK71015405;
 Wed, 27 Apr 2022 09:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=dkG2Q/uyKVjvtPsml4XDiXzJCFNbyNsWHqUx0axR2Kc=;
 b=AOulfHAOPXw02+Q+kw/kC1qksxcgv3qa2K9O6QI/mELGtHMLqAXmjne6rwEPsPJwzOYr
 K9xTAwOA/NYdYha7W61ysW7SMG8mj4l+vn0O5xLAL4UxVt86WNw/pBDpHEK6mjJ6ul+m
 B/1hekSHVuIYnhZRScEg3ARIMmUSGlcREDOiXaFX8Pg76IZNfW4VjjV9Ce/SFWxBT2Ee
 AdgoExe5h7Qqk5yQe/5fxFY98FeR4iOl9mUEehqdqt8VRJwufFOoto7PlZ7+8bR/pSii
 Jh4PlUbtu/xPfIysGRNPUAqjWiWfJNnouekMVvH2t7PZgOfhZ3WczDjI9r133fvi+x1S CA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb9ardu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 09:09:26 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23R96YXu029785; Wed, 27 Apr 2022 09:09:25 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fp5ykgh2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Apr 2022 09:09:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hVpeMeXDatUFmo/8Uo1utiJtB7cfI7dsLHj/64GK/oaB6u31up7wlkQvulhipXyCFsimaaSAC4kbLIaJwWBGYVcs5UzmX9RSJJGLm7k9w27Q4OMSSslq5DvjMNITQqod7AQ+tVpRtm4jsvaItoq6T8YVWJFSLilFl6SoY5KOgkyiKpFd0jX1iX5gmnwfkevNBjj728qWo5ToBEtqwW+IdwhWUhEOlULnkcRGWu2uTvGVyVorBr0v38GFUu0TOb0OwBvj7RvrcKGX5c203GaM9zqL3RHEqLwnhoceX5Jfi0RFi0gjkcWlqlw0nM4WDaNetD0bTNv9hIvkpgGPD0uNGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkG2Q/uyKVjvtPsml4XDiXzJCFNbyNsWHqUx0axR2Kc=;
 b=SztmMhsiQAQ03rIpXx2pcPZb68GQmJL7Gc7pFRoNn0C5rh1zQRWqaKqA9KEiwSaGBoJhvtHXkmsXCcZBOqi68VYp8XtsIAzJWjmmQD10aUrLJtoPX7dWjLCcUImfL78DJMOEN+DSAbjzVhFpsF49pwtbk48KSum1+JzGIl+NCPbTTSs9R306ZGxQ9eggSZY05jAfQxCJBKFU1dS+oZkEt2PBQZYcVrV4/6SjxlndgNeaFIUhFhvh3r+hfKnzon5AQyfZrQaaiwUdpBh46VWalourbo8ja+63eTOGUY/Mzc+85xT/UrOi0fkBpwR1WmOCwqskAtefQheO2npBqRVdtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dkG2Q/uyKVjvtPsml4XDiXzJCFNbyNsWHqUx0axR2Kc=;
 b=jxNbKdbD3JCGccUgPj1H8HL5nQFLectFFYEzvzv7BO9FlXN/ldB5Lbjznf3Pxw5HOUcdLqX4jvgf4nTctuKnDlu1SGGeClFM9b/7HPJpwtJlmak+j2S0g1u1AJ08WTYJk//V3V4D7SXgf949gwRpm+QRKQuWYPe39ozhouKqNiE=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CH2PR10MB4054.namprd10.prod.outlook.com (2603:10b6:610:3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 09:09:22 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 09:09:22 +0000
Message-ID: <7dce3f0f-a71b-9800-b462-f5406a9c95a2@oracle.com>
Date: Wed, 27 Apr 2022 02:09:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/7] vhost-vdpa multiqueue fixes
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <6d7d0a27-beca-6693-ebea-780bca80fd9f@redhat.com>
 <ee09f73a-3a60-ae02-ebd3-12f954a19793@oracle.com>
 <CACGkMEv-sbYsA42rp-58ea0HnE1p12SgS=p2bE0xFni5qXyRPA@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEv-sbYsA42rp-58ea0HnE1p12SgS=p2bE0xFni5qXyRPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0057.prod.exchangelabs.com (2603:10b6:a03:94::34)
 To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7515ffc4-b4b6-40ed-accb-08da282d9e8f
X-MS-TrafficTypeDiagnostic: CH2PR10MB4054:EE_
X-Microsoft-Antispam-PRVS: <CH2PR10MB4054D4DD6361459AFC71DCD2B1FA9@CH2PR10MB4054.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vJw7PARbMuoL4uVEg/dfH7XsDpETS91LkniVL3KvfOp75fEktxQTlChKzXAo7D7tKbePSzZjrJU3uxq18WM78kvgV7eII8Qda66zDNV9dbSjBMEMYoCGbGvK1XV7hXKdQ9YiPmPithIHgKzd+37SVeiWrxqFtD9Sf/xvV+a4+YNafTFZ5Jpih/Z3b6zdlxodg6/Z2Enypk2RzzKTmKQOvYt6bYbBWk+SiZAyU3XENC2BaEbI6HoCYl5mc4q7NWI2fOh3eIxU2LAT6lricjhJLDiw+v+ugbHaVM9JD0+K8/axqewsSmv+2IMpuWAAdyC7aDhlL/+6qOYfV4TMUDkAKfndgsr98JOCZil/DarpUJ0yjG+n3UJ+UF07gJo0P7btXz9Du1KIGKBgyQICoHlKU838EffnCV+A3J6QfMLzbEuH3TSE6GBCvNlaB1yUK2mFiPyydyHcXPimZxK+L9M7gRHtCPBRp8fpLVe1nPN/bkK4JvRaEj90YbwCju1+VBwuJ8CRUVAJtsqoOjzMySQrE69NVH6CxQncvOXDJuAaNBxHp9MvMIflD2TLE7qPnJjGug+pSCgEOcqTTITwHog338mdTgG4uYgAGwp7R0GTHW0SfNEMcjbR5iIGgL0QKRY0AM7vI9lNRv9hUWOVF+1lufXnsXY5AUggjZbXO0hr+NPL7RmD/U6XXZ8rrRJrzvIT/ta689ZyhXrDaNdXb5/yJkSjabaxDFRMryJ+AQquGg5eYftlM2S9W9Pa+Yx5e4nZL0SaDK2T0sMEstwTuihNSOIG96fLZocrKUcgUiWQf/VO9KUS12jINM4hl90Ha/WBwT2w32MvrcfoS4k2P4CrDblXeu7wuk3DJ9ki/pX0kxw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(31696002)(86362001)(5660300002)(316002)(8676002)(53546011)(66946007)(6666004)(38100700002)(83380400001)(66574015)(36916002)(2906002)(2616005)(4326008)(8936002)(6512007)(66556008)(186003)(26005)(6506007)(6916009)(54906003)(6486002)(966005)(508600001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGlRWnpVUGtqcW9IUXhIRFJlZ0czOXRrUWh6a0g3SEFaTHpxTDl1d0x0UUkw?=
 =?utf-8?B?aE1jQ2s4R240WHZXdnhOSThEZlV2KzMrcTJ5THBvSzFTTWFPazYvNXBrNVNP?=
 =?utf-8?B?d3l6WWZFYkl2RE1Uc2p1MzdtMkdwSVphN2QyaXJkVEppNnlnZjN3dHJzVnNO?=
 =?utf-8?B?N1hNVWZ4Zm4vY2Y0akVSdDhhbUFPeDZ6OVBFK1hWRzJ3NUJia2cyc0gzWEll?=
 =?utf-8?B?eTJYV2FGT3llOXJzSTJvK3VzWEFTTmNreDMyS3A0cGQ4c3BzbktRL052UW5q?=
 =?utf-8?B?M3BUVTdxU2w0emN5YWpZcGVYUHpUZVZTSUZRL1kzVGo5UzFhSVAyRFNuMUxu?=
 =?utf-8?B?bXpjSzJON3NqVVFaUVhtN0xRUDdKTGpiRnpWOGZIN29CWlVnK0tGQlRyRzVm?=
 =?utf-8?B?Mm5vdUFGWWwvajV2UXRRM1N3WTFhMjVJNXVyai8yTVhoV0dhdjRVLzJzcHd0?=
 =?utf-8?B?N29DUjF0bzZFOFgrdk5LZWF1QnRoRTBGUTBBNEdIVGF0UUhIblZVOHV3b25W?=
 =?utf-8?B?TG5CZCtyRXhISnA3WUNGWTVHTEFtazduclFQS3d0d3BuZ3RZN1F5Q1d0c0ZV?=
 =?utf-8?B?aGdVWDA4cEtqUjlLZjJEdU82amg5YWZVZ3QxUnAyYWtPNmc0dTFwdzhLWjVI?=
 =?utf-8?B?NjM4ZDlZZWJhdUpOSHhQaXBRaHJkQUtYSjNVaENkblNiNnFXYi9qSFpHZ0pB?=
 =?utf-8?B?MzdKcDFRVG9DNWR2UzJQQ2hsQzMyRnU2ZGJyZllldWJXYUhmU0pRcFkrNW11?=
 =?utf-8?B?R29qRm5YaXBscm56dFdOK1FGbkJQZDBmQmk0MFJuNHQ2NXVieURyZ3hteDRa?=
 =?utf-8?B?UGhSVkd5SGZENUU5OUNVSVptOTFhWWFFamdZWFJqRzY1WGw5TkpvSzZVK1pK?=
 =?utf-8?B?QS8yeU9uL0Y5N21wT20yeWNabGxESkE4THdadi9wdXdVRkhwV29tN0xxT29j?=
 =?utf-8?B?UzRVTU42NHA1NmdTWEdKcEFnZTBrb25ibmtLRnhvelYwaDZZckg2dmlJNWwx?=
 =?utf-8?B?OXplZmZRT21rbTI0bjhhcFRJQlNWTk91ZDFvaVVHL1BqdmZzZTF6cFpDUjlq?=
 =?utf-8?B?WGhIUGFxeVFibFk3d0M3SFRzNTBid2ZlOXcxSFBoOUQ0Rm14YTlDQWFUNzZS?=
 =?utf-8?B?THVEaXlLMmNvMzNPRm9aMytraG82TEJiTWZpSXByaVVCN202TFQvY1ZsYWgz?=
 =?utf-8?B?YStZazZoKzRxTjVGUllxUE1ydEtDcUd3ZFZOa1hPVW10MUdZMmlpbHk4YVc5?=
 =?utf-8?B?SUx4cFpPQXZpUDlqZUFvNERMc2hWZDYxK2hkVE00Sm5pMEwxMzNYM055b3Uz?=
 =?utf-8?B?VDdKc1NoVWJGTXlCcEo0Y3lSeDB4QTIrSEI3S0Z3U1FEaGE5dWM5bEtOOUh2?=
 =?utf-8?B?WHNqZFB1aXdwT1E3Z3Y2UkZVS1dMS3dJZktNY1VWSUdNUzYvV242YmV0VmRk?=
 =?utf-8?B?WUthWENpUlYxS1VIOWErbnNSQzBWcFFFZytoYk9rVFlFZnpvM3FFUjY4Sk5r?=
 =?utf-8?B?Z0JaRWpoWGo1b0VRTXdMVUp6bjBscWVWVzc3K0tHWjA3WVZIMDRNVWFNNWQ0?=
 =?utf-8?B?RWU0bktiWWw1WFNJTjJGSFhIeGYvSDFmSVBkNm14R1Yyc0VOVE9PK21OOERB?=
 =?utf-8?B?UWRMMTRKSGJTZ0ZZUEY4ZTVHbmgwQ3k5MUM1U3NGcDNvMVg2N3RYOCt3KzBk?=
 =?utf-8?B?TVRwek5mTXB1V1hjNVJIUC9iSDVBWXJIMG43MlgzN2xUalZ0Nk1JVWg0NE9a?=
 =?utf-8?B?bWtSSDBDQk5sYzYyM1Z6VG05TmltZkpqVzZKVXE0UWdGZmRNSm82dWJYTDgx?=
 =?utf-8?B?blE2ekp4c2RpTXhoZHBKSm5UU2VCRk5RZWtEUHk1Sm04b0t6aGh3KzBQaDli?=
 =?utf-8?B?RXcxUWo4RmlqQjBsK2hjQ0dlemJ6a010V1hrOGN6ZTllM1UyY3dXd01EVEZE?=
 =?utf-8?B?NGRZQ2NJb0d0TG9Tc0pHUkNZQnBFN1drWnFNbFlvbnVtNmJ6eGZqRlpCSUJv?=
 =?utf-8?B?dktDdjVsTEs0SDRkSTV4Vnh4NzVOTUVYMC9wNHFnYzdvUStOS0RrcUo1SkZo?=
 =?utf-8?B?T0NvMTFUSnBqbzR1SS9ia214RVp0UUl5ZllPWm4zN1N1N0pQRnpTMVJ4cnFi?=
 =?utf-8?B?dUE4Wi8razhKSEp1K3d0TENiNndqZnMzTGxqQnU0cVVEaEFiS3FyVlJEWmZG?=
 =?utf-8?B?Z3JwbUNBSk9sOENOODh6alcvK2REenQ4S1ZJR1pYbnJjek1vZG53ckVVc2dN?=
 =?utf-8?B?bWhub052VUhBMm1ndVBEQmFvdmFYWXNVZ3l0WTRvcDdMYVEwNk1rTXdTTklB?=
 =?utf-8?B?d0xMRjJsdzVoQ3lMTll5ZndNZUVmVnlodUFTTGpQV3l3Zi9oK1VoY3R6NFNO?=
 =?utf-8?Q?cMaXYC3pEwh8Qmd0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7515ffc4-b4b6-40ed-accb-08da282d9e8f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 09:09:22.6764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvySSN1QCjHoiyC+I+kZiLZsq4PvSceQyV1PKOJN93EvfW/Tt9a8zfscQtcS1iRFXAgMbwtZgPCFwMhoCuqKnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4054
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-27_03:2022-04-26,
 2022-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204270061
X-Proofpoint-ORIG-GUID: gwub4gL4XvcDdk3Ndcd7Eo0N1yzoBY3I
X-Proofpoint-GUID: gwub4gL4XvcDdk3Ndcd7Eo0N1yzoBY3I
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
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



On 4/27/2022 1:38 AM, Jason Wang wrote:
> On Wed, Apr 27, 2022 at 4:30 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 4/26/2022 9:28 PM, Jason Wang wrote:
>>> 在 2022/3/30 14:33, Si-Wei Liu 写道:
>>>> Hi,
>>>>
>>>> This patch series attempt to fix a few issues in vhost-vdpa
>>>> multiqueue functionality.
>>>>
>>>> Patch #1 is the formal submission for RFC patch in:
>>>> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/c3e931ee-1a1b-9c2f-2f59-cb4395c230f9@oracle.com/__;!!ACWV5N9M2RV99hQ!OoUKcyWauHGQOM4MTAUn88TINQo5ZP4aaYyvyUCK9ggrI_L6diSZo5Nmq55moGH769SD87drxQyqg3ysNsk$
>>>>
>>>> Patch #2 and #3 were taken from a previous patchset posted on
>>>> qemu-devel:
>>>> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/20211117192851.65529-1-eperezma@redhat.com/__;!!ACWV5N9M2RV99hQ!OoUKcyWauHGQOM4MTAUn88TINQo5ZP4aaYyvyUCK9ggrI_L6diSZo5Nmq55moGH769SD87drxQyqc3mXqDs$
>>>>
>>>> albeit abandoned, two patches in that set turn out to be useful for
>>>> patch #4, which is to fix a QEMU crash due to race condition.
>>>>
>>>> Patch #5 through #7 are obviously small bug fixes. Please find the
>>>> description of each in the commit log.
>>>>
>>>> Thanks,
>>>> -Siwei
>>>
>>> Hi Si Wei:
>>>
>>> I think we need another version of this series?
>> Hi Jason,
>>
>> Apologies for the long delay. I was in the middle of reworking the patch
>> "virtio: don't read pending event on host notifier if disabled", but
>> found out that it would need quite some code change for the userspace
>> fallback handler to work properly (for the queue no. change case
>> specifically).
> We probably need this fix for -stable, so I wonder if we can have a
> workaround first and do refactoring on top?
Hmmm, a nasty fix but may well address the segfault is something like this:

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 8ca0b80..3ac93a4 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -368,6 +368,10 @@ static void virtio_net_set_status(struct 
VirtIODevice *vdev, uint8_t status)
      int i;
      uint8_t queue_status;

+    if (n->status_pending)
+        return;
+
+    n->status_pending = true;
      virtio_net_vnet_endian_status(n, status);
      virtio_net_vhost_status(n, status);

@@ -416,6 +420,7 @@ static void virtio_net_set_status(struct 
VirtIODevice *vdev, uint8_t status)
              }
          }
      }
+    n->status_pending = false;
  }

  static void virtio_net_set_link_status(NetClientState *nc)
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index eb87032..95efea8 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -216,6 +216,7 @@ struct VirtIONet {
      VirtioNetRssData rss_data;
      struct NetRxPkt *rx_pkt;
      struct EBPFRSSContext ebpf_rss;
+    bool status_pending;
  };

  void virtio_net_set_netclient_name(VirtIONet *n, const char *name,

To be honest, I am not sure if this is worth a full blown fix to make it 
completely work. Without applying vq suspend patch (the one I posted in 
https://lore.kernel.org/qemu-devel/df7c9a87-b2bd-7758-a6b6-bd834a7336fe@oracle.com/), 
it's very hard for me to effectively verify my code change - it's very 
easy for the guest vq index to be out of sync if not stopping the vq 
once the vhost is up and running (I tested it with repeatedly set_link 
off and on). I am not sure if there's real chance we can run into issue 
in practice due to the incomplete fix, if we don't fix the vq 
stop/suspend issue first. Anyway I will try, as other use case e.g, live 
migration is likely to get stumbled on it, too.

-Siwei


>
>> I have to drop it from the series and posted it later on
>> when ready. Will post a v2 with relevant patches removed.
> Thanks
>
>> Regards,
>> -Siwei
>>
>>> Thanks
>>>
>>>
>>>> ---
>>>>
>>>> Eugenio Pérez (2):
>>>>     virtio-net: Fix indentation
>>>>     virtio-net: Only enable userland vq if using tap backend
>>>>
>>>> Si-Wei Liu (5):
>>>>     virtio-net: align ctrl_vq index for non-mq guest for vhost_vdpa
>>>>     virtio: don't read pending event on host notifier if disabled
>>>>     vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
>>>>     vhost-net: fix improper cleanup in vhost_net_start
>>>>     vhost-vdpa: backend feature should set only once
>>>>
>>>>    hw/net/vhost_net.c         |  4 +++-
>>>>    hw/net/virtio-net.c        | 25 +++++++++++++++++++++----
>>>>    hw/virtio/vhost-vdpa.c     |  2 +-
>>>>    hw/virtio/virtio-bus.c     |  3 ++-
>>>>    hw/virtio/virtio.c         | 21 +++++++++++++--------
>>>>    include/hw/virtio/virtio.h |  2 ++
>>>>    net/vhost-vdpa.c           |  4 +++-
>>>>    7 files changed, 45 insertions(+), 16 deletions(-)
>>>>


