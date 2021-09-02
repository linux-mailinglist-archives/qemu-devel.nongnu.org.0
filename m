Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8937E3FF83B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:05:13 +0200 (CEST)
Received: from localhost ([::1]:58496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwhk-0003sH-HC
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwR7-0006nl-7e
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:01 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:36701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwR3-0002xE-QJ
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:00 -0400
Received: by mail-io1-xd2b.google.com with SMTP id q3so4708981iot.3
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CEg6wJwrnKiOhib5Am1C2mO4WW7vLNd0w5q7DtkUois=;
 b=U7lg0znYRSe+bh9mYcnRAOdDq6ayRZSEBjVOl0CaneXRtfc6VCbKo+pC9KtlwF6s7Q
 SnpbFV3Jku1u/MupIBriufrXB9tHWPa0dsiI+fyCHqFAI+OcBYOVDT+riO//UxWDQTr4
 5y//wQGle0rkfU6txVB/9MYKTsxNkY3OIsY7w84yW+CEzNCcY7ulo9AK21KOJJ41LAxF
 XzpqzNPJD8bmaREpTmVckxFoL2g7Mzarz69XPqyXhJFqupzsGF27PsotS1up95UUmwmc
 NWIwAPfS1wClK2KG0fBvoVCMMflfnJRTNSfcSpejDCexH5APb6DNAwg/JoifcZ9XLTYP
 lrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CEg6wJwrnKiOhib5Am1C2mO4WW7vLNd0w5q7DtkUois=;
 b=VgTejN6YyyqbNN0+s0wTintiw2dht0kRy1loeT/PhnOtbDxl/4G53p2tFjD0nk9ask
 linl2toJuoHlerQX2MBT/imii7EeR6br1gNrWQgc1c1UrpZNZ6tVII5swfr4mGr1xHTU
 UvieqLOfNqkwkMWLY4BlXvEl1l71FNJjJFYKUBuuqvY0BdKOi3JfTX2Nte7WO6WLsw6/
 /kxxss3Nl32jlAngkKTRhrnJstl18H+o+t1V70sRoTAnBtuOsEzOWmRPLMW8QZOcjhwI
 Aaa+8ujUM+1JN2hfWB/kKA8qaQeji27kvkzHhUpj7eoHxoug/03mvSpzBrvrfadvnji4
 v5iA==
X-Gm-Message-State: AOAM533JOTw7WNw34l4oD6YCz/kjHbFsNePBGvLrdWxVxzK7M4UaSdZM
 MSz1FGW6xJl9YGQ0YaSSjCIecX4GNHbwNw==
X-Google-Smtp-Source: ABdhPJxrCMEpe0RK0TuSemvGRmqKK5VniRqw8m+8OC8TGzbkey9bXh9vu6M4sjuSum09JebIrenP4Q==
X-Received: by 2002:a05:6638:2726:: with SMTP id
 m38mr133537jav.13.1630626476588; 
 Thu, 02 Sep 2021 16:47:56 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:47:56 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/43] bsd-user: TARGET_NGROUPS unused in this file, remove
Date: Thu,  2 Sep 2021 17:46:59 -0600
Message-Id: <20210902234729.76141-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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


