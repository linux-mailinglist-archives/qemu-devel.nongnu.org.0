Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0032CB3F9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 05:45:51 +0100 (CET)
Received: from localhost ([::1]:34380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkK1V-0002JX-Ma
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 23:45:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3mxvHXwMKCvIjWWaiiafY.WigkYgo-XYpYfhihaho.ila@flex--pcc.bounces.google.com>)
 id 1kkJzz-00010i-Ld
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 23:44:15 -0500
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a]:42777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3mxvHXwMKCvIjWWaiiafY.WigkYgo-XYpYfhihaho.ila@flex--pcc.bounces.google.com>)
 id 1kkJzx-0003NW-GG
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 23:44:15 -0500
Received: by mail-qt1-x84a.google.com with SMTP id n12so384576qta.9
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 20:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=8ZWZxwgZnh+CVD/RIyNXpGFOI5LtCpzp62lZLAhve0I=;
 b=ePzs4tAzlpaiS+sx8manrQzjYPSrf83bU6Lv75pR4iH+LI+wQm48ywKIpu+ohd9RgM
 pBETyZ+LBP08sf0bDPwHByaGvnkY3zbu3KoSluTYk5hPPzkRxnNAFA8FMMG1iKUmsiXp
 6tMkFXUzpQ23bvFcBRPN/W4txe3bYCnlauaXc/tqCRbPHSLPfT2ZQ7FKi7h0spfrpexk
 upusB6LaVblPzfiNtEkdFaHwMyNuRAxAvcuZpQBWyXEJQ6tPKo5a9TEo92Q3uPNXcVnJ
 ZvxBuuJOoObqqr/7RLOFudFtvmVHnUlaGJuy/6RnYi70ac6SnNzieKe9Xv2gEp602OOf
 H2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=8ZWZxwgZnh+CVD/RIyNXpGFOI5LtCpzp62lZLAhve0I=;
 b=s2QgjOfoJnBjGMzLA4vA8jXnXaLFq+IpCPbB4G6PszzHK9UCZVsGGzOQrChcupVmUS
 +ky4oo39ElhfZsO/xVZYJWbNtMFox0+rU7c2xKlLQezWD/dq7Ec4tQNo18NCBO7MBssK
 VEyVLhDo9Dqn41GsH740YGlEBhEyGx7VU/BKfE/I4ILKO4PhbTvI12D69svTfVpQdBhk
 oC0v+R0QqnIXA9SJ2lOPlfzoIbmcB0VkJyBJwiIsnKc3G+R/eubXKdWzH/9C0ZmO0U+f
 WyeR622aaT4rxkQdX7KqKGR616GX98TeAgutL+9Kxb0mJMunXQGdnIp2xIGCRXxvFEJO
 lAag==
X-Gm-Message-State: AOAM532UL6on2LWUGAmxKogTSq4/Qy0AX8h1qOxEtwr+0YA4K8e1jPnP
 sDWbxOn9inh073hqCMUragaT7Bc=
X-Google-Smtp-Source: ABdhPJw+n9BblFNDqot6hJ0NtdwahFdpmoPGeIzoCe9M1ygXq0rPGTb8OfxwIh54GO8xmTPzLsCmGys=
X-Received: from pcc-desktop.svl.corp.google.com
 ([2620:15c:2ce:0:7220:84ff:fe09:385a])
 (user=pcc job=sendgmr) by 2002:ad4:4051:: with SMTP id
 r17mr862800qvp.39.1606884251305; 
 Tue, 01 Dec 2020 20:44:11 -0800 (PST)
Date: Tue,  1 Dec 2020 20:44:05 -0800
Message-Id: <27f51056925889c41b763b71c992f04d935157c4.1606884132.git.pcc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v3 1/3] Revert "hvf: Actually set SIG_IPI mask"
To: Alexander Graf <agraf@csgraf.de>
Cc: Frank Yang <lfy@google.com>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::84a;
 envelope-from=3mxvHXwMKCvIjWWaiiafY.WigkYgo-XYpYfhihaho.ila@flex--pcc.bounces.google.com;
 helo=mail-qt1-x84a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

From: Alexander Graf <agraf@csgraf.de>

This reverts commit 926a35700f0c14d6b95cbf8c3c3cce55ec7ffc3e.

You can just drop patch 3 of your v2 instead of taking this commit.
---
 accel/hvf/hvf-cpus.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
index 4360f64671..e613c22ad0 100644
--- a/accel/hvf/hvf-cpus.c
+++ b/accel/hvf/hvf-cpus.c
@@ -346,7 +346,6 @@ static int hvf_init_vcpu(CPUState *cpu)
 
     pthread_sigmask(SIG_BLOCK, NULL, &set);
     sigdelset(&set, SIG_IPI);
-    pthread_sigmask(SIG_SETMASK, &set, NULL);
 
 #ifdef __aarch64__
     r = hv_vcpu_create(&cpu->hvf->fd, (hv_vcpu_exit_t **)&cpu->hvf->exit, NULL);
-- 
2.29.2.454.gaff20da3a2-goog


