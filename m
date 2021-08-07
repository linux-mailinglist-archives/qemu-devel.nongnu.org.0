Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617923E3525
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 13:11:43 +0200 (CEST)
Received: from localhost ([::1]:56030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCKEw-00034B-F2
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 07:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCKDC-0000k7-B2
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 07:09:54 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mCKD6-0001az-8j
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 07:09:54 -0400
Received: by mail-wr1-x432.google.com with SMTP id n12so4460147wrr.2
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 04:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=szBGIE3QBxffTDAnfy8t7Wr6ZIyLbiyej1TuYcKCd9c=;
 b=jXOpWa+rjOLJ+1AiIu1kT9a4yfCERR1+hsFKQq1fCxAQJeDpNhaK1nF+vNCpWqi2Xg
 Ds3/+tRNGf1M8rNWxzANnWu7VtR+OGrAgHwtXxRE/wsrxecRmWuWJQIidPxaTLxJmE8G
 d6l1PcTA7R/1u9uMHavcz7HtExOVLC08TmKdyDimnA4RIG4bDGEHMP8CymLpoV0Re27+
 lIR8d1EuLj5TW2ejGOSr4pjay45TvUv6/6b7p2Rp/6xIEJm8y+xLSPHQxte+Am0pDfVt
 O9nikA9JLB9SKWycZmAmlex90ukRRjlh8idGa9iov4FlGNuUot7zOrBrKKUeuCgPwQMb
 cnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=szBGIE3QBxffTDAnfy8t7Wr6ZIyLbiyej1TuYcKCd9c=;
 b=A4llA5eCtL/BF/MQuGFBjFXio9AT3NjYWNJw95NY6nkemCbNWHwUBKIuA39L7yBTjo
 WMqFM/ZDZ82PVIwBKbjBt3EDQjZB/IDAky38ML3+hjodA95KWi1xjwLSb95bpRd7/7Zt
 18fpIlPFSH4esoalhFm7FITK0UmKLFu4mySoctr6QHzP0tpAL/mkGTjgUpOggVz+32Wm
 T/ilBrYgRWTQzg7jjZgZT+K0ClXiTYhFtbNT5AmMfrdCuRtL5pHxVr2ooYmlJJjgMtLF
 Tl2VbPVaa+5bXoXOvYs5kD7bS6nuUGAQhEgKALyPvFhWDzNPdl/YOpRTgpgh6RWF6yvT
 gVyA==
X-Gm-Message-State: AOAM532Ty3GVWr1L5qel39Ca5RYIJfLY6LDTdijbOm4kpm6jr9APcLdD
 NbgYmtjZ3atg7BTxX+zUO1nBcO4Yp68Mg+Knl9Y=
X-Google-Smtp-Source: ABdhPJwKcXeteKvUCk69vR4GI0rI31KAUh5b36Ticr7MG4g7WpD+3eJ9wDL/1RPk66qJ+mCzI7DwhQ==
X-Received: by 2002:a5d:6e12:: with SMTP id h18mr15432593wrz.236.1628334586546; 
 Sat, 07 Aug 2021 04:09:46 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 g6sm1312685wmq.42.2021.08.07.04.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 04:09:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 1/2] disas/nios2: Fix style in print_insn_nios2()
Date: Sat,  7 Aug 2021 13:09:38 +0200
Message-Id: <20210807110939.95853-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210807110939.95853-1-f4bug@amsat.org>
References: <20210807110939.95853-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to modify this function, fix its style first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 disas/nios2.c | 53 +++++++++++++++++++++++++--------------------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/disas/nios2.c b/disas/nios2.c
index c3e82140c79..d124902ae3e 100644
--- a/disas/nios2.c
+++ b/disas/nios2.c
@@ -3482,38 +3482,37 @@ static int
 print_insn_nios2 (bfd_vma address, disassemble_info *info,
 		  enum bfd_endian endianness)
 {
-  bfd_byte buffer[INSNLEN];
-  int status;
+    bfd_byte buffer[INSNLEN];
+    int status;
 
-  status = (*info->read_memory_func) (address, buffer, INSNLEN, info);
-  if (status == 0)
-    {
-      unsigned long insn;
-      if (endianness == BFD_ENDIAN_BIG)
-	insn = (unsigned long) bfd_getb32 (buffer);
-      else
-	insn = (unsigned long) bfd_getl32 (buffer);
-      return nios2_disassemble (address, insn, info);
+    status = (*info->read_memory_func)(address, buffer, INSNLEN, info);
+    if (status == 0) {
+        unsigned long insn;
+        if (endianness == BFD_ENDIAN_BIG) {
+            insn = (unsigned long) bfd_getb32(buffer);
+        } else {
+            insn = (unsigned long) bfd_getl32(buffer);
+        }
+        return nios2_disassemble(address, insn, info);
     }
 
-  /* We might have a 16-bit R2 instruction at the end of memory.  Try that.  */
-  if (info->mach == bfd_mach_nios2r2)
-    {
-      status = (*info->read_memory_func) (address, buffer, 2, info);
-      if (status == 0)
-	{
-	  unsigned long insn;
-	  if (endianness == BFD_ENDIAN_BIG)
-	    insn = (unsigned long) bfd_getb16 (buffer);
-	  else
-	    insn = (unsigned long) bfd_getl16 (buffer);
-	  return nios2_disassemble (address, insn, info);
-	}
+    /* We might have a 16-bit R2 instruction at the end of memory. Try that. */
+    if (info->mach == bfd_mach_nios2r2) {
+        status = (*info->read_memory_func)(address, buffer, 2, info);
+        if (status == 0) {
+            unsigned long insn;
+            if (endianness == BFD_ENDIAN_BIG) {
+                insn = (unsigned long) bfd_getb16(buffer);
+            } else {
+                insn = (unsigned long) bfd_getl16(buffer);
+            }
+            return nios2_disassemble(address, insn, info);
+        }
     }
 
-  /* If we got here, we couldn't read anything.  */
-  (*info->memory_error_func) (status, address, info);
-  return -1;
+    /* If we got here, we couldn't read anything.  */
+    (*info->memory_error_func)(status, address, info);
+    return -1;
 }
 
 /* These two functions are the main entry points, accessed from
-- 
2.31.1


