Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B0E786ED
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 10:02:50 +0200 (CEST)
Received: from localhost ([::1]:50320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs0cL-0005Sz-Ke
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 04:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41902)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <renyime@gmail.com>) id 1hs0b5-00045l-6q
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 04:01:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <renyime@gmail.com>) id 1hs0b4-00069s-B8
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 04:01:31 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44631)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <renyime@gmail.com>) id 1hs0b4-000698-5Y
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 04:01:30 -0400
Received: by mail-pl1-x641.google.com with SMTP id t14so27160295plr.11
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 01:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=GeOL0IQzg3XqJ1E2o5eM1umSQf0TvqePQR2Ydx+4wzY=;
 b=htgeMeZOLN7oF1QXMjWQuEeiq7B2J1JZPNEV8Uq6cFKA4zApCAaiy+Cmrhg+ZVnV15
 5zsEJ3IMA65eCWEGdbmnVwTNGAFagjihsxixPCQ/sziwssEElbAf4AryLYh87smVeR2/
 Kizl9lJsKE6eOOqiV2El4Os6pW/nkdBqBnIg38NxDeXO4U7pFV+x/PDpDPFwHrkJ7JHR
 k4dsfc1ABGcyoLHCEr7dX25D1lZ9RSdQCQCNU8beuvbCF60ULKHo3HRktWCJnNgQ6z1i
 rHwmmdrt55mHq378tzm8Tlt4ZRJT0hGHlERUiRoJQs/sC7TWJz/NlWrYCn3x5U4kVtx6
 8I6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=GeOL0IQzg3XqJ1E2o5eM1umSQf0TvqePQR2Ydx+4wzY=;
 b=ad6hIRwiNBVLJNMieY3nLIpReQujPX2Xhl/LAFYthYLWp64dU4H8RpL+8MO0WCMckA
 saVwkeGD/scypooRTjalSo3xGAes8jIOqGlpMjGjQ7QkLCyl94sEeAqS411hBRTHUuKY
 5Cq8EmBEeLEJAXAnnEuVjv5r6mj2VQ4Eeo1BkZk03vrDqjy4FlDfs9XSwCY++4nZEc4W
 qztNEcdWnzZdD2Ky9DoCkccVfSN3uNC46EZJTL1+nNmPadBQZdO6bVDHpd5eW6ZMzCFr
 Xbe1obhIbi60KVAgxv7w2NXHYdhmQZYK1aN0gK0LDJbHO4i5Ip8I6IpdBO3KA01YajmQ
 oxfw==
X-Gm-Message-State: APjAAAVdiFvPWik9TlOjm61Lh7mG7Ee77uGivon6CmL8pe9j04uLGdPz
 BYwhB1J0uEY1Kd6PLhictzw=
X-Google-Smtp-Source: APXvYqyc5HfMZ40cM7Hdm0XNOa2reoVn5sx1djkfbDTeq7UTUGAp7EqjSASpJVYubGM3D8DMFoj3jA==
X-Received: by 2002:a17:902:8207:: with SMTP id
 x7mr109016589pln.63.1564387289053; 
 Mon, 29 Jul 2019 01:01:29 -0700 (PDT)
Received: from VM_85_204_centos.localdomain ([129.226.55.250])
 by smtp.gmail.com with ESMTPSA id l6sm61237035pga.72.2019.07.29.01.01.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 01:01:27 -0700 (PDT)
From: Ivan Ren <renyime@gmail.com>
X-Google-Original-From: Ivan Ren <ivanren@tencent.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Date: Mon, 29 Jul 2019 16:01:18 +0800
Message-Id: <1564387281-12321-1-git-send-email-ivanren@tencent.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-devel] [PATCH v2 0/3] migration: add speed limit for multifd
 migration
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently multifd migration has not been limited and it will consume
the whole bandwidth of Nic. These two patches add speed limitation to
it.

This is the v2 patches, differences with v1:
1. change qemu_file_update_rate_transfer interface name
   to qemu_file_update_transfer
2. add a new patch to update ram_counters for multifd sync packet

Ivan Ren (3):
  migration: add qemu_file_update_transfer interface
  migration: add speed limit for multifd migration
  migration: update ram_counters for multifd sync packet

 migration/qemu-file.c |  5 +++++
 migration/qemu-file.h |  1 +
 migration/ram.c       | 24 ++++++++++++++----------
 3 files changed, 20 insertions(+), 10 deletions(-)

-- 
2.17.2 (Apple Git-113)


