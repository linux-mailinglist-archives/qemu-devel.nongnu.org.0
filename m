Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4FB2FBBAE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:53:13 +0100 (CET)
Received: from localhost ([::1]:43234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1tJg-0003qc-IC
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:53:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfO-0007xP-7f
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:34 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:35664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfM-0001KB-63
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:33 -0500
Received: by mail-wm1-x329.google.com with SMTP id e15so84169wme.0
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XSvo/FTYDK5CvFW7dWb3StsBvky4ysX/D2yqiuNPvKE=;
 b=rGy7i/Vi+6E+IpU60pgcFjA0H91XtsBy4vVs8RJcWlHg05n9LVXbf/MLW1gcabUObX
 i/uxc4CbsDAzUcWq8z/4cPu0lEbyeCCRnXn5+9l1NdrpG/SwQu3OCz6Qks81WVNwMKJl
 oqfi3AqBytaprYAz7U9S0tMdhmNzWr11s+/93cfhkcflCpDRI6MYg2Vfz4B+6ogQdBNu
 mkJ3TNS4flWtZSltUUFbyhTscY+EIpB785+o/mLvX5OiqHG0J+7DBrrZ8s2wfOJ5QKOT
 CPWXrdqesrvGsuCtfMwjO3DB5Vo3/8ecdviSJAyE4ajHAKqbdlI5iYxFbRDKecx0R3RW
 HyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XSvo/FTYDK5CvFW7dWb3StsBvky4ysX/D2yqiuNPvKE=;
 b=TyI5Xm7203RyY8LztDsWdvAq/LoIHVB+H/9ZAwFI2S4kfMBTMvt9bwwIxGBCL8p7Xe
 IZST8GgnOK6yHDHuMkkykM2swL/PClU4lT7DY/Rsna/w827lVeA1Lctw3UmXHtfbzZ+6
 wq+0bUlJjYqWnNZzgsdpbiIGW1OlIcIprJVtT1FlDb53b7G+QgRRtzbFRW4mQjpLY+HT
 5j56VE4/5YUt20x8Agmcqwkkqy76ECdK/yMdOsc5qEfpDukoOlQ5VOPywmko5sZ2tnEA
 pcL1BIEXBN4JBW8AJ89mUhrTaeppJJkZNqRZXu5VYP4/b8AgnaFOV2wS4yYc/wkv+15S
 h99g==
X-Gm-Message-State: AOAM533PI83aH4Yhz0RQzD+SalB80ViZJcrQ1tzNFIWO8H+BWi9ftulA
 5f0ByA89ZjpaWu506sEzycW3xDS/W+TCeQ==
X-Google-Smtp-Source: ABdhPJz2kXf8tbe5X/dcQ/M+lXRGClOAKxikanppMqjaRIpHOPxeaBWeVRuKZwY/gpVu3MoDc61T8g==
X-Received: by 2002:a7b:cc83:: with SMTP id p3mr124972wma.10.1611069090799;
 Tue, 19 Jan 2021 07:11:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/33] pvpanic : update pvpanic spec document
Date: Tue, 19 Jan 2021 15:11:00 +0000
Message-Id: <20210119151104.16264-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mihai Carabas <mihai.carabas@oracle.com>

Add pvpanic PCI device support details in docs/specs/pvpanic.txt.

Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
[fixed s/device/bus/ error]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/specs/pvpanic.txt | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
index a90fbca72b7..8afcde11cc8 100644
--- a/docs/specs/pvpanic.txt
+++ b/docs/specs/pvpanic.txt
@@ -1,7 +1,7 @@
 PVPANIC DEVICE
 ==============
 
-pvpanic device is a simulated ISA device, through which a guest panic
+pvpanic device is a simulated device, through which a guest panic
 event is sent to qemu, and a QMP event is generated. This allows
 management apps (e.g. libvirt) to be notified and respond to the event.
 
@@ -9,6 +9,9 @@ The management app has the option of waiting for GUEST_PANICKED events,
 and/or polling for guest-panicked RunState, to learn when the pvpanic
 device has fired a panic event.
 
+The pvpanic device can be implemented as an ISA device (using IOPORT) or as a
+PCI device.
+
 ISA Interface
 -------------
 
@@ -24,6 +27,14 @@ bit 1: a guest panic has happened and will be handled by the guest;
        the host should record it or report it, but should not affect
        the execution of the guest.
 
+PCI Interface
+-------------
+
+The PCI interface is similar to the ISA interface except that it uses an MMIO
+address space provided by its BAR0, 1 byte long. Any machine with a PCI bus
+can enable a pvpanic device by adding '-device pvpanic-pci' to the command
+line.
+
 ACPI Interface
 --------------
 
-- 
2.20.1


