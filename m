Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A75D1895A4
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 07:22:30 +0100 (CET)
Received: from localhost ([::1]:45818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jES61-0004FV-5b
	for lists+qemu-devel@lfdr.de; Wed, 18 Mar 2020 02:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48060)
 by lists.gnu.org with esmtp (Exim 4.90_1) (envelope-from
 <31b1xXgMKChIAuEy66y3w.u648w4C-vwDw3565y5C.69y@flex--scw.bounces.google.com>)
 id 1jES4o-0003nk-3w
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 02:21:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from
 <31b1xXgMKChIAuEy66y3w.u648w4C-vwDw3565y5C.69y@flex--scw.bounces.google.com>)
 id 1jES4n-0006UF-2V
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 02:21:14 -0400
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:34738)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from
 <31b1xXgMKChIAuEy66y3w.u648w4C-vwDw3565y5C.69y@flex--scw.bounces.google.com>)
 id 1jES4m-0006JP-St
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 02:21:13 -0400
Received: by mail-qk1-x749.google.com with SMTP id x126so24625791qka.1
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 23:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=CWjRM8vQ8PSD6PKVGhts0LRZagevUK5YxEAYBbRPga4=;
 b=vcWqLls8/IZ/8NdZ/i0Zh0jtvuALLYHk3ysbruaiq4w72IQdjwqTdmj/9pT7QMcuKj
 Lbk8CnvbmpVgr5K5EAN27B4l4WxPIqdBtZXo6RM2fxeSY2TF3yL+w3+d5ByVEaS0G95h
 eszkJn/cqqj1C8qSz4Hi4uHe2B5RI//erK2K/IYFjPqMNnYWyPIhoePDRgjFnsCcqm4J
 iWirN85xpXUHQ6wyv/b+g8+6pSPi3VN0l3ORI6NfHeLHVnieSLA0CvV2fbC9J5usk4UE
 QQJUeoIG7JgQBgOFzYBDVggJddwoSkgSorfJ3zlXLp+obxOT259LJ/ME41UL4LYRyeed
 q3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=CWjRM8vQ8PSD6PKVGhts0LRZagevUK5YxEAYBbRPga4=;
 b=sTzHhU0Ww8mM083BBHERzbxXA7kh+EOqxrntACy5ePwsI6PYBWrfl0pKO44s27vIjj
 KrDmdiaoXWyQpHQNOGdQmWRrqAmeRH8H+foupVxVREO8/zaaEYtXz9c1YfyzcKxVEQkR
 cBnLryrFV5vXtccv+rH57RtfelpSpfLUC+h26B4lx+96FYGZz9o9lo+WPJSvpVVc4eg4
 dTcnxsN8IOAoOcj0u+61b8CJwVTGw/dDeDSxz761wFSKRSfERBIWNdfXMchysTqdlaNo
 ZYcmlW07vvZ0lfRbmmUPStM4F73Nl9vHPHZH4B3j1EMCwnfdQ8GnrLgMyqoPPS0SXIt/
 /QjQ==
X-Gm-Message-State: ANhLgQ0fy5WtSzHh3fiD4joq+Whve3hn4E7CHtviB3ORCoe00i0AlsTh
 mNC8raO6NNDDeNRfpB8xYwhsIYM=
X-Google-Smtp-Source: ADFU+vv4RlNsjX4hWJ6aSvvgHt0eTV3M+ZXYbxFdKcG+C3j5ccjNEMEoCYgdxDSZWnJAKsHM8NdiU6c=
X-Received: by 2002:ac8:23fa:: with SMTP id r55mr2902123qtr.131.1584512469836; 
 Tue, 17 Mar 2020 23:21:09 -0700 (PDT)
Date: Tue, 17 Mar 2020 23:20:57 -0700
Message-Id: <20200318062057.224953-1-scw@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH] Makes softmmu compile with clang at HEAD
From: Shu-Chun Weng <scw@google.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Shu-Chun Weng <scw@google.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::749
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

With clang at HEAD, linking fails with "undefined symbol:
qemu_build_not_reached". It's because `store_helper` and
`helper_ret_stb_mmu` are mutually recursive and clang inlined latter
inside the former, making `store_helper` a recursive function and no
longer fully inlineable preventing constant propogation.

Signed-off-by: Shu-Chun Weng <scw@google.com>
---
 accel/tcg/cputlb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e3b5750c3b..a7c812ed72 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -2050,6 +2050,7 @@ store_helper(CPUArchState *env, target_ulong addr, uint64_t val,
     store_memop(haddr, val, op);
 }
 
+__attribute__((noinline))
 void helper_ret_stb_mmu(CPUArchState *env, target_ulong addr, uint8_t val,
                         TCGMemOpIdx oi, uintptr_t retaddr)
 {
-- 
2.25.1.481.gfbce0eb801-goog


