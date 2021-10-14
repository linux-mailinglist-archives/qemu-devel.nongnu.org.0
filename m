Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 825E942E219
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 21:40:22 +0200 (CEST)
Received: from localhost ([::1]:47158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb6aT-0000DZ-EW
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 15:40:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mb6Xo-0006V2-QQ
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 15:37:36 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:15242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mb6Xj-0001YQ-Na
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 15:37:36 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19EJPYSX022067; 
 Thu, 14 Oct 2021 19:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=HVpETV4OM/pd9NWHXCatfY1z5FGUI6QdFb7o+vxO6uo=;
 b=MABGnPmbV6HT9kxdaOtlab6zLt/Hw7cc2vPpgJ6L1g0XJ/kiJxoh6UKTnDGinJ4A+AbL
 qAQo1HswDwYawwgwJalQ0DwZBOGxD77WPNoUr5rRNrFO1FWhlrtjBmz/S5UaVlPw0JGo
 M9KWm5D8iZVbpcMHzCY/cXebIB3Doq3e8hdIySx5i92W1cF8YJL35RfXudla7TKw5taX
 itYWJIs0ZtMIIBR08zZfbaI4N004UOVU/If5BRaGMnR0/EmoJHEsgi5whw3cS2Pdg0q8
 uGurT2mCGy7y1SBYWiI57iLPKpaxFKlEYT7tveVBAbblBPmgtYgdHg4qD1AVrP+iA4BF nA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bpfvecr2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Oct 2021 19:37:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19EJZFdx105141;
 Thu, 14 Oct 2021 19:37:25 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by userp3030.oracle.com with ESMTP id 3bkyvd9kt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Oct 2021 19:37:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PIceLcESCIFLiAnLyyhDgqpzh8ASAf2ecAMjHZNHNBGczIyAp0l2LqMw8WbWtNXh4rOhSR49OFMW8XTLeE1MQFU7yG2Ixu8qpxKJriBuR8ecabW6VyuDpr4EOi5lkGtFYNo1Y5fY0OdyL8knuWN6Dqk0R3JUSl6EBlCmsEB2p6DzkF74qoeF5TC5EMIcqh5TRGM2Acl19dqaNuSgoQDrUeAjHHGcdE/jhaxWtIRUj7jyqWzPPm2rD7Mh21nDVIqjd9NVGlOwaOPiPEqqron0CAJUn0Xbh+k9i8LD5yYDOVhbClS1VWB8lxbtTdNksVPMks0qb0LSGUtf8WaWEzXRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVpETV4OM/pd9NWHXCatfY1z5FGUI6QdFb7o+vxO6uo=;
 b=Iyy3n1wI0rRbh7XyhjienJiU5lWNrkFpPrQK6EDO7uqyvo5bEedgIIXxtYtkH9vnHQdz8cDbdfJx6JW/hH5BCrEL8Drg01aLZ7Ek9wSmkX0trXfxWaMMIZ5LXv8IS6PFewzepADOfk+rrw9/klOTlGXuOv25bvxSGh0xcPEI9HpUOr7gow7s+N2l2oZifvP8oUkQFlvLO8/FR+WDfNi2R7UNQXZGwhehqXz4qWFq2VaTVqDhGSBOZVGJuMkRzwQKsW3Kaoot5Wgff8wu+5YQl+ckMh3GbiEEe/6XV3y/CSNBsp1onw2uvmQQIfNp+VAS0wvLB4jSabnBkEySTV3zow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVpETV4OM/pd9NWHXCatfY1z5FGUI6QdFb7o+vxO6uo=;
 b=OZXh8QMz0ppvxJnVudRj9KXN5KuUF/yWazCfYb2SmxJ3a2W8fwk5vwE1xSxLcPAb1ihWjHapez3pr1h75UW+qr8jUT772kDa16iuHZBUJFwjFg5hCNPnHUpZpuDh0TF7aljjoX+Pm5OFfUK8UhlOeMsRE+mhxf0vieI6UWQBSvI=
Authentication-Results: anisinha.ca; dkim=none (message not signed)
 header.d=none;anisinha.ca; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1632.namprd10.prod.outlook.com (2603:10b6:301:8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Thu, 14 Oct
 2021 19:37:21 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%9]) with mapi id 15.20.4608.017; Thu, 14 Oct 2021
 19:37:21 +0000
