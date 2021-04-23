Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9044369B92
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:51:36 +0200 (CEST)
Received: from localhost ([::1]:43814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2lz-0002a8-Qf
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2ag-0005IU-Jd
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:54 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:34484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2ac-0007yH-KX
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:54 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so46389411otn.1
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3BGZ+7tsHEG8xoaKjUuLTzOOqi2eIKPJ+v4sZivJARQ=;
 b=S+4uUGp7nUAUtYZu2t0wn5jMg4IrLt6elgSylMx/BD9C80GWwNp6MTU7VqEklCpFEk
 Is7fbaWQXpYRIjok+rItb36FpDbfyoRdbJQCc8hcNJPiY4f1CuclLmtIhbMqx8PJKjrD
 TXQ8YXNP9q8ePpexUbt9hXMXNtQXtJXvbnxXluxJBF60kxlRzHYrqJLiIHpE//oVJY1o
 jQ/iBzTzA8VqDY7GGCbI7djCM/MkGqWYgBMUYXMaCQapMD0Lgup/DmJKqBrQg6QhhpXT
 v2TTVfOSbV4pQkIpI4vj5OYVQ/IghmS3GHv9s10JJ7LKthHt5PaDuiIjEVv5pR5JfSCW
 ogXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3BGZ+7tsHEG8xoaKjUuLTzOOqi2eIKPJ+v4sZivJARQ=;
 b=BsmT9lvYtew8pqaU88P9FXIVV+XVDK/i/V7M+L5pKzvqxH+GP9bOGPJqn3+xSefJbX
 vPSpoXRXSTCi9vlmENla8vYHaWwTzPQtCNVxxZ+zcgtRsHBexxAlqBHLOogkhq9O/KC/
 Od5OF68ioVaCOTCReyLoLpjXow/AiArXLUff0jEjBv6OSPP8m8hQHLdl8k+LK/tp6TkB
 zWdlozzHotohI6qMDmtv99KbJUIRirEPqq+4gPqb0p37uwlqsQlumD+5rIsHgND5u+pj
 EMV9TWnwlg9bUHioVqA3tKFRLhCIDaMiyb1SMLGtWE4DWJlKvctnOvGeMvtjqJ92NBco
 lVdQ==
X-Gm-Message-State: AOAM532PNltew2r3ZKUmmDEEFmotns1Ge9heWvJiySGeK8Mph72p6fxN
 rUxzC0Wiq15qATKSf9PE5FRFh872DXsFC4jz
X-Google-Smtp-Source: ABdhPJxfBnD8B09/XPCx/IkY1O07ySDS0LUr+xlIqg2wjv8Ir1aOn6P/O4ihU35WEn0aQKhK0Rh2fA==
X-Received: by 2002:a05:6830:1255:: with SMTP id
 s21mr4776041otp.334.1619210389256; 
 Fri, 23 Apr 2021 13:39:49 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id m127sm1511911oib.32.2021.04.23.13.39.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:39:48 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 08/24] bsd-user: style tweak: use C not C++ comments
Date: Fri, 23 Apr 2021 14:39:34 -0600
Message-Id: <20210423203935.78225-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203935.78225-1-imp@bsdimp.com>
References: <20210423203935.78225-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::32b;
 envelope-from=imp@bsdimp.com; helo=mail-ot1-x32b.google.com
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
 bsd-user/elfload.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 3c9d8c2845..87154283ef 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -1010,7 +1010,7 @@ static const char *lookup_symbolxx(struct syminfo *s, target_ulong orig_addr)
     struct elf_sym *syms = s->disas_symtab.elf64;
 #endif
 
-    // binary search
+    /* binary search */
     struct elf_sym *sym;
 
     sym = bsearch(&orig_addr, syms, s->disas_num_syms, sizeof(*syms), symfind);
@@ -1092,7 +1092,7 @@ static void load_symbols(struct elfhdr *hdr, int fd)
 #ifdef BSWAP_NEEDED
         bswap_sym(syms + i);
 #endif
-        // Throw away entries which we do not need.
+        /* Throw away entries which we do not need. */
         if (syms[i].st_shndx == SHN_UNDEF ||
                 syms[i].st_shndx >= SHN_LORESERVE ||
                 ELF_ST_TYPE(syms[i].st_info) != STT_FUNC) {
-- 
2.22.1


