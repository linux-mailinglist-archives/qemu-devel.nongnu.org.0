Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84C92E8E57
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:15:48 +0100 (CET)
Received: from localhost ([::1]:48594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAj5-000664-On
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:15:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAN3-00051s-3b
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:53:01 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwAN1-0006TK-Fc
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:53:00 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t30so29501417wrb.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=meSqN7OJPd3TgjBqquEQOj/uXRGmM+5t7QO346SCy+g=;
 b=QNDrdfznMEklBSk6Ta72f8L4Y9MLqQIVzhq+LBjmjc+WmCmTweY92XKfpDAR8TxoYN
 prZl9LF1SKUZUl0Map0zdgqxeMDWMl6PsHaYuUOE4crkI5kZ4p1yX2xrlX6Vv7LFHpYS
 sak8QCbZns6APMxKiFgi53FtWZllyfL/9n6y82uS2ayZTLBFXOUuIa5t4ljX6FcANW0g
 G590N4A4etLhJf9nAO5SBRv4ovcsMn+qGmq8QfCXuwZ80MF/e0EuzbB8x0swn8ihsmgW
 Mp1vTjU6YtEawh+VZN1kI8Tcqv2J8SgJw0Wel8mOIL8HvkbpomQWghe2AWozqSPC2bbc
 rnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=meSqN7OJPd3TgjBqquEQOj/uXRGmM+5t7QO346SCy+g=;
 b=PKBsw/LRpE2xMSjzTQywSBAGzSYZHDliNQQea6l2LN+MFDHqDPRMqh6Y+FuEcCYVtc
 KzbjH+5lzp8fXeM+29LjUn/T1bhEZHiHEbxaQAV5WXuKQNWXrFZLhe43x4qM76DPVDUQ
 Jdj6ymazFkWKj+Deq3uJA5tcXvKZ7jca+kb5GW4sBQVkIBloaRgPRS6GfV9bXk8RWEru
 A9p9tjgIOtc42dSyNhHDLkDWneX4VquNAwLE0Ksas1iQD19IMfWdOSkB2v8fvFOwBEZH
 0F2Y3psrF2rKFxT/SBwXJMMy/V/2lH7A+sc8+RuBFJbn51INZKeEFQAcRMzyZYLU6ZnQ
 y8Sw==
X-Gm-Message-State: AOAM531UNFB6IE4GCeuzmu5fZBQgWNeYyZQAvQQsdUdUZ4Gwmgvpj6vF
 J5FiNRjIetau9iekQ+tPEUIHp07PNxs=
X-Google-Smtp-Source: ABdhPJxNjKX3uvCfz4zQG1T/IfvM0yoqrGAqo8kYWRJa2UCPr69R+KyTjIv7BgjdC8u9Ex0/oZkWHA==
X-Received: by 2002:adf:e452:: with SMTP id t18mr74189265wrm.177.1609707177972; 
 Sun, 03 Jan 2021 12:52:57 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id o23sm92694575wro.57.2021.01.03.12.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:52:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/35] hw/mips/fuloong2e: Replace faulty documentation links
Date: Sun,  3 Jan 2021 21:50:18 +0100
Message-Id: <20210103205021.2837760-33-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Websites are downing, but GitHub may last forever.
Loongson even doesn't recogonize 2E as their products nowadays..

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201224031750.52146-3-jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/fuloong2e.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index c5a20b64621..09169a9aa99 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -14,8 +14,8 @@
  * Fuloong 2e mini pc is based on ICT/ST Loongson 2e CPU (MIPS III like, 800MHz)
  * https://www.linux-mips.org/wiki/Fuloong_2E
  *
- * Loongson 2e user manual:
- * http://www.loongsondeveloper.com/doc/Loongson2EUserGuide.pdf
+ * Loongson 2e manuals:
+ * https://github.com/loongson-community/docs/tree/master/2E
  */
 
 #include "qemu/osdep.h"
@@ -60,14 +60,7 @@
  * PMON is not part of qemu and released with BSD license, anyone
  * who want to build a pmon binary please first git-clone the source
  * from the git repository at:
- * http://www.loongson.cn/support/git/pmon
- * Then follow the "Compile Guide" available at:
- * http://dev.lemote.com/code/pmon
- *
- * Notes:
- * 1, don't use the source at http://dev.lemote.com/http_git/pmon.git
- * 2, use "Bonito2edev" to replace "dir_corresponding_to_your_target_hardware"
- * in the "Compile Guide".
+ * https://github.com/loongson-community/pmon
  */
 #define FULOONG_BIOSNAME "pmon_2e.bin"
 
-- 
2.26.2


