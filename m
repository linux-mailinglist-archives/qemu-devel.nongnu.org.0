Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943FC3E3736
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:50:16 +0200 (CEST)
Received: from localhost ([::1]:35166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUCt-0001GV-Kv
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU60-0006qk-Pv
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:08 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:37704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5z-0004qN-BA
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:08 -0400
Received: by mail-io1-xd2a.google.com with SMTP id l20so17748005iom.4
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXwZ9rhUpq9Gt/ZMCIP1uv3uRc6hw3LhHitwZ8QAHYE=;
 b=SNgbpArSE0ZAIcBexeapcUQTq3JIB/i63uPZmStmgTVq1inuq/6QQJAIa718oug2oV
 vDMyv1xsAECKHOB9uLHnskfNewuGG7eiLVz4iDansKLPk7dzSuc0y6+KmHyj5DdVigZ3
 9wMkg6icK+bSdxVJiDXTwk49B3A79nJegMdNuQlROMk1T5rYiAaJp6G1a5wOIvjRPM5n
 wcwS5YlO4fZ8yf/QzT1ZOsiHS4Dobwuzlfccm0xqPNZp6sNYqVSyKtjNPUjH3GBdMT6k
 MXg5VLJsO17WQzFkeXprv+vPzJiDAhA283jHKLyx/bOzyyyy6ef4KRZceit3CA7dGkea
 uUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXwZ9rhUpq9Gt/ZMCIP1uv3uRc6hw3LhHitwZ8QAHYE=;
 b=izm6qrcBAiKNcpE2FreHlvAMZR+A6TVsIFTiz5tSkVW866aM7a87dSY40K+YlVA3gP
 UkPwlRlJ1HrmNemUxJ6UUyuCUGZfr6uSODcPD4DW0Ik3Pd9jSRPONxmA3SJxH0E4iStN
 dKlRtT297oef7CV6iZxlk/9PZVdLfzMWexZG7xWAzA5yirEfHfrl/3qMrFBX0IHA7MPx
 3ebvyk6lzZp2tizQbWCzodLoxxh5fPFM6ltiP6gSYjsLb+HpkqKR/6Y+f/xlRW6sqM/8
 8GbRHyQbbfIvuQ2ef6MFPAjjtirRTUFOfwjC6dzCV5jfUKwlBtulqstFeflq6aVUTXCE
 E9aA==
X-Gm-Message-State: AOAM531asivdzUrHBJOMwFQpy9uQMMMzsEEgKdVZ9EcpA4wU3O0VkS4n
 bmBpnHTfd/O+6kmRKNWsRggGlawy3E9P8KFz
X-Google-Smtp-Source: ABdhPJx3q9SeJM38z6o+GAxrqCizrlVk3g+KppgYjpecqRTO/mRYLBeDuALjKswbN59Ni0xX4yfsGw==
X-Received: by 2002:a92:cb4d:: with SMTP id f13mr473224ilq.57.1628372585842;
 Sat, 07 Aug 2021 14:43:05 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:05 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 15/49] bsd-user: TARGET_NGROUPS unused in this file,
 remove
Date: Sat,  7 Aug 2021 15:42:08 -0600
Message-Id: <20210807214242.82385-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsdload.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index df81e36d88..006e19cf3f 100644
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


