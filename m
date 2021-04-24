Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8D636A20B
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:21:01 +0200 (CEST)
Received: from localhost ([::1]:39036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laL1g-0005Tl-2e
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiW-0005dm-GH
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:13 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:39644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKi6-0004GE-3o
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:08 -0400
Received: by mail-io1-xd31.google.com with SMTP id k25so8749108iob.6
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cypGHuke1Rz48cNj0jFWF3sRIOifetEd7yIWaCjHGfg=;
 b=OiqWBq9LdYIkuMYHPcwchiCGbSZFlgAyiPqUZY9kT3trPVtsPX1+z501T2vIxdRj+n
 J8zcbpL8xmT+RJw1/fr2kddx+6oCk807MO/jbUsG0jzNbWJshoNIYEahZ1MHKffpWIKB
 frSheMUBvbVpgJ/m/3ANcz1LSQtdYE1O1GilLzOlKIgC1gMzC4EbfRsz5Hr7o/u1ltDY
 kf/fqBaRUXNel4Ocj+Bk/bVYHgz9EH0BFl1tLowNrUIafqLDTzLe41E/dEr9eoFDjShS
 k32Dl8i4Ht8L7SbEbN/+jSuDxsfa8B3H1A+9J/45YKae3aaapc9LJabYDk6iyOUA4b7J
 U2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cypGHuke1Rz48cNj0jFWF3sRIOifetEd7yIWaCjHGfg=;
 b=GNhos+UhjwTzdARIgT9YkqRN/x19hWhy9uI8m1I031sIfERxm+lWWufqjmCPJ7cUFA
 dLAVZKh02+lCrAha+znIrArRxOtdZVXeNbQwQ+pk8NhU5KwGkWJ+Jq9+Tzw4l6FWDCGQ
 IF54OG1s4MZlhR6ioDnpCMYzTsAzDDUmWkvD9tfs9fnBQztcHNWKz1wAcJRzqRpPsAqU
 e8FIsaNJ8QM8A6LXj51O0xICVUTAY+uV5yjV7bOZD7+3TaWygPFi4tsaStk7IS1TxgjS
 uk+BS154PVbsAO9pymPx3uiW6pezaFnCgsVcSSMmn3DEcIV6KDEQiaMdXGztz5VS5fuM
 OmSQ==
X-Gm-Message-State: AOAM531a+QfR/9jPwygO4o/BpPpnPOegC7Y5V8CDf0Fib9RmKoz/7pVS
 GtepVNIUxToaMIZIwvInufe2o7jYa2wQKWHo
X-Google-Smtp-Source: ABdhPJw98eNE0EkK/Ck+/JUuZ7w5+0YEPTrU8JcY6Eo6u0K32PhjN7wSOOWaDIXp90ShTg7y9+qS6Q==
X-Received: by 2002:a5d:8712:: with SMTP id u18mr7591083iom.10.1619280043903; 
 Sat, 24 Apr 2021 09:00:43 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:43 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 21/48] bsd-user: style nits: return is not a function
Date: Sat, 24 Apr 2021 09:59:49 -0600
Message-Id: <20210424160016.15200-22-imp@bsdimp.com>
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
 bsd-user/elfload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 2c6764d372..243a5a5048 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -1544,7 +1544,7 @@ int load_elf_binary(struct linux_binprm *bprm, struct target_pt_regs *regs,
 static int load_aout_interp(void *exptr, int interp_fd)
 {
     printf("a.out interpreter not yet supported\n");
-    return(0);
+    return 0;
 }
 
 void do_init_thread(struct target_pt_regs *regs, struct image_info *infop)
-- 
2.22.1


