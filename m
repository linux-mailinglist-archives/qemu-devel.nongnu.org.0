Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C3E5E9318
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:30:16 +0200 (CEST)
Received: from localhost ([::1]:33586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQlz-0005cP-3M
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsM-0003j8-Oj
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:47 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:46712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsL-0006RL-7P
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:46 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 78so4188868pgb.13
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FMvqR5WvHSrhd6FoBOh5bPNiyVgL3g0xwaaD6f1HGpU=;
 b=nom1DnXizdus8O9cJKckrVxSlw9ApoiQhEtk8If+caySJBrWo7oSX9ZLfvMoqada1N
 7Wf70BMmYNyI31yaxViEPYM4x6N7ugOSYezmvisavf+gDXIncNod1LUoEvqNsBJdNYms
 Ta6FXDHwGLb1J/9PdgerrMGL3ecvT5J4olcmX5wi2bqAH43qxGSXLQ0WdP1266vG0wCK
 do/Q5Zrh5jCwh+DwlOcaFd/WNytQz97weQ1cfNTUhuG+6Xuh3V/slJps7ZTLLdFWSW53
 D6HhkdrlvAuVTjBOmpaxZhmPoFKcOol1rBLAlLpAEL7IrREsu2l4sJTlKmJP29Z81YAF
 Xf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FMvqR5WvHSrhd6FoBOh5bPNiyVgL3g0xwaaD6f1HGpU=;
 b=uxyu2rSBfwaLE2We+aMrGXvd+eUaLhOoWdFQeJREN0X70BBwDQv/IDX2Ebb/pHcjW/
 8GWC0eJlF2co8acpqsuiqqWB39yzRJUeJqV5ZowqSC+xbc2eMj2Bf1XtiYhCWJ1vNUyI
 Xs1At0VwJxcUgku/+4n1SS0/xQwsLA1kOGkESIdHVD86uTcuoqKm3KZkWrnzbDJyn4v6
 bazQ/RLJSj9yCacfIs/bk5RRlbCRow/KwdrcrUxYstBb3wc/f+rLK77pSM59q2oivKeZ
 Pn01XmW6nX0H2YEjNh1rXW97Ystyu8uWSfj8qrdihgV7Dd7hdjVxMFwqFE5bWdBTVd0h
 /puA==
X-Gm-Message-State: ACrzQf0yOsvUS7zGAu1LHBGMZIVx43lhiN5UodwZCzyaEJcg5kmHYnNu
 H+SjZ7xf1HCeGaEo9UhImislxH4PT8o=
X-Google-Smtp-Source: AMsMyM6XFLYk0cNUvqmE5Q624IctAcRdcgKcoLmHPkBvgWVyeiWZQ51bvWg2WXjPuDSZ5MYS3EsPyw==
X-Received: by 2002:a05:6a00:1346:b0:546:ff1e:26ae with SMTP id
 k6-20020a056a00134600b00546ff1e26aemr18435705pfu.45.1664105564230; 
 Sun, 25 Sep 2022 04:32:44 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:43 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 48/54] io/channel-watch: Drop the unnecessary cast
Date: Sun, 25 Sep 2022 19:30:26 +0800
Message-Id: <20220925113032.1949844-49-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

There is no need to do a type cast on ssource->socket as it is
already declared as a SOCKET.

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v2)

Changes in v2:
- new patch: "io/channel-watch: Drop the unnecessary cast"

 io/channel-watch.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/io/channel-watch.c b/io/channel-watch.c
index 89f3c8a88a..43d38494f7 100644
--- a/io/channel-watch.c
+++ b/io/channel-watch.c
@@ -130,13 +130,13 @@ qio_channel_socket_source_check(GSource *source)
     FD_ZERO(&wfds);
     FD_ZERO(&xfds);
     if (ssource->condition & G_IO_IN) {
-        FD_SET((SOCKET)ssource->socket, &rfds);
+        FD_SET(ssource->socket, &rfds);
     }
     if (ssource->condition & G_IO_OUT) {
-        FD_SET((SOCKET)ssource->socket, &wfds);
+        FD_SET(ssource->socket, &wfds);
     }
     if (ssource->condition & G_IO_PRI) {
-        FD_SET((SOCKET)ssource->socket, &xfds);
+        FD_SET(ssource->socket, &xfds);
     }
     ssource->revents = 0;
     if (select(0, &rfds, &wfds, &xfds, &tv0) == 0) {
-- 
2.34.1


