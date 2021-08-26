Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C31F3F8FCD
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:15:01 +0200 (CEST)
Received: from localhost ([::1]:39248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMiC-0008QK-G9
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfk-0005VD-HC
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:28 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:46961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfi-0006j4-Tt
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:28 -0400
Received: by mail-il1-x12b.google.com with SMTP id r6so4689471ilt.13
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KMQsbMY5NaOGHicHu9VbpgyM/1xluEbSzTVfLIIvix4=;
 b=VXWJFq9wFeQ7SWyAPB6Ad+R69V4rsZ7TEEu7oUEaYnKBuVz2BMG72VgL99qmMZ1oPa
 QpbwpqxAY2u8vB8ImzVz/uHWQeooB8VP3BrIy0kXxfsTVESBD1yWHhlRhhEaD1w94VrX
 gh6yO8ywZOPjn0tw/jXfeot4QFDMMvlQzHN/+u70+WbsRoZR1rzvfz/aP9HD05buQhW8
 F8HoZuXQghcA+8bV+5hznAQXdKLScIsnqDepwG9tEZ4tf7NhHjAB/bZ/KDTNY30PMPGh
 825f8evBiFHc3iWgf0dO+z0eaiM7ChyLeqqUJFDohi+a2YrxoKde/U9G40FV+UgEBUkE
 3yOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KMQsbMY5NaOGHicHu9VbpgyM/1xluEbSzTVfLIIvix4=;
 b=RS5E2YWttqqR+c/bZgz7Kzi5CU9m99QLwZffEsZ94W02MHk/mi3Aplt1cIoHfpAt0+
 8sYmLHrpk94+zWuIBx5jDI5oMoPzCj0i3kBKSsjZ94FPzH7YvwfYQxJ3VftinCUxAxWa
 Q9I9nHYw7VQAL94Eys5oW2AUQixqs6U2iNnVWD/kQ2mPizcHMlzIHSOxf398U/MRH7QU
 hHyu98WVWp/MHlbTtVXKopqvJz2k5kn1aEmjnxD8WEPXlFGTv7DwwDBbPH/8rgjxr+el
 YhU+ksesZn1+tZw+YMNSrBk+mRhnUZMr5Vcor4WO+88HcQ2zVTmRg7gsSVOOZvdFoNSx
 DKlw==
X-Gm-Message-State: AOAM533i4+WW7P7F09A0a8/yBIsl/rAw/Re17IMCMlTyMquDWRqlrC8Y
 MVut6SxBDoeTTziDaYA6ikq512jXVsmvxsOa
X-Google-Smtp-Source: ABdhPJxs1gEWZLZtGSIHYp3OZrE1OPzZAHPnsuIeiWdCabUZtAfuqEAmEH9dnhzZW7WltWtCnemGTA==
X-Received: by 2002:a05:6e02:506:: with SMTP id
 d6mr4171031ils.141.1630012345418; 
 Thu, 26 Aug 2021 14:12:25 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:24 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/43] bsd-user: Add Stacey's copyright to main.c
Date: Thu, 26 Aug 2021 15:11:21 -0600
Message-Id: <20210826211201.98877-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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
Cc: Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Add Stacey's updated copyright to main.c

Signed-off-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 38185da111..39c4a0f33c 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -1,7 +1,8 @@
 /*
- *  qemu user main
+ *  qemu bsd user main
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
+ *  Copyright (c) 2013-14 Stacey Son
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
-- 
2.32.0


