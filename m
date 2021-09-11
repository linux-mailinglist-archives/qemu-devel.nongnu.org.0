Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFC04079AE
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 18:59:08 +0200 (CEST)
Received: from localhost ([::1]:36988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP6LL-0005Iz-Fz
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 12:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6HB-0005yA-Ak
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:54:49 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mP6H9-00029m-UZ
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 12:54:49 -0400
Received: by mail-wr1-x432.google.com with SMTP id q11so7474347wrr.9
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 09:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l8Jx1m6Bv2t518ZIG2TWOXwbWEoTAme9VK7NQaY4YX8=;
 b=Ijui4pwwSDnWn+fQzU5fqPxEPYikDpA7UqEtyu8LS57PXvEANIeHJyzhuIV/FBE5qS
 XH8lMhveBNWTsCBtmJO8wHOWGzCTnS5UDI14LBWe/0poaW+b9zmXExuF4A8TiFon6Gai
 /9y+ykbfWFJqbSxPx086kfyBnNG0Z6ARejVEaXb+NxEno82i2UuQhY9op/lrUDW1zGxj
 XK9wi0Be8+h8YiWc6nFW7SIGzCtRHX9qUYlGL1EGH5WvDBFDKi7ajaQhY05Xz2pUvEFl
 fbRb5zsiSXSTXm87HIRcNyDKVoD6Iv4BhS3W2Ovcgg5rzmPFYimWyAG3ZzqprjTS3QB/
 sR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=l8Jx1m6Bv2t518ZIG2TWOXwbWEoTAme9VK7NQaY4YX8=;
 b=ToU9NNHoADFRUAlHyusOcBfCfxwN2jcXQs/VUwOFUU613Y/cQHiqAGodaoS76EQB4Q
 J+e4UG7hT5LPy8nTI3Q12yYW/rWabgzIOPUeYTeNFJ87o4/EiIaYONiiQeta80VGGEbN
 j3lhfh3ehH76DiULu8e3GyD1N7nVK4tGRwFW84Zttd/5C1VfsVOHcrk+w9Mq0pjUWIVx
 v4hXZyuxpL3NUZIPAMPl7yLD3pc0oEVznrh1NOJcBYLQXiJhVpRA/F1R/9ylkW1oGZM3
 GgC3/UX2qLdanrzbV1b1akg6gza8Dj5scztSLXRBI6JnTw5gcmLi6F559YU8kiHiXkRZ
 wzvg==
X-Gm-Message-State: AOAM5300UEmr5wLLeJ+k9XHfMJWMN6mrLhKoWgSRSfMdQyia9e/Wi6yo
 ekw/NVgz9tEVo98D1+RdFG9O0ecFcZU=
X-Google-Smtp-Source: ABdhPJxjG4Vw9A2AmqqadETnFDudHg2njHPeXmysELlJHmGr6U4eKEE+CnpufoS909QiU7V8dXvwmQ==
X-Received: by 2002:a05:6000:1186:: with SMTP id
 g6mr3921013wrx.126.1631379286405; 
 Sat, 11 Sep 2021 09:54:46 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id t64sm1932224wma.48.2021.09.11.09.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 09:54:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/24] target/i386: Restrict sysemu-only fpu_helper helpers
Date: Sat, 11 Sep 2021 18:54:12 +0200
Message-Id: <20210911165434.531552-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210911165434.531552-1-f4bug@amsat.org>
References: <20210911165434.531552-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Restrict some sysemu-only fpu_helper helpers (see commit
83a3d9c7402: "i386: separate fpu_helper sysemu-only parts").

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6c50d3ab4f1..c241bc183d2 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1833,11 +1833,14 @@ void x86_cpu_list(void);
 int cpu_x86_support_mca_broadcast(CPUX86State *env);
 
 int cpu_get_pic_interrupt(CPUX86State *s);
+
+#ifndef CONFIG_USER_ONLY
 /* MSDOS compatibility mode FPU exception support */
 void x86_register_ferr_irq(qemu_irq irq);
 void fpu_check_raise_ferr_irq(CPUX86State *s);
 void cpu_set_ignne(void);
 void cpu_clear_ignne(void);
+#endif
 
 /* mpx_helper.c */
 void cpu_sync_bndcs_hflags(CPUX86State *env);
-- 
2.31.1


