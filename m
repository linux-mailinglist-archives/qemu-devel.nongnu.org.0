Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 598DA4C4FBD
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 21:37:55 +0100 (CET)
Received: from localhost ([::1]:46694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhLd-0006Hx-W5
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 15:37:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nNhKX-000560-6M
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:36:45 -0500
Received: from [2a00:1450:4864:20::536] (port=46764
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nNhKI-0004FM-9U
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 15:36:44 -0500
Received: by mail-ed1-x536.google.com with SMTP id s1so8955441edd.13
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:in-reply-to:references:message-id:mime-version
 :content-transfer-encoding;
 bh=eZ6TNOVAhwmuFXFNsmYwOvZi5IK7cgRUR/v9Ql8N3es=;
 b=po+SViT1FnzqdZuiLc+WioFfCZYiJ+I4uze/l9ptFrFP9OwpiqmOg8WZXRssll1AZY
 TYt0ThvuGfbPMtpWhwJE4JnJ/A3uC5JTyI8DtJhdbuR0CEV+J4yAJSS7UPlUgOKZkTF3
 rPcpT17IY7Wtv/LVxZJDvlwn84jZt3LGsOgUftsESPBa/num6TG8BcgqthZB2C+dS+F1
 zn6mIczrjgQ1mczcgf5E0hcQD2RzDe3Ro7R2cKvRDnlr1uPn4KxmX/+zeOdwJvGExH/z
 TYBc1uaymTK4l3XCpOUnppde+iNRZqRHhF0Tmzui/EWDQhEbsZqVLRPLlu7Or+GxFrbM
 DQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=eZ6TNOVAhwmuFXFNsmYwOvZi5IK7cgRUR/v9Ql8N3es=;
 b=m7MWJ6q2hp+AQq4oxPgS6xS7doKr7xS/VLxQsJDwfW4wh2SdkfV+ooYh5FGjdBbhPd
 S+D075S2carvVCEpNjTMGF0u5o+aYWbI7x7+JptU15Y9iQud3xXZNXb3rMDE4/N/uH80
 rub0MKd/qZ4hcP8cLtxtZxtCDDeZ+fg0XTxnqI0FTTzWGThZ1AxVMWhHbVdEj73wpAEj
 gjBTDSf67gh4KOuz2wWeztqajyD49FiomRuyecmdFUGINfJz1LB/r6RhJmAVTHbKWj2F
 8Q6keITmlWU72lb6H12xAXA7mmf+C1aIiB3mIvdHm7XybzInUzkSISG6JemiYPmWJRd8
 z5RA==
X-Gm-Message-State: AOAM530Kh3Qh2YxH0q7KLtf2+Hx+/SRJN/t165ZJZArnIHIa9Ctnh/Gy
 11abI8CCrWxfrpvxv0wI0Zi+JHYS4aE=
X-Google-Smtp-Source: ABdhPJy1dpqdh4ZaQedoFiHGerEe9NZSpmU3oEs/0CAH9UNu618L+8xG20ox2IBv9NylxPKC3BQtkA==
X-Received: by 2002:a50:d5d6:0:b0:413:4be5:8ec1 with SMTP id
 g22-20020a50d5d6000000b004134be58ec1mr8815701edj.383.1645821380112; 
 Fri, 25 Feb 2022 12:36:20 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-087-117.78.54.pool.telefonica.de.
 [78.54.87.117]) by smtp.gmail.com with ESMTPSA id
 b6-20020a50e386000000b00410d64cb3e4sm1933790edm.75.2022.02.25.12.36.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Feb 2022 12:36:19 -0800 (PST)
Date: Fri, 25 Feb 2022 20:36:16 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_0/7=5D_malta=3A_Fix_PCI_IRQ_level?=
 =?US-ASCII?Q?s_to_be_preserved_during_migration=2C_cleanup?=
In-Reply-To: <20220217101924.15347-1-shentey@gmail.com>
References: <20220217101924.15347-1-shentey@gmail.com>
Message-ID: <2F99BEF0-8E45-40C6-B143-1976938E9E9C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hi,

all patches have at least one Reviewed-by tag=2E What's missing for mergin=
g?

Best regards,
Bernhard

