Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E7F5749DD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:59:26 +0200 (CEST)
Received: from localhost ([::1]:45282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBvcz-0004zg-1P
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oBvYY-0007AQ-Jx
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:54:56 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oBvYU-0003zz-GZ
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:54:50 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26E9rQDI008619;
 Thu, 14 Jul 2022 09:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=2Kr/8POfpDBdYtS7m0H3fGU+eGvbctswxzYg8GYwZ6Y=;
 b=0KLISQVABjWLccljFieUK1qbiJbGEVwiPjnStAZDyrtK0ESN3pObFCKMGleHzFV89ONF
 cZZmJA3X8C/pGSLEjL2fhNl4aE3XgNxXSdPPCyhNRnoiryncvNuxEwmcux8KLJphrQZO
 YF0/KYSZCm9P9cNlczwoLl+ThnQwN+dkuTAjnkUz/1k3VCKxTE7OyVo7/pewlHtcakLB
 5prEVGiLRboFtANV8GsfPkTQ1aeF5WeolJT8QJkt2OWXk3ELLF1vOAI7zYr9ydmMUIPF
 Aix7+2STAzPQ1AIXhkqxPmsOBOQq2Y4oHcf6vSy8LhVfenqrO9lCGpw9fg+dnhFoddSm QQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71r1c8j7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 09:54:33 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26E9oH2C010565; Thu, 14 Jul 2022 09:54:32 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2046.outbound.protection.outlook.com [104.47.56.46])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h70460s18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 09:54:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvCxmtBAgtEz/qvZ6CXqUnxq6gSNxwqAazDKMOz9elxL8LRHibccY4x9OG+JaExUZqO49HtjAYDrUcFMc95IkwlzmFCX1ZpEw9tbF84APGecqoNqjEB3xeY2zjvuP0DIAM8XOMTNB97yCfHChdwmMhbgOv+T+IrC4JYYI+TToOfxyuz4zdNNG1O3NbnhbdjlES1h/4fklrxaG05B5M1vNmzBkLtSDFK/HQOFLm34roMRimw7DSkO4BaAmkdzdOewljvqA0f4334y1DaBWsR++3FGd5FnlJmybSjKM8rXI0ck0B+yx+KfcHuFJW7mTzl2+t29eyqXY9x4v/xNgREjHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Kr/8POfpDBdYtS7m0H3fGU+eGvbctswxzYg8GYwZ6Y=;
 b=ibjxVkf7KSWkrWb4/7PIUR7Hd+KwB41v1zfkkNNFmmM4CLsoMIAfDLgo9T2GPxNPyQmQ4u07kkZdwF2XCMVXOZ+yoVW6WUPIwF1CSncVdCYdWv66En5TRy2cCWT8QqIyuOvASPpXq07GwqTShUCswYQp3NxW2FXml+EJoJDDtjPTaoapp43gqTtG0V14+tBQvRsm+xPBJCo6wf4Sn72D7689sNAsmOxKfNAh3yS20SAPCRZxbHeh+5K9okgNTAeC45E3x6iFZ0RWDXY96F6/qVjb3CO/zK5yvHq0mqz0976cMmCcyljKs6d7nKJmpyjyUkvfIjYS3msNMca1I8MGKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Kr/8POfpDBdYtS7m0H3fGU+eGvbctswxzYg8GYwZ6Y=;
 b=yL4d/SetgaawRdYimPVJJWC3ubwxHvS/goy1HdMkjd1Twu//suPz3sg01cll94BJNUXECr0zCfQzsRASS8A3rvIjgtQL3RkU8QgfKjxW5miXDqfyZkpr27yqpgic+R4YzSFou2a7RWtUshz3atscatR7pjlIkCcpBVu+b6+kssw=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN6PR10MB1604.namprd10.prod.outlook.com (2603:10b6:405:f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 09:54:30 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%8]) with mapi id 15.20.5438.012; Thu, 14 Jul 2022
 09:54:30 +0000
