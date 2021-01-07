Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A65F2EE897
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:27:28 +0100 (CET)
Received: from localhost ([::1]:56606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxdkd-0003OH-9m
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:27:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdgh-0006wq-II
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:23 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdgc-0004jA-HA
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:23:19 -0500
Received: by mail-wm1-x332.google.com with SMTP id g185so6828776wmf.3
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i4p93KWwozcpUdxQORlradD/IWu48glCvPCZu/J+OhM=;
 b=Czkxpi82pJCD7JSf0mA7kHhcxneqK0d6Fsds+0JbSzuPtZWV1yh1M5oXFGZ+w0JNuW
 cyc5o4bORJxj++VlibljEoacu8ytM3nu/1NQbW3IgS/bOzz1y9DfQt+sKqMpCMHFyH7R
 L9Yw4OgAR6qcwJ82fnwL7IIdbY8GsFKenrAsXAREMdk5h1j94jq1mNQbh/U8E/o5uYKK
 wjx9K4+FV2DA7gTfJD1gevkY8UEbaQdtJ7hR7mAwRcis19ywwvO2BOHPJJdYa/gtmkom
 gCe6QknW3HDOAqJmSv7I6pxVUett3/FbWSncVR8NTYiJW6QHnM0MEPER2H1PsEUn30Vz
 vHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=i4p93KWwozcpUdxQORlradD/IWu48glCvPCZu/J+OhM=;
 b=mrErjrGv+vKlPQe9oYzvOh+xKAd4eOMPDnCo4zQcPMODIO1Vxbxf79VUNYyeoj+IM3
 DXkJGmPQj/h9uttgtYPArx3GEaS/dze9HPL2kqP1PjvTXJrnywc+DJiCp8P43TznjC8S
 NJnmIAH+ewIWbh0W4/AURNeOhSdtcXo48quYTf/B+K8ByS7kgrTF8twUEwBDvTQwBS7N
 f3XA4cguyeoHtFs+62JePZ2UaexSZvGQUYmwhw4JpReQHCsfXNS/x0uz/FE57KiFBJy8
 coKTICcD+D5+Le1wEoa93ff/BlTzW9Nolht9CAaswXhJpqVmeJCti2cuJJpQfYpdcUYR
 slOg==
X-Gm-Message-State: AOAM533+IfCvAxjl5wfq55uSGnv4Ir55ZCy0TjcZpJxoshZYUnjm7wEk
 BOUXZNkmAuXxAI6oBZlW+IeE3/KGw+Y=
X-Google-Smtp-Source: ABdhPJw42/Tbgd5nDkMN32lGkO4V59KXfV71HMhGiFKrMKuVn2Z9xZTeKIOwm/xUy/9bCNTfy7TeRQ==
X-Received: by 2002:a1c:234d:: with SMTP id j74mr532053wmj.18.1610058196986;
 Thu, 07 Jan 2021 14:23:16 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id y7sm9861567wmb.37.2021.01.07.14.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:23:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/66] target/mips/mips-defs: Remove USE_HOST_FLOAT_REGS comment
Date: Thu,  7 Jan 2021 23:21:51 +0100
Message-Id: <20210107222253.20382-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove a comment added 12 years ago but never used (commit
b6d96beda3a: "Use temporary registers for the MIPS FPU emulation").

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210104221154.3127610-2-f4bug@amsat.org>
---
 target/mips/mips-defs.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index ed6a7a9e545..555e165fb01 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -1,12 +1,6 @@
 #ifndef QEMU_MIPS_DEFS_H
 #define QEMU_MIPS_DEFS_H
 
-/*
- * If we want to use host float regs...
- *
- * #define USE_HOST_FLOAT_REGS
- */
-
 /* Real pages are variable size... */
 #define MIPS_TLB_MAX 128
 
-- 
2.26.2


