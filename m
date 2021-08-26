Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165C03F8FE7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:28:42 +0200 (CEST)
Received: from localhost ([::1]:56730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMvH-0005Lk-3F
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMft-0005xK-6r
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:37 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:43803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfr-0006pZ-Oj
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:36 -0400
Received: by mail-il1-x129.google.com with SMTP id v16so4698989ilo.10
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CEg6wJwrnKiOhib5Am1C2mO4WW7vLNd0w5q7DtkUois=;
 b=KtLuqhWbuCNhwF83qEkXBGGe2ddafUiLyxfXnLVEQ98icUm/ymLZ8I2MO2beiIFNYy
 8vdjupj23BoSluXCATVJG3IF1MtofsNP10WxwbvOLaFpcYmS8ibDrMC8FkJlzswMqpEp
 diF99spv8ZOZwJPAdkWP5Det2AkO7LrtCFoLFTqWTmwnMVUWOhI16Hs1KAlFfkpeZfqJ
 HVbp7g5hwM+kPV7VKajSEGuoKJvZ2mLERDRSsDGZe+qE5khvVKvy9+iwhrCxGl6DeHuq
 8f7Y3Kveri7zBvhiLWDOJ0YuLTJTle7QJ5odtLbCNT+dcz7McuBaWfJs2z/LHW+DWV9q
 YGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CEg6wJwrnKiOhib5Am1C2mO4WW7vLNd0w5q7DtkUois=;
 b=TX2a/nUMkeqyv/ZC2WtogolNH5oDXIdVGVjgAxgcPqjBHq5nwQYq3dWGVRCb73rx2K
 tQQP4rbkOBxBjSapRpcUstSvy6JB0ZDAehvfmgzYurSDa1qmPpwpQxsp71+5O9q6J87W
 261+V5E+K5Sh2JcNpXxKAS6R7PEI/VEdw9Jj/9bQdjNC76/WX6IF0wz3wVeDmb8M1EPj
 KBrLKfip9kDjCj/5UjccGMwWvuWpssp1gZKCLuFoFXoeB+R/Ujmu4s1RcThd06I2g/kw
 42xDjwDYRttouFHdObDOJ3Ftn9NcoXcNM0zh9scEToZx9UNMyxI5wZj7S86kf0DaHgEk
 teKw==
X-Gm-Message-State: AOAM533S5E+kZ1cKKNUANn+cqfkogqZKKhfhuHeNuDrYc+3yCPM4mZvw
 tlgBQZs9LOvKqfgtqMzK1tr38hLQV43RpaTv
X-Google-Smtp-Source: ABdhPJxmL8s4KoloHzvwb4BTOrEXxp++6PTsnEgsVhrg1BET5fsC6PiwN3El9vy2ShHr19p+jGteZg==
X-Received: by 2002:a92:6901:: with SMTP id e1mr3935010ilc.70.1630012354492;
 Thu, 26 Aug 2021 14:12:34 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:33 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/43] bsd-user: TARGET_NGROUPS unused in this file, remove
Date: Thu, 26 Aug 2021 15:11:31 -0600
Message-Id: <20210826211201.98877-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsdload.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index 6aefc7a28b..5b3c061a45 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -19,8 +19,6 @@
 
 #include "qemu.h"
 
-#define TARGET_NGROUPS 32
-
 /* ??? This should really be somewhere else.  */
 abi_long memcpy_to_target(abi_ulong dest, const void *src,
                           unsigned long len)
-- 
2.32.0


