Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5AF4DC73A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 14:06:44 +0100 (CET)
Received: from localhost ([::1]:54866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUppy-0000sm-NW
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 09:06:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUpmy-0008Of-KK
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 09:03:36 -0400
Received: from [2607:f8b0:4864:20::429] (port=36426
 helo=mail-pf1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUpmx-0003OE-1u
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 09:03:36 -0400
Received: by mail-pf1-x429.google.com with SMTP id z16so6781205pfh.3
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 06:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5SFWoc2PePXVe1v48i1hiXu3b8/aaAYOP/fgUUqSyPc=;
 b=YeuWqEJO1SeAw10/kNufiGL0LTp+WB/7BPkAHReEqPjWSXKvuiiaHK7jYzM1bE2z5f
 G5LDHPxZ7AoRfeLA76PUdB0a6YOcUntRtqgNGQXfgTHxkwUTROza1gCsEv+vP3AUMAO0
 /3XHgcpXZSd5uXLdTj+Kh3DZ/144T+FyYc8qH1dbqXeGu7Ie8CraN9cIla0J5cVjBNxx
 oKlXIxU5k4a/2jAvAkLUuaPqw39dBLmaU+FMc4fpcCV3lxCnD0Mnrslf17qDehxh33LT
 OTaMNfqbzVzqDyObVRtDWHRwqH1MkHuKNZBD7ILcDRRqH2bfbg8BEDYBSwUvT5k9GOW9
 PNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5SFWoc2PePXVe1v48i1hiXu3b8/aaAYOP/fgUUqSyPc=;
 b=gskKL4JuFBbBZrDVKQMN9kPHEtC7Etki8QZAtScr72sSRCQQRWbZvzeMNqmznRDzB5
 aJBr35Nfi3spNontrytxRAeo1TzckSsOnVQb4AxmsOuRo/uX9JbB33H78Rq4RLb7iknJ
 qJx2+OTzUB1WrJCgvQ14VAw0e7q2eY6X6UMT6bjIcmkNxLhFzFQ/cU6FdJYe5S9CtkHe
 lI4NXgOi5GMfQt3kwT8mBLE1UL/y3PIyc9EEY7plyGCDSbLIyD0VHI6uVWwwxoxpAmsE
 KgH6ezIsHZyr25oNCY5WhhuAiNc/wf1EKWGMCKYBwanGhSQl4EyvpMQpS8SYnQjR7qa+
 /zag==
X-Gm-Message-State: AOAM530kZIWJ13v6rP1av9TxgO7+VvlNNpeM0UhoD2jlLXoC34ufiKxr
 Q+K9GX8DuoiuCZyja6BMt4OpE67YCjo=
X-Google-Smtp-Source: ABdhPJwShGSgMVdib/bNRiOVdbisKFvFo1Ev2BtQrQbWpAYK1xE1cM986V89GudxrWSRdUlz+HA3XA==
X-Received: by 2002:a62:8f83:0:b0:4f1:68e4:c561 with SMTP id
 n125-20020a628f83000000b004f168e4c561mr4785012pfd.67.1647522213267; 
 Thu, 17 Mar 2022 06:03:33 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a056a00218600b004f65315bb37sm7286298pfi.13.2022.03.17.06.03.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Mar 2022 06:03:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitattributes: Cover Objective-C source files
Date: Thu, 17 Mar 2022 14:03:26 +0100
Message-Id: <20220317130326.39188-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::429
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

See comments in commit 29cf16db23 ("buildsys: Help git-diff
adding .gitattributes config file") for details.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitattributes | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitattributes b/.gitattributes
index 07f430e944..a217cb7bfe 100644
--- a/.gitattributes
+++ b/.gitattributes
@@ -1,3 +1,4 @@
 *.c.inc         diff=c
 *.h.inc         diff=c
+*.m             diff=objc
 *.py            diff=python
-- 
2.34.1


