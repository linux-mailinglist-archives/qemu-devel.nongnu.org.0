Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA8535DE6B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:14:32 +0200 (CEST)
Received: from localhost ([::1]:48114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWHw8-0004wc-2v
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWHpo-0000SM-G6
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:08:00 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWHpm-0004h8-04
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 08:08:00 -0400
Received: by mail-wr1-x434.google.com with SMTP id 12so16216265wrz.7
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 05:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PqvH81v0CcRZh67EoO9qpkreERfLaZWxwreRW1VRrbY=;
 b=wg9gGamdMA1mBaIHKEW9lHH1UKb2UZ0m8snkL+2oxWkTBtu8eTAv5Xb6wzgigHT6OO
 5swVEzbjy1u9LqE9lw2+//5wgAzb2SOYhASwlLl9WTVUKnQmCethTEZuOdJpbVUUUDAI
 ZeUQrNxi5105ht0qDTHrsldpuy/RJeMm93XToIZzcMXqUtDGTr344umTBTsnRgxgrqer
 crVhN7ii3Q6N+1enb5xdQxYndEcLvmXklFotswLiyA/+rmxrA4VI5qJcB6Y7UAtFR418
 JjbIDkk1oyQmgeSw8qSv0vSZ1EDTzTJYH+3mcnLZ39lbADYSJUj0o3W+YoGgpAYzKiT+
 /Wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PqvH81v0CcRZh67EoO9qpkreERfLaZWxwreRW1VRrbY=;
 b=AseHdGAkONR4xxKzsXQ+UOFFVCfY3yPNb2ug3qURBi9rO09faSzTJCnAbiMpW6o129
 K+55TvJ31DxVZOlxjbmqUgl3mj2SM/vzUc+lIxwTohE+AeYhXVxcZXinDnpedjhtx5we
 REKiJ8iO6U4ug2M3cBp/BmEXbovC2eCRc7ZiV5amSpAXoSk3pKAhwbaG7CyHFqa5+d6D
 aMkBF2dZNDm788ay2UtbZBsGopMWp3PkL6TVItY0Gfe3qn7R65Az9SYNuWps3Dqji6T3
 d6Z6rPHjaqm9bPWOOLe9rmbdeISx/vD+kkOecPK4P2bw4SOMvlowxTJx8rpA8E/bNmgo
 Tk8w==
X-Gm-Message-State: AOAM531tZk4ShjizSU3/uliO8gzkwxZ5G5JKUGuOJoXVG+iaI+jvocGf
 3zlPYIydPHZRhB0B0KmZSjdUc0MkAmnrKZyS
X-Google-Smtp-Source: ABdhPJxY6yeZaad9tkVPKzMu6nLdJLsFwn15ezgMW/U6EPB/pC37yVT7My/bU4+Cw8MC1GnyR7rqFQ==
X-Received: by 2002:adf:fcca:: with SMTP id f10mr27892510wrs.148.1618315676738; 
 Tue, 13 Apr 2021 05:07:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o2sm2245275wmc.23.2021.04.13.05.07.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 05:07:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] sphinx: qapidoc: Wrap "If" section body in a paragraph node
Date: Tue, 13 Apr 2021 13:07:52 +0100
Message-Id: <20210413120752.18699-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210413120752.18699-1-peter.maydell@linaro.org>
References: <20210413120752.18699-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

These sections need to be wrapped in a block-level element, such as
Paragraph in order for them to be rendered into Texinfo correctly.

Before (e.g.):

<section ids="qapidoc-713">
  <title>If</title>
  <literal>defined(CONFIG_REPLICATION)</literal>
</section>

became:

  .SS If
  \fBdefined(CONFIG_REPLICATION)\fP.SS \fBBlockdevOptionsReplication\fP (Object)
  ...

After:

<section ids="qapidoc-713">
  <title>If</title>
  <paragraph>
    <literal>defined(CONFIG_REPLICATION)</literal>
  </paragraph>
</section>

becomes:

  .SS If
  .sp
  \fBdefined(CONFIG_REPLICATION)\fP
  .SS \fBBlockdevOptionsReplication\fP (Object)
  ...

Reported-by: Markus Armbruster <armbru@redhat.com>
Tested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210406141909.1992225-2-jsnow@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/sphinx/qapidoc.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/docs/sphinx/qapidoc.py b/docs/sphinx/qapidoc.py
index b7b86b5dffb..b7a2d39c105 100644
--- a/docs/sphinx/qapidoc.py
+++ b/docs/sphinx/qapidoc.py
@@ -278,7 +278,9 @@ def _nodes_for_if_section(self, ifcond):
         nodelist = []
         if ifcond:
             snode = self._make_section('If')
-            snode += self._nodes_for_ifcond(ifcond, with_if=False)
+            snode += nodes.paragraph(
+                '', '', *self._nodes_for_ifcond(ifcond, with_if=False)
+            )
             nodelist.append(snode)
         return nodelist
 
-- 
2.20.1


