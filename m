Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907264DDF94
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:06:17 +0100 (CET)
Received: from localhost ([::1]:39514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVG3M-0001Fl-7F
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:06:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nVG0x-0007rt-BG
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:03:47 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:27982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.kanda@oracle.com>)
 id 1nVG0u-0005nO-Bm
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 13:03:46 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22IGF0BS017035; 
 Fri, 18 Mar 2022 17:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=YClLA6mc4AD7eEnGvjBAwal1il4Ml1flHRB/S1ezkIw=;
 b=G+UBvg7xJc8I57xLekhvHrbKYrN61hnigddXvT4S80QdU8jqauVEh5dzr0cP3J08Xjx4
 2gdlralEhVo21J47NHcy3EBNPsaklBgXnMrMeSnzlzXTHKQNV7EHzslxBi2IyACHaYk8
 7VFFOR7d6YoK1C+e5krQt+5UK/s/JvAkuas1NtzVEvEXuJIHN2auqyzAiRhWERzfUjF4
 2HCMTw+SAoKPLZA3sGLx3fFACaGpxR3vt93LJxDbelx5AwXVUuCB8N5R6wYuZjr8bPqJ
 DSiP7ubRBb3S9H3rbnf0ikZVq35r3gbaXn5AgoE88F3aUTOJwaJ/EVMa0YEjpIFFWOPl WA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et5xwv1ta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 17:03:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22IH03at062146;
 Fri, 18 Mar 2022 17:03:35 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by userp3020.oracle.com with ESMTP id 3et65abwhn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 17:03:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkP1AJTc5gtP9RlDk0Hik0Xte72AkkuazaYUyFyXxrYzOAaIuX6zXZXHT1v0/yQaFJn096B0tbKRoK/sCyN8yWRPOjrh5FBj4RKimtVYsCGL9gtIpWqOwoVijvjsal9DsWLKV/CIc4yNJFzXePRohs8/ZM/bGQ4Q1H2cejdEAYq4u/bQdApVc2lF6cUzoSk3E4y2CEhufzcrTQb2k9iWWHYVpIgp6AQ/N8eATDakimzBhYc4a9d6s3DIMz4gR3/U8ODKU56EW8KaDAKw4Gnx3h3RGvZddCfGtmIkCGFXTxi3uPMUHFwxAW6gtQNqekAayFjDmgNdK/9THi33LVFBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YClLA6mc4AD7eEnGvjBAwal1il4Ml1flHRB/S1ezkIw=;
 b=nspAGGpKwLL7vED3MqS/pfTqpt7p7J+ZoGSRL3it6mkz2Nz5TNHnM16/cEazN8FBeo8HDKm0QcIr8zj4FnefDC86bKeKASDvznbYmN5r/F0j3ZyG3AKTtzGY2cmswEYDjqTcGDihN6JZmobbY1Lpas5wl6+hDBJvkjzjZ0A4TsjjfZru0/8tyoppf2Bh6FZYWjh/AfIXbqzDCyiCbkl6EGWRbbwH6FphEYhJwN0ByRZGzl95esrXHNUjtTYIpH5NoUpOjoNLE9wsiyxcSOXbJgHo/AsQvY1aqqqz3JrZ1T5GLQVIDiQ6HmOXh1u7XW41t15nslCp+VHXtH5ywENfYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YClLA6mc4AD7eEnGvjBAwal1il4Ml1flHRB/S1ezkIw=;
 b=dHEy95QEzzfmxVKwr9Ax9+VsyoOCsJ08JBGlOIpgVHyumY0Yyd8dYMON3zLeVKL3hsR0S67SwhP3595ks0FRmhiShtmhN9mbbDoAx1IAkrQKsqUe2f6HuK9+q6qS5fuaUes1mP+VQNKPDt5K3Ijb4c7QwwhUoPs9YL5ZLSyknVY=
