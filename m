Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636323AD5C4
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:21:20 +0200 (CEST)
Received: from localhost ([::1]:52270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNnb-000213-52
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYT-0007B5-Dp
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYG-0006GK-Na
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cokoIgISI8t29Zprq+J845AXg6lB+GSlxTstiiYgkbg=;
 b=QubTwNBSWa1xWvn9i+XCVD7qqdX2xRc0/hTcM+r1k6kxSWPMpEQgWfbP/TtyvevVntCzF7
 xyCeBG8CoNVnCi237dZioFZjBd2M3RT9a0xrRX9icYNMgm11kdpT+3a/mds0bph3RZHgRc
 ATqvUYgkjP1inR7nvp944QLK+QJFT4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-ZyKJuxadNwu4PIFfvgteyQ-1; Fri, 18 Jun 2021 19:05:26 -0400
X-MC-Unique: ZyKJuxadNwu4PIFfvgteyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8864C801B0F;
 Fri, 18 Jun 2021 23:05:25 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4ED41017CE5;
 Fri, 18 Jun 2021 23:05:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/72] scripts/qemu-ga-client: add module docstring
Date: Fri, 18 Jun 2021 19:04:07 -0400
Message-Id: <20210618230455.2891199-25-jsnow@redhat.com>
In-Reply-To: <20210618230455.2891199-1-jsnow@redhat.com>
References: <20210618230455.2891199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Turn that nice usage comment into a docstring.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210604155532.1499282-6-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qemu-ga-client | 65 +++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/scripts/qmp/qemu-ga-client b/scripts/qmp/qemu-ga-client
index 8eb4015e61..e81937e0ea 100755
--- a/scripts/qmp/qemu-ga-client
+++ b/scripts/qmp/qemu-ga-client
@@ -1,41 +1,42 @@
 #!/usr/bin/env python3
 
-# QEMU Guest Agent Client
-#
+"""
+QEMU Guest Agent Client
+
+Usage:
+
+Start QEMU with:
+
+# qemu [...] -chardev socket,path=/tmp/qga.sock,server,wait=off,id=qga0 \
+  -device virtio-serial \
+  -device virtserialport,chardev=qga0,name=org.qemu.guest_agent.0
+
+Run the script:
+
+$ qemu-ga-client --address=/tmp/qga.sock <command> [args...]
+
+or
+
+$ export QGA_CLIENT_ADDRESS=/tmp/qga.sock
+$ qemu-ga-client <command> [args...]
+
+For example:
+
+$ qemu-ga-client cat /etc/resolv.conf
+# Generated by NetworkManager
+nameserver 10.0.2.3
+$ qemu-ga-client fsfreeze status
+thawed
+$ qemu-ga-client fsfreeze freeze
+2 filesystems frozen
+
+See also: https://wiki.qemu.org/Features/QAPI/GuestAgent
+"""
+
 # Copyright (C) 2012 Ryota Ozaki <ozaki.ryota@gmail.com>
 #
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
-#
-# Usage:
-#
-# Start QEMU with:
-#
-# # qemu [...] -chardev socket,path=/tmp/qga.sock,server=on,wait=off,id=qga0 \
-#   -device virtio-serial \
-#   -device virtserialport,chardev=qga0,name=org.qemu.guest_agent.0
-#
-# Run the script:
-#
-# $ qemu-ga-client --address=/tmp/qga.sock <command> [args...]
-#
-# or
-#
-# $ export QGA_CLIENT_ADDRESS=/tmp/qga.sock
-# $ qemu-ga-client <command> [args...]
-#
-# For example:
-#
-# $ qemu-ga-client cat /etc/resolv.conf
-# # Generated by NetworkManager
-# nameserver 10.0.2.3
-# $ qemu-ga-client fsfreeze status
-# thawed
-# $ qemu-ga-client fsfreeze freeze
-# 2 filesystems frozen
-#
-# See also: https://wiki.qemu.org/Features/QAPI/GuestAgent
-#
 
 import argparse
 import base64
-- 
2.31.1


