Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1876E41DBEB
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 16:05:47 +0200 (CEST)
Received: from localhost ([::1]:49172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwgz-0002Lr-Uc
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 10:05:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVwBM-00084Z-5s
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:33:04 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVwBJ-0005Cm-06
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:33:03 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 r83-20020a1c4456000000b0030cfc00ca5fso8469982wma.2
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 06:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z0rguPNAxUyDxy2CQeF8SNel11uZtjc8zMuaI4+6rbI=;
 b=XFgiUX9aBArfQYx2EL8RhFfTRDI5lNEElbzAypy3yamnDNX15E22s0PvR53AF6o2Rc
 B8kuz40bLuEJwqI6n3hMrtPsKMuh5x4EPQk5f2C3+2DnP5ARVHmaY5mooOr0H7nGy7wl
 mg3cRYeNnpXmaWU73bxtb12PQAmHJBgYyAVJOgiFS6uLTBf8Zs9ahN08+W0qgFYE8dpj
 /AFCTzvqqENRSpiZuQlgtqWWuupBdPR1GDBHZjWPQ0unwTT3ekiqwz3tRcvmvVdkNdCg
 oTvBLueNOu1jCwTwwCDpVnX9pCBEPZZprTYWkxBJPAHB6WHHF90f5exnJfQAUsIX1BXY
 qfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=z0rguPNAxUyDxy2CQeF8SNel11uZtjc8zMuaI4+6rbI=;
 b=HApl/vXX1yltwyQlQ7osG84b4nPRUhYHmby1+sf4Ft6MroVc7AhGXP4CH4bqI/LlWa
 PWz5nKv7Q9+LqXmb7fhk0b3eWH033NGKtLjFKrZlYWPFTrkUMepgu9OxV+jSv8Lfbqsv
 iErPQBfVoAI3qV/UD7AvIpxz7PLIxQ1s3Bhu+EI6IwarXHZN1lePufzfQ3C3SXeRLY4W
 8qGzwmqOSjfe9t4E9Laxa4kzLWi/jWEVdR6tPikvNIkeJAm8IlQJpRcC29+sm2a2paTr
 Q5HKU9eoC6Z+CrVG3MI0M+D7N9AW0ybT22gy2zyyNHWtp6yBurWRAXGv/yzeQJ2a51WZ
 3/Bg==
X-Gm-Message-State: AOAM530G6EC6bL+QAahNvL+c5LQqDn+1hHkI1qS7avbwjBLrOPn/ZXrU
 bYOTm3r644c9A9LR0cjXOMbHgBNv9z4=
X-Google-Smtp-Source: ABdhPJwSOEFFDFD3Hs3Ej7QTATsDT9RDP0S7lv7VS9PNawvfZ4jVQGiCzy6bDqE2zES8FazBkZMjOg==
X-Received: by 2002:a1c:f402:: with SMTP id z2mr15843065wma.53.1633008779286; 
 Thu, 30 Sep 2021 06:32:59 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c4sm3037168wrt.23.2021.09.30.06.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 06:32:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] Cleanup sectioning in a few doc files
Date: Thu, 30 Sep 2021 15:32:43 +0200
Message-Id: <20210930133250.181156-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Patch 1 is more or less unrelated and is just a cleanup for file names; the
others clean up the section headers for various doc files and fix a few
cases in which related documentation is scattered through the file.

Paolo Bonzini (7):
  docs: name included files ".rst.inc"
  docs: move notes inside the body of the document
  docs: put "make" information together in build-system.rst
  docs: reorganize qgraph.rst
  docs: reorganize tcg-plugins.rst
  docs: move gcov section at the end of testing.rst
  docs: reorganize testing.rst

 docs/devel/build-system.rst                   |  21 +-
 ...definitions.rst => ci-definitions.rst.inc} |   0
 docs/devel/{ci-jobs.rst => ci-jobs.rst.inc}   |   0
 .../{ci-runners.rst => ci-runners.rst.inc}    |   0
 docs/devel/ci.rst                             |   6 +-
 docs/devel/multi-process.rst                  |  20 +-
 docs/devel/qgraph.rst                         | 132 ++++++-------
 docs/devel/tcg-plugins.rst                    | 117 ++++++-----
 docs/devel/testing.rst                        | 182 +++++++++---------
 9 files changed, 243 insertions(+), 235 deletions(-)
 rename docs/devel/{ci-definitions.rst => ci-definitions.rst.inc} (100%)
 rename docs/devel/{ci-jobs.rst => ci-jobs.rst.inc} (100%)
 rename docs/devel/{ci-runners.rst => ci-runners.rst.inc} (100%)

-- 
2.31.1


