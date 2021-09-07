Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8789E4021B4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 02:55:03 +0200 (CEST)
Received: from localhost ([::1]:37366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNPOA-0001rH-HM
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 20:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPHk-0002c4-HE; Mon, 06 Sep 2021 20:48:26 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:40764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mNPHg-0003rY-RW; Mon, 06 Sep 2021 20:48:23 -0400
Received: by mail-qt1-x835.google.com with SMTP id c19so6659908qte.7;
 Mon, 06 Sep 2021 17:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UsOT6/JeyB56WiKG7UbAHoKZig4euttAV/jLYfKeiOM=;
 b=PrQ44nydxypCtzRMe0wG5ezmRWqCpDT5i8BzpiOzMT8+Io0/bK65H3wd9/UUacFH2e
 vgRa5R/jMt0waC6nB5WWWlreePs+4G7InVwQYMccECc8nI2/5pq3336LJ4qbeilNzMXL
 FBVxQwkGIqFTu1bZDfIp/ae8nUNW/H3Fhf10vogo+mYhAfrHC5zwOd5cG2jVvbt1PKOS
 JcHdmy4PXOcwtzU9cbAn5oF6UO4CAgBAwjEPlyET/cVr4s/Bd7HlJzyY/OfZNXguoCo+
 RlzXD5Qebiu9EMNdmreaDeiwfgTa6T6+N/SxH5C9/JYT5b1aWpEKTK80+xI/LDRFB9qq
 yQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UsOT6/JeyB56WiKG7UbAHoKZig4euttAV/jLYfKeiOM=;
 b=PSdYNKYvW+GJZHv3sCnjnumT2YkbCAxyIl2PCoybTl7O+7SsVL/gjMXiDlaBHmnWAo
 sHKBbi/0oAA13P7WNd4KavKyocsow2akUeGsZ8N36b14tbuPGyk7iS9iWM8otF5q+cf7
 No1iiAJKGz9YF1AFhsZ8f8DixjdGNMgWPloElfByR05NB1kC6NBH/YjpMRybpV5PMuEs
 GLsZY7lMjzZpQU6w9zhHQQnJFB12GRwwmwrGrHO18B4634p1HQaAXDen66ovPEMmecCw
 7SR0U+H6i4aP0OWIErEuJ2ZjX5tMmKl/d1Me/h/9NeKxlFua5UfklO5/wTrEEVNBp+L1
 UU0Q==
X-Gm-Message-State: AOAM532kR9f5rCu5g/tZSXT4Z0uOSWEKLc/I4utmW8+nK5xm7XGbZW+i
 orM+YAqV6nK7ZiknNksPYY9PcsnGkFI=
X-Google-Smtp-Source: ABdhPJxj0l9BCXUzHg+oxgOmHNJ7JG1MbZK5t+HRiCQbGZ8pZ19IbgLTCtnoOAmiGfTRirDZD54Pxw==
X-Received: by 2002:ac8:424c:: with SMTP id r12mr13071293qtm.183.1630975698040; 
 Mon, 06 Sep 2021 17:48:18 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id x83sm7799538qkb.118.2021.09.06.17.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 17:48:17 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 4/7] qapi/qdev.json: fix DEVICE_DELETED parameters doc
Date: Mon,  6 Sep 2021 21:47:52 -0300
Message-Id: <20210907004755.424931-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907004755.424931-1-danielhb413@gmail.com>
References: <20210907004755.424931-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x835.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clarify that @device is optional and that 'path' is the device
path from QOM.

This change follows Markus' suggestion verbatim, provided in full
context here:

https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01891.html

Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 qapi/qdev.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index b83178220b..0e9cb2ae88 100644
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
+# @path: the device's QOM path
 #
 # Since: 1.5
 #
-- 
2.31.1


