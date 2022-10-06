Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CA65F6BF1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:41:39 +0200 (CEST)
Received: from localhost ([::1]:41600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTwI-00026y-26
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfm-0004aa-4K
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:36 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:37516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfa-0006EM-G4
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:19 -0400
Received: by mail-pg1-x529.google.com with SMTP id bh13so2159716pgb.4
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FMvqR5WvHSrhd6FoBOh5bPNiyVgL3g0xwaaD6f1HGpU=;
 b=eRCB+g2PpDfez7VPNZ001FqIWxt/NN3NZsF/gb2yRH7dF+vkLW86Sh+3BFrgqp9Djy
 QKSxyh18zDQNH/kLMbZYq5KIkEFli5QpVT1aa91HZ2rIbJKeD/7/L2W3IuhZ/O+HdAiH
 XBsPGzS7/9yWZq7Cp4g3h7qngI4jcHrJ1E7wl65CWzYgytV/yiA0HmjA15wttJ6xhuLG
 Be9xtEeO/mLo2imp677f4MBeftaVr4gZizZ37BUSWpAw/dwlmcJdnXd9bEInxsmaR/iu
 qtsHvFBE3tQtg1F0NJeJDuKQ91gKxTO4kCQEGqtX7vM8H7CJQbj0iXfuilIQgF2wdjkr
 oKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FMvqR5WvHSrhd6FoBOh5bPNiyVgL3g0xwaaD6f1HGpU=;
 b=DIX3H5DCP0G6SwUoR/I+LDCatvR//K4KC4QQj+LO8By8XE5AcrvpKaLOHtTBqNEEs6
 gmHK6jx9RZDMA6ZVdyDNxUxtxG8i5IS0rxO7wgi32eDP0ubVUOHPq+eowzHmJ6QFWch2
 HOCjBXlYnKw2rbvSA7DvJ9PL9vw6bNUVgfS0vndSOZA1cTsdJ7s9b0SMKY3/wEGuNRU2
 i+xNmzsIeW5qui6werp2T9tlqnuVzOwpB09t49PEk8AuL8oWVG8YLb4Mm/ZAwkZrBQk7
 hfETrGjw3CWeA21Xd9ExQ/tHpZX+4S7qGaorZDjJJ+/QazH8pQmZafMfb9Xy6jygKoJU
 2zYQ==
X-Gm-Message-State: ACrzQf3fv5T6NOiaG3NpLBN/mk8fPYssaj2KwYEWJJI8dhyARD+21YVU
 auy6wOHp3yWhT9WT6pQk9DDWwqQLQ3o=
X-Google-Smtp-Source: AMsMyM49DkLLwFXH+5jjyrq6oAvFg9ftXL9unjV6uOVVx4Fy8dig0b/D9yoMM/a2J2usye1WpdsSkw==
X-Received: by 2002:a63:33cf:0:b0:439:f026:aab2 with SMTP id
 z198-20020a6333cf000000b00439f026aab2mr372812pgz.86.1665069615558; 
 Thu, 06 Oct 2022 08:20:15 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:20:15 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v5 15/18] io/channel-watch: Drop the unnecessary cast
Date: Thu,  6 Oct 2022 23:19:24 +0800
Message-Id: <20221006151927.2079583-16-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151927.2079583-1-bmeng.cn@gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x529.google.com
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


