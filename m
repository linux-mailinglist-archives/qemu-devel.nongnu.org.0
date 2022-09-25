Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E432A5E9332
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:48:51 +0200 (CEST)
Received: from localhost ([::1]:49218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocR3y-0003mB-UC
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsG-0003UU-I6
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:40 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:44021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPsF-0006T8-1p
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:32:40 -0400
Received: by mail-pg1-x52c.google.com with SMTP id v4so4202759pgi.10
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=GlznwSHa9K/cOS1FRxJZ04KXhLV4Kvl8Dx3ESYYXk8U=;
 b=ehVsBlTe0XK2u79214xRV+1QcnzqShkpzsQeAY6Fk3ilNUOl6Y99NPYCnWVg7uuJ9W
 rV95a1RiUmp/7X00u0YeWJPzzhlp6P0REEcwKOIQWb+SQR50Y9SjvCD2a48G/gBv1WNm
 BXvipG1B/fNWMnhN1auP+tMoFE0X82HHuhc5f+reG+pNarObzW4Vrc/ZDrRLKO0ftPoM
 0HyyUH6Rp+xbZWwP+IW6EyCWm5zeibZviY9NqPzrsaIQjGMyewhtVYMLFcI98BrnfcYl
 RN/yk32QNnI8kk9NlB9TeE8TJJGAVEjCjhSMJl8RJ+C8i9KO5N0JzfDUcHZV0C2yn51/
 V/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GlznwSHa9K/cOS1FRxJZ04KXhLV4Kvl8Dx3ESYYXk8U=;
 b=UF9SsIcRvezscTrkI2XrRPIDgDIcO8jfSa2mgvDpvP690SaixSM/HH7uZxUsevl45A
 wSjlKcJe4wey2+blljX8SQPu3oPzu9gQicjCXomP1NjQpLQcDlO+9HvZdQfpesUum3+m
 7jOAkKrurId4uDsIEvLv8jFYjWBFjMosyigblHpu34uGR3MpscH+xBXMkFQWZJF3+G09
 JNadO09SjDpF16QMesv8GrpS7IbPzLe/R3cGczqzAoh6rRJTlWvGvThltJlXZ9a4ow+/
 5WBPim5rRjCyZ54G8B2lIUN3jKsH7zSVlcnOU3myqPAAWHvzw+/fpRG42XRRfZhdR4bc
 kMvw==
X-Gm-Message-State: ACrzQf1xTJH1B13FhOtMEX+J0PK46qDKVXomzX3hH0QM5aNdJNztvzyn
 xwAUC5b1/4PlHKhqmhJerAvVRGOb70Y=
X-Google-Smtp-Source: AMsMyM7mHcsiVDwf6MUSB81GExd3WL5nUF8H3SC/EE/uvSs7nN3pGrQmJwHssVLdy8FGGpiYOE+OXg==
X-Received: by 2002:a63:f20e:0:b0:439:398f:80f8 with SMTP id
 v14-20020a63f20e000000b00439398f80f8mr15048977pgh.494.1664105557683; 
 Sun, 25 Sep 2022 04:32:37 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:32:37 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 45/54] tests/qtest: libqtest: Replace the call to close a
 socket with closesocket()
Date: Sun, 25 Sep 2022 19:30:23 +0800
Message-Id: <20220925113032.1949844-46-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52c.google.com
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

close() is a *nix function. It works on any file descriptor, and
sockets in *nix are an example of a file descriptor.

closesocket() is a Windows-specific function, which works only
specifically with sockets. Sockets on Windows do not use *nix-style
file descriptors, and socket() returns a handle to a kernel object
instead, so it must be closed with closesocket().

In QEMU there is already a logic to handle such platform difference
in os-posix.h and os-win32.h, that:

  * closesocket maps to close on POSIX
  * closesocket maps to a wrapper that calls the real closesocket()
    on Windows

Replace the call to close a socket with closesocket() instead.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 tests/qtest/libqtest.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 12b1e85b51..1ae58624d9 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -113,7 +113,7 @@ static int socket_accept(int sock)
                    (void *)&timeout, sizeof(timeout))) {
         fprintf(stderr, "%s failed to set SO_RCVTIMEO: %s\n",
                 __func__, strerror(errno));
-        close(sock);
+        closesocket(sock);
         return -1;
     }
 
@@ -124,7 +124,7 @@ static int socket_accept(int sock)
     if (ret == -1) {
         fprintf(stderr, "%s failed: %s\n", __func__, strerror(errno));
     }
-    close(sock);
+    closesocket(sock);
 
     return ret;
 }
@@ -507,8 +507,8 @@ void qtest_quit(QTestState *s)
     qtest_remove_abrt_handler(s);
 
     qtest_kill_qemu(s);
-    close(s->fd);
-    close(s->qmp_fd);
+    closesocket(s->fd);
+    closesocket(s->qmp_fd);
     g_string_free(s->rx, true);
 
     for (GList *it = s->pending_events; it != NULL; it = it->next) {
-- 
2.34.1


