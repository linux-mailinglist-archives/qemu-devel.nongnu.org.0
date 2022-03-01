Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4AA4C8168
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 04:02:46 +0100 (CET)
Received: from localhost ([::1]:37462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOsmj-0004Ol-GU
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 22:02:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nOskB-0002wz-Di
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 22:00:07 -0500
Received: from [2607:f8b0:4864:20::636] (port=44786
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nOsk9-0005I0-Da
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 22:00:07 -0500
Received: by mail-pl1-x636.google.com with SMTP id q11so12354687pln.11
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 19:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=vH6xUYq3pgV9Jrdy3s3/EzZoyem/5Pqo/ltK9f8Gw8o=;
 b=yFTRZao32UzuGAVShbVAyEIUOyWCYjcZoXzDPw8U8FPTLL91HH0VoAqYzo9FBSCdZj
 3H62ZanmBh0BKiB4ukG4LDUMgPB9204w+9gkHuNT/nzCmozlQVNIw26U9YJCOPDQjhRW
 HhOB/Ow7eMpVJ6OJjZmpJciCIMf28IWOO1vvmAx1/uKMOHncEIMfxry6yKluN9CM/yT0
 Qd7Cpw4oN/nT09W28HZ7o1kwg4Nby21z9rePVFvvMFSYzu7A2cC0132dckQjfVA2o1KE
 SReyUFCsgH/eJx7sV7TKFiqlc8uacNw5jgQreL/6bzk/6mGlYRs37LHgpLicVCaoi7gU
 m9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=vH6xUYq3pgV9Jrdy3s3/EzZoyem/5Pqo/ltK9f8Gw8o=;
 b=CFwn/UFbVchkCNlB0se2t7724N3qAX8SwJPWz967Pe2FBT2OJkr1W4mdu6CM0LH7Ov
 eMltsVDHzQLytZZ9a0+u1BJ8fdWuPws+i3Cs494EljdkolxcFKakeLCsJUnfzf2kMkPn
 BBNjpEuX/hA6oe3Y8JC5GBSlx/GiWBX2sx2wFE6s6VXQm8J4PpxBLhl6dH3ow+a57awV
 2mTi7X7853K5rZiJiVdwVG5BFbdZBUCqd6KC8Op32BxtX4ycDGZSRAZbLn8UIoD7FVnK
 cLoj+e4xNRkyAhJ/B7LjVA+FGWvZISKgz1UsbwDQzRuoC2qjxrwy/3uHyeuyDAEesFp/
 xkfw==
X-Gm-Message-State: AOAM531UXgCOFlQ2xrt0qdieo02Nkq5iY4q/DO1CFxxNj0NnTJggxIxS
 wRRDV40CZ/41r/+QmLPRLf0v6A==
X-Google-Smtp-Source: ABdhPJx2nQfxsXV7CafkfS3dJZoOUxyfTJ+4XUmbG2fRjYIWaTtzO9wFYLj5C+AxGzdy9QnPH9TrPg==
X-Received: by 2002:a17:902:8e82:b0:151:6f68:7088 with SMTP id
 bg2-20020a1709028e8200b001516f687088mr5766841plb.11.1646103602884; 
 Mon, 28 Feb 2022 19:00:02 -0800 (PST)
Received: from anisinha-lenovo ([203.212.247.124])
 by smtp.googlemail.com with ESMTPSA id
 g9-20020a056a0023c900b004e10365c47dsm15382928pfc.192.2022.02.28.19.00.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 19:00:02 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 1 Mar 2022 08:29:57 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Liav Albani <liavalb@gmail.com>
Subject: Re: [PATCH v4 3/3] tests/acpi: i386: update FACP table differences
In-Reply-To: <20220228201733.714580-4-liavalb@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2203010829190.1505325@anisinha-lenovo>
References: <20220228201733.714580-1-liavalb@gmail.com>
 <20220228201733.714580-4-liavalb@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x636.google.com
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
Cc: ani@anisinha.ca, imammedo@redhat.com, shentey@gmail.com,
 qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 28 Feb 2022, Liav Albani wrote:

> After changing the IAPC boot flags register to indicate support of i8042
> in the machine chipset to help the guest OS to determine its existence
> "faster", we need to have the updated FACP ACPI binary images in tree.
>
> @@ -1,32 +1,32 @@
>  /*
>   * Intel ACPI Component Architecture
>   * AML/ASL+ Disassembler version 20211217 (64-bit version)
>   * Copyright (c) 2000 - 2021 Intel Corporation
>   *
> - * Disassembly of tests/data/acpi/q35/FACP, Wed Feb 23 22:37:39 2022
> + * Disassembly of /tmp/aml-BBFBI1, Wed Feb 23 22:37:39 2022
>   *
>   * ACPI Data Table [FACP]
>   *
>   * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
>   */
>
>  [000h 0000   4]                    Signature : "FACP"    [Fixed ACPI Description Table (FADT)]
>  [004h 0004   4]                 Table Length : 000000F4
>  [008h 0008   1]                     Revision : 03
> -[009h 0009   1]                     Checksum : B9
> +[009h 0009   1]                     Checksum : B7
>  [00Ah 0010   6]                       Oem ID : "BOCHS "
>  [010h 0016   8]                 Oem Table ID : "BXPC    "
>  [018h 0024   4]                 Oem Revision : 00000001
>  [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>  [020h 0032   4]        Asl Compiler Revision : 00000001
>
>  [024h 0036   4]                 FACS Address : 00000000
>  [028h 0040   4]                 DSDT Address : 00000000
>  [02Ch 0044   1]                        Model : 01
>  [02Dh 0045   1]                   PM Profile : 00 [Unspecified]
>  [02Eh 0046   2]                SCI Interrupt : 0009
>  [030h 0048   4]             SMI Command Port : 000000B2
>  [034h 0052   1]            ACPI Enable Value : 02
>  [035h 0053   1]           ACPI Disable Value : 03
>  [036h 0054   1]               S4BIOS Command : 00
>  [037h 0055   1]              P-State Control : 00
> @@ -42,35 +42,35 @@
>  [059h 0089   1]     PM1 Control Block Length : 02
>  [05Ah 0090   1]     PM2 Control Block Length : 00
>  [05Bh 0091   1]        PM Timer Block Length : 04
>  [05Ch 0092   1]            GPE0 Block Length : 10
>  [05Dh 0093   1]            GPE1 Block Length : 00
>  [05Eh 0094   1]             GPE1 Base Offset : 00
>  [05Fh 0095   1]                 _CST Support : 00
>  [060h 0096   2]                   C2 Latency : 0FFF
>  [062h 0098   2]                   C3 Latency : 0FFF
>  [064h 0100   2]               CPU Cache Size : 0000
>  [066h 0102   2]           Cache Flush Stride : 0000
>  [068h 0104   1]            Duty Cycle Offset : 00
>  [069h 0105   1]             Duty Cycle Width : 00
>  [06Ah 0106   1]          RTC Day Alarm Index : 00
>  [06Bh 0107   1]        RTC Month Alarm Index : 00
>  [06Ch 0108   1]            RTC Century Index : 32
> -[06Dh 0109   2]   Boot Flags (decoded below) : 0000
> +[06Dh 0109   2]   Boot Flags (decoded below) : 0002
>                 Legacy Devices Supported (V2) : 0
> -            8042 Present on ports 60/64 (V2) : 0
> +            8042 Present on ports 60/64 (V2) : 1
>                          VGA Not Present (V4) : 0
>                        MSI Not Supported (V4) : 0
>                  PCIe ASPM Not Supported (V4) : 0
>                     CMOS RTC Not Present (V5) : 0
>  [06Fh 0111   1]                     Reserved : 00
>  [070h 0112   4]        Flags (decoded below) : 000084A5
>        WBINVD instruction is operational (V1) : 1
>                WBINVD flushes all caches (V1) : 0
>                      All CPUs support C1 (V1) : 1
>                    C2 works on MP system (V1) : 0
>              Control Method Power Button (V1) : 0
>              Control Method Sleep Button (V1) : 1
>          RTC wake not in fixed reg space (V1) : 0
>              RTC can wake system from S4 (V1) : 1
>                          32-bit PM Timer (V1) : 0
>                        Docking Supported (V1) : 0
> @@ -148,32 +148,32 @@
>  [0DCh 0220   1]                     Space ID : 01 [SystemIO]
>  [0DDh 0221   1]                    Bit Width : 80
>  [0DEh 0222   1]                   Bit Offset : 00
>  [0DFh 0223   1]         Encoded Access Width : 00 [Undefined/Legacy]
>  [0E0h 0224   8]                      Address : 0000000000000620
>
>  [0E8h 0232  12]                   GPE1 Block : [Generic Address Structure]
>  [0E8h 0232   1]                     Space ID : 00 [SystemMemory]
>  [0E9h 0233   1]                    Bit Width : 00
>  [0EAh 0234   1]                   Bit Offset : 00
>  [0EBh 0235   1]         Encoded Access Width : 00 [Undefined/Legacy]
>  [0ECh 0236   8]                      Address : 0000000000000000
>
>  Raw Table Data: Length 244 (0xF4)
>
> -    0000: 46 41 43 50 F4 00 00 00 03 B9 42 4F 43 48 53 20  // FACP......BOCHS
> +    0000: 46 41 43 50 F4 00 00 00 03 B7 42 4F 43 48 53 20  // FACP......BOCHS
>      0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
>      0020: 01 00 00 00 00 00 00 00 00 00 00 00 01 00 09 00  // ................
>      0030: B2 00 00 00 02 03 00 00 00 06 00 00 00 00 00 00  // ................
>      0040: 04 06 00 00 00 00 00 00 00 00 00 00 08 06 00 00  // ................
>      0050: 20 06 00 00 00 00 00 00 04 02 00 04 10 00 00 00  //  ...............
> -    0060: FF 0F FF 0F 00 00 00 00 00 00 00 00 32 00 00 00  // ............2...
> +    0060: FF 0F FF 0F 00 00 00 00 00 00 00 00 32 02 00 00  // ............2...
>      0070: A5 84 00 00 01 08 00 00 F9 0C 00 00 00 00 00 00  // ................
>      0080: 0F 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>      0090: 00 00 00 00 01 20 00 00 00 06 00 00 00 00 00 00  // ..... ..........
>      00A0: 00 00 00 00 00 00 00 00 00 00 00 00 01 10 00 00  // ................
>      00B0: 04 06 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>      00C0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
>      00D0: 01 20 00 00 08 06 00 00 00 00 00 00 01 80 00 00  // . ..............
>      00E0: 20 06 00 00 00 00 00 00 00 00 00 00 00 00 00 00  //  ...............
>      00F0: 00 00 00 00                                      // ....
> **

Please retain tags from earlier revisions of the patch.

>
> Signed-off-by: Liav Albani <liavalb@gmail.com>

Acked-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/data/acpi/q35/FACP                    | Bin 244 -> 244 bytes
>  tests/data/acpi/q35/FACP.nosmm              | Bin 244 -> 244 bytes
>  tests/data/acpi/q35/FACP.slic               | Bin 244 -> 244 bytes
>  tests/data/acpi/q35/FACP.xapic              | Bin 244 -> 244 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   4 ----
>  5 files changed, 4 deletions(-)
>
> diff --git a/tests/data/acpi/q35/FACP b/tests/data/acpi/q35/FACP
> index f6a864cc863c7763f6c09d3814ad184a658fa0a0..a8f6a8961109d01059aceef9f1869cde09a2f10c 100644
> GIT binary patch
> delta 23
> ecmeyu_=S<n&CxmF3j+fK^Y)2c$&5@B^V$GgGY3Ne
>
> delta 23
> ecmeyu_=S<n&CxmF3j+fK^UjG}$&3sW^V$GgJqJSo
>
> diff --git a/tests/data/acpi/q35/FACP.nosmm b/tests/data/acpi/q35/FACP.nosmm
> index 6a9aa5f370eb9af6a03dc739d8a159be58fdee01..c4e6d18ee5fc64159160d4589aa96b4d648c913a 100644
> GIT binary patch
> delta 23
> ecmeyu_=S<n&CxmF3j+fKbKXR*WJacmd2Ik#q6Yc^
>
> delta 23
> ecmeyu_=S<n&CxmF3j+fKbHPNeWJZRGd2Ik#tOoi3
>
> diff --git a/tests/data/acpi/q35/FACP.slic b/tests/data/acpi/q35/FACP.slic
> index 15986e095cf2db7ee92f7ce113c1d46d54018c62..48bbb1cf5ad0ceda1d2f6d56edf5c1e207bd1a04 100644
> GIT binary patch
> delta 23
> ecmeyu_=S<n&CxmF3j+fK^M#3A$&5@B^V$Gh6bD=Y
>
> delta 23
> ecmeyu_=S<n&CxmF3j+fK^QDPg$&3sW^V$Gh9tT_i
>
> diff --git a/tests/data/acpi/q35/FACP.xapic b/tests/data/acpi/q35/FACP.xapic
> index 2d3659c9c6753d07c3d48742343cb8e8cc034de7..31fa5dd19c213034eef4eeefa6a04e61dadd8a2a 100644
> GIT binary patch
> delta 23
> ecmeyu_=S<n&CxmF3j+fK^X7?M$&5@B^V$Gg4+lR0
>
> delta 23
> ecmeyu_=S<n&CxmF3j+fK^VW%6$&3sW^V$Gg83#WA
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 7570e39369..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,5 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/q35/FACP",
> -"tests/data/acpi/q35/FACP.nosmm",
> -"tests/data/acpi/q35/FACP.slic",
> -"tests/data/acpi/q35/FACP.xapic",
> --
> 2.35.1
>
>

