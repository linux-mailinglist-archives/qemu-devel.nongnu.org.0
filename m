Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884263CECE4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 22:28:32 +0200 (CEST)
Received: from localhost ([::1]:35104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZsN-0007BB-KE
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 16:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m5ZZI-0003I5-5m; Mon, 19 Jul 2021 16:08:49 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:33328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1m5ZZG-00028n-Kb; Mon, 19 Jul 2021 16:08:47 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 v18-20020a17090ac912b0290173b9578f1cso611210pjt.0; 
 Mon, 19 Jul 2021 13:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XM8C4CfVhCFjkQvZK0knProzft3GXcv1cOpNW2wiPCg=;
 b=s9AwxB/Qc1B8brtNYobkly1nXRMeghC9SQV5ouSr8csBdYQy/zh002CJosPfSlv3RV
 DKtP7iWquc1dWuzOwGvaPKHYX9EdYICN4qfHMyFs11jL/OIQwehz34cHFHmai5CXjzel
 b/kbNR20eFODWyGW7cqMQD9jYQIqLiyCgeO588vFwV1y9uITFEVE4Li8Q1yN08t1cnha
 SGWR3C/thqpTT1B7w0IHiqqCP+Ni1VBgDkPZpCLfnscjSrrZbgldJ/74vG8xOoC7MTZn
 lvhjH1a+L1yZ/80cJ9GfwYeTXSG03tWlkxvB/konstAlfCT86/O2o2hKem86YaR8YBRZ
 VrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XM8C4CfVhCFjkQvZK0knProzft3GXcv1cOpNW2wiPCg=;
 b=hlPaPeBvewTUy943ufk8+y53LkgP6OSYYDtzItfN8Ff7HbJX1Z3JzPtvpQKqdZfd1U
 gWrkF6Oqw/P5JkT+sJkc6bCefGzuzln7idwuRPd/vzPP4bHzqYsIGJYSUQlx3pnVZdWu
 E1UtlPaaZIaojcugouGgvKHN9DBw9AHrxI9Rp9UVFfnGyqH48IGm3Z3FGG9qZw4bBypi
 nc/ujpl5MmdESrrrwoaWT0ZRdQoP8Fd3CqHwBc1ahbz0tF0rERHWFrDhfPfEOguqUiRv
 wuw35JRAeGkZLQaWZPJRBRNRmRO/WDrwcvU1CkE4uNu16pKNIe4jCY+bzBL25YNoOy1K
 Besw==
X-Gm-Message-State: AOAM530Dfg0zBGiDVHcKUH7UZt/vmy2S9lTY2WnlOlG9HHtRFGTjUZXn
 z63Uk4pkw2pSUdqkcQDziS+lTrREhXNeYw==
X-Google-Smtp-Source: ABdhPJzpn8QW+GZcrtdvlhkfdReBJvEds2HVzp3rVUoD7kXXfsfoabGdS9R8bKnBfBWnO0kSxd7VjQ==
X-Received: by 2002:a17:90a:f0cf:: with SMTP id
 fa15mr26258246pjb.83.1626725324837; 
 Mon, 19 Jul 2021 13:08:44 -0700 (PDT)
Received: from rekt.ihost.com ([191.193.148.134])
 by smtp.gmail.com with ESMTPSA id e18sm21048805pfc.85.2021.07.19.13.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 13:08:44 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 v6 4/7] qapi/qdev.json: fix DEVICE_DELETED parameters
 doc
Date: Mon, 19 Jul 2021 17:08:24 -0300
Message-Id: <20210719200827.1507276-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210719200827.1507276-1-danielhb413@gmail.com>
References: <20210719200827.1507276-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=danielhb413@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: armbru@redhat.com, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-ppc@nongnu.org, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clarify that @device is optional and that 'path' is the device
path from QOM.

This change follows Markus' suggestion verbatim, provided in full
context here:

https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01891.html

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 qapi/qdev.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index b83178220b..d1d3681a50 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -108,9 +108,9 @@
 # At this point, it's safe to reuse the specified device ID. Device removal can
 # be initiated by the guest or by HMP/QMP commands.
 #
-# @device: device name
+# @device: the device's ID if it has one
 #
-# @path: device path
+# @path: the device's path within the object model
 #
 # Since: 1.5
 #
-- 
2.31.1


