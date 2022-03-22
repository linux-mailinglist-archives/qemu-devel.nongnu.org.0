Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8914E3F3A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 14:14:12 +0100 (CET)
Received: from localhost ([::1]:42978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWeKx-0007an-1N
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 09:14:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nWe0G-0004W1-B3
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:52:53 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:24068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nWe0D-0006S2-Nr
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:52:47 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22MA9HMl001496; 
 Tue, 22 Mar 2022 12:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=5FUVLJ0Uw0eqSLxEIc0BLCsJC3BVBdWEfJSyK0a2Ht4=;
 b=mgTFA9lWz4pDhEMoHPJCmef9/TBETyFBDaK6lNqHnwjo5d+8vaAVtY6Kfgu/5a5ofCeH
 ngjzoLL99ylfkoQsJotrV/VAF3sixWf6DQnkqwRnGRGupBCMNLseELjQnLe4whVakXEl
 CzcUHqOyUE+90MBV3TZPBFO4HQb/zuFdCHVIfSisFWgI/ZVlA9ezxlGtV/ovK/39zINq
 f4LsgRfe38QmnCmrBVf9WtwRaceDF/2cLG6wcZWMdG8d3gXKiW1oHPY8jQs4U7lzE0FT
 Nz/z+GT85kRyfRkJI2gDAIz3XP9Gs4XFZvB00duVAe/O6/ALqBd+HV28W+sm9WUhmMLZ Hw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80] (may
 be forged)) by mx0b-00069f02.pphosted.com with ESMTP id 3ew7qt6b07-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Mar 2022 12:52:31 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22MCpDAV038141;
 Tue, 22 Mar 2022 12:52:29 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2042.outbound.protection.outlook.com [104.47.73.42])
 by userp3030.oracle.com with ESMTP id 3ew49r6f0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Mar 2022 12:52:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkYwQgpTric8GTwcOra/VC2rNm/yuDKQpLKkP3G5broSTBvX6UOFLTKG7Lp+L7+2hYMCMy0C9EKYaVJ8cRCRadOL3Mj3U7aqOJZfOua5FesAvJPyALe9cLP+mHUdsLFMUYiCshJamRcd7tuGnPQ15EZxLDbjPoEWE2CBc/w2yJYjWBisaV1DogoZ+8BhufHT/b/OeSM24T+AcMRq7EXfHgaNwofbYA2hcdHuqeFuJBj1EB+Nykb7yxAp7rYJACebTer7ZFhBXYQ6IjdR2jzm0cgcocpJdEM5XX4jOCzZPvg79SQFuq9tTN/0M21hbxmPUmTvkBdc08uCN0c6JDaIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FUVLJ0Uw0eqSLxEIc0BLCsJC3BVBdWEfJSyK0a2Ht4=;
 b=Hlxv3ceEI32XsgyIRPcWtd9Ev7o5dUPL8A+i8Ox8MU5PWpNE5kS71HWPIF02RFjv/6eh8xuG+o4/Wwn9cTCPJ4gOnd9jnGNUwToUShLMHIfymxOQvKHrNyO+ZCuYJwRKtoO41EhJsXurAqyJtuJkFhsnPB8O1efwvSPywK8jP4AKanX7L9P5zdrsJh2FeU+//QpGCuSDZ6E4XwgEkiO0oVvZfG/dE1c1DBX5QJc1T+h3ba32GaonDDmkMfGX4yzBs5cKHmLdJwWO4JTP3BOk2BtEwa/qCxYaZOHDfiLkpb+s/UYuGbBSjgPOOyBTmkqiTmOTzigOpxVAq+2UgLf/Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FUVLJ0Uw0eqSLxEIc0BLCsJC3BVBdWEfJSyK0a2Ht4=;
 b=TlALZXIdbMNohYd5C8t9loa66LH34z5ZHnRfWB3VHqV/g6FWY5tfBzamZ1FgsKqq8y+/eYWqBbN9/esqVet5095PmLUNAUdoxIGN+ecnSqcYk0keNFcMA66xad6PC7E//YU7CfSv+hJlJlnRH4P8+APZttH0prIaHBppsN2dyS8=
