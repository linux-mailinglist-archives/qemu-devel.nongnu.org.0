Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFB1AF412
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 03:47:11 +0200 (CEST)
Received: from localhost ([::1]:45908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7riv-0002uQ-Uz
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 21:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i7rfr-0001gP-AZ
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 21:44:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i7rfp-0000Zx-Q4
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 21:43:58 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:37199)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i7rfp-0000Ze-I0
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 21:43:57 -0400
Received: by mail-qt1-x834.google.com with SMTP id g13so22861336qtj.4
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2019 18:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=bkaE0sxjH371pRpyRTfRvjINBlDRaw+OXT0I0T1L0bc=;
 b=zAAQ6TL1K6YT4bAI74kJNivazz0oOCjHQxRjLgk/yd6r+Zpx0Sy/46rB6pBPXmUtLS
 G1nV2JDmMY1KDh0XveyCyOQXoCDzBkYfPmZz1lXRKC3v5AeJNKB+RZnvb0eQqFWxXrWb
 k9Xu95/EmNBjmVyizhGAf9pcVsE4JjVAmAC0DvBzJ4+ykI9/7BiAM1s/t6coZhdpm8h7
 UZSDyPoHwYfVaCUJkwRIvEmexsnRLQDy1Cg7Asg+DNfpN2iAoFknvuDmzpDvJjpRwGPg
 mADRCnfHB/n025MHHhFLOs92QwUaUaZbZ7RJMoNLOC1Aabt6uZLEgTy7SiMcFCw8hEQv
 Iwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bkaE0sxjH371pRpyRTfRvjINBlDRaw+OXT0I0T1L0bc=;
 b=TSRZ15WEkLkSlL7NK/TJR3ZOrdqB5qz2ZUb0ViLSDwBusfYpSgefNObi6uyLae9n9c
 6OxTfmd+/aC68oVjZKwJI8IUI3oRJja0DhPxL55RaDRBn0p0R+NoYuni9XuUrn37lqoc
 sXIPa3njJk/8Oy6om9IPpaoi2VacA5vhJ6+M54pXmaU04z+k9VayY3Ac8oisAZGRd/lL
 RqHZnPG0CleBUWpFLtuXEO1n9KfdfDZWmCT/RyEH9MV83PCFhkKkFC5cdQxNiysHUAAa
 7Kzlb/mLD4UlZKGtPdA4dFoiMzfSAfi8fQzmCR35/dAB5/kqO/AKR2ZsYYYfE7ffsko5
 S8Cw==
X-Gm-Message-State: APjAAAV4IWIC9br0Ck3SqLgRwyWPLC8k3Rz3eabWUSvLCK3nv7n/3Lfy
 H47pZdD0lENQsqwvIRK5+xFKaVBQEg81DQ==
X-Google-Smtp-Source: APXvYqzr35ClFpKx7GE44iPEvrNWXrkNnH2Ma/U8RNgC6cvPbJA5eFhfOlBY8TBP95/v1FlaxcstNQ==
X-Received: by 2002:ac8:6d03:: with SMTP id o3mr31094607qtt.97.1568166235863; 
 Tue, 10 Sep 2019 18:43:55 -0700 (PDT)
Received: from localhost.localdomain
 (otwaon236nw-grc-01-64-229-69-35.dsl.bell.ca. [64.229.69.35])
 by smtp.gmail.com with ESMTPSA id a14sm10074676qkg.59.2019.09.10.18.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 18:43:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 21:43:50 -0400
Message-Id: <20190911014353.5926-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::834
Subject: [Qemu-devel] [PATCH 0/3] cputlb: Adjust tlb bswap implementation
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk, tony.nguyen@bt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The version that Tony came up with, and I reviewed, doesn't actually
work when applied to RAM.  It only worked for i/o memory.  This was
the root cause for

https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg00036.html

I tried a couple of different approaches in load/store_helper, but
this is the one that didn't affect the normal case -- a simple tlb
miss against (non-swapped) ram.

This is able to boot the solaris 7 notdirty_mem_ops reproducer til
it panics due to no root file system, whereas before it would not
make it to the SunOS banner.

OpenBIOS for Sparc64
Configuration device id QEMU version 1 machine id 0
kernel cmdline 
CPUs: 1 x SUNW,UltraSPARC-IIi
UUID: 00000000-0000-0000-0000-000000000000
Welcome to OpenBIOS v1.1 built on Aug 25 2019 18:20
  Type 'help' for detailed information
Trying cdrom:f...
Not a bootable ELF image
Not a bootable a.out image

Loading FCode image...
Loaded 5936 bytes
entry point is 0x4000
Evaluating FCode...
open isn't unique.
SunOS Release 5.7 Version Generic_106541-06 [UNIX(R) System V Release 4.0]
Copyright (c) 1983-1999, Sun Microsystems, Inc.
WARNING: Interrupt not seen after set_features
Cannot assemble drivers for root /pci@1f,0/pci@1,1/ide@3/cdrom@2,0:b
Cannot mount root on /pci@1f,0/pci@1,1/ide@3/cdrom@2,0:b fstype ufs
panic[cpu0]/thread=10404040: vfs_mountroot: cannot mount root
skipping system dump - no dump device configured
rebooting...
BOOTpanic - kernel: prom_reboot: reboot call returned!
EXIT
0 > 


Richard Henderson (3):
  cputlb: Disable __always_inline__ without optimization
  cputlb: Replace switches in load/store_helper with callback
  cputlb: Introduce TLB_BSWAP

 include/exec/cpu-all.h |   2 +
 accel/tcg/cputlb.c     | 245 ++++++++++++++++++++++-------------------
 2 files changed, 131 insertions(+), 116 deletions(-)

-- 
2.17.1


