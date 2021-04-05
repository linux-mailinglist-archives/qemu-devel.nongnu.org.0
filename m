Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A01235430A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 16:56:36 +0200 (CEST)
Received: from localhost ([::1]:49424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQeZ-000658-3L
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 10:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQP2-00086a-Bo
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:40:35 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:36847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQOu-00064P-CG
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:40:32 -0400
Received: by mail-pg1-x534.google.com with SMTP id h25so8267694pgm.3
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kaFBjvDDVnjBiXI5u4lRixiUx5/DmhLsbWDy9UUPnJs=;
 b=n8P3HoAkwEG8hTc1hXn/1QozFuhLFZRnXg0dTq4EAtDss2yTWlRGhLcecwsLutuYma
 MApWhxYcqUvYiGe4NBnRRBvLCEopYLqIr5H7Btqapv+ESvt1cW/bKJ3j1MemKxubzqcU
 pbCBX08+malEBri7p878PStlRVyGFAP6TbpQRs7bXZwj0GjTSD3kqqfyq9Z1F8Lie2KS
 pf4LJoKRjKYQ5kZpwFFxq/XiebrJxK3cHYWC8pyHqRnQmBAjx+1FsUR2pVB+Lh1Qexnr
 NUnK45lNIoeDmAXkTE6clMP/404rUZEMqD3ENkTLs7xiLpxG7mD6qo15jM+B2zjJh/XU
 0G9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kaFBjvDDVnjBiXI5u4lRixiUx5/DmhLsbWDy9UUPnJs=;
 b=eBZoGL6SbG4fbqGddpd8EDp4DQYF8X/Ye3wMHOyrMTvu/y8QZ7pkr8x5cFoOx5Q0Bk
 tEVh2+pFZGcpgsLRQLfBTHSY2xKLjXdBdLvqRBYFLvFB6W4kvF3AVQZzJdZkrli0raF0
 WC+316Dpr9lP2DUGjxrtAOe4K7EqCPABNs+as4I4QJk1qILRUzmzbjbrwc5Bb+grnBl3
 9/UPVHJsKMa8ZumBuoXCBcaySdcvkdDtrLxeIlQmhelmNDlEbK07accu4WwiK9rFzQG3
 YT1dghwtWBFBkcW1MurjLXk1lD54G9vkJoAgk5lrWBDdzO6xZLMAGECfoQ2g7GzIS8nx
 4Q5g==
X-Gm-Message-State: AOAM530I7ctVvuKfCoI/y1QalRowVyprPn+wTRyegOGNG30Lp94qlYwd
 R/NJtO4CV9XXodnRHZMsrGUp85C0t2d3SA==
X-Google-Smtp-Source: ABdhPJz32zsk+iIkWWRCguY6cN42IzVk2aqCSmij1SrvJ+JHq/nppAS1Ky+rnJIsLYrP645rvm61og==
X-Received: by 2002:aa7:818e:0:b029:215:2466:3994 with SMTP id
 g14-20020aa7818e0000b029021524663994mr24204448pfi.48.1617633621111; 
 Mon, 05 Apr 2021 07:40:21 -0700 (PDT)
Received: from localhost.localdomain
 (50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id q5sm15752999pfk.219.2021.04.05.07.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:40:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 0/2] tcg patch queue
Date: Mon,  5 Apr 2021 07:40:15 -0700
Message-Id: <20210405144017.20193-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Folding in a target/alpha patch since both queues
are singletons this time.


r~


The following changes since commit 25d75c99b2e5941c67049ee776efdb226414f4c6:

  Merge remote-tracking branch 'remotes/xtensa/tags/20210403-xtensa' into staging (2021-04-04 21:48:45 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210405

for you to fetch changes up to ef951ee33fba780dd6c2b7f8ff25c84c3f87a6b8:

  target/alpha: fix icount handling for timer instructions (2021-04-05 07:32:56 -0700)

----------------------------------------------------------------
tcg/mips tlb lookup fix
target/alpha icount fix

----------------------------------------------------------------
Kele Huang (1):
      tcg/mips: Fix SoftTLB comparison on mips backend

Pavel Dovgalyuk (1):
      target/alpha: fix icount handling for timer instructions

 target/alpha/translate.c  | 9 +++++++--
 tcg/mips/tcg-target.c.inc | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

