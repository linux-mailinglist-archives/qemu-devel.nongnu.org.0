Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD27B3DF140
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 17:18:58 +0200 (CEST)
Received: from localhost ([::1]:37526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAwC1-0007ka-Vn
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 11:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mAw7r-0002Ls-O7
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:14:39 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mAw7q-00024g-G5
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:14:39 -0400
Received: by mail-wr1-x432.google.com with SMTP id z4so25728378wrv.11
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 08:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BXIENmP7JQGWwK8psbRlEY39IJrKh/OgVz/XYlLNos8=;
 b=Md+ZHaXY2nY2zdDqulQtIyGa5b2x43ymvSLVhK1UlK5TeK7bhwb/qa+3146vNqlP/u
 JmcvA6HsaV/UKHWWUHBI2a2FDWbWKHzdNrzsL1nWZqKtyG3tjrOP9JcuHxXVkanxa9RE
 AERGhHuFQC9P3nvTMnu6Mg2E07anZGqNdca0I7yzfrOdjzxsN9nDLO90WBpRXFMWJXGs
 LXAJuSYb9+4fCgPSh5VZnm2FgXBymYSJHaqP18fiFyxuIhxCTYhweGe9KVX1Eny7912h
 5tmJ/1kSXrsrbpV1IMAa3mOBXFz5diVq57FKmll895ojP7pGWbvVI8CT/JmABl6KWMgC
 E5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BXIENmP7JQGWwK8psbRlEY39IJrKh/OgVz/XYlLNos8=;
 b=fauIw38zrnaEFjSJQG5mgp9hj9zZUexNqPWKw9cZXOlQkFBHQCcXlDrQCaF0HnCvPx
 ZsCsyGkJMsZW6FnyZ64zMt9WVSkIuzfXNj/VMz5abVk0J9fHmzWOUcbhPBxOEY3MRdLz
 XOoo2OEwQH7PredOJ8t6QH9okuMQE9GgchIhEv8L73aT5fAcAP8zi6QENpShVelCD02M
 iFSuoElBDx0LKr6iGIENQoYXnPy2FDwJProiAYlcgW1zJnlwF4RiXIPU3OAwFezRJv5C
 HoKlSVxc4VjKsCGb3EJGsyIwOAtdy+2jji3ZhxOwZQoYRDU2OLRGvUhh6DSkZBinSA2o
 wF0A==
X-Gm-Message-State: AOAM5328CM1BTf5ziIS8IbuzWuWR1PDH7/GsoCDjquP1e9+qqyZ4/W+4
 C2p65ugX2W2n7T2KT2ZDS2DaGt7wHy0=
X-Google-Smtp-Source: ABdhPJxv+BVLpJfC6nEIzX+kZ7oQ04EVpLTTlzOVF/+QQ9MSnKZh5OjN/8ExPxxXqpradGM8envmAg==
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr23961953wrn.195.1628003676818; 
 Tue, 03 Aug 2021 08:14:36 -0700 (PDT)
Received: from localhost.localdomain ([197.61.80.206])
 by smtp.gmail.com with ESMTPSA id u11sm14732218wrr.44.2021.08.03.08.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 08:14:36 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] plugins/execlog: removed unintended "s" at the end of log
 lines.
Date: Tue,  3 Aug 2021 17:14:28 +0200
Message-Id: <20210803151428.125323-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 contrib/plugins/execlog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index 2de9f0d7d4..a5275dcc15 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -67,7 +67,7 @@ static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
     /* Print previous instruction in cache */
     if (s->len) {
         qemu_plugin_outs(s->str);
-        qemu_plugin_outs("s\n");
+        qemu_plugin_outs("\n");
     }
 
     /* Store new instruction in cache */
-- 
2.25.1


