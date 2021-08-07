Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDAA3E372B
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:46:45 +0200 (CEST)
Received: from localhost ([::1]:45792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCU9U-0006Nv-3E
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5p-00067r-BG
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:42:57 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:41827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5n-0004gd-K5
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:42:57 -0400
Received: by mail-io1-xd2e.google.com with SMTP id 188so18231863ioa.8
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xIovx0fvyMsu13YfHfz0Wj9FSUDvRJdk8XVPKqOBnHc=;
 b=gCjqBe40ZmTzjPaP2AkOYwfw2OUNWRk0TPHioScD+RuOCK4n2j/tG/vjqaGdsPGDBQ
 2T/EpdrVvsF07l9//G5VoPrmWIEqJjMFN5IssHdZHnAURvJfsQOq03xT4odLt8KzznOK
 FtVS6NFgm8RjunJa8oQH0XhAhSQMbTydLyrxocle2KPzFACC4H4EKBAGxIzI4jusbEaV
 BDGr+49550Zo/VL/ZRXZNqhQIjHu6/gZaMmRrbV+LED0JTLys5+tbdDCxQbORMA0CsKQ
 XYxY0v5A2OeIWVcEO2niOpKaeq3axZu66CuaE2bti2Nlzt00qy1WKunLKT2rzjV6FDpI
 0zLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xIovx0fvyMsu13YfHfz0Wj9FSUDvRJdk8XVPKqOBnHc=;
 b=p+yeDqDrc+LfCCVgc3zvCHiNkMeEpcTvCjRXn6y7nfBm5MS32DeDhy5peLv+9bhUhW
 7AGJb0cISKnBEY84U9ysAwOfVxVCtkJej3EnFVVNnZWN5gIFHTN/f2tCBY5UX9pmol2E
 kKqd2Burl3jIi8cktaVuYX3D2uZVzt8I9Rhlk2T3qOwkvhVtzOyi6NR6PEhAqzperWUA
 Eg3Xd+8t52ElPXV/UaijcrD3YIPYE8icP9x9U/J6LaWXNs8G2E3x5VB4ksY+b3C86yxg
 VcZaLEponRMksMk9Hj7jDRvih6RsOaJnwPfQ+uAIWLHAajgJSdXeep47kqfLDupaSqp6
 a6hg==
X-Gm-Message-State: AOAM530p41DQgX2tMNUYUFg0apTTtgfvhiGupT837lBrRT/SdcUaCpol
 SrbVUds9acYoM4GdcMp1rblJ0BVwySSvg2B2
X-Google-Smtp-Source: ABdhPJw/S3RhTa/w5D67ogC1LXrjLYzZZp67eFJ1FQgecDIVj/oOKRkb3aneUYDABrqt6su0R7fNpQ==
X-Received: by 2002:a5d:91c2:: with SMTP id k2mr83129ior.117.1628372574338;
 Sat, 07 Aug 2021 14:42:54 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:42:53 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 03/49] bsd-user: Add Stacey's copyright to main.c
Date: Sat,  7 Aug 2021 15:41:56 -0600
Message-Id: <20210807214242.82385-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Add Stacey's updated copyright to main.c

Signed-off-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Stacey Son <sson@FreeBSD.org>

Sponsored by:		Netflix
---
 bsd-user/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 8e1ac5d042..5c579d7c2c 100644
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


