Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 709672EC36C
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 19:47:23 +0100 (CET)
Received: from localhost ([::1]:35278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxDq6-0001pi-1R
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 13:47:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxDou-00012z-QS
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 13:46:08 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxDot-0004mZ-Aa
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 13:46:08 -0500
Received: by mail-wr1-x435.google.com with SMTP id w5so3302794wrm.11
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 10:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k8gtV6bMcmpo/0mfqNoJ+YsA0ZXxRXzRNys7merCzaI=;
 b=qww4OhnWE1Z8m65t1PM8a6us0hL0yt6TijllZfPWcNURcb5ZB/5GA5ixN8KdvqUGyc
 JJmrSxKwb5zaUTwI+l13fAbTv7TmnopZKRD2OCd2zr+nNsfqdS/1/KgCl+8DMdj4L9xB
 KAMrlb6AeZX2mxZNd/mLfgKSituW8zt2WLp2iVAFnmMQ7ikjuRmltNauOsrtauH7cqNJ
 E+E0EG26Irl+I/MC1gw79H655TUw0ioLHBp3ZjTaff35cvhabqunaYY57WPwY9J7G7hD
 om/Ca0R5DqshtpEyoHbEFoV/ZVPkXF6aRDgqKl7xKE5xQXL6shBg3mjQcuGYs5hUSa9h
 wVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=k8gtV6bMcmpo/0mfqNoJ+YsA0ZXxRXzRNys7merCzaI=;
 b=ax21H8osMusAe0NA92F3ZEHelWY2XaWoR46bQ6e6z6/4L7YU9LibiL21Dsib24U2Bx
 ughAI4ZXEYp3oKekcbfaoBvvIWEd3aXgP4dG6EI8hZ08tvOQdMFuF5aI+NAQC/av0Gg5
 4XBQgpQHV04cpa9ehT8YDC6e/zmalMGoNxL1lq3kJlLn4NEOvNNvD6waqgio40C85cOk
 BkMpEYa4QUM4eOkoNZuKiZJeCArZHXCesa7AaCkEL+edyU98YJAdr1qxo6NTA+tXfFxZ
 0qMjAaP7snC5P8PplFcV/xK9CodbuyMU4wAaYXOmyYaZ1SkTwkX6xxU/1uQSSQKELXWR
 9+6w==
X-Gm-Message-State: AOAM533YqOra06bcSXu/tMu2fLh3VSfT+eUBTI0yfi5d6TR8BHGTZ/Lh
 Ss5rUvVxbTeXY/JS71zJwglT9V+XM5A=
X-Google-Smtp-Source: ABdhPJz2XgoT72p+J1IEev0UxGNaExz9iH54AWtb94RSJiAOD1F3iSe4OlzHhK0X1hLovqNHAkVwJQ==
X-Received: by 2002:adf:ba8b:: with SMTP id p11mr5512216wrg.328.1609958765465; 
 Wed, 06 Jan 2021 10:46:05 -0800 (PST)
Received: from localhost.localdomain
 (241.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id q143sm4058434wme.28.2021.01.06.10.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 10:46:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/system: Remove deprecated 'fulong2e' machine alias
Date: Wed,  6 Jan 2021 19:46:02 +0100
Message-Id: <20210106184602.3771551-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Thomas Huth <huth@tuxfamily.org>, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 libvir-list@redhat.com, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'fulong2e' machine alias has been marked as deprecated since
QEMU v5.1 (commit c3a09ff68dd, the machine is renamed 'fuloong2e').
Time to remove it now.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/system/deprecated.rst       | 5 -----
 docs/system/removed-features.rst | 5 +++++
 hw/mips/fuloong2e.c              | 1 -
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index bacd76d7a58..e20bfcb17a4 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -309,11 +309,6 @@ The 'scsi-disk' device is deprecated. Users should use 'scsi-hd' or
 System emulator machines
 ------------------------
 
-mips ``fulong2e`` machine (since 5.1)
-'''''''''''''''''''''''''''''''''''''
-
-This machine has been renamed ``fuloong2e``.
-
 ``pc-1.0``, ``pc-1.1``, ``pc-1.2`` and ``pc-1.3`` (since 5.0)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 8b20d78a4d0..430fc33ca18 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -120,6 +120,11 @@ mips ``r4k`` platform (removed in 5.2)
 This machine type was very old and unmaintained. Users should use the ``malta``
 machine type instead.
 
+mips ``fulong2e`` machine alias (removed in 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+This machine has been renamed ``fuloong2e``.
+
 Related binaries
 ----------------
 
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 29805242caa..bac2adbd5ae 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -383,7 +383,6 @@ static void mips_fuloong2e_init(MachineState *machine)
 static void mips_fuloong2e_machine_init(MachineClass *mc)
 {
     mc->desc = "Fuloong 2e mini pc";
-    mc->alias = "fulong2e";             /* Incorrect name used up to QEMU 4.2 */
     mc->init = mips_fuloong2e_init;
     mc->block_default_type = IF_IDE;
     mc->default_cpu_type = MIPS_CPU_TYPE_NAME("Loongson-2E");
-- 
2.26.2