Received: from SA1PR10MB5841.namprd10.prod.outlook.com (2603:10b6:806:22b::16)
 by CO1PR10MB4642.namprd10.prod.outlook.com (2603:10b6:303:6f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Tue, 22 Mar
 2022 12:52:28 +0000
Received: from SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15]) by SA1PR10MB5841.namprd10.prod.outlook.com
 ([fe80::85a0:903e:852d:6c15%5]) with mapi id 15.20.5081.018; Tue, 22 Mar 2022
 12:52:28 +0000
Message-ID: <41ab0621-fd01-9d1e-f8f6-d434b80aca8e@oracle.com>
Date: Tue, 22 Mar 2022 07:52:24 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/5] softmmu/cpus: Free cpu->halt_cond in
 generic_destroy_vcpu_thread()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 qemu-devel@nongnu.org
References: <20220321141409.3112932-1-mark.kanda@oracle.com>
 <20220321141409.3112932-4-mark.kanda@oracle.com>
 <652c4cf9-65d4-33fb-805e-07d156271ccb@gmail.com>
From: Mark Kanda <mark.kanda@oracle.com>
In-Reply-To: <652c4cf9-65d4-33fb-805e-07d156271ccb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0201CA0066.namprd02.prod.outlook.com
 (2603:10b6:803:20::28) To SA1PR10MB5841.namprd10.prod.outlook.com
 (2603:10b6:806:22b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 228fd4bc-6147-424b-7deb-08da0c02d1f6
X-MS-TrafficTypeDiagnostic: CO1PR10MB4642:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB46429332DAC7593DBD1F49B3F9179@CO1PR10MB4642.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y3/xtLFSgBJUewTLB82fEPt8sDI20+WtK3KnHNAkZ5wFnrxabspYnbPe7XTJYsGtLDArKg0+UES3FrgCojKm7kY5Z8ikegSGmwP/2rOt+2gsLJ3eiAj2Jaa7GNPDdsE21N+I7TMHRYcL7wG1ZeqRnIIvd1PcFgMkFbbu+PPtyZwRk7objcbOCuU98LQ1zVCaLnVovoPVBIz248vi1P1y4HObBwD1bNJLboZ4VaDiBBYaUQLljpmf0Uh5oubkAj8dK/5pMvlsbcKBvIQt+994pW/56FyHhK5uOl0KkQVg7666RN79MKXNkdB3LbEO4ASGi9VUPJOnC88+HRvvFmQswiCAJAm8qIx6Kbl6S1wqjtpF6ps/YZalG1oYpbuX//fGv0y9J0AKokTjlTuHbXYMoMgy0A2WurTyfe9YNRJ2eFJHKt14BD+yOKPdNca/g1HDPCWyG42fsPp3VmfbclhkIwD8yQZTgWYnms9HvqT8EAZaq8ly6ISau51hk7EjSSEsPEqKliMb96ZQ4ZW08O3VuCaJJZwFTS+VXx394Pt+S1VCCRhxVKWw82zUwhrshWcr22bsB/rpVLXhvV/q60JeMGDLYZCNgKgWOggIJ/R8rzaMzBOe1Ci4wEWBQCjvHX8jvb9WUNAZatfNwRlqMfnveQfrSjqpY3v9dI0xq2l7pYat41Xaf+nVRmU2vLTypuYNt2PyKp7KNyeLxS6U1LW6TZW3hISqIK2zZnRtOFF1L+E4gkTWIV/1fqx49latIDgAP9/8C9YXgwlfvx9tUnopKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR10MB5841.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(4326008)(66476007)(66556008)(8676002)(66946007)(5660300002)(8936002)(83380400001)(316002)(6666004)(38100700002)(508600001)(6486002)(44832011)(2616005)(31696002)(86362001)(186003)(26005)(2906002)(53546011)(6506007)(6512007)(36756003)(31686004)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ny9WTjR6NWkyaTRLaFk2aURRa3Z5aEVuSjd2Z3I4K1IreE8raUl4dUs0TnRN?=
 =?utf-8?B?a2lXSUJ5cHNmMHVSM1RNcnQzUEFjNHJreUZaZnE1T3BKdjhXMDhJVHJZYndM?=
 =?utf-8?B?TGhCSFpMc2dsV2JFc0VTdVJiaW5oRFBuSklCK25YNkVJSytwZWRrbS90VU5n?=
 =?utf-8?B?azVxWFQvNVgwQTRldDREQ3FmaDY3MXh6MnhCaDVPdGI0WFBWR2xYdWw2M3NO?=
 =?utf-8?B?U245Znl3WXNISDdQVzhzczlSazF6bVZlWWwzaE45N0hyTXpBL3hXZjE4bkV1?=
 =?utf-8?B?Q3E0VitjTGNaTE9oWENyUHJvckxzcXBHcDcxUmhZUTZ4cll3K1EwRk9DNTVN?=
 =?utf-8?B?TEp0NU9hWTBZUUl2L0tKV3FOZElVTmZGVmV5S0l3R1JpSDI3MUJlQXBlMGR5?=
 =?utf-8?B?R29ndTBFbDI0ZFduMFRIV2tBZ1Vaek1rdDliNzZnSEdpcFNIL2pzbHZmNkhp?=
 =?utf-8?B?Tm9lYmFENEdTZUxoN240L3cyMzhlN1Q5RGZrV051MGREa0szZVZwaWRsUDdZ?=
 =?utf-8?B?aXo0RGkxSzQ1bmhWQlRaYTlLM3JPdHRVZ1Y3MFIrcGNYc3M5dy8vWEQ2WWVS?=
 =?utf-8?B?MU9mUm90OE9hT3NCbWVnS1ZOT0tyeStxekErNHJqK0V2ZC8rMmxvRTZraEhN?=
 =?utf-8?B?TGRqbXFTQkgwRUhvSGRVcnVKZzgrMGtUNWlseVdJTHVQNjQ5SVdlbkY1dWhM?=
 =?utf-8?B?TjFheGhoOEF5OGNmZEVyUFEvNkNoTlh5a29Ka3YzN2RHcGYzMnE0QllKMkNy?=
 =?utf-8?B?ZDY4bzJZa3hxNzZxNUNoZU84a05sOCthN1Exb0xodWQ2NFlVbVRTMkxMSG1v?=
 =?utf-8?B?aU92T2VuUGlpeXFZeTdBTFRGSVZsc0FZVEtGNDRrWU5uZTdhbkw4T3Z6a0Rj?=
 =?utf-8?B?UVlGVUF3MzRCRm1VN2Q5T2piZm1Ub0dJZnV4OEhnT1krQkZtcUF3MXBsRVFr?=
 =?utf-8?B?NzE4OURVcy9hR25aYk42S0JYU2ZPZjVncFNXUEJtSEptcjNvYUdiMkdtbVVL?=
 =?utf-8?B?ZzlDNFlmK0c0SmVRUjdpa0VZQzFNTWRZeGxIMTFReFNETGFoMHcwUE5USktN?=
 =?utf-8?B?M1dYb0gxeXVWVEZCejNmTGNaY1ZRYTlnOC9JVi9GeTJtSFBQa2IyREhMV0lM?=
 =?utf-8?B?VXdWeTNrNHNQZ1ZrUUhZTjRhQmYwREVid0FXL1F5UVZwZ2V6Q0J6a2ZqZDNK?=
 =?utf-8?B?OUg4UzBMT0xSQlFNbGpXU3pqL1BRS2E5Zjl0MG53K3hLY283cStiSkplRUxl?=
 =?utf-8?B?emZTNG5ML2pTQnVqZmtQcElXRE5rYlB0MC96dnFxekcwZlVJVDFWU1doRi9z?=
 =?utf-8?B?aGJaQkZQTWFBS3d6WGxLUkltb1NBSjliSFY4OUFrM0cwd1ludHFreHFaeDE3?=
 =?utf-8?B?N0ZXdXFITjhCUzdjNmdrTnpOOWEvWU1JZkpOK0lqbkpOaWVZY2t3Z0JBMEhn?=
 =?utf-8?B?M05YZ3NqMmg3T0dOVlBwTDFkak1WbG1QVERDNEpNcmx3bC9jOW81bmowZkJp?=
 =?utf-8?B?Q2l6YWRHQkRXaDFRNjhBQmg2bmErUFRSdDZLRWRkcEhCajlSNFhXQlF5N0l2?=
 =?utf-8?B?R1RUbTMvdExOUHRNa09qa3VaTk44NlRWMEVqUlNpTHlIeXNxOWlXcWRuRFU1?=
 =?utf-8?B?ZzJLVWhiZWdHNXA4L1RMcWJhR2pVNFNuTFh0NlpSYXRYdDQ5VWZpTENORzc3?=
 =?utf-8?B?V1ZwNDdDWlBRN1QxOFFiL2lMOFY1UFAvMFkzYm01YzVpdjRtSHBPeEV3MEpR?=
 =?utf-8?B?eFFyM1VpVTU4TVQzZmprckt4bklzV2liK0xzLzdnUTFmRFJGNmx1RnZzNEh3?=
 =?utf-8?B?ZUFCS3V1bTRabWEwRGpRNk0rWithaG5KRUFxZnNsUHhpRnpmMkp6UEJweVU4?=
 =?utf-8?B?RUNNcDdSeEVkZldyckUzcE5POGtHRldRaEtsY2xRR2d1V3JWT25FM3I2NnM2?=
 =?utf-8?B?NmlBZEdoUkdzWDc1cWVhVkpBTTJNT29wdzZ6azNReW9qSWQxeHJHNE03QzNl?=
 =?utf-8?B?eW1KSXNJdHlRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 228fd4bc-6147-424b-7deb-08da0c02d1f6
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB5841.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 12:52:27.9500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AnNoa1xIwJShiEt2tOZUuupOsIZWSUc7g3LxQCE/ybGmKfm2rvzqQF/nDmX3XC6/MLVQwDVXJ3Vlb8rlwK9f1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4642
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10293
 signatures=694221
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203220074
X-Proofpoint-GUID: vycUWrDYrfPjt3TwzeCxHpUAtWaXJmOn
X-Proofpoint-ORIG-GUID: vycUWrDYrfPjt3TwzeCxHpUAtWaXJmOn
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=mark.kanda@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks Philippe,

On 3/21/2022 5:12 PM, Philippe Mathieu-Daudé wrote:
> On 21/3/22 15:14, Mark Kanda wrote:
>> vCPU hotunplug related leak reported by Valgrind:
>>
>> ==102631== 56 bytes in 1 blocks are definitely lost in loss record 5,089 of 
>> 8,555
>> ==102631==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
>> ==102631==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
>> ==102631==    by 0x924452: kvm_start_vcpu_thread (kvm-accel-ops.c:69)
>
> Here we want to extract a common generic_init_vcpu_thread().
>

How about I add extracting 'generic_init_vcpu_thread()' as a separate cleanup 
patch at the end? I'll also drop my xsave_buf patch due to your followup.

Thanks/regards,
-Mark

>> ==102631==    by 0x4505C2: qemu_init_vcpu (cpus.c:643)
>> ==102631==    by 0x76B4D1: x86_cpu_realizefn (cpu.c:6520)
>> ==102631==    by 0x9344A7: device_set_realized (qdev.c:531)
>> ==102631==    by 0x93E329: property_set_bool (object.c:2273)
>> ==102631==    by 0x93C2F8: object_property_set (object.c:1408)
>> ==102631==    by 0x940796: object_property_set_qobject (qom-qobject.c:28)
>> ==102631==    by 0x93C663: object_property_set_bool (object.c:1477)
>> ==102631==    by 0x933D3B: qdev_realize (qdev.c:333)
>> ==102631==    by 0x455EC4: qdev_device_add_from_qdict (qdev-monitor.c:713)
>>
>> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
>> ---
>>   accel/accel-common.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/accel/accel-common.c b/accel/accel-common.c
>> index 623df43cc3..297d4e4ef1 100644
>> --- a/accel/accel-common.c
>> +++ b/accel/accel-common.c
>> @@ -140,4 +140,5 @@ type_init(register_accel_types);
>>   void generic_destroy_vcpu_thread(CPUState *cpu)
>>   {
>>       g_free(cpu->thread);
>> +    g_free(cpu->halt_cond);
>>   }
>


