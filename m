Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74B639080C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 19:44:24 +0200 (CEST)
Received: from localhost ([::1]:46136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llb6M-0001di-Pa
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 13:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llb4f-0007qB-HA
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:42:37 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1llb4d-0004Vz-Sh
 for qemu-devel@nongnu.org; Tue, 25 May 2021 13:42:37 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 z19-20020a7bc7d30000b029017521c1fb75so3984865wmk.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 10:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xRd9XsO+PDr6n4FeCOKrjoZ73C+wdSaKiGHr6cRSi/o=;
 b=lcuvChzJ8BN2TYlPcmvvAZ5Q1xMlrBmS6r7ceo1rAACSz8yGjYpW+/iucHYFCQ0Wtd
 6w0DRSeHgsM28X67c9WCerAUnRIiXLyA0Wi7Ni8yoZc7SJ+HtTx2oio0cOFQA6fzRa0B
 ApTF3w5tVirxlb7+AohSilHxlzQwyDv+MexiO+tDQGOcseSL09qetYIZS4pPRsmYGJMm
 N5WHGRY+kRtvDtApIvxHS0tn8Y8N1Rvc7YA4CWBuWvPEH4ctTCXt22B3tF8ft69JgPiI
 IgfwpdhDSf+t6Ai7635kgD4PE1ZBCb9vdU/puofaNvmoQaBY2eDAKLfR7qPbp9lMt0pH
 BmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xRd9XsO+PDr6n4FeCOKrjoZ73C+wdSaKiGHr6cRSi/o=;
 b=BomU84pyoVB6reY5/y1pvegCB7Ntab6M8gICOnPg9cfz9MRaBKNhvUSXCDgn/07Co7
 b2mhGhRsqVr/dCGsUcj+ZTFPFIRSiwy6G9Y/nSzIE4lFfINv/yfRPWhMC/Yx7tIKWqla
 rEyCJCZd87iiFS2hsidooilfplIlW8ZVGlWd0GQdFfjP/Kf7QJxXlg9qh5fdZYM6kaHs
 cbczbm4nwBYOcXYkE9LW3QH3WvNTSMLDDYXWDOgwQNwlgJI4nSgWISsRtHv1nEpaBjvZ
 yrRHczYWYkQ9h5spHg87m0apqUdSOUaPmWBgth18iwPFxl2SQ2ia3faGUOBSyTrEVUKJ
 Hp/g==
X-Gm-Message-State: AOAM530t7/S0VEVEG8jC3koNPRRvRMzPIBx/mluM4C0654NSuLYztJs/
 Er7wSuVIa9JPXNmCZFt4WSAKNg==
X-Google-Smtp-Source: ABdhPJxaqQHNaLKGr4fuwt/Q7tHiqBlX9WrKJ8ZFkr85g6fKVEx9BNsMXajWfHgn+YRz4uEKvCtTeg==
X-Received: by 2002:a1c:b646:: with SMTP id g67mr24639077wmf.117.1621964554306; 
 Tue, 25 May 2021 10:42:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d3sm16788921wrs.41.2021.05.25.10.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 10:42:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C4ADF1FF7E;
 Tue, 25 May 2021 18:42:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.cs.columbia.edu, christoffer.dall@arm.com, maz@kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [kvm-unit-tests RFC PATCH] arm64: split pmu tests into tcg/kvm
 variants
Date: Tue, 25 May 2021 18:42:21 +0100
Message-Id: <20210525174221.16987-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU is able to give a counter for instructions retired under TCG but
you need to enable -icount for it to work. Split the tests into
kvm/tcg variants to support this.

[AJB: I wonder if the solution is to have a totally separate
unittests.cfg for TCG mode here?]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 arm/unittests.cfg | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index adc1bbf..2c4cf41 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -66,24 +66,40 @@ file = pmu.flat
 groups = pmu
 extra_params = -append 'cycle-counter 0'
 
-[pmu-event-introspection]
+[pmu-event-introspection-kvm]
 file = pmu.flat
 groups = pmu
 arch = arm64
+accel = kvm
 extra_params = -append 'pmu-event-introspection'
 
+[pmu-event-introspection-tcg]
+file = pmu.flat
+groups = pmu
+arch = arm64
+accel = tcg
+extra_params = -append 'pmu-event-introspection' -icount shift=1
+
 [pmu-event-counter-config]
 file = pmu.flat
 groups = pmu
 arch = arm64
 extra_params = -append 'pmu-event-counter-config'
 
-[pmu-basic-event-count]
+[pmu-basic-event-count-kvm]
 file = pmu.flat
 groups = pmu
 arch = arm64
+accel = kvm
 extra_params = -append 'pmu-basic-event-count'
 
+[pmu-basic-event-count-tcg]
+file = pmu.flat
+groups = pmu
+arch = arm64
+accel = tcg
+extra_params = -append 'pmu-basic-event-count' -icount shift=1
+
 [pmu-mem-access]
 file = pmu.flat
 groups = pmu
-- 
2.20.1


