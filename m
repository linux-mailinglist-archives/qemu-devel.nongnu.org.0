Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFB2230C1F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 16:11:45 +0200 (CEST)
Received: from localhost ([::1]:33244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0QKV-0004P9-OF
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 10:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k0QJ1-0003Hd-JR
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 10:10:11 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:35788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k0QIz-0006cl-Lq
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 10:10:11 -0400
Received: by mail-wr1-x442.google.com with SMTP id f1so17892824wro.2
 for <qemu-devel@nongnu.org>; Tue, 28 Jul 2020 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mieuf+1PukrvwRDyhtVFpcwgK95FDOLp9Ls77LBQOUQ=;
 b=nPwAE26+SYhlQIxItHEm0iPaMvSlMI/5lcceyKkQo6kNW62SBzxvnnYkCgJfX69l1d
 VMSwvMENyzBL2zNnrxUauffXbEH063TNSx6zf/ZTx2fPbsfBcwbKIV1QrKr4O6D9AstR
 3wXvFHW/OZZx9EuWJENCs3tJ0XqdfzC4kugRF98wgpTNwQpoUeeTonEgg6PW904V1mpP
 6w1owI0IrnCAzCZin/YoULx2KKP5+okYvQBfj3jjETUszV2AjSd71eVpB/QpXSR0Uoci
 NDoacniS6xs7ZCXfH91SmnwBNoz3AhuzzH7V5H/TnKYjOVTWbX7noCsCpU8/xgeBKPrV
 XewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mieuf+1PukrvwRDyhtVFpcwgK95FDOLp9Ls77LBQOUQ=;
 b=a13cApo/TDUKhFhhcclChtEgFSTrz+urCVaN+NmzUg0whzK9YKJ7R3b5CNQxlrSIFo
 1gI41cDOnIoxn15f2s7Um0bF6xcYJLhEOatwx98XrkCtm7KiPM7GRO0YfbZmeKyVpXW7
 Ztr3roVeni5VJ0a5rv4eagTG3KrCFMdqao/U79nQ9Jwx1YBkfWSAJYDVCo931gvImKGS
 U4jEh41qPsCj4nJKuAIAJwuusBbksFPs7N1uyMmBJOrsgfhgbRE7rvq7j09IoPTOE2Mv
 +fh7i9oBYf7Ef9pnCJIk//h65VDOMNAay3R7YCRpj6N6ghWZoTmRhjeOcTpKmfPI1ORl
 WsRA==
X-Gm-Message-State: AOAM53281SlBFohzehKOFD3gOcoWHd6jrkAKm7dwE2QCycmB1bLkM5tX
 pKbfiRpf1mhqQ99K4OYITCYBHQ==
X-Google-Smtp-Source: ABdhPJyAvHr6clXY59ho3Q7xWXdIA52ORF4oJutkOWVVdysJvWi8qfi3ahGGsNjaSmrzwxfxPqs0/w==
X-Received: by 2002:a5d:4d8b:: with SMTP id b11mr25378555wru.341.1595945407373; 
 Tue, 28 Jul 2020 07:10:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b8sm17393054wrv.4.2020.07.28.07.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 07:10:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 724EB1FF7E;
 Tue, 28 Jul 2020 15:10:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/2] clean-ups for sleep=off behaviour
Date: Tue, 28 Jul 2020 15:10:03 +0100
Message-Id: <20200728141005.28664-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: pavel.dovgaluk@ispras.ru, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, boost.lists@gmail.com,
 victor.clement@openwide.fr
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

These fixes are more band-aids than anything else but they at least
improve on the original situation where running a zephyr build with:

  -icount shift=6,align=off,sleep=off

would lock the monitor hard as time rushed into the future. With these
patches time still runs to the future pretty fast as Zephyr spends
most of it's time in WFI waiting for input with a CVAL far in the
future. This does does raise the question of what sleep=off is even
for?

Alex Bennée (2):
  qemu-timer: gracefully handle the end of time
  target/arm: only set the nexttick timer if !ISTATUS

 include/sysemu/cpus.h |  2 ++
 softmmu/cpus.c        | 13 +++++++++++++
 target/arm/helper.c   | 35 ++++++++++++++++++++++-------------
 util/qemu-timer.c     | 16 ++++++++++++++++
 stubs/Makefile.objs   |  1 +
 5 files changed, 54 insertions(+), 13 deletions(-)

-- 
2.20.1


