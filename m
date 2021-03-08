Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A839330B49
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:33:19 +0100 (CET)
Received: from localhost ([::1]:55038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJDCQ-0003bR-IG
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:33:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJDAI-0002IR-HS
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:31:07 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJDAE-0006Zc-1R
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:31:06 -0500
Received: by mail-ed1-x52e.google.com with SMTP id dm26so13826826edb.12
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 02:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=86+F7TLuOTX/QFpFY7tKaGXQfyNrsns45/gj/CHcsUI=;
 b=dBP1cs2+jMwZHbS6kW1XB23ThhmwJ169GSxmzCcvQ4GjP9u57nGbksAL7J5x/ZeLA7
 7UkogrAl13ZyH4sh9jLYrYEyqVXZKDPlyJWLwUJ2FE5nm3J7TWqqZp0Jb86PxI2EcJCm
 /+f/D7WV9jX+IhX0nTvkw6DaBDahaRfMC1Szlm/272XO8hWnwpOJlXiguIhnvVYveor7
 A86bwshvLezlkQQYSnOP2YU/7nP87eVWAJIdT+pL/AsxJyxkFO59MbVhMpKYIjn01qkr
 XODajn8FEYZL2YGZ1L53x/QZsKM1Hv0bG3QnPBU2FXbu1IhRtyzyqTNYUtxVIpcIK0Q9
 7LjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=86+F7TLuOTX/QFpFY7tKaGXQfyNrsns45/gj/CHcsUI=;
 b=QoF+JC1XLLFE+hOKgPsLksSwxIaoPrPbzLo8XZkhMkXw49Rzra3eQkwzdxU6DVIyMu
 IDHmTNrKfd15mczqMRaTf3ltZKVsLaOWRUJTipE+46ser8z+G3DfKnRJmLHfRzRSMLjo
 aUcVpTm1SapVeG+oA4c6njQMy4DxeQWCgYfAzJCsuwtL/2dGRTYoRC6V27UNSmBfQ3+J
 2mMlzn6UMj4b12RCvOAYhev96USsJ/Ncds1IdiYtSMeCOD5kw8t8MR0Y2bnQbhjd+RvG
 BQ6TfcQWvLnTrrjxGxiUBhXOvWdPr4uKS+XcdU6V3X3Pg1ILzzZnm+qrvccjsQB++FuC
 5mUQ==
X-Gm-Message-State: AOAM533y/jZGkPgmN/cc+TeBPHQ8pD0/MEA7L1yx3ejAQLwcvwhzULyL
 QBOGbX3vLlrMem7ziJYnF6irHw==
X-Google-Smtp-Source: ABdhPJxWGxCIISHWkhujsmfW/ggZb464xGEytetWeQo88Ifhft22MRnY3EW7nIrbC+MRvrnrUvwwww==
X-Received: by 2002:aa7:da14:: with SMTP id r20mr9195398eds.181.1615199460408; 
 Mon, 08 Mar 2021 02:31:00 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e8sm6627666edq.77.2021.03.08.02.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 02:30:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AFF801FF7E;
 Mon,  8 Mar 2021 10:30:58 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [qemu-web PATCH] pages: update deprecation policy links to "official"
 manual
Date: Mon,  8 Mar 2021 10:30:49 +0000
Message-Id: <20210308103049.3653-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: pbonzini@redhat.com, thuth@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The links are broken now so lets point them at the right place.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 _posts/2017-08-10-deprecation.md | 2 +-
 download.html                    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/_posts/2017-08-10-deprecation.md b/_posts/2017-08-10-deprecation.md
index d0a7a35..4d007fc 100644
--- a/_posts/2017-08-10-deprecation.md
+++ b/_posts/2017-08-10-deprecation.md
@@ -16,7 +16,7 @@ it.
 Thus we are currently considering to get rid of some of the old interfaces
 and features in a future release and have started to collect a list of such
 old items in our
-[QEMU documentation](https://qemu.weilnetz.de/doc/qemu-doc.html#Deprecated-features).
+[QEMU documentation](https://qemu.org/docs/master/system/deprecated.html).
 If you are running QEMU directly, please have a look at this deprecation
 chapter of the QEMU documentation to see whether you are still using one of
 these old interfaces or features, so you can adapt your setup to use the new
diff --git a/download.html b/download.html
index 3c2df66..e3fc789 100644
--- a/download.html
+++ b/download.html
@@ -58,7 +58,7 @@ permalink: /download/
     <strong>do not</strong> have any bearing on the scope of changes
     included in the release. Non-backward compatible changes may be made
     in any master branch release, provided they have followed the
-    <a href="https://qemu.weilnetz.de/doc/qemu-doc.html#Deprecated-features">deprecation policy</a>
+    <a href="https://qemu.org/docs/master/system/deprecated.html">deprecation policy</a>
     which calls for warnings to be emitted for a minimum of two releases
     prior to the change.
   </p>
-- 
2.20.1


