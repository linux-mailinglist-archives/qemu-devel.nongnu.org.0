Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5694DB25C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:15:20 +0100 (CET)
Received: from localhost ([::1]:53404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUQp-0003H0-AR
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:15:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nUUDO-0007XO-2g
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:01:27 -0400
Received: from mail-ej1-f47.google.com ([209.85.218.47]:38910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nUUDI-000227-0h
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 10:01:24 -0400
Received: by mail-ej1-f47.google.com with SMTP id r13so4389531ejd.5
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 07:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w2DBRP5ONzBKHDI+iXJa9GpWFFwx0+BtztOG7gt1UqY=;
 b=0IpGSEPwB2pa520FM2wE8B39r2LU189EkoGp2eQc2E2IOLqSN43uOse3Xc/STDstfP
 OlBiU2oa3UT/Hr0oHY2SVS2iGddeXSwWrslccyazcujjBU0lOY1UntGedu37h7ZuUGsb
 VIMcX0HD3TAQW9B12EZbTdQqQOc7RHmhw4anUPv+BN3tOK8RHgq9KZ6KiBBjY1wMx59T
 dafqfu7opeO6hDfakGI7xHp2RUTyR6UEhzAHnZCA/HGyqU6kA4iFHs6WLoSI3kJFMY4K
 wYzA0aqyCP3vDX9uC/5hCyaifKNOsnXPf1DGuGI3WhB2TxboesXyPCr5tAsj3XdScTPX
 nMEA==
X-Gm-Message-State: AOAM531ZRpXXgRGyGOjSVlN7c7XY3Abc3eTuM8CQPmMI1pXEBh3qIDr5
 LgCit41IXmnzAafYSIFPr8jDAllZwpOJlQ==
X-Google-Smtp-Source: ABdhPJww5JVB+ktLRhML3rbasDXq8bOceUOkE5aRZjSydNiryhZw3Fnpfi2z3d8mZin1tzwoS7d9hQ==
X-Received: by 2002:a17:906:5006:b0:6ce:3762:c72e with SMTP id
 s6-20020a170906500600b006ce3762c72emr153018ejj.30.1647439277081; 
 Wed, 16 Mar 2022 07:01:17 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 qx13-20020a170906fccd00b006bdeb94f50csm893871ejb.203.2022.03.16.07.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 07:01:16 -0700 (PDT)
From: Christoph Muellner <cmuellner@linux.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] docs/tcg-plugins: document QEMU_PLUGIN behaviour
Date: Wed, 16 Mar 2022 15:01:14 +0100
Message-Id: <20220316140114.1447357-1-cmuellner@linux.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.218.47;
 envelope-from=christophm30@gmail.com; helo=mail-ej1-f47.google.com
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

As drive-by cleanup, this patch fixes the path to the plugins
in the same section of the documentation.

Signed-off-by: Christoph Muellner <cmuellner@linux.com>
---
 docs/devel/tcg-plugins.rst | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index f93ef4fe52..be60b24566 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -27,13 +27,17 @@ Once built a program can be run with multiple plugins loaded each with
 their own arguments::
 
   $QEMU $OTHER_QEMU_ARGS \
-      -plugin tests/plugin/libhowvec.so,inline=on,count=hint \
-      -plugin tests/plugin/libhotblocks.so
+      -plugin contrib/plugin/libhowvec.so,inline=on,count=hint \
+      -plugin contrib/plugin/libhotblocks.so
 
 Arguments are plugin specific and can be used to modify their
 behaviour. In this case the howvec plugin is being asked to use inline
 ops to count and break down the hint instructions by type.
 
+QEMU also evaluates the environment variable ``QEMU_PLUGIN``::
+
+  QEMU_PLUGIN="file=contrib/plugin/libhowec.so,inline=on,count=hint" $QEMU
+
 Writing plugins
 ---------------
 
-- 
2.35.1


