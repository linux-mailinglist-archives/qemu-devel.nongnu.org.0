Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C026A6ACE4D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 20:42:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZGib-0003Zt-0F; Mon, 06 Mar 2023 14:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZGiH-0003RX-CJ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:41:40 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZGi9-0003CL-E0
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:41:30 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326Idkck032447; Mon, 6 Mar 2023 19:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=fvb3K7utVjW486dWD5BTsb3H7LFeGqyoXiCOm/EtZps=;
 b=CrOwANOa7op+BeWPIXLClzHiQKR/dO6IM0WQsozNWr1iTxQ68aRjaoKq1Y0Vu9LzPK2F
 crVbgrP45krJQpaVb7gMnMCQMYlb1ewMIZM0udeS+uMiCHSUXGUmnlWPTPvyX+HKXKPz
 gQmULBnKGtLA0DuU7nvljJi0IQdf4D+RRgrJQZHVS8AYE1kPDoMpN2rdiPR851CY4la5
 sBUwirwoKRYIlNneWGGhaulqUJC+UN5QLTaQeGnXK+2EoZH6j6MMaA8a1o9aLoJusNh7
 +Xx0K9Vts+AmP+fCPWyqeqWf6Suuo821DU44FY7ex2fcCT+CohdRpZQwh3w4ItSbHrQH tw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p5nn90480-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 19:41:27 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 326JblDJ026620; Mon, 6 Mar 2023 19:41:26 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u1dy6ah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 19:41:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBzZR89P9cblDID/fJoH2Y2XXCg8hZN8oIO6YKCp6UAqRegPfdTjQD7dXZARF4k1H2e431CIdmVnEooW11TUhLr2B4FUZAhKnEd8igEXONPrWzjgqL3MyDHq/tHaQm6ftZAvLvT48+vG4381L0uiK2k4IfXfgpA11iXAO0lkDrpvDmOjIjd4w3LHTwoGnwkNEyWJg59xSNjpzW6S5ZrC0VfOW3nHySwHXILyiVCxjTP/S7aowuOXO+L5wfiu/Jl/MzbxeoJiXXCP/d4etf9bPboRcd6EMnXz9gexoBT3gYbIgKIH99+fPwGfbCIqlyx8yo+jswN+jeSNs9lEjGbaCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvb3K7utVjW486dWD5BTsb3H7LFeGqyoXiCOm/EtZps=;
 b=DudXXrGQG0P1sj5o543BiODcpxZ1Wg752KKpknGnGUCwTzOZjLSKA0smgntPxZnMkZwTTDwdzvWxKRZ3MmhjULzZuta4v7f16oSvyA2X+TgMFrMXjIwSQLHkPUIu+BZyTThQBnDKQZ065JAlBE17pyVdRZV8NAkitAn9FA2Kegm3Ke9v3T26TIht0IMZzvIGfGx6U8T9k9WKcy0sbWP8+lDnYnPGkAbaaybSe35nReUdmLpokMuqRx7S7n8efOjg7IACgZpwFXX0a7t0MROq2VfaDJYaKBeAN4GJwcVDz9f+sd1C9k938Qx7ONb2gExOReC/mU6AqY7mIRDtqfwRog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fvb3K7utVjW486dWD5BTsb3H7LFeGqyoXiCOm/EtZps=;
 b=pP8mVhtRuIFxK7buCGz4l9hXh5+kp9ymem21pWK1kuiVy2wGItUB0jb+fCAteAFT3wHWKFahP62hVOJPCUJXWIB+yPcr8vmvl6sDT0oWcCZfxD+bNpIERmcMlK15flX6XNNZv2T9fdeB64O9WC7pKVBbn8Jjxn/HRdN45Wqs/0I=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SA1PR10MB7661.namprd10.prod.outlook.com (2603:10b6:806:386::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:41:24 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 19:41:24 +0000
Message-ID: <70b5d53e-bcc9-bd96-ba06-7c4d5e72c62b@oracle.com>
Date: Mon, 6 Mar 2023 19:41:18 +0000
Subject: Re: [PATCH v3 00/13] vfio/migration: Device dirty page tracking
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 qemu-devel@nongnu.org
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <b3c061f5-662f-8303-c8f8-2788979d70e8@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <b3c061f5-662f-8303-c8f8-2788979d70e8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::30) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|SA1PR10MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: ef08028b-d1f1-4f4f-3b86-08db1e7ac4c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6RtG0qK06Pxy3zdwcrO5EwSsQ3WeLFHhVDpz08Rxf+4qsm8xddRZGzyiw7dpjDSX6/quHV0x1gnMGdfP/Iq372auwsG/uohR7NwhL4nTnPx49envx8RLoMq37zrs6VCVkFxF1aqOCNI9haolB2LC1eUrGbPWWTZROnqbDM3KOSSA7ge0ybrNS3nvPMEzyEB0es7dvTc34CNV2rwk9XQjh1iHHyDXufN60zx932X9/mfpv72mH/g862JgkqwZ0+PkSQI718sBduRNJMK4X015Ceouk6xcpTpF56exI4OzNMTGYDYxQreT59Gd3Qv6fZQ38oz2NcmpKEbkp55qKlA41peXVMwG1HJLFkr9zITvXdeYohSXBPJFr64mF9QJYIdrccwqVYWTvpMwXdDqNTuG+C4Juz1XgI6ueajugn2C9Ut50AZcFh1mZkiOdNgWy63fN7md+xOwaYIvq3e39/OxLgrzvcs9WOlcLyrynJLk2wDX/9re3X0BPNtla0N8m1qo41awnQLyukrSSTcYJRflpJmyATEqTjdFjBROaTqegRhw7jIn+JCjy7inNBpMVuW/Ldblvm9gn+AIgVFFwo1fw+Xx4yehYZt3wFXiRUuQHgfRw4acDy/0/gkd8p5I6aOBjXs7pbqQUoEXKMFnMl0QNWpvq0HXFBiyMcsMQuMClW+10eeLeuOcfu0JZ2i3QjRsugVf3xoLy9yPpSsmzN2240zmDDIlmXJpG8EmVS2zvDI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199018)(2906002)(31686004)(8936002)(5660300002)(41300700001)(4326008)(8676002)(83380400001)(66946007)(6916009)(54906003)(478600001)(6666004)(6486002)(66476007)(66556008)(53546011)(316002)(6506007)(2616005)(31696002)(86362001)(6512007)(66574015)(38100700002)(36756003)(186003)(26005)(14143004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZC9XV0ZycTBicTJ3bCtmM1hQSGp4ZXdncHhYT0JudUZLSk9VZmxkWlBYVjlZ?=
 =?utf-8?B?M3R1WU95NDkxTzl3aFcwaElPcW9MY2xGRXAwUXk4UXdYWlB3M04yTFFQenZR?=
 =?utf-8?B?NnJIRFZ5aXV2QzE4NE1XUXZON0dJdG40UVlRd21zVXFGbjdGRkdwUFFoS0c1?=
 =?utf-8?B?b3FuOVN1dlREMzliV0VIZ2JlT003RHFIUjNiY0QvOUp1ejVtNnIvcmF2Q21H?=
 =?utf-8?B?bXdIdnNubm8xZWNWNXQrYVRkenhNMmFRWGZGSWZBM05UWEJvTHN0SXhGYXA1?=
 =?utf-8?B?Q2xXdVZRQUJJNHB5N0FUUmlBTzdIRXJTbzRZdVFPUnhneDYvaUYwckpLTDQ1?=
 =?utf-8?B?cEFwRGxJeHhqUnVJS3VyUFJQektVRkhpaHJuWVRPTzMrSzlGbUhibG45R3pO?=
 =?utf-8?B?b1ZHUmk5YzBvYmo3SU5FK242eEhBTlpWSEg3cDFPbkt3SWlzeW1OVk94MGx3?=
 =?utf-8?B?Y21FTDZ4UG5seFdNTXNMK1E4Nlh0YmduY3VNeFR0WHJaS0FZdGVlbTBkYWYv?=
 =?utf-8?B?THdFUWJxTEJSVFVTTW53bW5heTM1TzlacWhRamhSemtYdUp3WlZ3ZU1xQzZD?=
 =?utf-8?B?V01nY1crU0ZYT3RJTHJ6ek43TzhPekhwejFyanJtZDc2dTNGaFVUb1ZTSisr?=
 =?utf-8?B?dFkwNTZnV21zWW4xc096Y0pDQTdWL0dVQlB5V3BrUzE1RVJua09GRWdzbWxh?=
 =?utf-8?B?Z0F5L3ZpbEVKREZZdlByb0xGdEpwSzRabCtqRU1OMFl0NnNzYUxHWGlDaVQ3?=
 =?utf-8?B?aUY4SUJ0dy96cmlCbFBqY0tZR0xFSXBPMWlVcDZ6RDgraTAzNzNLcHd0S1JD?=
 =?utf-8?B?RDlraUhORnZFNGpXNzUvc3A3RUZGakU3cXR5Q1ZGcnNVbmUxbXMzdnNKY01X?=
 =?utf-8?B?WmlKYzFHYVk1TFFrSnBHbUtETHB4U3lZd0M1WmJEd2NVUkpTSUozRTRBN2hS?=
 =?utf-8?B?MHBMSTdxQ2JrWW1oYy92dWFxSHdSckRsZVBydmUyUElEcHBEY1NLdjkyKzds?=
 =?utf-8?B?SkhxUnBLVzQ1Mzc5a1JVQ0tOWFVzbnZtMVBvUWdlVVpwcy9oeGs3dFVYRW5n?=
 =?utf-8?B?c21DQ2xmTm9vZjBNK2dqL1dCNStsWENlendkdzJzbFBVQTVrWUVzc29sRkMw?=
 =?utf-8?B?NmJhYS9EOFNGb2J2VmFpUlFXdG5sUlVHTU9Nc1pYQWtuQi9rclpQelZmSG9r?=
 =?utf-8?B?OU5SeW9wcW1QNnhEemNWb1JpdndsZDNWS3VveHJpOTdVbVJQeWk0a1d4OWJP?=
 =?utf-8?B?NFJ6VmtSazlETzk2QmV3TEI0ekVuU2M4UHBmWlhVb3Y5dmlISi9yTUl4OXBH?=
 =?utf-8?B?ZE4ybTFRSDBMSUJLaHRzV3hZNUVGdnZLbGZ5Q2hJekNDYUE2OHJjK3NIUC9L?=
 =?utf-8?B?UHFKRGhzeTQzL2NJOElQU2EyMDhuRytLdG5MZHpkN0NiWU9wTjFWTGNGNGYw?=
 =?utf-8?B?aWxNTFVQK2U4aHJkZzBDbHpqRHllazlSRWV3YU1NWDVpMVYwWG1BdzYxTTFW?=
 =?utf-8?B?cktidlhyRld5R2luNWw2N0dUYnRzSTRabzlQU0lMdTVRVlZEMzR0cEFxd1Iw?=
 =?utf-8?B?OWxRUm1PNDUwSjBmdExmQ3NINGhwbmxFdWVUVFcxclhrVytjc3lrdERibHpU?=
 =?utf-8?B?L05TVVRITTN4aUlvc3ZRUnFwTWlLbzRyRVJ1SE16TU5wSDU1TFdhOWMrTzll?=
 =?utf-8?B?c3Qxdm5Xc3BEcS9iY1Axbkh5bmk0eis1VS9BS0pZOEJUZUd4MC93NGhpUGVa?=
 =?utf-8?B?Z2xsYll6MGxEOVFWanNUTlFMQjhCTFpMM3pIVDdnMHZNdXJQWXRMbnhaTjRI?=
 =?utf-8?B?UFI5YWoxbStNMFVoNUxhZHJoY0dUaHdiSHZBdUliZC9jUGhZMEljOFNqWldV?=
 =?utf-8?B?U3BYSjBSa0wxVmd5OW9rdkVpNjJralVGZy83Y3B1RmhNN2Z4THZUNC9VWEtK?=
 =?utf-8?B?ekg3SWRGaEdyMlRuSHpnV2V2R1ZwVXVuYkc3dm5RaWtMZzIrbHpCa3Y5MHMr?=
 =?utf-8?B?WlZueER2Q08zdTExdm5uLzZmR0FiRitWNDBiTHN1ZDhLMklkZ2RhVmFRbkhy?=
 =?utf-8?B?bStmVnJqamV5ZVFyYVJrMG1mZnNkSlNjbi9RSzRzVXpCR1hPWFhrdXVETmJ6?=
 =?utf-8?B?YWFDdVkxenV6MW83bkVYRVpyUlVybEs0WUpiVHFvZHdXS2V2QWNwam5XTjBY?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: zxnKrL1RPpwdf87he43rvT7Z4Dr+8560YEUw4/Nj7xKAiywuJvrAOT/HH/kYhp4XSGcAdj9uZaLHhdexYaYV6LtlcSBwdnZft5WvE2XknU4dRnHKJgfqfVY05Vw60+6CsGpL53TD7B2k+61JkxYX6Gp71b/RnmL8nfvoKnxt8PaJ8oHyoH7QCSiG4Mb6EDqPFqUsbk2cxKs24VaHMe9XhLREQpVJNKQVSTYGtgeQ97lw4/DUVvmpp1RESUPUbL0hvdQzIzioQiordfyQeP6ZsMT25zlZz4te5vxkSUYfJPZyWAI3sqqALOA4OooMYPFVbFrr1SqkMi26ZzLDUUJm62Rigqo4IY2MsUDk6bxA2k6xZj54K57b26tLFTDadIfa/7Xs4OtdiX3Myi1HJMZhPdgTt2FpETw7tZHZ9m7qWY+sOIG5pHAYf+f9VrE70OvGDyWEmzu3JhGGjNbGauZwcUwwz1XVj8P6fNnXJnwn3gPkWj4MNABUCcv39uc4O9mI/YpY948Odi0e/k1dQJ6rW3FFWRUaNJV+u/GKV9F2KBmM9gmPg3pbx4dp4JiUMr2xX/fLjuY2yArdtFPfVDQCe3mWdGyy4Nead+SC/7BLdwUwAXoZihIeWwV1Cy7IOhVhdukhwqUGLGI5B9NZVZ9syIACq908iFEjiBZZ61xUHwxEsnsFwAmLW3cbR5alTfmOMRaIfD/EMg/KS6DvpM3AuMPOODxM+YjAjszwQVluzOPuLCcw1jzqR5cO8yxefcUmAQEpzQUm1oRliFtrdoTImT9U68koYNdRARbUimPFoB4rVsIgmAFk3CUa5PZtnYZB
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef08028b-d1f1-4f4f-3b86-08db1e7ac4c3
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:41:24.0435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Z0G7nkwh8XhhcxIjpVeRzkiLGgWFdZXYx/Gy7elipcxxRmbse34O8WgprxmkkB2MWcs5NiprUvYLydiun9Ay6P/A4pX9xMs5A43EnmuDvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7661
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_12,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060171
X-Proofpoint-GUID: f24LHzybfSpDuHms_myW-xzPbIlzRc2f
X-Proofpoint-ORIG-GUID: f24LHzybfSpDuHms_myW-xzPbIlzRc2f
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On 06/03/2023 17:23, Cédric Le Goater wrote:
> On 3/4/23 02:43, Joao Martins wrote:
>> Hey,
>>
>> Presented herewith a series based on the basic VFIO migration protocol v2
>> implementation [1].
>>
>> It is split from its parent series[5] to solely focus on device dirty
>> page tracking. Device dirty page tracking allows the VFIO device to
>> record its DMAs and report them back when needed. This is part of VFIO
>> migration and is used during pre-copy phase of migration to track the
>> RAM pages that the device has written to and mark those pages dirty, so
>> they can later be re-sent to target.
>>
>> Device dirty page tracking uses the DMA logging uAPI to discover device
>> capabilities, to start and stop tracking, and to get dirty page bitmap
>> report. Extra details and uAPI definition can be found here [3].
>>
>> Device dirty page tracking operates in VFIOContainer scope. I.e., When
>> dirty tracking is started, stopped or dirty page report is queried, all
>> devices within a VFIOContainer are iterated and for each of them device
>> dirty page tracking is started, stopped or dirty page report is queried,
>> respectively.
>>
>> Device dirty page tracking is used only if all devices within a
>> VFIOContainer support it. Otherwise, VFIO IOMMU dirty page tracking is
>> used, and if that is not supported as well, memory is perpetually marked
>> dirty by QEMU. Note that since VFIO IOMMU dirty page tracking has no HW
>> support, the last two usually have the same effect of perpetually
>> marking all pages dirty.
>>
>> Normally, when asked to start dirty tracking, all the currently DMA
>> mapped ranges are tracked by device dirty page tracking. If using a
>> vIOMMU we block live migration. It's temporary and a separate series is
>> going to add support for it. Thus this series focus on getting the
>> ground work first.
>>
>> The series is organized as follows:
>>
>> - Patches 1-7: Fix bugs and do some preparatory work required prior to
>>    adding device dirty page tracking.
>> - Patches 8-10: Implement device dirty page tracking.
>> - Patch 11: Blocks live migration with vIOMMU.
>> - Patches 12-13 enable device dirty page tracking and document it.
>>
>> Comments, improvements as usual appreciated.
> 
> It would be helpful to have some feed back from Avihai on the new patches
> introduced in v3 or v4 before merging.
> 
I am gonna let him comment but Avihai is definitely looking/testing it too e.g.
one comment he mentioned to me that I have slated preemptively for v4 too is to
remove the 2 unnecessary iova-tree.h includes in patch 7 (given that I removed
the IOVATree need at all).

> Also, (being curious) did you test migration with a TCG guest ?
> 
KVM guests only.

	Joao

