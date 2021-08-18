Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1F53F0CF0
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:48:21 +0200 (CEST)
Received: from localhost ([::1]:49078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGSU0-0003KN-Aj
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mGRrB-0006rA-8l
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:08:13 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:39907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mGRr9-0006a1-0q
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:08:13 -0400
Received: by mail-lf1-x136.google.com with SMTP id t9so7197767lfc.6
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l50HWD6mVnqVzo6aPf3OCDcrQ77I9+W9BJb6Am8yypw=;
 b=WPfrrZxMrBKEOOjR+1qXpK0GloZXy5YQatDFnHd7Sk3XFSsKcmg3EPPzSHgdrOVgVL
 YY6xwmOwj6EOZ06wwEGm2I2URiW+dw9xeMAw3mNAP/EKwBLGrlp2gtntYl5EhbJEuTYm
 F2lKQy/UJai4Fk4CyzBZIqrQ4yhGWokAXGzEAYHnQrYyQ7CsKsAt9237W/F9lVwuSYjh
 hBzJluuCt7QSnROEsxdl6HRx3OTbaTxitNmlj8tjN/hSwGyWJDIJG7UhXeV6ckPvFdZj
 H7aW5BiYCvDOiyUyGtSR11TOGokRPIP2/cLIwKF4f5fVPbYPZ+pNIJlm2XTNkWhaAjtm
 4Rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l50HWD6mVnqVzo6aPf3OCDcrQ77I9+W9BJb6Am8yypw=;
 b=sj+4geJ2iPlqOtgiK7ybwyBIvXhvjDnWvihiA3uva9je8rYrJloHk60psJcKhmsQgR
 G9ChZKik4T9bbzphptElux7TkbGRtlIohy8bxhCsW/45BLSC31tLrwc+LcQ6AzxORQRr
 z+3eRi+qtiuDG2Lq/0zUnEp++VSTV92JdxjDDasZmALKRJufjluDUdbgo5+USsQ3fjIs
 wQGePWe8W3Quugx8isVaPIwkEu0ZrL7/MnzX5eM3Xu7VaUI1nv5VqeqGFZbRrwDPgAGt
 jaFMDZiYIr0oLRSTGjm2ZdNbu4U6IqRLt6vDlOmDqOqBVYA3gxAVoJNWfEafXsmuwudh
 nHGA==
X-Gm-Message-State: AOAM533INrOogSbE2Tbcq+qmrUl5AGIjJYgwADJP0QoXCiK2LUr25Drj
 eGXmb7zxvvnP9yDHK2sD+9ntXVqpUWV2LA==
X-Google-Smtp-Source: ABdhPJwTCUhmDSe3xkW42FbepYehiPi1Lfv2AR67w6blnZ11rJrEFno0SEbXaqUpvq6em5/zXK+JmQ==
X-Received: by 2002:ac2:5611:: with SMTP id v17mr7719053lfd.220.1629317286692; 
 Wed, 18 Aug 2021 13:08:06 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id r145sm63201lff.128.2021.08.18.13.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:08:06 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/riscv: Update QEmu for Zb[abcs] 1.0.0
Date: Wed, 18 Aug 2021 22:08:00 +0200
Message-Id: <20210818200803.788253-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x136.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 18 Aug 2021 16:43:42 -0400
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


The Zb[abcs] extensions have complete public review and are nearing
ratifications. These individual extensions are one part of what was
previously though of as the "BitManip" (B) extension, leaving the
final details of future Zb* extensions open as they will undergo
further public discourse.

This series updates the earlier support for the B extension by
 - removing those instructions that are not included in Zb[abcs]
 - splitting this into 4 separate extensions that can be independently
   enabled
 - update the to the 1.0.0 version (e.g. w-forms of rev8 and Zbs
   instructions no longer exist)



Philipp Tomsich (3):
  target/riscv: Add x-zba, x-zbb, x-zbc and x-zbs properties
  target/riscv: update Zb[abcs] to 1.0.0 (public review) specification
  disas/riscv: Add Zb[abcs] instructions

 disas/riscv.c                           | 157 ++++++++++-
 target/riscv/cpu.c                      |  31 +-
 target/riscv/cpu.h                      |   7 +-
 target/riscv/insn32.decode              | 119 ++++----
 target/riscv/insn_trans/trans_rvb.c.inc | 357 ++++++++++--------------
 target/riscv/translate.c                | 128 +++------
 6 files changed, 400 insertions(+), 399 deletions(-)

-- 
2.25.1


