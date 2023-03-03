Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 551266A913E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 07:52:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXzGH-00030i-Ov; Fri, 03 Mar 2023 01:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pXzG2-0002zB-L5
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:51:10 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1pXzFx-0001yI-B4
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 01:51:10 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-17264e9b575so1970026fac.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 22:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677826263;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v/8ALTzo+k8lDhRcVb7aREd2mHeyN5nnrFITvBvvKR8=;
 b=ZiwFtaSO3tYNy+DaX5xH3xKRA5SUjRqtMGbE673US8rxenhHVtIUsLAS8GLC5anbaC
 1+Xf+WJow9/kk4Dm1Y5vEJ0hPyzkmx5yu9uEJxs6AQUFsgvy/ck3z/Qge8xEgZqYyWiA
 Z3p9Yt6cfx0fw/hviruvLdIfPBRAAujcnMyxA1pIUX3dv3wK1nWQSKCFlZ3iq9TbcsSl
 8JNxLDnBLC4hb1vFaUoN5jsPY8oe5pQu+mPrEOpN+CswsObcMMkSb0rKOETr7yzCc0cc
 PM7pO0oJUi5yBTM3gfvbg1uz6fsm49kaY1R0+aXdB7QBX53/3zXybdGnVhCCfc2mzFWB
 bMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677826263;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v/8ALTzo+k8lDhRcVb7aREd2mHeyN5nnrFITvBvvKR8=;
 b=u7l9Lv2DeYBg042yEFb+E0/FPnt5P4v9yaG7Y6kz7pRLSW1urc5N2d8X+0Kqj3P0Vt
 4yBm005jWcfvDo7PvFxTvVSqR4dQolaRP5UnhpBbNI43icgWEqOZ5sWyUPz49EG0O52n
 UWzLd587qF37S0NGtDczoRncMEP+1Ybr69yHJqDboJYsW99OSCWASieFR9BpeSQ2nNlQ
 KLP0Hdm3zNRAlndQGi6wdMiL9LK+5eQdnJjZKiX7qHIr5TU0oN/7FOdKyVdb6swPN8Xw
 aTvYhYm1NAeR2x7V7uR/ZwEO+7v8POP88PS0zh2/xqiFvmUxatcv7xUjD6eZduVTmlbe
 2U0Q==
X-Gm-Message-State: AO0yUKX8J/PJpyePknctiYCQ+99nV+1xZ2SQBNPlQkhquQ9n6uncgCxK
 xE6WitkKgXhrqdCHj5Hm4mnI44GrsSxS9oy4C+E=
X-Google-Smtp-Source: AK7set8t1DeQBAuQAQxFDACTQSK19KQllG+vOkuBgQgaDvkGg248Qoyhc+iSGNsd2ydvkXHtL6sZQA==
X-Received: by 2002:a05:6870:a687:b0:176:261c:d8a6 with SMTP id
 i7-20020a056870a68700b00176261cd8a6mr305509oam.6.1677826262981; 
 Thu, 02 Mar 2023 22:51:02 -0800 (PST)
Received: from mchitale-vm.. ([103.97.165.210])
 by smtp.googlemail.com with ESMTPSA id
 t4-20020a056870e74400b0017293fa734asm675414oak.48.2023.03.02.22.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 22:51:02 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	alistair.francis@wdc.com
Subject: [PATCH 0/2] Risc-V CPU state by hart ID
Date: Fri,  3 Mar 2023 12:20:53 +0530
Message-Id: <20230303065055.915652-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=mchitale@ventanamicro.com; helo=mail-oa1-x29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Currently a Risc-V platform cannot realizes multiple CPUs with non contiguous
hart IDs because the APLIC, IMSIC and ACLINT emulation code uses the
contiguous logical CPU ID to fetch per CPU state.

This patchset implements cpu_by_arch_id for Risc-V to get the CPU state
by hart ID which may be sparse instead of the contigous logical CPU id.

Mayuresh Chitale (2):
  target/riscv: cpu: Implement get_arch_id callback
  hw: intc: Use cpu_by_arch_id to fetch CPU state

 hw/intc/riscv_aclint.c | 16 ++++++++--------
 hw/intc/riscv_aplic.c  |  4 ++--
 hw/intc/riscv_imsic.c  |  6 +++---
 target/riscv/cpu.c     |  8 ++++++++
 4 files changed, 21 insertions(+), 13 deletions(-)

-- 
2.34.1


