Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6182F2FFBEE
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 05:47:27 +0100 (CET)
Received: from localhost ([::1]:42966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2oM1-0006tZ-UY
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 23:47:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l2oKV-0005OK-NE
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 23:45:51 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:44055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1l2oKT-0000g8-GY
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 23:45:51 -0500
Received: by mail-pg1-x532.google.com with SMTP id p18so2851701pgm.11
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 20:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uy0gCEX36d5XZlBS+Nl9z1E2SVL7L6nrGFrEE21Rnrg=;
 b=MHOi505tM8NW2XbmA6U3ApMHOpWabt2dOpXBBmV/TgUIX0y5qbNrI25UHwfK0AdEgj
 cYx89xtJXwjRymZXy7KPV/PJ1kn1tmqY76Rxu7xBUWKMQES/Azvpy2oBOfXGchQimEZF
 0y0e7OL/xkbBHQJDagAxqqG+VPnYHS37OaHt2fokG0SUs+eu6mnbefM2f0LuMLxa+9VV
 ackdhxYF7ULfw3AQT5wLTDqzU2Jwb6IORRH/8bLlSQUP0+nh/eP9oABZ0l43O8MkTxWl
 Fp2j2KG0Op6BI1B5zp+Iepzx/eEda3tw6OvwoCifvJD7G+wIz+ru07aMU9VXgOOvcX7p
 Gq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uy0gCEX36d5XZlBS+Nl9z1E2SVL7L6nrGFrEE21Rnrg=;
 b=LU4RCV/oM5od1oqa/RO3xZTm7rpPuBmvth6Yb3BbKUrrV7Qt8n7fWNOrq23NzEh2/1
 PFv8VPATwFHWzPqCIru6Hb+csqPOk+4J9E0YdPRKJI1412QTRnUYdZMwTkYr95ESfERq
 ok0HLixtWbOzkQOWskLg/jjQ8sXqUc1T/S9FFl8KvKhdY0NEKVc30uuIaWwWYOJG2Iba
 k0ZkOvmP1pq2pQSJB7s8r+XQBpk3XtjPlJdppzd5axMgDpIsc1sOv3oX5URI27Bmtzms
 8Bxp/Z1k5bwTHvDWaAo+cZedrKKrJhz6Zo0R1GAHD7ufn/oM8VhA7Q0rF+S1Qp/DLaBW
 eVAA==
X-Gm-Message-State: AOAM533vv1668fiOEKoxYFXTiHyf6YsjcFzi+yStgksROLg9ZoCRA2rK
 Hlvlovt3Onc9OCA+2j6Ig961OLqhFpZ1rZKmzTRLMCJIb7vWpJjanPCeAnEaiB8sdZ1SgdM67Y1
 vj8X2HF4w72m6owiUM0wde8ssCRfjxHtke6Dz/bJlqFIMwWGHl6r8g5qvWKDbf4tS8tQ+Rk9kfQ
 ==
X-Google-Smtp-Source: ABdhPJxs7zpXutpOwIyiIx309Hx0RWGK5WsUhFtFSbXCQgYx34riV+4Sto2SpNVZTfXq8GVdvFjBVQ==
X-Received: by 2002:a63:e849:: with SMTP id a9mr2838017pgk.231.1611290747225; 
 Thu, 21 Jan 2021 20:45:47 -0800 (PST)
Received: from cube.int.bluestop.org (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id b10sm7050494pgh.15.2021.01.21.20.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 20:45:46 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] target/arm: Add support for FEAT_DIT,
 Data Independent Timing
Date: Thu, 21 Jan 2021 21:45:34 -0700
Message-Id: <20210122044537.1823-1-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=rebecca@nuviainc.com; helo=mail-pg1-x532.google.com
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

As suggested in https://www.mail-archive.com/qemu-devel@nongnu.org/msg767057.html
this second patch contains code to move PSTATE_SS from uncached_cpsr to 
env->pstate.

Being fairly new to both aarch64 and qemu development I hope I'm on the
right track, but I suspect my implementation is incomplete.

Rebecca Cran (3):
  target/arm: Remove PSTATE_SS from cpsr and move it into env->pstate.
  target/arm: Add support for FEAT_DIT, Data Independent Timing
  target/arm: Set ID_AA64PFR0.DIT and ID_PFR0.DIT to 1 for "max" AA64
    CPU

 target/arm/cpu.h           | 12 +++++++++
 target/arm/cpu64.c         |  5 ++++
 target/arm/helper-a64.c    |  4 +--
 target/arm/helper.c        | 26 ++++++++++++++++++--
 target/arm/internals.h     |  6 +++++
 target/arm/op_helper.c     |  9 +------
 target/arm/translate-a64.c | 12 +++++++++
 7 files changed, 61 insertions(+), 13 deletions(-)

-- 
2.26.2


