Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A76A515989
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 03:16:54 +0200 (CEST)
Received: from localhost ([::1]:37448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkbjB-0006Af-1p
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 21:16:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nkbfv-000466-W6
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 21:13:32 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:1562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nkbft-0007QW-Nu
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 21:13:31 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23TKhk1V011396;
 Sat, 30 Apr 2022 01:13:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=RtKULZKfiFGMcHJEQjhaiEK+opo1K1ZUUBRMmh4Rz5U=;
 b=W38MRyhKZej4WZFdHntHvjdXnnRSKylDaPagKZ105NJUUUQlbbnDMzDzTOf2kNce//GZ
 FcatoxLkV+vG3RIGhJZb45GKDJ4KIR85tj1LVsXgUklp1KB07IQSnsjaMwpoj5mhVcfp
 CEPynPoFCbMCsmqqyO7dn0f2/wijGkMwJnqqsvO+8N1a+NyADmXWmA4q91MjruLd1sJ7
 HAlhkBcmJorOiuevTDjPNJmYEbhNavSsx+zN+bOfmbYQuidf14NSb6zCgO12YhFqSCZu
 Q7LxEW8Ff9Rhq6jhzNAcgnHcKy7ilXwK0aIHLdGxO6EiYvkg/F/uqJEwTVUAMj0xmcyz cA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmaw4r7d7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 30 Apr 2022 01:13:26 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23U1BGGN025440; Sat, 30 Apr 2022 01:13:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fm7w8mv08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 30 Apr 2022 01:13:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5W0RTXlRTfhDAF/W5DrCbwc/kXzoANzCpuaDIk2tws8QMUddO24db0A9w8znch//ZfQlm/lphLWnLkqjjzbV5rf3qk68s+wW4Wch66TXNsH3BS7wZaILFbUSoxSKt+A/N5xTdUgCpQ5BGDoK/xcmC5bTLXyZCfUdSeYVpUD4Qnn2w0dnBbRqGWCogXKGmIw/cS2flRzIGw1m7/NI+hwDe6V+h/c32Io1+we2qkRbKaZASScvzAcQ2itjXEOekq2qt8Ey/JMxxdUbblnJLWtlwGoufWUrRb3cO0vgRCjiVzciaBRMHceJ9plDhywWz+AU7vcy8kGTtptCGY8lVpbKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtKULZKfiFGMcHJEQjhaiEK+opo1K1ZUUBRMmh4Rz5U=;
 b=PLpoMVfUZkx9wKKyUqBiU3KnZkp6a+8uoxP0gM0y7fJNrr76dRksu8fszzf4n+Bg4ut1rj/mFSSJsdNUXRHL4I5i2ExxKuwebMJU3Mxgt54YBUhsiLRzLh6s3+lSEMW8BnlxZik7jP+occnsIErE7FCDxJo4n3o1ayjmLWXuXkJIId1GvhbP+v6jUOdQgcWXP6I2zEUIZtyQoXlgwpx2W6iB67Ws8uTzSvQqsUt7UXEh6nKtISiDpPTGBHGuCGkvFqPokTpUAsaTc1Qr0deFS4Ws3ActkKUogEppJ+j/gAJsFis2yoC2UDUsaqTI67a4MJT5TyN2WB8rH5H2LEVynA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtKULZKfiFGMcHJEQjhaiEK+opo1K1ZUUBRMmh4Rz5U=;
 b=OkQrIuQDHC//zA55HbzheyC9vv4uDYRy7exfItA74LyT0EGt2hXtlmLs5nGVQ/swxyE3ZgNR5wDZNG3D7wNYrKsaUnHXCeWYj0jopBRxk33QEtkTqob2XRA/jyLukY07IAagLGJ4q6n67ayINrjwyNIHHCGQ9BM6EIeKJIM3258=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CO1PR10MB4403.namprd10.prod.outlook.com (2603:10b6:303:9a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Sat, 30 Apr
 2022 01:13:23 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5206.013; Sat, 30 Apr 2022
 01:13:23 +0000
Message-ID: <fafd369b-f00a-efc7-6237-7c9d70cd87e4@oracle.com>
Date: Fri, 29 Apr 2022 18:13:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/5] virtio-net: align ctrl_vq index for non-mq guest
 for vhost_vdpa
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <1651048216-3365-1-git-send-email-si-wei.liu@oracle.com>
 <1651048216-3365-3-git-send-email-si-wei.liu@oracle.com>
 <ba73db72-c8b5-0028-bf15-56dba91af7b6@redhat.com>
 <CACGkMEsyAXvtyVQPNheoZizC249tbnPHN0O0HjyMLzps7B8wMw@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEsyAXvtyVQPNheoZizC249tbnPHN0O0HjyMLzps7B8wMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0026.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::39) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bc28455-84a5-4692-fe59-08da2a469f3a
