Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF225EC314
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:42:17 +0200 (CEST)
Received: from localhost ([::1]:55458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9ui-0000aW-6D
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SL-0003yL-4P
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:53 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SF-0005Fu-VZ
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:52 -0400
Received: by mail-pl1-x635.google.com with SMTP id w10so8746188pll.11
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wJ46lPbUundlzLry/XhmGks2ORwcj9XXEHBkBSD1tlY=;
 b=I1eFhY9vXFdkZTsFzPOr6QmlwuNUiINV7kaYQ2M7K5DiXByCM+EC7LNlvrWiat9pCG
 iPQSfrdZuTyTXmK2+EO6WwGXzRKGbzykz4j8eiG6rkRFZc0yaaK9cYgWwHJl3Q5L0PHc
 rJlHDjfBMxYTMyxm/DX17Y0yfoErLuMUspMHdaVwqFp0/JJIGuWOHNKadTQA+daORxPj
 QXsa67ty5GelLqcgNNNFpWeZovmUyZjITGRn/D+nshjc4VG8LL2KkrE2hhV/gTpXfDob
 ZiwHDz+vG54LGO8r5QPnePpBl7wMm/tDC5RLDsOestzkQgpunQvXZXHkRs1tjxO+irc0
 xGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wJ46lPbUundlzLry/XhmGks2ORwcj9XXEHBkBSD1tlY=;
 b=gTilqmZQvp8kOD0ONq2J7JKugRkiw4pzkh4uohZNh7Ue0S7Mi+zclkStPLK/xEIk0m
 UwH+7rhdG2Llu6QbTaDzozggK3ndWusyUZpfVDx+uqdyv4cofTT0FHcusJ7gNkl4zdiG
 z3VUc2H4u9lxEM5SjLKDoekgxB6omhIpDjL+RY1xYsZglatMHRQ/OkYSFtVvNhIO6LEo
 uWJfS99v0VHMu2SUjy9vgCdjMQuMXr1oPq6rPE8Bl9fEN+N8LiQvoUK7uL76MHy+pMhB
 hk3rn3K/0g56y7XiRArOp02VDWf/kjpWeYRodgmIZjCHBC3p5kacToQvUikR9jvAtl55
 zmjA==
X-Gm-Message-State: ACrzQf3QpCjNydEC7hPsM0p/Jp90X5uoPJWq2rT6TL3KpmmgqqL75gle
 maPXVLRIVbYVwGMkGnOUmqnZOggmYh4=
X-Google-Smtp-Source: AMsMyM5CeURl2MqaM+ZutenTEO43j0R96InZbN7TDvz35MvdEW8YntddL9VSSuWAjSrAnzCJ4yAzyg==
X-Received: by 2002:a17:902:f70e:b0:178:8895:d1fb with SMTP id
 h14-20020a170902f70e00b001788895d1fbmr26650957plo.166.1664276927061; 
 Tue, 27 Sep 2022 04:08:47 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:46 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v4 47/54] io/channel-watch: Drop a superfluous '#ifdef WIN32'
Date: Tue, 27 Sep 2022 19:06:25 +0800
Message-Id: <20220927110632.1973965-48-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

In the win32 version qio_channel_create_socket_watch() body there is
no need to do a '#ifdef WIN32'.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 io/channel-watch.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/io/channel-watch.c b/io/channel-watch.c
index 0289b3647c..89f3c8a88a 100644
--- a/io/channel-watch.c
+++ b/io/channel-watch.c
@@ -285,11 +285,9 @@ GSource *qio_channel_create_socket_watch(QIOChannel *ioc,
     GSource *source;
     QIOChannelSocketSource *ssource;
 
-#ifdef WIN32
     WSAEventSelect(socket, ioc->event,
                    FD_READ | FD_ACCEPT | FD_CLOSE |
                    FD_CONNECT | FD_WRITE | FD_OOB);
-#endif
 
     source = g_source_new(&qio_channel_socket_source_funcs,
                           sizeof(QIOChannelSocketSource));
-- 
2.34.1


