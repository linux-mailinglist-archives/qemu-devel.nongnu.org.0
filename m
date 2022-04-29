Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929435150CB
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 18:27:53 +0200 (CEST)
Received: from localhost ([::1]:52782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkTTE-0003p3-3K
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 12:27:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nkSqy-0007Wc-I8
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:48:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1nkSqv-0001aD-Ko
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 11:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651247297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l+XivAVPFP1NJ0txrweu9kkDDANRpXtza2o9q7rfxJU=;
 b=DcoOg5PpIghYZVynuYXhAcgopCN/3GIbkx7AEorokM2xxqS5Sds/WjK6uqGvjNaRVl/S1P
 0mQiPgGsDQUukH8YTe90PzXm98fzMD04ehcLSYtAUJSGefCJPztUUTjZD38YWxYKjBAO9X
 amzwu5L5Yq+47F2qC4AOGB8hPfHxKqg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-iGXdI9F7Ndu3AhLjhaPiTg-1; Fri, 29 Apr 2022 11:48:15 -0400
X-MC-Unique: iGXdI9F7Ndu3AhLjhaPiTg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5464B3834C02;
 Fri, 29 Apr 2022 15:48:15 +0000 (UTC)
Received: from harajuku.usersys.redhat.com (unknown [10.40.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43474416363;
 Fri, 29 Apr 2022 15:48:12 +0000 (UTC)
From: Andrea Bolognani <abologna@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] qapi: Add missing separators between sections
Date: Fri, 29 Apr 2022 17:47:54 +0200
Message-Id: <20220429154758.354610-4-abologna@redhat.com>
In-Reply-To: <20220429154758.354610-1-abologna@redhat.com>
References: <20220429154758.354610-1-abologna@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Andrea Bolognani <abologna@redhat.com>
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
index 1ec54c15ca..829e70a168 100644
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
index d25a481ce4..9ec17b3992 100644
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
2.35.1


