Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75F03FDF8D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:14:42 +0200 (CEST)
Received: from localhost ([::1]:49438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSsr-0000Xv-Of
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLS90-0000x0-DV
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:27:18 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:43540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLS8y-0003V1-QI
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:27:18 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 o39-20020a05600c512700b002e74638b567so2265721wms.2
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 08:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KHrnzaVKsUjofGqiJycYJSIoCT6/obxTa37M8dbK3ek=;
 b=JBrEkiDTUTqgk/yYjWr+PKtEqyfDhyQSZAZuLq1AlZEQ2LvMucbzGwH3gDih4Z8UC1
 fOOMGfVeIZFZi/UzPeVP6DjG0ev9fbZ1cPr+TLktuScFONWrSIBpq7cpB1Bo+DQfEc5H
 rtx1jNBHNevcit1oW6/fnLTr46CDTXNvKcqK38YnZpm/9lT9ossx3IQRFCb4/qQNDX5b
 VXwXuGCkXuZOVihHoaDckX8HJt6igkQ238LpFbEYTYfpU3sesdIG2Uw6B267M6nFZ86l
 +tENjQcgZOJGnKlLbL9CVQYCgnTAB+FYP4Voy1yuQQRlriFqYsaxeLN1Cc4lK7haYwnF
 Wv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KHrnzaVKsUjofGqiJycYJSIoCT6/obxTa37M8dbK3ek=;
 b=mXGPwWDh3wq9XagZLuq+qu3hBAx9latJgvwiCnp7yejK4MRlYFUFAjO98kO9QoT45X
 eTyUrcV9tX4uj8vPaJOs46t8re68fUxkF+XCIzVgrdp+m4YkVo11owYQ2kmvSSfZQqgu
 U7KTBHSQF3a7Tb37TvgNjOqcUanVYTQ5xvpcdYbtBOEOQCnS5DfQn1IU0EgNxxQcu9/N
 WJc9tYhw022VQhvw5zmJ4GFCT/ldipqlCHRIZQ5uWv8tgejg0pwaaaVrtI3nB/+uptoW
 hjNZ26u/f55B+eMlJA8lF+hB5oGUqwOH7FVvWRi0UCsHzVOqwKQ18efnasCPcqiqEUd2
 HPrQ==
X-Gm-Message-State: AOAM533538jCdkyouhlSKv5FPYcP0Q/QQzHnQ/vKmU60uwrXHBuilgFW
 EbJhzXY45aVEtOdB9yR3N9Njb6nw+QqJTw==
X-Google-Smtp-Source: ABdhPJzvQnP/AILonkqm9pJbr/SgNWI0Oek9qE3gqknB+S5y3K/AmWRl9orRcjY23uI+/MLhteZcCQ==
X-Received: by 2002:a05:600c:3b0e:: with SMTP id
 m14mr63532wms.118.1630510035445; 
 Wed, 01 Sep 2021 08:27:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n14sm21199679wrx.10.2021.09.01.08.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 08:27:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/vhost-user-bridge.c: Fix typo in help message
Date: Wed,  1 Sep 2021 16:27:13 +0100
Message-Id: <20210901152713.25701-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a typo in the help message printed by vhost-user-bridge.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/vhost-user-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/vhost-user-bridge.c b/tests/vhost-user-bridge.c
index cb009545fa5..35088dd67f7 100644
--- a/tests/vhost-user-bridge.c
+++ b/tests/vhost-user-bridge.c
@@ -831,7 +831,7 @@ main(int argc, char *argv[])
 out:
     fprintf(stderr, "Usage: %s ", argv[0]);
     fprintf(stderr, "[-c] [-H] [-u ud_socket_path] [-l lhost:lport] [-r rhost:rport]\n");
-    fprintf(stderr, "\t-u path to unix doman socket. default: %s\n",
+    fprintf(stderr, "\t-u path to unix domain socket. default: %s\n",
             DEFAULT_UD_SOCKET);
     fprintf(stderr, "\t-l local host and port. default: %s:%s\n",
             DEFAULT_LHOST, DEFAULT_LPORT);
-- 
2.20.1


