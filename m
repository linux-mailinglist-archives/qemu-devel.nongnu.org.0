Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5385B456374
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 20:23:40 +0100 (CET)
Received: from localhost ([::1]:60088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnn0V-0004u5-5I
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 14:23:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnmxb-0002m2-G1
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 14:20:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnmxZ-0006C4-Fy
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 14:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637263236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BS3zUsplw/cddARHJF9KyG2TRGK5Hoy8tUIn5HvjRk8=;
 b=XRtWfwcNilxiCQMMCdzTZX1uo48XijwpmM1HulTJvr7mMlyXHvjoTokOhRNhLi1dzPzL08
 PRHDQdTSvHHdZD4L+tbD0fN//CKMh9ZZD/8Z8yIcTzgI798shFLGGIVnmJzve6AzmiplGp
 VF4CaVAwsplSgDNF7zHG5sgA9FvJQOk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-Bc8OdFOcOlObbK-Rw-IMmg-1; Thu, 18 Nov 2021 14:20:35 -0500
X-MC-Unique: Bc8OdFOcOlObbK-Rw-IMmg-1
Received: by mail-wm1-f70.google.com with SMTP id
 i131-20020a1c3b89000000b00337f92384e0so4774461wma.5
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 11:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BS3zUsplw/cddARHJF9KyG2TRGK5Hoy8tUIn5HvjRk8=;
 b=tSe/Dl0M4Pt4NiEtLTOa2/dc9Tam7wFIlB0gFiutlZ56y/xBIMRBXehlY3RFMbCuY3
 yPHOfN2jyBc5rwPHw7/xb80WUTMU72t1ZEEL5hf+IKprkQbPUJ939I3e+Ar5Whod/2P1
 R0z96KS1dq6Q8RAQESCU98KnnjVP30SKdG4mPLhe8bUwAi856+5az+ZyLpeeg13Kphdh
 T+6TmuqG1pLfGePtB0syT1O9M5vM+MDkdrNiMt6soeHGtcZEEi1yAC2Kl9fms8VFzmbP
 BtXUuR+KXvGgzZ7rC96cdA7eoUJZ3EqH69b8svVMwn8zdcRjlk/mPmFiF4HsGf1Dw5Q7
 zKXQ==
X-Gm-Message-State: AOAM533RA9dTT2ITFBuUSlghcfW0aESljK9/93yfSIORBOh+6tv8kN9D
 1j5nGlGGpRTLWGPhQVf3LZ3lh1VX3R1yy4smtpsU/g73Lfwsrr34l1ISnDZPCF4Ydf35NgWfXtl
 BU72Fzqhe7vDswBm/A59ZnzM+Oo5olXpmI8pCkwu5Led+lYl9JmVKHYH0ye1rnPB1
X-Received: by 2002:a05:600c:2252:: with SMTP id
 a18mr13369610wmm.133.1637263232578; 
 Thu, 18 Nov 2021 11:20:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbiH+GAbOugjqSDdjSe0fk3jnOexxhrCeIIdpHsw4Ix0UwugXHk8a2HHULKDh34nPUn7UDjA==
X-Received: by 2002:a05:600c:2252:: with SMTP id
 a18mr13369561wmm.133.1637263232276; 
 Thu, 18 Nov 2021 11:20:32 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 u14sm679584wrt.49.2021.11.18.11.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 11:20:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 2/2] hw/display: Do not allow multiple identical VGA
 devices
Date: Thu, 18 Nov 2021 20:20:20 +0100
Message-Id: <20211118192020.61245-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211118192020.61245-1-philmd@redhat.com>
References: <20211118192020.61245-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 John Snow <jsnow@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vga_common_init() create a MemoryRegion named "vga.vram",
used as a singleton for the device class. When creating
the same device type multiple times, we get:

  $ qemu-system-mips64 -M pica61 -device isa-cirrus-vga
  RAMBlock "vga.vram" already registered, abort!
  Aborted (core dumped)

Commit 7852a77f598 ("vga: don't abort when adding a duplicate
isa-vga device") added a check for a single device, generalize
it to all VGA devices which call vga_common_init():

  $ qemu-system-mips64 -M pica61 -device isa-cirrus-vga
  qemu-system-mips64: -device isa-cirrus-vga: at most one isa-cirrus-vga device is permitted

Reported-by: John Snow <jsnow@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/display/vga-isa.c |  9 ---------
 hw/display/vga.c     | 13 +++++++++++++
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
index 2782012196a..b930c8d2667 100644
--- a/hw/display/vga-isa.c
+++ b/hw/display/vga-isa.c
@@ -62,15 +62,6 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
     MemoryRegion *vga_io_memory;
     const MemoryRegionPortio *vga_ports, *vbe_ports;
 
-    /*
-     * make sure this device is not being added twice, if so
-     * exit without crashing qemu
-     */
-    if (object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {
-        error_setg(errp, "at most one %s device is permitted", TYPE_ISA_VGA);
-        return;
-    }
-
     s->global_vmstate = true;
     if (!vga_common_init(s, OBJECT(dev), errp)) {
         return;
diff --git a/hw/display/vga.c b/hw/display/vga.c
index a6759c7e934..8f0d5cc9019 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -2172,6 +2172,19 @@ bool vga_common_init(VGACommonState *s, Object *obj, Error **errp)
 {
     int i, j, v, b;
 
+    if (obj) {
+        const char *typename = object_get_typename(obj);
+
+        /*
+         * make sure this device is not being added twice,
+         * if so exit without crashing qemu
+         */
+        if (object_resolve_path_type("", typename, NULL)) {
+            error_setg(errp, "at most one %s device is permitted", typename);
+            return false;
+        }
+    }
+
     for(i = 0;i < 256; i++) {
         v = 0;
         for(j = 0; j < 8; j++) {
-- 
2.31.1


