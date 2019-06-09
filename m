Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DE13A466
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jun 2019 11:08:21 +0200 (CEST)
Received: from localhost ([::1]:34568 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZtoJ-0005R6-Vm
	for lists+qemu-devel@lfdr.de; Sun, 09 Jun 2019 05:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33361)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <lucienmp.qemu@gmail.com>) id 1hZtnL-000519-K9
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 05:07:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lucienmp.qemu@gmail.com>) id 1hZtnK-0007PK-NE
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 05:07:19 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:41543)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <lucienmp.qemu@gmail.com>)
 id 1hZtnK-0007Ou-HY
 for qemu-devel@nongnu.org; Sun, 09 Jun 2019 05:07:18 -0400
Received: by mail-pg1-x544.google.com with SMTP id 83so3409980pgg.8
 for <qemu-devel@nongnu.org>; Sun, 09 Jun 2019 02:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=PjdNmZrR6OjtG5qlkwnMVYBO99frhv4oSNKd5NeeYIo=;
 b=SB34dUVB4nj0+sJ/l9MP3cgWePaRSNcmQsU0q5YVA6ZBw/j4Vp+DqDc9Zu17UmyXjn
 7ZsPo2EUSpDjpvEwnfQvbIQRogmddOXFZ8XfTgB9pRUA30PUe3vVPfI4heo4T+ul9cvw
 Amd4hKKNdoQ0GzjwOtGFHuwMx+AOgtoenmCAnFbp+fFj/LnRq7Tsb0TbaERytMYAadoR
 poIo5UTkFyA3hqjAhQpcDuwvy6aJcH2QC2stVAcCMwcngDSHq+3kZqnlbQb9LnaFV4/M
 0TI0Ds69cWy/LZGMi/PUhVozAQfTholl5q5pL4epbAYvN4gLBpEZ7ztA8QdSI/x80SSN
 PLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=PjdNmZrR6OjtG5qlkwnMVYBO99frhv4oSNKd5NeeYIo=;
 b=Q7EGMY2Nw9wApxBinGCCpQjYMfq65ymz9Q4PQjxaHx7kFanfozDhOxlqXsFpAJYekb
 HgYstarxYcIBn7IQRzSiCx1klu8zdjQ0ao5v3nDY6l7SDZjc7/KEQCl8wnpBOU57l5mt
 DwUF8QjjnPOEtOC1Eg42n6bc0sEUt+FplAEWPi2ht3ovs/LOc1wgeS3MO9mj8tI3RS/u
 Z0EgrH7jjBwm7ubaHG2UVhu22onFky52uR2Ds1bKNk6NtX0kL0Iox1TgFN0hXl7p6f7C
 ZVdB6IRT+YdFZGi+dFsJdkaESofQPgAT6AU39/lWchCQkzq0vDGEKy6HXQ4lMlvsdcSQ
 tdFA==
X-Gm-Message-State: APjAAAUfB+lblLnaZW3OLRHNjXIOvK0/RKCpe03HQaPNKLcnUlG6dnwD
 Nv0Y+J7GFvDUFIAG1lqNpGC9E9vL
X-Google-Smtp-Source: APXvYqxnf7hMnxAtTcpm01y7bO5mE8w5UQUcfXAScO98YsNI2PDgFHd6uSE2kpe7lgJu4h2SlEwYtA==
X-Received: by 2002:a65:56cc:: with SMTP id w12mr10659632pgs.415.1560071236935; 
 Sun, 09 Jun 2019 02:07:16 -0700 (PDT)
Received: from localhost.localdomain (i60-43-49-30.s30.a048.ap.plala.or.jp.
 [60.43.49.30])
 by smtp.gmail.com with ESMTPSA id f17sm6256328pgv.16.2019.06.09.02.07.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 02:07:16 -0700 (PDT)
Date: Sun, 9 Jun 2019 18:07:13 +0900
From: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
To: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Message-ID: <20190609090713.GA14864@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-devel] [PATCH v2] The m68k gdbstub SR reg request doesnt
 include Condition-Codes
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

The register request via gdbstub would return the SR part
which contains the Trace/Master/IRQ state flags, but
would be missing the CR (Condition Register) state bits.

This fix adds this support by merging them in the m68k
specific gdbstub handler m68k_cpu_gdb_read_register for SR register.

Signed-off-by: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
---

Notes:
    v1->v2
      - remove superfluous braces from my additional code
      - slightly amended the commit message

 target/m68k/gdbstub.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/m68k/gdbstub.c b/target/m68k/gdbstub.c
index fd2bb46c42..5e5aef5c0f 100644
--- a/target/m68k/gdbstub.c
+++ b/target/m68k/gdbstub.c
@@ -35,8 +35,10 @@ int m68k_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
         return gdb_get_reg32(mem_buf, env->aregs[n - 8]);
     } else {
         switch (n) {
-        case 16:
-            return gdb_get_reg32(mem_buf, env->sr);
+        case 16: {
+            /* SR is made of SR+CCR, CCR is many 1bit flags so uses helper */
+            return gdb_get_reg32(mem_buf, env->sr | cpu_m68k_get_ccr(env));
+        }
         case 17:
             return gdb_get_reg32(mem_buf, env->pc);
         }
-- 
2.21.0