Message-ID: <19de0ed6-f29a-2f59-658d-aeb694043038@oracle.com>
Date: Thu, 14 Jul 2022 10:54:23 +0100
Subject: Re: [PATCH v6 09/10] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-10-joao.m.martins@oracle.com>
 <20220711145627.2c318ba6@redhat.com>
 <5179013f-a2b6-b5a4-a509-42657dbde25a@oracle.com>
 <65ea8b7f-37cb-55dc-3306-fd32880aa0fb@oracle.com>
 <a731592c-4e42-ea23-6fe3-550b8a07af11@oracle.com>
 <20220712110615.09c3e303@redhat.com>
 <2228436c-2271-ec27-96ee-67825ac1b13f@oracle.com>
 <addb6d9f-5d04-0280-a0b4-79edd888faeb@oracle.com>
 <20220714112820.2cf526ea@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220714112820.2cf526ea@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0041.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::15) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c9df153-6c55-483b-b3d1-08da657ed874
X-MS-TrafficTypeDiagnostic: BN6PR10MB1604:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o5eXMeOJTkAp9oYUijB+PkaRTswlt4ntfRbdSiklSWyebOX67MClqlV1t6G+El+ZEClOMKCDtSgGyaiTNWIUwroHfDMKtt9KSkRL8rqeEDa5u9UvxT+GRQsG754yk7mV5qr7l9mfIkBxQxC5VmTVNbJPzgi7iAG/iI3Fby31NGjYmEb/rQ+EjxktBXrVqFYiS80B4gePuSNhtZg+zEeec/ILoSIdYvp7O/Y6mhC4dGgqEXb27gYHWarFgkzmhniq6vmuGHoQbSxR2ouUBrJ58s6DFFU/GYo3JQ+woNgL/d1ZecLn8GwrNyAeCgr2dOdf48xInWqUgkV/wv4WpRKOvkASvTV/c+8E1i8a7Kw8d9MwdzggcvtUevhC38SsLyRPDZrcKLg+wGNpLsCPXdTZFe6oaxoMm9zPBT4dyOzL7Mw4BbTQN8lW9O/XzEugPQC3OfLOFYtPS0MzYvv7gLBqeZ5CASBFwEqkPQpYSTxMFfRpdH+qt9Xi+0dP5JFH3bd3ZupIediKKR5W/rHxVe5OJG8c+pOXklaoC8V/1m4xRz7b/m2qdjfCuuEOuvTM0DpkRkGu5Gjlmv9k2qyeOBYV0ffoS3HaecCniVzbH30H7S0UsKnFuR+rNKP0BPVmjpHL9G5W85k9W/vvEEY2mfGmPlilVaa8RXysQdA6tzxwZbD5Hdf1fLZeNvboazuruqBWTl4vr6RhgkHEBgFEUthMo4zRxDS2+u0u6MHIS6or0ppqs6mZqLew9UEBCzF/rrAatIQJMrMovr9srjdz/s+RjNbVcKzJPijn0OzX7nuxwAT7iun/iXp6QIq6Gwm2Cw8FWiTMBO0pEtL9IxqyOCZF5iBrGbuEjI9lnX4lpslcr5h8EjlwXkvcpEigJtFnTij1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(376002)(346002)(136003)(396003)(86362001)(66946007)(2616005)(26005)(186003)(8676002)(5660300002)(6916009)(54906003)(66476007)(4326008)(478600001)(6486002)(966005)(316002)(6506007)(6512007)(53546011)(41300700001)(66556008)(6666004)(2906002)(38100700002)(31696002)(31686004)(36756003)(8936002)(7416002)(83380400001)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUtyNnhZdHRBZnMyYmRuZjE3TWpoNS9wTkZuUzRKZk1ONDJQdWlOZmp5YWNB?=
 =?utf-8?B?NjhJSmpvUDVPL1Irck1vZ1JnekZXKzdCT1ROQjUxd1MrbVBrM05IalVLYU1i?=
 =?utf-8?B?TThsQU15OTlqWG5ObVByV3FTNnJsTFRUQWVLaUNzWGt3dDJ0ZjlubFdVYnN6?=
 =?utf-8?B?N083VWVzdXZwMEo4TEV4alNJUDVhZmxldi80VFdTRzVCSFlldkcwY0t2Tk55?=
 =?utf-8?B?YUFDZ213RkRVOTZWWkJZNUdNTDFFclZ1Q1BHcFJ3ejBuUUJqaEpWSzRWNEh5?=
 =?utf-8?B?c01pbFRqZmNaUzkvZFNKU09LMm55cThxb0FYTGlDbVV4c3pla0d1dzljWTdw?=
 =?utf-8?B?M0wxc2pyeTQ4MVBXanU4c09GSkg5NXFtVFh3M1hGR3BRZVdJY3N0cnRpTm9B?=
 =?utf-8?B?ZEpucTMvOVBabFJ0NGpzeVZRR091WjNOblduZHlUZis3aGRkeTR5dFBOcktF?=
 =?utf-8?B?OWJpQnAwSWRCdU9vVHcxK0lNWlh0L2ZxYkJjdVZvWXcxQ3lxVFhIV3ZyK2tz?=
 =?utf-8?B?N2kyb0xNSjNRaEw1cC94MldKUHpuOVBvVDJpQjc1Vkd3SWFMWCtQZWR2aDAw?=
 =?utf-8?B?QmZRUHpTNUc1bU8xME9YUGFyb09TdTBQU3p4dEs2STN5akJVUFE1R2gwT1FY?=
 =?utf-8?B?a0RjRFpIem51Nnd5MXIySjg5Tnh3T1BaNFZqb1VLbFIwRllUV1YvemxSVDI5?=
 =?utf-8?B?MWR2bmJ3YzFQWHBXYzY3Zmh1T21ySEpid1l1eFM4RFNMT3lXajdyTzJ3STRo?=
 =?utf-8?B?bEY4bVpQU1lKWCt4dnN5TEwwaGN1c3N5ZE9KcTB2Vnk3UlFvQU1vMXRWMmJJ?=
 =?utf-8?B?MloxNC8zaERuT2o3T1JENGMvSW1KT3JzNHZCQVQ4Nkhkd0tGZ1Bualh0clpq?=
 =?utf-8?B?N3U1WnhEN0VHUVhFZzhzZjJySXZoWXdNWDl0QUFQT29hbWh5dUNjUEx0c1F6?=
 =?utf-8?B?a1VSNUQzZ2ZmQVk3TUovMFEyY0xZektQRHMyMkwzSTVuRGpTL2RXZDYwUmpm?=
 =?utf-8?B?RzBTc1FKRWlDZkNFQjI1azJtTEFSVWllWjJtaU54bER4a3k4dzUrbjh3V0dk?=
 =?utf-8?B?ejhlc3RGZDdOc21tR2xOdUZndUVXSjNlR2ZPYUNhSWVJNXFjQ0wyc2xWQVhR?=
 =?utf-8?B?Znd4enpsN3FyTUNGWFhuUVgySktyZmtzbTMwck1jTzYyazR2dW9lWU5hdnVR?=
 =?utf-8?B?V1Z3akR6UWRnYnJBMkpPMC9OMkN4NkZ3OElpRXJ6aGhqcmdyK0FGeGVpbFU1?=
 =?utf-8?B?OVhqWHordkE5K0tpb1ZQNlphOFo2WC9BM2d2TTBpM21XVVQzRm1CTHlQTExE?=
 =?utf-8?B?MWhlUVNKUFN5Sjh5b3BHS2pLd3l1ZkdIdm51aVZpTGt2aWR0MUw1U2lRVDFP?=
 =?utf-8?B?MWJXRWYzNnhmWVVudUtiaDhmMGlWWUVreVA1NHlJRFNvR3hVbTVmbGtpWDZk?=
 =?utf-8?B?Q1hZN3ZVWEJUVkJXc2twRDc0dzZJMEY0bXZpSUdYZXNiSGp6WTdEVHpVUWdK?=
 =?utf-8?B?akFRT0xMOXpJYVBTeEhEWUY2V0kvQVFTQ0xKU3BhS1ZOYmZOQVg2RFdJRDJ2?=
 =?utf-8?B?aTdMenZGL2ZWT3MyN2xYRzNNQ0EzSWs0SGpTeVJWUVd1Umw1a1VXY3lWMEQ2?=
 =?utf-8?B?TVB1RUl0UTh2YVpBak1EaldlN3UzWkVxbW1BbXBsQld5ZXNWc2xkeHZCNk1U?=
 =?utf-8?B?amR0OXBmQllNL2dsekh0STNNWnh3cGhBVWR4d0hhckwybU1uYndtV0FyUjQ1?=
 =?utf-8?B?U2Q5Y2lDL1ZVSjh5UTNvRytDcEY1VjkzcjlJWmo4OUwvbW9TTGtiaFBrMlBD?=
 =?utf-8?B?Um9USTRKaW1tQVBJNzlycXl2cmkvNjVubk1QaGZPRS9OWVpoWE95aFgzcmFO?=
 =?utf-8?B?Vk96dTdWVzloQlF4eDFBbitkRHlJZzZXL3EwTk8rdHZnd3FoQW9KcmU2aTR2?=
 =?utf-8?B?Q1FCcUZmOFF0ZWFyR3k2L0VTSHlia1RJOUR1c2lucG5TZ3lEdTY4Z1l4b1lP?=
 =?utf-8?B?S3NVd3I4Q1RTZldTREJod0Z3MEJuaTBGNzc1Z3VJdjF6a05jalFBN0hvZ1o5?=
 =?utf-8?B?bVovUGk0QXRhcDFjZHJiOXJWSncvendINXZnVTAvUSsxSFpTbmFYeVlSYy9v?=
 =?utf-8?B?SFRHU0Zpek1sRXJBQ1RiczY2VnR4M3EwSjlpbkdyY2pjaU9ZQ3U4YVdTTE9B?=
 =?utf-8?B?Rmc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9df153-6c55-483b-b3d1-08da657ed874
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 09:54:29.9876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dC3HYzQ6lI3CiSHxG3ofLMxjw4rbaXVorjl//vJa2e8RpZ4nWTtjXUHkb4mqRytdUkIelfQFxVKLm5lY8oY+tc5Jks52HpFKVhHXiensSTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1604
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-14_08:2022-07-13,
 2022-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207140041
