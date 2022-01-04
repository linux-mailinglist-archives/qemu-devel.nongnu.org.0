Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B52483B4A
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 05:29:15 +0100 (CET)
Received: from localhost ([::1]:60300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4bRh-0006Ws-Qq
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 23:29:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n4bQY-0005eM-LM
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 23:28:02 -0500
Received: from [2607:f8b0:4864:20::102c] (port=38738
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n4bQW-00051T-PP
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 23:28:02 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so34297901pjf.3
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 20:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=rdZ3BTyWWZAg+A3+TdC63NWJI6SHngdV3oUoCOv0btA=;
 b=Y8Bj/bn5AjQz61NuwnJzh1CkBdBMx8byt/PoA8fXiFF0nCnNrOmxX83KfRWtEA44Ve
 uIk58pNivrSYDaK40TS5igA1Akl8m2sQsIlNKDdbaqV25t4nNDhMqwnS3VqP5JP1loez
 T+EszctukwMscEXwnmxeT5E4fPEwR7GGp+9I7D0D58edMGro+i14nwJgdUq6EAJ/C1nw
 OUz0DTn1djtBX5a9qU++YU4Wg2N/4Jmh7F6tWkPqkLu9dMuyK9ZKpWxjfkK3e9Y00CSV
 SMAqbDxXvg/e6JSmIN5QS6cA2V2gVehGZ/3oRlUDDDmmn9bBUxp3FGYh1RlEHjBoZdov
 lakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=rdZ3BTyWWZAg+A3+TdC63NWJI6SHngdV3oUoCOv0btA=;
 b=l7Xf3L9wFrNiyknnY0LSQ5MKNCHU1087ty1CsMDjEhSCXKxC7v5imfBbWsruB+1GRs
 MtHjSz3O4N7cfMPTGy/I+poq1B+IY7imohzEUXYelQDEdWjdz3L1rZHyp3UKnNEN26e6
 zugArRbcodGQfsffBnyFBo/lYSeJoIU2GY/LFbqMWfsIZq1JQCqTgMAHp0PKX2bhscOA
 9seAh3OsjkY5L5msJycQd/F9adN3X8Is/o7N6igqTmp+ZzTaP7iZCg8CGb6c4B3IWo8h
 fKRQE7pXuXTdJR+RxHYGTfz1DrLkR7OJfZRXlg2wpPU29EgwIxJy6f10tDi8Rv616rTY
 9dQg==
X-Gm-Message-State: AOAM532hxE6TcU35nQcystSYxqkcWzNQ2ol8V4fVICfZTYbM/tabNx9K
 Kr6BDQ2c3iHTcMhtbV6jaU9u6g==
X-Google-Smtp-Source: ABdhPJxY+ASvlagjzvZCfE6LtS183TxHTyROn0+HOmzFcT7toiR/x6HssQAYaxo4wyC4yTUQXshF5Q==
X-Received: by 2002:a17:902:700c:b0:149:5536:1ac4 with SMTP id
 y12-20020a170902700c00b0014955361ac4mr46697832plk.11.1641270479278; 
 Mon, 03 Jan 2022 20:27:59 -0800 (PST)
Received: from [10.28.18.19] ([156.146.57.66])
 by smtp.googlemail.com with ESMTPSA id
 y129sm5003272pfy.164.2022.01.03.20.27.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jan 2022 20:27:58 -0800 (PST)
Date: Tue, 4 Jan 2022 09:57:52 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@athabasca.local
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 7/7] tests/acpi/bios-table-test: Update expected
 virt/PPTT file
In-Reply-To: <d9c1574f-ab24-012f-0224-ab52eb7c0fc8@huawei.com>
Message-ID: <alpine.OSX.2.20.2201040956570.24803@athabasca.local>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-8-wangyanan55@huawei.com>
 <alpine.DEB.2.22.394.2201031730230.14895@anisinha-lenovo>
 <d9c1574f-ab24-012f-0224-ab52eb7c0fc8@huawei.com>
User-Agent: Alpine 2.20 (OSX 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102c.google.com
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, 4 Jan 2022, wangyanan (Y) wrote:

> Hi Ani,
> Thanks for your review.
>
> On 2022/1/3 20:01, Ani Sinha wrote:
> >
> > On Mon, 3 Jan 2022, Yanan Wang wrote:
> >
> > > Run ./tests/data/acpi/rebuild-expected-aml.sh from build directory
> > > to update PPTT binary. Also empty bios-tables-test-allowed-diff.h.
> > >
> > > The disassembled differences between actual and expected PPTT:
> > >
> > >   /*
> > >    * Intel ACPI Component Architecture
> > >    * AML/ASL+ Disassembler version 20180810 (64-bit version)
> > >    * Copyright (c) 2000 - 2018 Intel Corporation
> > >    *
> > > - * Disassembly of tests/data/acpi/virt/PPTT, Mon Oct 25 20:24:53 2021
> > > + * Disassembly of /tmp/aml-BPI5B1, Mon Oct 25 20:24:53 2021
> > >    *
> > >    * ACPI Data Table [PPTT]
> > >    *
> > >    * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
> > >    */
> > >
> > >   [000h 0000   4]                    Signature : "PPTT"    [Processor
> > > Properties Topology Table]
> > > -[004h 0004   4]                 Table Length : 0000004C
> > > +[004h 0004   4]                 Table Length : 00000060
> > >   [008h 0008   1]                     Revision : 02
> > > -[009h 0009   1]                     Checksum : A8
> > > +[009h 0009   1]                     Checksum : 48
> > >   [00Ah 0010   6]                       Oem ID : "BOCHS "
> > >   [010h 0016   8]                 Oem Table ID : "BXPC    "
> > >   [018h 0024   4]                 Oem Revision : 00000001
> > >   [01Ch 0028   4]              Asl Compiler ID : "BXPC"
> > >   [020h 0032   4]        Asl Compiler Revision : 00000001
> > >
> > >   [024h 0036   1]                Subtable Type : 00 [Processor Hierarchy
> > > Node]
> > >   [025h 0037   1]                       Length : 14
> > >   [026h 0038   2]                     Reserved : 0000
> > >   [028h 0040   4]        Flags (decoded below) : 00000001
> > >                               Physical package : 1
> > >                        ACPI Processor ID valid : 0
> > >   [02Ch 0044   4]                       Parent : 00000000
> > >   [030h 0048   4]            ACPI Processor ID : 00000000
> > >   [034h 0052   4]      Private Resource Number : 00000000
> > >
> > >   [038h 0056   1]                Subtable Type : 00 [Processor Hierarchy
> > > Node]
> > >   [039h 0057   1]                       Length : 14
> > >   [03Ah 0058   2]                     Reserved : 0000
> > > -[03Ch 0060   4]        Flags (decoded below) : 0000000A
> > > +[03Ch 0060   4]        Flags (decoded below) : 00000000
> > >                               Physical package : 0
> > > -                     ACPI Processor ID valid : 1
> > > +                     ACPI Processor ID valid : 0
> > I do not know this very well but does the above two changes (flags and
> > processor ID) makes sense?
> Yes. I think this is exactly what we expected.
> Above flags is for the newly inserted cluster node which is between
> socket node and core node. Flag "Physical package" is 0 because
> it does not represent the boundary of physical package. Flag
> "ACPI Processor ID valid" is 0, because we don't need a valid ID
> for a container in QEMU (cluster is container of CPU core) just
> like socket node.
>
> "0000000A" originally comes from core node, which now is at
> place [*] below.
>
> We can also read the reason why we don't need a valid ID for a
> container in 099f2df2e6b "hw/acpi/aml-build: Add PPTT table".

Ok as long as we can explain it, I am good.

> >
> > >   [040h 0064   4]                       Parent : 00000024
> > >   [044h 0068   4]            ACPI Processor ID : 00000000
> > >   [048h 0072   4]      Private Resource Number : 00000000
> > >
> > > -Raw Table Data: Length 76 (0x4C)
> > > +[04Ch 0076   1]                Subtable Type : 00 [Processor Hierarchy
> > > Node]
> > > +[04Dh 0077   1]                       Length : 14
> > > +[04Eh 0078   2]                     Reserved : 0000
> > > +[050h 0080   4]        Flags (decoded below) : 0000000A
> > > +                            Physical package : 0
> > > +                     ACPI Processor ID valid : 1
> > > +[054h 0084   4]                       Parent : 00000038
> > > +[058h 0088   4]            ACPI Processor ID : 00000000
> > > +[05Ch 0092   4]      Private Resource Number : 00000000
> [*] Information of core node.
>
> Thanks,
> Yanan
> > > +
> > > +Raw Table Data: Length 96 (0x60)
> > >
> > > -    0000: 50 50 54 54 4C 00 00 00 02 A8 42 4F 43 48 53 20  //
> > > PPTTL.....BOCHS
> > > +    0000: 50 50 54 54 60 00 00 00 02 48 42 4F 43 48 53 20  //
> > > PPTT`....HBOCHS
> > >       0010: 42 58 50 43 20 20 20 20 01 00 00 00 42 58 50 43  // BXPC
> > > ....BXPC
> > >       0020: 01 00 00 00 00 14 00 00 01 00 00 00 00 00 00 00  //
> > > ................
> > > -    0030: 00 00 00 00 00 00 00 00 00 14 00 00 0A 00 00 00  //
> > > ................
> > > -    0040: 24 00 00 00 00 00 00 00 00 00 00 00              //
> > > $...........
> > > +    0030: 00 00 00 00 00 00 00 00 00 14 00 00 00 00 00 00  //
> > > ................
> > > +    0040: 24 00 00 00 00 00 00 00 00 00 00 00 00 14 00 00  //
> > > $...............
> > > +    0050: 0A 00 00 00 38 00 00 00 00 00 00 00 00 00 00 00  //
> > > ....8...........
> > >
> > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> > > ---
> > >   tests/data/acpi/virt/PPTT                   | Bin 76 -> 96 bytes
> > >   tests/qtest/bios-tables-test-allowed-diff.h |   1 -
> > >   2 files changed, 1 deletion(-)
> > >
> > > diff --git a/tests/data/acpi/virt/PPTT b/tests/data/acpi/virt/PPTT
> > > index
> > > 7a1258ecf123555b24462c98ccbb76b4ac1d0c2b..f56ea63b369a604877374ad696c396e796ab1c83
> > > 100644
> > > GIT binary patch
> > > delta 53
> > > zcmV-50LuSNU<y!BR8(L90006=kqR;-00000Bme*a000000000002BZK3IG5AH~;_u
> > > L0000000000uCW9Z
> > >
> > > delta 32
> > > qcmV+*0N?*$ObSp?R8&j=00080kqR=APy`Gl00000000000001OcLdh}
> > >
> > > diff --git a/tests/qtest/bios-tables-test-allowed-diff.h
> > > b/tests/qtest/bios-tables-test-allowed-diff.h
> > > index cb143a55a6..dfb8523c8b 100644
> > > --- a/tests/qtest/bios-tables-test-allowed-diff.h
> > > +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> > > @@ -1,2 +1 @@
> > >   /* List of comma-separated changed AML files to ignore */
> > > -"tests/data/acpi/virt/PPTT",
> > > --
> > > 2.27.0
> > >
> > >
> > .
>
>

