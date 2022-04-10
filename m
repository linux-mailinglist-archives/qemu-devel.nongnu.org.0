Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2F34FAC32
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 08:01:11 +0200 (CEST)
Received: from localhost ([::1]:42338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndQdK-0004KQ-4d
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 02:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZm-0001wb-Gx
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 01:57:30 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:39682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZk-0002yk-Nd
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 01:57:30 -0400
Received: by mail-pf1-x431.google.com with SMTP id s2so11917516pfh.6
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 22:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RK33w4bBkbB55yTPjhSGKaku/jJtbjUTjhLESjsVVvc=;
 b=vrCetKzPfoqDZOD1Pr1GX8hVzRoe5ejmplKOo/ktOEkmsnMHwcT7G/YL7vdkOz4zqt
 yqACPpJA22xmyZgwd6SBZTCU6mhopS8AoJllzf4trSFAu1XOAEs+Saij8xu5jhpp/+YG
 wS41LtBv1C8sI7PBbgHrxv61g4I1mRbq1N7jDTdReviXozm+R2tTBsKbWxVcuuhokQ0z
 ahYAR19abx8vP9TxWcLXvil4Al86F87LkATkd69uY/97YwAPGd06fXVCYzndoHiqyWhG
 UPnCzPvgzVSK6IYVkwR9CS64pEs1xxnBt1J/CLvW0Y4pxjL2Qa3f/4o33vF3hXkom7Tt
 oxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RK33w4bBkbB55yTPjhSGKaku/jJtbjUTjhLESjsVVvc=;
 b=cB0Afb5Xy/woc2CMnDjDbVxFJqjTB1xO/KtYUcMZUyLkpDVk78IAFara0COFmxICns
 k3E/oV1UOfG+7lc/8u4rpez+31CDQi2epQd/23ZbI26SRnh/+6b+52tZShucSy5kvnFn
 xX7zCpHQ5KE3YtJgVvlkpzNW/sFGRi0DAQ0BtUBmXAOR6LcamyMPk3h3UMTommMhF89I
 beYbyCG2kCAZJIHkDT5ZeGChM2V+jLaSDeaiFN3254EdlzmPKeAK2kLYMp+BWff0eG0/
 kNVobSUPz0Rw0drEOuTJleVGdePVLqDPpFtAmnriu1PijV1oDL8GlOMQ6fKVBmhxctDq
 PUOQ==
X-Gm-Message-State: AOAM532vJyAx6HtS3wgP5BsUrNNrB0oG+1wdkCDU/MKAphpZH0AzE+zU
 I3tSjOBh+LBMwue+leCq6x2TO1WaJWKtww==
X-Google-Smtp-Source: ABdhPJyJHYAv/mFCotHqLY9kseWUvsqF3b3Hq25jKWBtorSF5Q4Ts4Nha88PCdDPud25yyweuDet3g==
X-Received: by 2002:a63:1c22:0:b0:385:fcae:cb3f with SMTP id
 c34-20020a631c22000000b00385fcaecb3fmr22080364pgc.102.1649570246899; 
 Sat, 09 Apr 2022 22:57:26 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm30481862pfu.150.2022.04.09.22.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 22:57:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] target/arm: More trivial features, A76, N1
Date: Sat,  9 Apr 2022 22:57:18 -0700
Message-Id: <20220410055725.380246-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20220409000742.293691-1-richard.henderson@linaro.org
("target/arm: Implement features Debugv8p4, RAS, IESB")

3 more completely trivial features, and a 4th that merely
needs to add some state words.

Add definitions for cortex-a76 (also requires gicv4) and
neoverse-n1 (also requires gicv4.1), but we now have all
of the in-cpu features implemented.


r~


Richard Henderson (7):
  target/arm: Enable FEAT_CSV2 for -cpu max
  target/arm: Update ISAR fields for ARMv8.8
  target/arm: Enable FEAT_CSV2_2 for -cpu max
  target/arm: Enable FEAT_CSV3 for -cpu max
  target/arm: Enable FEAT_DGH for -cpu max
  target/arm: Define cortex-a76
  target/arm: Define neoverse-n1

 target/arm/cpu.h           |  39 +++++++++++
 hw/arm/sbsa-ref.c          |   2 +
 hw/arm/virt.c              |   2 +
 target/arm/cpu64.c         | 131 +++++++++++++++++++++++++++++++++++++
 target/arm/cpu_tcg.c       |   2 +
 target/arm/helper.c        |  70 +++++++++++++++++++-
 target/arm/translate-a64.c |   1 +
 7 files changed, 246 insertions(+), 1 deletion(-)

-- 
2.25.1


