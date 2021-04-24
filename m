Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A328B36A1FE
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:14:39 +0200 (CEST)
Received: from localhost ([::1]:46414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKvW-00057w-NX
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKhy-0005VY-Nb
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:39 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:36832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKht-0004CT-Ua
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:38 -0400
Received: by mail-io1-xd33.google.com with SMTP id g125so3394631iof.3
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HSHRS0z4r0qhim5P0rpE1zVoI4Ligyk7KuFYx7l7Qs4=;
 b=By9K3n49VP0y87PHZly3XoYl0XYm9s4S5ZkLiWiVSluaakU06vc5Jw31L0fjLlCtDL
 3ZVaPuVMAihDN81QHFPCyFn89QpNiMaAeEl5mMtqa+hCIiq0h49TeSEOF7idzZX46M/R
 WIhQfGjTqJtu4l6RI6okGCjZkFDL2K2yzxunJzR+3Zr/z9o3N+mRwtzYJ/2JJH4R0/gb
 SynjQhrzu7vyyBD2XtEVBSNzXjDO6fXFQWez/ct0xVvxIOTQIEo1oQwAv0z9/7CJgbUn
 bQFd/sTVvazksPGrcfFkg0Kj08fazPWTuxTHMcJaxK8IPTKDMU5zo8H4soOulyKMWO5P
 wO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HSHRS0z4r0qhim5P0rpE1zVoI4Ligyk7KuFYx7l7Qs4=;
 b=q5OjDX4w9LdjHMn6t9yb77mqetFnMkx1UzgfrLKwOpYNvbHNHNr+tOMoXoxu8oxH7s
 hO0CGDCtHOI0cbrXRSciI9lfTc5/tPxKpfFvyrZFtZXmDJZhKOiiNKQjkBEglz80C1hw
 l2sWdiYT9KvGXBfLz2qgxKcd+z36CPy7Hq5K+nQPHAiVrpzFNpcibxx8FxbrrpFfrQ/S
 x4pGWQSkq+OzDDcuXebuUhTd9yFNX+jASae9GFSDBcyqWfWytTaOpzUb+HQpDGSupSxj
 Dz9NYutLkCaEkkSInKl5Q010IWhbilUs9NEnyzRXmD4wRIZPqW3aF5YAYX0afCJ8wVz6
 6V1w==
X-Gm-Message-State: AOAM530MTOPXP22ANif3Fp7u3p8IfEgPZNHnV2I/YMMSI7fXh0VJOr/q
 N99W6OPjJcnP19lUoU0UBQRaTO9+SfiuYwF9
X-Google-Smtp-Source: ABdhPJw/1N8TvIIC5VIEdcPCDg6+Qc9Wtj+xqzI4/I+J1EQMU4auNaKAr4OoZa/0IvcQv4vE+2yOlw==
X-Received: by 2002:a02:6951:: with SMTP id e78mr8277752jac.56.1619280032536; 
 Sat, 24 Apr 2021 09:00:32 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:31 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/48] bsd-user: style tweak: keyword space (
Date: Sat, 24 Apr 2021 09:59:35 -0600
Message-Id: <20210424160016.15200-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
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
 bsd-user/uaccess.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/uaccess.c b/bsd-user/uaccess.c
index 91e2067933..89163257f4 100644
--- a/bsd-user/uaccess.c
+++ b/bsd-user/uaccess.c
@@ -46,7 +46,7 @@ abi_long target_strlen(abi_ulong guest_addr1)
     int max_len, len;
 
     guest_addr = guest_addr1;
-    for(;;) {
+    for (;;) {
         max_len = TARGET_PAGE_SIZE - (guest_addr & ~TARGET_PAGE_MASK);
         ptr = lock_user(VERIFY_READ, guest_addr, max_len, 1);
         if (!ptr)
-- 
2.22.1


