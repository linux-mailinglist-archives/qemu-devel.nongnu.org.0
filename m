Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF561094E3
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Nov 2019 22:00:39 +0100 (CET)
Received: from localhost ([::1]:48082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iZLTK-0002M6-Ic
	for lists+qemu-devel@lfdr.de; Mon, 25 Nov 2019 16:00:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55421)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iZLRw-0001iE-3M
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 15:59:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iZLRv-0001ZI-4p
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 15:59:11 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38617)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iZLRu-0001YB-SZ
 for qemu-devel@nongnu.org; Mon, 25 Nov 2019 15:59:11 -0500
Received: by mail-pj1-x1029.google.com with SMTP id f7so7166494pjw.5
 for <qemu-devel@nongnu.org>; Mon, 25 Nov 2019 12:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=8xgPuTqJy1QlZRSzq2LsNtqmgUVuLv7FF3Wn8phW0/s=;
 b=pcDjDB/E0CGsZrU8NMMO/iJMnT3ZR0UuN7X+oV9rvfBNKFzmlgqXbvozPY3Wvt9HzD
 xwjothopBZLXA94e6Ovpxz5GO3NooyTiJ9W/3eHVu0Dulmc+evxn+iU7Muc1mCL7D+pu
 FdkDhXE4qEpRtgxvrbP9gqAhrN/p5XSFxJhXPx7n2+NxZBdttKuVWtI/yVes1zsXZGcs
 xPbzgOoZf2X8oATsj1Baboco/SrHQmBUmk8rMEh4jC4tEyPiE9oJnTHBeKqHiOp8kXZY
 a4YsztTKFdWdX1szWfuouAtCeuRYgKNUso754SELurLVG6+OBIbqMSpMxkfwbO7B5N+b
 aiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=8xgPuTqJy1QlZRSzq2LsNtqmgUVuLv7FF3Wn8phW0/s=;
 b=pukBqiap1iC+FRQsc6F6qaRFiXO8eDHolVrZVGaTsIvXj/h+h4HhRuoC3RKh7+lt4s
 azhKzmIgG9SocZoCOiejx1V3zFyC+R3ryspIqibELklpfxPbGuVr7tz/PTrKIQ8O2T/7
 oQEnN+bZ92Vgx9EZaiet6eTzpbxwLzeF+Es8FsDPZ/ioGcNOv4gRcIg1zshF1ThCtcwC
 laHVk7Dq049waHmCkMkSJiSA8m27IYfFbJ0yQ65uOX/KVXTZT2aXvCXy+guNPVkhvXxy
 7BC93M/WKPslqxLFLMXOfnhJ0jBoiy9F3UM7/nFAxhPZZ8ciyyKASmc4B7YyejVpC7kK
 9KlQ==
X-Gm-Message-State: APjAAAWO6os1LMpnCEqfC1Rdm0U7NwgbsFuwlo6zi7rar7IeK0X/AGW/
 0cOIcgm9YwQ5hfXqs8WOwYD/q3HFK4c=
X-Google-Smtp-Source: APXvYqzT+MktQlxwHyfFhnr8BBtqHGUAlO7k2gx5q1V2jgaVL89ES+NNBNB5MApFwz2y/npZhVr+hQ==
X-Received: by 2002:a17:90a:1b69:: with SMTP id
 q96mr1294544pjq.89.1574715548358; 
 Mon, 25 Nov 2019 12:59:08 -0800 (PST)
Received: from localhost ([2620:15c:211:200:12cb:e51e:cbf0:6e3f])
 by smtp.gmail.com with ESMTPSA id x2sm10218162pfj.90.2019.11.25.12.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 12:59:07 -0800 (PST)
Subject: [PULL] RISC-V Patches for 4.2-rc3
Date: Mon, 25 Nov 2019 12:58:52 -0800
Message-Id: <20191125205854.226672-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-devel@nongnu.org,       qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1029
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

The following changes since commit 65e05c82bdc6d348155e301c9d87dba7a08a5701:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2019-11-25 15:47:44 +0000)

are available in the Git repository at:

  git@github.com:palmer-dabbelt/qemu.git tags/riscv-for-master-4.2-rc3

for you to fetch changes up to 6478dd745dca49d63250500cd1aeca1c41cd6f89:

  hw/riscv: Add optional symbol callback ptr to riscv_load_kernel() (2019-11-25 12:34:52 -0800)

----------------------------------------------------------------
RISC-V Patches for 4.2-rc3

This tag contains two patches that I'd like to target for 4.2-rc3:

* A fix to the DT entry for the SiFive test finisher.
* A fix to the spike board's HTIF interface.

This passes "make check" and boots OE for me.

----------------------------------------------------------------
Palmer Dabbelt (1):
      RISC-V: virt: This is a "sifive,test1" test finisher

Zhuang, Siwei (Data61, Kensington NSW) (1):
      hw/riscv: Add optional symbol callback ptr to riscv_load_kernel()

 hw/riscv/boot.c         | 7 ++++---
 hw/riscv/sifive_e.c     | 2 +-
 hw/riscv/sifive_u.c     | 3 ++-
 hw/riscv/spike.c        | 6 +++---
 hw/riscv/virt.c         | 8 ++++++--
 include/hw/riscv/boot.h | 3 ++-
 6 files changed, 18 insertions(+), 11 deletions(-)


