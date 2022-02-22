Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F754BFFAE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:07:04 +0100 (CET)
Received: from localhost ([::1]:51212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMYcw-0000xN-VG
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:07:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fabian.holler@simplesurance.de>)
 id 1nMYXh-0002Vu-09
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:01:37 -0500
Received: from [2a00:1450:4864:20::631] (port=45015
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fabian.holler@simplesurance.de>)
 id 1nMYXe-0004Yy-TY
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:01:36 -0500
Received: by mail-ej1-x631.google.com with SMTP id p14so44770813ejf.11
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=simplesurance.de; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n7LThoxwgNhXbXQngOYHR1is0bGv0n34kYyWGpi7lvY=;
 b=is83LrTSQl0/uMxse1Yl3o4cJ64NFSg2pwNvCSFKU/gNLdeCcX7BrF6ClUCr0P4wIv
 5iRNXHKrJyPdGy72A+Mg0P8/2wPOJDxBxwaoVnStiSNjBrMe7LA7U6R85U5vA+4fB15Q
 vpm+TL3gpIXtpyEq0kxwHf+4lC8UtYrZYW2XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n7LThoxwgNhXbXQngOYHR1is0bGv0n34kYyWGpi7lvY=;
 b=glHUvyPFeFiu83EcYu9t58bL19tbhOM04Nh4z1lwr3K/eC4pmzNVRlaMZPk4Go0NZt
 q2FBH09DSOfJ2zdUgwZbmTjewCPyT8dnpuJqGyoB1b4FNcF/IBXFGb4D8iceTHP8WyiJ
 /n7NAvLjGUlCFszz99j9Asu525+EhCQcxgCAVZTHDKzCx/bRIFGXsebeu8nGPMpGOqj4
 KALCiMvLAY0Pz+F/JhSYlRoUqyJfr+HvE4iZa4YudGwKek8iELz3piUIfWWSJUwVZ6YM
 RuesX37o7kW3QT0JyIkz4LoHDNFamOIWJRrD+q5ZoqMKDXoAr6zk7E9rcUUp2FJT1SGZ
 8Ytw==
X-Gm-Message-State: AOAM530EAd+sdqvPf2tD0L5WYcv2CIUkVV0sVvPJ2enAVkWIi4O8TW+1
 2esRuF/svG3ev5kUGnuDqUtbg3BhaOF7oRpF
X-Google-Smtp-Source: ABdhPJxZ+b3CiKG9826ifY0IbDQ55hRYMbeyHPGbX40UpvodtgTwU5anAO7TfSgYbSznSC/6wupf4w==
X-Received: by 2002:a17:906:dd7:b0:6b8:783f:a49d with SMTP id
 p23-20020a1709060dd700b006b8783fa49dmr19718841eji.623.1645549292506; 
 Tue, 22 Feb 2022 09:01:32 -0800 (PST)
Received: from ltop.sisu.sh ([2001:16b8:5cfe:5500:f68c:50ff:fe0d:5386])
 by smtp.gmail.com with ESMTPSA id p18sm6495540ejm.63.2022.02.22.09.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:01:31 -0800 (PST)
From: Fabian Holler <fabian.holler@simplesurance.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qapi/migration: Fix examples document wrong field name for
 arguments
Date: Tue, 22 Feb 2022 18:01:16 +0100
Message-Id: <20220222170116.63105-1-fabian.holler@simplesurance.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=fabian.holler@simplesurance.de; helo=mail-ej1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Fabian Holler <fabian.holler@simplesurance.de>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The examples for the snapshot-* and calc-dirty-rate commands document
that arguments for the commands are passed in a 'data' field.
This is wrong, passing them in a "data" field results in
the error:
  {"error": {"class": "GenericError", "desc": "QMP input member 'data'
		       is unexpected"}}
Arguments are expected to be passed in an field called "arguments".

Replace "data" with "arguments" in the snapshot-* and calc-dirty-rate
command examples.

Signed-off-by: Fabian Holler <fabian.holler@simplesurance.de>
---
v2:
  - adapted to Markus Armbruster's suggestions:
    - fix same issue in calc-dirty-rate example
    - improve commit message
v1: 
  https://lists.nongnu.org/archive/html/qemu-devel/2022-02/msg04818.html
---
 qapi/migration.json | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/qapi/migration.json b/qapi/migration.json
index 5975a0e104..18e2610e88 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1843,8 +1843,8 @@
 # Since: 5.2
 #
 # Example:
-#   {"command": "calc-dirty-rate", "data": {"calc-time": 1,
-#                                           'sample-pages': 512} }
+#   {"command": "calc-dirty-rate", "arguments": {"calc-time": 1,
+#                                                'sample-pages': 512} }
 #
 ##
 { 'command': 'calc-dirty-rate', 'data': {'calc-time': 'int64',
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


