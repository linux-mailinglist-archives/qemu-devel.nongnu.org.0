Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4C74030B0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:05:02 +0200 (CEST)
Received: from localhost ([::1]:56466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjDB-0000wk-9s
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2O-0005kt-JK
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:52 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:46602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2N-0000pM-8X
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:52 -0400
Received: by mail-io1-xd34.google.com with SMTP id b200so430644iof.13
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CEg6wJwrnKiOhib5Am1C2mO4WW7vLNd0w5q7DtkUois=;
 b=t9Q3kC5bpbubo0dNuT/Mu4EIxDa5RvhAAX8hvzrUbNkxi1T420yY0sNZhT4O613cog
 eejhUsPsh0TJwJbPjJDgJ4KjTz4+D7H07w/3JTqDyo5iBwivEfR1tJg24DQvYFT7Vtn1
 QXVWTfsxKYlnGqaOIZuy4y4EyXWdHfMXhgM7f3sXMzGV89yV+U9O2Ks7VUllkvi85Bsu
 FXmINQKsZ30McEk8gwCuq3T2TSDPPrnmtesHnCW0ivyOKmmM8Ero5s1kEPhMK11m02e7
 o0Ir4WAN1fD3zZje32zob3WnvzXAyffMen8qe4hvsRkrxtAFoxhMFvd/+yKGSXoi37P8
 9d9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CEg6wJwrnKiOhib5Am1C2mO4WW7vLNd0w5q7DtkUois=;
 b=OXYcomSd8WF1dP1agUl+tRhhVIQfTetASKPJWG6vzQtj0jjcuVUH+zIB2wMNmpGQGC
 1nDp3m6bzC17vjvGLoy+H6VrZJ32O/tf0LpvDJ6LS4GXRbLekdazi4lqccJrS/rQwaxl
 hnBPQnMdMMoLUCsbJ6bTx00sgoHMYhF3Mxbp/EhriaUDx8ma1HV3yTIUor5D+F+prc97
 bhZmSZIzC9F+rMaH5AZMRlZCR85qE9oqsfAI+e883ORN/jzANaNz7IFQlWzqf7Bl/rIz
 SkH2j44f1NKaHsuKy45pyDKwsD3Ih5i/rqUu+hBl9u8U26MSx9GafdAzp/SKKQLykaIo
 sn9A==
X-Gm-Message-State: AOAM532/V6xjZ2ahREl4GqLSYnZY+ZFxIbWVIECXQ+zjTbt7HPzqQ4uH
 4NRIjK0B1V2SOIxuLHatyKX7+H/WtqSZjQwEowI=
X-Google-Smtp-Source: ABdhPJzFGyts2GDBqZNGMKaC9nwBsawMave3cWDGxgHHaCyLYlokxPj6T/iuW2Ton36q1oa5myVuLw==
X-Received: by 2002:a02:8189:: with SMTP id n9mr428281jag.107.1631051629853;
 Tue, 07 Sep 2021 14:53:49 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:53:49 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 13/42] bsd-user: TARGET_NGROUPS unused in this file, remove
Date: Tue,  7 Sep 2021 15:53:03 -0600
Message-Id: <20210907215332.30737-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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


