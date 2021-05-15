Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED9738178A
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:17:03 +0200 (CEST)
Received: from localhost ([::1]:58792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhrLy-0007Be-6y
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:17:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9R-000667-RW; Sat, 15 May 2021 06:04:07 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:60377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr9O-0006YS-7X; Sat, 15 May 2021 06:04:05 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N63NW-1lSOg00bE0-016Rv7; Sat, 15
 May 2021 12:03:48 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 12/16] hw/pci-host: Do not build gpex-acpi.c if GPEX is not
 selected
Date: Sat, 15 May 2021 12:03:31 +0200
Message-Id: <20210515100335.1245468-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210515100335.1245468-1-laurent@vivier.eu>
References: <20210515100335.1245468-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:EgN/WUvV4VTzQjZhA5mUEZiJsExSyb0cGXbJor54drZyPAHltLM
 TBwgjUfR2O4epHirvg4QrFlrFjTVlVIqOSQ4qp+Va5H7YZD2t1xKA9DuFzpdVV+ThaLmZAs
 9BVDHPe415s4IuXl/L2i1ezCLmshEEvXkaOIWnPmgHj76brQaLs5yP+hd7B7CyMTmfRxHHE
 n66G2Exuk0hOJy397pmtA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:c+0ig8MZqzc=:5tcSisSm8VDE7AssfRhpLj
 y2WUv+fPT47QGWEYWRg307s72EfLjGxlvvisyXc+FfjbMlQhpNH6QwjDOEOJ7xDT1tWTfiBKx
 NrIRdy24RvKGttOXrp3jrpbVnmM0y5zDK6Ui4M3W9tPJFYwlADO0pV9PgHRoGMQ50RTt3aDPu
 fL/fSJcX2KCTaQHdJnHbFEqZT71Qzm11+PW/GAb0h/wxsXL8KhfGMAymDLIBGVZM+cH9n3NLe
 kl712jWdQzmwF4lYWL6DQOSp68Q76LjK/dW5TFdjxSw13UZVD1mDDI2ia6vh7FuTC0+YekX7X
 ycDJ8moidx/i8kUrV4sI7qUiTLxEvHefy/M61LpjxIbm8K9PTGXbhRk0r9PzinDV8oNGe2If6
 B5QFpEG2e47gSAI1kvTJ1SSRz8ZTB9fJy2EmtjCsN9PA7yyuR6QwFGbOU+3MSNvTjl7yOdu85
 hNMkDRNIpVi7tl/UMoARdMKGJfjnhfmUsoFfoSr5X3Y6IKhf5AECqLBJwg3/eyu4i5OyEIUli
 +13uBjjoHEezGZcRlSC7mU=
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Since its introduction in commit 5b85eabe68f ("acpi: add
acpi_dsdt_add_gpex") we build gpex-acpi.c if ACPI is selected,
even if the GPEX_HOST device isn't build. Add the missing
Kconfig dependency.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210425182124.3735214-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/pci-host/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/meson.build b/hw/pci-host/meson.build
index 34b3538bebf6..1698d3a1920a 100644
--- a/hw/pci-host/meson.build
+++ b/hw/pci-host/meson.build
@@ -3,7 +3,7 @@ pci_ss.add(when: 'CONFIG_PAM', if_true: files('pam.c'))
 pci_ss.add(when: 'CONFIG_PCI_BONITO', if_true: files('bonito.c'))
 pci_ss.add(when: 'CONFIG_PCI_EXPRESS_DESIGNWARE', if_true: files('designware.c'))
 pci_ss.add(when: 'CONFIG_PCI_EXPRESS_GENERIC_BRIDGE', if_true: files('gpex.c'))
-pci_ss.add(when: 'CONFIG_ACPI', if_true: files('gpex-acpi.c'))
+pci_ss.add(when: ['CONFIG_PCI_EXPRESS_GENERIC_BRIDGE', 'CONFIG_ACPI'], if_true: files('gpex-acpi.c'))
 pci_ss.add(when: 'CONFIG_PCI_EXPRESS_Q35', if_true: files('q35.c'))
 pci_ss.add(when: 'CONFIG_PCI_EXPRESS_XILINX', if_true: files('xilinx-pcie.c'))
 pci_ss.add(when: 'CONFIG_PCI_I440FX', if_true: files('i440fx.c'))
-- 
2.31.1