X-MS-TrafficTypeDiagnostic: CO1PR10MB4403:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB4403FDD18E5BA4B2AE01A326B1FF9@CO1PR10MB4403.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hywxck+tfb6oiywvvSpaubIV7/JggcWFvosGVlZcI0PgHq1Ip+X72DtZ+ok6FAEFZrn9EQw0TbVvw7F1sZ1stREepRakRGn3ljNJ6sPhziITgj4mIDSl4mBftvy1h88vgK9jWl6KUY4AWDJoLzgLHMNrLp/SK90f7FzQaM6UsuFJCg2h17YIkOQxx75JqysgnyhyCuiZyQtBjJDgTrJ/tgkmdwEZpHdjmwXLGHQg/8k4xgstlpGW+EXUcjyW1D/dOQN9kxbIi52llrCoCXRKVnBCp+eeNDnGJ38tMxbvWHocWo2Eb5zkdS69B267ZaaHc6zEhJ0PPu9riykCHUNTghQFxM0fI5lgidhEUtSb1mKpulXMzmi0w0tKi0Llwiy6vwCEa7X6yJzmEWS3dzmYaItFwfj3ABYs2jXS16jtBgyjkh4czvGOUx0wTOqXEoxGJojvg7Tuqa/yAv0T2dUOPl/HZ6dwKO9aRpQlZpsqLJgj1xxsrwJ6CZURwRme6JhI78onaN3FmqrDw3T/xMUYGhsAZSG6C2vX1PIMOfgu1SA1tEHbtL6Pbhc/fW9NTFI3lAROI2R+POJkfKzaG1wNWbG5viIfrm3A4mHA4TgDRiCZg79Pi6MmPPPk6HQRUW0plCxIoSSEa/w5NQeDW5cM/p/os06c9P9XUC4U4s9r4DixdoHerPA3VPruGrHhToWyBwALpIaSpQ6c6tv+5XNk+i12DTS99ZeD13q/A9sP5POxmimt0JvflEPLd27JsGYs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(2616005)(6512007)(36916002)(2906002)(66946007)(26005)(6506007)(53546011)(4326008)(8676002)(66556008)(66476007)(5660300002)(38100700002)(31696002)(316002)(186003)(36756003)(8936002)(6486002)(86362001)(110136005)(54906003)(31686004)(6666004)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmtpSzV4L1IzU04xZnVlSTBBV3lxV0tTaWRKK01mRXJyWUNBQnhOMEkvZ3Nx?=
 =?utf-8?B?SXRFVWZLWWlPTVp5Tks5L2FOcG5NS0d4L2tLUUxkOFhobFlmYUZudGtIbi9G?=
 =?utf-8?B?MjFhSnlGdzQyZlN4SzRhdlVnMmhZR0dkbnF6dkN4OWx5QkdTeXNob0NNVUdU?=
 =?utf-8?B?NElyRk9ibkZ0YUNqRWFuV3FqWW1BQlVjOHgrT01LY2lLckpxR2VnMnI3Y2VX?=
 =?utf-8?B?M0VleVhkdTY4dk9zWStOMnNUNEZSc1A5OGNITnJoOXFwMWR5a2FUVTRlWDRI?=
 =?utf-8?B?d052Rnh3bWhCYmhMZnBQNU51WTVvSkdOR3p5MGZqNEgrS3c4Q1hRQmYxbElC?=
 =?utf-8?B?ZHpXSklhaFFoTnVES0ZoZ2FLZlJSdllNMlFJM0RacHhxbHRpSEgwV2ZtaVRF?=
 =?utf-8?B?b292dGdERTB6dFVhQVFSWm1WWFYwYWVJVmNYVGc2dnpLZzFiM0ZGSDFmUG1B?=
 =?utf-8?B?S20yWUo2S1RMNDBWWFd2b3pTTG53aEVVMGt5Wlk2c3ZkNENpYmpkdGkrbVJl?=
 =?utf-8?B?Q1I2cFZSd3Fva3V6YkN2cVljNVVLZy90Z2VWcitReUFjcU50Um1RL2RSOGRj?=
 =?utf-8?B?UzdNdkVZZ0YxUzJNNVg3dGErTDNpTTFpREgyMVcrREVUQlBDUm4yVVprR3RP?=
 =?utf-8?B?ZnMyQUJsQ2M4WXF3b3FOcGdJRVpHQU9HTkU1NjBwcFhaOGRCcXFMc2s4bGdE?=
 =?utf-8?B?bytkZDNvbjU0RCtlVWU1LzY5Y3BzcUp0eTN6VC8vdnhNYkVGQmNXOHJvMmQ0?=
 =?utf-8?B?TzgzNVlqQ1oyYzEzMTB5NHpnbzBNVkh2NlZqN053TXhCSVZlVyt2QU9OTTRi?=
 =?utf-8?B?clpVQWF3aXp3djNHYU5naU1GRjRJTnZBdkVEcnQ2QTIveWw4dTZUc0hRN0RP?=
 =?utf-8?B?djJiZDY0NkZkYnpOY2NnK3pCWWFlcEhYcmRZNHJ0aThtS2xmUkhyd2YxU2o1?=
 =?utf-8?B?Zm5kMXZDR3RtUksrVFRySkJLT282eE9aZVhYQWlzY3Z1NFQ3UFkyOFgrOFZz?=
 =?utf-8?B?TTZ6OCtoR0ozK0UvT3NxeFJxTUs4V1ExOEZiS0pCNVRLTnkwanllSzArWUUw?=
 =?utf-8?B?cmE2eHZOSzNwRFZqQXJjQmpoZm5IQWM3UVd0VWhQUFV4RmZ1OGlFaTdxb2Er?=
 =?utf-8?B?ME1hRVJ0ZGRlSWU1Y3J1MlJudVZUMDk3aTR2UWpZaSsrQ0VkNUNCTkFkdE9J?=
 =?utf-8?B?Q1Rpb1hNVEgwWCt0TXdWcXJHUDYzd2JpTEhEUmFiNzZ5OC9iOHR3Z3FtcmZW?=
 =?utf-8?B?dTlWQXkreU5WV1BQdkRkclBTeGFlRy8yVHdDTy8vY3RrdTJieTN5d3hJZ2tm?=
 =?utf-8?B?SXNyNkdzM29rWnFBVnR5bTF6OXFsUGRPb2RUZ0h6MlFZeXZCMnZDM2xIN01w?=
 =?utf-8?B?SUFMSUROelRod0pqSlBJQjMwNlk3K1g5NEZnaXZuVXFjMzI3VjYxQVJzNUNl?=
 =?utf-8?B?RWlGRGR5YkFMaXNmcGhpRXlVOGxveW9lQUhOays3aFhqNUJSKzUwUm5SK1lP?=
 =?utf-8?B?TWg0OUF5U2xJU01zckVPWEJnVkZiNkZBZjkrWTBwaTMyTXJqWlAyQzZrQkZp?=
 =?utf-8?B?SjY0MnZoeGgzWFJtakd0YkJBUmZnMFNXbWgxSVNwbEtFRzNaSlRjTWM3a09m?=
 =?utf-8?B?d1RYUFVadngwZkNpS3p5SGtHeXhEQzhYNXhHZStWeURWRS9VRHR6U1VCNXN1?=
 =?utf-8?B?eXh6N1UzUTdNQTRxMnQ2UGwvK2hnRkVwc1l3MmNtcXBHczZNZmhicS81OSt3?=
 =?utf-8?B?NWZ6VzRhOWllcHFrNnkvOHNOQ01WSDM5WTd2eC9ZUXhVSi9oUzF0T3c2OHZZ?=
 =?utf-8?B?Q3gvd0RENnZPRHJBQU41Z2RZSmNUT2FrY2FJNkxvSWkwUXZZaDZCSzlNeklL?=
 =?utf-8?B?QmtUODB4UnJiby9iRVJrL0ROb05vMWdDU0txY2tWcnVzQUIxclZpNmE0Z1BV?=
 =?utf-8?B?RzlFdFpvSzd5akZFSmhLb1VodVRzaHJ4SjZ6UUtLYUhjdVltcjcwTWtDZUMv?=
 =?utf-8?B?elg5V210ZHJZTUNLZGpHNzFpR0NNVmpaT21KdFdCRy9ZRWY5a1pic29kWDl2?=
 =?utf-8?B?R0FaenEyWjJ3RnBnNEtOdSt0S2ZRUEQ2ZFF3ck1xcGNUbXZxd0pqRlZGaVpZ?=
 =?utf-8?B?Tlo1bFpmVlQ4elR6a2JwcnVGckZKaG5ONlZrS2VGMkVLWFViOGpRWEVwZmtz?=
 =?utf-8?B?QlJadmxIYWIzM09HazZpb3h6S3pXSzFHUWE4WnBXQjFlMUVzT3QrTmdEdHdP?=
 =?utf-8?B?eEVIdDVsRG1tZnlZbEM1bTdCZ24yejlHYUpyM2MxZjNOVGxmRk1oRmFaWElU?=
 =?utf-8?B?K3paMHVRL3FWVW01c2lZZm1pem9ienRaQ3BwYUZ5cHFYcDZCcVpmbXRyaVB0?=
 =?utf-8?Q?IAw4OPyofz8Wp7wA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc28455-84a5-4692-fe59-08da2a469f3a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2022 01:13:23.5117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ATaiDA5qMp16zsdCkrUb5PRBVVZndoilg0cjvk+FwmU5g4r3o64KvTDA3o6FDiaaW9CCgosVOw3aIQZQkWpkOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4403
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-29_08:2022-04-28,
 2022-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 adultscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204300005
