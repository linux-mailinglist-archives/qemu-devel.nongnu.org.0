Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9914C58F333
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 21:32:16 +0200 (CEST)
Received: from localhost ([::1]:44458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLrR9-00012F-Gd
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 15:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLrPQ-0007tO-GZ
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 15:30:28 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:37616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oLrPN-0006KP-NO
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 15:30:28 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id 66so16193991vse.4
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 12:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=81QDp6ivo25W8qCto76QBt6sTAhLB8bdCZngmtzh/VA=;
 b=Pk76h1S3G5QX8/QeROEwZqyhNv5CDgPO0VgBeJuwgd86MbAMuXq9KnSZut/FOC5pjg
 kfPQxCowNhz3vNQEP1O0knz8sHOcr1qEyiuMP5BC8fADBtjNm9N/MWEhKJmF+i7gyVvr
 PIhsBewkLiv3zndMb5LRkeTX/pB3GLwGecj0xHovOkDtEP8r9BDpfwgRXeMKqt/FekKy
 Bk12Cd04YR2++i6J97RcOp3eOKxoAHT5G4OzQG4i+LePpboCBebAAWWRg0fUjhUnz1+o
 K3bGtcwukhZ5DFXaZyuGbegfm+Q/S8qbYaqkcXfobQBeuw0tSnkOauuGvCWTXiSAOfl+
 FIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=81QDp6ivo25W8qCto76QBt6sTAhLB8bdCZngmtzh/VA=;
 b=mYPajmz5mOxfU9PCtkc1T0Esf3J6ALny6Ej0kntj15z2Kp87elMQ8B8+7S5nhxCF1j
 wNXQl6ct18LV7E9EATZIYDzZp8Nto3lwg+V28cfd69UD3JVY04AdkPyctyHdGSj17R8v
 OxDouM9oy0MbdeNd3/EsFTMoJXJJhwDj/7ntspUEFplzQc85dH95KgluR4n1NWDHtt7q
 FKZKyX4oYeRhdz+lSYSso7qpUN7YjmK6GiBtim0wEoc0rJ2EmssM17ENEFdiETQywYc+
 HcymhwyabDn8V21ckleCPGEejdzEJfCHHo2blcqNRaCaxPC9C5jUqtrI2EExMwOxOvQY
 bvtA==
X-Gm-Message-State: ACgBeo3QjhGCqu790JkMraUEBwKe1SYrR6E+FPPB6wUiQO6OTYFCI7O/
 Kto2iYFm4xEsAkDGfO5P7+r8G1iyChY=
X-Google-Smtp-Source: AA6agR57ZpLDc/wIrlCNDLrOaHcPsznHCCCb1PedygNGvSJtfR4PzyqSyyCiN3laag5znE64fxG7hw==
X-Received: by 2002:a67:c311:0:b0:385:741:ad42 with SMTP id
 r17-20020a67c311000000b003850741ad42mr12404728vsj.76.1660159824569; 
 Wed, 10 Aug 2022 12:30:24 -0700 (PDT)
Received: from [192.168.10.102] (201-43-216-47.dsl.telesp.net.br.
 [201.43.216.47]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05612200c400b00378eacd2b70sm442970vkc.37.2022.08.10.12.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 12:30:24 -0700 (PDT)
Message-ID: <76f3b0f6-73ba-3ff2-98d1-fdc1da1e9872@gmail.com>
Date: Wed, 10 Aug 2022 16:30:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH for-7.2 v2 09/20] hw/ppc: set machine->fdt in pnv_reset()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, david@gibson.dropbear.id.au,
 Frederic Barrat <fbarrat@linux.ibm.com>
References: <20220805093948.82561-1-danielhb413@gmail.com>
 <20220805093948.82561-10-danielhb413@gmail.com>
 <1312fa72-d742-5528-714f-f1e5d30a9e59@kaod.org>
 <13e63a36-dbc4-cf4c-93d0-b2cf8af2d538@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <13e63a36-dbc4-cf4c-93d0-b2cf8af2d538@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/8/22 04:13, Cédric Le Goater wrote:
> On 8/8/22 08:47, Cédric Le Goater wrote:
>> On 8/5/22 11:39, Daniel Henrique Barboza wrote:
>>> This will enable support for 'dumpdtb' and 'info fdt' HMP commands for
>>> all powernv machines.
>>
>> I might have missed some emails but dumpdtb is already suppported :
>> commit 8d4092614161 ("ppc/pnv: activate the "dumpdtb" option on the
>> powernv machine")
> 
> ok. found the patchset "QMP/HMP: add 'dumpdtb' and 'info fdt' commands"
> 
> 'info fdt' would have been of great help when we were developing the
> PowerNV machine. Initially, I was even using pmemsave to extract the
> FDT blob ... So this is a great idea ! (which needs a g_free() )
> 
> Do we have something similar to dump ACPI tables, btw ?

In QEMU? No idea. I didn't find users of libfdt in x86 files so I didn't
bothered checking.

I am aware of something you can do in userland to dump the ACPI tables. I
did it once for research when I was working in the NUMA FORM2 extension
for pseries. This is the procedure do dump the ACPI SLIT table:


danielhb@ubuntu-vm:~$ sudo acpidump > acpidata.dat
[sudo] password for danielhb:
danielhb@ubuntu-vm:~$
danielhb@ubuntu-vm:~$ sudo acpixtract -sSLIT acpidata.dat

Intel ACPI Component Architecture
ACPI Binary Table Extraction Utility version 20200925
Copyright (c) 2000 - 2020 Intel Corporation

   SLIT -      60 bytes written (0x0000003C) - slit.dat
danielhb@ubuntu-vm:~$
danielhb@ubuntu-vm:~$ iasl -d slit.dat

Intel ACPI Component Architecture
ASL+ Optimizing Compiler/Disassembler version 20200925
Copyright (c) 2000 - 2020 Intel Corporation

File appears to be binary: found 24 non-ASCII characters, disassembling
Binary file appears to be a valid ACPI table, disassembling
Input file slit.dat, Length 0x3C (60) bytes
ACPI: SLIT 0x0000000000000000 00003C (v01 BOCHS  BXPCSLIT 00000001 BXPC 00000001)
Acpi Data Table [SLIT] decoded
Formatted output:  slit.dsl - 1489 bytes
danielhb@ubuntu-vm:~$
danielhb@ubuntu-vm:~$ cat slit.dsl
/*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20200925 (64-bit version)
  * Copyright (c) 2000 - 2020 Intel Corporation
  *
  * Disassembly of slit.dat, Wed Jun  2 19:00:54 2021
  *
  * ACPI Data Table [SLIT]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
  */

[000h 0000   4]                    Signature : "SLIT"    [System Locality Information Table]
[004h 0004   4]                 Table Length : 0000003C
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : A0
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPCSLIT"
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   8]                   Localities : 0000000000000004
[02Ch 0044   4]                 Locality   0 : 0A 16 16 16
[030h 0048   4]                 Locality   1 : 2C 0A 2C 2C
[034h 0052   4]                 Locality   2 : 42 42 0A 42
[038h 0056   4]                 Locality   3 : 58 58 58 0A

Raw Table Data: Length 60 (0x3C)

     0000: 53 4C 49 54 3C 00 00 00 01 A0 42 4F 43 48 53 20  // SLIT<.....BOCHS
     0010: 42 58 50 43 53 4C 49 54 01 00 00 00 42 58 50 43  // BXPCSLIT....BXPC
     0020: 01 00 00 00 04 00 00 00 00 00 00 00 0A 16 16 16  // ................
     0030: 2C 0A 2C 2C 42 42 0A 42 58 58 58 0A              // ,.,,BB.BXXX.
danielhb@ubuntu-vm:~$


So basically a combination of acpidump and acpixtract commands in the guest.


Daniel


> 
> Thanks,
> 
> C.
> 
> 
>>>
>>> Cc: Cédric Le Goater <clg@kaod.org>
>>> Cc: Frederic Barrat <fbarrat@linux.ibm.com>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>> ---
>>>   hw/ppc/pnv.c | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>>> index d3f77c8367..f5162f8b7b 100644
>>> --- a/hw/ppc/pnv.c
>>> +++ b/hw/ppc/pnv.c
>>> @@ -608,7 +608,11 @@ static void pnv_reset(MachineState *machine)
>>>       qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
>>>       cpu_physical_memory_write(PNV_FDT_ADDR, fdt, fdt_totalsize(fdt));
>>> -    g_free(fdt);
>>> +    /*
>>> +     * Update the machine->fdt pointer to enable support for
>>> +     * 'dumpdtb' and 'info fdt' commands.
>>> +     */
>>> +    machine->fdt = fdt;
>>>   }
>>>   static ISABus *pnv_chip_power8_isa_create(PnvChip *chip, Error **errp)
>>
> 

