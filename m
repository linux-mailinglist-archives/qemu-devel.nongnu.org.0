Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC056527F17
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 10:01:14 +0200 (CEST)
Received: from localhost ([::1]:45282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqVf7-0003KF-1Q
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 04:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqVGO-0000qc-Gv
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:35:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nqVGL-0001tl-Cs
 for qemu-devel@nongnu.org; Mon, 16 May 2022 03:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652686528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTgRsj8NlcLuxb0bTfm5LyIXjnSaPod2WbGMp9zC9sI=;
 b=ajt2+gVUsC4dCcstf8+yBwspt+s/okugcfZZrtxm/qSQwFvrg2iad2R7qXBBkPPkmJ7XIJ
 dz2W0B/lsr/EEyvzQKqRHMbxVD0fckTX5jfux/pEoNUc7Xhqfz2LhCkekiPCMzUixURSAr
 X7k969RO5IqHwfa+NrKt4kTZ7cDGAl4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-hcQ6M61-Mhy5r-vE3d2ckA-1; Mon, 16 May 2022 03:35:24 -0400
X-MC-Unique: hcQ6M61-Mhy5r-vE3d2ckA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B8281D9F883;
 Mon, 16 May 2022 07:35:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F156940CF8E2;
 Mon, 16 May 2022 07:35:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D8E3E21E692B; Mon, 16 May 2022 09:35:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Andrea Bolognani <abologna@redhat.com>
Subject: [PULL 04/11] qapi: Add missing separators between sections
Date: Mon, 16 May 2022 09:35:15 +0200
Message-Id: <20220516073522.3880774-5-armbru@redhat.com>
In-Reply-To: <20220516073522.3880774-1-armbru@redhat.com>
References: <20220516073522.3880774-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Andrea Bolognani <abologna@redhat.com>

This only affects readability. The generated documentation
doesn't change.

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220503073737.84223-4-abologna@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json | 5 +++++
 qapi/block.json      | 1 +
 qapi/crypto.json     | 7 +++++++
 qapi/machine.json    | 1 +
 qapi/migration.json  | 4 ++++
 5 files changed, 18 insertions(+)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index b66494e8c5..34dae298ee 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1744,6 +1744,7 @@
 # Since: 2.3
 #
 # Example:
+#
 # -> { "execute": "blockdev-backup",
 #      "arguments": { "device": "src-id",
 #                     "sync": "full",
@@ -2008,6 +2009,7 @@
 # @on-target-error: the action to take on an error on the target,
 #                   default 'report' (no limitations, since this applies to
 #                   a different block device than @device).
+#
 # @unmap: Whether to try to unmap target sectors where source has
 #         only zero. If true, and target unallocated sectors will read as zero,
 #         target image sectors will be unmapped; otherwise, zeroes will be
@@ -2029,6 +2031,7 @@
 #                When true, this job will automatically disappear from the query
 #                list without user intervention.
 #                Defaults to true. (Since 3.1)
+#
 # Since: 1.3
 ##
 { 'struct': 'DriveMirror',
@@ -2342,6 +2345,7 @@
 #                When true, this job will automatically disappear from the query
 #                list without user intervention.
 #                Defaults to true. (Since 3.1)
+#
 # Returns: nothing on success.
 #
 # Since: 2.6
@@ -4139,6 +4143,7 @@
 # @throttle-group: the name of the throttle-group object to use. It
 #                  must already exist.
 # @file: reference to or definition of the data source block device
+#
 # Since: 2.11
 ##
 { 'struct': 'BlockdevOptionsThrottle',
diff --git a/qapi/block.json b/qapi/block.json
index 3f100d4887..e0f7898ed1 100644
--- a/qapi/block.json
+++ b/qapi/block.json
@@ -105,6 +105,7 @@
 #
 # Returns: - Nothing on success
 #          - If @device is not a valid block device, DeviceNotFound
+#
 # Notes:    Ejecting a device with no media results in success
 #
 # Since: 0.14
diff --git a/qapi/crypto.json b/qapi/crypto.json
index 8e0b4764e5..21c670eefa 100644
--- a/qapi/crypto.json
+++ b/qapi/crypto.json
@@ -32,6 +32,7 @@
 #
 # @raw: raw bytes. When encoded in JSON only valid UTF-8 sequences can be used
 # @base64: arbitrary base64 encoded binary data
+#
 # Since: 2.6
 ##
 { 'enum': 'QCryptoSecretFormat',
@@ -51,6 +52,7 @@
 # @sha384: SHA-384. (since 2.7)
 # @sha512: SHA-512. (since 2.7)
 # @ripemd160: RIPEMD-160. (since 2.7)
+#
 # Since: 2.6
 ##
 { 'enum': 'QCryptoHashAlgorithm',
@@ -75,6 +77,7 @@
 # @twofish-128: Twofish with 128 bit / 16 byte keys
 # @twofish-192: Twofish with 192 bit / 24 byte keys
 # @twofish-256: Twofish with 256 bit / 32 byte keys
+#
 # Since: 2.6
 ##
 { 'enum': 'QCryptoCipherAlgorithm',
@@ -95,6 +98,7 @@
 # @cbc: Cipher Block Chaining
 # @xts: XEX with tweaked code book and ciphertext stealing
 # @ctr: Counter (Since 2.8)
+#
 # Since: 2.6
 ##
 { 'enum': 'QCryptoCipherMode',
@@ -114,6 +118,7 @@
 # @plain: 64-bit sector number truncated to 32-bits
 # @plain64: 64-bit sector number
 # @essiv: 64-bit sector number encrypted with a hash of the encryption key
+#
 # Since: 2.6
 ##
 { 'enum': 'QCryptoIVGenAlgorithm',
@@ -170,6 +175,7 @@
 # @key-secret: the ID of a QCryptoSecret object providing the
 #              decryption key. Mandatory except when probing image for
 #              metadata only.
+#
 # Since: 2.6
 ##
 { 'struct': 'QCryptoBlockOptionsLUKS',
@@ -194,6 +200,7 @@
 # @iter-time: number of milliseconds to spend in
 #             PBKDF passphrase processing. Currently defaults
 #             to 2000. (since 2.8)
+#
 # Since: 2.6
 ##
 { 'struct': 'QCryptoBlockCreateOptionsLUKS',
diff --git a/qapi/machine.json b/qapi/machine.json
index c9bdae40eb..79901e1c09 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -299,6 +299,7 @@
 #        returning does not indicate that a guest has accepted the request or
 #        that it has shut down.  Many guests will respond to this command by
 #        prompting the user in some way.
+#
 # Example:
 #
 # -> { "execute": "system_powerdown" }
diff --git a/qapi/migration.json b/qapi/migration.json
index 409eb086a2..fc1c157d3f 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -1422,7 +1422,9 @@
 # @state: The state the migration is currently expected to be in
 #
 # Returns: nothing on success
+#
 # Since: 2.11
+#
 # Example:
 #
 # -> { "execute": "migrate-continue" , "arguments":
@@ -1736,6 +1738,7 @@
 # Since: 4.2
 #
 # Example:
+#
 # <- { "event": "UNPLUG_PRIMARY",
 #      "data": { "device-id": "hostdev0" },
 #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
@@ -1845,6 +1848,7 @@
 # Since: 5.2
 #
 # Example:
+#
 #   {"execute": "calc-dirty-rate", "arguments": {"calc-time": 1,
 #                                                'sample-pages': 512} }
 #
-- 
2.35.3