Message-ID: <7628f839-4331-dc24-67d8-4ac459aff8b5@oracle.com>
Date: Thu, 14 Oct 2021 14:37:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v7 10/10] ACPI ERST: step 6 of bios-tables-test.c
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
 <1633626876-12115-11-git-send-email-eric.devolder@oracle.com>
 <alpine.DEB.2.22.394.2110080638080.820442@anisinha-lenovo>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <alpine.DEB.2.22.394.2110080638080.820442@anisinha-lenovo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPV6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Thu, 14 Oct 2021 19:37:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b22dc5c-a47b-4148-7ae3-08d98f4a09fa
X-MS-TrafficTypeDiagnostic: MWHPR10MB1632:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB16329F7298A50F7F7CF77DF697B89@MWHPR10MB1632.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dAQEq7tus9lQJwiSJL3f3omzyDyhGenMoHZdKhX5I6KO/kkE4Dh/VRjl6gB8ykwZA8gsBvBD6dpKf5ht9GIGHdJXAR4ak9ApgAtNoQ/CjiAJeXqYPzCbJhvT1E/2k6LNLX13gKUdWIJ44Na2YOwiCeyDa8MTg2ms29fQaZeT8ui1aj0h4VVWEQGdbl2ZGt3D1CpBuViuSMhvJe2v1REHMtiZkvQqGelxmO+JX9xszGVUtmdJXzARjqk24qbwIg22D/MFhjCHT2Ii0+mMpYwRWi5rEAXxw2XC69he4mxel1sn/iUXwK+/+sRN3daZ/ttzli5JX1d+ZbmYUL/JlmCpGHKQD8lQjh7zsc2tUxKqxLuH0sD+FUthRepNP+YHU8FpLYL6ssu9RNX8YnpxyYyvXaiP3pz5ppGEmXUVqFjTzFDfukuwp98u6FKSRVknUm2ueBOA250VMaaLIq/JS8iZmJqIrU6xRxPDXiVfkBg2ElNV3k+r8NKd+Xyy6qkFBBpShg7f9bYzUIkU1TVioHH7sfRhLBm4jtQdaaFZIRCdlM5bGXf2zeYyuSHa/ZgWdoptw8bUfCUvZvoVSoTfCMBVDqVBtZDQz3T82N/8Sc+UbYtk3e2CiGlwAauS4uJqblvhKJF+rOTalDnMIq6rv1bE4BN3x0P0Owd1AAntuNoq2SfaoYG2OPQhWbO9x/uoBABNI+UZAH9C/elUfcbyGRBd0onfTdh1vyKMgDXeD6N7S58=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(66946007)(107886003)(31696002)(53546011)(4326008)(316002)(66556008)(8676002)(83380400001)(66476007)(31686004)(36756003)(6486002)(508600001)(30864003)(6916009)(8936002)(2616005)(5660300002)(2906002)(38100700002)(86362001)(45980500001)(43740500002)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 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
 =?utf-8?B?eDlkZ3NUMHlvQkJUaStzdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b22dc5c-a47b-4148-7ae3-08d98f4a09fa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 19:37:20.9707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7WIOWk286TIfmzqz4dWYQU/CYi3ZsJ3AP61x2Lq0ZqRaT4iRVwMRkBEs3g0SJfkCcvPkSuzqjyBIl3y6Z6EDAfDOw2iQ4FKbkXzxaks6wGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1632
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10137
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110140110
X-Proofpoint-GUID: qyix1NqkT3KlqAxLLnRi2sRjCb9PKVdu
X-Proofpoint-ORIG-GUID: qyix1NqkT3KlqAxLLnRi2sRjCb9PKVdu
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, pbonzini@redhat.com,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ani, responses below. eric

On 10/7/21 20:12, Ani Sinha wrote:
> 
> 
> On Thu, 7 Oct 2021, Eric DeVolder wrote:
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
>> Raw Table Data: Length 912 (0x390)
> 
> You can omit this raw table data.

done!

