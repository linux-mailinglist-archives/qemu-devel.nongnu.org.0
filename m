Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E761E39921F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 20:03:06 +0200 (CEST)
Received: from localhost ([::1]:44404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loVCr-0002X8-Tn
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 14:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loVAd-00080u-Nn
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:00:50 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:45838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1loVAb-0006Ys-G3
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 14:00:47 -0400
Received: by mail-qk1-x729.google.com with SMTP id 65so1847107qkg.12
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 11:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hcyiBf8XfHh0i4I/xbtkt9H+h3lN5tBA1kWR+3EzbeI=;
 b=UXGXjZEb+s2GNCC5rGd71UTTuHj2MjvpZe/6mQ+PosVgExCqKqAkDm8obmkp4sr1fo
 gyTyEFE9caE7/ojGDNFcvNjEoN1/QTUBf/Kn/p11M+MIHknVOmt7tmgA5KNrSbFIpaZa
 K9OKLRytv+tJGKYlpCYdcj9X6riLl2DAmyD9Y4slOPUO7LAxpqBbjpQ9BVU9QuMktC7Z
 BnbnjOHlJ5jNprq90YJjL1GYy4BTL0Ctvb5KAgPSZIT1c6ox7GE5Rhe2QBPLFX/GJMOV
 UBo5kXKoHEq9okxumcY3yRkjaqCNFoP00wHdjNINa3F0ExtvFElp7rm0I/t8/QEiLcab
 1KpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hcyiBf8XfHh0i4I/xbtkt9H+h3lN5tBA1kWR+3EzbeI=;
 b=XblKl+a+YbWdPLz2FNbTiAHt//qFhj0PjrhBy1GHKYq4r3TMqI/9JZaUCgyAFUXUXv
 p6d7Zd06/YKwZEotBG+m1YBdASe394fS05aWP/2IVVHnlfQ15Qd3m88HLndoet0y3wcX
 cj+Z6h2gP2P72+rasIyHjABuR0kioCDKm8Berhj1i4N27njcGvuxwW4yGnklAuN4nOMh
 NYkZykuaLC/1OZLNna2EJ696Zlb3HfdThPqTv91Y58ZNa+/IKIFtzZmNQ2ILVRUTJjsw
 b5TuLyV18VVgpPYgdJPqMcF9Tzca8v1o7FD4tw9ld/hLgbYfxp4j4rvQ/T/ndKss7klI
 NjKg==
X-Gm-Message-State: AOAM53367U0sXGyTnLIFE1TIep2HCecPg0GYcpu/Bwct+IEBEuvIwXsc
 J9bVXgFW29EOs3FVZN4diGlmJg==
X-Google-Smtp-Source: ABdhPJwbvP52YTpAqdlyUWonFweBWum48EVLc0AUFlqM/c/KrACcPiVp/EzXR77uOkvxHGmAY+/zGg==
X-Received: by 2002:a37:b6c1:: with SMTP id
 g184mr28341986qkf.270.1622656844104; 
 Wed, 02 Jun 2021 11:00:44 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-stsvon1503w-grc-21-142-114-142-78.dsl.bell.ca. [142.114.142.78])
 by smtp.googlemail.com with ESMTPSA id 97sm273044qte.20.2021.06.02.11.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:00:43 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v4 0/8] GICv3 LPI and ITS feature implementation
Date: Wed,  2 Jun 2021 14:00:34 -0400
Message-Id: <20210602180042.111347-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x729.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset implements qemu device model for enabling physical
LPI support and ITS functionality in GIC as per GICv3 specification.
Both flat table and 2 level tables are implemented.The ITS commands
for adding/deleting ITS table entries,trigerring LPI interrupts are
implemented.Translated LPI interrupt ids are processed by redistributor
to determine priority and set pending state appropriately before
forwarding the same to cpu interface.
The ITS feature support has been added to sbsa-ref platform as well as
virt platform,wherein the emulated functionality co-exists with kvm
kernel functionality.

Changes in v4:
 - review comments addressed
 - redesigned the lpi pending priority determination logic to scan
   LPI pending table and config table right after lpi pending
   statechanges(SET/RESET) through gicv3_redist_update_lpi() call to
   determinethe highest priority lpi among the active lpis and save
   the details.The high priority interrupt determination logic in
   redistributor now usesthe saved high priority lpi details
   (alongside other interrupt types) instead of calling
   gicv3_redist_update_lpi() everytime(as in v3).This
   significantly reduces the call overhead associated with
   address_space_read of lpi config and pending tables.
   Testing with this new design showed no boot delays.
 - profiled execution of gicv3_redist_update_lpi() using perf and
   framegraph to confirm execution is within normal limits.
   Also,specifically measured execution time to be an average of 175us
   with linux distro testing.
 - All kvm_unit_tests PASS

Shashi Mallela (8):
  hw/intc: GICv3 ITS initial framework
  hw/intc: GICv3 ITS register definitions added
  hw/intc: GICv3 ITS command queue framework
  hw/intc: GICv3 ITS Command processing
  hw/intc: GICv3 ITS Feature enablement
  hw/intc: GICv3 redistributor ITS processing
  hw/arm/sbsa-ref: add ITS support in SBSA GIC
  hw/arm/virt: add ITS support in virt GIC

 hw/arm/sbsa-ref.c                      |   26 +-
 hw/arm/virt.c                          |   27 +-
 hw/intc/arm_gicv3.c                    |    9 +
 hw/intc/arm_gicv3_common.c             |   13 +
 hw/intc/arm_gicv3_cpuif.c              |    7 +-
 hw/intc/arm_gicv3_dist.c               |    7 +-
 hw/intc/arm_gicv3_its.c                | 1217 ++++++++++++++++++++++++
 hw/intc/arm_gicv3_its_common.c         |    8 +-
 hw/intc/arm_gicv3_its_kvm.c            |    2 +-
 hw/intc/arm_gicv3_redist.c             |  159 +++-
 hw/intc/gicv3_internal.h               |  186 +++-
 hw/intc/meson.build                    |    1 +
 include/hw/arm/virt.h                  |    2 +
 include/hw/intc/arm_gicv3_common.h     |   16 +
 include/hw/intc/arm_gicv3_its_common.h |   39 +-
 target/arm/kvm_arm.h                   |    4 +-
 16 files changed, 1694 insertions(+), 29 deletions(-)
 create mode 100644 hw/intc/arm_gicv3_its.c

-- 
2.27.0


