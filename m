Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7821A2CADF9
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 22:03:43 +0100 (CET)
Received: from localhost ([::1]:46636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkCoI-0002Ar-Ip
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 16:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3_K7GXwMKCnkmZZdlldib.Zljnbjr-absbiklkdkr.lod@flex--pcc.bounces.google.com>)
 id 1kkClY-0000Um-TC
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 16:00:54 -0500
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:54371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3_K7GXwMKCnkmZZdlldib.Zljnbjr-absbiklkdkr.lod@flex--pcc.bounces.google.com>)
 id 1kkClU-0005kM-Hp
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 16:00:52 -0500
Received: by mail-qk1-x749.google.com with SMTP id c71so2372089qkg.21
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 13:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=/AsPHkI1nK2kAOiaW/BPCtxION0eZEJ+bmePaRgEI40=;
 b=ONPsh6STyCuLqLb2X7Fhsp9AWaE1W7juNd0EQYNmHPh1t6voeWtBPX6XKpQr6gIU9W
 uwPguHPuIgwv/QBuIowtgZqwse6zzTBJqCvDTJYV5yRH3ecQHF+KZQavtVRmjTJspoin
 qVlRvq/QYZbWJ7ZkLpTL8RVYRBAh029VySbVp8O0LlPi/eDQxsxd/q1wY0gC+oAbqn6T
 tXm9vOf1kjiqJTIxScfEK4G4PbJvkz5dyzxjcGJ8VwKmDd8wLHErGP5ABs5Tx46/hSiP
 x4Xw6kdUoVxXiXgzSWlxlN7oD+ZJq+MgX0ZiBlBedL+8CRPTksX47/dXkiQyeaZxbzbF
 jmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=/AsPHkI1nK2kAOiaW/BPCtxION0eZEJ+bmePaRgEI40=;
 b=IwvDifb6K0d4B81vPiYsmOfpr9dOcRkWC4bzQ1QZ2hhBW6DETSRA0Q7i/v+HmJ+BSn
 uXOPkUckby0tU276MJ23XIbWghhUgeLBeIlir0mwDf24HFmQPb7NEOX8Dce2QiDyqia+
 wmh2jXBTPAq4YEIgDc2mRmYwkHlJyyd+OebTQpREueBndOpdPha7SALVytyRRSwvEfaO
 ssvxyQKdUSOz1LlFhtowtZ7lGp3ASqVuuu7BukCZPfR6GVvanKAs19eu22ioe9JnVbAk
 XjiQ1DDcLSWTDpJMEgaUknfviNvPn8dxRCO68bVytRPsMxBTJ0SVaF+rdLdujIrT/KU6
 RdBw==
X-Gm-Message-State: AOAM5336BQoB8Kxv1M4gXA8nx69Y8YyOLie13KocfhTuTOX3qs2DWyer
 3xKa9PoFKa7fYugaHpNS8fsY2/k=
X-Google-Smtp-Source: ABdhPJxg2McKnijC+pLRmZrLUSEUsys613imWCYRmIXKSPTvfLlz5uWLw/fKWBGdigTkY1HAHWUSgWo=
X-Received: from pcc-desktop.svl.corp.google.com
 ([2620:15c:2ce:0:7220:84ff:fe09:385a])
 (user=pcc job=sendgmr) by 2002:a0c:8b99:: with SMTP id
 r25mr4970479qva.0.1606856444892; 
 Tue, 01 Dec 2020 13:00:44 -0800 (PST)
Date: Tue,  1 Dec 2020 13:00:37 -0800
In-Reply-To: <4a2d15d01087207e2fba1f55ad312727dbfc782e.1606856104.git.pcc@google.com>
Message-Id: <d91deec6e2c68a9cf0e911251992b4d845be14ab.1606856104.git.pcc@google.com>
Mime-Version: 1.0
References: <4a2d15d01087207e2fba1f55ad312727dbfc782e.1606856104.git.pcc@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v2 2/2] arm/hvf: Stop setting current_cpu
To: Alexander Graf <agraf@csgraf.de>
Cc: Peter Collingbourne <pcc@google.com>, Frank Yang <lfy@google.com>, 
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 qemu-arm@nongnu.org, 
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=3_K7GXwMKCnkmZZdlldib.Zljnbjr-absbiklkdkr.lod@flex--pcc.bounces.google.com;
 helo=mail-qk1-x749.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Peter Collingbourne <pcc@google.com>
From: Peter Collingbourne via <qemu-devel@nongnu.org>

This variable is already being set by the generic HVF code and it's a
thread-local variable so I don't see how it can be overwritten.

Signed-off-by: Peter Collingbourne <pcc@google.com>
---
 target/arm/hvf/hvf.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 3321d48aa2..40984fcf4d 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -364,7 +364,6 @@ int hvf_vcpu_exec(CPUState *cpu)
     do {
         bool advance_pc = false;
 
-        current_cpu = cpu;
         qemu_wait_io_event_common(cpu);
 
         flush_cpu_state(cpu);
@@ -391,7 +390,6 @@ int hvf_vcpu_exec(CPUState *cpu)
             /* This is the main one, handle below. */
             break;
         case HV_EXIT_REASON_VTIMER_ACTIVATED:
-            current_cpu = cpu;
             qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
             continue;
         case HV_EXIT_REASON_CANCELED:
@@ -412,8 +410,6 @@ int hvf_vcpu_exec(CPUState *cpu)
             uint32_t srt = (syndrome >> 16) & 0x1f;
             uint64_t val = 0;
 
-            current_cpu = cpu;
-
             DPRINTF("data abort: [pc=0x%llx va=0x%016llx pa=0x%016llx isv=%x "
                     "iswrite=%x s1ptw=%x len=%d srt=%d]\n",
                     env->pc, hvf_exit->exception.virtual_address,
@@ -523,7 +519,6 @@ int hvf_vcpu_exec(CPUState *cpu)
             break;
         case EC_AA64_HVC:
             cpu_synchronize_state(cpu);
-            current_cpu = cpu;
             if (arm_is_psci_call(arm_cpu, EXCP_HVC)) {
                 arm_handle_psci_call(arm_cpu);
             } else {
@@ -533,7 +528,6 @@ int hvf_vcpu_exec(CPUState *cpu)
             break;
         case EC_AA64_SMC:
             cpu_synchronize_state(cpu);
-            current_cpu = cpu;
             if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
                 arm_handle_psci_call(arm_cpu);
             } else {
@@ -561,7 +555,5 @@ int hvf_vcpu_exec(CPUState *cpu)
         }
     } while (ret == 0);
 
-    current_cpu = cpu;
-
     return ret;
 }
-- 
2.29.2.454.gaff20da3a2-goog


