Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572B84C941B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:18:26 +0100 (CET)
Received: from localhost ([::1]:46020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP80v-0007v0-Du
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:18:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nP7vq-0004tj-RM
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:13:12 -0500
Received: from [2a00:1450:4864:20::430] (port=34552
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liavalb@gmail.com>) id 1nP7vo-0001nF-EE
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:13:10 -0500
Received: by mail-wr1-x430.google.com with SMTP id d3so22084334wrf.1
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 11:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pUxOnf0E3nCNH8xb67nSUrnEdpO9lmRUM0YEHRIrl1g=;
 b=a8JkK2Dg9abE/r5Ro9MZ9SdXT1mD2897fqcrQcAMXnnh0vaSkPN5VvYV7nTOliaJ82
 sgYRYFW1zzOphld8M+BLfZPRa7vFKc53mGGbDCY5TLitSRG/uji0Lwv66deKOaVBVa1U
 2QGastz6GlNxaBgYk3r3aeHmEQB5AJRX1+801pRlafhYK5uG1Pvy/BINymJRZORxGqDt
 IObTufC8GsA7kmlroPsQb0wRrzc5qj/Q5dQs5Q7dN19HwpArDGZFCSN1ijtZCaXq2U3v
 vfEnvpcgkSPqZOKdkolnZgBZFuALIBIaalyY8qAxxA49odr0EcCDg4lW5gE/n1D1c1o6
 tCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pUxOnf0E3nCNH8xb67nSUrnEdpO9lmRUM0YEHRIrl1g=;
 b=IBnSjf6l0b6hJWA3Elfe+Uk3DsUX4oXkN5xN87Gr88elrEeCfo6CrRXLn+jyxVutW9
 vfLIaGVLUQrA0RkrtZK34nGnyxRegzG++WfPxVw6XFyU9TM2i7EJ0xv3EEACPLnOzPK/
 8m3FwIZQxV2n5aNwmchqkHCjuzELK+xB0pDPCsZte2pUwT5hbuNeBoi/88UuyRDfCBGQ
 T/YOiBK6DUqlGkqR+b/JXUIb84VRyXyhGRXBPKIeS3wDhzX0c/Wh1xtoJqI1mQ++tP3m
 Mat6iHIp+P0Ge0VORQfalKqbI3jGTv6vBNrtY3kOc93dTjwkt+tCKEaZ3ORGSfI9bfrB
 v62Q==
X-Gm-Message-State: AOAM532oakuZ2tLRlb9F1qlznN5TboDt1QT3uve15+GHKwjne/H1/VF4
 56+NKdUKknhYDF9RKSV8pSc=
X-Google-Smtp-Source: ABdhPJy6+HzAOtFCdFZISs6zV9eN6ha474wfhsVw3EU4XDdbbR+c6j1srJNdgMsNBJpk8pg1uBzFCQ==
X-Received: by 2002:a05:6000:1d89:b0:1ed:b6d5:cbda with SMTP id
 bk9-20020a0560001d8900b001edb6d5cbdamr20206575wrb.514.1646161986679; 
 Tue, 01 Mar 2022 11:13:06 -0800 (PST)
Received: from ?IPV6:2a10:800b:ea29:1:266:a58e:9f87:7014?
 ([2a10:800b:ea29:1:266:a58e:9f87:7014])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a05600c155200b003816bac83f6sm3774461wmg.27.2022.03.01.11.13.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 11:13:06 -0800 (PST)
Message-ID: <49a62bfa-715c-76e1-c518-62719e4b9d5e@gmail.com>
Date: Tue, 1 Mar 2022 21:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v4 3/3] tests/acpi: i386: update FACP table differences
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-4-liavalb@gmail.com>
 <alpine.DEB.2.22.394.2203010829190.1505325@anisinha-lenovo>
 <20220301062008-mutt-send-email-mst@kernel.org>