X-Proofpoint-GUID: wMwGz4TWkEcF3uBP6Gactp_1pDeOszWp
X-Proofpoint-ORIG-GUID: wMwGz4TWkEcF3uBP6Gactp_1pDeOszWp
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
Cc: eperezma <eperezma@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Eli Cohen <eli@mellanox.com>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/28/2022 7:24 PM, Jason Wang wrote:
> On Fri, Apr 29, 2022 at 10:24 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> 在 2022/4/27 16:30, Si-Wei Liu 写道:
>>> With MQ enabled vdpa device and non-MQ supporting guest e.g.
>>> booting vdpa with mq=on over OVMF of single vqp, below assert
>>> failure is seen:
>>>
>>> ../hw/virtio/vhost-vdpa.c:560: vhost_vdpa_get_vq_index: Assertion `idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.
>>>
>>> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
>>> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
>>> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
>>> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
>>> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
>>> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
>>> 6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized out>) at ../hw/virtio/vhost.c:1557
>>> 7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=d@entry=0x558f568f0f60, n=n@entry=2, assign=assign@entry=true, with_irqfd=with_irqfd@entry=false)
>>>      at ../hw/virtio/virtio-pci.c:974
>>> 8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=0x558f568f0f60, nvqs=3, assign=true) at ../hw/virtio/virtio-pci.c:1019
>>> 9  0x0000558f52bf091d in vhost_net_start (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
>>>      at ../hw/net/vhost_net.c:361
>>> 10 0x0000558f52d4e5e7 in virtio_net_set_status (status=<optimized out>, n=0x558f568f91f0) at ../hw/net/virtio-net.c:289
>>> 11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=0x558f568f91f0, status=15 '\017') at ../hw/net/virtio-net.c:370
>>> 12 0x0000558f52d6c4b2 in virtio_set_status (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at ../hw/virtio/virtio.c:1945
>>> 13 0x0000558f52c69eff in virtio_pci_common_write (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized out>, size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
>>> 14 0x0000558f52d15d6e in memory_region_write_accessor (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, shift=<optimized out>, mask=<optimized out>, attrs=...)
>>>      at ../softmmu/memory.c:492
>>> 15 0x0000558f52d127de in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, size=size@entry=1, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x558f52d15cf0 <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) at ../softmmu/memory.c:554
>>> 16 0x0000558f52d157ef in memory_region_dispatch_write (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, op=<optimized out>, attrs=attrs@entry=...)
>>>      at ../softmmu/memory.c:1504
>>> 17 0x0000558f52d078e7 in flatview_write_continue (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at /home/opc/qemu-upstream/include/qemu/host-utils.h:165
>>> 18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at ../softmmu/physmem.c:2822
>>> 19 0x0000558f52d0b36b in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>)
>>>      at ../softmmu/physmem.c:2914
>>> 20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=...,
>>>      attrs@entry=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>, is_write=<optimized out>) at ../softmmu/physmem.c:2924
>>> 21 0x0000558f52dced09 in kvm_cpu_exec (cpu=cpu@entry=0x558f55c2da60) at ../accel/kvm/kvm-all.c:2903
>>> 22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
>>> 23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:556
>>> 24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
>>> 25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6
>>>
>>> The cause for the assert failure is due to that the vhost_dev index
>>> for the ctrl vq was not aligned with actual one in use by the guest.
>>> Upon multiqueue feature negotiation in virtio_net_set_multiqueue(),
>>> if guest doesn't support multiqueue, the guest vq layout would shrink
>>> to a single queue pair, consisting of 3 vqs in total (rx, tx and ctrl).
>>> This results in ctrl_vq taking a different vhost_dev group index than
>>> the default. We can map vq to the correct vhost_dev group by checking
>>> if MQ is supported by guest and successfully negotiated. Since the
>>> MQ feature is only present along with CTRL_VQ, we make sure the index
>>> 2 is only meant for the control vq while MQ is not supported by guest.
>>>
>>> Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
>>> Suggested-by: Jason Wang <jasowang@redhat.com>
>>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>>> ---
>>>    hw/net/virtio-net.c | 22 ++++++++++++++++++++--
>>>    1 file changed, 20 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>> index ffb3475..8ca0b80 100644
>>> --- a/hw/net/virtio-net.c
>>> +++ b/hw/net/virtio-net.c
>>> @@ -3171,8 +3171,17 @@ static NetClientInfo net_virtio_info = {
>>>    static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
>>>    {
>>>        VirtIONet *n = VIRTIO_NET(vdev);
>>> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>>> +    NetClientState *nc;
>>>        assert(n->vhost_started);
>>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
>>> +        if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ)) {
>>> +           error_report("virtio-net: bogus vq index ignored");
>>
>> This seems trigger-able by guest.
>>
>> Other looks good.
> Btw, it would be better to add a comment to explain here.
Yep, will add.

-Siwei

>
> Thanks
>
>> Thanks
>>
>>
>>> +           return false;
>>> +        }
>>> +        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
>>> +    } else {
>>> +        nc = qemu_get_subqueue(n->nic, vq2q(idx));
>>> +    }
>>>        return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
>>>    }
>>>
>>> @@ -3180,8 +3189,17 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>>>                                               bool mask)
>>>    {
>>>        VirtIONet *n = VIRTIO_NET(vdev);
>>> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>>> +    NetClientState *nc;
>>>        assert(n->vhost_started);
>>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
>>> +        if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ)) {
>>> +           error_report("virtio-net: bogus vq index ignored");
>>> +           return;
>>> +        }
>>> +        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
>>> +    } else {
>>> +        nc = qemu_get_subqueue(n->nic, vq2q(idx));
>>> +    }
>>>        vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
>>>                                 vdev, idx, mask);
>>>    }


