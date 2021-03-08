Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA0833086D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 07:50:28 +0100 (CET)
Received: from localhost ([::1]:43396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ9il-0005zi-2D
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 01:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lJ9gq-0004HK-C1
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:48:28 -0500
Received: from mail-pj1-f52.google.com ([209.85.216.52]:51012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1lJ9go-0007o7-QM
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 01:48:28 -0500
Received: by mail-pj1-f52.google.com with SMTP id b15so2485582pjb.0
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 22:48:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dda0TR9ihMbgoHzH+8qpMlQmjcSmVQ6hn15GQFuUUQU=;
 b=DnXfMTKMeJffWoVhtKuk1o4tf0cJ2U7jxUW+bVj6ZM8AeHvOgt681VFzFDIwHfQQ6j
 LYnGpWBffLzssAdcAzEuR47K0UV2URBar+Zy6SywyGxAsdE+/id8HL87YgBgmjKSbLYr
 nPdaf+rS5T28NSn1yr/c9Z30ewbQ7UUiv8hDHFM5DT7rayxk7qspe6CnlRYUBSV/V/5I
 AZs9UQ6YzRoIQCajJngrdoBmA0pTTGU1x0yjhGTK7k+YTibqFPP8RfyIK1I8JfbCC9pp
 uFyjUztldH+ibymw+80raycOn0D2p0xSS8p+ysAJzKyG63vInzuiZtmQTiX4I5H94qUt
 3Ijg==
X-Gm-Message-State: AOAM530ZwEv8P1E7o3TfCzqLdGfAb9LtjY9MZXT9J1xunwvqa9egczRt
 fYfW0CBJ+1e7MxUUjKVa8rriLuG/YuY=
X-Google-Smtp-Source: ABdhPJxihp5oy0L/1fDQHOOrIfJ5lRAuZN5QpxLAwtCFKY20mcAMG9gi9rkxSwRSMKoYkxlo3DBQKg==
X-Received: by 2002:a17:902:be0c:b029:e6:f0b:91ab with SMTP id
 r12-20020a170902be0cb02900e60f0b91abmr7229818pls.2.1615186104305; 
 Sun, 07 Mar 2021 22:48:24 -0800 (PST)
Received: from localhost.localdomain ([73.93.155.14])
 by smtp.gmail.com with ESMTPSA id i17sm426943pfq.135.2021.03.07.22.48.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Mar 2021 22:48:23 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] Disable unsupported features on iOS hosts
Date: Sun,  7 Mar 2021 22:48:17 -0800
Message-Id: <20210308064821.81427-1-j@getutm.app>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.52; envelope-from=osy86github@gmail.com;
 helo=mail-pj1-f52.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

-j

Joelle van Dyne (4):
  block: feature detection for host block support
  block: check for sys/disk.h
  block: detect DKIOCGETBLOCKCOUNT/SIZE before use
  slirp: feature detection for smbd

 configure            | 26 +++++++++++++++++++---
 meson.build          | 10 ++++++++-
 qapi/block-core.json | 10 ++++++---
 block.c              |  2 +-
 block/file-posix.c   | 51 +++++++++++++++++++++++++-------------------
 net/slirp.c          | 16 +++++++-------
 6 files changed, 77 insertions(+), 38 deletions(-)

-- 
2.28.0