> 
>>
>>      0000: 45 52 53 54 90 03 00 00 01 D6 42 4F 43 48 53 20  // ERST......BOCHS
>>      0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
>>      0020: 01 00 00 00 30 00 00 00 00 00 00 00 1B 00 00 00  // ....0...........
>>      0030: 00 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
>>      0040: 00 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      0050: 01 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
>>      0060: 01 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      0070: 02 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
>>      0080: 02 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      0090: 03 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
>>      00A0: 03 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      00B0: 04 02 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
>>      00C0: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
>>      00D0: 04 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
>>      00E0: 04 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      00F0: 05 03 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
>>      0100: 9C 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      0110: 05 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
>>      0120: 05 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      0130: 06 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
>>      0140: 06 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      0150: 06 01 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
>>      0160: 01 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      0170: 07 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
>>      0180: 07 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      0190: 07 00 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
>>      01A0: 00 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      01B0: 08 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
>>      01C0: 08 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      01D0: 08 00 00 00 00 40 00 04 08 30 BF FE 00 00 00 00  // .....@...0......
>>      01E0: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
>>      01F0: 09 02 00 00 00 40 00 04 08 30 BF FE 00 00 00 00  // .....@...0......
>>      0200: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
>>      0210: 09 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
>>      0220: 09 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      0230: 0A 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
>>      0240: 0A 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      0250: 0A 00 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
>>      0260: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
>>      0270: 0B 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
>>      0280: 0B 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      0290: 0D 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
>>      02A0: 0D 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      02B0: 0D 00 00 00 00 40 00 04 08 30 BF FE 00 00 00 00  // .....@...0......
>>      02C0: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
>>      02D0: 0E 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
>>      02E0: 0E 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      02F0: 0E 00 00 00 00 40 00 04 08 30 BF FE 00 00 00 00  // .....@...0......
>>      0300: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
>>      0310: 0F 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
>>      0320: 0F 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      0330: 0F 00 00 00 00 20 00 03 08 30 BF FE 00 00 00 00  // ..... ...0......
>>      0340: 00 00 00 00 00 00 00 00 FF FF FF FF 00 00 00 00  // ................
>>      0350: 10 03 00 00 00 20 00 03 00 30 BF FE 00 00 00 00  // ..... ...0......
>>      0360: 10 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 00  // ................
>>      0370: 10 00 00 00 00 40 00 04 08 30 BF FE 00 00 00 00  // .....@...0......
>>      0380: 00 00 00 00 00 00 00 00 FF FF FF FF FF FF FF FF  // ................
>>
> 
> We would also need to know what diff in DSDT table is introduced. So need
> to specify that here as well.

ok!

> 
> 
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   tests/data/acpi/microvm/ERST.pcie           | Bin 0 -> 912 bytes
>>   tests/data/acpi/pc/APIC.acpierst            | Bin 0 -> 120 bytes
>>   tests/data/acpi/pc/DSDT.acpierst            | Bin 0 -> 5969 bytes
>>   tests/data/acpi/pc/ERST.acpierst            | Bin 0 -> 912 bytes
>>   tests/data/acpi/pc/FACP.acpierst            | Bin 0 -> 116 bytes
>>   tests/data/acpi/pc/FACS.acpierst            | Bin 0 -> 64 bytes
>>   tests/data/acpi/pc/HPET.acpierst            | Bin 0 -> 56 bytes
>>   tests/data/acpi/pc/WAET.acpierst            | Bin 0 -> 40 bytes
>>   tests/data/acpi/q35/APIC.acpierst           | Bin 0 -> 120 bytes
>>   tests/data/acpi/q35/DSDT.acpierst           | Bin 0 -> 8306 bytes
>>   tests/data/acpi/q35/ERST.acpierst           | Bin 0 -> 912 bytes
>>   tests/data/acpi/q35/FACP.acpierst           | Bin 0 -> 244 bytes
>>   tests/data/acpi/q35/FACS.acpierst           | Bin 0 -> 64 bytes
>>   tests/data/acpi/q35/HPET.acpierst           | Bin 0 -> 56 bytes
>>   tests/data/acpi/q35/MCFG.acpierst           | Bin 0 -> 60 bytes
>>   tests/data/acpi/q35/WAET.acpierst           | Bin 0 -> 40 bytes
>>   tests/qtest/bios-tables-test-allowed-diff.h |   5 -----
>>   17 files changed, 5 deletions(-)
>>   create mode 100644 tests/data/acpi/pc/APIC.acpierst
>>   create mode 100644 tests/data/acpi/pc/ERST.acpierst
>>   create mode 100644 tests/data/acpi/pc/FACP.acpierst
>>   create mode 100644 tests/data/acpi/pc/FACS.acpierst
>>   create mode 100644 tests/data/acpi/pc/HPET.acpierst
>>   create mode 100644 tests/data/acpi/pc/WAET.acpierst
>>   create mode 100644 tests/data/acpi/q35/APIC.acpierst
>>   create mode 100644 tests/data/acpi/q35/ERST.acpierst
>>   create mode 100644 tests/data/acpi/q35/FACP.acpierst
>>   create mode 100644 tests/data/acpi/q35/FACS.acpierst
>>   create mode 100644 tests/data/acpi/q35/HPET.acpierst
>>   create mode 100644 tests/data/acpi/q35/MCFG.acpierst
>>   create mode 100644 tests/data/acpi/q35/WAET.acpierst
> 
> 
> Why so many files are touched? We only need to commit the test specific
> ERST blobs and DSDT table blobs. So basically these files which you have
> told the test framework to allow changes for:
> 
>> -"tests/data/acpi/pc/DSDT.acpierst",
>> -"tests/data/acpi/pc/ERST",
>> -"tests/data/acpi/q35/DSDT.acpierst",
>> -"tests/data/acpi/q35/ERST",
>> -"tests/data/acpi/microvm/ERST.pcie",
> 
> 

