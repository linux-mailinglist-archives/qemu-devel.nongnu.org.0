Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66787A05A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 07:34:41 +0200 (CEST)
Received: from localhost ([::1]:58032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsKmW-0006Ca-Ki
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 01:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47587)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <renyime@gmail.com>) id 1hsKlj-00050J-65
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 01:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <renyime@gmail.com>) id 1hsKlh-0005sV-RV
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 01:33:51 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:46344)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <renyime@gmail.com>) id 1hsKlh-0005pv-HS
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 01:33:49 -0400
Received: by mail-pl1-x642.google.com with SMTP id c2so28389200plz.13
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 22:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=LaZ+NszwYSrD6iawOrj7oNol0Y8aQ0iZkbZTv7MT1g4=;
 b=NaOmWDuFZrsTuOzBtx1ucY1Zp0NrstyVOLewe8v7YVyEUoqk6K2Tlq3TT1KwqqRYeG
 gdtOFoZk2TMye3fSAxCplLjZbUbpHSkXxsjVScdhEpYGTD+oyboRcJVnXU8m0JscqB2i
 LCtcZYG0D8+M/9B7JZa4CUB55Pck+QX2HOZgs6I5QQ34P6htzUvtK6ExwqpOhzSaN4M2
 CCF0/chYSkpLNI84S76pkzkXbhadtIJ5O6cyzBNiScvGcwjarffBwD1CN7DqYHNBymHQ
 FHbdM5kre4SGooPW2UBUC6B9oRTTa8DmE7dLjdUYrAy258/erXmzEvh1V4u5Bbd/I0Ks
 RfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LaZ+NszwYSrD6iawOrj7oNol0Y8aQ0iZkbZTv7MT1g4=;
 b=nK+IMPNIOMeWwdcL8LT7j6tTaXGunSLNAtl8CmdD0qgstOEawFaVNV93F9C+merR2y
 +uDciZ5Fo3apVl5/N0fmJHWj6AjdGgwbkkpk0xHjvLbXURXk833BrCTHcxAG2FVl4YzQ
 rm3HVwzwHCfOb3RG64ABna7d0mYtm1+GOn1m+AvFwAlsV7zWUfl6gphVSNWwvG5MSZTm
 5VdpRM6NPgQGU70dLby05n6H/om/oKgKOELmXKO4ufIOtezIq6FWehBuXt+FVS7bE3wy
 PGx/QmKNvRRdJNP4tDcXiRTw5KiiiGI+Fzos5W1gEWxWGum3/z5iYpbut9tBfb294WRe
 ePig==
X-Gm-Message-State: APjAAAXyIKwKs234XNePHtkXAKv/1WSfrL7c/rxCgdX9KVIbrzFirZX2
 rYQUnSd5QF8zXX22X3oG9o4=
X-Google-Smtp-Source: APXvYqw8OBHKVKqniL7hop7CvhPsW/FLqMbLiF7GltsNVuLpL9+ViaAS74uvuvraVzk1BCO3DnzOGQ==
X-Received: by 2002:a17:902:112a:: with SMTP id
 d39mr114965772pla.254.1564464827778; 
 Mon, 29 Jul 2019 22:33:47 -0700 (PDT)
Received: from VM_85_204_centos.localdomain ([129.226.55.250])
 by smtp.gmail.com with ESMTPSA id 11sm64055886pfw.33.2019.07.29.22.33.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 22:33:47 -0700 (PDT)
From: Ivan Ren <renyime@gmail.com>
X-Google-Original-From: Ivan Ren <ivanren@tencent.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Date: Tue, 30 Jul 2019 13:33:33 +0800
Message-Id: <1564464816-21804-1-git-send-email-ivanren@tencent.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
Cc: richardw.yang@linux.intel.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ivan Ren <ivanren@tencent.com>

Currently multifd migration has not been limited and it will consume
the whole bandwidth of Nic. These two patches add speed limitation to
it.

This is the v3 patches:

v3 VS v2:
Add Reviewed info and Suggested info.

v2 VS v1:
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


