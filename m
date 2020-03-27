Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BE0195471
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 10:52:48 +0100 (CET)
Received: from localhost ([::1]:39268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHlfT-0008M2-KJ
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 05:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jHlcf-0003S4-Q2
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:49:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jHlce-0003qu-O2
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:49:53 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:50572)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jHlce-0003mk-Ho
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 05:49:52 -0400
Received: by mail-wm1-x341.google.com with SMTP id d198so10762426wmd.0
 for <qemu-devel@nongnu.org>; Fri, 27 Mar 2020 02:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MRho6ym8/n7glDorOggjQNgMqNACH9d0SZZCdvsJXcA=;
 b=YqqpBCqGWUuz4esSzlaJ/LOkDIrsO/k9URAz+7XBmpN8zuOdeuziyD1gMJuOQs/m9N
 Jmoxn+q+eSyKKMYruQNpjDmTK2DqFSO3j27IQ7vB71sUp1Ce75qAR3eylWdg09V5tK/9
 cjzIyyrcvFMWnu+gZkbA5fQk0zpQkvAOXFxbOF1rf0LY6KJtpSLw/UYKd5qZHEnnJaoO
 rPuIpCF6HP19zJSYufyCh7QZZSQW5wl/mIh19t6uacjx7d04ugGU3iqFa4Y2QICoUNI/
 7wAQ5tNffljLWyFx4Ytgn1M31AWrcarl3aAF9td5Lh4ddiiz1s8z3sUw0O/iK3VbwVyt
 bw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MRho6ym8/n7glDorOggjQNgMqNACH9d0SZZCdvsJXcA=;
 b=fDKB+a22Sz6dUTWz+soFn0YP4Mb6Wi0Dl3KOGdyUO6JYGaa8KuFX1ozGCAWcKFcTPI
 0rHvmUBaXdqnFEMtMV0f+zH/yufeqS5W4re9P8ZNAHh0fAPOb921OEmIainuYW+yCwX7
 hsaKA7H3d2KYxX8lEEtYu3tkhviIw2e0gwmsRW335/eHG66AwUKBWfXc8ptycHjFwe8W
 wUianfi0xsMJL/ugAuneslbUgiRAMtOpvkwtBdgMPbag+qOcft02tp6y22EYRjPeaJNR
 E95Hyce/9fowKiJRLUdp/p3F+4GcU9Swq95v/4hLv4XHclT94bNz5/z/fZxGhtFDMNzm
 yXdA==
X-Gm-Message-State: ANhLgQ2MkiuUI+i5zAQWlJ3XSWL5/wxDe+XShvdzf/WZNG6jthwNfCFQ
 IKfZJ+/ohwVIPd0TV4zFt34amg==
X-Google-Smtp-Source: ADFU+vv0y8cHjEZwtVaugr4r5pyXhQ/ywlDjAqnVS4csvbnVAnLTyDtuzDksh7O9nu9HqCpfdtFjPQ==
X-Received: by 2002:a1c:2489:: with SMTP id k131mr4653873wmk.86.1585302591454; 
 Fri, 27 Mar 2020 02:49:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p3sm7685088wrj.91.2020.03.27.02.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 02:49:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BE7E01FF90;
 Fri, 27 Mar 2020 09:49:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 4/7] linux-user: more debug for init_guest_space
Date: Fri, 27 Mar 2020 09:49:42 +0000
Message-Id: <20200327094945.23768-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200327094945.23768-1-alex.bennee@linaro.org>
References: <20200327094945.23768-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Searching for memory space can cause problems so lets extend the
CPU_LOG_PAGE output so you can watch init_guest_space fail to
allocate memory. A more involved fix is actually required to make this
function play nicely with the large guard pages the sanitiser likes to
use.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/elfload.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 8198be04460..619c054cc48 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2172,6 +2172,8 @@ unsigned long init_guest_space(unsigned long host_start,
 
         /* Check to see if the address is valid.  */
         if (host_start && real_start != current_start) {
+            qemu_log_mask(CPU_LOG_PAGE, "invalid %lx && %lx != %lx\n",
+                          host_start, real_start, current_start);
             goto try_again;
         }
 
@@ -2240,7 +2242,11 @@ unsigned long init_guest_space(unsigned long host_start,
          * probably a bad strategy if not, which means we got here
          * because of trouble with ARM commpage setup.
          */
-        munmap((void *)real_start, real_size);
+        if (munmap((void *)real_start, real_size) != 0) {
+            error_report("%s: failed to unmap %lx:%lx (%s)", __func__,
+                         real_start, real_size, strerror(errno));
+            abort();
+        }
         current_start += align;
         if (host_start == current_start) {
             /* Theoretically possible if host doesn't have any suitably
-- 
2.20.1


