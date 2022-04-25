Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C22B50E395
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 16:47:56 +0200 (CEST)
Received: from localhost ([::1]:58552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj00J-0007a1-8B
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 10:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgo-0006bS-0a
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:48 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nizgh-0004nD-Js
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 10:27:40 -0400
Received: by mail-pj1-x102f.google.com with SMTP id p6so78301pjm.1
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 07:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uF55zfRGZGLp8oLCUwGZ2krUtjYw224zyy5ygc5qPWk=;
 b=PwNXe3HWc5sk/asa8EHJwPDQT+U2YuMUe7wXMbOA9EMR2jrCAsVxd71k4Acj3I6U8I
 kLQxWB7BLHvzSrrO7FoXJF1HdLuLrPuu9bv05tZ5aPq6ysdplFlFCqlsgI41Ymc7sYH0
 p28r3f26KPdUb53rFyYjKSkXCFNYQAUOPLXhX1LoKTKPGWg7pLYWNSWqCYGlw/DlVUyR
 vE0FzcFh72oyhpqSOykksd/HVpYeYWtLGru1EnYjA0R75Tr6neo0ic8fzBxsW+14do8g
 3xetHWF0Llv9SUe5XIQ+RXZBdH1h2Sxok9mwxWBD1mHACii9MZYE39tkgzDx4p5onFmI
 Ssfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uF55zfRGZGLp8oLCUwGZ2krUtjYw224zyy5ygc5qPWk=;
 b=pJUZEki7ZfiPV39X4cMI1gqBu++mLsbgexi2Li4f61B8MXbXllekpxAZRunivMzAWI
 UKvFlWgGIowYSP02HLpb3nBJKRnVISLOEwiZI7TmeReDzgSzktFzHJI16S8Ulqy+SbHn
 eLnMxi3NF2CAHyi8TekCKJMnk9iK3x4bgNyJYDLUpjEB+mICz6nSr8lBn7Xn6s911Q05
 Ykxv549/M4u4Oh+l963LzPbUwntQvN673VQYTSuuSOoiqO6I7F/uNUCPZcK6fZ5NzRwf
 DpGnYpKQ4k0hEen8P2rmhnI6d5lM97cFhMW127qlFl7KFWWxtKPB7FCtW6mhHuvhWKeN
 q+1w==
X-Gm-Message-State: AOAM5313SeQGzIDfxU6fl0ag8P4537Y/qVfDQyR8yBPJVA+dmQ7D70Fp
 39NtmHTJDf/f1koT2vlgT/c=
X-Google-Smtp-Source: ABdhPJyEZ89kZqYMvcerQ4bWot/pg9iJ/wnvLYtD62XARTmNKKgo6bBX7e1ObOikAVJlIyQoLRO06g==
X-Received: by 2002:a17:902:b286:b0:15b:335b:53e6 with SMTP id
 u6-20020a170902b28600b0015b335b53e6mr18068383plr.169.1650896858442; 
 Mon, 25 Apr 2022 07:27:38 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 t1-20020a628101000000b0050d47199857sm2437968pfd.73.2022.04.25.07.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 07:27:38 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org
Subject: [PATCH 7/9] fsdev: Enable 'local' file system driver backend for
 Windows
Date: Mon, 25 Apr 2022 22:27:03 +0800
Message-Id: <20220425142705.2099270-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425142705.2099270-1-bmeng.cn@gmail.com>
References: <20220425142705.2099270-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102f.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, Guohuai Shi <guohuai.shi@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Guohuai Shi <guohuai.shi@windriver.com>

Only 'local' file system driver will be supported for Windows host.
'proxy' or 'synth' are not supported.

Signed-off-by: Guohuai Shi <guohuai.shi@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 fsdev/qemu-fsdev.c | 2 ++
 fsdev/meson.build  | 1 +
 2 files changed, 3 insertions(+)

diff --git a/fsdev/qemu-fsdev.c b/fsdev/qemu-fsdev.c
index 3da64e9f72..e1cc677ad8 100644
--- a/fsdev/qemu-fsdev.c
+++ b/fsdev/qemu-fsdev.c
@@ -81,6 +81,7 @@ static FsDriverTable FsDrivers[] = {
             NULL
         },
     },
+#ifndef CONFIG_WIN32
     {
         .name = "synth",
         .ops = &synth_ops,
@@ -100,6 +101,7 @@ static FsDriverTable FsDrivers[] = {
             NULL
         },
     },
+#endif
 };
 
 static int validate_opt(void *opaque, const char *name, const char *value,
diff --git a/fsdev/meson.build b/fsdev/meson.build
index b632b66348..2aad081aef 100644
--- a/fsdev/meson.build
+++ b/fsdev/meson.build
@@ -8,6 +8,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
 ), if_false: files('qemu-fsdev-dummy.c'))
 softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
 softmmu_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
+softmmu_ss.add_all(when: 'CONFIG_WIN32', if_true: fsdev_ss)
 
 if have_virtfs_proxy_helper
   executable('virtfs-proxy-helper',
-- 
2.25.1


