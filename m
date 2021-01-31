Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8309D309CA6
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 15:21:17 +0100 (CET)
Received: from localhost ([::1]:35844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6DbI-0002dR-IR
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 09:21:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6DYY-0001CL-Fk
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 09:18:26 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:43946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6DYW-0007f2-Rp
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 09:18:26 -0500
Received: by mail-wr1-x436.google.com with SMTP id z6so13690418wrq.10
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 06:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8/C2wBPkOLksivQ3Qh5cM4Cv3DQhSM0tZyYKABIck3A=;
 b=Abi8vCCCegDWl0lzMRTsGHNbIjQZXLt7yDGK2fASYSfw1gYXYjzbtqPOq5/vFrtHBd
 wh+SKn4jnxhP9ASHbizjj6/R4j+Ft6eu9a86eox88G7VBG2l1qll1eYHrsKYO96CJeA6
 rrbf1my24DwKlk1dN/C4NYJGjm9UvCnTi2X/DzhEoV04wxiM4iVr8aCBCmaAO3mcyE+7
 LouxVucmK9u5Ejp8A8oC+jgZNA3fPSQhhIFgR4Ptxrddoi9MTCt8jqgAXmibqjnp4OML
 pEOGI8G+YEzTQzSdnt6oyN4sq+DmwcEQitTu/+ocEkiKUkYM/die06S1JGnZUKGLyD6F
 JnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8/C2wBPkOLksivQ3Qh5cM4Cv3DQhSM0tZyYKABIck3A=;
 b=UAbT/6c4PiT2lKlNubp/aEelnognIHmbhEF8yX9D0rR3luAeOmYK+sFsOskf9txMfW
 2zJhVd+HQpeR5JNafK2HOCyVPkQp9JdS/OY0+w7bychcq1/OPiqzczMsUpFB5daTVkHJ
 KqT0dnZGZXCzaE6hbyZPOk5mPAeDMgBBVHp2KWPbTzO5E1TmJyRMltpHN+zdODXnnrf/
 xGxMokdpk87ShXNVchusT8ErjLUJKhB19EWyTfVcoYU6FJvS3HI3GNYnizlIyhDRvsc2
 odUPqdsYM+DEXC7ArDyeaPFWTR1b5fVvGKzCjAXK5GDz193Df9c1zDDNiCHl6Of7pcAw
 XK1w==
X-Gm-Message-State: AOAM530jklW5qUC292SE/7DgzoSOtF1ChdJ3MVMF2I1CMk9b7lv5k4G2
 CQDRyruhGRbLYv0je0qO3do=
X-Google-Smtp-Source: ABdhPJwK6oVXD4xaBk7Pk7+dbYCtqWB53ps7AVQjh+jJoJfZDiB1Zi72R8clzFa9uSxh2oxJ3CzJHg==
X-Received: by 2002:adf:f905:: with SMTP id b5mr13340084wrr.129.1612102703525; 
 Sun, 31 Jan 2021 06:18:23 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id j11sm7388979wrt.26.2021.01.31.06.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 06:18:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] hw/i386/xen: Introduce XEN_FV Kconfig
Date: Sun, 31 Jan 2021 15:18:08 +0100
Message-Id: <20210131141810.293186-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131141810.293186-1-f4bug@amsat.org>
References: <20210131141810.293186-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce XEN_FV to differency the machine from the accelerator.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/Kconfig         | 2 ++
 hw/i386/xen/Kconfig     | 5 +++++
 hw/i386/xen/meson.build | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 hw/i386/xen/Kconfig

diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
index 7f91f30877f..b4c8aa5c242 100644
--- a/hw/i386/Kconfig
+++ b/hw/i386/Kconfig
@@ -1,3 +1,5 @@
+source xen/Kconfig
+
 config SEV
     bool
     depends on KVM
diff --git a/hw/i386/xen/Kconfig b/hw/i386/xen/Kconfig
new file mode 100644
index 00000000000..ad9d774b9ea
--- /dev/null
+++ b/hw/i386/xen/Kconfig
@@ -0,0 +1,5 @@
+config XEN_FV
+    bool
+    default y if XEN
+    depends on XEN
+    select I440FX
diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
index be84130300c..082d0f02cf3 100644
--- a/hw/i386/xen/meson.build
+++ b/hw/i386/xen/meson.build
@@ -1,4 +1,4 @@
-i386_ss.add(when: 'CONFIG_XEN', if_true: files(
+i386_ss.add(when: 'CONFIG_XEN_FV', if_true: files(
   'xen-hvm.c',
   'xen-mapcache.c',
   'xen_apic.c',
-- 
2.26.2


