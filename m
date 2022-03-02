Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B834C9CE9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 06:06:24 +0100 (CET)
Received: from localhost ([::1]:40488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPHBv-0007H9-7i
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 00:06:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nPHAt-0006a5-UL
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 00:05:21 -0500
Received: from [2a00:1450:4864:20::630] (port=41545
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nPHAr-0008C9-TC
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 00:05:19 -0500
Received: by mail-ej1-x630.google.com with SMTP id a8so1231209ejc.8
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 21:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eaSexPlgHUSZOpw33Z3elUWc16c/aTSFOLo3/SakpIg=;
 b=yU8q329NSUlhSLgYjlTJKUoaBKHvFXKc3kCbh1CvNYg6EFZKzew/ONm1+hs2bqitIM
 vg78IGgu0Eh3auts6X3mgv8DqS6+O9+1FbL8GBCXIw8o6HOt964FXa2P2DYRoVJHaS5g
 B8HRP1f3vxC7nqjc1x7HoTclOVuK0UGj3bOxuWsvlRho7QM7ITXAVZoOBwsiKU/CIPHC
 2qgchhsXcSHk1WOYlYguw5rYnpVKEu9NxLnU5chD1iSG9J1VZVtPlbqwnr0jS4vfxQuf
 ZRyX1Z0PCJa5BH+qkPeLZw5R5UDKhTmdqKd4BdzY6cJIQ0AKWyb3BHPoCVD9Zz4tDSTg
 cZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eaSexPlgHUSZOpw33Z3elUWc16c/aTSFOLo3/SakpIg=;
 b=kE6NO1TYQAgJoKRSGHBKkDANoz98FgFMdnihbGf4Q5Lv+lUOaSM5ZPGjYisVJOLK+D
 COkgPUFB8FoVzLs/fvpCUQJndumeBMhj4YKgyCzIbT2BzlE+oCrIwIKFW0yC3XKOKjix
 e7/gfabAxAXcjaD1SXPsuyiGDqt3Gb76DZETYa/ud3YFxibsbqyqM0MOirqlwniAoqIN
 1MZ4CWEhzzPZvK2BEtXqq/gVnxLZ553s2JQnaUPFWHJdCWAyxWIFEOoKI79pFWVOtN44
 IR7ls3vUpnr7nEA9IYZZZ3P+fhDHMy/mBLUNxR/hwRYC25o2KkcJxtXdEskHI41c3Pxf
 2hrg==
X-Gm-Message-State: AOAM531uvKNYV5pFVj7NB460tQDp0KyzsGr4DrQfnwXOfYVWXu6O8XO0
 eXzfEeSSPVNmrxf5o3fZ9LPh8nhQxrSYICNvrOfC2A==
X-Google-Smtp-Source: ABdhPJznE31IBqXS3qJZO+jAUPuO2o0LyJ31MlNFED2NIvI2MfzXIhxKJzLYwalGbyaS/ucLPjWzIOtWuhuXVzt++Sw=
X-Received: by 2002:a17:906:c14c:b0:6d7:1278:d80c with SMTP id
 dp12-20020a170906c14c00b006d71278d80cmr3380966ejc.660.1646197516037; Tue, 01
 Mar 2022 21:05:16 -0800 (PST)
MIME-Version: 1.0
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-4-liavalb@gmail.com>
 <alpine.DEB.2.22.394.2203010829190.1505325@anisinha-lenovo>
 <20220301062008-mutt-send-email-mst@kernel.org>
 <49a62bfa-715c-76e1-c518-62719e4b9d5e@gmail.com>
In-Reply-To: <49a62bfa-715c-76e1-c518-62719e4b9d5e@gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 2 Mar 2022 10:35:04 +0530
Message-ID: <CAARzgwxHLPC1JLQV3HQ5XeJ0v+T1H7TM3xVRf62irFakJXj_rw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] tests/acpi: i386: update FACP table differences
To: Liav Albani <liavalb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::630;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x630.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: imammedo@redhat.com, shentey@gmail.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 2, 2022 at 12:43 AM Liav Albani <liavalb@gmail.com> wrote:
>
>
> On 3/1/22 13:21, Michael S. Tsirkin wrote:
> > On Tue, Mar 01, 2022 at 08:29:57AM +0530, Ani Sinha wrote:
> >>
> >> On Mon, 28 Feb 2022, Liav Albani wrote:
> >>
> >>> After changing the IAPC boot flags register to indicate support of i8042
> >>> in the machine chipset to help the guest OS to determine its existence
> >>> "faster", we need to have the updated FACP ACPI binary images in tree.
> >>>
> >>> @@ -1,32 +1,32 @@
> >>>   /*
> >>>    * Intel ACPI Component Architecture
> >>>    * AML/ASL+ Disassembler version 20211217 (64-bit version)
> >>>    * Copyright (c) 2000 - 2021 Intel Corporation
> >>>    *
> >>> - * Disassembly of tests/data/acpi/q35/FACP, Wed Feb 23 22:37:39 2022
> >>> + * Disassembly of /tmp/aml-BBFBI1, Wed Feb 23 22:37:39 2022
> > cut this out pls
> I see, this is indeed not very useful...
> >>>    *
> >>>    * ACPI Data Table [FACP]
> >>>    *
> >>>    * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
> >>>    */
> >>>
> >>>   [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
> >>>   [004h 0004   4]                 Table Length : 000000F4
> >>>   [008h 0008   1]                     Revision : 03
> >>> -[009h 0009   1]                     Checksum : B9
> >>> +[009h 0009   1]                     Checksum : B7
> > and this
> >
> >>>   [00Ah 0010   6]                       Oem ID : "BOCHS "
> >>>   [010h 0016   8]                 Oem Table ID : "BXPC    "
> >>>   [018h 0024   4]                 Oem Revision : 00000001
> >>>   [01Ch 0028   4]              Asl Compiler ID : "BXPC"
> >>>   [020h 0032   4]        Asl Compiler Revision : 00000001
> >>>
> >>>   [024h 0036   4]                 FACS Address : 00000000
> >>>   [028h 0040   4]                 DSDT Address : 00000000
> >>>   [02Ch 0044   1]                        Model : 01
> >>>   [02Dh 0045   1]                   PM Profile : 00 [Unspecified]
> >>>   [02Eh 0046   2]                SCI Interrupt : 0009
> >>>   [030h 0048   4]             SMI Command Port : 000000B2
> >>>   [034h 0052   1]            ACPI Enable Value : 02
> >>>   [035h 0053   1]           ACPI Disable Value : 03
> >>>   [036h 0054   1]               S4BIOS Command : 00
> >>>   [037h 0055   1]              P-State Control : 00
> >>> @@ -42,35 +42,35 @@
> >>>   [059h 0089   1]     PM1 Control Block Length : 02
> >>>   [05Ah 0090   1]     PM2 Control Block Length : 00
> >>>   [05Bh 0091   1]        PM Timer Block Length : 04
> >>>   [05Ch 0092   1]            GPE0 Block Length : 10
> >>>   [05Dh 0093   1]            GPE1 Block Length : 00
> >>>   [05Eh 0094   1]             GPE1 Base Offset : 00
> >>>   [05Fh 0095   1]                 _CST Support : 00
> >>>   [060h 0096   2]                   C2 Latency : 0FFF
> >>>   [062h 0098   2]                   C3 Latency : 0FFF
> >>>   [064h 0100   2]               CPU Cache Size : 0000
> >>>   [066h 0102   2]           Cache Flush Stride : 0000
> >>>   [068h 0104   1]            Duty Cycle Offset : 00
> >>>   [069h 0105   1]             Duty Cycle Width : 00
> >>>   [06Ah 0106   1]          RTC Day Alarm Index : 00
> >>>   [06Bh 0107   1]        RTC Month Alarm Index : 00
> >>>   [06Ch 0108   1]            RTC Century Index : 32
> >>> -[06Dh 0109   2]   Boot Flags (decoded below) : 0000
> >>> +[06Dh 0109   2]   Boot Flags (decoded below) : 0002
> >>>                  Legacy Devices Supported (V2) : 0
> >>> -            8042 Present on ports 60/64 (V2) : 0
> >>> +            8042 Present on ports 60/64 (V2) : 1
> >>>                           VGA Not Present (V4) : 0
> >>>                         MSI Not Supported (V4) : 0
> >>>                   PCIe ASPM Not Supported (V4) : 0
> >>>                      CMOS RTC Not Present (V5) : 0
> >
> > leaving just this
> >
> It will be fixed in version 5.
> >>>   [06Fh 0111   1]                     Reserved : 00
> >>>   [070h 0112   4]        Flags (decoded below) : 000084A5
> >>>         WBINVD instruction is operational (V1) : 1
> >>>                 WBINVD flushes all caches (V1) : 0
> >>>                       All CPUs support C1 (V1) : 1
> >>>                     C2 works on MP system (V1) : 0
> >>>               Control Method Power Button (V1) : 0
> >>>               Control Method Sleep Button (V1) : 1
> >>>           RTC wake not in fixed reg space (V1) : 0
> >>>               RTC can wake system from S4 (V1) : 1
> >>>                           32-bit PM Timer (V1) : 0
> >>>                         Docking Supported (V1) : 0
> >>> @@ -148,32 +148,32 @@
> >>>   [0DCh 0220   1]                     Space ID : 01 [SystemIO]
> >>>   [0DDh 0221   1]                    Bit Width : 80
> >>>   [0DEh 0222   1]                   Bit Offset : 00
> >>>   [0DFh 0223   1]         Encoded Access Width : 00 [Undefined/Legacy]
> >>>   [0E0h 0224   8]                      Address : 0000000000000620
> >>>
> >>>   [0E8h 0232  12]                   GPE1 Block : [Generic Address Structure]
> >>>   [0E8h 0232   1]                     Space ID : 00 [SystemMemory]
> >>>   [0E9h 0233   1]                    Bit Width : 00
> >>>   [0EAh 0234   1]                   Bit Offset : 00
> >>>   [0EBh 0235   1]         Encoded Access Width : 00 [Undefined/Legacy]
> >>>   [0ECh 0236   8]                      Address : 0000000000000000
> >>>
> >>>   Raw Table Data: Length 244 (0xF4)
> >>>
> >>> -    0000: 46 41 43 50 F4 00 00 00 03 B9 42 4F 43 48 53 20  // FACP......BOCHS
> >>> +    0000: 46 41 43 50 F4 00 00 00 03 B7 42 4F 43 48 53 20  // FACP......BOCHS
> >>>       0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
> >>>       0020: 01 00 00 00 00 00 00 00 00 00 00 00 01 00 09 00  // ................
> >>>       0030: B2 00 00 00 02 03 00 00 00 06 00 00 00 00 00 00  // ................
> >>>       0040: 04 06 00 00 00 00 00 00 00 00 00 00 08 06 00 00  // ................
> >>>       0050: 20 06 00 00 00 00 00 00 04 02 00 04 10 00 00 00  //  ...............
> >>> -    0060: FF 0F FF 0F 00 00 00 00 00 00 00 00 32 00 00 00  // ............2...
> >>> +    0060: FF 0F FF 0F 00 00 00 00 00 00 00 00 32 02 00 00  // ............2...
> >>>       0070: A5 84 00 00 01 08 00 00 F9 0C 00 00 00 00 00 00  // ................
> >>>       0080: 0F 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
> >>>       0090: 00 00 00 00 01 20 00 00 00 06 00 00 00 00 00 00  // ..... ..........
> >>>       00A0: 00 00 00 00 00 00 00 00 00 00 00 00 01 10 00 00  // ................
> >>>       00B0: 04 06 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
> >>>       00C0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
> >>>       00D0: 01 20 00 00 08 06 00 00 00 00 00 00 01 80 00 00  // . ..............
> >>>       00E0: 20 06 00 00 00 00 00 00 00 00 00 00 00 00 00 00  //  ...............
> >>>       00F0: 00 00 00 00                                      // ....
> > this isn't helpful either and will be wrong if cherry picked.
>
> It will be fixed in version 5 :)
>
> I'll have to not retain the Ack sign of Ani, right?

No you do but you should still address Michael's comments. Different
reviewers look for different things and they can ack/tag reviewed-by
if they were satisfied. Others can raise further concerns or comments
thereafter also. It does not mean previous tags needs removal. They
stand on their own merit.

