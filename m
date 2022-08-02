Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A1F587979
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 10:59:37 +0200 (CEST)
Received: from localhost ([::1]:56160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oInkX-00030c-3E
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 04:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oImhL-0006qU-5u
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:52:15 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:33308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oImhJ-0007bb-Gs
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:52:14 -0400
Received: by mail-pf1-x430.google.com with SMTP id 17so12891379pfy.0
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 00:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UtUDFSo6V4EIqtNs5iElBXcUU9TWQlg0ugZhT/l98K4=;
 b=o5BTO4smTeeXBp+iR/TZZBMjKvZuIjSUzhIg/QISmrBBr3H+1RSZF7cpN7M9/vrK+K
 FtnNsntTISs7x9URuFJDNUS3AwdmavA6U3z1fKwJzz0rNDIv1S0eDmszCeMYbFOd/SwL
 LSYwbknKE+0w/DdxSyWo1kvNFVXFOu4ZYcfyVW1c4lQxm4lkdqz/TFKLXx1Q06GKcxaC
 7QjegC3s8QbWccrLLK3YGUnTPC4b6TKBXpq0FkpOqt8gFQbjSYwi3tHhjIBA7Cfywwl5
 vzqi06UiSj+S5mu3x9ZmBTEuXTWe9VGk4dxgh18xsaFvQXquMUOgBP+34Nb+a8J/lruo
 bdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UtUDFSo6V4EIqtNs5iElBXcUU9TWQlg0ugZhT/l98K4=;
 b=cEZS5SyxTuOw8qn3DNwADOKzn17H47FnJvJFfz7y3LnCYo7G4bFqJTWgWB3eGY+b23
 yPzLBDZtpsMezQE57Pj/MFCMmr+SjC6am2QMt6oBrU86eAvvDrOohbYLCXQ6j0TR9RSC
 popxq6b/0Xnf2WtJ9lyTa1Ghyt5oT/hvUSbicdAbtsuwsKYLu2wsMyzO46Z1Ro3Uh73D
 vb7HCQYpzDVJoP2ToZlhrNAae1goQ2wSyLUmrk5LcsGcDFzB+9s8jEFXsX2Zev+YE77b
 oGX7C7RkgvBWbCcx3JD37GH08sBiYd4wAnbGUQVEp5w+pkK0wNdLil6pWeN8ALJs3S0C
 kxgA==
X-Gm-Message-State: AJIora/xcj4vlN8OREzAOQ038peAA06ZkWIGOwgm1dMFOpa8LGeC0VER
 1RnQ1o3OGyDKRCySt4GfOFquWHLndTU=
X-Google-Smtp-Source: AGRyM1vkoDpK83LXTIj5nnoUkqKUr8hWq7l2PHfh/oqTxtLlPGnae8t5hIhYGT8nfg6kB3UmdnH9cw==
X-Received: by 2002:a63:2a0e:0:b0:41a:f82d:72f6 with SMTP id
 q14-20020a632a0e000000b0041af82d72f6mr16099301pgq.42.1659426732091; 
 Tue, 02 Aug 2022 00:52:12 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 q19-20020aa79613000000b0052d92ccaad9sm3226098pfg.131.2022.08.02.00.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 00:52:11 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 3/4] chardev/char-socket: Update AF_UNIX for Windows
Date: Tue,  2 Aug 2022 15:51:59 +0800
Message-Id: <20220802075200.907360-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220802075200.907360-1-bmeng.cn@gmail.com>
References: <20220802075200.907360-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Now that AF_UNIX has come to Windows, update the existing logic in
qemu_chr_compute_filename() and qmp_chardev_open_socket() for Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

Changes in v4:
- drop CONFIG_AF_UNIX

Changes in v2:
- drop #include <afunix.h> as it is now already included in osdep.h

 chardev/char-socket.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index dc4e218eeb..879564aa8a 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -557,12 +557,10 @@ static char *qemu_chr_compute_filename(SocketChardev *s)
     const char *left = "", *right = "";
 
     switch (ss->ss_family) {
-#ifndef _WIN32
     case AF_UNIX:
         return g_strdup_printf("unix:%s%s",
                                ((struct sockaddr_un *)(ss))->sun_path,
                                s->is_listen ? ",server=on" : "");
-#endif
     case AF_INET6:
         left  = "[";
         right = "]";
@@ -1372,10 +1370,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
     }
 
     qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_RECONNECTABLE);
+#ifndef _WIN32
     /* TODO SOCKET_ADDRESS_FD where fd has AF_UNIX */
     if (addr->type == SOCKET_ADDRESS_TYPE_UNIX) {
         qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_FD_PASS);
     }
+#endif
 
     /*
      * In the chardev-change special-case, we shouldn't register a new yank
-- 
2.34.1