Received: from MW5PR10MB5825.namprd10.prod.outlook.com (2603:10b6:303:19a::11)
 by BN8PR10MB3300.namprd10.prod.outlook.com (2603:10b6:408:cc::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 18 Mar
 2022 17:03:33 +0000
Received: from MW5PR10MB5825.namprd10.prod.outlook.com
 ([fe80::5915:58a8:f9b1:a71e]) by MW5PR10MB5825.namprd10.prod.outlook.com
 ([fe80::5915:58a8:f9b1:a71e%3]) with mapi id 15.20.5081.015; Fri, 18 Mar 2022
 17:03:32 +0000
Message-ID: <9bf2a689-7490-66d3-f091-e15d9648caa7@oracle.com>
Date: Fri, 18 Mar 2022 12:03:29 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 4/5] cpu: Free cpu->cpu_ases in cpu_exec_unrealizefn()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 qemu-devel@nongnu.org
References: <20220318151555.381737-1-mark.kanda@oracle.com>
 <20220318151555.381737-5-mark.kanda@oracle.com>
 <780af3a1-018b-92b1-6fbf-b27cc711bef0@gmail.com>
From: Mark Kanda <mark.kanda@oracle.com>
In-Reply-To: <780af3a1-018b-92b1-6fbf-b27cc711bef0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:5:333::16) To MW5PR10MB5825.namprd10.prod.outlook.com
 (2603:10b6:303:19a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4eb7b900-a749-4fc3-a69b-08da09013bb3
X-MS-TrafficTypeDiagnostic: BN8PR10MB3300:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB3300AFD286C51A559084015DF9139@BN8PR10MB3300.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g6zAZ6VAvFNAjBPkKHFloY7yr816j2uagfPJ6Wto5AxaY40Uw7BTtZlFLkWts0TfPFJEFhB9t8yZP+FLZ8c10QqqjNsCiX9IQT/9VmMhfV58ky2uzzR7uBL1iE8WTHPHyEK7OWkhJAQ6tK+uktwK3A/+/X7J6AKE4woD2PN/cE0q3gGxQMLbqyRA8EdY5jmzMSCCMgrFvAgwDNELeinVRBmGLS4t024sPwLzrHAc9ATsgomSj4W8Kc2yYpGDW3rm29ltNiPLNK3itKFvZnTzmWVXsz8GKcma3yjQjkJYK4er6hCMEPp2PwOTbo3kfP6LoMTe8EobqFcEDmGscsXc2qinI1yJshE1WqO5MsT1MOCuEB+in0aBoPLkIhFYcUSTR7y6yualx8V0Eddh6p0mfNdny059NGcy2de2AY4ao46yB8MXeerRbtbdgijUhm6gIqZpxCXd4nN9DETvY2vknbxRN5oRPKg54INaP6B9Py9KnWjj8X55oTk57QpDcpFhr18oyjHLVSd0qFI2B4EtwbbIoix8pjfrA6Di1RjZlaFnbFs+vJB6BpUWz9vw6iGZ6+/AJMhTxzzV3jWnMlQzYM4EI2IXxyYRs4edzFRkDNlcdmijPdja6tmvvp6cIpu7rcwKLBwJMS/22sqyHIGDFacQXzRYyRUju4ElU4A2Ddh5NcnFigWHc+UU10vnyCdDBBmjSiDgd5KdQF1ag+1eexinKDPi+q/KP4Xx1SxB5QCwCBYtgi6utyfDCiC57OAD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR10MB5825.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(44832011)(2906002)(53546011)(316002)(86362001)(2616005)(6506007)(6512007)(31696002)(5660300002)(38100700002)(6666004)(4326008)(8676002)(508600001)(66946007)(186003)(66556008)(66476007)(6486002)(36756003)(31686004)(83380400001)(26005)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cytCOXZsdmR2eDkzNDVldDNzVk1FblpYVnJMbEhyOVpZK1lTRU5tU3JzUGJk?=
 =?utf-8?B?TVZOS2dHUm41VDVDTnhBSms3N3hFNFByWFU4VHBVMUsyR1VGQ0VSeTBFc0dW?=
 =?utf-8?B?QWNQcTBwRDFoVGZMTzZFS2lZSWNJTldDanpIVVppbU92a0U5M2F5VVhmRUk1?=
 =?utf-8?B?bVk0aEdSeldNTFg1M2hrQWZBOFNKYWxONFU0Mm0xU21neG9uSXU3Rk04a21n?=
 =?utf-8?B?S0NMc0xiSmtvNXJrRWRBNXdsQ3ViQWtNV2Z3SlBadUdtZ3pXZFo3Slpackxk?=
 =?utf-8?B?a1JLUWx0UGp1T3ZjOXBUcnNKYjczS1BMZHdCdGhEQU1ZOUJyOXBhSVhSeXpl?=
 =?utf-8?B?emM1NG5VckdCb3hwTHM0S1NwWWNSczRyMUJZbDBFWURGMHFJZy9LZ2NuRUpO?=
 =?utf-8?B?YkFaaE55Y3Rjd2dvdzlKak9UWHRMWHBTQmJwZXhkd0M0Zk1tbUl1SjBlaTJW?=
 =?utf-8?B?NW10VklES0JHYjFYOHFrTU1Lb2tldDAyYTN2ek85cjJqd0tQLzZvbjhDUVRt?=
 =?utf-8?B?alFJQVMxV3B1VHpFSkJqMGU2aHFKaEZMMSt2bTBuUUtqYm5TMElOR3hiTkow?=
 =?utf-8?B?T3NZQVI2S2dMdFo3SitwUDl0VjJzcm93M24xTm1qVDFRR1BsWElOUmZHYjdF?=
 =?utf-8?B?aHBMUk05ZnFyZTBFVVZpNmRmZmxURDJ5NmVrMG16YklweUFiNThOSUxNcWRZ?=
 =?utf-8?B?QUNyRVJwQjVLY1pmRjI4czFzNXk2aXQ3Q1ZXd1dzbDl6Wno2V002QTF5VVdD?=
 =?utf-8?B?d044Yk9xWVFmN2o1NEZvS1BhV0luS1VOSDRwYUZ0N0Q5L0NVVzM3YnVrNERF?=
 =?utf-8?B?NVN0Zmt5UFhaK3BNSENmZjladC9ETWpXb3RVVHFxOG4zTndJODJOck1md0d6?=
 =?utf-8?B?NFhOTk5mWU1MTjBGc2MyMkc5YWYrcHNYSDN3dUIzNzF6ZElyLzg3Y01jcnp1?=
 =?utf-8?B?QzQzS2xtQmJIMGtuVk1DMXpsRjVhdnNLVGgvUG44dE1UeUxRd0ZHZUlMSHVm?=
 =?utf-8?B?RXNoeFl0RUJQZmFJTnRpaytqcCtqZXp6TFd2RXBwdElyOEEzVDlwZWtiWm5m?=
 =?utf-8?B?SVlDL0x0WTV4c1owNzY4alFhNDJOcUpHOExyM2FqM0Fsd0N5Wi9lcDVSdUFJ?=
 =?utf-8?B?a0U3VnN0UnhuV3pMV0p2N3AwR0srV1V5bnlLdURzVUV5SnRNN0NYUXhJZy92?=
 =?utf-8?B?a2QxQWlLRkhxdExyM3FBWkVWeVNoL1cvUFN2M0thUE5oSVQ1WWNOTEJvZDN0?=
 =?utf-8?B?QTBCbm5CV3ZNNHBwbWVQWWphcjVibUVNNHh5dDY0TWlzcWdSbnJ5R09JVzMr?=
 =?utf-8?B?cWl3aUt3a015bEhCVDgxZjFPOEdkZmp2c3RPRS9yd3RKN3l1ZXduRmx1STVk?=
 =?utf-8?B?NmcvSFlpZTRabW9QNUlIdFlEU2thQm05YmkzN1ZIb0lKSVY1RTROQ0x2dlRE?=
 =?utf-8?B?NDNIS3diUjNGVStZZ3puU2lvK2Zsd29mc2pkeFk0NTEzeTVrT2hvK0ovNkhT?=
 =?utf-8?B?R3BHSE5tWDUrNTRCV2JEV2ZyWksxR1o3eFg0bkFGSEoxb3FPeHVhd2pYWG5z?=
 =?utf-8?B?Ujh0Y1c2RWVFTUNOQTl3RFRtN0lESUpEeEtSZ0JNUnpVMlJhRFA5UEZadWZs?=
 =?utf-8?B?ejV3VzFnOXgxRmh5UVVWRU40elk1UW4xTGt5dVVvNitxRmZmTFNWMFpKU0E5?=
 =?utf-8?B?ZkZXQW11WTRSRExhWU42dk15VXhlV3JwNVNVRk9oVlBuMGZPdC9JaDdicmI5?=
 =?utf-8?B?eC9YNGlLUnRKQk8zMzhZai82WDVYRjd4R28zV2pobjNaQVR3S3BqVTlqU0ky?=
 =?utf-8?B?bFE2ZDhmSDdSaTk3Q0c1VHpDNE9XTTR0YWlSOGtybUJ3U3kySzZ1c0dJRysx?=
 =?utf-8?B?UmY1OXNhTzBtM3pobDlGUEROM2FUZ2RtNlgySlNkakFmRlZPeEJrT1gwaTJ5?=
 =?utf-8?B?S3JZSE9lckFQQTRuWEI4SjNOSjNiUTFpeXZhYVdVQlhUSzQxWURZOEJwWjJV?=
 =?utf-8?B?bVdydUJqeXFRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb7b900-a749-4fc3-a69b-08da09013bb3
X-MS-Exchange-CrossTenant-AuthSource: MW5PR10MB5825.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 17:03:32.9311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZGWtrGJ8lQKJS0TxDHV05xtoHcOkgYrjTnv13mSwGNeS87kgA4l26gdVGvL5OHj+VcU73HWxowGdqfV6vYcow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3300
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10290
 signatures=694221
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180090
X-Proofpoint-GUID: M_KrqD8abHreJAlB6FKdJagkH737vOX5
X-Proofpoint-ORIG-GUID: M_KrqD8abHreJAlB6FKdJagkH737vOX5
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/2022 11:26 AM, Philippe Mathieu-Daudé wrote:
> On 18/3/22 16:15, Mark Kanda wrote:
>> vCPU hotunplug related leak reported by Valgrind:
>>
>> ==132362== 216 bytes in 1 blocks are definitely lost in loss record 7,119 of 
>> 8,549
>> ==132362==    at 0x4C3ADBB: calloc (vg_replace_malloc.c:1117)
>> ==132362==    by 0x69EE4CD: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.5600.4)
>> ==132362==    by 0x7E34AF: cpu_address_space_init (physmem.c:751)
>> ==132362==    by 0x45053E: qemu_init_vcpu (cpus.c:635)
>> ==132362==    by 0x76B4A7: x86_cpu_realizefn (cpu.c:6520)
>> ==132362==    by 0x9343ED: device_set_realized (qdev.c:531)
>> ==132362==    by 0x93E26F: property_set_bool (object.c:2273)
>> ==132362==    by 0x93C23E: object_property_set (object.c:1408)
>> ==132362==    by 0x9406DC: object_property_set_qobject (qom-qobject.c:28)
>> ==132362==    by 0x93C5A9: object_property_set_bool (object.c:1477)
>> ==132362==    by 0x933C81: qdev_realize (qdev.c:333)
>> ==132362==    by 0x455E9A: qdev_device_add_from_qdict (qdev-monitor.c:713)
>>
>> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
>> ---
>>   cpu.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/cpu.c b/cpu.c
>> index be1f8b074c..6a3475022f 100644
>> --- a/cpu.c
>> +++ b/cpu.c
>> @@ -173,6 +173,7 @@ void cpu_exec_unrealizefn(CPUState *cpu)
>>       if (tcg_enabled()) {
>>           tcg_exec_unrealizefn(cpu);
>>       }
>> +    g_free(cpu->cpu_ases);
>
> There is an API mismatch here. We miss cpu_address_space_destroy().
>
> cpu_exec_unrealizefn() then calls cpu_address_space_destroy(),
> and cpu_address_space_destroy() frees cpu_ases.
>
> Otherwise other cpu_address_space_init() calls will keep leaking.
>

Will fix in v3.

Thanks Philippe,
-Mark


