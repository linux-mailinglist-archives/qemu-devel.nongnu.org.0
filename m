Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 177F722A38C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jul 2020 02:21:36 +0200 (CEST)
Received: from localhost ([::1]:35544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyOzO-0004fq-Jf
	for lists+qemu-devel@lfdr.de; Wed, 22 Jul 2020 20:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3jdcYXwMKCp4QAUEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--scw.bounces.google.com>)
 id 1jyOxQ-0003E0-3e
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 20:19:32 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:56135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3jdcYXwMKCp4QAUEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--scw.bounces.google.com>)
 id 1jyOxO-00022O-9K
 for qemu-devel@nongnu.org; Wed, 22 Jul 2020 20:19:31 -0400
Received: by mail-yb1-xb49.google.com with SMTP id h194so4407440ybg.22
 for <qemu-devel@nongnu.org>; Wed, 22 Jul 2020 17:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=CUxyDgrhzcYJYn2h2oo/OVj1c2i+VcMUMYbLL66wAiM=;
 b=XAPH4qcx501/WlrqInGCA8Y6WsQbDOm8XzmmoQisxkwolaXHsbcaumd62kKRJakCIA
 V+e95EGoT+ulv8imnkN8Y/sxTRCJdFr5h50paF4gP9++QQzQeDF3tQHuwdYC0RwjDi3K
 /VcbsQTCSf4bxXA4L5VBBXtwR2ceOJ5nbaOitxC5FnIXomOQs8RvSnOXANAPjSmP7pA4
 c4X6L//2+cRmyVAzQjfqxqQ+X14LbdbsiBkch1krvh42ZdbD5GdZRv5imtPjMsrpyGYw
 bm+qGwnllUxfxK6l3En9Ud50K84HM5C/9r9hU0RFdyqTWeYP9V3fJaTiO1cIYVgpnVYP
 fpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=CUxyDgrhzcYJYn2h2oo/OVj1c2i+VcMUMYbLL66wAiM=;
 b=CHY3hzumWcFmDOYBRiacFAKVQS83lVWkko7pzNK0BT4yS3wKns9AvJIk1su++kRbdD
 DbzCq+4XoWaRScKBORrkv+rrCheHvokMtsCUmTrGltwKfqLOyCIw97PRA10NzldfLXOq
 JgD9lqk16PvtOvzzS9GYstwwXLQaubSCIPCy2+ybm1ttKrPA1CgAABTNdNom+NjBN0IO
 ICy3EdiskAS/9+Wy/UWkYV2/BDo426rByN8mK/fyVAQTvWjy4+T7HzE/L0YKyRzTSRUX
 6ZlqY46Ft18dX4mC8zPFz5MzPnoUgsUXxW3Dns7baZEnFUY2fm6JOYc+wuwHEv36zsVH
 IyAw==
X-Gm-Message-State: AOAM532FNxD9fzax0FKcNd2EMTWxNsCwJkDbczd0hnLuNnUAoppQd81i
 E1S2L2tHCoyBybYpjDeltaFcGRMeHq86BAM7yYHFAizgDjpZcbgEm7QTvL58LouRxlMjBIB9skH
 ZAXmLz2Q5OkcEsKm1yGjifnRx4PKX3b4wC7fOETBtGn1bC5iq915l
X-Google-Smtp-Source: ABdhPJyY7M/SkAxguqZGFxEw5/OVGBHXGoD9WNVIr3WTBGOhTmyZ83OcNy1i75IGMNs+hSuzQZ9CCDY=
X-Received: by 2002:a25:2512:: with SMTP id l18mr2963775ybl.288.1595463565836; 
 Wed, 22 Jul 2020 17:19:25 -0700 (PDT)
Date: Wed, 22 Jul 2020 17:19:09 -0700
Message-Id: <cover.1595461447.git.scw@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH 0/6] fcntl, sockopt, and ioctl options
From: Shu-Chun Weng <scw@google.com>
To: qemu-devel@nongnu.org
Cc: Shu-Chun Weng <scw@google.com>, laurent@vivier.eu
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3jdcYXwMKCp4QAUEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--scw.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -105
X-Spam_score: -10.6
X-Spam_bar: ----------
X-Spam_report: (-10.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Hi Laurent,

This is a series of 6 patches in 4 groups, putting into a single thread for
easier tracking.

[PATCH 1/6] linux-user: Support F_ADD_SEALS and F_GET_SEALS fcntls
  An incidental follow up on
  https://lists.nongnu.org/archive/html/qemu-devel/2019-09/msg01925.html

[PATCH 2/6] linux-user: add missing UDP and IPv6 get/setsockopt
  Updated https://lists.nongnu.org/archive/html/qemu-devel/2019-09/msg01317.html
  to consistently add them in get/setsockopt

[PATCH 3/6] linux-user: Update SO_TIMESTAMP to SO_TIMESTAMP_OLD/NEW
[PATCH 4/6] linux-user: setsockopt() SO_TIMESTAMPNS and SO_TIMESTAMPING
  Updated https://lists.nongnu.org/archive/html/qemu-devel/2019-09/msg01319.html
  to only use TARGET_SO_*_OLD/NEW

[PATCH 5/6] thunk: supports flexible arrays
[PATCH 6/6] linux-user: Add support for SIOCETHTOOL ioctl
  Updated https://lists.nongnu.org/archive/html/qemu-devel/2019-08/msg05090.html

Shu-Chun Weng (6):
  linux-user: Support F_ADD_SEALS and F_GET_SEALS fcntls
  linux-user: add missing UDP and IPv6 get/setsockopt options
  linux-user: Update SO_TIMESTAMP to SO_TIMESTAMP_OLD/NEW
  linux-user: setsockopt() SO_TIMESTAMPNS and SO_TIMESTAMPING
  thunk: supports flexible arrays
  linux-user: Add support for SIOCETHTOOL ioctl

 include/exec/user/thunk.h              |  20 +
 linux-user/Makefile.objs               |   3 +-
 linux-user/alpha/sockbits.h            |  21 +-
 linux-user/ethtool.c                   | 819 +++++++++++++++++++++++++
 linux-user/ethtool.h                   |  19 +
 linux-user/ethtool_entries.h           | 107 ++++
 linux-user/fd-trans.h                  |  41 +-
 linux-user/generic/sockbits.h          |  17 +-
 linux-user/hppa/sockbits.h             |  20 +-
 linux-user/ioctls.h                    |   2 +
 linux-user/mips/sockbits.h             |  16 +-
 linux-user/qemu.h                      |   1 +
 linux-user/sparc/sockbits.h            |  21 +-
 linux-user/strace.c                    |  19 +-
 linux-user/syscall.c                   | 233 ++++++-
 linux-user/syscall_defs.h              |  26 +-
 linux-user/syscall_types.h             | 277 +++++++++
 tests/tcg/multiarch/ethtool.c          | 417 +++++++++++++
 tests/tcg/multiarch/socket_timestamp.c | 542 ++++++++++++++++
 thunk.c                                | 151 ++++-
 20 files changed, 2706 insertions(+), 66 deletions(-)
 create mode 100644 linux-user/ethtool.c
 create mode 100644 linux-user/ethtool.h
 create mode 100644 linux-user/ethtool_entries.h
 create mode 100644 tests/tcg/multiarch/ethtool.c
 create mode 100644 tests/tcg/multiarch/socket_timestamp.c

-- 
2.28.0.rc0.105.gf9edc3c819-goog