X-Proofpoint-ORIG-GUID: RJy5A14bsyshrwbUjQFKDKMfmND1Y0o6
X-Proofpoint-GUID: RJy5A14bsyshrwbUjQFKDKMfmND1Y0o6
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/22 10:28, Igor Mammedov wrote:
> On Tue, 12 Jul 2022 12:35:49 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 7/12/22 11:01, Joao Martins wrote:
>>> On 7/12/22 10:06, Igor Mammedov wrote:  
>>>> On Mon, 11 Jul 2022 21:03:28 +0100
>>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>>> On 7/11/22 16:31, Joao Martins wrote:  
>>>>>> On 7/11/22 15:52, Joao Martins wrote:    
>>>>>>> On 7/11/22 13:56, Igor Mammedov wrote:    
>>>>>>>> On Fri,  1 Jul 2022 17:10:13 +0100
>>>>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>>>  void pc_memory_init(PCMachineState *pcms,
>>>>>                      MemoryRegion *system_memory,
>>>>>                      MemoryRegion *rom_memory,
>>>>> @@ -897,6 +953,7 @@ void pc_memory_init(PCMachineState *pcms,
>>>>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>>>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>>      hwaddr cxl_base, cxl_resv_end = 0;
>>>>> +    X86CPU *cpu = X86_CPU(first_cpu);
>>>>>
>>>>>      assert(machine->ram_size == x86ms->below_4g_mem_size +
>>>>>                                  x86ms->above_4g_mem_size);
>>>>> @@ -904,6 +961,29 @@ void pc_memory_init(PCMachineState *pcms,
>>>>>      linux_boot = (machine->kernel_filename != NULL);
>>>>>
>>>>>      /*
>>>>> +     * The HyperTransport range close to the 1T boundary is unique to AMD
>>>>> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
>>>>> +     * to above 1T to AMD vCPUs only.
>>>>> +     */
>>>>> +    if (IS_AMD_CPU(&cpu->env) && x86ms->above_4g_mem_size) {  
>>>>
>>>> it has the same issue as pc_max_used_gpa(), i.e.
>>>>   x86ms->above_4g_mem_size != 0
>>>> doesn't mean that there isn't any memory above 4Gb nor that there aren't
>>>> any MMIO (sgx/cxl/pci64hole), that's was the reason we were are considering
>>>> max_used_gpa
>>>> I'd prefer to keep pc_max_used_gpa(),
>>>> idea but make it work for above cases and be more generic (i.e. not to be
>>>> tied to AMD only) since 'pc_max_used_gpa() < physbits'
>>>> applies to equally
>>>> to AMD and Intel (and to trip it, one just have to configure small enough
>>>> physbits or large enough hotpluggable RAM/CXL/PCI64HOLE)
>>>>  
>>> I can reproduce the issue you're thinking with basic memory hotplug.   
>>
>> I was mislead by a bug that only existed in v6. Which I fixed now.
>> So any bug possibility with hotplug, SGX and CXL, or pcihole64 is simply covered with:
>>
>> 	pc_pci_hole64_start() + pci_hole64_size;
>>
>> which is what pc_max_used_gpa() does. This works fine /without/ above_4g_mem_size != 0
>> check even without above_4g_mem_size (e.g. mem=2G,maxmem=1024G).
>>
>> And as a reminder: SGX, hotplug, CXL and pci-hole64 *require* memory above 4G[*]. And part
>> of the point of us moving to pc_pci_hole64_start() was to make these all work in a generic
>> way.
>>
>> So I've removed the x86ms->above_4g_mem_size != 0 check. Current patch diff pasted at the end.
>>
>> [*] As reiterated here:
>>
>>> Let me see
>>> what I can come up in pc_max_used_gpa() to cover this one. I'll respond here with a proposal.
>>>   
>>
>> I was over-complicating things here. It turns out nothing else is needed aside in the
>> context of 1T hole.
>>
>> This is because I only need to check address space limits (as consequence of
>> pc_set_amd_above_4g_mem_start()) when pc_max_used_gpa() surprasses HT_START. Which
>> requires fundamentally a value closer to 1T well beyond what 32-bit can cover. So on
>> 32-bit guests this is never true and thus it things don't change behaviour from current
>> default for these guests. And thus I won't break qtests and things fail correctly in the
>> right places.
>>
>> Now I should say that pc_max_used_gpa() is still not returning the accurate 32-bit guest
>> max used GPA value, given that I return pci hole64 end (essentially). Do you still that
>> addressed out of correctness even if it doesn't matter much for the 64-bit 1T case?
>>
>> If so, our only option seems to be to check phys_bits <= 32 and return max CPU
>> boundary there? Unless you have something enterily different in mind?
>>
>>> I would really love to have v7.1.0 with this issue fixed but I am not very
>>> confident it is going to make it :(
>>>
>>> Meanwhile, let me know if you have thoughts on this one:
>>>
>>> https://lore.kernel.org/qemu-devel/1b2fa957-74f6-b5a9-3fc1-65c5d68300ce@oracle.com/
>>>
>>> I am going to assume that if no comments on the above that I'll keep things as is.
>>>
>>> And also, whether I can retain your ack with Bernhard's suggestion here:
>>>
>>> https://lore.kernel.org/qemu-devel/0eefb382-4ac6-4335-ca61-035babb95a88@oracle.com/
>>>   
>>
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 668e15c8f2a6..45433cc53b5b 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -881,6 +881,67 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>>      return start;
>>  }
>>
>> +static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
>> +{
>> +    return pc_pci_hole64_start() + pci_hole64_size;
>> +}
>> +
>> +/*
>> + * AMD systems with an IOMMU have an additional hole close to the
>> + * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
>> + * on kernel version, VFIO may or may not let you DMA map those ranges.
>> + * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
>> + * with certain memory sizes. It's also wrong to use those IOVA ranges
>> + * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
>> + * The ranges reserved for Hyper-Transport are:
>> + *
>> + * FD_0000_0000h - FF_FFFF_FFFFh
>> + *
>> + * The ranges represent the following:
>> + *
>> + * Base Address   Top Address  Use
>> + *
>> + * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
>> + * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
>> + * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
>> + * FD_F910_0000h FD_F91F_FFFFh System Management
>> + * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
>> + * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
>> + * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
>> + * FD_FE00_0000h FD_FFFF_FFFFh Configuration
>> + * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
>> + * FE_2000_0000h FF_FFFF_FFFFh Reserved
>> + *
>> + * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
>> + * Table 3: Special Address Controls (GPA) for more information.
>> + */
>> +#define AMD_HT_START         0xfd00000000UL
>> +#define AMD_HT_END           0xffffffffffUL
>> +#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
>> +#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
>> +
>> +static void pc_set_amd_above_4g_mem_start(PCMachineState *pcms,
>> +                                          uint64_t pci_hole64_size)
>> +{
>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>> +    hwaddr maxphysaddr, maxusedaddr;
>> +
>> +    /*
>> +     * Relocating ram-above-4G requires more than TCG_PHYS_ADDR_BITS (40).
>> +     * So make sure phys-bits is required to be appropriately sized in order
>> +     * to proceed with the above-4g-region relocation and thus boot.
>> +     */
>> +    x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
>> +    maxusedaddr = pc_max_used_gpa(pcms, pci_hole64_size);
>> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
>> +    if (maxphysaddr < maxusedaddr) {
>> +        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
>> +                     " phys-bits too low (%u) cannot avoid AMD HT range",
>> +                     maxphysaddr, maxusedaddr, X86_CPU(first_cpu)->phys_bits);
>> +        exit(EXIT_FAILURE);
>> +    }
>> +}
>> +
>>  void pc_memory_init(PCMachineState *pcms,
>>                      MemoryRegion *system_memory,
>>                      MemoryRegion *rom_memory,
>> @@ -896,6 +957,7 @@ void pc_memory_init(PCMachineState *pcms,
>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>>      hwaddr cxl_base, cxl_resv_end = 0;
>> +    X86CPU *cpu = X86_CPU(first_cpu);
>>
>>      assert(machine->ram_size == x86ms->below_4g_mem_size +
>>                                  x86ms->above_4g_mem_size);
>> @@ -903,6 +965,27 @@ void pc_memory_init(PCMachineState *pcms,
>>      linux_boot = (machine->kernel_filename != NULL);
>>
>>      /*
>> +     * The HyperTransport range close to the 1T boundary is unique to AMD
>> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
>> +     * to above 1T to AMD vCPUs only.
>> +     */
>> +    if (IS_AMD_CPU(&cpu->env)) {
>> +        /* Bail out if max possible address does not cross HT range */
>> +        if (pc_max_used_gpa(pcms, pci_hole64_size) >= AMD_HT_START) {
>> +            pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
> 
> I'd replace call with 
>    x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
> 
See below.

>> +        }
>> +
>> +        /*
>> +         * Advertise the HT region if address space covers the reserved
>> +         * region or if we relocate.
>> +         */
>> +        if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START ||
>> +            cpu->phys_bits >= 40) {
>> +            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
>> +        }
>> +    }
> 
> and then here check that pc_max_used_gpa() fits into phys_bits
> which should cover AMD case and case where pci64_hole goes beyond 
> supported address range even without 1TB hole
> 

When you say 'here' you mean outside IS_AMD_CPU() ?

If we put outside (and thus generic) where it was ... it will break qtests
as pc_max_used_gpa() does not handle 32-bit case, as mentioned earlier.
Hence why it is inside pc_set_amd_above_4g_mem_start(), or in other words
inside the scope of:

	if (pc_max_used_gpa(pcms, pci_hole64_size) >= AMD_HT_START)

Which means I will for sure have a pci_hole64.
Making it generic to /outside/ this conditional requires addressing this
earlier comment I made:

 our only option seems to be to check phys_bits <= 32 and return max CPU
 boundary there?


