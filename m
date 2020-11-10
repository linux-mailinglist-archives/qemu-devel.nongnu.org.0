Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B21C22ADFE3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 20:38:27 +0100 (CET)
Received: from localhost ([::1]:36740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcZTG-0003HG-On
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 14:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEn-0002Ra-Ab
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:31 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:53541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEk-0007Zx-OD
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:28 -0500
Received: by mail-wm1-x342.google.com with SMTP id p22so4313714wmg.3
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 11:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q6f5NplGvUZpqMcUD/6cwL2MqHQLbfGj/tCEmONpAIk=;
 b=WMad8QEfoDpxvFs8qTHWUIH/mNnx02ac2SrUVKr/6RgNegQbl9DtjHOHjiK6xUbimx
 vSEmsm7/Oa99+PT1YjoMwYnJkFx0wCdt9zlSpnWRXVKLHKmMSh97FTS2BsEBA0uZ94dl
 u7b5JVNw2sGJeWGaTG+y77VoUGV1mLrJAXAQnYDvwg/R1sCQPtZ4jTB2sOMvHcGrXWbg
 FrpfqUHZXw4q+Ua7SenmKXABB0LwbAbpK0stZoy4UNBcZ0XG33RxGG4x2PKv10+Kl0w0
 Ef6C2TjOHn/wE1JYhRqrWO2Qs3Di5JrIaTdoQw29RcAqJJuemVK6Gkt3CDKlPxrTSOfA
 Wdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q6f5NplGvUZpqMcUD/6cwL2MqHQLbfGj/tCEmONpAIk=;
 b=ZyrJm/GCCfrlwCnXwOWYOoYD4jQ+a50wikLYFA+91I6Bhlc41p9sn1mtcXmsqfNuzX
 7sy8X+R5md+XPLMyiez0d61IHBPgz5lTOklZVl1X7YszNCOBb9xUnz8IGgvHoOed4WcJ
 Z8Nslgr5yPprAEQQTAMtuVv/Rreix3c1mqFKB5eyJHE3L7IHbF9px3P9FfeXKLPeJVYf
 CQTarH6MCvQ6sNpnS36jpTuc92oTAFb0v6dQPff+Pt9S0rRW+59Seq/fB1QSaIQEZak8
 guuToVC0G9mpnbP0LQJhYPAuerU6k7TIH04n0cB+9mnAriLf8L99FVIKEgJDfQM+5J//
 0vqQ==
X-Gm-Message-State: AOAM532mSs+mYW2YXNxVDJ7PrmnnXnRIqOlSo+5WJc5ulJ4xFB41g1qZ
 i5IH8hVJW6uBexAVK+ktqUqbBQ==
X-Google-Smtp-Source: ABdhPJy9GQvg4GRiygxKMaZOBm+jRtUinB3C0yszrMhDo1FhEUW+Ix1IFr7ILU2qlfv4VOdZMl/s2A==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr642417wmc.173.1605036203143; 
 Tue, 10 Nov 2020 11:23:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c8sm18139524wrv.26.2020.11.10.11.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:23:18 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 89E5E1FF8F;
 Tue, 10 Nov 2020 19:23:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/10] meson.build: fix building of Xen support for aarch64
Date: Tue, 10 Nov 2020 19:23:09 +0000
Message-Id: <20201110192316.26397-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110192316.26397-1-alex.bennee@linaro.org>
References: <20201110192316.26397-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Masami Hiramatsu <masami.hiramatsu@linaro.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
Message-Id: <20201105175153.30489-9-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index b473620321..ef197f9a6b 100644
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


