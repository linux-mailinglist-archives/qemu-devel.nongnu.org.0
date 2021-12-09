Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E03946F2A2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 18:57:58 +0100 (CET)
Received: from localhost ([::1]:59432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNg4-0006iQ-Tb
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 12:57:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNeM-0005Dr-PA
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:56:10 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:36256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNeJ-0002RK-RQ
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:56:10 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HnBLH019878; 
 Thu, 9 Dec 2021 17:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=6hup+WW6tyoW/a/zDT2CWBFt3Gc/3LvuYGUko5HwKA4=;
 b=shgquXbC3eCZf0W1XVIbahgt2Ra0hMaJxXMChVmAUwb2To5ItV62WX/yGT4EBlB0ui2L
 xa3ibgKPyDopmw56NzvMyClRmPt//mro/+gpCT4B6DHlrjWHaPCLUeG30Z4i9I7lb/Mx
 g8qf6clhAVBnAKugDHpYB7mdFGy3Gf1fiQKklfM3KwAUi854bDZEFMxQmo6CUOqIkYyM
 Th9bt2jKzfxSrAYJgUSIjg6bhdQR8KXVx5zF0m3AlJ7rGvJvif1YqkYEo/wdN5+ZEQwP
 Id/3ePcQMNnk+K8G3gC7QamI+S8f7LwMyfKVWJqrM9Dp6ALK6iFlbmCggMcph9aROxYU zQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctu96uuua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:56:06 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HpUVO189753;
 Thu, 9 Dec 2021 17:56:05 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by aserp3030.oracle.com with ESMTP id 3csc4whhqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:56:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsO2/koO/rGQrbGCuciYFUM3L8Ax49akSWjc2wl5QfroTwzqZhG130QezoQhPmdxwj2KeN5fb8UXaLmvBZXKfFVSib6Nqski+hLHt7inZRuXeeUCy2uSRQvRS/ebX8kqmD8VB8iDCAAWi9o6CTDJemYuwSfhYbvenHc9/i2xFrJhrq+hPg8q0P9zYu9A8J6k4wdNtugVwB/fWprBItPLjGRksrh46K9q6P4KKnvtR8Fjx+xsE5YEChNAiU+wV4OmCwEGt94THdcGAD8hOqU9+tzlRFuARQ6GVwEL9Y9aPvIo36zq8CCwqbMVKHBU6Ej45v4fQl8dc1WNd3aZQpgoLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hup+WW6tyoW/a/zDT2CWBFt3Gc/3LvuYGUko5HwKA4=;
 b=CxTBJ7MFGQ8Z6EJkLhCtI/UorUkHEqeu+B0fcPw5MMr/QufOKw2s9CYtK5LbGmYHMFknACpt6mhjCB3F232FtmDj4PYGeDoEzR14mN4h2p0mzCIy7TBwJgBlWyX2BtARZuB2uhXF5vraWh7DKeEBj202aymVRbVaupBSzpHAC9/v17xj5H8vdvVBGW1rKLFszcmf/7drjRZKDeuemdYwAtBGQqOXD8qDksghB5nq9+g3FmhbXt904J3v+P6Nkfa5+KsiJhBgPzLlUvlwoXfyJ1mbDKrEyaoBnDto8wgrWBUEu3uSeXhYIuoD/GfDNVMvCON/OdEdGdyMsdSHVdS3mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hup+WW6tyoW/a/zDT2CWBFt3Gc/3LvuYGUko5HwKA4=;
 b=RQLQKAM+ddPRht3qH4eRxdCBfkxF72lDlOGQEFzp/T9oaiQ1KBZd+I419wkHE8ilVDN6/9u3OYVWuuGChrrU/xSZvxGxoYVT96AT8frgQ+mP3leh+FEPV7DJSUCJkkNP7oNgadA9xs6CX5fiwJJPlC+X+Y4uoZDt2DuXulxdjM4=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4562.namprd10.prod.outlook.com (2603:10b6:303:93::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 9 Dec
 2021 17:56:03 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 17:56:03 +0000
Message-ID: <16162918-a74c-5dd8-243a-576f583cfaef@oracle.com>
Date: Thu, 9 Dec 2021 11:55:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 10/10] ACPI ERST: step 6 of bios-tables-test.c
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>
References: <1638472142-14396-1-git-send-email-eric.devolder@oracle.com>
 <1638472142-14396-11-git-send-email-eric.devolder@oracle.com>
 <CAARzgwwvUEX39pzjsuEj1M7jrFyF2giLb8ZEMiGyyE3p4wuUaw@mail.gmail.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <CAARzgwwvUEX39pzjsuEj1M7jrFyF2giLb8ZEMiGyyE3p4wuUaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0128.namprd13.prod.outlook.com
 (2603:10b6:806:27::13) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPV6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SA9PR13CA0128.namprd13.prod.outlook.com
 (2603:10b6:806:27::13) with Microsoft SMTP Server (version=TLS1_2, cipher=)
 via Frontend Transport; Thu, 9 Dec 2021 17:56:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea410579-64b5-46f3-c0ea-08d9bb3d2a67
X-MS-TrafficTypeDiagnostic: CO1PR10MB4562:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB4562105E645E5FEEDD50FA6C97709@CO1PR10MB4562.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:101;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /eL7zK0tf9T8gA/6Eqxxgns7Zrx1VbU/9I6bLlwMJDLQkWUlBHiwkTcd3EyPdDsq6RCV3Vn/7RbTWSDaocDkyOjndikw2H1qMXPXhAtyerIOHwIJpp9QdQlEUcq+u7zWvJoPd3o+5vL4GmxxYeclyTdSZW67gOsEJWgLcB9aMKbioVgNNPj22Htl5X5QEK68spX7gmABlfCx8+4oV+MtN4km8f86tP6sqKcFDyzy1boL/6MQhL8bEvRzwCfJXh5jNcVmgShPEu0lUrQGMY0lSQli2rZP+NzgvyIai3uW0lol49/IJW6oKEIoqj3lW0ydQHBF9dr2AiZBmj+HywhJ7PxcSXmr9kI1bxJaApvMXWN00OW12yySfJ1rbNaKAPUjOOZ2dSjU4wb4ssIlTRFXiv1jUCCvVMD7Vj2pCh9WHwPi03KsDar1QQ5775FgTTBadxJ/rJ6U8MZU0Jb4IWf/kbzGk1CThEstzoBbcj6miTUX7+pfkOVuqDegFN7HgWErXtfNq8LqDbFAtH6cvO6qcDN38Vx5nrkrtDvgHb7mqOR5NASgSPpkQ6/UmbG0EsnAgHF6Bo4/DjZ7/yoBrCAB13S6+8VfvsoXGllT/ZmFoMSdXJomePDsh/VYzvluVCfK0strT4xzPikOJIgPIaat3vsy/IzgfAD/BqNltNFP6CSZ16iNdvxNu7gqW87BSbbKoe6Ue2nQyGfdq+Xf49icVducW53FQ8edlynkVoy6x2PF42JyeJVhJluBipJXmlxG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(2906002)(66946007)(316002)(2616005)(508600001)(53546011)(38100700002)(36756003)(86362001)(31686004)(4326008)(83380400001)(107886003)(31696002)(66476007)(6916009)(5660300002)(66556008)(6486002)(8676002)(8936002)(30864003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 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
 =?utf-8?Q?d3Ym7GmGhADlv+P3w/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea410579-64b5-46f3-c0ea-08d9bb3d2a67
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 17:56:03.0352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iXPe5JcpfH917emKd0UzH4DtHSlZkxVmeuiqK3CzMVNzfWC5vBJqEn3ItraqA+/8XNfoLT2fqyy+CW8/ariSDqKlFEfxNGgyb0k5PlRBPhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4562
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090093
X-Proofpoint-GUID: 6vbFoByevKhzF0czEDcEGOv5Yc_BkO7K
X-Proofpoint-ORIG-GUID: 6vbFoByevKhzF0czEDcEGOv5Yc_BkO7K
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.803, RCVD_IN_DNSWL_LOW=-0.7,
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

Ani, thanks!
eric

On 12/9/21 03:29, Ani Sinha wrote:
> On Fri, Dec 3, 2021 at 12:39 AM Eric DeVolder <eric.devolder@oracle.com> wrote:
>>
>> Following the guidelines in tests/qtest/bios-tables-test.c, this
>> is step 6.
>>
>> Below is the disassembly of tests/data/acpi/pc/ERST.acpierst.
[...]
>>
>> Note that the contents of tests/data/q35/ERST.acpierst and
>> tests/data/microvm/ERST.pcie are the same except for differences
>> due to assigned base address.
>>
>> Files tests/data/pc/DSDT.acpierst and tests/data/acpi/q35/DSDT.acpierst
>> are new files (and are included as a result of 'make check' process).
>> Rather than provide the entire content, I am providing the differences
>> between pc/DSDT and pc/DSDT.acpierst, and the difference between
>> q35/DSDT and q35/DSDT.acpierst, with an explanation to follow.
>>
>> diff pc/DSDT pc/DSDT.acpierst:
>>   @@ -5,13 +5,13 @@
>>     *
>>     * Disassembling to symbolic ASL+ operators
>>     *
>>   - * Disassembly of tests/data/acpi/pc/DSDT, Thu Dec  2 10:10:13 2021
>>   + * Disassembly of tests/data/acpi/pc/DSDT.acpierst, Thu Dec  2 12:59:36 2021
>>     *
>>     * Original Table Header:
>>     *     Signature        "DSDT"
>>   - *     Length           0x00001772 (6002)
>>   + *     Length           0x00001751 (5969)
>>     *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
>>   - *     Checksum         0x9E
>>   + *     Checksum         0x95
>>     *     OEM ID           "BOCHS "
>>     *     OEM Table ID     "BXPC    "
>>     *     OEM Revision     0x00000001 (1)
>>   @@ -964,16 +964,11 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS "
>>
>>                Device (S18)
>>                {
>>   -                Name (_SUN, 0x03)  // _SUN: Slot User Number
>>                    Name (_ADR, 0x00030000)  // _ADR: Address
>>   -                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
>>   -                {
>>   -                    PCEJ (BSEL, _SUN)
>>   -                }
>>   -
>>   +                Name (ASUN, 0x03)
>>                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
>>                    {
>>   -                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
>>   +                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
>>                    }
>>                }
>>
>>   @@ -1399,11 +1394,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS "
>>
>>                Method (DVNT, 2, NotSerialized)
>>                {
>>   -                If ((Arg0 & 0x08))
>>   -                {
>>   -                    Notify (S18, Arg1)
>>   -                }
>>   -
>>                    If ((Arg0 & 0x10))
>>                    {
>>                        Notify (S20, Arg1)
>>
>> diff q35/DSDT and q35/DSDT.acpierst:
>>   @@ -5,13 +5,13 @@
>>     *
>>     * Disassembling to symbolic ASL+ operators
>>     *
>>   - * Disassembly of tests/data/acpi/q35/DSDT, Thu Dec  2 10:10:13 2021
>>   + * Disassembly of tests/data/acpi/q35/DSDT.acpierst, Thu Dec  2 12:59:36 2021
>>     *
>>     * Original Table Header:
>>     *     Signature        "DSDT"
>>   - *     Length           0x00002061 (8289)
>>   + *     Length           0x00002072 (8306)
>>     *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
>>   - *     Checksum         0xFA
>>   + *     Checksum         0x9A
>>     *     OEM ID           "BOCHS "
>>     *     OEM Table ID     "BXPC    "
>>     *     OEM Revision     0x00000001 (1)
>>   @@ -3278,6 +3278,11 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS "
>>                    }
>>                }
>>
>>   +            Device (S10)
>>   +            {
>>   +                Name (_ADR, 0x00020000)  // _ADR: Address
>>   +            }
>>   +
>>                Method (PCNT, 0, NotSerialized)
>>                {
>>                }
>>
>> For both pc and q35, there is but a small difference between this
>> DSDT.acpierst and the corresponding DSDT. In both cases, the changes
>> occur under the hiearchy:
>>
>>      Scope (\_SB)
>>      {
>>          Scope (PCI0)
>>          {
>>
>> which leads me to believe that the change to the DSDT was needed
>> due to the introduction of the ERST PCI device.
> 
> I have convinced myself of the changes we see in the DSDT tables.
> On i440fx side, we are adding a non-hotpluggable pci device on slot 3.
> So the changes we see are basically replacing an empty hotpluggable
> slot on the pci root port with a non-hotplugggable device.
> On q35, bsel on pcie root bus is not set (its not hotpluggable bus),
> so the change basically adds the address enumeration for the device.
> 
Excellent! I've included the insight into commit message.

>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> 
> Acked-by: Ani Sinha <ani@anisinha.ca>
> 
>> ---
>>   tests/data/acpi/microvm/ERST.pcie           | Bin 0 -> 912 bytes
>>   tests/data/acpi/pc/DSDT.acpierst            | Bin 0 -> 5969 bytes
>>   tests/data/acpi/pc/ERST.acpierst            | Bin 0 -> 912 bytes
>>   tests/data/acpi/q35/DSDT.acpierst           | Bin 0 -> 8306 bytes
>>   tests/data/acpi/q35/ERST.acpierst           | Bin 0 -> 912 bytes
>>   tests/qtest/bios-tables-test-allowed-diff.h |   5 -----
>>   6 files changed, 5 deletions(-)
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
>> diff --git a/tests/data/acpi/pc/ERST.acpierst b/tests/data/acpi/pc/ERST.acpierst
>> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..f24fadd345c798ee5c17cdb66e0e1703bd1b2f26 100644
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
>> diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
>> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..cad26e3f0c27a40a33101155a5282ed9bcb1d441 100644
>> GIT binary patch
>> literal 8306
>> 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
>> Lf)z9L%&`9h*%QBN
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/q35/ERST.acpierst b/tests/data/acpi/q35/ERST.acpierst
>> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..f24fadd345c798ee5c17cdb66e0e1703bd1b2f26 100644
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
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>> index 603db07..dfb8523 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1,6 +1 @@
>>   /* List of comma-separated changed AML files to ignore */
>> -"tests/data/acpi/pc/DSDT.acpierst",
>> -"tests/data/acpi/pc/ERST.acpierst",
>> -"tests/data/acpi/q35/DSDT.acpierst",
>> -"tests/data/acpi/q35/ERST.acpierst",
>> -"tests/data/acpi/microvm/ERST.pcie",
>> --
>> 1.8.3.1
>>

