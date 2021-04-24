Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B4A36A230
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:46:33 +0200 (CEST)
Received: from localhost ([::1]:41458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laLQO-0004wO-Vq
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKin-000608-Fy
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:29 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:33750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiS-0004M0-PC
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:01:29 -0400
Received: by mail-il1-x129.google.com with SMTP id y10so2434341ilv.0
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fenm71ctA8siFXGt24gmLjyuh+TI+89yJ5yek6MtItw=;
 b=psPmD5sjGSC4qzzbI1B6cnAky1JzrUWfYV3sKqsIPFGfPmmh89+FdsnR9XhjWHWRcC
 +S+tRDFvT361PafDJOCHTGoWTlzBQJwSYR5rkJMxVzdvfpajQW2ZyHtgI7sfGJSap25V
 klVkRxe1+FZkTZsOnbCTCv64ESAZT/J/vbk4i5jxYwTIRjAv3GVlnGPU8brZbdIbL+fQ
 5iG+UV1VboXXWIqhmr3DXGB2jsvHV53FaAk/woKw3tezI6+nhUIU1ngG615Ol+tS06UM
 qWL474nzYtQeckCBX2aavzvwxxVSHCAHTvpgU9yaJ767qf1wUkkRt75Illn/2F2oewbH
 dmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fenm71ctA8siFXGt24gmLjyuh+TI+89yJ5yek6MtItw=;
 b=RXuhs1Fknr+aigCGOkyrN9rFRbTPMUFR2HXWGn+9rWo40dKTvoiM4ltumCKyGmAomx
 6a1g6tgQZ88zWqwa79Ho1aOGXXsUwiHAMyj4Kl+WJvGi1eIeSww9HwbTmlNcDWMwwSd4
 J0pmW/NmaNBZN/9u/sFuMcCG+unjAHaddfk3FbmSvzd6UG2xUaAwL0F3gg2qYgx04Eil
 ULWcaIZYX5UYRv9mggxvBCxjku9Qrz991mj6I+O4KmamOkJg9E9ONb+/ywHNYfGxJ3vs
 ldRTTfiIUkyC/4UpN7fc/o9i2269PRphbTJiarfVjh5ueNCJ46FnYHkrYR8j5KO2lGE/
 hY4A==
X-Gm-Message-State: AOAM532sgbuyFrhCtE6wY2ifpteAMuZvHH5rFhF3fm0e0d18Fz7vDX24
 8HWYaHujg8AYpQa3DBGyIbm3JDNp3QfbVIC6
X-Google-Smtp-Source: ABdhPJzzj8/WHBM993LltDxThft5gitnUtY/j0yxoR12hPtcKEO1xUqEcwGtlVxuh60jBuFm63oSig==
X-Received: by 2002:a92:1304:: with SMTP id 4mr7029025ilt.126.1619280065198;
 Sat, 24 Apr 2021 09:01:05 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.01.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:01:04 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 46/48] bsd-user: style tweak: Return is not a function call.
Date: Sat, 24 Apr 2021 10:00:14 -0600
Message-Id: <20210424160016.15200-47-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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
 bsd-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 36ffa6a880..1f6b93923c 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -187,7 +187,7 @@ oidfmt(int *oid, int len, char *fmt, uint32_t *kind)
     if (fmt) {
         strcpy(fmt, (char *)(buf + sizeof(uint32_t)));
     }
-    return (0);
+    return 0;
 }
 
 /*
-- 
2.22.1


