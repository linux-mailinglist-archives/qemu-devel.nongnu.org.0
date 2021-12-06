Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961FD46A13D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 17:24:13 +0100 (CET)
Received: from localhost ([::1]:48694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muGmi-0005Ep-6x
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 11:24:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1muGkX-00042u-MS
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 11:21:57 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:48318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1muGkN-0006FB-Qx
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 11:21:51 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6Fxcnb030145; 
 Mon, 6 Dec 2021 16:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=4vAXjEUgu6FLnqyTCFfBpvMgIcFvjhw7Ja/3kpo/Hss=;
 b=guTHY5zDYJFOe+lHjm/Q9LxKvvFRRgRMH8jA5S2jGEOfNqp9g1jz27s07513ttceuMlp
 zjjwTPOXS6CdDj8D/A+FV3+hMN5iq6ACjvCLvityKN5sz3BYwpBGe4YI7ICGLHJNMLxu
 s3U4Eq6bNKvk8TaGBRJFYYcZhbmtoKmZv7Y/fUYHRgPr/a0zzDZqJ6RxUCW2Y70D93LV
 rQ2k3NsOx7rxfGJC4HgtVGUMcVvaSjiJX01c5PQyYE9sT8Qs86+BI4qi082NfzPckda0
 CI1CkOvJDmlz4C4EdyMKGjRu0K5qyy9N8kwIcGxTkbgc28Nc2tZvIH6fBOkJvILBMSwd cQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csbbqk1rh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 16:21:31 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B6GL1ui104955;
 Mon, 6 Dec 2021 16:21:30 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by userp3020.oracle.com with ESMTP id 3cr1smasxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 16:21:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyKk0TIifOv2qPk7B8W8eTHO2Dm7r0tuMCGHIrXxw8QXoMZgrdGZhyWvxaBkMEWf+yD4WwqoEdgp+BjSD7rAxknBpeGnpARPtlZb0Rwmk7WhsartsugUv9YF575pfhZTX1nVKHgpZivSSATrbZqw1RSk3TR8DoIy1pUXUyi2PiHYr9E222x/YjQllyxitLcnHhcal9cBZEHYW46zHcNxN48w25cV/X8GQGHdjZm4RsBxcdK+9vQeybw4mydR/gPOLVyWVHR6W80toRqiXzVIJUQf6vIRzyCOF40z21VWRTaNqYSzPt4buPzKbAIb0JW4u/4WcJU+6mkdYEVrbGl0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vAXjEUgu6FLnqyTCFfBpvMgIcFvjhw7Ja/3kpo/Hss=;
 b=NfYsQH2plo9pjeW9v8ZEcQvD6xWr4cK1zoZP3aOTiAi3oEdl526OV1TiDd7i+ZJ7OZOBLo7K3GgyE04xAduRpeGf4SNTRlTd7MY4TMqxTZBRI3jME/bW7eUb2pVINepmXcJUiXCp6OlGvWuyowsAHB5AmArZGP/F41pVt5vP3xDXGgqeTcp7EBsHFa9Lh8DPTOB5UdH8qepfXgj/dbcz2At0j3RRnOczYTIngYAMNQLwMdyBdh8gHFXQLTn6NExS8Wv8qk3ycEqZsufmRfH/IN8TF1KU+YtOiVZnMaQgIJC4De74jzngtsIsN93MTqor0QDCediFXF9/KW9GZDAsjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vAXjEUgu6FLnqyTCFfBpvMgIcFvjhw7Ja/3kpo/Hss=;
 b=xFiVj41f7W/B8B1m0QXt3r42/t+7JbtLbXJXZn/HFCwWNEhjH8MC3fooD1gbnnW2TOgb/5S+YUew8HcEorYblForzxMYsergweW1aCdJF+REWcK4BPODSP6weRyvBoZR0C+ZqSGvV35+0FVyqugTXH/30UqaR7JpGBFeFFChprw=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1454.namprd10.prod.outlook.com (2603:10b6:300:23::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Mon, 6 Dec
 2021 16:21:27 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 16:21:26 +0000
Message-ID: <6a60706a-194c-2aab-9f80-44b82372bad3@oracle.com>
Date: Mon, 6 Dec 2021 10:21:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 05/10] ACPI ERST: support for ACPI ERST feature
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
 <1638472142-14396-6-git-send-email-eric.devolder@oracle.com>
 <CAARzgwyrfW8Dy_fow7nOr9nF9XTLazidiTqn9itPmoOZpMxu-Q@mail.gmail.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <CAARzgwyrfW8Dy_fow7nOr9nF9XTLazidiTqn9itPmoOZpMxu-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0034.prod.exchangelabs.com (2603:10b6:805:b6::47)
 To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPV6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SN6PR01CA0034.prod.exchangelabs.com
 (2603:10b6:805:b6::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 16:21:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3d9bbc4-50f6-4670-4815-08d9b8d473e1
X-MS-TrafficTypeDiagnostic: MWHPR10MB1454:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB14545878C0170814691F4D84976D9@MWHPR10MB1454.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SRdGLorzyRe2fGhcLUqZ+jf/qWso/+6RnWrAlmiO5r3yNxpWQOv26DN009zRo0kRaV5uC75K7XOZWinL4wL2MX3OY6fQV0Kn5WmoSkNl6gRwdhOSjn9BS+3ahFsaUnBTU7eKXnUPUv7RimIBPe7JiGIGRDpH1gCYvaWBWQo4E8NGaQPJ7UEZrSgIuxZFDgzek5lQvRJblIgpWRy7XAw5k26IQfxBr16Vj5o7nlrDy7dvcYCdl6vi2vKAKdlLCsL1M7YFm+UWbvcMg0a2utyikksPWVEYuCDr+gHL6KSTkNvLZQtOyJkvtKvGq5dhb12WsC6kfWdOz/tGpJgT0kHZt2npSHIspEJV/e/z6AXGewJhTDcN9aZOHqYrfvurC1+JR32k2E2mclJQGEXweCVRPFEjO/zRGePiazwLvX/HWCD5S8LF7so0vZXzjP9ig5CPX8hIeOjEjCnoQuMCzkkTsTloTcu4PbTLU/FpZ5FD85FgGj11NvP2MVdFuCgMMJR3x9KT0/RS4OGN+qGbn1R8bkV0VehgKqyEEIX4YTOvib5vZZCHiuHcr94DQsi0i3pe3G0gX+Ma8Z3C3wcQ6JEOlU6TkSzaAch69rNF8cfIc/+7fD/U9TXuGeQ9yEK9mhZDLyPOOdo6CqUay1mnjn3G0Q8woJja7hMeIwphtxYyAdcyZ9AWBIk+XSCp6+qaLuDnfNzCf49JWJO+MtmdNQBMVO3Wdz9I3270T9Exa6NRE6frz8jPZwHpfvhE5ikl0fffpjI496rUyO4d4ZESqFFXkyTK9ZjN4B+T/aGTwZL+el8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(2906002)(8676002)(4326008)(508600001)(6486002)(36756003)(83380400001)(66476007)(66556008)(53546011)(8936002)(30864003)(38100700002)(966005)(186003)(86362001)(31686004)(2616005)(6916009)(66946007)(316002)(5660300002)(107886003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFllWDdlVmd1STBlUEFZcjFvOWZqRXd1L2hXMGgwNncvT1dUNmgrMFRGcXVx?=
 =?utf-8?B?TG9vRU1ZTFZwOTFjMUV2VFlCcTF0a3JSOEM0VHBPVm1VeWh1TmlhK3oyaFMx?=
 =?utf-8?B?UEVCYkZva2JuVFZGYndFS21yMmNmOTl4ZDRGOTc1TngyNWI4TXZHTVU1WmNu?=
 =?utf-8?B?VElHMnp1SUxjaGhJQ0toTngyMFoxQWprQ2dKVGlVeW42cVgzMmFCTlhaTmNN?=
 =?utf-8?B?b0xIYnNaNUUyOGlZMlhFWEdiWVFmdXFDUFF3Q1ZXWnBXYWV2dkp1ZGVTNUpr?=
 =?utf-8?B?b3ZpQSsrT3dCdGM2THV3anc5ZDRWMFU1S28rTXNwQXpaMW9yQjArMDREdGUz?=
 =?utf-8?B?U2Z4VGprblFPUkp0TS9VV2l6aXV2MnZKUC9GNjFlSW81b0Q4Q2U5N3Z2UWFx?=
 =?utf-8?B?eVBBRXN3cko0cTBncnBnR1BrWE9GZEhBai9zSFdyTGlwR1RtamJnQnZ5WG1i?=
 =?utf-8?B?M21ZOGxuWUt6OHVlR3RLS09lM0Y5MzZmNmVHd3dHaEgyZUZjYW5lWU9ldW9m?=
 =?utf-8?B?dFVSUEpOSDJuSlAraWFpMHBJY0hGWFE2bHZ4TXNDOVNFa1dNWWRKNnRhSkFt?=
 =?utf-8?B?Z0JySTRkNldpL3hCeDdEU1VLWkdobWppUU1FWTVscE5RcExoV1h5c2ozcEpy?=
 =?utf-8?B?MGhCZ1FRNzdhNHlodEdqUXdxOCtWUzJvOXU0QkF1RkNiS0tManpqalA2bGF0?=
 =?utf-8?B?RGI5ZU5MbGM5K3NaK2w3MUNyVFRrYVdWdzdPRjB0TWU0bWoxbXI1K3d5OEpP?=
 =?utf-8?B?Z2Vqb2FObXlYbTRXR2lQTzREZjY1c0h3NndFK1hjWXY4TWxOZ0sxMTJ4bnhr?=
 =?utf-8?B?aHpYbnBrSURpOGZxeWRiQ2FOeEkvMnlOcDQyNEVnMTZBdG5oTHBKRHM3Nk9R?=
 =?utf-8?B?RHFTeG9YS2RDc2t5VmU0TVJjRjM0cHdkeG82SGRWbmJDQTFMUTNjOVhUM1lx?=
 =?utf-8?B?S1JRUVVibEV4NWZxemxwZVJIWHNKa29jN09lOWR4OGkyRUFCVWUzRUZHQjgy?=
 =?utf-8?B?MXhrTTdCc1lWV0RDR1hWOUFHT2wya0RsR0ticnpZZ3BBMHRTVTNHMFV5QlpZ?=
 =?utf-8?B?UUxNQ2xlaHVKRWE4WEFKVzFOZms3ck1TVnFZK2VodWt2alpKOW5lYVlrK1do?=
 =?utf-8?B?NVdxTTdNTlVENEFiK05scEJ6d1lGejhIYWIxbjZCQ2ZYQWs3Q3ZGN0lIRllq?=
 =?utf-8?B?MldxUnNrdEhaYTdjL0xvOWFwY09ZSDRFYndNWWF1dW9hbitPYnNINC9yMTBn?=
 =?utf-8?B?NFcyZVlKNzNHMVF5aGVPT3o0Q3hNSmdvdnBlUGNXZGt0MS9FUml2ZXJYMnZj?=
 =?utf-8?B?TXpPODRtRjJ3L2podkZ4ME1XMVlZRW1yTFJtR1JVZDMvWkZ1UWZOTjFXaCtH?=
 =?utf-8?B?TVo4YXdrRDNrWnhzU05HWFBOb2YxWENGWnJuMWZZVDhKWkplT3Q3bkN6YTgx?=
 =?utf-8?B?ZDVRTXZ3TzFOR0ZGbk1EaUExcGJsR0l3YjA4WVI1RlNZa0drbW5IVVpHcERL?=
 =?utf-8?B?a2d0ZFBlYVNFVWkzK1pnbGxEYjN0eFlueEN5R3VoSmNOR0tLczZSbHBYN3pE?=
 =?utf-8?B?ODNhS1lWRjJ4bkMvV1hrWWdGbm9ldnY5TzJxT1Z3NkpWdGVHU2F5K21ZK25O?=
 =?utf-8?B?NTMxNlM1ZCtyYjBZekU3d3hsRXB3dmVjMjFtNERKUkppeUczU0xJTUt2M0Vu?=
 =?utf-8?B?MU5JV0ZVeEFkdm5HRXhkWjVyR1A3bFpnUG1FOWdobldRMW5BcDRLRkN1Q3Rx?=
 =?utf-8?B?QlA2UVF4M2VtNTJzb0luSVRQWVNBakZUUnZPeWN2VmNtWjFQOXlzWXdkWUdJ?=
 =?utf-8?B?OU1vUGVPU2JBckUvY3BkNDNTOGFMWi84dXdjWVE1YnRvbnQreUVKN0p3ai9U?=
 =?utf-8?B?SnYvT1Bmc0QzdGgrZ3FEeHAwanhCZ0xHNUJnL3IxMWJRQVNVTyswMitvNlNF?=
 =?utf-8?B?MnRTejh6cUxIVjQ0b0EwQm1uZzIraFJkMmVsVGN3Y1U3Y2xUaXVlSURUeFVj?=
 =?utf-8?B?THR2ckdnTzZXeDdqSGUybzVxbm5vUjNKSU0yelVwM014ZzNuMEpZNjhxdzRh?=
 =?utf-8?B?c09VWEF2OEd2N05IR3VoZ1BnY3h0SXZYZVFvb0ozZm8wSU9tM3FYWHBDOWpC?=
 =?utf-8?B?elhEejZPU0VndVloT3E0cysyd2thajBqckcxMUFhK0tKem9udXdCQlU3TnhC?=
 =?utf-8?B?bFptOGpXV1g2OWxjRUdQTU16YVQzUmlLM2JtU0pqMFhkTzFMMVpQd09ZRXFr?=
 =?utf-8?B?YXc0RGFaaVp6U3N1M2l4NGE2bDg3SG5NWVJGNnFHZzRIREtNcElBeVpiTGtX?=
 =?utf-8?Q?AItAqx7FHQgGq/Oy3B?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d9bbc4-50f6-4670-4815-08d9b8d473e1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 16:21:26.8544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BirSW4xrZfPCN8jyBR+bGZ4zZj58XODfNLI5AwGcGwy4NGRnGjk7PuVTLWPSKllVH2ty6Fkn7mNDTBf2mTT3U8IWSbtR4JznlY51DZgXhE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1454
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10189
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112060101
X-Proofpoint-GUID: RoRoLnpllpf12NqGG0silu4J7IF4Rcms
X-Proofpoint-ORIG-GUID: RoRoLnpllpf12NqGG0silu4J7IF4Rcms
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.076, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Ani, inline responses below.
eric

On 12/6/21 02:14, Ani Sinha wrote:
> On Fri, Dec 3, 2021 at 12:39 AM Eric DeVolder <eric.devolder@oracle.com> wrote:
>>
>> This implements a PCI device for ACPI ERST. This implements the
>> non-NVRAM "mode" of operation for ERST as it is supported by
>> Linux and Windows.
> 
> OK sent some more comments. It will take another pass for me to fully
> review this.
> 
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   hw/acpi/Kconfig      |   6 +
>>   hw/acpi/erst.c       | 836 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>   hw/acpi/meson.build  |   1 +
>>   hw/acpi/trace-events |  15 +
>>   4 files changed, 858 insertions(+)
>>   create mode 100644 hw/acpi/erst.c
>>
>> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
>> index 622b0b5..19caebd 100644
>> --- a/hw/acpi/Kconfig
>> +++ b/hw/acpi/Kconfig
>> @@ -10,6 +10,7 @@ config ACPI_X86
>>       select ACPI_HMAT
>>       select ACPI_PIIX4
>>       select ACPI_PCIHP
>> +    select ACPI_ERST
>>
>>   config ACPI_X86_ICH
>>       bool
>> @@ -60,3 +61,8 @@ config ACPI_HW_REDUCED
>>       select ACPI
>>       select ACPI_MEMORY_HOTPLUG
>>       select ACPI_NVDIMM
>> +
>> +config ACPI_ERST
>> +    bool
>> +    default y
>> +    depends on ACPI && PCI
>> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
>> new file mode 100644
>> index 0000000..4304f55
>> --- /dev/null
>> +++ b/hw/acpi/erst.c
>> @@ -0,0 +1,836 @@
>> +/*
>> + * ACPI Error Record Serialization Table, ERST, Implementation
>> + *
>> + * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
>> + * ACPI Platform Error Interfaces : Error Serialization
>> + *
>> + * Copyright (c) 2021 Oracle and/or its affiliates.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include <sys/types.h>
>> +#include <sys/stat.h>
>> +#include <unistd.h>
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "hw/qdev-core.h"
>> +#include "exec/memory.h"
>> +#include "qom/object.h"
>> +#include "hw/pci/pci.h"
>> +#include "qom/object_interfaces.h"
>> +#include "qemu/error-report.h"
>> +#include "migration/vmstate.h"
>> +#include "hw/qdev-properties.h"
>> +#include "hw/acpi/acpi.h"
>> +#include "hw/acpi/acpi-defs.h"
>> +#include "hw/acpi/aml-build.h"
>> +#include "hw/acpi/bios-linker-loader.h"
>> +#include "exec/address-spaces.h"
>> +#include "sysemu/hostmem.h"
>> +#include "hw/acpi/erst.h"
>> +#include "trace.h"
>> +
>> +/* ACPI 4.0: Table 17-16 Serialization Actions */
> 
> Is there any reason why you refer to version 4.0 and not the latest version 6.3?
Some time ago Igor asked that I cite the earliest spec reference in which ERST appears.

> 
>> +#define ACTION_BEGIN_WRITE_OPERATION         0x0
>> +#define ACTION_BEGIN_READ_OPERATION          0x1
>> +#define ACTION_BEGIN_CLEAR_OPERATION         0x2
>> +#define ACTION_END_OPERATION                 0x3
>> +#define ACTION_SET_RECORD_OFFSET             0x4
>> +#define ACTION_EXECUTE_OPERATION             0x5
>> +#define ACTION_CHECK_BUSY_STATUS             0x6
>> +#define ACTION_GET_COMMAND_STATUS            0x7
>> +#define ACTION_GET_RECORD_IDENTIFIER         0x8
>> +#define ACTION_SET_RECORD_IDENTIFIER         0x9
>> +#define ACTION_GET_RECORD_COUNT              0xA
>> +#define ACTION_BEGIN_DUMMY_WRITE_OPERATION   0xB
>> +#define ACTION_RESERVED                      0xC
>> +#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE   0xD
>> +#define ACTION_GET_ERROR_LOG_ADDRESS_LENGTH  0xE
>> +#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES 0xF
>> +#define ACTION_GET_EXECUTE_OPERATION_TIMINGS 0x10
> 
> ACTION_GET_EXECUTE_OPERATION_TIMINGS is not present here:
> https://uefi.org/sites/default/files/resources/ACPI_4.pdf, section
> 17.4.1.1 .
> But I do see it in version 6.3
> https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf
> section 18.5.1.1
Ah, should I remove it (to stay 4.0-esque), or leave it stay current?

> 
>> +
>> +/* ACPI 4.0: Table 17-17 Command Status Definitions */
>> +#define STATUS_SUCCESS                0x00
>> +#define STATUS_NOT_ENOUGH_SPACE       0x01
>> +#define STATUS_HARDWARE_NOT_AVAILABLE 0x02
>> +#define STATUS_FAILED                 0x03
>> +#define STATUS_RECORD_STORE_EMPTY     0x04
>> +#define STATUS_RECORD_NOT_FOUND       0x05
>> +
>> +
>> +/* UEFI 2.1: Appendix N Common Platform Error Record */
>> +#define UEFI_CPER_RECORD_MIN_SIZE 128U
>> +#define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
>> +#define UEFI_CPER_RECORD_ID_OFFSET 96U
>> +#define IS_UEFI_CPER_RECORD(ptr) \
>> +    (((ptr)[0] == 'C') && \
>> +     ((ptr)[1] == 'P') && \
>> +     ((ptr)[2] == 'E') && \
>> +     ((ptr)[3] == 'R'))
>> +
>> +/*
>> + * NOTE that when accessing CPER fields within a record, memcpy()
>> + * is utilized to avoid a possible misaligned access on the host.
>> + */
>> +
>> +/*
>> + * This implementation is an ACTION (cmd) and VALUE (data)
>> + * interface consisting of just two 64-bit registers.
>> + */
>> +#define ERST_REG_SIZE (16UL)
>> +#define ERST_ACTION_OFFSET (0UL) /* action (cmd) */
>> +#define ERST_VALUE_OFFSET  (8UL) /* argument/value (data) */
>> +
>> +/*
>> + * ERST_RECORD_SIZE is the buffer size for exchanging ERST
>> + * record contents. Thus, it defines the maximum record size.
>> + * As this is mapped through a PCI BAR, it must be a power of
>> + * two and larger than UEFI_CPER_RECORD_MIN_SIZE.
>> + * The backing storage is divided into fixed size "slots",
>> + * each ERST_RECORD_SIZE in length, and each "slot"
>> + * storing a single record. No attempt at optimizing storage
>> + * through compression, compaction, etc is attempted.
>> + * NOTE that slot 0 is reserved for the backing storage header.
>> + * Depending upon the size of the backing storage, additional
>> + * slots will be part of the slot 0 header in order to account
>> + * for a record_id for each available remaining slot.
>> + */
>> +/* 8KiB records, not too small, not too big */
>> +#define ERST_RECORD_SIZE (8192UL)
>> +
>> +#define ACPI_ERST_MEMDEV_PROP "memdev"
>> +#define ACPI_ERST_RECORD_SIZE_PROP "record_size"
>> +
>> +/*
>> + * From the ACPI ERST spec sections:
>> + * A record id of all 0s is used to indicate 'unspecified' record id.
>> + * A record id of all 1s is used to indicate empty or end.
>> + */
>> +#define ERST_UNSPECIFIED_RECORD_ID (0UL)
>> +#define ERST_EMPTY_END_RECORD_ID (~0UL)
>> +#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
>> +#define ERST_IS_VALID_RECORD_ID(rid) \
>> +    ((rid != ERST_UNSPECIFIED_RECORD_ID) && \
>> +     (rid != ERST_EMPTY_END_RECORD_ID))
>> +#define ERST_STORE_MAGIC 0x524F545354535245UL /* ERSTSTOR */
> 
> Is this arbitrary or is it defined by the spec? I could not find this
> in acpi spec 6.3.

This is arbitrary; it is purely for the 'magic' member in the struct ERSTStorageHeader below.
> 
>> +
>> +typedef struct {
>> +    uint64_t magic;
>> +    uint32_t record_size;
>> +    uint32_t storage_offset; /* offset to record storage beyond header */
>> +    uint16_t version;
>> +    uint16_t reserved;
>> +    uint32_t record_count;
>> +    uint64_t map[]; /* contains record_ids, and position indicates index */
>> +} __attribute__((packed)) ERSTStorageHeader;
> 
> Could you please point to the spec where this header is defined and
> add a comment here for the same?

This is not in the ACPI spec; this would fall under the implementation-specific guidance of the 
spec. I do describe how I use this in the acpi-erst.rst.

> 
>> +
>> +/*
>> + * Object cast macro
>> + */
>> +#define ACPIERST(obj) \
>> +    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
>> +
>> +/*
>> + * Main ERST device state structure
>> + */
>> +typedef struct {
>> +    PCIDevice parent_obj;
>> +
>> +    /* Backend storage */
>> +    HostMemoryBackend *hostmem;
>> +    MemoryRegion *hostmem_mr;
>> +    uint32_t storage_size;
>> +    uint32_t default_record_size;
>> +
>> +    /* Programming registers */
>> +    MemoryRegion iomem_mr;
>> +
>> +    /* Exchange buffer */
>> +    MemoryRegion exchange_mr;
>> +
>> +    /* Interface state */
>> +    uint8_t operation;
>> +    uint8_t busy_status;
>> +    uint8_t command_status;
>> +    uint32_t record_offset;
>> +    uint64_t reg_action;
>> +    uint64_t reg_value;
>> +    uint64_t record_identifier;
>> +    ERSTStorageHeader *header;
>> +    unsigned first_record_index;
>> +    unsigned last_record_index;
>> +    unsigned next_record_index;
>> +
>> +} ERSTDeviceState;
>> +
>> +/*******************************************************************/
>> +/*******************************************************************/
>> +
>> +static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
>> +{
>> +    uint8_t *rc = NULL;
>> +    off_t offset = (index * le32_to_cpu(s->header->record_size));
>> +
>> +    g_assert(offset < s->storage_size);
>> +
>> +    rc = memory_region_get_ram_ptr(s->hostmem_mr);
>> +    rc += offset;
>> +
>> +    return rc;
>> +}
>> +
>> +static void make_erst_storage_header(ERSTDeviceState *s)
>> +{
>> +    ERSTStorageHeader *header = s->header;
>> +    unsigned mapsz, headersz;
>> +
>> +    header->magic = cpu_to_le64(ERST_STORE_MAGIC);
>> +    header->record_size = cpu_to_le32(s->default_record_size);
>> +    header->version = cpu_to_le16(0x0100);
>> +    header->reserved = cpu_to_le16(0x0000);
>> +
>> +    /* Compute mapsize */
>> +    mapsz = s->storage_size / s->default_record_size;
>> +    mapsz *= sizeof(uint64_t);
>> +    /* Compute header+map size */
>> +    headersz = sizeof(ERSTStorageHeader) + mapsz;
>> +    /* Round up to nearest integer multiple of ERST_RECORD_SIZE */
>> +    headersz = QEMU_ALIGN_UP(headersz, s->default_record_size);
>> +    header->storage_offset = cpu_to_le32(headersz);
>> +
>> +    /*
>> +     * The HostMemoryBackend initializes contents to zero,
>> +     * so all record_ids stashed in the map are zero'd.
>> +     * As well the record_count is zero. Properly initialized.
>> +     */
>> +}
>> +
>> +static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
>> +{
>> +    ERSTStorageHeader *header;
>> +    uint32_t record_size;
>> +
>> +    header = memory_region_get_ram_ptr(s->hostmem_mr);
>> +    s->header = header;
>> +
>> +    /* Ensure pointer to header is 64-bit aligned */
>> +    g_assert(QEMU_PTR_IS_ALIGNED(header, sizeof(uint64_t)));
>> +
>> +    /*
>> +     * Check if header is uninitialized; HostMemoryBackend inits to 0
>> +     */
>> +    if (le64_to_cpu(header->magic) == 0UL) {
>> +        make_erst_storage_header(s);
>> +    }
>> +
>> +    /* Validity check record_size */
>> +    record_size = le32_to_cpu(header->record_size);
>> +    if (!(
>> +        (record_size) && /* non zero */
>> +        (record_size >= UEFI_CPER_RECORD_MIN_SIZE) &&
>> +        (((record_size - 1) & record_size) == 0) && /* is power of 2 */
>> +        (record_size >= 4096) /* PAGE_SIZE */
>> +        )) {
>> +        error_setg(errp, "ERST record_size %u is invalid", record_size);
>> +    }
>> +
>> +    /* Validity check header */
>> +    if (!(
>> +        (le64_to_cpu(header->magic) == ERST_STORE_MAGIC) &&
>> +        ((le32_to_cpu(header->storage_offset) % record_size) == 0) &&
>> +        (le16_to_cpu(header->version) == 0x0100) &&
>> +        (le16_to_cpu(header->reserved) == 0)
>> +        )) {
>> +        error_setg(errp, "ERST backend storage header is invalid");
>> +    }
>> +
>> +    /* Check storage_size against record_size */
>> +    if (((s->storage_size % record_size) != 0) ||
>> +         (record_size > s->storage_size)) {
>> +        error_setg(errp, "ACPI ERST requires storage size be multiple of "
>> +            "record size (%uKiB)", record_size);
>> +    }
>> +
>> +    /* Compute offset of first and last record storage slot */
>> +    s->first_record_index = le32_to_cpu(header->storage_offset)
>> +        / record_size;
>> +    s->last_record_index = (s->storage_size / record_size);
>> +}
>> +
>> +static void update_map_entry(ERSTDeviceState *s, unsigned index,
>> +    uint64_t record_id)
>> +{
>> +    if (index < s->last_record_index) {
>> +        s->header->map[index] = cpu_to_le64(record_id);
>> +    }
>> +}
>> +
>> +static unsigned allocate_erst_record(ERSTDeviceState *s)
> 
> nit: this function name is misleading. It's not allocating any
> records. It's finding the next empty slot for the record. So the
> function could be named something like:
> 
> find_next_empty_record_idx() or something.
ok, will change it.

> 
>> +{
>> +    unsigned rc = 0; /* 0 not a valid index */
>> +    unsigned index = s->first_record_index;
>> +
>> +    for (; index < s->last_record_index; ++index) {
>> +        if (le64_to_cpu(s->header->map[index]) == ERST_UNSPECIFIED_RECORD_ID) {
>> +            rc = index;
>> +            break;
>> +        }
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +static unsigned lookup_erst_record(ERSTDeviceState *s,
>> +    uint64_t record_identifier)
>> +{
>> +    unsigned rc = 0; /* 0 not a valid index */
>> +
>> +    /* Find the record_identifier in the map */
>> +    if (record_identifier != ERST_UNSPECIFIED_RECORD_ID) {
>> +        /*
>> +         * Count number of valid records encountered, and
>> +         * short-circuit the loop if identifier not found
>> +         */
>> +        uint32_t record_count = le32_to_cpu(s->header->record_count);
>> +        unsigned count = 0;
>> +        unsigned index;
>> +        for (index = s->first_record_index; index < s->last_record_index &&
>> +                count < record_count; ++index) {
>> +            if (le64_to_cpu(s->header->map[index]) == record_identifier) {
>> +                rc = index;
>> +                break;
>> +            }
>> +            if (le64_to_cpu(s->header->map[index]) !=
>> +                ERST_UNSPECIFIED_RECORD_ID) {
>> +                ++count;
>> +            }
>> +        }
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/*
>> + * ACPI 4.0: 17.4.1.1 Serialization Actions, also see
>> + * ACPI 4.0: 17.4.2.2 Operations - Reading 6.c and 2.c
>> + */
>> +static unsigned get_next_record_identifier(ERSTDeviceState *s,
>> +    uint64_t *record_identifier, bool first)
>> +{
>> +    unsigned found = 0;
>> +    unsigned index;
>> +
>> +    /* For operations needing to return 'first' record identifer */
> 
> nit: typo in comment - identifier
ok will correct it

> 
>> +    if (first) {
>> +        /* Reset initial index to beginning */
>> +        s->next_record_index = s->first_record_index;
>> +    }
>> +    index = s->next_record_index;
>> +
>> +    *record_identifier = ERST_EMPTY_END_RECORD_ID;
>> +
>> +    if (le32_to_cpu(s->header->record_count)) {
>> +        for (; index < s->last_record_index; ++index) {
>> +            if (le64_to_cpu(s->header->map[index]) !=
>> +                    ERST_UNSPECIFIED_RECORD_ID) {
>> +                    /* where to start next time */
>> +                    s->next_record_index = index + 1;
>> +                    *record_identifier = le64_to_cpu(s->header->map[index]);
>> +                    found = 1;
>> +                    break;
>> +            }
>> +        }
>> +    }
>> +    if (!found) {
>> +        /* at end (ie scan complete), reset */
>> +        s->next_record_index = s->first_record_index;
>> +    }
>> +
>> +    return STATUS_SUCCESS;
>> +}
>> +
>> +/* ACPI 4.0: 17.4.2.3 Operations - Clearing */
>> +static unsigned clear_erst_record(ERSTDeviceState *s)
>> +{
>> +    unsigned rc = STATUS_RECORD_NOT_FOUND;
>> +    unsigned index;
>> +
>> +    /* Check for valid record identifier */
>> +    if (!ERST_IS_VALID_RECORD_ID(s->record_identifier)) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    index = lookup_erst_record(s, s->record_identifier);
>> +    if (index) {
>> +        /* No need to wipe record, just invalidate its map entry */
>> +        uint32_t record_count;
>> +        update_map_entry(s, index, ERST_UNSPECIFIED_RECORD_ID);
>> +        record_count = le32_to_cpu(s->header->record_count);
>> +        record_count -= 1;
>> +        s->header->record_count = cpu_to_le32(record_count);
>> +        rc = STATUS_SUCCESS;
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/* ACPI 4.0: 17.4.2.2 Operations - Reading */
>> +static unsigned read_erst_record(ERSTDeviceState *s)
>> +{
>> +    unsigned rc = STATUS_RECORD_NOT_FOUND;
>> +    unsigned exchange_length;
>> +    unsigned index;
>> +
>> +    /* Check if backend storage is empty */
>> +    if (le32_to_cpu(s->header->record_count) == 0) {
>> +        return STATUS_RECORD_STORE_EMPTY;
>> +    }
>> +
>> +    exchange_length = memory_region_size(&s->exchange_mr);
>> +
>> +    /* Check for record identifier of all 0s */
>> +    if (s->record_identifier == ERST_UNSPECIFIED_RECORD_ID) {
>> +        /* Set to 'first' record in storage */
>> +        get_next_record_identifier(s, &s->record_identifier, true);
>> +        /* record_identifier is now a valid id, or all 1s */
>> +    }
>> +
>> +    /* Check for record identifier of all 1s */
>> +    if (s->record_identifier == ERST_EMPTY_END_RECORD_ID) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    /* Validate record_offset */
>> +    if (s->record_offset > (exchange_length - UEFI_CPER_RECORD_MIN_SIZE)) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    index = lookup_erst_record(s, s->record_identifier);
>> +    if (index) {
>> +        uint8_t *nvram;
>> +        uint8_t *exchange;
>> +        uint32_t record_length;
>> +
>> +        /* Obtain pointer to the exchange buffer */
>> +        exchange = memory_region_get_ram_ptr(&s->exchange_mr);
>> +        exchange += s->record_offset;
>> +        /* Obtain pointer to slot in storage */
>> +        nvram = get_nvram_ptr_by_index(s, index);
>> +        /* Validate CPER record_length */
>> +        memcpy((uint8_t *)&record_length,
>> +            &nvram[UEFI_CPER_RECORD_LENGTH_OFFSET],
>> +            sizeof(uint32_t));
>> +        record_length = le32_to_cpu(record_length);
>> +        if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
>> +            rc = STATUS_FAILED;
>> +        }
>> +        if ((s->record_offset + record_length) > exchange_length) {
>> +            rc = STATUS_FAILED;
>> +        }
>> +        /* If all is ok, copy the record to the exchange buffer */
>> +        if (rc != STATUS_FAILED) {
>> +            memcpy(exchange, nvram, record_length);
>> +            rc = STATUS_SUCCESS;
>> +        }
>> +    } else {
>> +        /* Set to 'first' record in storage */
>> +        get_next_record_identifier(s, &s->record_identifier, true);
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/* ACPI 4.0: 17.4.2.1 Operations - Writing */
>> +static unsigned write_erst_record(ERSTDeviceState *s)
>> +{
>> +    unsigned rc = STATUS_FAILED;
>> +    unsigned exchange_length;
>> +    unsigned index;
>> +    uint64_t record_identifier;
>> +    uint32_t record_length;
>> +    uint8_t *exchange;
>> +    uint8_t *nvram = NULL;
>> +    bool record_found = false;
>> +
>> +    exchange_length = memory_region_size(&s->exchange_mr);
>> +
>> +    /* Validate record_offset */
>> +    if (s->record_offset > (exchange_length - UEFI_CPER_RECORD_MIN_SIZE)) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    /* Obtain pointer to record in the exchange buffer */
>> +    exchange = memory_region_get_ram_ptr(&s->exchange_mr);
>> +    exchange += s->record_offset;
>> +
>> +    /* Validate CPER record_length */
>> +    memcpy((uint8_t *)&record_length, &exchange[UEFI_CPER_RECORD_LENGTH_OFFSET],
>> +        sizeof(uint32_t));
>> +    record_length = le32_to_cpu(record_length);
>> +    if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
>> +        return STATUS_FAILED;
>> +    }
>> +    if ((s->record_offset + record_length) > exchange_length) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    /* Extract record identifier */
>> +    memcpy((uint8_t *)&record_identifier, &exchange[UEFI_CPER_RECORD_ID_OFFSET],
>> +        sizeof(uint64_t));
>> +    record_identifier = le64_to_cpu(record_identifier);
>> +
>> +    /* Check for valid record identifier */
>> +    if (!ERST_IS_VALID_RECORD_ID(record_identifier)) {
>> +        return STATUS_FAILED;
>> +    }
>> +
>> +    index = lookup_erst_record(s, record_identifier);
>> +    if (index) {
>> +        /* Record found, overwrite existing record */
>> +        nvram = get_nvram_ptr_by_index(s, index);
>> +        record_found = true;
>> +    } else {
>> +        /* Record not found, not an overwrite, allocate for write */
>> +        index = allocate_erst_record(s);
>> +        if (index) {
>> +            nvram = get_nvram_ptr_by_index(s, index);
>> +        } else {
>> +            rc = STATUS_NOT_ENOUGH_SPACE;
>> +        }
>> +    }
>> +    if (nvram) {
>> +        /* Write the record into the slot */
>> +        memcpy(nvram, exchange, record_length);
>> +        memset(nvram + record_length, exchange_length - record_length, 0xFF);
>> +        /* If a new record, increment the record_count */
>> +        if (!record_found) {
>> +            uint32_t record_count;
>> +            record_count = le32_to_cpu(s->header->record_count);
>> +            record_count += 1; /* writing new record */
>> +            s->header->record_count = cpu_to_le32(record_count);
>> +        }
>> +        update_map_entry(s, index, record_identifier);
>> +        rc = STATUS_SUCCESS;
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/*******************************************************************/
>> +
>> +static uint64_t erst_rd_reg64(hwaddr addr,
>> +    uint64_t reg, unsigned size)
>> +{
>> +    uint64_t rdval;
>> +    uint64_t mask;
>> +    unsigned shift;
>> +
>> +    if (size == sizeof(uint64_t)) {
>> +        /* 64b access */
>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
>> +        shift = 0;
>> +    } else {
>> +        /* 32b access */
>> +        mask = 0x00000000FFFFFFFFUL;
>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
>> +    }
>> +
>> +    rdval = reg;
>> +    rdval >>= shift;
>> +    rdval &= mask;
>> +
>> +    return rdval;
>> +}
>> +
>> +static uint64_t erst_wr_reg64(hwaddr addr,
>> +    uint64_t reg, uint64_t val, unsigned size)
>> +{
>> +    uint64_t wrval;
>> +    uint64_t mask;
>> +    unsigned shift;
>> +
>> +    if (size == sizeof(uint64_t)) {
>> +        /* 64b access */
>> +        mask = 0xFFFFFFFFFFFFFFFFUL;
>> +        shift = 0;
>> +    } else {
>> +        /* 32b access */
>> +        mask = 0x00000000FFFFFFFFUL;
>> +        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
>> +    }
>> +
>> +    val &= mask;
>> +    val <<= shift;
>> +    mask <<= shift;
>> +    wrval = reg;
>> +    wrval &= ~mask;
>> +    wrval |= val;
>> +
>> +    return wrval;
>> +}
>> +
>> +static void erst_reg_write(void *opaque, hwaddr addr,
>> +    uint64_t val, unsigned size)
>> +{
>> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
>> +
>> +    /*
>> +     * NOTE: All actions/operations/side effects happen on the WRITE,
>> +     * by this implementation's design. The READs simply return the
>> +     * reg_value contents.
>> +     */
>> +    trace_acpi_erst_reg_write(addr, val, size);
>> +
>> +    switch (addr) {
>> +    case ERST_VALUE_OFFSET + 0:
>> +    case ERST_VALUE_OFFSET + 4:
>> +        s->reg_value = erst_wr_reg64(addr, s->reg_value, val, size);
>> +        break;
>> +    case ERST_ACTION_OFFSET + 0:
>> +        /*
>> +         * NOTE: all valid values written to this register are of the
>> +         * ACTION_* variety. Thus there is no need to make this a 64-bit
>> +         * register, 32-bits is appropriate. As such ERST_ACTION_OFFSET+4
>> +         * is not needed.
>> +         */
>> +        switch (val) {
>> +        case ACTION_BEGIN_WRITE_OPERATION:
>> +        case ACTION_BEGIN_READ_OPERATION:
>> +        case ACTION_BEGIN_CLEAR_OPERATION:
>> +        case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
>> +        case ACTION_END_OPERATION:
>> +            s->operation = val;
>> +            break;
>> +        case ACTION_SET_RECORD_OFFSET:
>> +            s->record_offset = s->reg_value;
>> +            break;
>> +        case ACTION_EXECUTE_OPERATION:
>> +            if ((uint8_t)s->reg_value == ERST_EXECUTE_OPERATION_MAGIC) {
>> +                s->busy_status = 1;
>> +                switch (s->operation) {
>> +                case ACTION_BEGIN_WRITE_OPERATION:
>> +                    s->command_status = write_erst_record(s);
>> +                    break;
>> +                case ACTION_BEGIN_READ_OPERATION:
>> +                    s->command_status = read_erst_record(s);
>> +                    break;
>> +                case ACTION_BEGIN_CLEAR_OPERATION:
>> +                    s->command_status = clear_erst_record(s);
>> +                    break;
>> +                case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
>> +                    s->command_status = STATUS_SUCCESS;
>> +                    break;
>> +                case ACTION_END_OPERATION:
>> +                    s->command_status = STATUS_SUCCESS;
>> +                    break;
>> +                default:
>> +                    s->command_status = STATUS_FAILED;
>> +                    break;
>> +                }
>> +                s->busy_status = 0;
>> +            }
>> +            break;
>> +        case ACTION_CHECK_BUSY_STATUS:
>> +            s->reg_value = s->busy_status;
>> +            break;
>> +        case ACTION_GET_COMMAND_STATUS:
>> +            s->reg_value = s->command_status;
>> +            break;
>> +        case ACTION_GET_RECORD_IDENTIFIER:
>> +            s->command_status = get_next_record_identifier(s,
>> +                                    &s->reg_value, false);
>> +            break;
>> +        case ACTION_SET_RECORD_IDENTIFIER:
>> +            s->record_identifier = s->reg_value;
>> +            break;
>> +        case ACTION_GET_RECORD_COUNT:
>> +            s->reg_value = le32_to_cpu(s->header->record_count);
>> +            break;
>> +        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
>> +            s->reg_value = (hwaddr)pci_get_bar_addr(PCI_DEVICE(s), 1);
>> +            break;
>> +        case ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
>> +            s->reg_value = le32_to_cpu(s->header->record_size);
>> +            break;
>> +        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
>> +            s->reg_value = 0x0; /* intentional, not NVRAM mode */
>> +            break;
>> +        case ACTION_GET_EXECUTE_OPERATION_TIMINGS:
>> +            s->reg_value =
>> +                (100ULL << 32) | /* 100us max time */
>> +                (10ULL  <<  0) ; /*  10us min time */
>> +            break;
>> +        default:
>> +            /* Unknown action/command, NOP */
>> +            break;
>> +        }
>> +        break;
>> +    default:
>> +        /* This should not happen, but if it does, NOP */
>> +        break;
>> +    }
>> +}
>> +
>> +static uint64_t erst_reg_read(void *opaque, hwaddr addr,
>> +                                unsigned size)
>> +{
>> +    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
>> +    uint64_t val = 0;
>> +
>> +    switch (addr) {
>> +    case ERST_ACTION_OFFSET + 0:
>> +    case ERST_ACTION_OFFSET + 4:
>> +        val = erst_rd_reg64(addr, s->reg_action, size);
>> +        break;
>> +    case ERST_VALUE_OFFSET + 0:
>> +    case ERST_VALUE_OFFSET + 4:
>> +        val = erst_rd_reg64(addr, s->reg_value, size);
>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +    trace_acpi_erst_reg_read(addr, val, size);
>> +    return val;
>> +}
>> +
>> +static const MemoryRegionOps erst_reg_ops = {
>> +    .read = erst_reg_read,
>> +    .write = erst_reg_write,
>> +    .endianness = DEVICE_NATIVE_ENDIAN,
>> +};
>> +
>> +/*******************************************************************/
>> +/*******************************************************************/
>> +static int erst_post_load(void *opaque, int version_id)
>> +{
>> +    ERSTDeviceState *s = opaque;
>> +
>> +    /* Recompute pointer to header */
>> +    s->header = (ERSTStorageHeader *)get_nvram_ptr_by_index(s, 0);
>> +    trace_acpi_erst_post_load(s->header, le32_to_cpu(s->header->record_size));
>> +
>> +    return 0;
>> +}
>> +
>> +static const VMStateDescription erst_vmstate  = {
>> +    .name = "acpi-erst",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .post_load = erst_post_load,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_UINT8(operation, ERSTDeviceState),
>> +        VMSTATE_UINT8(busy_status, ERSTDeviceState),
>> +        VMSTATE_UINT8(command_status, ERSTDeviceState),
>> +        VMSTATE_UINT32(record_offset, ERSTDeviceState),
>> +        VMSTATE_UINT64(reg_action, ERSTDeviceState),
>> +        VMSTATE_UINT64(reg_value, ERSTDeviceState),
>> +        VMSTATE_UINT64(record_identifier, ERSTDeviceState),
>> +        VMSTATE_UINT32(next_record_index, ERSTDeviceState),
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static void erst_realizefn(PCIDevice *pci_dev, Error **errp)
>> +{
>> +    ERSTDeviceState *s = ACPIERST(pci_dev);
>> +
>> +    trace_acpi_erst_realizefn_in();
>> +
>> +    if (!s->hostmem) {
>> +        error_setg(errp, "'" ACPI_ERST_MEMDEV_PROP "' property is not set");
>> +        return;
>> +    } else if (host_memory_backend_is_mapped(s->hostmem)) {
>> +        error_setg(errp, "can't use already busy memdev: %s",
>> +                   object_get_canonical_path_component(OBJECT(s->hostmem)));
>> +        return;
>> +    }
>> +
>> +    s->hostmem_mr = host_memory_backend_get_memory(s->hostmem);
>> +
>> +    /* HostMemoryBackend size will be multiple of PAGE_SIZE */
>> +    s->storage_size = object_property_get_int(OBJECT(s->hostmem), "size", errp);
>> +
>> +    /* Initialize backend storage and record_count */
>> +    check_erst_backend_storage(s, errp);
>> +
>> +    /* BAR 0: Programming registers */
>> +    memory_region_init_io(&s->iomem_mr, OBJECT(pci_dev), &erst_reg_ops, s,
>> +                          TYPE_ACPI_ERST, ERST_REG_SIZE);
>> +    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem_mr);
>> +
>> +    /* BAR 1: Exchange buffer memory */
>> +    memory_region_init_ram(&s->exchange_mr, OBJECT(pci_dev),
>> +                            "erst.exchange",
>> +                            le32_to_cpu(s->header->record_size), errp);
>> +    pci_register_bar(pci_dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY,
>> +                        &s->exchange_mr);
>> +
>> +    /* Include the backend storage in the migration stream */
>> +    vmstate_register_ram_global(s->hostmem_mr);
>> +
>> +    trace_acpi_erst_realizefn_out(s->storage_size);
>> +}
>> +
>> +static void erst_reset(DeviceState *dev)
>> +{
>> +    ERSTDeviceState *s = ACPIERST(dev);
>> +
>> +    trace_acpi_erst_reset_in(le32_to_cpu(s->header->record_count));
>> +    s->operation = 0;
>> +    s->busy_status = 0;
>> +    s->command_status = STATUS_SUCCESS;
>> +    s->record_identifier = ERST_UNSPECIFIED_RECORD_ID;
>> +    s->record_offset = 0;
>> +    s->next_record_index = s->first_record_index;
>> +    /* NOTE: first/last_record_index are computed only once */
>> +    trace_acpi_erst_reset_out(le32_to_cpu(s->header->record_count));
>> +}
>> +
>> +static Property erst_properties[] = {
>> +    DEFINE_PROP_LINK(ACPI_ERST_MEMDEV_PROP, ERSTDeviceState, hostmem,
>> +                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
>> +    DEFINE_PROP_UINT32(ACPI_ERST_RECORD_SIZE_PROP, ERSTDeviceState,
>> +                     default_record_size, ERST_RECORD_SIZE),
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void erst_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
>> +
>> +    trace_acpi_erst_class_init_in();
>> +    k->realize = erst_realizefn;
>> +    k->vendor_id = PCI_VENDOR_ID_REDHAT;
>> +    k->device_id = PCI_DEVICE_ID_REDHAT_ACPI_ERST;
>> +    k->revision = 0x00;
>> +    k->class_id = PCI_CLASS_OTHERS;
>> +    dc->reset = erst_reset;
>> +    dc->vmsd = &erst_vmstate;
>> +    dc->user_creatable = true;
>> +    dc->hotpluggable = false;
>> +    device_class_set_props(dc, erst_properties);
>> +    dc->desc = "ACPI Error Record Serialization Table (ERST) device";
>> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>> +    trace_acpi_erst_class_init_out();
>> +}
>> +
>> +static const TypeInfo erst_type_info = {
>> +    .name          = TYPE_ACPI_ERST,
>> +    .parent        = TYPE_PCI_DEVICE,
>> +    .class_init    = erst_class_init,
>> +    .instance_size = sizeof(ERSTDeviceState),
>> +    .interfaces = (InterfaceInfo[]) {
>> +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
>> +        { }
>> +    }
>> +};
>> +
>> +static void erst_register_types(void)
>> +{
>> +    type_register_static(&erst_type_info);
>> +}
>> +
>> +type_init(erst_register_types)
>> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
>> index adf6347..f5b2298 100644
>> --- a/hw/acpi/meson.build
>> +++ b/hw/acpi/meson.build
>> @@ -22,6 +22,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
>>   acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
>>   acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
>>   acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
>> +acpi_ss.add(when: 'CONFIG_ACPI_ERST', if_true: files('erst.c'))
>>   acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
>>   acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
>>   acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
>> diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
>> index 974d770..2250126 100644
>> --- a/hw/acpi/trace-events
>> +++ b/hw/acpi/trace-events
>> @@ -55,3 +55,18 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
>>   # tco.c
>>   tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
>>   tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
>> +
>> +# erst.c
>> +acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%04" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_reg_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%04" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_mem_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%06" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_mem_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%06" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
>> +acpi_erst_pci_bar_0(uint64_t addr) "BAR0: 0x%016" PRIx64
>> +acpi_erst_pci_bar_1(uint64_t addr) "BAR1: 0x%016" PRIx64
>> +acpi_erst_realizefn_in(void)
>> +acpi_erst_realizefn_out(unsigned size) "total nvram size %u bytes"
>> +acpi_erst_reset_in(unsigned record_count) "record_count %u"
>> +acpi_erst_reset_out(unsigned record_count) "record_count %u"
>> +acpi_erst_post_load(void *header, unsigned slot_size) "header: 0x%p slot_size %u"
>> +acpi_erst_class_init_in(void)
>> +acpi_erst_class_init_out(void)
>> --
>> 1.8.3.1
>>

