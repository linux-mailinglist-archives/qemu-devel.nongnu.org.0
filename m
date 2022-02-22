Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351604BFE20
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:08:57 +0100 (CET)
Received: from localhost ([::1]:45698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXig-0004m2-Im
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:08:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fabian.holler@simplesurance.de>)
 id 1nMVwG-0002pa-3G
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 09:14:48 -0500
Received: from [2a00:1450:4864:20::630] (port=43995
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fabian.holler@simplesurance.de>)
 id 1nMVwD-0000RB-3f
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 09:14:47 -0500
Received: by mail-ej1-x630.google.com with SMTP id d10so43343665eje.10
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 06:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=simplesurance.de; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pO6MXMQ8u0jNeWFtnz/TZLj2XZ7uLqCdsBpUAQpIn2c=;
 b=bbfHDbnBUvNVWbgWImx6K5MKVa6nmavP7Udm54pzuFPHmLjj/8b4HEd1NzIlU5HaIr
 XIW6FXr1JHhRsOLqrVKVxatefqo3erK50JHnyfthTGANhwYtbF/NsGXgZn2rOnzY2RDE
 l/Lq4pB3MaHRhF4xha4UtsTRUYhLnNb5lCeeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pO6MXMQ8u0jNeWFtnz/TZLj2XZ7uLqCdsBpUAQpIn2c=;
 b=nA3TaUUBdh+SZlaFyM+CMffhQv8OhubzLzTBLSzTPy4B0D1skqrTL0uuLpZkv5HFWn
 exBZNivlwL5CaN82wq2n7WcDYJ8lco2Ojpr3DWkGSDwnjnltkj2RLopTBx/y81QV94I9
 oAgHiHFv2NwSm7uEkDYnMBowPBySVGOjuK/qLBmZdmL1GsOoQ7BCRFy07ouxCHVRTo1b
 kSXnSVIxs2UW3/V2RRGkSYmD1OZXRmqkXp8OJdDcZyngRJw/pHZTcADBrj1Ox5a1cmHk
 /MUmFFQkd4YzSHlEBE4+CtV9NtUaskmS27vrxp2bdNAjfsX4XAl0Cyi534ilrTIhpENN
 Zrhw==
X-Gm-Message-State: AOAM533eRwx63i53feErRIXSDsSAOZVyl0BpZy180ALjTp08X7UFW0zB
 OW6hH2rdYyJt3jIh/ihFEXV2rS6mrXxWURCi
X-Google-Smtp-Source: ABdhPJwzS4exRojvUhUlmMpvwrGOtOX3+myQLbc4P1FAs2r7Sl1kvMBPEhUbrh8kE1ssQHwRI3fcQg==
X-Received: by 2002:a17:906:60d6:b0:6cf:e577:c93f with SMTP id
 f22-20020a17090660d600b006cfe577c93fmr19929908ejk.8.1645539282401; 
 Tue, 22 Feb 2022 06:14:42 -0800 (PST)
Received: from ltop.sisu.sh ([2001:16b8:5cfe:5500:ca5b:76ff:fe4b:bbaf])
 by smtp.gmail.com with ESMTPSA id j23sm151622eje.78.2022.02.22.06.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:14:41 -0800 (PST)
From: Fabian Holler <fabian.holler@simplesurance.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] schemas: fix: wrong field name 'data' in client snapshot msg
 examples
Date: Tue, 22 Feb 2022 15:14:31 +0100
Message-Id: <20220222141431.43559-1-fabian.holler@simplesurance.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=fabian.holler@simplesurance.de; helo=mail-ej1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Feb 2022 10:46:50 -0500
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
Cc: Fabian Holler <fabian.holler@simplesurance.de>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The examples for the snapshot-* commands documented that arguments for
the commands must be passed in a 'data' field.
This is wrong, passing them in a "data" field results in
the error:
  {"error": {"class": "GenericError", "desc": "QMP input member 'data'
		       is unexpected"}}

Arguments are expected to be passed in an field called "arguments".
Replace "data" with "arguments" in the snapshot-* command examples.

Signed-off-by: Fabian Holler <fabian.holler@simplesurance.de>
---
 qapi/migration.json | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 5975a0e104..1c6296897d 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1888,7 +1888,7 @@
 # Example:
 #
 # -> { "execute": "snapshot-save",
-#      "data": {
+#      "arguments": {
 #         "job-id": "snapsave0",
 #         "tag": "my-snap",
 #         "vmstate": "disk0",
@@ -1949,7 +1949,7 @@
 # Example:
 #
 # -> { "execute": "snapshot-load",
-#      "data": {
+#      "arguments": {
 #         "job-id": "snapload0",
 #         "tag": "my-snap",
 #         "vmstate": "disk0",
@@ -2002,7 +2002,7 @@
 # Example:
 #
 # -> { "execute": "snapshot-delete",
-#      "data": {
+#      "arguments": {
 #         "job-id": "snapdelete0",
 #         "tag": "my-snap",
 #         "devices": ["disk0", "disk1"]
-- 
2.35.1