Done. Thanks for explaining, it wasn't clear to me from bios-tables-test.

> Rest of other tables should remain untouched.

ok

> 
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
>> diff --git a/tests/data/acpi/pc/APIC.acpierst b/tests/data/acpi/pc/APIC.acpierst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..208331db53b7dd5c6205cce0e95427636b86dd64
>> GIT binary patch
>> literal 120
>> zcmZ<^@N}+VU|?YEa`Jcf2v%^42yj*a0!E-1hz+6{7#{os(;Pr`KprCxNbJBr5Xr;^
>> h#2^NU#mWk#c|j~rP8f>|r~o3y%?)O;u>A)b0RYv*3;_TD
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
>> diff --git a/tests/data/acpi/pc/ERST.acpierst b/tests/data/acpi/pc/ERST.acpierst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..f24fadd345c798ee5c17cdb66e0e1703bd1b2f26
>> GIT binary patch
>> literal 912
>> zcmaKpOAdlC6h#XZC=fn#CoF*_7>J28jW}>wF2KFG3zs9lTPTnl;U#=7r>E_sr(1u2
>> z21<FK_R^jEx_w-`TFO&O;T_LLF4O@x8LMi!H}5Z^t6_Tah{H!Y?i2S%JoA7!BFgz1
>> zf~;?N{b8^}H2K=viyuzh`L7M``U{CiG=Ib#4X^gc{m10T<lDURCp`CW$T#HMd{o-?
>> zH~aE`PznCu9;f*enm;9;GDrTme_0zSBR|7ODR;g(@qEM!N8Z_gL4HBL%^N<3mgJY@
>> R+q~0XMSexT%^U0Ee0~)`g#iEn
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/pc/FACP.acpierst b/tests/data/acpi/pc/FACP.acpierst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..5fe21a5967aaaa2e72bf213d91f57a573cd4d38f
>> GIT binary patch
>> literal 116
>> zcmZ>BbPgzCU|?XhcJg=j2v%^42yj*a0!E-1hz+7)fRTZdVH1$^@dJ=xgNU*~X%LSC
>> f$bPUMD$c~f!UAOe=l{<S5n*630y361FfafBit`Qu
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/pc/FACS.acpierst b/tests/data/acpi/pc/FACS.acpierst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..fc67ecc40782bd7fe8921e430d7de67f0bfaad93
>> GIT binary patch
>> literal 64
>> PcmZ>BbPjf4ARhn#RKNjV
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/pc/HPET.acpierst b/tests/data/acpi/pc/HPET.acpierst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..19f704abdd3909a0983232ee7b93318811f71b19
>> GIT binary patch
>> literal 56
>> xcmeYWa1F6wU|?X};^gn_5v<@85#X!<1dKp25F11@E^2E4Qb2IwAB1LL002JR3IPBB
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/pc/WAET.acpierst b/tests/data/acpi/pc/WAET.acpierst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..ac0db59183096ea1d93832a421015385ba93aba0
>> GIT binary patch
>> literal 40
>> mcmWG{bPds9U|?Xhbn<uh2v%^42yj*a0!E-1hz+8dfEWOl3kCrI
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/q35/APIC.acpierst b/tests/data/acpi/q35/APIC.acpierst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..208331db53b7dd5c6205cce0e95427636b86dd64
>> GIT binary patch
>> literal 120
>> zcmZ<^@N}+VU|?YEa`Jcf2v%^42yj*a0!E-1hz+6{7#{os(;Pr`KprCxNbJBr5Xr;^
>> h#2^NU#mWk#c|j~rP8f>|r~o3y%?)O;u>A)b0RYv*3;_TD
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
>> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..950c286b4c751f3c116a11d8892779942375e16b 100644
>> GIT binary patch
>> literal 8306
>> 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
>> Om<Viw6=vv}VgCoUJHKiG
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/q35/ERST.acpierst b/tests/data/acpi/q35/ERST.acpierst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..f24fadd345c798ee5c17cdb66e0e1703bd1b2f26
>> GIT binary patch
>> literal 912
>> zcmaKpOAdlC6h#XZC=fn#CoF*_7>J28jW}>wF2KFG3zs9lTPTnl;U#=7r>E_sr(1u2
>> z21<FK_R^jEx_w-`TFO&O;T_LLF4O@x8LMi!H}5Z^t6_Tah{H!Y?i2S%JoA7!BFgz1
>> zf~;?N{b8^}H2K=viyuzh`L7M``U{CiG=Ib#4X^gc{m10T<lDURCp`CW$T#HMd{o-?
>> zH~aE`PznCu9;f*enm;9;GDrTme_0zSBR|7ODR;g(@qEM!N8Z_gL4HBL%^N<3mgJY@
>> R+q~0XMSexT%^U0Ee0~)`g#iEn
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/q35/FACP.acpierst b/tests/data/acpi/q35/FACP.acpierst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..f6a864cc863c7763f6c09d3814ad184a658fa0a0
>> GIT binary patch
>> literal 244
>> zcmZ>BbPo8!z`($~)5+i2BUr&HBEVSz2pEB4AU24G0Y(N+hD|^Y6El!tgNU*~X%LSC
>> z$X0-fGcm9T0LA|E|L2FOWMD7?GM2V5Ffej3F#P0!h{7ddihwku0+2v57svwxMxcSn
>> X_QAxFX+{NzJ3wNL4G8yu_%Hwf>-7!+
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/q35/FACS.acpierst b/tests/data/acpi/q35/FACS.acpierst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..fc67ecc40782bd7fe8921e430d7de67f0bfaad93
>> GIT binary patch
>> literal 64
>> PcmZ>BbPjf4ARhn#RKNjV
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/q35/HPET.acpierst b/tests/data/acpi/q35/HPET.acpierst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..19f704abdd3909a0983232ee7b93318811f71b19
>> GIT binary patch
>> literal 56
>> xcmeYWa1F6wU|?X};^gn_5v<@85#X!<1dKp25F11@E^2E4Qb2IwAB1LL002JR3IPBB
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/q35/MCFG.acpierst b/tests/data/acpi/q35/MCFG.acpierst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..696bc969f2cd51f2e243090c9aff8619651b2dc1
>> GIT binary patch
>> literal 60
>> rcmeZuc5}C3U|?YEaq@Te2v%^42yj*a0!E-1hz+8Vzy>J$KZphZEJX+b
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/q35/WAET.acpierst b/tests/data/acpi/q35/WAET.acpierst
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..ac0db59183096ea1d93832a421015385ba93aba0
>> GIT binary patch
>> literal 40
>> mcmWG{bPds9U|?Xhbn<uh2v%^42yj*a0!E-1hz+8dfEWOl3kCrI
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
>> --
>> 1.8.3.1
>>
>>

