Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E05136BA26
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 21:38:58 +0200 (CEST)
Received: from localhost ([::1]:47032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb74L-0002KR-Er
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 15:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb713-00084y-BX
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 15:35:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lb710-0008Or-LR
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 15:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619465730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXI5YNvkwlG2ApE36QveSE3/RRHKZRYtLzz/030d0rU=;
 b=F+Pj6OnsUNnoE/HEu8QiUeYB1LMhK/XFj6BPAD6xdlgwtq/zFArKmePKHV9aurruEiQOj8
 dzjluhSLv/FplfW/xmy02INsCbhyN+ttKEI6II5v2qi8VGDoD9g3YGteYGP58cbGA8ztGL
 Z2wouSf8qmy+npATmuGg+SidgREA4dI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-Egsmq4gzPIKy7PkWCulQwg-1; Mon, 26 Apr 2021 15:35:28 -0400
X-MC-Unique: Egsmq4gzPIKy7PkWCulQwg-1
Received: by mail-wr1-f69.google.com with SMTP id
 j4-20020adfe5040000b0290102bb319b87so19508040wrm.23
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 12:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PXI5YNvkwlG2ApE36QveSE3/RRHKZRYtLzz/030d0rU=;
 b=RJ1EiDK11Yh+gwNAiU6cIFK1ZyHyLvgkSetDmuaz1CCveS30X3eLZED1bICBjQ3w9W
 u953EQ/VrYPoEo0CADoi5EMsJWXB0YpVxjVvwYwKXUcnwej6LKNiuFt30nqEMKJEt2U8
 pYn5UTfn6sANdoxQBiN3mzs4z926ekKt3Y0hurwwlAN7u0/LZLQzCbl99fgTjCKzd2/Z
 eFL1Y/6Bxpg+GgcksKe9ke9Zn0awa3/3nDS/WZET1wUEkr0z7+LUTAoDTMJ41Cv+gKGL
 /CmPEyCHG3pkVKCAz66pXiBrKckR1m8P6FnJt1Mvyrx+uq3ifedQQwiE3u0p4Q4JRc1h
 RJ5A==
X-Gm-Message-State: AOAM533Haki2l+LcTQ3fJj2YYtrxkqHIN2oxWcT0chvIR5JFHPNTLhfd
 KJQKBTctfwsYE6howkR2wetbp8R/zTGf+rLOLFky3q71qeOL0sG+NsyRNY7Zj+t7XVMqwUrljU9
 fHNVxdq9JGMfFpq6JhCrTEz59F5aLzpUQyFhcM02HNaqplZ70c8X/oTRhq+vOEO1U
X-Received: by 2002:adf:f74e:: with SMTP id z14mr15241565wrp.320.1619465727250; 
 Mon, 26 Apr 2021 12:35:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2kJ4FNyQP9qvfWFDwZZ0ClRS49xdh+DCuUW2SUocKMlWCZIT0zufxLO6nlZj80yh2RjuW1g==
X-Received: by 2002:adf:f74e:: with SMTP id z14mr15241538wrp.320.1619465726990; 
 Mon, 26 Apr 2021 12:35:26 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u5sm396893wmg.25.2021.04.26.12.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 12:35:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] stubs: Restrict fw_cfg stubs to sysemu
Date: Mon, 26 Apr 2021 21:35:14 +0200
Message-Id: <20210426193520.4115528-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210426193520.4115528-1-philmd@redhat.com>
References: <20210426193520.4115528-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

User emulation or tools don't use / require the fw_cfg device.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 stubs/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubs/meson.build b/stubs/meson.build
index be6f6d609e5..4ff36401cf9 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -12,7 +12,6 @@
 stub_ss.add(files('dump.c'))
 stub_ss.add(files('error-printf.c'))
 stub_ss.add(files('fdset.c'))
-stub_ss.add(files('fw_cfg.c'))
 stub_ss.add(files('gdbstub.c'))
 stub_ss.add(files('get-vm-name.c'))
 stub_ss.add(when: 'CONFIG_LINUX_IO_URING', if_true: files('io_uring.c'))
@@ -49,6 +48,7 @@
   stub_ss.add(files('replay-tools.c'))
 endif
 if have_system
+  stub_ss.add(files('fw_cfg.c'))
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('xen-hw-stub.c'))
 else
-- 
2.26.3


