Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8D4493EF6
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:22:23 +0100 (CET)
Received: from localhost ([::1]:46014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAEf9-0005Ao-2D
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:22:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAEbJ-000296-Kg; Wed, 19 Jan 2022 12:18:26 -0500
Received: from [2a00:1450:4864:20::32c] (port=38548
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAEas-0008WV-91; Wed, 19 Jan 2022 12:18:02 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 ay14-20020a05600c1e0e00b0034d7bef1b5dso9049432wmb.3; 
 Wed, 19 Jan 2022 09:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=31Kh4cabXgoV77kBjuuBJ8a3rg/29tn10Z0N7J1WtnI=;
 b=AnbPjZcJQzpEwQIY3GdflmkJCKr7/Hz+Q9ySpxtVqIWglU89bPVTk/okCSO0GiktZa
 87sGH2hOEf6vz0LGShKqWpkOCjYaYOQ4kKu2Fv3GjPVWyNB7yWl1vxZIilY2zvjflNhD
 ny/6dgpGYhuzcUTuZ6N7+jcAqow5omhHXn4W6o9JWjlluwtlfrDEebbzyQV96I6bAu6i
 TzEIb9lN3MsUpQg9eGX9vYW3njUgQ4ORdZ9RpQfwE5H9IlygZznWktJDw9xcGLI2RNZ/
 XBCZpaXFXSeE67GQuVmAmjYOGlDdMiySQNjAIJDcIe55kO5LlTKKp+lqX0HKphQIzqTv
 qkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=31Kh4cabXgoV77kBjuuBJ8a3rg/29tn10Z0N7J1WtnI=;
 b=x6AzwPdkD3osFZLXPw03MFXNIun9/tL4FvQFeYPK2KEemcchLhL9xZLHrGKh7p1ApD
 mIeNUwyr54lF0c7eGUCVS/V8mZPXtO0iik1AZbFoujBrosC6wACn9uhOLNdRx17bgJ0u
 zJrBcstRFOQfdr/aGuXCArrtlS1zqswpxgQ+ntbtYZZvGxbFrBiVMuiVTDraTbx8ZAE2
 zi0ObiD7UEZ72MpScOjTNsnzRHlyPNG9gzYCpHdBylQV9sPKMGrmQEohxQLTS4+qVVnQ
 Cvlf9JRipc5bieQKLvI/3lv4LbRegn1T42qvdcPKQni1I96LVVFbdA8HNTyw/M23QJxq
 FiLQ==
X-Gm-Message-State: AOAM530J5hXaTS4nlrmwchnNCZYMJLhjFA68zHaXTjdm6+FB0OJvFvsj
 lyy3uJ19ZfiFBP/vH3RBK6BUCREFsbY=
X-Google-Smtp-Source: ABdhPJyDjPTOBo8KMWUGP3HwAYTsA+akv/nlsPzokejsaAPZ5v6kmivhrxloWpb81gcG4jh+tJrCsQ==
X-Received: by 2002:adf:d1c9:: with SMTP id b9mr29733739wrd.560.1642612675197; 
 Wed, 19 Jan 2022 09:17:55 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 f14sm456546wri.44.2022.01.19.09.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 09:17:54 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH RESEND] qapi/block: Cosmetic change in BlockExportType schema
Date: Wed, 19 Jan 2022 18:17:53 +0100
Message-Id: <20220119171753.221120-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

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


