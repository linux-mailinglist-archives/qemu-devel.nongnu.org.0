Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E29F39BCE2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:18:14 +0200 (CEST)
Received: from localhost ([::1]:33588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCWT-0004l6-J3
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAq-00015N-2c
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAe-0001TS-3S
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622822139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0BGW9H49/s3akhFMjW6DOae1MrwVJce9psBYCikG+W8=;
 b=E3oDkxTWFVrH3QyFoZCGSDQWnpRiQzAWLXam4P8M0gX+9cNlaAP5m0AFjXm4dfWDrCEj3f
 emn67HRwOQ9VRrLS9pgIdOKKVgSmQ4F+bvj7DtsevFU97PFRBb4h1OpjmBWePAZynT/Eo6
 78NFuiUT904NRAyBlqVZMtKtJ9wYBiI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-5QdFa-zSN7m2NjS5MGe4CQ-1; Fri, 04 Jun 2021 11:55:37 -0400
X-MC-Unique: 5QdFa-zSN7m2NjS5MGe4CQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E242E9F92A;
 Fri,  4 Jun 2021 15:55:36 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A72D72BFF6;
 Fri,  4 Jun 2021 15:55:35 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] scripts/qemu-ga-client: apply (most) flake8 rules
Date: Fri,  4 Jun 2021 11:55:23 -0400
Message-Id: <20210604155532.1499282-3-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

- Line length should be < 80
- You shouldn't perform unscoped imports except at the top of the module

Notably, the sys.path hack creates problems with the import rule. This
will be fixed later.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qemu-ga-client | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/scripts/qmp/qemu-ga-client b/scripts/qmp/qemu-ga-client
index 97f4047a62..566bddc89d 100755
--- a/scripts/qmp/qemu-ga-client
+++ b/scripts/qmp/qemu-ga-client
@@ -12,7 +12,8 @@
 # Start QEMU with:
 #
 # # qemu [...] -chardev socket,path=/tmp/qga.sock,server=on,wait=off,id=qga0 \
-#   -device virtio-serial -device virtserialport,chardev=qga0,name=org.qemu.guest_agent.0
+#   -device virtio-serial \
+#   -device virtserialport,chardev=qga0,name=org.qemu.guest_agent.0
 #
 # Run the script:
 #
@@ -37,6 +38,7 @@
 #
 
 import base64
+import optparse
 import os
 import random
 import sys
@@ -94,9 +96,11 @@ class QemuGuestAgentClient:
         msgs = []
         msgs.append('version: ' + info['version'])
         msgs.append('supported_commands:')
-        enabled = [c['name'] for c in info['supported_commands'] if c['enabled']]
+        enabled = [c['name'] for c in info['supported_commands']
+                   if c['enabled']]
         msgs.append('\tenabled: ' + ', '.join(enabled))
-        disabled = [c['name'] for c in info['supported_commands'] if not c['enabled']]
+        disabled = [c['name'] for c in info['supported_commands']
+                    if not c['enabled']]
         msgs.append('\tdisabled: ' + ', '.join(disabled))
 
         return '\n'.join(msgs)
@@ -119,11 +123,11 @@ class QemuGuestAgentClient:
                     if ipaddr['ip-address-type'] == 'ipv4':
                         addr = ipaddr['ip-address']
                         mask = self.__gen_ipv4_netmask(int(ipaddr['prefix']))
-                        msgs.append("\tinet %s  netmask %s" % (addr, mask))
+                        msgs.append(f"\tinet {addr}  netmask {mask}")
                     elif ipaddr['ip-address-type'] == 'ipv6':
                         addr = ipaddr['ip-address']
                         prefix = ipaddr['prefix']
-                        msgs.append("\tinet6 %s  prefixlen %s" % (addr, prefix))
+                        msgs.append(f"\tinet6 {addr}  prefixlen {prefix}")
             if nif['hardware-address'] != '00:00:00:00:00:00':
                 msgs.append("\tether " + nif['hardware-address'])
 
@@ -237,6 +241,8 @@ def _cmd_suspend(client, args):
 
 def _cmd_shutdown(client, args):
     client.shutdown()
+
+
 _cmd_powerdown = _cmd_shutdown
 
 
@@ -280,17 +286,15 @@ def main(address, cmd, args):
 
 
 if __name__ == '__main__':
-    import optparse
-    import os
-    import sys
+    address = os.environ.get('QGA_CLIENT_ADDRESS')
 
-    address = os.environ['QGA_CLIENT_ADDRESS'] if 'QGA_CLIENT_ADDRESS' in os.environ else None
-
-    usage = "%prog [--address=<unix_path>|<ipv4_address>] <command> [args...]\n"
+    usage = ("%prog [--address=<unix_path>|<ipv4_address>]"
+             " <command> [args...]\n")
     usage += '<command>: ' + ', '.join(commands)
     parser = optparse.OptionParser(usage=usage)
     parser.add_option('--address', action='store', type='string',
-                      default=address, help='Specify a ip:port pair or a unix socket path')
+                      default=address,
+                      help='Specify a ip:port pair or a unix socket path')
     options, args = parser.parse_args()
 
     address = options.address
-- 
2.31.1


