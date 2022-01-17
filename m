Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D138490B56
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:25:06 +0100 (CET)
Received: from localhost ([::1]:55392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9TsX-0001PP-79
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:25:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9TQP-0000Yy-7q
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:56:02 -0500
Received: from [2a00:1450:4864:20::32a] (port=39598
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9TQN-0001Jt-MN
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:56:00 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso24968658wma.4
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 06:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TXYGLBQl6cf9T9L1XGTbclXyqLqbG5O8yICVfWUvPCA=;
 b=PbILZmc/hfwzbns+brmq+nmb1QZico5nLNnO1/YHqARX0cf4Vxi2xIqdXmwHd/HKad
 buDGZJk6dpnNpIcNnxrf6ff/6GnT9bIXF1gteDYZVhMHtgMM4r3973i8BN+qjPhPFv5A
 R2ivs2+AaQ6TKsYHbWac+S5BczU2xOuaHRZTnsXog5AdnPfZMkdWNXP74JN3CccizSx7
 LRnPcv9Wr2HO+W0eKl7AP4qF4sXQXATJ4MMzhrIuhRLE1EV7VdV7mfFIj+j3TCK2VdvT
 6/NDoJtz8abP9CnHXNlPWFemBHdEVZb8joYln8uJPvav8T/gUBZZcWhIW+1yP2UThV6c
 Pw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=TXYGLBQl6cf9T9L1XGTbclXyqLqbG5O8yICVfWUvPCA=;
 b=HzsMJx4tB070SiZZsTYmniy5hSKqlDjwK5PzEfPB34/X6YASTl4U8JIiRziaz9FQHH
 BkX52uxgeP0YsTrT79hICOaz6Hgf/Dbf/4dijqUQnaoPzFg5DPNjapzaZzi50/b2dNMj
 6v71mZPhpZpo04ffLkvkwmnSXVxA3L7JgwDU02HUlL1H9M2XpeDhLoWixWzZuzVa6PMY
 4tAY+3bjHS7uvuoUy5Up9AJGZCT74i0t3leWj5iUvh3cZEb/DEeVIa4kGJ5UClQxXCIc
 o09xogFFE2OaliBMk8QXm5JR+5/tit0XeEokr1Q2IJwx0aiQFdCRPVZ/eAuMlN8aNZyV
 p3UQ==
X-Gm-Message-State: AOAM5312B2+YAvL/xFNuPhxz2VsDoxAd41FqC07IWOcC3byWlScQ5+rv
 GSQe7siy/JTy9I3tCnDwFFI3emn03XX+Ilce
X-Google-Smtp-Source: ABdhPJyHHSYWQadxmmlw/MM7rLB9vv+WMdao0wRpB/Ac9k3+rTOEqOCXfu9ym+N+Ye3veHrrbUu3Ww==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr7886535wmq.63.1642431356759; 
 Mon, 17 Jan 2022 06:55:56 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 i12sm11519613wrf.100.2022.01.17.06.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 06:55:56 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yang Zhong <yang.zhong@intel.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 1/2] hw/i386: Attach CPUs to machine
Date: Mon, 17 Jan 2022 15:55:48 +0100
Message-Id: <20220117145549.145650-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117145549.145650-1-f4bug@amsat.org>
References: <20220117145549.145650-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Previously CPUs were exposed in the QOM tree at a path

  /machine/unattached/device[nn]

where the 'nn' of the first CPU is usually zero, but can
vary depending on what devices were already created.

With this change the CPUs are now at

  /machine/cpu[nn]

where the 'nn' of the first CPU is always zero.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/x86.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index b84840a1bb9..50bf249c700 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -108,6 +108,7 @@ void x86_cpu_new(X86MachineState *x86ms, int64_t apic_id, Error **errp)
 {
     Object *cpu = object_new(MACHINE(x86ms)->cpu_type);
 
+    object_property_add_child(OBJECT(x86ms), "cpu[*]", OBJECT(cpu));
     if (!object_property_set_uint(cpu, "apic-id", apic_id, errp)) {
         goto out;
     }
-- 
2.34.1


