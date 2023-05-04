Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9AD6F7185
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:50:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoQ-00070c-Pi; Thu, 04 May 2023 13:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puZPk-0006tM-GC
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:54:33 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puZPh-0008ES-P0
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:54:32 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso4267345e9.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 06:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683208467; x=1685800467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kJXvwuqeYUhdNsXs8kDXA3l8KXIGDZkb55wmPsnlSxw=;
 b=xFxNJ8GXfIXoKqhixYiDXq6NMpDSW8q7ramR3ffchA0zy1gqwF9tA/YYaeCZ7hRlaj
 dlkXAqocH1IA+vYU3qDKSdC0+b/2Owt6u1GGIP3QfcXYt0WUHAmLsJl7fDa4jJqIZZXg
 bdY+ywTZqasjzUPb1TwKWLQbFRKwwedk33iMhitrySrSi33aed5Cgoq7EPCwOZxb1wu3
 5yR8OCRFcy26vpNNQPqomZyUb3O3k5EbBU0HX/vzS6d8hyIwuOXOiv4tOUHlr3fKecBr
 pNzRWZrfNnY6Y4u8wawLYyNp6KKhgP1kVAq4iJz0/m/POXWM8wDtA0WgL9ykDM9MjmAJ
 oVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683208467; x=1685800467;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kJXvwuqeYUhdNsXs8kDXA3l8KXIGDZkb55wmPsnlSxw=;
 b=Yd4kUt/E4ZZgN11HhtwgwkOvQrCEzzQnTODN/HaMQACqgmPGY7x2SyKwnbr6Zq/mIE
 IfmloBTN/DioPpm3wOTMvxYglvfCNfoOcaurk69vl3NwLKcf23d2cOCDi3lSfxeOymOZ
 hdAN0ls2vdY77Bmj3RU4ScEpf8wSumq6L1+KWtBVR2Wh5b3M/vIeHt+aEEtlm9gWKRPK
 F9/dps0m01hMnIZeg9nv5/0Iv4KIKVSbB64d2xgQIkQVM79BuEXCtmDTQuQ5ROyzDJIt
 nx/0Hxpgo/qtl/IEUocEkb7m3ojKyf5W8ITgVYhBoQ3rXsYj0r+EhTWFTLgH9OQPLA+S
 TQuw==
X-Gm-Message-State: AC+VfDyPTIZhfEPe9bp5FXa557/sKqyjFII70LXjOpJ9fOcW02hNeONJ
 vCfshRS9js7oIJh0AIyTSDsWag==
X-Google-Smtp-Source: ACHHUZ6QHv3pOZQg4DxIxlx3D+zwhhvZ3I5WfB1leCTR2pBM1MnlHXFMAtVgd82rp8UBcFxsD//Szw==
X-Received: by 2002:a05:600c:cd:b0:3ef:f26b:a187 with SMTP id
 u13-20020a05600c00cd00b003eff26ba187mr17184135wmm.0.1683208467059; 
 Thu, 04 May 2023 06:54:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c0b5600b003f40049a65bsm3800428wmr.21.2023.05.04.06.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 06:54:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 0/2] target/arm: Fix handling of VSTCR_EL2.SW and
 VTCR_EL2.NSW
Date: Thu,  4 May 2023 14:54:23 +0100
Message-Id: <20230504135425.2748672-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When FEAT_SEL2 (secure EL2) is implemented, the bits
VSTCR_EL2.SW and VTCR_EL2.NSW allow the guest to set things up
so that the stage 2 walk for an IPA is done to the other
address space, eg
 * a stage 2 walk for an NS IPA done to secure physical memory
   (where the translation table base address and other parameters
   for the walk come from the NS control registers VTTBR_EL2
   and VTCR_EL2)
 * a stage 2 walk for an S IPA done to non-secure physical memory
   (where the parameters from the walk come from the S control
   registers VSTTBR_EL2 and VSTCR_EL2)
We tried to implement this, but didn't get it right. In particular
the code is somewhat confused about whether it should handle
SW/NSW before doing a stage 2 walk (it does this for the s2
walk on the result of the s1 walk) or after doing a stage 2
walk (it does this for the s2 walks it does for s1 ptw loads).

Version 1 of this patchseries seemed to fix the reported bug,
but after more thought about this area of the code I think
it wasn't really completely addressing the issue. In particular
I suspect that in cases where we cache the result in an S2 TLB
we might not DTRT when we hit in the cache later.

So in v2 I've addressed the problem in a somewhat different way:

(1) when we call get_phys_addr_lpae() to do a stage 2 walk we
need to consistently get the ptw parameters right:
 * .in_ptw_idx should be ptw_idx_for_stage_2() of the .in_mmu_idx
   (where ptw_idx_for_stage_2() is a new function that determines
   whether we should be loading descriptors from S or NS, based
   on among other things the SW and NSW bits)
 * .in_secure should be true if .in_mmu_idx is Stage2_S

(2) S1_ptw_translate() should not do anything with the SW/NSW bits;
instead it just says "do an S2 walk" and trusts that the
(security state, address) tuple it effectively gets back from
that walk is the correct one.

This fixes https://gitlab.com/qemu-project/qemu/-/issues/1600 .

Changes v1->v2:
 * patch 1 is the same (and has been reviewed)
 * patch 2 is entirely different

Peter Maydell (2):
  target/arm: Don't allow stage 2 page table walks to downgrade to NS
  target/arm: Fix handling of SW and NSW bits for stage 2 walks

 target/arm/ptw.c | 81 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 54 insertions(+), 27 deletions(-)

-- 
2.34.1


