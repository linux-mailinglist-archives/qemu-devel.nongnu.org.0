Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A482939BCD5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:15:49 +0200 (CEST)
Received: from localhost ([::1]:53364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCU8-0007B2-LJ
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAo-00012X-49
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAi-0001Um-CC
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622822142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8A0QyiFtIa/YHrZEZGqGKLmmdmSltI5sa0lAzhT9UI=;
 b=b+l0KlJgSFZ3YYumnX8MyuATPLG0yZ0JYa6ANwwUZF+YQemhLxxhK9Y8v59rt8Kq1LJcyc
 +1wWxwo/2L7MEQ/NqVonfjEUk4sEpByoPXdUDXf8Ikc7oIozGKzEzLH9ZO0UndNeUKnncB
 ilrh9ZcFtIleV7yketLWbVZ3CfsVbN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-6G2UoYjwM22hXVXtoI_YxQ-1; Fri, 04 Jun 2021 11:55:40 -0400
X-MC-Unique: 6G2UoYjwM22hXVXtoI_YxQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA3599F92C;
 Fri,  4 Jun 2021 15:55:39 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E997A5B4A4;
 Fri,  4 Jun 2021 15:55:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] scripts/qemu-ga-client: add module docstring
Date: Fri,  4 Jun 2021 11:55:26 -0400
Message-Id: <20210604155532.1499282-6-jsnow@redhat.com>
In-Reply-To: <20210604155532.1499282-1-jsnow@redhat.com>
References: <20210604155532.1499282-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Turn that nice usage comment into a docstring.

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


