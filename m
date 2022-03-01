Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB334C985A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:26:19 +0100 (CET)
Received: from localhost ([::1]:54082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAwk-0003y7-9A
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:26:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nPAee-0004ev-2W
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:07:36 -0500
Received: from [2a00:1450:4864:20::530] (port=44661
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nPAec-0006Qu-9t
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:07:35 -0500
Received: by mail-ed1-x530.google.com with SMTP id x5so23828618edd.11
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:in-reply-to:references:message-id:mime-version
 :content-transfer-encoding;
 bh=+TOsJ01qxHcuQg+zkdxAAqDmh3Wn9bhUjEiDnH0UDeY=;
 b=acg+nKjYGcCqjEE2/MDese3XIQPXq+J2gucF5hdtlOhaJYlBlTsdl6trb+8ypwxdvi
 WxbDFbyR9Un9VBdlCMfArZBJ5EN8YvRhq1f5BZY7Jl7tF1/DCEBbt8po6Sk+DPjILWIo
 7acIbuM2NWSG4K0fL6wPIW6we/Bo6ERDZtSdPQYYxx0jHQh/Z+bZMEBRzf9PsN6ofgzm
 DeN3cPTpHYG7hAv040ehl9waUfbBznmMecq5UfT2k83/pj+kT28A15ThBkKXlq9gbEPk
 kBV8ax72DzGuaELrf0dmfu7tMbuaHJMDHkKCqCABtT5tini6kU09NLMXG32mMXIQa5mf
 8VWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=+TOsJ01qxHcuQg+zkdxAAqDmh3Wn9bhUjEiDnH0UDeY=;
 b=VIsUxe0QLOruywHilhjlQFpbF/Ec8QaC9idFZfQx86MunbPn8XRfs37naYtumUNR1/
 PsHv7nN5nAazVIVZ2eLt/MkuXwt+9s3X9Vqt5dU9EtFcdNeAkfhdeTarUirGlK9El98Z
 px+vw5urUN0Qxh7SLzpYmFZp2GlimxR/nFoectdEasGPiCEH4SpG4rzsV7IeqKpYkHiJ
 mADVXqY07tV17x7WLbIcpCOBoDD+ynHIj7jxVZ/jLIH/HN0X6vf4AotJ37qUOA7yMjg4
 x8tJyxMRUHF5ofvtn34AFuxsokFmBK2RLy7h6L4i/Bh51RS7dwFoSaumssLyuI48A9dZ
 NHmA==
X-Gm-Message-State: AOAM531ke2fPDx6+3pLRjTHk9bLzVOoxJt02sUY++6CtMg0r/zbRru/j
 2CtmG0Bxn/a5JkgDJX8+XYyZBocn85s=
X-Google-Smtp-Source: ABdhPJxqvCJHEK1qrvR9rRjjeFbKCOExX/W79uPUqA4KEPl8l4NLdmG8U4NZnPHPtfdUqYu9R20Aew==
X-Received: by 2002:a05:6402:354c:b0:412:b2f2:f8e4 with SMTP id
 f12-20020a056402354c00b00412b2f2f8e4mr26774013edd.269.1646172452288; 
 Tue, 01 Mar 2022 14:07:32 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-055-004-046.78.55.pool.telefonica.de.
 [78.55.4.46]) by smtp.gmail.com with ESMTPSA id
 z11-20020a50e68b000000b00412ec8b2180sm7671961edm.90.2022.03.01.14.07.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Mar 2022 14:07:31 -0800 (PST)
Date: Tue, 01 Mar 2022 22:07:27 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_0/7=5D_malta=3A_Fix_PCI_IRQ_level?=
 =?US-ASCII?Q?s_to_be_preserved_during_migration=2C_cleanup?=
In-Reply-To: <20220217101924.15347-1-shentey@gmail.com>
References: <20220217101924.15347-1-shentey@gmail.com>
Message-ID: <48087DC6-0577-4889-A394-56DA1078E0D4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17=2E Februar 2022 10:19:17 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>Tested with [1]:
>
>  qemu-system-mipsel -M malta -kernel vmlinux-3=2E2=2E0-4-4kc-malta -hda =
\
>  debian_wheezy_mipsel_standard=2Eqcow2 -append "root=3D/dev/sda1 console=
=3Dtty0"
>
>It was possible to log in as root and `poweroff` the machine=2E
>
>[1] https://people=2Edebian=2Eorg/~aurel32/qemu/mips/
>
>
>v4:
>  As suggested by BALATON Zoltan, gt64120_register() is now resolved by
>    sysbus_create_simple() etc=2E This also fixes the nitpick pointed out=
 by
>    Philippe=2E
>
>v3:
>  The migration bug now gets fixed in gt64xxx_pci before any cleanup=2E A=
s
>    suggested by PMM the patch is based on commit e735b55a8c11=2E
>  The code movement patch now moves the already fixed code=2E I might be =
a bit
>    too conservative here by removing Philippe's Reviewed-By tag=2E
>  As suggested by BALATON Zoltan, the redundant i8259[] attribute is now
>    resolved immediately after the code movement=2E As a side effect, it =
also
>    removes moved code which doesn't adhere to the coding style (local lo=
op
>    variable)=2E
>  To address BALATON Zoltan's comment and to reduce the number of require=
d
>    Reviewed-By's, only piix4_set_irq() is modified to expect own DeviceS=
tate
>    paremeter=2E Up to v2, all remaining set_irq() functions were changed=
 this
>    way=2E
>  The patch resolving piix4's singleton variable got split into two patch=
es:
>    One which resolves the singleton variable and one which replaces magi=
c
>    constants=2E The split patches should be more comprehensible=2E
>  Suggested by BALATON Zoltan, I took a chance to resolve gt64120_registe=
r(),
>    a method akin to the legacy init functions we're trying to get rid of=
=2E
>
>v2:
>  isa/piix4: Fix PCI IRQ levels to be preserved in VMState
>  isa/piix4: Resolve redundant i8259[] attribute
>
>Bernhard Beschow (7):
>  hw/mips/gt64xxx_pci: Fix PCI IRQ levels to be preserved during
>    migration
>  malta: Move PCI interrupt handling from gt64xxx_pci to piix4
>  hw/isa/piix4: Resolve redundant i8259[] attribute
>  hw/isa/piix4: Pass PIIX4State as opaque parameter for piix4_set_irq()
>  hw/isa/piix4: Resolve global instance variable
>  hw/isa/piix4: Replace some magic IRQ constants
>  hw/mips/gt64xxx_pci: Resolve gt64120_register()
>
> hw/isa/piix4=2Ec                | 54 +++++++++++++++++++++--
> hw/mips/gt64xxx_pci=2Ec         | 80 +++--------------------------------
> hw/mips/malta=2Ec               |  7 +--
> include/hw/mips/mips=2Eh        |  3 --
> include/hw/southbridge/piix=2Eh |  2 -
> 5 files changed, 59 insertions(+), 87 deletions(-)
>

@Phil: Would you also queue this series in your MIPS tree?

Best regards,
Bernhard

