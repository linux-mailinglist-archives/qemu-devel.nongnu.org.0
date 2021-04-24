Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B13136A20E
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:21:53 +0200 (CEST)
Received: from localhost ([::1]:40960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laL2W-0006JV-Nl
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiA-0005ah-Gq
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:55 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:36831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhz-0004EV-Jc
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:50 -0400
Received: by mail-io1-xd31.google.com with SMTP id g125so3394816iof.3
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IrZsTXapOHjyeE4p1RaLMUoR1OTIYLnNpiXIDlmyhWw=;
 b=oO9PYnrj3RYyOmBC0+tRy0dtcDlxZ0RhGEp86dHZ50WJlOdzqPoGbGvIvZKdvZDso8
 WhaTqEBiGgYjX8pOealEaRumoIZmOPerQBngrFE8pwfGgeX0M/jyGCnQ3ToTfiF5rzqo
 JVRjwdiKUivikv8MRRr+dFzfxK6ppGcJhb2qI9kjbCSWgallHjw8utDvF6G6CEBacGjW
 sv/y43kCv4u3x+sAVDoDB8uHATTIeZ3UcX0TtRZjzvM+TQPuL7O3sf5aLT5nsJV9wnbM
 nFPkEvijUvQQeUUS4KuWiYgFLFBqM0bZjAMmD+7f4gO3kqgLuIkzOOGHJm2k0xJRn2vw
 uoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IrZsTXapOHjyeE4p1RaLMUoR1OTIYLnNpiXIDlmyhWw=;
 b=mqun7nHKL5q5u81PdsKABa2X3pE6yG9P9WSxNg7vuxJrJUKQPujFMprOu33maZ5hFn
 NbPxVZB1XdDfR0MB2VuEzVOURckKq0qpIGB1d99uBsodAzi1ZbjejTI+2wggLuL/xz2N
 Cfl0VEO+DARnOvs28yxBmTrrOpso9IOY6geWk1Tn2uFU9g8moXyMCX4iobeL+o0iiyqM
 VDjNArEyVSyFszS3KNir0jk8FQLSFrufvzIQR457m4hmlcr1qGQckiBDZQPz5YiUTtFs
 KX+pLD60OJg6thJL45c6DpHcgKF4ZPu2kldicRj3PFmoznunSebcmJrlSJNoDxjSs2Ou
 WVUQ==
X-Gm-Message-State: AOAM530WPW4cBUEUiY+TA+wVidsRT0xyGr7E+tnI9rC7U1pxn01ZXURJ
 4WB6jIjhCSWSIcNcB/cQoPXr72KbRUJIMv2i
X-Google-Smtp-Source: ABdhPJyRZXTEKhUh/YaS9X0/lsg45TqFdraueXkCKtl3BNMsYiDg2WJ2C7CZ+1Mgz+5C0VFO7zibiA==
X-Received: by 2002:a02:c76c:: with SMTP id k12mr8344904jao.58.1619280038244; 
 Sat, 24 Apr 2021 09:00:38 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:37 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/48] bsd-user: style tweak: Remove #if 0'd code
Date: Sat, 24 Apr 2021 09:59:42 -0600
Message-Id: <20210424160016.15200-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/x86_64/target_syscall.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/bsd-user/x86_64/target_syscall.h b/bsd-user/x86_64/target_syscall.h
index a8e6274b76..ec99354e15 100644
--- a/bsd-user/x86_64/target_syscall.h
+++ b/bsd-user/x86_64/target_syscall.h
@@ -59,27 +59,12 @@ struct target_pt_regs {
 #define TARGET_GDT_ENTRY_TLS_MIN 12
 #define TARGET_GDT_ENTRY_TLS_MAX 14
 
-#if 0 // Redefine this
-struct target_modify_ldt_ldt_s {
-	unsigned int  entry_number;
-        abi_ulong     base_addr;
-	unsigned int  limit;
-	unsigned int  seg_32bit:1;
-	unsigned int  contents:2;
-	unsigned int  read_exec_only:1;
-	unsigned int  limit_in_pages:1;
-	unsigned int  seg_not_present:1;
-	unsigned int  useable:1;
-	unsigned int  lm:1;
-};
-#else
 struct target_modify_ldt_ldt_s {
 	unsigned int  entry_number;
         abi_ulong     base_addr;
 	unsigned int  limit;
         unsigned int flags;
 };
-#endif
 
 struct target_ipc64_perm
 {
-- 
2.22.1


