Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F98434172
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 00:34:36 +0200 (CEST)
Received: from localhost ([::1]:44448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcxgo-0003wa-TS
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 18:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mcxfM-0003Dy-KE
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 18:33:04 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mcxfI-0004mB-8B
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 18:33:04 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19JLSkXT009308; 
 Tue, 19 Oct 2021 22:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=hZNB9XicDvWriaOicbwkabZakDVtfwLcYNragSuLlJA=;
 b=S0sDQr62FYXtR/Su1BjI1EZbyADxsc0T68VtwlPtAxGabhIl75s0IwW1m/V0KMYgRMM8
 IKie/YPyfLYfLromXtEApvFp0q2ckNi+CWdrEnIlVFHOohFn9sE517rKKMoqhTOBR8Gj
 zK7foaRT+sI7HZEaeJTG3nObRJufpbC0N36YsqlI19QI6rpBuX9pI7nFQ2moy1JAN1Ga
 HHwuuKaC/KW3X61RZnZiX4t3lHG0yoLIhTCaG7Xpn/43BXZZrsikttYVPV++GIJHT7D7
 wh6m0CBp4WNRsrokbq7nnRULDXKuanxqLq+xV2MnzJxrnzCESuCYPFqQ0nt3kOnjEN5c Wg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bsr455m8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 22:32:55 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19JMLXRo073897;
 Tue, 19 Oct 2021 22:32:54 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by userp3030.oracle.com with ESMTP id 3bqkuy2c6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 22:32:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=el70Lw4SkeGU72ptTw2RXx+hIAwrZyLZLIUndMtzQJJIneDAUOabaT111yTwyaksa+Zx4aufx3UEsGY5vxuNY4aE7B+4ZOyz8xWoj2aARryrrjJW2Amz+MFa0hFzijClK83u31HUoFz8v/tfXTHmADuuM+j+0f8kr1uCXaXohQ25srmZz9mLrDwPKKIz626zUUIGGiHXpaZm7zP/lNNfepAXZzuxNAy9kYF3/5CFVHPcJuCO0xjq6o2MyPUcpr1wxOGPdpC9b27vCXv3bF8XPJ6Gcr4wkHYyDYN/2M01y2iB3umOajIZuzsC7wsL3RhmcQBHSFlWtK8qsqiC/S4F7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZNB9XicDvWriaOicbwkabZakDVtfwLcYNragSuLlJA=;
 b=Qbw5wsg/tP9hStMvaXk9bkOngGMpG61JA6V6IVXhjRKORTxX6VXc9Ovw9mxQQ94FvPlconSx2jznl5Q0v37vdS1GUrv7XMuCCv8eVFLV5Bjcbla1nxht1rj36A+o3BIed2Nce/QgkdRL5bYfDKc9Co0SgJsxJJh8S2xFMLMjA/s12Ph3ZRn4vkjrUmSOET4ascCnDJr/+XiTASZY2ng8c8EvBapJ4nbPRpSeWRssT0pXahkxytE9cLQaQSmSHZ9msafbsi/ugKgP8x7FCBd7mcpyct+o0BkA7OzouZ2PUCO47QvEPMRb+P+3vjNaIytM0kTUxofFuJoxAaQ8RSUz1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZNB9XicDvWriaOicbwkabZakDVtfwLcYNragSuLlJA=;
 b=eUpBbG8C0Ew7/hQnNtFxBXkiBdzCW2sSPySPiZHquVsZDKXq39mT2KbKew40ohcATTdM6S1+O+Zh28GYuDX+lQQFig3kBhK9Q/3IHI+Ez3vol963aS6ww/RpzEESUWug3qwbFM6cUmpV24dUEAmVwkPCzLxPeJuH/yJA4m6ysro=
Authentication-Results: anisinha.ca; dkim=none (message not signed)
 header.d=none;anisinha.ca; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2288.namprd10.prod.outlook.com (2603:10b6:301:2c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 22:32:51 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%9]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 22:32:51 +0000
Message-ID: <5212409f-e3ce-9df1-5ac8-e08ae8bcecef@oracle.com>
Date: Tue, 19 Oct 2021 17:32:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 10/10] ACPI ERST: step 6 of bios-tables-test.c
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
 <1634324580-27120-11-git-send-email-eric.devolder@oracle.com>
 <alpine.DEB.2.22.394.2110192023540.172612@anisinha-lenovo>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <alpine.DEB.2.22.394.2110192023540.172612@anisinha-lenovo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:806:130::8) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPV6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SA0PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:806:130::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.13 via Frontend
 Transport; Tue, 19 Oct 2021 22:32:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12f1decb-6670-4b93-c379-08d9935062b4
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB228835ABA39B17E9AF7484B297BD9@MWHPR1001MB2288.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:192;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M/HtTV4QryL8V8f7cwk4OmicamWAUNqIwLljUpUmGeAeYIDn7B3UNfqpjNU6AqVfbdhTLOBbrpVaDY8bEV0LismkBpl52WtgKElrWwtfVOuYQ7p3WAD7jeClFqxxUzcYh9+8J8ersmpHcfZFHs9p/xGUnCJaNlWbkJSoZxk+voyH4Qu2V0PN0zx1MQP3fVIZzORaeKsDs9CHXwpP+9J++X60Nv6cPqfy/+ZzPd8UOQvb3/wgXBiLTOEaDAm67jx9yWscvoLsnfci6KrqhzR/U1mCtT8Z3ogR367VymdezitOnoTZWCBH5s/GGDhq8UcqpiO4fO8ID28Tub+OEktl3vfaQVlMz2hbNOsIGy15hRg+fAtGUFt6lyOkD+gKcJ/fB9IRYV8y9BjaMylH2cnNW1uojZEKb8ZJey98N7WpihBFXQTQdmhI4LFEXhjvD/yxI1Lg906GSrxmUzoOrHHFo6fl21uY4m22bS3LlpbgkUvkyoGAJ9lqovWc3JJIXWOxWGNjera7PDAALuonqYFSfcFPFjlI2VRnrOZM5o1VWpLOQnRb1Mc9xKUV7GtbNsNLs+hXmyZqVzLbpBwukSMCLw+4qz6DRBbsl1Nt983QxqGcnl4Galj2/o1vdbz63iW+M4z7qYIfYTsDDHfgVKZ5R2Z/NssRaIST3b8UwqenAw5SH2/kSYUIsamrW1kFGGLxyDj8i2JGBzWuYoEpGxgCrJ/MTWFJg2HhTiFeamReQdM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(83380400001)(508600001)(2616005)(31686004)(36756003)(30864003)(4326008)(2906002)(316002)(5660300002)(6666004)(6916009)(38100700002)(66476007)(66946007)(4001150100001)(53546011)(86362001)(8936002)(31696002)(66556008)(186003)(107886003)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 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
 =?utf-8?B?ZDVuL0FDQnZIc1ZGVUtKdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f1decb-6670-4b93-c379-08d9935062b4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 22:32:51.8021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KU/C7im5RjdziHHZQsejtCMNwGXTfCOGpP9kq2nwMSbS4TpACIDX24JEn32A2rHHeTZKu/QHKMqVn5IyGLxeOOtjQHL8PF4uFe10UZRlsWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2288
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10142
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110190128
X-Proofpoint-ORIG-GUID: v2iQbWzPXriALKGKqzhLbJ94wZdWYaYi
X-Proofpoint-GUID: v2iQbWzPXriALKGKqzhLbJ94wZdWYaYi
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ani, below. Eric

