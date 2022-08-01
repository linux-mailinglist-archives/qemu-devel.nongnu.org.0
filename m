Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DB5586DEF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 17:41:33 +0200 (CEST)
Received: from localhost ([::1]:56734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIXXw-0001Oq-PS
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 11:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIXSm-0005L0-El
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:36:13 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oIXSk-0006gl-Pe
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 11:36:12 -0400
Received: by mail-wm1-x32b.google.com with SMTP id id17so5973702wmb.1
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 08:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc;
 bh=TSR13WHNadgBHIk3lTOXCOUJpI2izIVNEk7YTDuvsXs=;
 b=b9DOyndfX2UEWQXToY/m1lMtfbBMShiPrjVkI+7x1raBDzR2qX1OnF9YFzZLA0Ndn+
 OIR9cKEo8W9O7+zW1pK2wNNXWakDr+Gesh21MwPqo14QJvRQ4+tzVFNM/D2W+jE5uTMn
 cwaGVbLFOv7ixjgHYuKSvZV3LLYG0GqxeLj0oqtydKE16HRsMxYR5OH1PeSgO1muugQS
 90Sa9F6D+cxztlVM11vOkdRVO3t2XzcFTUqE8D8zyI+2+7DOrK3tkgEaXzxYSHA1HC4D
 YppuXiJj0ldop8s26mozpJe4htSJJbKHGINv6U6ph9V3SAIqZD9Ci/PuNeqGua38L3Kw
 Iu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc;
 bh=TSR13WHNadgBHIk3lTOXCOUJpI2izIVNEk7YTDuvsXs=;
 b=ahjK9CVX8bNa7Mgy0LsLYCaKnVhociDYJZ3Oz7cVKVC7bRjtO4VUoNdOfZ+wOzSxfK
 9bQusihf9TA+9Sj665BrGhcbjJjX33Xi53GGASSfn3Wm7mOEea3TVWni3Yjq5ihw0rvY
 pIsuVb7GMho84uiGo4S8VDqfFhtqzzw31kQbD+wjBKf9UuqEe77esX5Vr0KtAqO71sTn
 2UdwbtpTpjjjTl1R0BrCuxIL0Usg5aM2YCOOCsZsf6PynN4ko+iKE7KPBiXf9+9NbacK
 Kk0sCJb+MfQWbKi0Q1+evE/fHM7Vw1u2glk9ZY41qqEbVFJIrOekHYN76HKOY2bpSzCz
 kvpw==
X-Gm-Message-State: ACgBeo3SQugQzQi/P3QtKYtrtT0MGRVe7MbT4U88plA5dmJ653kz1GnT
 ORSUmp69HuG2Fo39JIYxbbz75ff1swcAag==
X-Google-Smtp-Source: AA6agR5hzauzq1yMO9DDOHcbQCOSInJwLmHUngsAj8WhLXHX4nCF5XAyLpqefbAc/851f5ywCMYppQ==
X-Received: by 2002:a05:600c:2199:b0:3a4:bfea:b238 with SMTP id
 e25-20020a05600c219900b003a4bfeab238mr6861501wme.9.1659368168481; 
 Mon, 01 Aug 2022 08:36:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d4bd0000000b0022059422255sm7109295wrt.69.2022.08.01.08.36.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 08:36:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] target-arm queue
Date: Mon,  1 Aug 2022 16:36:02 +0100
Message-Id: <20220801153605.3051778-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Only thing for Arm for rc1 is RTH's fix for the KVM SVE probe code.

-- PMM

The following changes since commit 4e06b3fc1b5e1ec03f22190eabe56891dc9c2236:

  Merge tag 'pull-hex-20220731' of https://github.com/quic/qemu into staging (2022-07-31 21:38:54 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220801

for you to fetch changes up to 5265d24c981dfdda8d29b44f7e84a514da75eedc:

  target/arm: Move sve probe inside kvm >= 4.15 branch (2022-08-01 16:21:18 +0100)

----------------------------------------------------------------
target-arm queue:
 * Fix KVM SVE ID register probe code

----------------------------------------------------------------
Richard Henderson (3):
      target/arm: Use kvm_arm_sve_supported in kvm_arm_get_host_cpu_features
      target/arm: Set KVM_ARM_VCPU_SVE while probing the host
      target/arm: Move sve probe inside kvm >= 4.15 branch

 target/arm/kvm64.c | 45 ++++++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

