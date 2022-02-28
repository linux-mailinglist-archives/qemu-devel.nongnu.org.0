Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC294C6A96
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:35:04 +0100 (CET)
Received: from localhost ([::1]:52454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeIx-0004dP-VK
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAe-00046w-6X
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAX-00077v-OJ
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646047579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/WribdSqBDrS9EBFUPb/GxDSQEjGsdR9Dd4RYOl2eBg=;
 b=YBbYwWFKJCAkP1jAnOdX3vnvSgoTBQmo13q23BY+fdLAZPlv4SHsEZHnWemLyC1G62Jxcw
 vGN/7RkZaJg01iwhbuQRVmn0p8+EjeVRVF6aDNIuIy8TXoE+O9kxNtON3TGgLOSG0cnoOy
 LeSLu5ufj+K9nmsc1mSp2+mc10XDFPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-ZIJoPuM0MYm3Lpl28UPY1w-1; Mon, 28 Feb 2022 06:26:16 -0500
X-MC-Unique: ZIJoPuM0MYm3Lpl28UPY1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92D54824FA6;
 Mon, 28 Feb 2022 11:26:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C5DE4E2A6;
 Mon, 28 Feb 2022 11:26:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CCF4021E6A3E; Mon, 28 Feb 2022 12:26:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] qapi/migration: Fix examples document wrong field name for
 arguments
Date: Mon, 28 Feb 2022 12:26:08 +0100
Message-Id: <20220228112613.520040-5-armbru@redhat.com>
In-Reply-To: <20220228112613.520040-1-armbru@redhat.com>
References: <20220228112613.520040-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Fabian Holler <fabian.holler@simplesurance.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabian Holler <fabian.holler@simplesurance.de>

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
Message-Id: <20220222170116.63105-1-fabian.holler@simplesurance.de>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


