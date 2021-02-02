Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8530F30C066
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:56:52 +0100 (CET)
Received: from localhost ([::1]:48200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wAi-0004bk-Mi
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:56:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l6vyt-0000qh-MO
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:44:37 -0500
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:37882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1l6vyq-0000d5-T6
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:44:35 -0500
Received: by mail-qk1-x730.google.com with SMTP id s77so6342054qke.4
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yYigsrveKfrbsmnrMj3vEYVCmyr2kcYzVGzLdt+EfGQ=;
 b=VFUv0WhtZLVXYMqey6gbMIe1RkjC7OERuNFRapKQsYez8Bz7/AxGDNoKaWdXUhKmgW
 7JDmEz3I+5CfDQB9o+hZZkUI/uwfM7FxBN2JvpON+iWF5fjiqtNjY7Rex5vFRzz2qoSu
 /sk/nHpZvtwrqhXsWN2Km0naGu4lDIsNM8RJn4CIyA77t1cHOKKNqbVUbuFLfbIQsgg+
 AcdVltzFBcBnbBJUrRPFZei1ltsnPgnxxmIufaCoMHf0RptOPZf2Dvgxw968pPWkGD8h
 nufmNSqOf61dndDAm7SjIOzOyMO6X9N1637/XADY3VoR/gAolOLadqEueVeFy6ZjpPVL
 jjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yYigsrveKfrbsmnrMj3vEYVCmyr2kcYzVGzLdt+EfGQ=;
 b=A0+ndTFK/pmGE6jJtARjSuH5Oh7z8ouMGToOB8ayjKE2BiKJ7MZSngdBVtC+WNqKmp
 BrqMbw64McypdVE2Yn8Zhlpxwt2c94xwR75urUvUoZETx6tOQ1xxjYG7xqkFilXRXnnC
 BhXzl4qlhhRssTcyJ6Y7KGTTGe43zo3bBkYS+G2NzvTFAsORChLU9lwAZMVytB6sQriG
 HXep51z/U5SIc6ZQV1JAfPkPEjEO06R/yqs6NNrZ6QHqm+Edf8OE8J6vta1npj/k/oax
 xMhjUukP/BJcaJZYy+U/n+Wj+GvJwcciSRjoiGEygLYFSwEHYdMEFUGt8+4SRMqeRjYw
 n89A==
X-Gm-Message-State: AOAM532GR6ShD2OQSBiMEzjLALweKMZbpUyFqXMAtyb/tPH659opM+FD
 cK5W7vDFWVo+qF3BqbUGwO/tNaOvr3Y=
X-Google-Smtp-Source: ABdhPJz95Qbet+1Ivnn3cHbX3oQWozBsATBZvAHAvgZnWEQZBbA5iexrg4GNWDUslSADjNy1zYAatg==
X-Received: by 2002:a05:620a:124c:: with SMTP id
 a12mr21922867qkl.372.1612273471114; 
 Tue, 02 Feb 2021 05:44:31 -0800 (PST)
Received: from localhost.localdomain (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id t62sm16072386qtd.11.2021.02.02.05.44.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Feb 2021 05:44:30 -0800 (PST)
From: John Arbuckle <programmingkidx@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH] Set icon for QEMU binary on Mac OS
Date: Tue,  2 Feb 2021 08:44:10 -0500
Message-Id: <20210202134410.9274-1-programmingkidx@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x730.google.com
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
Cc: John Arbuckle <programmingkidx@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before switching the build system over to Meson, an icon was
added to the QEMU binary on Mac OS. This patch adds back that
feature.

Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
---
 meson.build | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meson.build b/meson.build
index f00b7754fd..7f534f4e75 100644
--- a/meson.build
+++ b/meson.build
@@ -2183,6 +2183,26 @@ foreach target : target_dirs
                link_args: link_args,
                gui_app: exe['gui'])
 
+# set QEMU's icon on Mac OS
+if targetos == 'darwin'
+    newiconpart1 = custom_target('Icon for ' + exe_name + ' - part 1',
+          depends : emulator,
+          input : emulator,
+          output : 'new icon for ' + exe_name + ' - 1',
+          command : ['Rez', '-append',
+           meson.source_root() + '/pc-bios/qemu.rsrc', '-o',
+           meson.current_build_dir() / exe['name']],
+          build_by_default : true)
+
+    custom_target('Icon for ' + exe_name + ' - part 2',
+          depends : newiconpart1,
+          input : emulator,
+          output : 'new icon for ' + exe_name + ' - 2',
+          command : ['SetFile', '-a', 'C',
+           meson.current_build_dir() / exe['name']],
+          build_by_default : true)
+endif
+
     if exe_sign
       emulators += {exe['name'] : custom_target(exe['name'],
                    install: true,
-- 
2.24.3 (Apple Git-128)


