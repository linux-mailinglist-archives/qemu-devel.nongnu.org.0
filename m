Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF718493F10
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:29:19 +0100 (CET)
Received: from localhost ([::1]:33046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAElr-0008Hu-1F
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:29:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAEg2-0000O0-0B; Wed, 19 Jan 2022 12:23:18 -0500
Received: from [2a00:1450:4864:20::334] (port=42626
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAEg0-0000tD-19; Wed, 19 Jan 2022 12:23:17 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso3652393wmf.1; 
 Wed, 19 Jan 2022 09:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EAEd4OhFBVRPxp/SIABMrqaTJWQrsQ/zO2rmaF0oIug=;
 b=M9dYgR3Okuzgc3qlcn1TPEYn8sTiPrR+hgfSmQByeApfVMXmbQbX8jHx5RFy8Ei01H
 y/9nEWOhbRLRw336zqaLcgRUV/F03471iLtOvfD4pwPHBNd5d/GtpVFVgz4B3PifHRUF
 pC7vdgUgLYPBhtUR5++vDUpIun95QK3tejSSABHDAROEjtPRK7wmGJG/vBlXpOSiwgyI
 rn40Ofzd4nKs0dKcHjEDRnMTOeHoNdGiiLEUDMs0ucYe/qdqqxeKY7bwPKkk30ubdQ8D
 JESyCSWd8ukbBN5+fBe2qVDZf+8Ja+/lweDnM+vpYca1JaLCLst/9gbupu3jEotznjOY
 q/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=EAEd4OhFBVRPxp/SIABMrqaTJWQrsQ/zO2rmaF0oIug=;
 b=M3Zb/TTF2XbyfdOPAgnapRMX4h9Ujcl79jpOkW7mfEg8PsUJeEKPdmXWSQVyyGqGRi
 M4OZw4HW11Nd4m8zkeeSwCDJ6lYb2HzPiM73FUfl51wdUkEsks8F5/96Coc/iefbpaUO
 haadmz7EqWNSpgt8M+MJHse3XqBgSUQtLYtKIbKsvaZ27ENSeHk5mnM9ljBREsMmxAFh
 KJ/hCH3B0KZp5adypGq0SNkFWZkGoKDFNkxre6UIKE0i2OVvgMIjH25gERIBuLn5jfpF
 W7QGofz+7x5GuRiIFYCQeEkhdU3NWKFGAXul2ydIHzGBukxkdi7fidb2Ma3rC/UkU3WU
 NcqA==
X-Gm-Message-State: AOAM531ME+awSCHXK7DpnvKlL2qMlDNpWHJLs3Y6jNeFLvwNaFn/BAb7
 8Cq4xfWCzPYws+eXSOY3nq/CSBQOweo=
X-Google-Smtp-Source: ABdhPJwIzUjdyAfjy5Q2cBHzwBVCpMpvDQNrD+HbR8Eor63/0DJro6b9uXkNLQtZ8TnfcQjW04HX0Q==
X-Received: by 2002:a5d:6881:: with SMTP id h1mr29909254wru.250.1642612992265; 
 Wed, 19 Jan 2022 09:23:12 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 t30sm399212wra.95.2022.01.19.09.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 09:23:11 -0800 (PST)
From: "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9=20via?="
 <philippe@mathieu-daude.net>
X-Google-Original-From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9=20via?=
 <qemu-trivial@nongnu.org>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v2] qapi/block: Cosmetic change in BlockExportType
 schema
Date: Wed, 19 Jan 2022 18:23:10 +0100
Message-Id: <20220119172310.221311-1-qemu-trivial@nongnu.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fix long line introduced in commit bb01ea73110 ("qapi/block:
Restrict vhost-user-blk to CONFIG_VHOST_USER_BLK_SERVER").

Suggested-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Trying another git option to see even if my email From:
is "Philippe Mathieu-Daudé via <qemu-trivial@nongnu.org>",
the patch contains the correct From: and can be applied...
---
 qapi/block-export.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index f9ce79a974b..f183522d0d2 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -278,7 +278,8 @@
 ##
 { 'enum': 'BlockExportType',
   'data': [ 'nbd',
-            { 'name': 'vhost-user-blk', 'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
+            { 'name': 'vhost-user-blk',
+              'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
             { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }
 
 ##
-- 
2.34.1


