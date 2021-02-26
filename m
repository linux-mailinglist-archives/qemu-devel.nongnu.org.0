Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B391C325F53
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:43:20 +0100 (CET)
Received: from localhost ([::1]:43052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYiV-00079Y-Lu
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:43:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY8B-0001ss-KG
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:47 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY89-0004C4-9p
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:46 -0500
Received: by mail-wr1-x431.google.com with SMTP id b3so7665977wrj.5
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Tyc0Jf+g8+mnJ98ePNvnwEXE/WCrdZV8Vy0rBBwf9M=;
 b=MRIQmrzYC2r5WU0HYH6ZepOoUeThRL0JeaJkavPjSxcCzYt89IC/vhBE2c14eQt763
 sfAY1yvkC0Hwqffoj7fPVPLsBQaoSxj/2mmeu3dsTMYM+K6UaVjWL99PYjrXks8kAHP4
 8PhVB9t0G9oMzyJt+Dee+z2qTyXVNZui//dSrsom3qzh61WCUCZ/qb6cBKdsOWprCzNr
 yGcGGBX7wsd+APryL2Y90X3yoYwTb5GRTiC3EfKXaQRXK0MmOlHf4swu/G3o7k6i3n00
 5LrVr64Q50XuD3OoOBQFlchH0qJpelV3pqtwC7pQKv1+yFn5Mqs9ZQuzCDrKHbtQk6cE
 3cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4Tyc0Jf+g8+mnJ98ePNvnwEXE/WCrdZV8Vy0rBBwf9M=;
 b=rP+N0jFncHo7/4tYKDp4qyO86ZhqYSOqdL9FTs/pDPRLXBK6BzEZZKg30F8ygNRw/p
 srJpLM6OjBe0FqZoxKsZXKZohTCo9v5H9mE+Sa7BMp6/HikdqifcoHtUQtoisPz6icbE
 P9PGbiOfrmQlWLQe5Su88LWFfO/sUQG2G6Wv7URNVpBzOjoN5d6st7YNUpurKkCuYvwm
 Urmujzkp2RB2w0vESfHnsJR/IAGFQ98L3WDFmIfQvvV0PLn2J6/6xObfHITaMwz9Ev5c
 lzygKX7tohXhFDXR97Cur9WQJqUAMcCD99BvOJ1El9qPMPnWqqk+t5DTjlthCPUc5YQ7
 6zIA==
X-Gm-Message-State: AOAM533cVzI0vvuL9Xp2GoeSKFqsa4wJAdRRJw612ksFLVYarVR7DXs6
 9YYKjX6GgzXMXVnyMKom2sHY6IYhQcs=
X-Google-Smtp-Source: ABdhPJzDErvKjQR9zqhyqfuXx1wcsqx7pnF3Y4YLxDSQRjdq+ZJXLcAZZgeHsU+j+16w/nkhMcmzBg==
X-Received: by 2002:a05:6000:147:: with SMTP id
 r7mr1875528wrx.25.1614326743984; 
 Fri, 26 Feb 2021 00:05:43 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/29] qom/object.c: Fix typo
Date: Fri, 26 Feb 2021 09:05:22 +0100
Message-Id: <20210226080526.651705-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Doug Evans <dje@google.com>

A simple typo (noticed by inspection).

Signed-off-by: Doug Evans <dje@google.com>
Message-Id: <000000000000530c7105bb191b33@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Signed-off-by: Doug Evans <dje@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qom/object.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qom/object.c b/qom/object.c
index 491823db4a..6a01d56546 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -695,7 +695,7 @@ static void object_finalize(void *data)
 
 /* Find the minimum alignment guaranteed by the system malloc. */
 #if __STDC_VERSION__ >= 201112L
-typddef max_align_t qemu_max_align_t;
+typedef max_align_t qemu_max_align_t;
 #else
 typedef union {
     long l;
-- 
2.29.2



