Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D153CC298
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:19:41 +0200 (CEST)
Received: from localhost ([::1]:58414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hQ4-0002E9-5z
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH9-000810-Bh
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:27 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1m4hH7-0007aG-Lu
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:10:27 -0400
Received: by mail-wr1-x435.google.com with SMTP id l7so14967544wrv.7
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TQ4eoAhFvF5WLmzSkOUBXUWpS6dwt1gpkEIzciIqlv0=;
 b=G3qB79ndPWqTK62xJ4Ahu6EZ7Rl5Os4DCTwrnxls6mFhIp+298Py6os4A2BbQfU4pL
 MVhWLPlPnxvCr0Bz8PiAhxHR+2dw5poyWPKLMakQ2VlK2bu4JEh73/PjQC0aID1RWXvE
 Y9pNtWDcFVzF1Vqk9Bk/se7pBQpi2LXR+UsEPAZtHNimeV1PQw8wBGle931b7sjRh437
 /8lUiPzMBU2J6ADjKM1/yk+SoIuQT3dzrrNKvbTHr/1gUCjSbDORaakNejhq29AFHpXU
 v4YheeZnsEitjjQ69MZv7vCVUIKRh0U6s+wNjKwYLPOoTiO4A/L6KRhwaXo100ifJecv
 X0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TQ4eoAhFvF5WLmzSkOUBXUWpS6dwt1gpkEIzciIqlv0=;
 b=V7Ln9XrZULoQ+TZqAYVcdMMy7NZNYqvMvP2VtX7vq8i0GWVJZOG5Z+VQ9j1WqwFbSd
 W6xsYL1m/h6FQMKYUSVaDPOVQRsg4SIoMvPrwaT2KTc5ZVzwIqcxu7mOq0o7Sq8hS10+
 NrmH2605bNiH/neDQs1TwHIvAGvwOKe4BUIdR2Fe2STJE6NAiztNZKMzpPtFkegcWsrT
 KFKmWp8qefA2f7SyG0QQkMu5dqoSx2JIojkVg4XaogcaMr/rqOQN2sySqmc7ekj8EM3P
 I7AXhftwZrfLfnvZueghV8z6Zy43CWtz3e5DA5dHejZqJpuzzL2iZMfbZOjyjSCmu14U
 qE9A==
X-Gm-Message-State: AOAM532uhbONrk2ptLiL74LrbLScCRdWTpfMRGtOkenwTbRqOslzcW+T
 x+opFT0756jYV/SZzhWNW3bdIJokY2E=
X-Google-Smtp-Source: ABdhPJwir8mf7p/tifKwQA42d/GxZSYvkntkmc8pz+EBim7DR+Y4xJSdnl827OC/2DIXJfBnd0TXnw==
X-Received: by 2002:adf:a1c4:: with SMTP id v4mr17754095wrv.217.1626516624151; 
 Sat, 17 Jul 2021 03:10:24 -0700 (PDT)
Received: from localhost.localdomain ([41.34.125.69])
 by smtp.gmail.com with ESMTPSA id 11sm13846923wmo.10.2021.07.17.03.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 03:10:23 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/13] docs/deprecated: deprecate passing plugin args through
 `arg=`
Date: Sat, 17 Jul 2021 12:09:20 +0200
Message-Id: <20210717100920.240793-14-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717100920.240793-1-ma.mandourr@gmail.com>
References: <20210717100920.240793-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x435.google.com
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
Cc: "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 docs/system/deprecated.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index e2e0090878..aaf0ee5777 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -126,6 +126,12 @@ other options have been processed.  This will either have no effect (if
 if they were not given.  The property is therefore useless and should not be
 specified.
 
+Plugin argument passing through ``arg=<string>`` (since 6.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Passing arguments through ``arg=`` is redundant is makes the command-line less
+readable, especially when the argument itself consist of a name and a value,
+e.g. ``arg="arg_name=arg_value"``. Therefore, the usage of ``arg`` is redundant.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
-- 
2.25.1


