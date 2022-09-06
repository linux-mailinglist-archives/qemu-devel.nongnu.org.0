Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95CA5AEB66
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:22:41 +0200 (CEST)
Received: from localhost ([::1]:59594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZTM-0000v4-Pl
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oVZNu-0003sT-Bf; Tue, 06 Sep 2022 10:17:02 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:41628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oVZNs-0000pj-Gb; Tue, 06 Sep 2022 10:17:02 -0400
Received: by mail-ej1-x62c.google.com with SMTP id gh9so1705475ejc.8;
 Tue, 06 Sep 2022 07:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=+Mon9fe4FAKklCtDF4z+/mu/63rUTvdC7H5OILXXdzs=;
 b=lnzCSns9ACa5vz3eVMHyWvC3gSr6IE/N6ANu4HFhxrSSfD8LL66g1KLJcWQXVYPgIs
 Gdh7uez1slgt+PeBwU6VZtdOyFW3TIeWoac6yoBcbeL9Hd8hSGiiOyTBQffLP40LWk85
 15WlSS7CXiVQCt5GpjBU48iiEU7gjBQfP5G6XqOKJkBdp1+4htWrnY0I836NEb4OczS3
 g6Q0jqzBSGkkUbmX+gJm27KQ4JPd3V7JlNEi2qpn7axcNUb3sjHpiBecPdBsbB0VlEYp
 iZ3KoFynaDEFwk82AZmlu/TDDVeegq+Qi9wbL4Pu9vZ1qLhzrEsxRZFSqMVq1Dp4wTLp
 7fxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=+Mon9fe4FAKklCtDF4z+/mu/63rUTvdC7H5OILXXdzs=;
 b=6fXV53tC6sjD1ToqieUXFM7cW0QPf9fjbnXAEcalEcdNdYaG4tPzBU4vHeZp2FTxEk
 U2Co5Y+ZOL0oKKaird2WdvPDUbMEFj6NFE/VKCH1P24NBpIuBIgZihRoTbpe7Ac0fsjI
 8NdqmA6x/5QNDm91eGBoNqfeQMN5SK5j4raAHNnsXnhJStr+b9ISvkPlfEEjBWL5/AD6
 kas6t9nkUcQHVKr0Cfu7QDPCNRU2/D6stckrck4nBuxPBUKA9+Jz1ETC2RYKfkEXrHmQ
 PznUmsAYj9a9lfdMab+W2cfHG12Rh+kcBGPf2DsQhkM8DyVfjpEkIowO6nZzlkkG2OmL
 LKFw==
X-Gm-Message-State: ACgBeo25vDzu6CAWJBq95W5P5fLYDLGsQybzL+uxJ2a3IaMupSPGPMEe
 vZfYmYL5p+18t/1s6Zt3tQtNyTLJU0Y=
X-Google-Smtp-Source: AA6agR7DZKMMhRXLOXnKz4KnjuRmyyNL+DW7dYJ9O2Q0A8vpKaGnz5INreJFwQ/1nTQfkRphjXvEZg==
X-Received: by 2002:a17:907:60c7:b0:739:52ba:cbd0 with SMTP id
 hv7-20020a17090760c700b0073952bacbd0mr40017177ejc.152.1662473817346; 
 Tue, 06 Sep 2022 07:16:57 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-188-175-122.77.188.pool.telefonica.de.
 [77.188.175.122]) by smtp.gmail.com with ESMTPSA id
 c18-20020a17090618b200b0073c80d008d5sm6544568ejf.122.2022.09.06.07.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 07:16:57 -0700 (PDT)
Date: Tue, 06 Sep 2022 14:16:54 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Lev Kujawski <lkujaw@member.fsf.org>,
 qemu-trivial@nongnu.org
CC: f4bug@amsat.org, mst@redhat.com, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_hw/ide/piix=3A_Ignore_write?=
 =?US-ASCII?Q?s_of_hardwired_PCI_command_register_bits?=
In-Reply-To: <20220602204731.18706-1-lkujaw@member.fsf.org>
References: <20220602204731.18706-1-lkujaw@member.fsf.org>
Message-ID: <29B53F7A-217B-415A-A457-0D83E35B714F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Am 2=2E Juni 2022 20:47:31 UTC schrieb Lev Kujawski <lkujaw@member=2Efsf=2E=
org>:
>One method to enable PCI bus mastering for IDE controllers, often used
>by x86 firmware, is to write 0x7 to the PCI command register=2E  Neither
>the PIIX3 specification nor actual hardware (a Tyan S1686D system)
>permit modification of the Memory Space Enable (MSE) bit, 1, and thus
>the command register would be left in an unspecified state without
>this patch=2E
>
>Signed-off-by: Lev Kujawski <lkujaw@member=2Efsf=2Eorg>
>---
>This revised patch uses QEMU's built-in PCI bit-masking support rather
>than attempting to manually filter writes=2E  Thanks to Philippe Mathieu-
>Daude and Michael S=2E Tsirkin for review and the pointer=2E

Ping=2E Any news?

> hw/ide/piix=2Ec | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
>
>diff --git a/hw/ide/piix=2Ec b/hw/ide/piix=2Ec
>index 76ea8fd9f6=2E=2Ebd3f397de8 100644
>--- a/hw/ide/piix=2Ec
>+++ b/hw/ide/piix=2Ec
>@@ -25,6 +25,8 @@
>  * References:
>  *  [1] 82371FB (PIIX) AND 82371SB (PIIX3) PCI ISA IDE XCELERATOR,
>  *      290550-002, Intel Corporation, April 1997=2E
>+ *  [2] 82371AB PCI-TO-ISA / IDE XCELERATOR (PIIX4), 290562-001,
>+ *      Intel Corporation, April 1997=2E
>  */
>=20
> #include "qemu/osdep=2Eh"
>@@ -160,6 +162,19 @@ static void pci_piix_ide_realize(PCIDevice *dev, Err=
or **errp)
>     uint8_t *pci_conf =3D dev->config;
>     int rc;
>=20
>+    /*
>+     * Mask all IDE PCI command register bits except for Bus Master
>+     * Function Enable (bit 2) and I/O Space Enable (bit 1), as the
>+     * remainder are hardwired to 0 [1, p=2E48] [2, p=2E89-90]=2E
>+     *
>+     * NOTE: According to the PIIX3 datasheet [1], the Memory Space
>+     * Enable (MSE bit) is hardwired to 1, but this is contradicted by
>+     * actual PIIX3 hardware, the datasheet itself (viz=2E, Default
>+     * Value: 0000h), and the PIIX4 datasheet [2]=2E
>+     */
>+    pci_set_word(dev->wmask + PCI_COMMAND,
>+                 PCI_COMMAND_MASTER | PCI_COMMAND_IO);
>+
>     pci_conf[PCI_CLASS_PROG] =3D 0x80; // legacy ATA mode
>=20
>     bmdma_setup_bar(d);


