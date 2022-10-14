Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843DC5FF0B3
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 16:58:11 +0200 (CEST)
Received: from localhost ([::1]:51330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojM8Y-0006il-It
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 10:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojM50-0002iU-3T
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 10:54:30 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojM4y-00046q-E9
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 10:54:29 -0400
Received: by mail-wr1-x436.google.com with SMTP id bv10so7951888wrb.4
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z9IwwN28K/oAJeRo0Im4Pd2Z7Ujswf+/fXQjiiFKN+E=;
 b=eVAmxWnCx8MFXdJElVpFzMJHyNP80io6VMvakb5L00189QGYnnA7cxvArNG0bGPSLK
 RF3rO16d272O2WR0eE67N4jR9IqB5JzPdj5V0kSzI2iAbwEs5CAZ6Dhf58dpYXKozGM9
 CUdTdz9iUujSRnU9ueDshBue5+hhjCMGMLTKagHd2QfRdYXVUR/CwCF8eyA9w0HXLXiH
 J/dhu/sMMN9dfuRl1Uymp/2PBz6bk9ZtWFQ3JBSGl4o0A4Kzq9PKEaWypnthopuRp/7f
 lobeLGyFMi7C2+I6/gAAgKouVC4I5ngNVfXwjIK+mFx3zDat6PHtAmlcgAoW6iuNU/8n
 ujgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z9IwwN28K/oAJeRo0Im4Pd2Z7Ujswf+/fXQjiiFKN+E=;
 b=D2rVnQRySLYhSXHiaqJ8IreGuOtetagX8MS6BmNLWyzYaXhKMDmzAIGjVoLLFB79UO
 T8/MmOUooYOexXGTfI0fmHIysZ5KZWL/9ySqNcuXHs5V2zm+kZLjbKn02s8vkUK5rRos
 HSEE0bZ01G0O/kYoWtcatyyGhoWsIVplbXS8C+hx8KBCAtig2Qotq3pPz9mQe+zTFkzc
 XbONer+HiYKJ9YEz94SWqg/umprqTGQY4VrwoIEzzu5/U5V5tabjrq5XbCiv2/ojoPty
 6OitB5GRevcocvzm5+d4dX1K+vjV0cRDI6eb107/1mm/w8MgYzSKm6dkOVvF5PWtIoaQ
 nkdw==
X-Gm-Message-State: ACrzQf0Vgd0faVlC+C6yHi7Eb5tMsF+63Kbj/PJa2arCt91EnRhELf/E
 GXFgHi1PoykQJMs2qBi0zOQVHAj9oVoXpQ==
X-Google-Smtp-Source: AMsMyM4zpFl2BbUsR1jLKYJNA1OoSZiteNLX5P7821kJZxS9yjSpoEwUg9+GBwbWl1minAjWL2Rngw==
X-Received: by 2002:a5d:5944:0:b0:22e:3c67:75de with SMTP id
 e4-20020a5d5944000000b0022e3c6775demr3688797wri.5.1665759265565; 
 Fri, 14 Oct 2022 07:54:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a7bc019000000b003c6b874a0dfsm2993592wmb.14.2022.10.14.07.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 07:54:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] hw/usb/hcd-xhci: Reset the XHCIState with device_cold_reset()
Date: Fri, 14 Oct 2022 15:54:23 +0100
Message-Id: <20221014145423.2102706-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Currently the hcd-xhci-pci and hcd-xhci-sysbus devices, which are
mostly wrappers around the TYPE_XHCI device, which is a direct
subclass of TYPE_DEVICE.  Since TYPE_DEVICE devices are not on any
qbus and do not get automatically reset, the wrapper devices both
reset the TYPE_XHCI device in their own reset functions.  However,
they do this using device_legacy_reset(), which will reset the device
itself but not any bus it has.

Switch to device_cold_reset(), which avoids using a deprecated
function and also propagates reset along any child buses.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
It's possible this might result in USB devices on the bus getting
reset more than once (once via the descent-along-qbus and once when
xhci_reset() etc manually reset each port), but in my testing with
gdb I couldn't get that to happen.  It should be harmless anyway.

In my tree of patches this is the last remaining use of
device_legacy_reset().
---
 hw/usb/hcd-xhci-pci.c    | 2 +-
 hw/usb/hcd-xhci-sysbus.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/hcd-xhci-pci.c b/hw/usb/hcd-xhci-pci.c
index e934b1a5b1f..643d4643e4d 100644
--- a/hw/usb/hcd-xhci-pci.c
+++ b/hw/usb/hcd-xhci-pci.c
@@ -85,7 +85,7 @@ static void xhci_pci_reset(DeviceState *dev)
 {
     XHCIPciState *s = XHCI_PCI(dev);
 
-    device_legacy_reset(DEVICE(&s->xhci));
+    device_cold_reset(DEVICE(&s->xhci));
 }
 
 static int xhci_pci_vmstate_post_load(void *opaque, int version_id)
diff --git a/hw/usb/hcd-xhci-sysbus.c b/hw/usb/hcd-xhci-sysbus.c
index a14e4381960..faf57b47975 100644
--- a/hw/usb/hcd-xhci-sysbus.c
+++ b/hw/usb/hcd-xhci-sysbus.c
@@ -29,7 +29,7 @@ void xhci_sysbus_reset(DeviceState *dev)
 {
     XHCISysbusState *s = XHCI_SYSBUS(dev);
 
-    device_legacy_reset(DEVICE(&s->xhci));
+    device_cold_reset(DEVICE(&s->xhci));
 }
 
 static void xhci_sysbus_realize(DeviceState *dev, Error **errp)
-- 
2.25.1


