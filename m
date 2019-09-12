Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66F4B1502
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 22:02:20 +0200 (CEST)
Received: from localhost ([::1]:38596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8VIJ-0002ET-Em
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 16:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i8VFk-00010m-Er
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 15:59:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i8VFj-0005Ig-7G
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 15:59:40 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:32894)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i8VFj-0005IQ-1m
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 15:59:39 -0400
Received: by mail-qk1-x741.google.com with SMTP id x134so25784631qkb.0
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 12:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=wXb4is2uK6GCLu5M1T/d7eeVXuQ94DJJKjFIIm804Vw=;
 b=SjNzScGjtxhekitLod7KOb+1XS618Gqk2Aoyyp/242NHT41aomM0gb6yCxdTflzVpp
 CJJ4Rd02yYnI2wcKHd7MAaXt+fc80uVnk5xUkcFBdKVbuc6X3IzCxNSHYaQgxD7leNII
 e51GrPyILDQ6YLcv7zRYcGtBNN6tlZqEQoC/mtImcbFwabNKgBw4zGDNsUvIWR7sbCij
 mHQ/O/v2ozQdUhcbdrtQVGVv3ajDAYv7gVCdJuAogZVB8mDbM+xE/zD/S7eR051drw8F
 c8kqV0+oChdZSYNwK+UosRTycU+bFjTo3pXO7Uh4sRLcLi7CXjRCjZu6EL2lD6Efpjky
 RbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wXb4is2uK6GCLu5M1T/d7eeVXuQ94DJJKjFIIm804Vw=;
 b=PlVtQ7pGmwfndQxp0t9qR+BRQ5y5KaWDp7NTnROqOq12ZPrJY6sPAKlo/dLhPmnE+a
 XQRDL8MUIROz/VkSRffOopNkK+S1vFcbWmim6hC8P7METNVQK8AfWBqVvB0voMN0scly
 8CmoiwRAKQcXVky0tZ+BJ392UzYv8wIhmuxi63g4Uz/Ubw6jSf0wyPo8deBI1Y3PBs9Z
 Lbv6CODNJpk2wCWS5wAvFL178VvsiQ6WAQCNAyjxvmJi59nyUnjrgS9KtrW47kqbcq/p
 ovnEwuj5zg2yLQnVfn2qNxSkBanHUig137qxke30pYLggEusjk6nvO7jxwaAsJKBUqZl
 2JNg==
X-Gm-Message-State: APjAAAVKlNNoSmhHaQfW4t4PEJVb9lti5Fgp6Ok6NEDAkSWNgqRnvy3O
 nzwnQIbrHslby80c9T3bA979Esdv3/4Zvg==
X-Google-Smtp-Source: APXvYqyLVT5cKy8F+Lb1vdcJy9ZZ+3x6hAhfPv1r08cjmn+DbzyfqCKc+Yg5WXeFcGnsJX9aBulQsQ==
X-Received: by 2002:a37:682:: with SMTP id 124mr42396438qkg.393.1568318377156; 
 Thu, 12 Sep 2019 12:59:37 -0700 (PDT)
Received: from localhost.localdomain ([67.69.50.154])
 by smtp.gmail.com with ESMTPSA id k11sm11140897qtp.26.2019.09.12.12.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2019 12:59:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 12 Sep 2019 15:59:31 -0400
Message-Id: <20190912195934.13502-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
Subject: [Qemu-devel] [PATCH v2 0/3] cputlb: Adjust tlb bswap implementation
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
Cc: tony.nguyen@bt.com, mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes from v1:
  * Move QEMU_ALWAYS_INLINE to qemu/compiler.h.
  * Rename some inline wrapper functions.
  * Don't break TLB_NOTDIRTY in patch 3.

Blurb from v1:

The version that Tony came up with, and I reviewed, doesn't actually
work when applied to RAM.  It only worked for i/o memory.  This was
the root cause for

https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg00036.html

I tried a couple of different approaches in load/store_helper, but
this is the one that didn't affect the normal case -- a simple tlb
miss against (non-swapped) ram.


r~


Richard Henderson (3):
  cputlb: Disable __always_inline__ without optimization
  cputlb: Replace switches in load/store_helper with callback
  cputlb: Introduce TLB_BSWAP

 include/exec/cpu-all.h  |   2 +
 include/qemu/compiler.h |  11 ++
 accel/tcg/cputlb.c      | 235 ++++++++++++++++++++--------------------
 3 files changed, 132 insertions(+), 116 deletions(-)

-- 
2.17.1


