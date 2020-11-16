Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656902B43AD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:26:57 +0100 (CET)
Received: from localhost ([::1]:55382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keday-0003D8-F3
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:26:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYa-0001WQ-19
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:28 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYX-00037x-1T
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:27 -0500
Received: by mail-wm1-x32e.google.com with SMTP id 19so23545578wmf.1
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q0zxAwcwYBxpBHl7aUkK6beKSxBJqCkVvaQ7o3vFSac=;
 b=b1pQUa2E9nj/YN9o0VLCOXTzklCK3hPL0MK+radCP2iofi+zq1ECqT9GuIdQrA+z3F
 r7406UPfMi+lMQiabjxqng4HMCAgSTCcyJhm0+Z/yNvWuhG7wo5/r0pI9sZjA+uLTi5e
 0jukkH0W5XGY4UHlE5FRIZCdmbaRVWWjgDT3qhS5WeqD74wmGZP5RdYXMno2yHk5KTUU
 AUKA2bhqDAatPx143RRAfeRl9oJDaCmROu72xhZdNgrs3YwC7SHIAu+Z/IJFWHKNJV8h
 keEU96AzRFW4OALXIKoOGV/4XYwN987L5CeBIKx/392SYxvZyKUWJLLhy//yGzEUfDlr
 M/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q0zxAwcwYBxpBHl7aUkK6beKSxBJqCkVvaQ7o3vFSac=;
 b=ah6uZLBS+TEoxYcivryg1z8jobuKxG4N6i5Imeeat0WR3jiNs/QCwRmyUwonTixAd7
 DzAy98hTn31B85E4DPkj3dEZEz4OOo9XbBdSEyPgGf4KxarFTxt+3OY9LBmNSBnWHYcM
 kJsZrd/798tJU2zw6mjdmTjGLYpw+SMaCi1qeJVwyCfDHs13jscT3sFlfNbXwlSruBFI
 4Be7+q8AzJ3gi52/D0/vZVJyRFFFeximRX/uilg0geMjnWqkZEI2NGv2ul4q/xV33q0V
 ZvwWHwpmGSS0aZfYW38RA63WYSDhTTX0BaVmcnG37HCCD6o7GUv5on2we3hYcjg7MJlz
 Qfcw==
X-Gm-Message-State: AOAM531avbGwSL3CrR1JgTa1OvxfH8Fj8z/iGWJEWVJQJsc5QJNns+ld
 p267JIZXQS+r9tBOGDln4JCQdg==
X-Google-Smtp-Source: ABdhPJxu1hy4uYb/msZFzu/9hW0DfcuaLovCxFGTZ+DIgZSw0sF2PYfOWlYKeVr7VzuVbK32WJ7Abw==
X-Received: by 2002:a7b:c77a:: with SMTP id x26mr15262421wmk.63.1605529463753; 
 Mon, 16 Nov 2020 04:24:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e3sm6017716wro.90.2020.11.16.04.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:24:21 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 171EB1FF8F;
 Mon, 16 Nov 2020 12:24:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 3/9] meson.build: fix building of Xen support for aarch64
Date: Mon, 16 Nov 2020 12:24:11 +0000
Message-Id: <20201116122417.28346-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116122417.28346-1-alex.bennee@linaro.org>
References: <20201116122417.28346-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Masami Hiramatsu <masami.hiramatsu@linaro.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Xen is supported on ARM although weirdly using the i386-softmmu model.
Checking based on the host CPU meant we never enabled Xen support. It
would be nice to enable CONFIG_XEN for aarch64-softmmu to make it not
seem weird but that will require further build surgery.

Fixes: 8a19980e3f ("configure: move accelerator logic to meson")
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony Perard <anthony.perard@citrix.com>
Cc: Paul Durrant <paul@xen.org>
Message-Id: <20201110192316.26397-4-alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index 61d883bc07..132bc49782 100644
--- a/meson.build
+++ b/meson.build
@@ -74,10 +74,15 @@ else
 endif
 
 accelerator_targets = { 'CONFIG_KVM': kvm_targets }
+if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
+  # i368 emulator provides xenpv machine type for multiple architectures
+  accelerator_targets += {
+    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
+  }
+endif
 if cpu in ['x86', 'x86_64']
   accelerator_targets += {
     'CONFIG_HAX': ['i386-softmmu', 'x86_64-softmmu'],
-    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
     'CONFIG_HVF': ['x86_64-softmmu'],
     'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
   }
-- 
2.20.1


