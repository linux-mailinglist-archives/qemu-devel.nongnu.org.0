Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609344AB686
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 09:28:14 +0100 (CET)
Received: from localhost ([::1]:32794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGzNd-0003wX-Ez
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 03:28:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyrb-0005px-3Y
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:55:13 -0500
Received: from [2a00:1450:4864:20::335] (port=43762
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyrW-0001ts-ME
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:55:04 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 k6-20020a05600c1c8600b003524656034cso7967427wms.2
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7MoSojEUgabMe70P0YfFDC0TBg79+bokVHqZka7FxI8=;
 b=FwmDpjzVhuaeimES/TC7VbCOfENZ7A2FDPjw/utyeX3OLN6kixOYzuyX0oTK+NXN8/
 Pdn6dUdWHFvIp48RL5eH8Fhlo21v/8bzaT5zJ+RBnt9efoSNIPs8fI8nUfA0aasH7RQE
 NAT23bBeUN5I4Nl1dDP8hraUox63I6SidkDHcOuybmn5XobcRyfCPC70fi3JQ0wnwWR7
 DQN6QUtuTgtq7DwMOzAaMlmICox2g/WFQmSFrjtnh6TkPBInqVDDq67xDUeJzcc7GyST
 wKFWYMutBcPitDAPyYx3fA11jU60yOMFDlRC1MBRNJgkJN7VYi77iuURAvDlRCwD7Ihs
 eQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7MoSojEUgabMe70P0YfFDC0TBg79+bokVHqZka7FxI8=;
 b=xvG1xXiYKNKtD68EYKJ0pYuC5HI9J1BAiqKDe+zLEhKLIfQbw+MoaM+h9PSv48KC1p
 QzTe4sKidsm993xlbJscJwoSMC6UoIG0N8dEwtEE1f0AfFEAAp0pWwqKoy4MaoXFIuc5
 XdVzYp2btZFbB4NxBsI2cvSwIMixcunHfrZigIOH5Z8iIzPbT9OSOWHwr7+g5N7vdGIl
 elWeKt8Z74n8SMjpGwtM6VDg4+fcZEZQA2YV8VlTc+ekJolZGLkNiSWSRaJhoxFwSoOB
 +T3D191ldC5CAVyyGUkoDwV0cX4WOwqnNoQ+UyGhqdDYvInv5FHilfSS2gZ01UT2CoAn
 AoiA==
X-Gm-Message-State: AOAM530eshcSVBGi4qzAHNIyvuPNu8zb/hMZI68K5XzGjNvaVX2t89c8
 Iebd1hYve6MFleJcgPOU8c6x9+XHjDE=
X-Google-Smtp-Source: ABdhPJyfTptYRu8QqE7mAgQFJqbaQSAiN5rLGPrh8cDdeSrYQMXnzhQWJO+u60uhMPFWkTh4FiALbg==
X-Received: by 2002:a05:600c:1e84:: with SMTP id
 be4mr9749560wmb.147.1644220495570; 
 Sun, 06 Feb 2022 23:54:55 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id w8sm9322981wre.83.2022.02.06.23.54.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:54:55 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 06/21] sysemu/kvm: Make kvm_on_sigbus() /
 kvm_on_sigbus_vcpu() target agnostic
Date: Mon,  7 Feb 2022 08:54:11 +0100
Message-Id: <20220207075426.81934-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

kvm_on_sigbus() and kvm_on_sigbus_vcpu() prototypes don't have
to be target specific. Remove this limitation to be able to build
softmmu/cpus.c once for all targets.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/sysemu/kvm.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 6eb39a088b..a5bec96fb0 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -249,6 +249,9 @@ int kvm_has_intx_set_mask(void);
 bool kvm_arm_supports_user_irq(void);
 
 
+int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
+int kvm_on_sigbus(int code, void *addr);
+
 #ifdef NEED_CPU_H
 #include "cpu.h"
 
@@ -261,9 +264,6 @@ int kvm_remove_breakpoint(CPUState *cpu, target_ulong addr,
 void kvm_remove_all_breakpoints(CPUState *cpu);
 int kvm_update_guest_debug(CPUState *cpu, unsigned long reinject_trap);
 
-int kvm_on_sigbus_vcpu(CPUState *cpu, int code, void *addr);
-int kvm_on_sigbus(int code, void *addr);
-
 /* internal API */
 
 int kvm_ioctl(KVMState *s, int type, ...);
-- 
2.34.1