From: Liav Albani <liavalb@gmail.com>
In-Reply-To: <20220301062008-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=liavalb@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: imammedo@redhat.com, shentey@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/1/22 13:21, Michael S. Tsirkin wrote:
> On Tue, Mar 01, 2022 at 08:29:57AM +0530, Ani Sinha wrote:
>>
>> On Mon, 28 Feb 2022, Liav Albani wrote:
>>
>>> After changing the IAPC boot flags register to indicate support of i8042
>>> in the machine chipset to help the guest OS to determine its existence
>>> "faster", we need to have the updated FACP ACPI binary images in tree.
>>>
>>> @@ -1,32 +1,32 @@
>>>   /*
>>>    * Intel ACPI Component Architecture
>>>    * AML/ASL+ Disassembler version 20211217 (64-bit version)
>>>    * Copyright (c) 2000 - 2021 Intel Corporation
>>>    *
>>> - * Disassembly of tests/data/acpi/q35/FACP, Wed Feb 23 22:37:39 2022
>>> + * Disassembly of /tmp/aml-BBFBI1, Wed Feb 23 22:37:39 2022
> cut this out pls
I see, this is indeed not very useful...
>>>    *
>>>    * ACPI Data Table [FACP]
>>>    *
>>>    * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
>>>    */
>>>
>>>   [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
>>>   [004h 0004   4]                 Table Length : 000000F4
>>>   [008h 0008   1]                     Revision : 03
>>> -[009h 0009   1]                     Checksum : B9
>>> +[009h 0009   1]                     Checksum : B7
> and this
>
>>>   [00Ah 0010   6]                       Oem ID : "BOCHS "
>>>   [010h 0016   8]                 Oem Table ID : "BXPC    "
>>>   [018h 0024   4]                 Oem Revision : 00000001
>>>   [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>>>   [020h 0032   4]        Asl Compiler Revision : 00000001
>>>
>>>   [024h 0036   4]                 FACS Address : 00000000
>>>   [028h 0040   4]                 DSDT Address : 00000000
>>>   [02Ch 0044   1]                        Model : 01
>>>   [02Dh 0045   1]                   PM Profile : 00 [Unspecified]
>>>   [02Eh 0046   2]                SCI Interrupt : 0009
>>>   [030h 0048   4]             SMI Command Port : 000000B2
>>>   [034h 0052   1]            ACPI Enable Value : 02
>>>   [035h 0053   1]           ACPI Disable Value : 03
>>>   [036h 0054   1]               S4BIOS Command : 00
>>>   [037h 0055   1]              P-State Control : 00
>>> @@ -42,35 +42,35 @@
>>>   [059h 0089   1]     PM1 Control Block Length : 02
>>>   [05Ah 0090   1]     PM2 Control Block Length : 00
>>>   [05Bh 0091   1]        PM Timer Block Length : 04
>>>   [05Ch 0092   1]            GPE0 Block Length : 10
>>>   [05Dh 0093   1]            GPE1 Block Length : 00
>>>   [05Eh 0094   1]             GPE1 Base Offset : 00
>>>   [05Fh 0095   1]                 _CST Support : 00
>>>   [060h 0096   2]                   C2 Latency : 0FFF
>>>   [062h 0098   2]                   C3 Latency : 0FFF
>>>   [064h 0100   2]               CPU Cache Size : 0000
>>>   [066h 0102   2]           Cache Flush Stride : 0000
>>>   [068h 0104   1]            Duty Cycle Offset : 00
>>>   [069h 0105   1]             Duty Cycle Width : 00
>>>   [06Ah 0106   1]          RTC Day Alarm Index : 00
>>>   [06Bh 0107   1]        RTC Month Alarm Index : 00
>>>   [06Ch 0108   1]            RTC Century Index : 32
>>> -[06Dh 0109   2]   Boot Flags (decoded below) : 0000
>>> +[06Dh 0109   2]   Boot Flags (decoded below) : 0002
>>>                  Legacy Devices Supported (V2) : 0
>>> -            8042 Present on ports 60/64 (V2) : 0
>>> +            8042 Present on ports 60/64 (V2) : 1
>>>                           VGA Not Present (V4) : 0
>>>                         MSI Not Supported (V4) : 0
>>>                   PCIe ASPM Not Supported (V4) : 0
>>>                      CMOS RTC Not Present (V5) : 0
>
> leaving just this
>
It will be fixed in version 5.
>>>   [06Fh 0111   1]                     Reserved : 00
>>>   [070h 0112   4]        Flags (decoded below) : 000084A5
>>>         WBINVD instruction is operational (V1) : 1
>>>                 WBINVD flushes all caches (V1) : 0
>>>                       All CPUs support C1 (V1) : 1
>>>                     C2 works on MP system (V1) : 0
>>>               Control Method Power Button (V1) : 0
>>>               Control Method Sleep Button (V1) : 1
>>>           RTC wake not in fixed reg space (V1) : 0
>>>               RTC can wake system from S4 (V1) : 1
>>>                           32-bit PM Timer (V1) : 0
>>>                         Docking Supported (V1) : 0
>>> @@ -148,32 +148,32 @@
>>>   [0DCh 0220   1]                     Space ID : 01 [SystemIO]
>>>   [0DDh 0221   1]                    Bit Width : 80
>>>   [0DEh 0222   1]                   Bit Offset : 00
>>>   [0DFh 0223   1]         Encoded Access Width : 00 [Undefined/Legacy]
>>>   [0E0h 0224   8]                      Address : 0000000000000620
>>>
>>>   [0E8h 0232  12]                   GPE1 Block : [Generic Address Structure]
>>>   [0E8h 0232   1]                     Space ID : 00 [SystemMemory]
>>>   [0E9h 0233   1]                    Bit Width : 00
>>>   [0EAh 0234   1]                   Bit Offset : 00
>>>   [0EBh 0235   1]         Encoded Access Width : 00 [Undefined/Legacy]
>>>   [0ECh 0236   8]                      Address : 0000000000000000
>>>
>>>   Raw Table Data: Length 244 (0xF4)
>>>
>>> -    0000: 46 41 43 50 F4 00 00 00 03 B9 42 4F 43 48 53 20  // FACP......BOCHS
>>> +    0000: 46 41 43 50 F4 00 00 00 03 B7 42 4F 43 48 53 20  // FACP......BOCHS
>>>       0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
>>>       0020: 01 00 00 00 00 00 00 00 00 00 00 00 01 00 09 00  // ................
>>>       0030: B2 00 00 00 02 03 00 00 00 06 00 00 00 00 00 00  // ................
>>>       0040: 04 06 00 00 00 00 00 00 00 00 00 00 08 06 00 00  // ................
>>>       0050: 20 06 00 00 00 00 00 00 04 02 00 04 10 00 00 00  //  ...............
>>> -    0060: FF 0F FF 0F 00 00 00 00 00 00 00 00 32 00 00 00  // ............2...
>>> +    0060: FF 0F FF 0F 00 00 00 00 00 00 00 00 32 02 00 00  // ............2...
>>>       0070: A5 84 00 00 01 08 00 00 F9 0C 00 00 00 00 00 00  // ................
>>>       0080: 0F 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>>>       0090: 00 00 00 00 01 20 00 00 00 06 00 00 00 00 00 00  // ..... ..........
>>>       00A0: 00 00 00 00 00 00 00 00 00 00 00 00 01 10 00 00  // ................
>>>       00B0: 04 06 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>>>       00C0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>>>       00D0: 01 20 00 00 08 06 00 00 00 00 00 00 01 80 00 00  // . ..............
>>>       00E0: 20 06 00 00 00 00 00 00 00 00 00 00 00 00 00 00  //  ...............
>>>       00F0: 00 00 00 00                                      // ....
> this isn't helpful either and will be wrong if cherry picked.

It will be fixed in version 5 :)

I'll have to not retain the Ack sign of Ani, right?

>
>>> **
>> Please retain tags from earlier revisions of the patch.
>>
>>> Signed-off-by: Liav Albani <liavalb@gmail.com>
>> Acked-by: Ani Sinha <ani@anisinha.ca>
>>
>>> ---
>>>   tests/data/acpi/q35/FACP                    | Bin 244 -> 244 bytes
>>>   tests/data/acpi/q35/FACP.nosmm              | Bin 244 -> 244 bytes
>>>   tests/data/acpi/q35/FACP.slic               | Bin 244 -> 244 bytes
>>>   tests/data/acpi/q35/FACP.xapic              | Bin 244 -> 244 bytes
>>>   tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
>>>   5 files changed, 4 deletions(-)
>>>
>>> diff --git a/tests/data/acpi/q35/FACP b/tests/data/acpi/q35/FACP
>>> index f6a864cc863c7763f6c09d3814ad184a658fa0a0..a8f6a8961109d01059aceef9f1869cde09a2f10c 100644
>>> GIT binary patch
>>> delta 23
>>> ecmeyu_=S<n&CxmF3j+fK^Y)2c$&5@B^V$GgGY3Ne
>>>
>>> delta 23
>>> ecmeyu_=S<n&CxmF3j+fK^UjG}$&3sW^V$GgJqJSo
>>>
>>> diff --git a/tests/data/acpi/q35/FACP.nosmm b/tests/data/acpi/q35/FACP.nosmm
>>> index 6a9aa5f370eb9af6a03dc739d8a159be58fdee01..c4e6d18ee5fc64159160d4589aa96b4d648c913a 100644
>>> GIT binary patch
>>> delta 23
>>> ecmeyu_=S<n&CxmF3j+fKbKXR*WJacmd2Ik#q6Yc^
>>>
>>> delta 23
>>> ecmeyu_=S<n&CxmF3j+fKbHPNeWJZRGd2Ik#tOoi3
>>>
>>> diff --git a/tests/data/acpi/q35/FACP.slic b/tests/data/acpi/q35/FACP.slic
>>> index 15986e095cf2db7ee92f7ce113c1d46d54018c62..48bbb1cf5ad0ceda1d2f6d56edf5c1e207bd1a04 100644
>>> GIT binary patch
>>> delta 23
>>> ecmeyu_=S<n&CxmF3j+fK^M#3A$&5@B^V$Gh6bD=Y
>>>
>>> delta 23
>>> ecmeyu_=S<n&CxmF3j+fK^QDPg$&3sW^V$Gh9tT_i
>>>
>>> diff --git a/tests/data/acpi/q35/FACP.xapic b/tests/data/acpi/q35/FACP.xapic
>>> index 2d3659c9c6753d07c3d48742343cb8e8cc034de7..31fa5dd19c213034eef4eeefa6a04e61dadd8a2a 100644
>>> GIT binary patch
>>> delta 23
>>> ecmeyu_=S<n&CxmF3j+fK^X7?M$&5@B^V$Gg4+lR0
>>>
>>> delta 23
>>> ecmeyu_=S<n&CxmF3j+fK^VW%6$&3sW^V$Gg83#WA
>>>
>>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>>> index 7570e39369..dfb8523c8b 100644
>>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>>> @@ -1,5 +1 @@
>>>   /* List of comma-separated changed AML files to ignore */
>>> -"tests/data/acpi/q35/FACP",
>>> -"tests/data/acpi/q35/FACP.nosmm",
>>> -"tests/data/acpi/q35/FACP.slic",
>>> -"tests/data/acpi/q35/FACP.xapic",
>>> --
>>> 2.35.1
>>>
>>>

