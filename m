Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3554A382BC3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:06:34 +0200 (CEST)
Received: from localhost ([::1]:43222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lic12-0003ig-R8
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1librN-0004bO-CH
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:33 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:40600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1librL-0003ED-T5
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:33 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 f6-20020a1c1f060000b0290175ca89f698so2592541wmf.5
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p05OmJSUnMaHriZWyvxG4nEBuEX9uFZwBMmOOJcu+D0=;
 b=ecQw9znaR0vYWUZIuj4B8nuzmLrvMOZd+LMK6ZgeIGNN6kup4xj5kS7i1Ii/AuA6hA
 tf4UzkIjwxZ66P5GeQ+C5fbXaqbpeq6KUI0P9syWfQkWBwbfJNd5bpVZo9/6hxtSPGov
 A3y+b66mmbKSCqvLN8duYzprfuapGP78ywK20PivWms0ps5SR6gDr/vk3acZOzTJAXV/
 SxN4B5vRH5bFAXF0u+brI3Wf2ZXP87Z0mj8c/2AsbuImbVQtu/xe1pvRHd6s03UNBWBT
 sEZfOxuaKxiNhvkmbxhZUvZ3L1S49syG/Yf3EZvyM+07dpqfcUc5QmTH5WA+uP4b9M+p
 vpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p05OmJSUnMaHriZWyvxG4nEBuEX9uFZwBMmOOJcu+D0=;
 b=BmFaRScMV3v/3yfij21FVmpJMZk1QfXGx6fGK+N9EGq2kI1VeEy9TVPPlJ0YM3B5ZV
 MSMYLPLa/RtgaCnjrqMzTnvWTyx/fuV5YIBFLaZ1WyOY/BAfxIQu9MTiHqi+mYBxLAzi
 t63/RiaxBSuy8JLQPg1UaoeydkuLds4mT0srPrseZVQJlKmy7pg7wcxJWzBUg2Bs5oof
 DsmdagOCKVoErDqxrkzho7yBUzZJdbMTQ1CrgsJvk8GtEG4Z56WRxKvwKTTFzMUrOfMP
 DlmVdvcQIb/zaWQ+q/Xo6n8fEXmk++FbM3rUq4umQ5PVovxnbLmzG/U7RvxwtiGG4yvW
 mFmA==
X-Gm-Message-State: AOAM531NmZSoHfLfBOYXxkExwZnQmLu+l3upAT7elprRmE3yZQRmj/bI
 M4GZ/3P0BmqOXqmMjYHqKmFeAjrKf9zYpw==
X-Google-Smtp-Source: ABdhPJy3qxpBtoK00l6ykYnLzODQ/NGxvvidVPJ6XwV+/iYPx2BNgAnDWcMyO8iZU8EytNQgBh7J5Q==
X-Received: by 2002:a1c:c309:: with SMTP id t9mr20227233wmf.161.1621252590390; 
 Mon, 17 May 2021 04:56:30 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id b81sm15566809wmd.18.2021.05.17.04.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:56:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 12/15] sysemu/kvm: Make kvm_on_sigbus() /
 kvm_on_sigbus_vcpu() target agnostic
Date: Mon, 17 May 2021 13:55:22 +0200
Message-Id: <20210517115525.1088693-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517115525.1088693-1-f4bug@amsat.org>
References: <20210517115525.1088693-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

kvm_on_sigbus() and kvm_on_sigbus_vcpu() prototypes don't have
to be target specific. Remove this limitation to be able to build
softmmu/cpus.c once for all targets.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/kvm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index a1ab1ee12d3..d9bced5f392 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -234,6 +234,9 @@ int kvm_has_intx_set_mask(void);
 bool kvm_arm_supports_user_irq(void);
 
 
+int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
+int kvm_on_sigbus(int code, void *addr);
+
 #ifdef NEED_CPU_H
 #include "cpu.h"
 
@@ -246,9 +249,6 @@ int kvm_remove_breakpoint(CPUState *cpu, target_ulong addr,
 void kvm_remove_all_breakpoints(CPUState *cpu);
 int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap);
 
-int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
-int kvm_on_sigbus(int code, void *addr);
-
 /* internal API */
 
 int kvm_ioctl(KVMState *s, int type, ...);
-- 
2.26.3


