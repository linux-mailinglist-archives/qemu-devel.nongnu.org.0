Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C254D4FD2
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 17:56:58 +0100 (CET)
Received: from localhost ([::1]:40312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSM5x-0007N2-79
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 11:56:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nSM53-0006gX-7l
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 11:56:01 -0500
Received: from mout.gmx.net ([212.227.17.21]:46765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nSM50-00009i-Nq
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 11:56:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1646931352;
 bh=uNTiijJWZDzd19IYrNaIXyYk2+uDGR6jlI2g1NAqhCA=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=N61mtx18XZfdH8PHHKM3kcgfxbIo9Dh2z68toR9xStlYLrBo3LwLcA2ffcaRBMhzk
 adarBzAzpQy2USXxbr7QF4cLthC4cRvmfIf3dE223DrdB7fsPAN5D5NW+GsUUPse5x
 9b2tmlXnz7F/YVRtppCtmG/QYQKAjhiGcitoIzvo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100 ([92.116.187.196]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXGr8-1ndwgQ2v2k-00YmD4; Thu, 10
 Mar 2022 17:55:52 +0100
Date: Thu, 10 Mar 2022 17:55:50 +0100
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>
Subject: [PATCH] tulip: Assign default MAC address if not specified
Message-ID: <YiotlroslM5hcR04@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:YV5T0pOtRNczWgu0C2sti0LsifJ7an5Vzl3xdkzrusaaU9yKTYq
 q96tagmqihZRjPacjJhMG/NZYw/WKxG+hEOoX6B7mSsEnlDE6Kbpsgm+1r/z7nRFHBzcvIZ
 kTEh35dWKBnm0Rrfv3wOprUwP/uMzYH0IFAznDsBDl3aobDOBZA6WQW83ZgFZcYm8b1TIFs
 D0IoKpfNnnh/CVgHBH3/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CIpYRSkD1J4=:2SKlL5btD0Y0ls6EG2iVa7
 NU91s3UZecLsqtDx9wgUPqpTUXxg5YSKtPgri6KXeEJwOrJKdvsl0fxfgjxpkynbhaiT0nWWo
 S2RJ+xQQz7eBwmhFVIEmwWN9D+nnNNYZaUjOkrJGzWk93qL0OrdFIxKY0PooP9f+XktJ1+Nk1
 hts05F0goUpZBlwx53ptC4Y8T98S9r/r/QdNupBYsCFf6FyUZSVzGkBrmiveE0dDNAxl3dc0U
 b5cLLUUSygmOZiIrFRbwKf9F6PX9NtCaicbdiPgHikeVKgKrfzwhvpUnZwBR4vVjzS0Y2XPZZ
 CDA8Clvg+wyx0V6ajvfMmhJOS9WLcUpvdSgjf5OExZDhIHoVG1K3mavt68qTh/1PMKEPoSAZR
 /FSAKlSYACJfito3US6F60QhBFzWocIojCk+qUvPyTRMdr25MV8fwQnIplVPdQFVcAVFgE7MC
 0fYzxiQmLF5WCqLFY8KnGM8OYoSpzELvFhFjCOBoVxCjoYcNoOBlpOi+UnmKSK3e9nvWWkpqI
 Oghj3c/Uut+zQss0ryqSc8kdBCKHHS2EOGHB+68PgycCdXi1RLNNFD2JdCzMHzorFJjLfpeUv
 us64cG9trN+Gf30QvbrB/9QnZhMgbxbPQTZpb8EYoNiI1ht4tPPnpkou7uFADtNgnq7OzHZYg
 GEh5qoXZgvf81hyfXfITA+eO5NNdTgKsfpCF7LQ2fyAhL2yLfbBJ+CfbbX91tYa2ywI0u9OTX
 J3AfC9+sKzhUKb09Vuq3r5gfZt2coaRa3V7DlRBnJJg4NFFdGh46k+KrV2pGCCZ8+DRr9Yhx4
 7P1dHvG7hH358NXrpbKRqvJVdehD/N5gR5mfeqMKh98AJuNmUAsLoxxlzOx/i5i1x6/HIFoAP
 JzW9PrQMk/K84Fx83YBG9kzDSE58Nca2L2vHQrmZWVPKoOHHWYf5cYjweB5WyTFayFdGfyTMi
 C5u6ArI7urKJzV6Ik8FGasnLKqto1xw6y5MEGIGL8YbiQWzwUYpgSA2C/kHQxyJYc0OAyc1Rh
 QFWHlU5bHt1I0kuI49WpZYmHDmkX4jOgTQ2LnPeykUsKrApyF/q+zVhf5OGEPc1TU8BFDFhqJ
 22i0qsSt4+0b7c=
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MAC of the tulip card is stored in the EEPROM and at startup
tulip_fill_eeprom() is called to initialize the EEPROM with the MAC
address given on the command line, e.g.:
    -device tulip,mac=3D00:11:22:33:44:55

In case the mac address was not given on the command line,
tulip_fill_eeprom() initializes the MAC in EEPROM with 00:00:00:00:00:00
which breaks e.g. a HP-UX guest.

Fix this problem by moving qemu_macaddr_default_if_unset() a few lines
up, so that a default mac address is assigned before tulip_fill_eeprom()
initializes the EEPROM.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index d5b6cc5ee6..097e905bec 100644
=2D-- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -967,6 +967,8 @@ static void pci_tulip_realize(PCIDevice *pci_dev, Erro=
r **errp)
     pci_conf =3D s->dev.config;
     pci_conf[PCI_INTERRUPT_PIN] =3D 1; /* interrupt pin A */

+    qemu_macaddr_default_if_unset(&s->c.macaddr);
+
     s->eeprom =3D eeprom93xx_new(&pci_dev->qdev, 64);
     tulip_fill_eeprom(s);

@@ -981,8 +983,6 @@ static void pci_tulip_realize(PCIDevice *pci_dev, Erro=
r **errp)

     s->irq =3D pci_allocate_irq(&s->dev);

-    qemu_macaddr_default_if_unset(&s->c.macaddr);
-
     s->nic =3D qemu_new_nic(&net_tulip_info, &s->c,
                           object_get_typename(OBJECT(pci_dev)),
                           pci_dev->qdev.id, s);

