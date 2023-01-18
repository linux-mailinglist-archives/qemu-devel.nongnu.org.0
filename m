Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05418671599
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:56:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3Fa-0001vu-Rl; Wed, 18 Jan 2023 02:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FX-0001rZ-5V; Wed, 18 Jan 2023 02:52:47 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FV-00022y-In; Wed, 18 Jan 2023 02:52:46 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MfHMj-1ooWBu29hT-00glSG; Wed, 18
 Jan 2023 08:52:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 08/15] hw/usb: Mark the XLNX_VERSAL-related files as
 target-independent
Date: Wed, 18 Jan 2023 08:52:27 +0100
Message-Id: <20230118075234.2322131-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118075234.2322131-1-laurent@vivier.eu>
References: <20230118075234.2322131-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hvs3qR2uYkI3sVXjP6KBaYwM5OfkinMVZldKEPaMTDRAkLmzOjy
 nBEN99LqTs0Jh24nIGkZWzOrpOyv7ZOG6cWHYygFCFyQ2GBRiwvoElqKZ/D6wO0Ke0cV2UE
 NWN7N6z4ujNmoNJqjHaPk3BI22HRnoEwQq5y8H+NxrgunfTotqs7SGaZKVglA/hysvZRmWw
 agpc1A8HM6hVb9ZlNJCBw==
UI-OutboundReport: notjunk:1;M01:P0:ENuNSenOShQ=;qWt7dnVd84Y515OQDkw7sdtLAqS
 n7cuJwjfZNmATKlAPGLA8Fit0eyQkWksMwyex9ntlmXJGmMVEwOkOWHAy/3lusKCahrSqfGnO
 iqigdwM/3FWqoHx5r0Ac6tcx3tXZ0pBMPiELEz1lT8ulBZbRQO5joXDm8njrYACDxxG9wdfbH
 DRAzBFw2K2UAC3yzhOJeke8uRE2sktwU7tZKrIr657R1LXvS75ri4n80ubXbzhqaDfV5lFpV+
 sfTniYIXBYl/C8TdRPz72M3TEYj13SGPAktjmyBgW4+UuboE+YUYEDfTQSOiw6ixVE7ViY/7i
 ccsdwI2Q3Lt+wfawHkhcqxo6aLwBD23QdtFpOecno0IElEMW2sSaagrD1opCfiJBcNmuI0EPd
 3MVzMfJ6VGa/GOBcdahtFvM0PtmcyWWrlqGVgdHqZo9a5bVIUBHBCQ3GXK36/OpNYSjB6iZ8L
 mmcsX+2CuIG5sgvGJ3pAwi7kkztHv5axvmd/3uuQ+1N6v7dsgyJ+mTKceZ4+csROEqozAptfc
 BeYHJxQ6DopB7y4oeGgBilKCMBifgjiKnmo1TBqE8lxgkF+VbhPI79PVbLzlc3EfFPijWPomY
 1Qq7BaoTrD+6bQ34LIxfXU42uyKzpho46U16GR9FGSTC2HXlzz+kqv5o6XIBhucZak49ew/fi
 foBbE6hdYIyDaV4wEs4lrfB3GgEuyylNHk4NrOb7kA==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Huth <thuth@redhat.com>

Seems like there is nothing target-specific in here, so these files
can be moved to softmmu_ss to avoid that they get compiled twice
(once for qemu-system-arm and once for qemu-system-aarch64).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230112134928.1026006-8-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/usb/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 793df42e2127..bdf34cbd3e30 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -30,8 +30,8 @@ softmmu_ss.add(when: 'CONFIG_TUSB6010', if_true: files('tusb6010.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('chipidea.c'))
 softmmu_ss.add(when: 'CONFIG_IMX_USBPHY', if_true: files('imx-usb-phy.c'))
 softmmu_ss.add(when: 'CONFIG_VT82C686', if_true: files('vt82c686-uhci-pci.c'))
-specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-usb2-ctrl-regs.c'))
-specific_ss.add(when: 'CONFIG_XLNX_USB_SUBSYS', if_true: files('xlnx-usb-subsystem.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-usb2-ctrl-regs.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_USB_SUBSYS', if_true: files('xlnx-usb-subsystem.c'))
 
 # emulated usb devices
 softmmu_ss.add(when: 'CONFIG_USB', if_true: files('dev-hub.c'))
-- 
2.38.1


