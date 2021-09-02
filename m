Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C7C3FF80C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 01:51:04 +0200 (CEST)
Received: from localhost ([::1]:44830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwU3-0000qw-Kw
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 19:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwQy-0006PZ-AS
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:52 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:34370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwQv-0002rO-3L
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:52 -0400
Received: by mail-io1-xd32.google.com with SMTP id y18so4751158ioc.1
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KMQsbMY5NaOGHicHu9VbpgyM/1xluEbSzTVfLIIvix4=;
 b=rPCA+MZg9y4Zt8uS1kPpXsEczoxSUjtsmwWlOtD6ND1paK98C1HOf/9HlU0nv9rZyV
 3mQIOcq80zCGVPT+c77Sx8wgqcbsg47NOSEOEEpCaEA8ILGpdl3ESdNPNSr31A9cwTG5
 rOXeNCSALL8HKfyMVjyNyczWCJ4yvLMyDca0YMLssBplxUY6BPpkD9Iw4XPuKj56OS/0
 HL/wK6o4KHPptUlQniUgDq1e/vfVGH74rIo6RI41OGgHUify4i5QyaoLT9cpWkKyg8SJ
 GqATZeMvzpk+tVVuI87gcNNzOa+tU2FgKfWpvGoge6cWP5VOdYG650LLSdRbU/dD2lVD
 yXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KMQsbMY5NaOGHicHu9VbpgyM/1xluEbSzTVfLIIvix4=;
 b=ExuL/HQ+pdtoQi2RtgWQ3kD75vdIDnMgyqU2tTU2SmjIMzYOebtrPoVos1zho0M8C0
 TTu/KkLc+N4H5tFDHnt1U7Xl5rUWacgOUdsZUecelDXK7U1YKhpcpUZubumdAPQWOXzX
 /dH1J7XyNkDQoUsmKJtin9ivL6GcjVWY6OQ9YMePscO4FnEku03bE/TV/L48JubwU/PJ
 j+0mPX7E2IhmWPDYO/xW1mnQ7mIpougBS6vhFKvDQNiPUl+JHKIkrxn5TknENdimQd+A
 fm6G9WJlfSFPrFpW033uKh/ZUhnT+m/baDdq9znTtdrUqz1HvihrD2pFmtQ3QM6HvQL4
 CMUg==
X-Gm-Message-State: AOAM533AAcPEIl2TO+kWXSk3IZM+754XpplQeLFx2WylVP57x1OeDXaa
 u6HmRLedpfm8bMES4SFoLH+UkK/pxgQdoQ==
X-Google-Smtp-Source: ABdhPJxH2rPn9vf5m4rJWAtIqOMRNhDILJl3TH8QJzi29rDZemG30pRTynM4JbrUtR6WLdYqTnF7Tw==
X-Received: by 2002:a05:6602:218d:: with SMTP id
 b13mr721361iob.143.1630626467683; 
 Thu, 02 Sep 2021 16:47:47 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:47:45 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/43] bsd-user: Add Stacey's copyright to main.c
Date: Thu,  2 Sep 2021 17:46:49 -0600
Message-Id: <20210902234729.76141-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
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


