Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F6F547438
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:27:20 +0200 (CEST)
Received: from localhost ([::1]:33042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzzGx-0002d6-4O
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyV2-0007Es-8c; Sat, 11 Jun 2022 06:37:48 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzyUl-0006rT-Et; Sat, 11 Jun 2022 06:37:32 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 r187-20020a1c44c4000000b0039c76434147so2248314wma.1; 
 Sat, 11 Jun 2022 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LSRhU0WHNkI3RpqcgumxLgAlGt42w+Z0sNOGRHj1XUo=;
 b=DKj1bP5X5Wra55aPOSACmNLnCf/m1dSSMyBt1i6gKjLfhM/X5O6CWBLXglLyNz9WH8
 dJRN3Vs5jiKaMlodyWs2eZ3KHrrXN7XO/jiQAJy3SRPd8xBh8ZBN+50sU2LWGf+LsBxT
 tybrBIKqH5ivyUEJreeqgsIwBQUDRIEY7W/fup3BksTlUUjHi30bEm6eDXJgZCDb7Oct
 VS+Z/7e/JBXupxppTuDfD7GosASFwgKxKdQEDKa+knfu/MYJ5ePVOn/wgn5OFlDTAq0D
 KGIQTAzHQdMXTqhnYtPgT0TgHiK4asDtJQnPt43ndaIgKWF52XaaewoDoxrLPVlP41R6
 2LSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LSRhU0WHNkI3RpqcgumxLgAlGt42w+Z0sNOGRHj1XUo=;
 b=2dEUMUU+QX9OLBdMkTK33oHbDo5XEj69kt4yKqSSm7YKf27imWxKwncB/8hNKb/VBl
 3nXp2qLOltso1isqomqwVuMNlTrjnRyMOJiKnQw3PqUw4gg4YH8wOh2LPThCxSEHfa82
 W1sbTTdX6U1IfE+v1t3gqxyRYwy3pf3767C4yVYdRW5XTTZWJHoN4WEqHq7jOQ/xflWL
 VRAo13lj5K/tIqPWIdHczAWv80LY/Xd+azEW02U0Eq4seDCggmmT3VHEYlZbnWzko1c0
 Ph0ozBFvKI8D/b35qD7aOEqQwFn7HVHTVEUtstb+ZidOzJoEL3hFZZOcjJDrpLqitpKf
 ftSQ==
X-Gm-Message-State: AOAM531/DTbJwvPiPEKv4K7gIiRQV0BjDhEbKlwjSoOsIucxr3/EMMNw
 dYaUL8daZ3TXCBFXCFMMI4+PG8NacbY=
X-Google-Smtp-Source: ABdhPJzJ0SkbL6Kr8/nREy9ZzFdRh88H6gR6lur+Djxwvcs6Hq0qhuEznlv5rMYhdFxrXJEprxoRvA==
X-Received: by 2002:a1c:4c0d:0:b0:39c:5233:1873 with SMTP id
 z13-20020a1c4c0d000000b0039c52331873mr4277207wmf.28.1654943846134; 
 Sat, 11 Jun 2022 03:37:26 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 t7-20020a05600c198700b0039c5fb1f592sm2260172wmq.14.2022.06.11.03.37.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:37:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>, qemu-stable@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 49/49] docs/devel: Fix link to developer mailing lists
Date: Sat, 11 Jun 2022 12:33:12 +0200
Message-Id: <20220611103312.67773-50-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

Ammends commit 9f73de8df0335c9387f4ee39e207a65a1615676f 'docs: rSTify
the "SubmitAPatch" wiki'.

Cc: qemu-stable@nongnu.org
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220520180109.8224-11-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/devel/submitting-a-patch.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index d3876ec1b7..09a8d12c2c 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -18,9 +18,9 @@ one-shot fix, the bare minimum we ask is that:
    <http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297>`__
    policy.) ``git commit -s`` or ``git format-patch -s`` will add one.
 -  All contributions to QEMU must be **sent as patches** to the
-   qemu-devel `mailing list <MailingLists>`__. Patch contributions
-   should not be posted on the bug tracker, posted on forums, or
-   externally hosted and linked to. (We have other mailing lists too,
+   qemu-devel `mailing list <https://wiki.qemu.org/Contribute/MailingLists>`__.
+   Patch contributions should not be posted on the bug tracker, posted on
+   forums, or externally hosted and linked to. (We have other mailing lists too,
    but all patches must go to qemu-devel, possibly with a Cc: to another
    list.) ``git send-email`` (`step-by-step setup
    guide <https://git-send-email.io/>`__ and `hints and
-- 
2.36.1


