Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F3A4DAFFC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 13:45:04 +0100 (CET)
Received: from localhost ([::1]:50198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUT1T-0005xY-JT
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 08:45:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nUSx1-0000rV-SP
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:40:27 -0400
Received: from mail-ed1-f53.google.com ([209.85.208.53]:43879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nUSx0-0003sd-9U
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 08:40:27 -0400
Received: by mail-ed1-f53.google.com with SMTP id b24so2521267edu.10
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 05:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E/uUKfH4GSyC4sG9IEJ213V8GLuVcEFN02PclKhSBFY=;
 b=G3kH3EraUxSW6OoHerhXTzHco/t43lRX7jmZVdKIO2iUJepH/HBbUJJYHBQ5nN5rZ+
 lBPXCDZpjjoflsrI3b+M0ZJPAZaBr8C86fCMhi7gxlfolJerlCwwrcskbGb4CvGEOx9p
 SHW91279vMqSx6WInZfXMyID9JnvL64T0uaw80HVWAkKjsPTnH4X3iZcqf/+38ocMU3l
 pESeXrQOKCppWm44TjnX4X9XlHDT2+nWJLSV1h0uVtVpVhR5lrh9yEXG2Z4hefaq8gLh
 8tTG6xvWm9BASCvGTbH1LM8SQqPE+Io4OnjM/isR09+ATZSRdA/fjAdbEl29+9MtJ4RB
 sp+g==
X-Gm-Message-State: AOAM530LK/Ef4S/pYDzDK/srLIGDEUZxI/hzttv+X2pwCP6bmv0oAPtf
 5jKHKBkVUA9cz0GDixydH3wAOKvlWr0=
X-Google-Smtp-Source: ABdhPJyCh/DcaqS38+U+QQipu3aGlyNTpVZ/M5TMci3NUdNqY3dNt6cGzUlVukTQYjKNLpbqENrF8w==
X-Received: by 2002:a05:6402:3492:b0:416:cbed:4f39 with SMTP id
 v18-20020a056402349200b00416cbed4f39mr24110190edc.87.1647434423570; 
 Wed, 16 Mar 2022 05:40:23 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 da23-20020a056402177700b0041394d8173csm909277edb.31.2022.03.16.05.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 05:40:23 -0700 (PDT)
From: Christoph Muellner <cmuellner@linux.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/tcg-plugins: document QEMU_PLUGIN behaviour
Date: Wed, 16 Mar 2022 13:40:12 +0100
Message-Id: <20220316124012.1413954-1-cmuellner@linux.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.208.53;
 envelope-from=christophm30@gmail.com; helo=mail-ed1-f53.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Christoph Muellner <cmuellner@linux.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU plugins can be loaded via command line arguments or via
the QEMU_PLUGIN environment variable. Currently, only the first method
is documented. Let's document QEMU_PLUGIN.

Signed-off-by: Christoph Muellner <cmuellner@linux.com>
---
 docs/devel/tcg-plugins.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index f93ef4fe52..ba48be18d0 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -34,6 +34,10 @@ Arguments are plugin specific and can be used to modify their
 behaviour. In this case the howvec plugin is being asked to use inline
 ops to count and break down the hint instructions by type.
 
+QEMU also evaluates the environment variable ``QEMU_PLUGIN``::
+
+  QEMU_PLUGIN="file=tests/plugin/libhowec.so,inline=on,count=hint" $QEMU
+
 Writing plugins
 ---------------
 
-- 
2.35.1


