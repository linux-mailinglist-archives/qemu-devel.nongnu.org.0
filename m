Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B478331BA4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 01:29:18 +0100 (CET)
Received: from localhost ([::1]:53848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJQFQ-0001sF-Hz
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 19:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lJQE0-0000L1-2H
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 19:27:48 -0500
Received: from mail-pg1-f172.google.com ([209.85.215.172]:34743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lJQDy-0006KG-IN
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 19:27:47 -0500
Received: by mail-pg1-f172.google.com with SMTP id l2so7557725pgb.1
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 16:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LGTm0gDmZLnK+xZ5da5pWZ57q8U7GENz+8zAuGK5Ts8=;
 b=Ihbmrp915Nz29FCtHk1bckm0pefqCB8GbaNm2SbNHbo2kuisxJdOh3XZVBTAp9P7SL
 YedHyNandIvqD6HyWH6ET0XXViBz8C7NEZijdsof2zbXdEOTavHWGWtrrxaH/PlXNL9o
 3z6DO94qfomAfs7NTaslKgUfA7WhYlzuu2uX7eK+6tk6eDE+iQYPof8r2xWQo/PtXM+Z
 Sjy8fLoMerUNQhqreDRfaLmIOyOtVN5z/nnUfqOATSqmjv5CBhFRpEKJyK4VlI0OHdne
 P1bWgJC7N02VqLru/ijO9vcDh4LNF4TkNdMKt5DZBhTDP0Wt1weJNyQL55kq5vt/GSFf
 7yGg==
X-Gm-Message-State: AOAM533FIvo6ObapFVKaWbJwIGZWHJPwiClhzvWPSQEXyDh6LN5M66Zm
 zvfXZczoEUKfsNC8P27uKgTbHzhZbyA=
X-Google-Smtp-Source: ABdhPJybLSZVycZO9Xcjt2tk4567W641pX3jGLaKPWKCghamFQojdQsgYCnq7Kecazy2/rTfRoPXTw==
X-Received: by 2002:a65:428b:: with SMTP id j11mr22732961pgp.47.1615249664683; 
 Mon, 08 Mar 2021 16:27:44 -0800 (PST)
Received: from localhost.localdomain ([73.93.154.215])
 by smtp.gmail.com with ESMTPSA id d2sm466764pjx.42.2021.03.08.16.27.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Mar 2021 16:27:44 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] Disable unsupported features on iOS hosts
Date: Mon,  8 Mar 2021 16:27:37 -0800
Message-Id: <20210309002741.85057-1-j@getutm.app>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.172;
 envelope-from=osy86github@gmail.com; helo=mail-pg1-f172.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches disables code that cannot be compiled or run on iOS by adding
feature/header detection at configure time.

v2:

* Broken merge where config_host['CONFIG_SMBD_COMMAND'] was duplicated.

-j

Joelle van Dyne (4):
  block: feature detection for host block support
  block: check for sys/disk.h
  block: detect DKIOCGETBLOCKCOUNT/SIZE before use
  slirp: feature detection for smbd

 configure            | 26 +++++++++++++++++++---
 meson.build          |  9 ++++++--
 qapi/block-core.json | 10 ++++++---
 block.c              |  2 +-
 block/file-posix.c   | 51 +++++++++++++++++++++++++-------------------
 net/slirp.c          | 16 +++++++-------
 6 files changed, 75 insertions(+), 39 deletions(-)

-- 
2.28.0


