Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670D55FBF83
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 05:28:16 +0200 (CEST)
Received: from localhost ([::1]:60932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiSPm-0007i8-WC
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 23:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oiSNY-00060J-EL
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 23:25:56 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oiSNW-0002Hn-Ag
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 23:25:56 -0400
Received: by mail-pj1-x1033.google.com with SMTP id fw14so14163426pjb.3
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 20:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xnni8+86W/KvNcQaDZ+2D6El0e0moALJnz0EdwQIyLo=;
 b=pajaLKpLWFUUrK07r7RnD2dE1j+jIhPItQGMV3zKRAo/qJawHgLaK1oHQgFj6HOCYm
 sTK2tNIZTpcgxQqDCO5acXMDvu7VwhUret+y8J6g3JMDitfKrTiaEIo/0gzuBdgvKbXt
 6cXUnkss+H4ux0e9tpn0Mj3fBIHbrCcSRg2jPtZ+ghB/44S53yjgGX47WuNqyrGoA1b8
 xMtJK/Pyj+OJNywZlzzyIRVxLKY3rs5X8uthr++sTyp5uExlAHJ5pz068rcSqmoNvpn7
 RyfJy2K/d0t+MncP5zg4CDK/8HmaROxALDEOVF7Mo1KiTX5yaILOxiEPzYLcZnanS+63
 Smlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xnni8+86W/KvNcQaDZ+2D6El0e0moALJnz0EdwQIyLo=;
 b=lBzFz2SqN26bqzh+bfk7uGvaD07qjqGBcAIBAjDaVAiRMojWQpffsc/RgRH94K3lsy
 KgpPtt5x5RXPRcVQd784xvWuYa6mc5FopuKbOGLYqEYiquP5jSqG/+TOSJYPF5ZvLPPP
 qQJpwKVhxgc5IuGrX8ueIqC13RUuu5OJUSZW/AIIonWmXav0UAzMPM6K1Z8Rdvc7N0Qk
 NrRxjV9TzpnQBXytIlj17m7r/zsiO/1rDM38OtgtT3B68zlzyFNCxDBjeTXlMgRVW8+z
 MmL8eKj/5V1JnNfypWp7Q/Km/fy65zHIB3QVNkKcO6gx70ZvDypzfxsu1AQSjsMWqIU3
 iHeA==
X-Gm-Message-State: ACrzQf3ypHojOjvG7EPwKDuAmiKkt8CZKhYjl05EbjeGXQSlTs5Q3oPX
 kOGlKejx2xu7fVzPItPgizkFew==
X-Google-Smtp-Source: AMsMyM4hidvuw3soskDb/wFLlAPqy/oAbQE2KMOMAp9jCe2fO9CauBVvAqCzTtJs87aQ83Qaz+5Ujg==
X-Received: by 2002:a17:90a:c984:b0:20a:ac88:d39d with SMTP id
 w4-20020a17090ac98400b0020aac88d39dmr2602051pjt.13.1665545152385; 
 Tue, 11 Oct 2022 20:25:52 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.117.164])
 by smtp.googlemail.com with ESMTPSA id
 z3-20020aa79903000000b00545f5046372sm9710018pff.208.2022.10.11.20.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 20:25:52 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 12 Oct 2022 08:55:46 +0530 (IST)
To: Miguel Luis <miguel.luis@oracle.com>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com, 
 imammedo@redhat.com, ani@anisinha.ca, shannon.zhaosl@gmail.com, 
 peter.maydell@linaro.org
Subject: Re: [PATCH 4/4] tests/acpi: virt: update ACPI MADT and FADT binaries
In-Reply-To: <20221011181730.10885-5-miguel.luis@oracle.com>
Message-ID: <81516144-8c1a-3459-1227-fb1fac6fc72@anisinha.ca>
References: <20221011181730.10885-1-miguel.luis@oracle.com>
 <20221011181730.10885-5-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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



On Tue, 11 Oct 2022, Miguel Luis wrote:

