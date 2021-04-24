Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C5336A1F8
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:13:18 +0200 (CEST)
Received: from localhost ([::1]:41890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKuE-0003EM-1F
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhz-0005Vs-Bc
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:39 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:41854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhu-0004Ce-Re
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:39 -0400
Received: by mail-il1-x132.google.com with SMTP id v13so3392798ilj.8
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A2WXoZNR18cPe3xuWHxneWeGgI/yhNHoyKk1SebgGQY=;
 b=vRuBOaxGufsfWTDXvzxQnb3Pe5rbSb7UixjJSBSkEfmrJjqWUcDc6tS9PztyO9FKYD
 sfoTAtscGKh4lHOMsRJL5WDpz3UK4P+otcIVvIK8kliLNMWuDDueLN26VwBMHZwWV1Jc
 suDPLsfV+YJ9Xt99gCScUESDooMXLq7KS1mKjvhTbf8Sy6mOSXdJczEfbvJiJolsNoc8
 hgi9fhLES8QA+AUUEk/rcLvEIkiCAnVMZpCMjjLcbTRxwIOGcBuA2n77GNu3orUzHHnA
 Xh1ecAGowl1S09iofhEjuSdl1bHHRUfK8tdc1j2gEgaiLbDhO8phpWjb0asFB5UnayNb
 8+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A2WXoZNR18cPe3xuWHxneWeGgI/yhNHoyKk1SebgGQY=;
 b=OgjmKHS1qhxuU0fIOW6h9ATZWfsjPFlj2cFaelH3LlKRNi5aTrJBQToyVUlWQl3vHX
 bHrj6Qpg14IT+lc4L+HGkZ2fLUUTGldmsXsjzjOVF3bb0ha9dKuU/yol/9NuXmKoQmvL
 uwDe183YMzEpi/jqIZUy23fqyn6QuOm6TSsGl0wuCh7E+IrbHS3fIiPWz/nIKEprEzzE
 7TKnFx080qV63lm15PTi6L/bj+DgZRftnCtYM3iqP8lKEClMc5nARSk8O6uWHgyiAenA
 mHmqAcvj+vCP1lD4MgVVNo4QzB6okAr+pTZOhkQcv2DeYniJcUC8vvpUVBrrFZQcMtCI
 TWjg==
X-Gm-Message-State: AOAM532QSLBJYwk/w5ytPzdkJPFlPBajrYLPwIdBUzxEuS0ZN+ggvXZE
 fWA6rfutwNB+7FvYR2uqUb2AdxN9mL6rzQc9
X-Google-Smtp-Source: ABdhPJw0c62XEDmyoQzSpugmSkV8L/UMprXn2a0Oi0/uIRYCyNBObstjoxl9EiHZSoG00Uuh6pzWRg==
X-Received: by 2002:a05:6e02:1caf:: with SMTP id
 x15mr7454311ill.89.1619280033321; 
 Sat, 24 Apr 2021 09:00:33 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:32 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/48] bsd-user: style tweak: use C not C++ comments
Date: Sat, 24 Apr 2021 09:59:36 -0600
Message-Id: <20210424160016.15200-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


