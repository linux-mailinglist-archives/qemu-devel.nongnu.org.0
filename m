Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A6B2E9C23
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 18:38:28 +0100 (CET)
Received: from localhost ([::1]:50634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwToI-0005dc-Qg
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 12:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwTlK-0003s8-9q
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:35:22 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:34530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwTlI-0005xz-Fj
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:35:21 -0500
Received: by mail-pj1-x1035.google.com with SMTP id n3so165319pjm.1
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 09:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oKL4WB0FLN+QGa+e8xSTwpHG5rc1Eg5v6NV8n43Pf80=;
 b=vvHEwgKvS3KnCA6lDjWJwMqQVPknB7fbv+AhS8EkEErLi0c1kFN/ULPyjYTJXfgDkL
 KC6MiPko8pzMyg6ocwrkOhF2BSlhrM29eLxPW6iriAG0Y6EVibvvaWTh/YN43x314LFM
 jQZEJYnZupOwzL5uaUJhSjjiwaVNVV4JsWRds+la3kI4fhbjA4u+eHzE0daDngQhEnRq
 iQ7mFLyCTzXg9v/1+Z+AduGNBwSsZqGIr1i0x1Km663XXVhYeBK9E3Nvu9/3Wsmed7uq
 SmSTbmkipLhzMeJAH798ZHga7L+CXFQYsOY49/CtZmAbZiF4gOfMJnDfCXiV9fERz0zQ
 2eSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oKL4WB0FLN+QGa+e8xSTwpHG5rc1Eg5v6NV8n43Pf80=;
 b=g9BmHjh/GiPfm9O9xbfXvpane4AbSPKfPnyRbVXK5AOCTDRz42O+IeafoUHGoPuM6B
 yNKHfdxPHgKrSTHPiN0D7N48yOiL6R8NmUtgwd7btL6BFPWZ6gvqtan4vO+nMaAiPfog
 q+i1pWOCa9Vwxx+xVXFXWVYJ/zboZ+TKzuYJ9DKmrk0f7iLv50/u/sUPME9D2Z3Al+TX
 FC6yfcYocrSPYyfq2PQjb2o7+Gn69XCcScFXxW3OTdzDs8cDhcEfO8VKG1vlEjW5K5sH
 XX9KZnJeR2g5NhKohMdYMHri79rT08EVV8Nc4lU5SYc4wOmXVIs9DV+foRXQIGlHzZwS
 Hbzg==
X-Gm-Message-State: AOAM533X/OAjBhDC+4oPQre1G8X3DwHRDVIggISHcVI7PTitcypHOvYj
 YhBtgWAnrWIecCG1P34ulDmiZ0nDoPFEJg==
X-Google-Smtp-Source: ABdhPJyEl7fMqVIWQOpB+p4cTYEw1g99KLCkIc2Pa+pojHKUfj/Fv9X1jSUC4ivy46Kh29ruN5Eldw==
X-Received: by 2002:a17:90a:f28f:: with SMTP id
 fs15mr31034446pjb.121.1609781718082; 
 Mon, 04 Jan 2021 09:35:18 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id a131sm50706933pfd.171.2021.01.04.09.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 09:35:17 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] tcg patch queue
Date: Mon,  4 Jan 2021 07:35:12 -1000
Message-Id: <20210104173515.198921-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

The following changes since commit 41192db338588051f21501abc13743e62b0a5605:

  Merge remote-tracking branch 'remotes/ehabkost-gl/tags/machine-next-pull-request' into staging (2021-01-01 22:57:15 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210104

for you to fetch changes up to a66424ba17d661007dc13d78c9e3014ccbaf0efb:

  tcg: Add tcg_gen_bswap_tl alias (2021-01-04 06:32:58 -1000)

----------------------------------------------------------------
Fix vector clear issue.
Fix riscv host shift issue.
Add tcg_gen_bswap_tl.

----------------------------------------------------------------
Richard Henderson (2):
      tcg: Use memset for large vector byte replication
      tcg: Add tcg_gen_bswap_tl alias

Zihao Yu (1):
      tcg/riscv: Fix illegal shift instructions

 accel/tcg/tcg-runtime.h     | 11 +++++++++++
 include/exec/helper-proto.h |  4 ++++
 include/tcg/tcg-op.h        |  2 ++
 tcg/tcg-op-gvec.c           | 32 ++++++++++++++++++++++++++++++++
 tcg/riscv/tcg-target.c.inc  | 12 ++++++------
 5 files changed, 55 insertions(+), 6 deletions(-)

