Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3023DA35C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:49:29 +0200 (CEST)
Received: from localhost ([::1]:33102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95Tc-0006Qn-3g
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m95Rb-0003cH-VX
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:47:23 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:36762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m95Ra-0007ZE-It
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:47:23 -0400
Received: by mail-ed1-x52b.google.com with SMTP id b7so8070958edu.3
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 05:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NQTJTVGWD0gMMK6Mr7hopAaxEGk+XTCb5RPoB6Pqwy8=;
 b=lhb0mqLoMc9I6+Vx9Rh/2fUjrUOKRBBFaRZdXEIPWRb+a5sAiXGdf+zr1sDBL+I329
 IcSClWBGD7VVCdYeD5ST52fB2Lehq/r4XXQTUY0oKF/Jx0nOpBX4BqU2tnzgShbT4tVt
 mBzqruWjPpsSbCCNd4g5BE+yW+w0s25mMoVXnoiVqhkD48NBmTkuQYsZigeUKJF8Wi1w
 F6bKnVnsOOqZiF7dyni0tw++4MV+75YEovmggnuOhw+2UDWDsCq2CzCtCKmKxThwdySB
 dv/TEXP0xxWZBo37HxrpfimFiqIL4WZII8Dm5nMuP3V6JBhJUl/TdxL9B/OTMBrBmzjj
 FqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NQTJTVGWD0gMMK6Mr7hopAaxEGk+XTCb5RPoB6Pqwy8=;
 b=OGV+m9abSGK35lfb/E6Kt1D5X4eHpJYT5L00hko384Pw6V3BjLDEpUUBWGHL/PEJHP
 9GWqmwWWW6w8V3bWZ1BDQosp2ntFHjEr3mGDSL+q91H+LeflJUS9evDsoQmqXiYyxA9D
 M/xrnuNjhVl9aiPn2fDEzntuHc584w/NishbfTdn6A5Z8E2VsbAJo9xc+jCAf+j2ziXO
 xehcV7gwdELD0hz7Ixz/KB01eoxS/1HlsdULyH/WYK2ibqXS1IZDmiGYro0TyZfBnh6y
 cw0C2YBYnJsd9EIume5yk8N1QLf0dP76ZrHr9YGcRkkGZwWrJU/VciPYnk/Y6+WpB1a+
 aihg==
X-Gm-Message-State: AOAM533VJh6U1FXnahnpDOt+apHgQAS+4y0R7Ssemm5SmRTu676w3/5C
 jnBuV4828xP+UHiLRPOrCUxKSjT4iC3BtA==
X-Google-Smtp-Source: ABdhPJw56k+3Ncc8hNRb0TgOKbV56tSsulqf29ARr3kUb6Uq0Xt3GduIYwhxap1xFG3Okw19LWCBfA==
X-Received: by 2002:a05:6402:3192:: with SMTP id
 di18mr5950586edb.186.1627562841389; 
 Thu, 29 Jul 2021 05:47:21 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id m12sm954659ejd.21.2021.07.29.05.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 05:47:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] target/i386: fix typo in ctl_has_irq
Date: Thu, 29 Jul 2021 14:47:11 +0200
Message-Id: <20210729124713.208422-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729124713.208422-1-pbonzini@redhat.com>
References: <20210729124713.208422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Lara Lazier <laramglazier@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The shift constant was incorrect, causing int_prio to always be zero.

Signed-off-by: Lara Lazier <laramglazier@gmail.com>
[Rewritten commit message since v1 had already been included. - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/svm_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/tcg/sysemu/svm_helper.c b/target/i386/tcg/sysemu/svm_helper.c
index 90a9de30f8..e151104b4e 100644
--- a/target/i386/tcg/sysemu/svm_helper.c
+++ b/target/i386/tcg/sysemu/svm_helper.c
@@ -70,7 +70,7 @@ static inline bool ctl_has_irq(uint32_t int_ctl)
     uint32_t int_prio;
     uint32_t tpr;
 
-    int_prio = (int_ctl & V_INTR_PRIO_MASK) >> V_INTR_MASKING_SHIFT;
+    int_prio = (int_ctl & V_INTR_PRIO_MASK) >> V_INTR_PRIO_SHIFT;
     tpr = int_ctl & V_TPR_MASK;
     return (int_ctl & V_IRQ_MASK) && (int_prio >= tpr);
 }
-- 
2.31.1