On 10/19/21 09:58, Ani Sinha wrote:
> 
> 
> On Fri, 15 Oct 2021, Eric DeVolder wrote:
> 
>> Following the guidelines in tests/qtest/bios-tables-test.c, this
>> is step 6.
>>
>> Below is the disassembly of an ERST table, tests/data/acpi/pc/ERST.
>> This is a PCI device and as such its base address can change; it
>> is possible for the address fields to differ between this and other
>> ERST tables.
>>
>> [000h 0000   4]                    Signature : "ERST"    [Error Record Serialization Table]
>> [004h 0004   4]                 Table Length : 00000390
>> [008h 0008   1]                     Revision : 01
>> [009h 0009   1]                     Checksum : D6
>> [00Ah 0010   6]                       Oem ID : "BOCHS "
>> [010h 0016   8]                 Oem Table ID : "BXPC    "
>> [018h 0024   4]                 Oem Revision : 00000001
>> [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>> [020h 0032   4]        Asl Compiler Revision : 00000001
>>
>> [024h 0036   4]  Serialization Header Length : 00000030
>> [028h 0040   4]                     Reserved : 00000000
>> [02Ch 0044   4]      Instruction Entry Count : 0000001B
>>
>> [030h 0048   1]                       Action : 00 [Begin Write Operation]
>> [031h 0049   1]                  Instruction : 03 [Write Register Value]
>> [032h 0050   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [033h 0051   1]                     Reserved : 00
>>
>> [034h 0052  12]              Register Region : [Generic Address Structure]
>> [034h 0052   1]                     Space ID : 00 [SystemMemory]
>> [035h 0053   1]                    Bit Width : 20
>> [036h 0054   1]                   Bit Offset : 00
>> [037h 0055   1]         Encoded Access Width : 03 [DWord Access:32]
>> [038h 0056   8]                      Address : 00000000FEBF3000
>>
>> [040h 0064   8]                        Value : 0000000000000000
>> [048h 0072   8]                         Mask : 00000000000000FF
>>
>> [050h 0080   1]                       Action : 01 [Begin Read Operation]
>> [051h 0081   1]                  Instruction : 03 [Write Register Value]
>> [052h 0082   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [053h 0083   1]                     Reserved : 00
>>
>> [054h 0084  12]              Register Region : [Generic Address Structure]
>> [054h 0084   1]                     Space ID : 00 [SystemMemory]
>> [055h 0085   1]                    Bit Width : 20
>> [056h 0086   1]                   Bit Offset : 00
>> [057h 0087   1]         Encoded Access Width : 03 [DWord Access:32]
>> [058h 0088   8]                      Address : 00000000FEBF3000
>>
>> [060h 0096   8]                        Value : 0000000000000001
>> [068h 0104   8]                         Mask : 00000000000000FF
>>
>> [070h 0112   1]                       Action : 02 [Begin Clear Operation]
>> [071h 0113   1]                  Instruction : 03 [Write Register Value]
>> [072h 0114   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [073h 0115   1]                     Reserved : 00
>>
>> [074h 0116  12]              Register Region : [Generic Address Structure]
>> [074h 0116   1]                     Space ID : 00 [SystemMemory]
>> [075h 0117   1]                    Bit Width : 20
>> [076h 0118   1]                   Bit Offset : 00
>> [077h 0119   1]         Encoded Access Width : 03 [DWord Access:32]
>> [078h 0120   8]                      Address : 00000000FEBF3000
>>
>> [080h 0128   8]                        Value : 0000000000000002
>> [088h 0136   8]                         Mask : 00000000000000FF
>>
>> [090h 0144   1]                       Action : 03 [End Operation]
>> [091h 0145   1]                  Instruction : 03 [Write Register Value]
>> [092h 0146   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [093h 0147   1]                     Reserved : 00
>>
>> [094h 0148  12]              Register Region : [Generic Address Structure]
>> [094h 0148   1]                     Space ID : 00 [SystemMemory]
>> [095h 0149   1]                    Bit Width : 20
>> [096h 0150   1]                   Bit Offset : 00
>> [097h 0151   1]         Encoded Access Width : 03 [DWord Access:32]
>> [098h 0152   8]                      Address : 00000000FEBF3000
>>
>> [0A0h 0160   8]                        Value : 0000000000000003
>> [0A8h 0168   8]                         Mask : 00000000000000FF
>>
>> [0B0h 0176   1]                       Action : 04 [Set Record Offset]
>> [0B1h 0177   1]                  Instruction : 02 [Write Register]
>> [0B2h 0178   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [0B3h 0179   1]                     Reserved : 00
>>
>> [0B4h 0180  12]              Register Region : [Generic Address Structure]
>> [0B4h 0180   1]                     Space ID : 00 [SystemMemory]
>> [0B5h 0181   1]                    Bit Width : 20
>> [0B6h 0182   1]                   Bit Offset : 00
>> [0B7h 0183   1]         Encoded Access Width : 03 [DWord Access:32]
>> [0B8h 0184   8]                      Address : 00000000FEBF3008
>>
>> [0C0h 0192   8]                        Value : 0000000000000000
>> [0C8h 0200   8]                         Mask : 00000000FFFFFFFF
>>
>> [0D0h 0208   1]                       Action : 04 [Set Record Offset]
>> [0D1h 0209   1]                  Instruction : 03 [Write Register Value]
>> [0D2h 0210   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [0D3h 0211   1]                     Reserved : 00
>>
>> [0D4h 0212  12]              Register Region : [Generic Address Structure]
>> [0D4h 0212   1]                     Space ID : 00 [SystemMemory]
>> [0D5h 0213   1]                    Bit Width : 20
>> [0D6h 0214   1]                   Bit Offset : 00
>> [0D7h 0215   1]         Encoded Access Width : 03 [DWord Access:32]
>> [0D8h 0216   8]                      Address : 00000000FEBF3000
>>
>> [0E0h 0224   8]                        Value : 0000000000000004
>> [0E8h 0232   8]                         Mask : 00000000000000FF
>>
>> [0F0h 0240   1]                       Action : 05 [Execute Operation]
>> [0F1h 0241   1]                  Instruction : 03 [Write Register Value]
>> [0F2h 0242   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [0F3h 0243   1]                     Reserved : 00
>>
>> [0F4h 0244  12]              Register Region : [Generic Address Structure]
>> [0F4h 0244   1]                     Space ID : 00 [SystemMemory]
>> [0F5h 0245   1]                    Bit Width : 20
>> [0F6h 0246   1]                   Bit Offset : 00
>> [0F7h 0247   1]         Encoded Access Width : 03 [DWord Access:32]
>> [0F8h 0248   8]                      Address : 00000000FEBF3008
>>
>> [100h 0256   8]                        Value : 000000000000009C
>> [108h 0264   8]                         Mask : 00000000000000FF
>>
>> [110h 0272   1]                       Action : 05 [Execute Operation]
>> [111h 0273   1]                  Instruction : 03 [Write Register Value]
>> [112h 0274   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [113h 0275   1]                     Reserved : 00
>>
>> [114h 0276  12]              Register Region : [Generic Address Structure]
>> [114h 0276   1]                     Space ID : 00 [SystemMemory]
>> [115h 0277   1]                    Bit Width : 20
>> [116h 0278   1]                   Bit Offset : 00
>> [117h 0279   1]         Encoded Access Width : 03 [DWord Access:32]
>> [118h 0280   8]                      Address : 00000000FEBF3000
>>
>> [120h 0288   8]                        Value : 0000000000000005
>> [128h 0296   8]                         Mask : 00000000000000FF
>>
>> [130h 0304   1]                       Action : 06 [Check Busy Status]
>> [131h 0305   1]                  Instruction : 03 [Write Register Value]
>> [132h 0306   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [133h 0307   1]                     Reserved : 00
>>
>> [134h 0308  12]              Register Region : [Generic Address Structure]
>> [134h 0308   1]                     Space ID : 00 [SystemMemory]
>> [135h 0309   1]                    Bit Width : 20
>> [136h 0310   1]                   Bit Offset : 00
>> [137h 0311   1]         Encoded Access Width : 03 [DWord Access:32]
>> [138h 0312   8]                      Address : 00000000FEBF3000
>>
>> [140h 0320   8]                        Value : 0000000000000006
>> [148h 0328   8]                         Mask : 00000000000000FF
>>
>> [150h 0336   1]                       Action : 06 [Check Busy Status]
>> [151h 0337   1]                  Instruction : 01 [Read Register Value]
>> [152h 0338   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [153h 0339   1]                     Reserved : 00
>>
>> [154h 0340  12]              Register Region : [Generic Address Structure]
>> [154h 0340   1]                     Space ID : 00 [SystemMemory]
>> [155h 0341   1]                    Bit Width : 20
>> [156h 0342   1]                   Bit Offset : 00
>> [157h 0343   1]         Encoded Access Width : 03 [DWord Access:32]
>> [158h 0344   8]                      Address : 00000000FEBF3008
>>
>> [160h 0352   8]                        Value : 0000000000000001
>> [168h 0360   8]                         Mask : 00000000000000FF
>>
>> [170h 0368   1]                       Action : 07 [Get Command Status]
>> [171h 0369   1]                  Instruction : 03 [Write Register Value]
>> [172h 0370   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [173h 0371   1]                     Reserved : 00
>>
>> [174h 0372  12]              Register Region : [Generic Address Structure]
>> [174h 0372   1]                     Space ID : 00 [SystemMemory]
>> [175h 0373   1]                    Bit Width : 20
>> [176h 0374   1]                   Bit Offset : 00
>> [177h 0375   1]         Encoded Access Width : 03 [DWord Access:32]
>> [178h 0376   8]                      Address : 00000000FEBF3000
>>
>> [180h 0384   8]                        Value : 0000000000000007
>> [188h 0392   8]                         Mask : 00000000000000FF
>>
>> [190h 0400   1]                       Action : 07 [Get Command Status]
>> [191h 0401   1]                  Instruction : 00 [Read Register]
>> [192h 0402   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [193h 0403   1]                     Reserved : 00
>>
>> [194h 0404  12]              Register Region : [Generic Address Structure]
>> [194h 0404   1]                     Space ID : 00 [SystemMemory]
>> [195h 0405   1]                    Bit Width : 20
>> [196h 0406   1]                   Bit Offset : 00
>> [197h 0407   1]         Encoded Access Width : 03 [DWord Access:32]
>> [198h 0408   8]                      Address : 00000000FEBF3008
>>
>> [1A0h 0416   8]                        Value : 0000000000000000
>> [1A8h 0424   8]                         Mask : 00000000000000FF
>>
>> [1B0h 0432   1]                       Action : 08 [Get Record Identifier]
>> [1B1h 0433   1]                  Instruction : 03 [Write Register Value]
>> [1B2h 0434   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [1B3h 0435   1]                     Reserved : 00
>>
>> [1B4h 0436  12]              Register Region : [Generic Address Structure]
>> [1B4h 0436   1]                     Space ID : 00 [SystemMemory]
>> [1B5h 0437   1]                    Bit Width : 20
>> [1B6h 0438   1]                   Bit Offset : 00
>> [1B7h 0439   1]         Encoded Access Width : 03 [DWord Access:32]
>> [1B8h 0440   8]                      Address : 00000000FEBF3000
>>
>> [1C0h 0448   8]                        Value : 0000000000000008
>> [1C8h 0456   8]                         Mask : 00000000000000FF
>>
>> [1D0h 0464   1]                       Action : 08 [Get Record Identifier]
>> [1D1h 0465   1]                  Instruction : 00 [Read Register]
>> [1D2h 0466   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [1D3h 0467   1]                     Reserved : 00
>>
>> [1D4h 0468  12]              Register Region : [Generic Address Structure]
>> [1D4h 0468   1]                     Space ID : 00 [SystemMemory]
>> [1D5h 0469   1]                    Bit Width : 40
>> [1D6h 0470   1]                   Bit Offset : 00
>> [1D7h 0471   1]         Encoded Access Width : 04 [QWord Access:64]
>> [1D8h 0472   8]                      Address : 00000000FEBF3008
>>
>> [1E0h 0480   8]                        Value : 0000000000000000
>> [1E8h 0488   8]                         Mask : FFFFFFFFFFFFFFFF
>>
>> [1F0h 0496   1]                       Action : 09 [Set Record Identifier]
>> [1F1h 0497   1]                  Instruction : 02 [Write Register]
>> [1F2h 0498   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [1F3h 0499   1]                     Reserved : 00
>>
>> [1F4h 0500  12]              Register Region : [Generic Address Structure]
>> [1F4h 0500   1]                     Space ID : 00 [SystemMemory]
>> [1F5h 0501   1]                    Bit Width : 40
>> [1F6h 0502   1]                   Bit Offset : 00
>> [1F7h 0503   1]         Encoded Access Width : 04 [QWord Access:64]
>> [1F8h 0504   8]                      Address : 00000000FEBF3008
>>
>> [200h 0512   8]                        Value : 0000000000000000
>> [208h 0520   8]                         Mask : FFFFFFFFFFFFFFFF
>>
>> [210h 0528   1]                       Action : 09 [Set Record Identifier]
>> [211h 0529   1]                  Instruction : 03 [Write Register Value]
>> [212h 0530   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [213h 0531   1]                     Reserved : 00
>>
>> [214h 0532  12]              Register Region : [Generic Address Structure]
>> [214h 0532   1]                     Space ID : 00 [SystemMemory]
>> [215h 0533   1]                    Bit Width : 20
>> [216h 0534   1]                   Bit Offset : 00
>> [217h 0535   1]         Encoded Access Width : 03 [DWord Access:32]
>> [218h 0536   8]                      Address : 00000000FEBF3000
>>
>> [220h 0544   8]                        Value : 0000000000000009
>> [228h 0552   8]                         Mask : 00000000000000FF
>>
>> [230h 0560   1]                       Action : 0A [Get Record Count]
>> [231h 0561   1]                  Instruction : 03 [Write Register Value]
>> [232h 0562   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [233h 0563   1]                     Reserved : 00
>>
>> [234h 0564  12]              Register Region : [Generic Address Structure]
>> [234h 0564   1]                     Space ID : 00 [SystemMemory]
>> [235h 0565   1]                    Bit Width : 20
>> [236h 0566   1]                   Bit Offset : 00
>> [237h 0567   1]         Encoded Access Width : 03 [DWord Access:32]
>> [238h 0568   8]                      Address : 00000000FEBF3000
>>
>> [240h 0576   8]                        Value : 000000000000000A
>> [248h 0584   8]                         Mask : 00000000000000FF
>>
>> [250h 0592   1]                       Action : 0A [Get Record Count]
>> [251h 0593   1]                  Instruction : 00 [Read Register]
>> [252h 0594   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [253h 0595   1]                     Reserved : 00
>>
>> [254h 0596  12]              Register Region : [Generic Address Structure]
>> [254h 0596   1]                     Space ID : 00 [SystemMemory]
>> [255h 0597   1]                    Bit Width : 20
>> [256h 0598   1]                   Bit Offset : 00
>> [257h 0599   1]         Encoded Access Width : 03 [DWord Access:32]
>> [258h 0600   8]                      Address : 00000000FEBF3008
>>
>> [260h 0608   8]                        Value : 0000000000000000
>> [268h 0616   8]                         Mask : 00000000FFFFFFFF
>>
>> [270h 0624   1]                       Action : 0B [Begin Dummy Write]
>> [271h 0625   1]                  Instruction : 03 [Write Register Value]
>> [272h 0626   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [273h 0627   1]                     Reserved : 00
>>
>> [274h 0628  12]              Register Region : [Generic Address Structure]
>> [274h 0628   1]                     Space ID : 00 [SystemMemory]
>> [275h 0629   1]                    Bit Width : 20
>> [276h 0630   1]                   Bit Offset : 00
>> [277h 0631   1]         Encoded Access Width : 03 [DWord Access:32]
>> [278h 0632   8]                      Address : 00000000FEBF3000
>>
>> [280h 0640   8]                        Value : 000000000000000B
>> [288h 0648   8]                         Mask : 00000000000000FF
>>
>> [290h 0656   1]                       Action : 0D [Get Error Address Range]
>> [291h 0657   1]                  Instruction : 03 [Write Register Value]
>> [292h 0658   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [293h 0659   1]                     Reserved : 00
>>
>> [294h 0660  12]              Register Region : [Generic Address Structure]
>> [294h 0660   1]                     Space ID : 00 [SystemMemory]
>> [295h 0661   1]                    Bit Width : 20
>> [296h 0662   1]                   Bit Offset : 00
>> [297h 0663   1]         Encoded Access Width : 03 [DWord Access:32]
>> [298h 0664   8]                      Address : 00000000FEBF3000
>>
>> [2A0h 0672   8]                        Value : 000000000000000D
>> [2A8h 0680   8]                         Mask : 00000000000000FF
>>
>> [2B0h 0688   1]                       Action : 0D [Get Error Address Range]
>> [2B1h 0689   1]                  Instruction : 00 [Read Register]
>> [2B2h 0690   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [2B3h 0691   1]                     Reserved : 00
>>
>> [2B4h 0692  12]              Register Region : [Generic Address Structure]
>> [2B4h 0692   1]                     Space ID : 00 [SystemMemory]
>> [2B5h 0693   1]                    Bit Width : 40
>> [2B6h 0694   1]                   Bit Offset : 00
>> [2B7h 0695   1]         Encoded Access Width : 04 [QWord Access:64]
>> [2B8h 0696   8]                      Address : 00000000FEBF3008
>>
>> [2C0h 0704   8]                        Value : 0000000000000000
>> [2C8h 0712   8]                         Mask : FFFFFFFFFFFFFFFF
>>
>> [2D0h 0720   1]                       Action : 0E [Get Error Address Length]
>> [2D1h 0721   1]                  Instruction : 03 [Write Register Value]
>> [2D2h 0722   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [2D3h 0723   1]                     Reserved : 00
>>
>> [2D4h 0724  12]              Register Region : [Generic Address Structure]
>> [2D4h 0724   1]                     Space ID : 00 [SystemMemory]
>> [2D5h 0725   1]                    Bit Width : 20
>> [2D6h 0726   1]                   Bit Offset : 00
>> [2D7h 0727   1]         Encoded Access Width : 03 [DWord Access:32]
>> [2D8h 0728   8]                      Address : 00000000FEBF3000
>>
>> [2E0h 0736   8]                        Value : 000000000000000E
>> [2E8h 0744   8]                         Mask : 00000000000000FF
>>
>> [2F0h 0752   1]                       Action : 0E [Get Error Address Length]
>> [2F1h 0753   1]                  Instruction : 00 [Read Register]
>> [2F2h 0754   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [2F3h 0755   1]                     Reserved : 00
>>
>> [2F4h 0756  12]              Register Region : [Generic Address Structure]
>> [2F4h 0756   1]                     Space ID : 00 [SystemMemory]
>> [2F5h 0757   1]                    Bit Width : 40
>> [2F6h 0758   1]                   Bit Offset : 00
>> [2F7h 0759   1]         Encoded Access Width : 04 [QWord Access:64]
>> [2F8h 0760   8]                      Address : 00000000FEBF3008
>>
>> [300h 0768   8]                        Value : 0000000000000000
>> [308h 0776   8]                         Mask : 00000000FFFFFFFF
>>
>> [310h 0784   1]                       Action : 0F [Get Error Attributes]
>> [311h 0785   1]                  Instruction : 03 [Write Register Value]
>> [312h 0786   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [313h 0787   1]                     Reserved : 00
>>
>> [314h 0788  12]              Register Region : [Generic Address Structure]
>> [314h 0788   1]                     Space ID : 00 [SystemMemory]
>> [315h 0789   1]                    Bit Width : 20
>> [316h 0790   1]                   Bit Offset : 00
>> [317h 0791   1]         Encoded Access Width : 03 [DWord Access:32]
>> [318h 0792   8]                      Address : 00000000FEBF3000
>>
>> [320h 0800   8]                        Value : 000000000000000F
>> [328h 0808   8]                         Mask : 00000000000000FF
>>
>> [330h 0816   1]                       Action : 0F [Get Error Attributes]
>> [331h 0817   1]                  Instruction : 00 [Read Register]
>> [332h 0818   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [333h 0819   1]                     Reserved : 00
>>
>> [334h 0820  12]              Register Region : [Generic Address Structure]
>> [334h 0820   1]                     Space ID : 00 [SystemMemory]
>> [335h 0821   1]                    Bit Width : 20
>> [336h 0822   1]                   Bit Offset : 00
>> [337h 0823   1]         Encoded Access Width : 03 [DWord Access:32]
>> [338h 0824   8]                      Address : 00000000FEBF3008
>>
>> [340h 0832   8]                        Value : 0000000000000000
>> [348h 0840   8]                         Mask : 00000000FFFFFFFF
>>
>> [350h 0848   1]                       Action : 10 [Execute Timings]
>> [351h 0849   1]                  Instruction : 03 [Write Register Value]
>> [352h 0850   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [353h 0851   1]                     Reserved : 00
>>
>> [354h 0852  12]              Register Region : [Generic Address Structure]
>> [354h 0852   1]                     Space ID : 00 [SystemMemory]
>> [355h 0853   1]                    Bit Width : 20
>> [356h 0854   1]                   Bit Offset : 00
>> [357h 0855   1]         Encoded Access Width : 03 [DWord Access:32]
>> [358h 0856   8]                      Address : 00000000FEBF3000
>>
>> [360h 0864   8]                        Value : 0000000000000010
>> [368h 0872   8]                         Mask : 00000000000000FF
>>
>> [370h 0880   1]                       Action : 10 [Execute Timings]
>> [371h 0881   1]                  Instruction : 00 [Read Register]
>> [372h 0882   1]        Flags (decoded below) : 00
>>                        Preserve Register Bits : 0
>> [373h 0883   1]                     Reserved : 00
>>
>> [374h 0884  12]              Register Region : [Generic Address Structure]
>> [374h 0884   1]                     Space ID : 00 [SystemMemory]
>> [375h 0885   1]                    Bit Width : 40
>> [376h 0886   1]                   Bit Offset : 00
>> [377h 0887   1]         Encoded Access Width : 04 [QWord Access:64]
>> [378h 0888   8]                      Address : 00000000FEBF3008
>>
>> [380h 0896   8]                        Value : 0000000000000000
>> [388h 0904   8]                         Mask : FFFFFFFFFFFFFFFF
>>
>> And the diff of DSDT (note this seems to suggest that some other
>> device is omitted from the .acpierst configuration, but otherwise
>> DSDT is unchanged).
> 
> We need to understand why we see these changes in the DSDT table.

I expected to see a change that reflected adding ERST pointer; but I
don't think this reflects that. Do you have suggestions?

> 
>>
>>   --- dsdt-noacpierst.dsl	2021-10-14 15:44:13.000000000 -0400
>>   +++ dsdt-acpierst.dsl	2021-10-14 15:47:14.000000000 -0400
>> @@ -5,13 +5,13 @@
>>    *
>>    * Disassembling to symbolic ASL+ operators
>>    *
>> - * Disassembly of tests/data/acpi/pc/DSDT, Thu Oct 14 15:44:13 2021
>> + * Disassembly of tests/data/acpi/pc/DSDT.acpierst, Thu Oct 14 15:47:14 2021
>>    *
>>    * Original Table Header:
>>    *     Signature        "DSDT"
>> - *     Length           0x00001772 (6002)
>> + *     Length           0x00001751 (5969)
>>    *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
>> - *     Checksum         0x9E
>> + *     Checksum         0x95
>>    *     OEM ID           "BOCHS "
>>    *     OEM Table ID     "BXPC    "
>>    *     OEM Revision     0x00000001 (1)
>> @@ -964,16 +964,11 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS "
>>
>>               Device (S18)
>>               {
>> -                Name (_SUN, 0x03)  // _SUN: Slot User Number
>>                   Name (_ADR, 0x00030000)  // _ADR: Address
>> -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
>> -                {
>> -                    PCEJ (BSEL, _SUN)
>> -                }
>> -
>> +                Name (ASUN, 0x03)
>>                   Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
>>                   {
>> -                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
>> +                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
>>                   }
>>               }
>>
>> @@ -1399,11 +1394,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS "
>>
>>               Method (DVNT, 2, NotSerialized)
>>               {
>> -                If ((Arg0 & 0x08))
>> -                {
>> -                    Notify (S18, Arg1)
>> -                }
>> -
>>                   If ((Arg0 & 0x10))
>>                   {
>>                       Notify (S20, Arg1)
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   tests/data/acpi/microvm/ERST.pcie           | Bin 0 -> 912 bytes
>>   tests/data/acpi/pc/DSDT.acpierst            | Bin 0 -> 5969 bytes
>>   tests/data/acpi/q35/DSDT.acpierst           | Bin 0 -> 8306 bytes
>>   tests/qtest/bios-tables-test-allowed-diff.h |   5 -----
>>   4 files changed, 5 deletions(-)
>>
>> diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/microvm/ERST.pcie
>> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..d9a2b3211ab5893a50751ad52be3782579e367f2 100644
>> GIT binary patch
>> literal 912
>> zcmaKpO%8%E5QPUQ|KVrvh9h_c12J)@5f?5!k_Ygv*jGA8UW7?#`}+D#XXyDpKHiZ?
>> z@anI_W$gOrZRl(SB7!yMqx}#E4EC&a5=}m^g_!0^0`kEl)DOuIXM6D@@*xq*8vyqH
>> z)b0KTlmlgmH~xt7vG<k#Z1~z=OnyT76ZX;Ysy^;NC0^^$`kY?zKK;^vMtny1JAD$P
>> zc^BR{l;i*H`IJAW`~~?1`_TXD_wQ2@UlL!DU$GCpQ-4i-O}x_^JdQTRH^e)=(_c$`
>> LOT5z?_v4Aa+v(5&
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
>> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..bb0593eeb8730d51a6f0fe51a00a00df9c83c419 100644
>> GIT binary patch
>> literal 5969
>> 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
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
>> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..b0eafe90e5832935557ec5e6802c0147c88f379c 100644
>> GIT binary patch
>> literal 8306
>> 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
>> L!3s0<%&`9h*gn5%
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>> index c06241a..dfb8523 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1,6 +1 @@
>>   /* List of comma-separated changed AML files to ignore */
>> -"tests/data/acpi/pc/DSDT.acpierst",
>> -"tests/data/acpi/pc/ERST",
>> -"tests/data/acpi/q35/DSDT.acpierst",
>> -"tests/data/acpi/q35/ERST",
>> -"tests/data/acpi/microvm/ERST.pcie",
> 
> What about the blobs for :
> 
> tests/data/acpi/pc/ERST
> tests/data/acpi/q35/ERST
>   since you have indicated above that these tables are also modified ?
> 
> You have only added blobs for the following tables:
> 
>>   tests/data/acpi/microvm/ERST.pcie           | Bin 0 -> 912 bytes
>>   tests/data/acpi/pc/DSDT.acpierst            | Bin 0 -> 5969 bytes
>>   tests/data/acpi/q35/DSDT.acpierst
> 
> Did I miss something?
> 
No, unfortunately I made a mistake and neglected to include those two blobs.

Thanks for examining!
eric


