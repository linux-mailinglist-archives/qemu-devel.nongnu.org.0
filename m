Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F34630D2B2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 05:59:58 +0100 (CET)
Received: from localhost ([::1]:39338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7AGj-0002Ai-6T
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 23:59:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l7AFD-0000zN-8k
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 23:58:23 -0500
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:41725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l7AFB-0007xr-Df
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 23:58:23 -0500
Received: by mail-io1-xd33.google.com with SMTP id e133so13055626iof.8
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 20:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bkTOYIo/zKoe6N77QFFqzBtr4gtRtR+NICyH5QAOnpo=;
 b=bZWNpeCf5wgeEut3+iLVZAMjP/raaecbmdd/Kew9TVFaDV61Gsd6kN6Q3OqK8L6yHk
 hsuSSWIGWK37ekd6/H4lYar2kCMhZMELZuHGkBfEBSMYGDT9ltq3hhgu69hZ8MqeFONo
 1UCE6q60F5fQ2BKGAJcbgOiM3o/pxpwhNzstWlnKEQFgsk/vFYhdaN4bqfvOAlg78GzY
 oZZgnEDd9A/u6CngQ0yYMbeNDIKWZKyc8tpxYTOCXLXwSfrvr0kAJKhU7AEOIQ041ITT
 A587eo0+c1IX3iLqNtZk9Rzn/iVlQ9C4RU3utu8J8OCdFDw9rkTGChgRPF6wkOWrAtrQ
 wbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bkTOYIo/zKoe6N77QFFqzBtr4gtRtR+NICyH5QAOnpo=;
 b=Qd6lP7tYYzmmLmFBC1gd4CM/JanKRVrPLIO8xbKxEKPgDM0QFQdQLRD+zYEz4hlih6
 gMA3BAhTcySUZhRj2AWUWG7cult62JYyk/Ar3DpskH4Xn8f46DO1fNPdjdLjNPcSHxqP
 AFQESxwu2LKH577UiE16wFW3NSItgXV43LvlM61wPWhDf5vOapc3tJKn2GHKLN/KaUED
 hv72u2sNTs4OBCDdhef/6a2XBibFjvGKDT+h7jbdURtukSXkcrA7+d+75wEyY/ksImDJ
 nIczH/cxGkoIU4HkJJ64E48Lk9Vvmi+BXjMS/8M4Bmlel/QoGVGYIKZ9eR5Djvu2gjHa
 KH9Q==
X-Gm-Message-State: AOAM533Ri/yMiYogehSlPz9J1VNeZ0bZCCwSuqEKBlNICW856H4kegzS
 4OJEN8AW6b0j4XedWLIDpZ8vsEole7iTmE4KVF48vgzorFmHTfCPOGHzh+O9ODPpPcNGS7m0QvD
 yI0+Dl8OAjYVWn7EVjKA29OaXwsxGPTMpXKCPr+64xiG6t033nqACvbawXM8SHhDIHiVueQg=
X-Google-Smtp-Source: ABdhPJwa+s8bXv2MddxXdoLQ35rfeVmvIvWtWjoNXcRzoZ5cbIfg1sY1JcQey4ofA6i0k0xS+6dLKA==
X-Received: by 2002:a6b:5404:: with SMTP id i4mr1053230iob.62.1612328299899;
 Tue, 02 Feb 2021 20:58:19 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id a21sm529203ioa.34.2021.02.02.20.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 20:58:19 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/4] target/arm: Add support for FEAT_DIT,
 Data Independent Timing
Date: Tue,  2 Feb 2021 21:58:12 -0700
Message-Id: <20210203045816.10953-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=rebecca@nuviainc.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Rebecca Cran <rebecca@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for FEAT_DIT. DIT (Data Independent Timing) is a required
feature for ARMv8.4.

Changes from v3 to v4:

o Fixed AA32 DIT/PSTATE_SS patch following review feedback.

Rebecca Cran (4):
  target/arm: Add support for FEAT_DIT, Data Independent Timing
  target/arm: Support AA32 DIT by moving PSTATE_SS from cpsr into
    env->pstate
  target/arm: Set ID_AA64PFR0.DIT and ID_PFR0.DIT to 1 for "max" AA64
    CPU
  target/arm: Set ID_PFR0.DIT to 1 for "max" 32-bit CPU

 target/arm/cpu.c           |  4 ++
 target/arm/cpu.h           | 12 +++++
 target/arm/cpu64.c         |  5 ++
 target/arm/helper-a64.c    | 32 +++++++++++--
 target/arm/helper.c        | 49 +++++++++++++++++---
 target/arm/internals.h     |  6 +++
 target/arm/op_helper.c     |  9 +---
 target/arm/translate-a64.c | 12 +++++
 8 files changed, 110 insertions(+), 19 deletions(-)

-- 
2.26.2


