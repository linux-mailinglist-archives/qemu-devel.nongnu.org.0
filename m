Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A293B4830D8
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 13:05:14 +0100 (CET)
Received: from localhost ([::1]:58978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4M5R-0001mM-GW
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 07:05:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n4M2T-0000HT-3g
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 07:02:09 -0500
Received: from [2607:f8b0:4864:20::62b] (port=45657
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n4M2N-000712-JZ
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 07:02:08 -0500
Received: by mail-pl1-x62b.google.com with SMTP id w24so24712417ply.12
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 04:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=9p0xxnBiVLvOkaeWFClMhARsy6aSq3+y00WEK7Ytv5g=;
 b=xN2e09PjT4we2fI5VSdnSKPLKyVO7u/9YMCnkoimG8AYul3S49CTg4L37l8BZrShf/
 Ss+nUHk6n9T3OBM9YW1k1A2kJxkFZ76AOP5DdjgQfhUcz1T/Zy8ZgH39ifF6CLji+vr9
 JVr635aLQrT2SK4wpCJX/kj3xAJWq6utmUkS/ncnSt0JtK7u1L/2JUykfMVkA8nkPK2k
 618K6DDcEYyVVScpuxV1Xxjbz66QdSEr//qEcSyVfr84Zsy6axbNgGwUyx00mWfExHBQ
 ru3uBBpHvKbxMKa0Y/AjKmjJuafrY+HL/5AV+CzOMtAcTit3Jbb1UHgbE/bXBmzq2sNQ
 s9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=9p0xxnBiVLvOkaeWFClMhARsy6aSq3+y00WEK7Ytv5g=;
 b=NBNXhG4uZCIPc+aRzrHSW57vbfomtRIyQPGHt3lM0FXRh8ow9u/9LgrKUbk5aXK0Xo
 FyBFFRLEu3EjfxsMlJoEYfcaLh9Z4Nc6+cZYVsEOAY2CAflK9WPWCQ27IzdLeqxDmeDI
 CAYhM/C2gvSf5L46bvgBJoMPrv2nX27F5VEXWVXjnshUwt6vzTLPrnubiw97L5iWTtZx
 cbjNrgmjxt227l/4VHFLuDUCt/FkbXhO5R9C1MoAqHkHag7HMyckRcCKTijv2DAPlbJc
 pbWZB8abfwMjVXr3yNe+YYyYG96m2e4fwjMxqvrUEb+xx2rehjUC1TQUyYKQMGaqD//t
 EZ7g==
X-Gm-Message-State: AOAM533RFaMQmwGzlBqWbSaDyCRruU6IaXPW9GevKPZsInzExMQoPbwT
 bNQ8t7rR6y+T56q9d05bzFJHhQ==
X-Google-Smtp-Source: ABdhPJwuIp+pCl5xMXXtNe0LS91N35WRZUpqaWGZSShaIUiXjki3f3wO4FZeBc+P7mjUqEjEL1YKRA==
X-Received: by 2002:a17:902:ea0b:b0:149:68e0:9a91 with SMTP id
 s11-20020a170902ea0b00b0014968e09a91mr39571877plg.172.1641211319185; 
 Mon, 03 Jan 2022 04:01:59 -0800 (PST)
Received: from anisinha-lenovo ([115.96.198.244])
 by smtp.googlemail.com with ESMTPSA id y27sm40022514pfa.12.2022.01.03.04.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 04:01:58 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 3 Jan 2022 17:31:52 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 7/7] tests/acpi/bios-table-test: Update expected
 virt/PPTT file
In-Reply-To: <20220103084636.2496-8-wangyanan55@huawei.com>
Message-ID: <alpine.DEB.2.22.394.2201031730230.14895@anisinha-lenovo>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-8-wangyanan55@huawei.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62b.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Eric Auger <eauger@redhat.com>, wanghaibin.wang@huawei.com,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 3 Jan 2022, Yanan Wang wrote:

> Run ./tests/data/acpi/rebuild-expected-aml.sh from build directory
> to update PPTT binary. Also empty bios-tables-test-allowed-diff.h.
>
> The disassembled differences between actual and expected PPTT:
>
>  /*
>   * Intel ACPI Component Architecture
>   * AML/ASL+ Disassembler version 20180810 (64-bit version)
>   * Copyright (c) 2000 - 2018 Intel Corporation
>   *
> - * Disassembly of tests/data/acpi/virt/PPTT, Mon Oct 25 20:24:53 2021
> + * Disassembly of /tmp/aml-BPI5B1, Mon Oct 25 20:24:53 2021
>   *
>   * ACPI Data Table [PPTT]
>   *
>   * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
>   */
>
>  [000h 0000   4]                    Signature : "PPTT"    [Processor Properties Topology Table]
> -[004h 0004   4]                 Table Length : 0000004C
> +[004h 0004   4]                 Table Length : 00000060
>  [008h 0008   1]                     Revision : 02
> -[009h 0009   1]                     Checksum : A8
> +[009h 0009   1]                     Checksum : 48
>  [00Ah 0010   6]                       Oem ID : "BOCHS "
>  [010h 0016   8]                 Oem Table ID : "BXPC    "
>  [018h 0024   4]                 Oem Revision : 00000001
>  [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>  [020h 0032   4]        Asl Compiler Revision : 00000001
>
>  [024h 0036   1]                Subtable Type : 00 [Processor Hierarchy Node]
>  [025h 0037   1]                       Length : 14
>  [026h 0038   2]                     Reserved : 0000
>  [028h 0040   4]        Flags (decoded below) : 00000001
>                              Physical package : 1
>                       ACPI Processor ID valid : 0
>  [02Ch 0044   4]                       Parent : 00000000
>  [030h 0048   4]            ACPI Processor ID : 00000000
>  [034h 0052   4]      Private Resource Number : 00000000
>
>  [038h 0056   1]                Subtable Type : 00 [Processor Hierarchy Node]
>  [039h 0057   1]                       Length : 14
>  [03Ah 0058   2]                     Reserved : 0000
> -[03Ch 0060   4]        Flags (decoded below) : 0000000A
> +[03Ch 0060   4]        Flags (decoded below) : 00000000
>                              Physical package : 0
> -                     ACPI Processor ID valid : 1
> +                     ACPI Processor ID valid : 0

I do not know this very well but does the above two changes (flags and
processor ID) makes sense?

>  [040h 0064   4]                       Parent : 00000024
>  [044h 0068   4]            ACPI Processor ID : 00000000
>  [048h 0072   4]      Private Resource Number : 00000000
>
> -Raw Table Data: Length 76 (0x4C)
> +[04Ch 0076   1]                Subtable Type : 00 [Processor Hierarchy Node]
> +[04Dh 0077   1]                       Length : 14
> +[04Eh 0078   2]                     Reserved : 0000
> +[050h 0080   4]        Flags (decoded below) : 0000000A
> +                            Physical package : 0
> +                     ACPI Processor ID valid : 1
> +[054h 0084   4]                       Parent : 00000038
> +[058h 0088   4]            ACPI Processor ID : 00000000
> +[05Ch 0092   4]      Private Resource Number : 00000000
> +
> +Raw Table Data: Length 96 (0x60)
>
> -    0000: 50 50 54 54 4C 00 00 00 02 A8 42 4F 43 48 53 20  // PPTTL.....BOCHS
> +    0000: 50 50 54 54 60 00 00 00 02 48 42 4F 43 48 53 20  // PPTT`....HBOCHS
>      0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC    ....BXPC
>      0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  // ................
> -    0030: 00 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  // ................
> -    0040: 24 00 00 00 00 00 00 00 00 00 00 00              // $...........
> +    0030: 00 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  // ................
> +    0040: 24 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  // $...............
> +    0050: 0A 00 00 00 38 00 00 00 00 00 00 00 00 00 00 00  // ....8...........
>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/data/acpi/virt/PPTT                   | Bin 76 -> 96 bytes
>  tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>  2 files changed, 1 deletion(-)
>
> diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
> index 7a1258ecf123555b24462c98ccbb76b4ac1d0c2b..f56ea63b369a604877374ad696c396e796ab1c83 100644
> GIT binary patch
> delta 53
> zcmV-50LuSNU<y!BR8(L90006=kqR;-00000Bme*a000000000002BZK3IG5AH~;_u
> L0000000000uCW9Z
>
> delta 32
> qcmV+*0N?*$ObSp?R8&j=00080kqR=APy`Gl00000000000001OcLdh}
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index cb143a55a6..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/virt/PPTT",
> --
> 2.27.0
>
>

