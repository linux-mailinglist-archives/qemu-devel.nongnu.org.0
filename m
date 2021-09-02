Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4573FF81B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 01:53:34 +0200 (CEST)
Received: from localhost ([::1]:53016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwWP-0006KJ-O6
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 19:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwQt-0006Mh-R6
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:47 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:40451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwQs-0002p5-6w
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:47 -0400
Received: by mail-io1-xd35.google.com with SMTP id z1so4731522ioh.7
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hJRZgQI+QtTgjpShWzcLDKaF2c/eXvqYd/GhPRaiuEQ=;
 b=kLsnCclDafrxg3WjVvnC/76HFMtxRDYnDBK8BPM/DqKd+ewEzSMgwIcvPO7jq943b1
 xBoxkdNYeR41BNFWyRZvLsAiQbZw5UurqoN6B9ffmKzjd2cjtPe0SQxeddMqrsusOcwI
 gSHrk0P18OrWj9FM+M7vmaS/Qm0kJNFSYm6sATqsNaP20MpU6jnTjlGxJ8yT8hJHtesx
 L+abYBCOXtgu0aWOyRHCM/2BWU3xquq7QRvx+/1+ydn2GxagNQVHkJF2lvGgMyby+X25
 0rgnnTttNztI15es8nzloEgoMUz3Y0bzDoetLjRoxPRBwmBOJ5X17FuevuZKK2PRFp/H
 HXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hJRZgQI+QtTgjpShWzcLDKaF2c/eXvqYd/GhPRaiuEQ=;
 b=l7TTUX0L2L1Y7zAgU1BWzFXxET3LR2eZLuQ1hTa3nBWM4W9AK20OKde5NsyA/F5lOo
 TU4Ra2HH5x9At6kA3f6mF1pesBGWQVEXLj+XUpzQalNoZC3rXG/DlRf1zdH54l3U+LEK
 iiscg6yr7EOO7qgaZwP/aRMZ1fsETRtPMlfZUX363yZUkkd9Va20HVaBmxr2HdQbzt9F
 Z8ar1+Dn2cNGcd700Cg1Qki2Ilx2tvHCJ5KQ0mPR7ysGsuckqqe7xI/XU2oVK3GXXoQg
 ZUbJf0uGyj2nnhNQNfWaei+5edPLW87EXajl4vLMjLgF8vTuZJe7ASpNKiX/QK9KF8ut
 yWDg==
X-Gm-Message-State: AOAM531yyFXuNQOtgannSqC6aJ8RCVjVFz4vo7ELv4TUMtK3RWwL6qvd
 EUC3JxnOkWUR43OAwe7/BMevFfgA/JCjHg==
X-Google-Smtp-Source: ABdhPJykTBAlUv/UgKvHJbjuKhbX4bwi8lMGAShWp45y/eXnMerhavskx0QK5CIo0ZeyhXZW8VTW7Q==
X-Received: by 2002:a05:6638:cd5:: with SMTP id
 e21mr251242jak.97.1630626464956; 
 Thu, 02 Sep 2021 16:47:44 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:47:44 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/43] bsd-user: add copyright header to elfload.c
Date: Thu,  2 Sep 2021 17:46:48 -0600
Message-Id: <20210902234729.76141-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Add Stacey's copyright to elfload.c

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/elfload.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 6edceb3ea6..ae62f3aab3 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -1,4 +1,21 @@
-/* This is the Linux kernel elf-loading code, ported into user space */
+/*
+ *  ELF loading code
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
 
 #include "qemu/osdep.h"
 
-- 
2.32.0


