Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C591A3142AE
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:14:56 +0100 (CET)
Received: from localhost ([::1]:38400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Eo3-0004e7-SD
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:14:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCU-0003Jj-2O
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:54 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:39549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCS-0006Bi-Ih
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:23:53 -0500
Received: by mail-wm1-x334.google.com with SMTP id u14so48279wmq.4
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v1wa2wRNyEOkT0LUu3oyTGoavZ989jCMYDDvFmxxWSs=;
 b=Xr35hmIOJXIve2F/DcC//05qVK6i10c6yzqM+S+oKwYFit7fLkNQ5KCZcvIihyFpwY
 YRg2q7Z5GsSWdYM0GNnV1pee//8p48oxHrAj/9u0y6/RyW3BUqfMLUROcq84XJILllk+
 84EypVBsSYANcRNqOPBbsDtq5um9znVTWoADZbIgXA2k8NkgE7moxosLmvlF5yiZ8fP7
 /HvqcvUpJA8io6n5nWVtf+XRxo4AccjsSgi9ZqlpgBV6UJSSfaZ6wb3MeGVAqLwyzWSu
 KhBC/a7l1QmlkTejUiWsAIC3ARf40mJkZ8iM5L9pyNYKehszcxFcOiXxjhKTmYPE4T8s
 e87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=v1wa2wRNyEOkT0LUu3oyTGoavZ989jCMYDDvFmxxWSs=;
 b=fgPtnk5EzLatVm861Mn32BqpL7xCW3Gvh1mJQEP5DU4wgbmHZIMpfCCIZeKZ08XH35
 TdZuqAL2sW2yeZtq+IV80R1143ejkCg1dxc2Y7YzioPv5JeWJEKpDLEWfsOw+xj9nNiE
 5bFMZ2d2dJhOBrjyBrV1k7C/DGT8iJ4+T2uJjjrFWQ1vOTtP8W9jKrCVvSjhLw20L2vZ
 Nyvp5KVpa4m+tyjt/i8xMZrt7Y0KrsKL1teMRTAgqRi2J2EpU8wGdQh34bjzopkJjofp
 iaJ0jaL80twJUuaCbPITLbL18YFK8QoL5S6yvWH44SINK049B6X6w5aBbLujvWxK/clt
 jWmA==
X-Gm-Message-State: AOAM531ltUcwPgBeYx9nQ3F73TLn+dyduouUCbI/SQE6pJbYWhrtCMqf
 fePp49vz2oNlNMMu7vHISuV4stDDFWAGWw==
X-Google-Smtp-Source: ABdhPJynaG5ufmOkPY8auHXcoXJv1C1UWrSzVTrVVmIJp/HW2UduxVffx7X5fjA7BsUJnJowFCFD3Q==
X-Received: by 2002:a1c:678a:: with SMTP id b132mr61825wmc.35.1612808631306;
 Mon, 08 Feb 2021 10:23:51 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:23:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/46] configure: Improve TCI feature description
Date: Mon,  8 Feb 2021 19:23:04 +0100
Message-Id: <20210208182331.58897-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Users might want to enable all features, without realizing some
features have negative effect. Mention the TCI feature is slow
and experimental, hoping it will be selected knowingly.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210125144530.2837481-3-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 2 +-
 meson_options.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index a34f91171d..ca2cf50773 100755
--- a/configure
+++ b/configure
@@ -1764,7 +1764,7 @@ Advanced options (experts only):
   --with-trace-file=NAME   Full PATH,NAME of file to store traces
                            Default:trace-<pid>
   --disable-slirp          disable SLIRP userspace network connectivity
-  --enable-tcg-interpreter enable TCG with bytecode interpreter (TCI)
+  --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter, experimental and slow)
   --enable-malloc-trim     enable libc malloc_trim() for memory optimization
   --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
diff --git a/meson_options.txt b/meson_options.txt
index 95f1079829..675a9c500a 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -40,7 +40,7 @@ option('xen_pci_passthrough', type: 'feature', value: 'auto',
 option('tcg', type: 'feature', value: 'auto',
        description: 'TCG support')
 option('tcg_interpreter', type: 'boolean', value: false,
-       description: 'TCG bytecode interpreter (TCI)')
+       description: 'TCG with bytecode interpreter (experimental and slow)')
 option('cfi', type: 'boolean', value: 'false',
        description: 'Control-Flow Integrity (CFI)')
 option('cfi_debug', type: 'boolean', value: 'false',
-- 
2.29.2



