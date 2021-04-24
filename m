Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB7F36A21E
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:31:13 +0200 (CEST)
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLBT-0001UW-GE
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKig-0005jo-GP
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:22 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:40864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiE-0004JI-Lt
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:22 -0400
Received: by mail-io1-xd29.google.com with SMTP id e186so1610407iof.7
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y9AQJRvMtMdTIZnD3mQV1ThnImiIAURk0S2tBBlFFtk=;
 b=TfphHh3fnx2THVKxOa8XVbyRhxtfjOzj7VTzgiCJhrYwaI43ljmUG1Zjgh3PYFi4KB
 eGrbxq4tcgCXNwEoQWFeJtvaGWeI9oWvkThxpEb9typdS9ItYTjgB/vE9msTeMVrToJa
 6U8MzvrYRVav6GMICdIIky40+v/6js+3ZYnt450rj7O1QfpYt0pI/200esFkhW2HyyJl
 Qrx9aDP9BBOaMv8qFHPFdgW7I+mhj4Jq/YhA+3J5xSAWx8sdycA7xvIV5m2L1QyAcX2Z
 PdwbtRv8AYwtSVqDSwYJ1s/vj1Sm8f9vbO7SgzmZtsTghg6fnfJisn13p+trlySb2TDa
 fTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y9AQJRvMtMdTIZnD3mQV1ThnImiIAURk0S2tBBlFFtk=;
 b=H59EdnP0MgwHlncz44R0gHK+7wwuVUC2v1/fsk8TipXrDj0bN7VX9r3VUPasg737+A
 Qs649/s13DWraOfIgZ8G+TwlGTDT3TJM+9nzxJ94F1G8Ovu4mQqIfpzP6+uXBTURO9du
 I+wSGdmVp/ppm0NaNNduCVjKK6/uPKi7FSo8b/GfGnXEMxxEbBDgdaPDew4kYvJmh/YJ
 rtAGlGFlu8xRKIzuHeQfE/tuUeuPUWg5JmFSYKluk7qW5vMT3IXU1qYU06KL59HrX4C4
 rOmjasovTVzR4wT8ZuAqslnByFM5xkCJ4jmX4L8MXjvm1AEUTqpcWVptFFtVh2N4KxqH
 En0A==
X-Gm-Message-State: AOAM531k8sP1+Wl4tLCDwolOz/cMma4dIZI5XsyEEnF45imbVNbeBYlp
 uZ9ZShJA3Odk0+g/fdVt9R+Y39prVYfgs8Zl
X-Google-Smtp-Source: ABdhPJywEhrAa/3s2x3QbZ40twqvlwh57wQfRZwgtYybtoy2zo45lKshsl9suY/UvKSwEOVR+/ptUA==
X-Received: by 2002:a02:9643:: with SMTP id c61mr8290930jai.124.1619280053436; 
 Sat, 24 Apr 2021 09:00:53 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:53 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/48] bsd-user: style tweak: remove spacing after '*' and
 add after }
Date: Sat, 24 Apr 2021 10:00:00 -0600
Message-Id: <20210424160016.15200-33-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
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
 bsd-user/qemu.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 5a82722281..de20e8329a 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -124,19 +124,19 @@ struct linux_binprm {
         int argc, envc;
         char **argv;
         char **envp;
-        char * filename;        /* Name of binary */
+        char *filename;         /* Name of binary */
 };
 
 void do_init_thread(struct target_pt_regs *regs, struct image_info *infop);
 abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
                               abi_ulong stringp, int push_ptr);
-int loader_exec(const char * filename, char ** argv, char ** envp,
-             struct target_pt_regs * regs, struct image_info *infop);
+int loader_exec(const char *filename, char **argv, char **envp,
+             struct target_pt_regs *regs, struct image_info *infop);
 
-int load_elf_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
-                    struct image_info * info);
-int load_flt_binary(struct linux_binprm * bprm, struct target_pt_regs * regs,
-                    struct image_info * info);
+int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
+                    struct image_info *info);
+int load_flt_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
+                    struct image_info *info);
 
 abi_long memcpy_to_target(abi_ulong dest, const void *src,
                           unsigned long len);
@@ -246,7 +246,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
         break;\
     default:\
         abort();\
-    }\
+    } \
     0;\
 })
 
@@ -270,7 +270,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
         /* avoid warning */\
         x = 0;\
         abort();\
-    }\
+    } \
     0;\
 })
 
-- 
2.22.1


