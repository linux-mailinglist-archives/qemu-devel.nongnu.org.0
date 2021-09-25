Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D0C4182F9
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 16:57:51 +0200 (CEST)
Received: from localhost ([::1]:48510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU97e-00005m-Ly
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 10:57:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU91Z-0007S8-B3
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:51:34 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:36495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mU91W-0004pf-OW
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 10:51:32 -0400
Received: by mail-wr1-x435.google.com with SMTP id g16so36512198wrb.3
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 07:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tcpBP/9O11lxH2OkY3DQ1OAE3IFU4nJ2jfhNdgzdGjo=;
 b=esE+aOjTLvFOR1pvVPn5Xd+dAbb4C2cXAr8kclKegqI/M9HwJTImfDcMx3CtJ98vYz
 xgYZmjlH1XsjuDYVIOPTrv8OFDzv77ubVJfdlrS6KX/Ta6/Hxa+MXt2tw1Qr7UHEVIw4
 R/BmdqXFv6k6Cm8jd/FVJR2gXionuasqrd4Z+H+6Ymm71q2O4aB29klkNYDJsIIIGeAE
 akdkIYwHCp9bc7gimgaOfP8OO1jSGMc7YftPVfFbigVlHQ7ZGQEs2wO3QjnoNsZ/GybN
 gNRlac83LvG0JG7+FQ3AgVTg71P3duUiBTZfQIE6QicWs9wJHJxQDnMrSRIz7s2NjGcK
 u9jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tcpBP/9O11lxH2OkY3DQ1OAE3IFU4nJ2jfhNdgzdGjo=;
 b=rxCydRoZSZ1sljRz+iKOdTqCCEOmME5P5ZITcxIJtBkjYOUudMhi7g8k0AC+BKJsRJ
 Lmlz01Mv/F7THFH/EmMGoA18AHvtbIKkAr6vHYqF6bxIpzWbGazY1f4fD7zkpmkJlK+F
 Uo0WoG6MlLsSWuIRiRsYYU5wV4D/tqKh1Fb8K9PjZWcnNp1JeOprD4k/UvppGLoJoPiF
 0nVCEg0vV1ruC8XVzHduKR3n6vQqoS34ghMrkWDcitJiyGar/+MV68UMjU0UZRVeOAnY
 jpmTZOGKwGsYEi3l743Uap2bgNMt5gSZDcx+N8KnkPqTxZs0gkIYhpqmHKoOUSSmMuHx
 LxSA==
X-Gm-Message-State: AOAM532eMUg3O/qYL4nXJHSgRj9XUJJvlLU4DNHuLjbIhGGi7/DkNj3f
 S/rTVKOcQc7o3MgDCx1gOI7X4176fN8=
X-Google-Smtp-Source: ABdhPJwrkJLVpF0GLIvMlPUAzZyE7HWCRtyIDcUjP87AjuIzpUJXDvac+99KVK3C8GDsbK1W0hznBg==
X-Received: by 2002:a7b:cb49:: with SMTP id v9mr7146092wmj.76.1632581489243;
 Sat, 25 Sep 2021 07:51:29 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 i67sm13683401wmi.41.2021.09.25.07.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 07:51:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/40] hw/core: Restrict cpu_has_work() to sysemu
Date: Sat, 25 Sep 2021 16:50:40 +0200
Message-Id: <20210925145118.1361230-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210925145118.1361230-1-f4bug@amsat.org>
References: <20210925145118.1361230-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_has_work() is only called from system emulation code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bc864564cee..2bd563e221f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -538,6 +538,22 @@ enum CPUDumpFlags {
 void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
 
 #ifndef CONFIG_USER_ONLY
+/**
+ * cpu_has_work:
+ * @cpu: The vCPU to check.
+ *
+ * Checks whether the CPU has work to do.
+ *
+ * Returns: %true if the CPU has work, %false otherwise.
+ */
+static inline bool cpu_has_work(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    g_assert(cc->has_work);
+    return cc->has_work(cpu);
+}
+
 /**
  * cpu_get_phys_page_attrs_debug:
  * @cpu: The CPU to obtain the physical page address for.
@@ -636,22 +652,6 @@ CPUState *cpu_create(const char *typename);
  */
 const char *parse_cpu_option(const char *cpu_option);
 
-/**
- * cpu_has_work:
- * @cpu: The vCPU to check.
- *
- * Checks whether the CPU has work to do.
- *
- * Returns: %true if the CPU has work, %false otherwise.
- */
-static inline bool cpu_has_work(CPUState *cpu)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    g_assert(cc->has_work);
-    return cc->has_work(cpu);
-}
-
 /**
  * qemu_cpu_is_self:
  * @cpu: The vCPU to check against.
-- 
2.31.1


