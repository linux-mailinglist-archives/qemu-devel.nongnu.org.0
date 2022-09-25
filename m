Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1FB5E92ED
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 14:06:35 +0200 (CEST)
Received: from localhost ([::1]:46416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocQP4-0003N8-7B
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 08:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrU-0002wA-Ce
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:57 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ocPrS-0006Js-Pp
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 07:31:51 -0400
Received: by mail-pl1-x636.google.com with SMTP id w20so3902378ply.12
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 04:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=gBbYIR+cYUeZZvc5gKxNpLwekX68RaD7k9jxuyBt2nM=;
 b=RloJdN42EcVyV+5IR4av96YpzAswmToWEH9m7h1YZ6CEPyUIKF42hxt726/3P1cDT0
 sRAN5cwchPXrJA2NMlCJ+Ef81aBstmGXBZ4QLik9eOUp+vfr2b+ZdWfFFJP4aD9gulHm
 0kN1tYDh9pvzS+8I3tKESmqVfWcMHY6MQDbARExDRluYwABmWlAMevGNl1U5z/+bYnM6
 NLLd+Cp4kpn703eAz87p13aGeNXmxRJgBeAa1x3xqTmZOpq2GyLrAPuON1se0SaEJ9Ty
 Cq5SXeyNR745M3/cuJgCoNFArbhwHDGckLDmLbr1gB8GrZQOun45juiRD4/KR0QAfS7p
 GJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=gBbYIR+cYUeZZvc5gKxNpLwekX68RaD7k9jxuyBt2nM=;
 b=3iZ4TYlXp0YgJ1hMku/Noeryqt8eS8+NAnnP9Q+09KB8mtykeELguCyFlWPdS5Q9PW
 WIcaxNMCvvzf9P5qno1E7Z/S/8HKqfDSmNyqqh27YtomfWix7EtQNq4fEMrgCj38qPjF
 lqMi++b7I8eBJfx1hRcIJCnRg2labgBqMdkN9RBV+ffHIbP3JK9dfkOM+128XGpaygxd
 BrymeOafcPLCht/AN25V3eWBOXdmGdeGjAjqXnRjuRuwdqwAZN0qtNc/uDcUOT5u45O/
 govJRjQ7lu5GbCfiXEWjHz7f7tVc2O84D5Ja4OsU+KtqHVdbYNB+26dHZaHvxKip6KxG
 hmsw==
X-Gm-Message-State: ACrzQf2mszcnJUiWhI6HmfyWI+m2CUSQClLwqdMOYp5Fpx1FLkvsxZrr
 3z8u4Nv9PCbZzLhYoOgUNIOzl2hmgoY=
X-Google-Smtp-Source: AMsMyM4p5ZPbp3KJLRMyaDHrHgz5X+MvAeqFlr6eAblRpzoOJUc/0gUlkI3cSGLLtN17EmgiQG5JXQ==
X-Received: by 2002:a17:90a:b00a:b0:203:87a3:9e70 with SMTP id
 x10-20020a17090ab00a00b0020387a39e70mr19104487pjq.218.1664105509895; 
 Sun, 25 Sep 2022 04:31:49 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a1709027e8400b00176c6738d13sm9187760pla.169.2022.09.25.04.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 04:31:49 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 27/54] hw/usb: dev-mtp: Use g_mkdir()
Date: Sun, 25 Sep 2022 19:30:05 +0800
Message-Id: <20220925113032.1949844-28-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220925113032.1949844-1-bmeng.cn@gmail.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x636.google.com
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

Use g_mkdir() to create a directory on all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---

(no changes since v2)

Changes in v2:
- Change to use g_mkdir()

 hw/usb/dev-mtp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 5831395cef..1cac1cd435 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -14,7 +14,7 @@
 #include "qemu/error-report.h"
 #include <wchar.h>
 #include <dirent.h>
-
+#include <glib/gstdio.h>
 #include <sys/statvfs.h>
 
 
@@ -1622,7 +1622,7 @@ static void usb_mtp_write_data(MTPState *s, uint32_t handle)
         if (s->dataset.filename) {
             path = g_strdup_printf("%s/%s", parent->path, s->dataset.filename);
             if (s->dataset.format == FMT_ASSOCIATION) {
-                ret = mkdir(path, mask);
+                ret = g_mkdir(path, mask);
                 if (!ret) {
                     usb_mtp_queue_result(s, RES_OK, d->trans, 3,
                                          QEMU_STORAGE_ID,
-- 
2.34.1