> Step 6 & 7 of the bios-tables-test.c documented procedure.
>
> Differences between disassembled ASL files for MADT:
>
> @@ -11,9 +11,9 @@
>   */
>
>  [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
> -[004h 0004   4]                 Table Length : 000000A8
> -[008h 0008   1]                     Revision : 03
> -[009h 0009   1]                     Checksum : 50
> +[004h 0004   4]                 Table Length : 000000AC
> +[008h 0008   1]                     Revision : 04
> +[009h 0009   1]                     Checksum : 47
>  [00Ah 0010   6]                       Oem ID : "BOCHS "
>  [010h 0016   8]                 Oem Table ID : "BXPC    "
>  [018h 0024   4]                 Oem Revision : 00000001
> @@ -34,7 +34,7 @@
>  [041h 0065   3]                     Reserved : 000000
>
>  [044h 0068   1]                Subtable Type : 0B [Generic Interrupt Controller]
> -[045h 0069   1]                       Length : 4C
> +[045h 0069   1]                       Length : 50
>  [046h 0070   2]                     Reserved : 0000
>  [048h 0072   4]         CPU Interface Number : 00000000
>  [04Ch 0076   4]                Processor UID : 00000000
> @@ -51,28 +51,29 @@
>  [07Ch 0124   4]        Virtual GIC Interrupt : 00000000
>  [080h 0128   8]   Redistributor Base Address : 0000000000000000
>  [088h 0136   8]                    ARM MPIDR : 0000000000000000
> -/**** ACPI subtable terminates early - may be older version (dump table) */
> +[090h 0144   1]             Efficiency Class : 00
> +[091h 0145   3]                     Reserved : 000000
>
> -[090h 0144   1]                Subtable Type : 0D [Generic MSI Frame]
> -[091h 0145   1]                       Length : 18
> -[092h 0146   2]                     Reserved : 0000
> -[094h 0148   4]                 MSI Frame ID : 00000000
> -[098h 0152   8]                 Base Address : 0000000008020000
> -[0A0h 0160   4]        Flags (decoded below) : 00000001
> +[094h 0148   1]                Subtable Type : 0D [Generic MSI Frame]
> +[095h 0149   1]                       Length : 18
> +[096h 0150   2]                     Reserved : 0000
> +[098h 0152   4]                 MSI Frame ID : 00000000
> +[09Ch 0156   8]                 Base Address : 0000000008020000
> +[0A4h 0164   4]        Flags (decoded below) : 00000001
>                                    Select SPI : 1
> -[0A4h 0164   2]                    SPI Count : 0040
> -[0A6h 0166   2]                     SPI Base : 0050
> +[0A8h 0168   2]                    SPI Count : 0040
> +[0AAh 0170   2]                     SPI Base : 0050
>
> -Raw Table Data: Length 168 (0xA8)
> +Raw Table Data: Length 172 (0xAC)
>
> -    0000: 41 50 49 43 A8 00 00 00 03 50 42 4F 43 48 53 20  // APIC.....PBOCHS
> +    0000: 41 50 49 43 AC 00 00 00 04 47 42 4F 43 48 53 20  // APIC.....GBOCHS
>      0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
>      0020: 01 00 00 00 00 00 00 00 00 00 00 00 0C 18 00 00  // ................
>      0030: 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00 00  // ................
> -    0040: 02 00 00 00 0B 4C 00 00 00 00 00 00 00 00 00 00  // .....L..........
> +    0040: 02 00 00 00 0B 50 00 00 00 00 00 00 00 00 00 00  // .....P..........
>      0050: 01 00 00 00 00 00 00 00 17 00 00 00 00 00 00 00  // ................
>      0060: 00 00 00 00 00 00 01 08 00 00 00 00 00 00 04 08  // ................
>      0070: 00 00 00 00 00 00 03 08 00 00 00 00 00 00 00 00  // ................
>      0080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
> -    0090: 0D 18 00 00 00 00 00 00 00 00 02 08 00 00 00 00  // ................
> -    00A0: 01 00 00 00 40 00 50 00                          // ....@.P.
> +    0090: 00 00 00 00 0D 18 00 00 00 00 00 00 00 00 02 08  // ................
> +    00A0: 00 00 00 00 01 00 00 00 40 00 50 00              // ........@.P.
>
> Differences between disassembled ASL files for FADT:
>
> @@ -11,9 +11,9 @@
>   */
>
>  [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
> -[004h 0004   4]                 Table Length : 0000010C
> -[008h 0008   1]                     Revision : 05
> -[009h 0009   1]                     Checksum : 55
> +[004h 0004   4]                 Table Length : 00000114
> +[008h 0008   1]                     Revision : 06
> +[009h 0009   1]                     Checksum : 15
>  [00Ah 0010   6]                       Oem ID : "BOCHS "
>  [010h 0016   8]                 Oem Table ID : "BXPC    "
>  [018h 0024   4]                 Oem Revision : 00000001
> @@ -99,7 +99,7 @@
>                                PSCI Compliant : 1
>                         Must use HVC for PSCI : 1
>
> -[083h 0131   1]          FADT Minor Revision : 01
> +[083h 0131   1]          FADT Minor Revision : 00
>  [084h 0132   8]                 FACS Address : 0000000000000000
>  [08Ch 0140   8]                 DSDT Address : 0000000000000000
>  [094h 0148  12]             PM1A Event Block : [Generic Address Structure]
> @@ -173,11 +173,11 @@
>  [103h 0259   1]         Encoded Access Width : 00 [Undefined/Legacy]
>  [104h 0260   8]                      Address : 0000000000000000
>
> -/**** ACPI table terminates in the middle of a data structure! (dump table) */
> +[10Ch 0268   8]                Hypervisor ID : 00000000554D4551
>
> -Raw Table Data: Length 268 (0x10C)
> +Raw Table Data: Length 276 (0x114)
>
> -    0000: 46 41 43 50 0C 01 00 00 05 55 42 4F 43 48 53 20  // FACP.....UBOCHS
> +    0000: 46 41 43 50 14 01 00 00 06 15 42 4F 43 48 53 20  // FACP......BOCHS
>      0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
>      0020: 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>      0030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
> @@ -185,7 +185,7 @@ Raw Table Data: Length 268 (0x10C)
>      0050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>      0060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>      0070: 00 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
> -    0080: 00 03 00 01 00 00 00 00 00 00 00 00 00 00 00 00  // ................
> +    0080: 00 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>      0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>      00A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>      00B0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
> @@ -193,4 +193,5 @@ Raw Table Data: Length 268 (0x10C)
>      00D0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>      00E0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>      00F0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
> -    0100: 00 00 00 00 00 00 00 00 00 00 00 00              // ............
> +    0100: 00 00 00 00 00 00 00 00 00 00 00 00 51 45 4D 55  // ............QEMU
> +    0110: 00 00 00 00                                      // ....
>
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>

Acked-by: Ani Sinha <ani@anisinha.ca>
> ---
>  tests/data/acpi/virt/APIC                   | Bin 168 -> 172 bytes
>  tests/data/acpi/virt/APIC.memhp             | Bin 168 -> 172 bytes
>  tests/data/acpi/virt/APIC.numamem           | Bin 168 -> 172 bytes
>  tests/data/acpi/virt/FACP                   | Bin 268 -> 276 bytes
>  tests/data/acpi/virt/FACP.memhp             | Bin 268 -> 276 bytes
>  tests/data/acpi/virt/FACP.numamem           | Bin 268 -> 276 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   6 ------
>  7 files changed, 6 deletions(-)
>
> diff --git a/tests/data/acpi/virt/APIC b/tests/data/acpi/virt/APIC
> index 023f15f12e74fb9a3a6d3d9dc994541016947d6a..179d274770a23209b949c90a929525e22368568b 100644
> GIT binary patch
> delta 26
> hcmZ3%xQ3C-F~HM#4FdxMi~B?_YsP?yZeA06WB^*d2KE2|
>
> delta 26
> icmZ3(xPp<(F~HM#1p@;EbHGF{Yet`mZeA0oNB{s@&<6Sd
>
> diff --git a/tests/data/acpi/virt/APIC.memhp b/tests/data/acpi/virt/APIC.memhp
> index 023f15f12e74fb9a3a6d3d9dc994541016947d6a..179d274770a23209b949c90a929525e22368568b 100644
> GIT binary patch
> delta 26
> hcmZ3%xQ3C-F~HM#4FdxMi~B?_YsP?yZeA06WB^*d2KE2|
>
> delta 26
> icmZ3(xPp<(F~HM#1p@;EbHGF{Yet`mZeA0oNB{s@&<6Sd
>
> diff --git a/tests/data/acpi/virt/APIC.numamem b/tests/data/acpi/virt/APIC.numamem
> index 023f15f12e74fb9a3a6d3d9dc994541016947d6a..179d274770a23209b949c90a929525e22368568b 100644
> GIT binary patch
> delta 26
> hcmZ3%xQ3C-F~HM#4FdxMi~B?_YsP?yZeA06WB^*d2KE2|
>
> delta 26
> icmZ3(xPp<(F~HM#1p@;EbHGF{Yet`mZeA0oNB{s@&<6Sd
>
> diff --git a/tests/data/acpi/virt/FACP b/tests/data/acpi/virt/FACP
> index 1f764220f8533c427168e80ccf298604826a00b4..ac05c35a69451519bd1152c54d1e741af36390f5 100644
> GIT binary patch
> delta 33
> ncmeBSn!?28=I9(C!pOkDCOVO;a^j?_i3a=}fv&!x3_t(?fr|$^
>
> delta 26
> hcmbQj)WgK(=I9*2!^ptE8ak1yl96%Z#OjF#yZ}u&1~C8t
>
> diff --git a/tests/data/acpi/virt/FACP.memhp b/tests/data/acpi/virt/FACP.memhp
> index 1f764220f8533c427168e80ccf298604826a00b4..ac05c35a69451519bd1152c54d1e741af36390f5 100644
> GIT binary patch
> delta 33
> ncmeBSn!?28=I9(C!pOkDCOVO;a^j?_i3a=}fv&!x3_t(?fr|$^
>
> delta 26
> hcmbQj)WgK(=I9*2!^ptE8ak1yl96%Z#OjF#yZ}u&1~C8t
>
> diff --git a/tests/data/acpi/virt/FACP.numamem b/tests/data/acpi/virt/FACP.numamem
> index 1f764220f8533c427168e80ccf298604826a00b4..ac05c35a69451519bd1152c54d1e741af36390f5 100644
> GIT binary patch
> delta 33
> ncmeBSn!?28=I9(C!pOkDCOVO;a^j?_i3a=}fv&!x3_t(?fr|$^
>
> delta 26
> hcmbQj)WgK(=I9*2!^ptE8ak1yl96%Z#OjF#yZ}u&1~C8t
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 8dc50f7a8a..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,7 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/virt/FACP",
> -"tests/data/acpi/virt/FACP.numamem",
> -"tests/data/acpi/virt/FACP.memhp",
> -"tests/data/acpi/virt/APIC",
> -"tests/data/acpi/virt/APIC.memhp",
> -"tests/data/acpi/virt/APIC.numamem",
> --
> 2.37.3
>
>

