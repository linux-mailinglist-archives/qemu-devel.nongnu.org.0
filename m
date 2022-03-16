Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5F24DB7D0
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 19:16:18 +0100 (CET)
Received: from localhost ([::1]:51080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUYC1-0006In-7a
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 14:16:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nUYA5-0004oC-Tt
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 14:14:17 -0400
Received: from mail-ej1-f48.google.com ([209.85.218.48]:45682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nUYA4-00032C-He
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 14:14:17 -0400
Received: by mail-ej1-f48.google.com with SMTP id qa43so5857265ejc.12
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 11:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QC5axzgXputxvM5xnDi8RB4jFWZBZdHutbYEcQP8SEA=;
 b=EGgGZvRn4W7NwPl3+JhDJTC0iT4rC0e33bwcLomKVuPTlKK1GIk6FMglE0KKpG9hJA
 7ttCSETw0ap0uuJUVFOImFLjd6JB9FQN7L0qgxSGubwC52wCHlYyjELAon+Q8MhgBSWN
 jGDgzrE7JHDbvD+NdFWN3xMOuHwaDEkC/ijsnxDgD14bfvtVme9bit/M1HlbOcMzzIZR
 VrfGZ77BVhrT1Q/ZA1FUO7TruiSf/iRAEhWv8GzuaoIxIWsaE+uLFBn6iIzwJRDcTXwC
 xKoeROZ28xu/kT+eL3h7iMXvmIjOCoKMNw3NYd2hbOvBBMRB7DCEOvzoYVSNq6YEsjnv
 CQFg==
X-Gm-Message-State: AOAM533hrZFc4LIxtGftkKFtFhkQKuvqnca2pIu6TrMfOVCH45YFj/5v
 lCMplgjahFOPRq2adSRXc1Ow70Up5lh9bQ==
X-Google-Smtp-Source: ABdhPJx+wxJxowsEHVwru1zA+AVuUl/RUeTTPhVrCftCza1BZTkP+aw8eKCgPU5dLb0BimEp/Xi1QQ==
X-Received: by 2002:a17:906:94d1:b0:6df:8ac3:3eba with SMTP id
 d17-20020a17090694d100b006df8ac33ebamr791410ejy.547.1647454454869; 
 Wed, 16 Mar 2022 11:14:14 -0700 (PDT)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 x17-20020a05640226d100b00418509be2b3sm1384550edd.10.2022.03.16.11.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 11:14:14 -0700 (PDT)
From: Christoph Muellner <cmuellner@linux.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v3] docs/tcg-plugins: document QEMU_PLUGIN behaviour
Date: Wed, 16 Mar 2022 19:14:12 +0100
Message-Id: <20220316181412.1550044-1-cmuellner@linux.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.218.48;
 envelope-from=christophm30@gmail.com; helo=mail-ej1-f48.google.com
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
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU plugins can be loaded via command line arguments or via
the QEMU_PLUGIN environment variable. Currently, only the first method
is documented. Let's document QEMU_PLUGIN.

As drive-by cleanup, this patch fixes the path to the plugins
in the same section of the documentation.

Signed-off-by: Christoph Muellner <cmuellner@linux.com>
---
 docs/devel/tcg-plugins.rst | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index f93ef4fe52..bf66c12885 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -27,13 +27,18 @@ Once built a program can be run with multiple plugins loaded each with
 their own arguments::
 
   $QEMU $OTHER_QEMU_ARGS \
-      -plugin tests/plugin/libhowvec.so,inline=on,count=hint \
-      -plugin tests/plugin/libhotblocks.so
+      -plugin contrib/plugin/libhowvec.so,inline=on,count=hint \
+      -plugin contrib/plugin/libhotblocks.so
 
 Arguments are plugin specific and can be used to modify their
 behaviour. In this case the howvec plugin is being asked to use inline
 ops to count and break down the hint instructions by type.
 
+Linux user-mode emulation also evaluates the environment variable
+``QEMU_PLUGIN``::
+
+  QEMU_PLUGIN="file=contrib/plugin/libhowec.so,inline=on,count=hint" $QEMU
+
 Writing plugins
 ---------------
 
-- 
2.35.1


