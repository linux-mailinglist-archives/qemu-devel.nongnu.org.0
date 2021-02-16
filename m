Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79E931D0D1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 20:19:04 +0100 (CET)
Received: from localhost ([::1]:49030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC5sF-000860-TM
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 14:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kI-0002n9-28
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:10:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC5kG-0004Pw-A2
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 14:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613502647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1QMZo7a6zYlU5tc6+XTo4wMRuDlcmFm6cTcr1Z5AxYE=;
 b=JK5GnqRHzG/RCxjkdq8UWYl4jp0qENhGsGuEq2ZTRRvVPCbZzGhWwgCslpSQ4RplmgSNXb
 J7X5Nin3EWYaB+upFJcMfzxMp7owyZgZRrmc6IG4gurtLf2MQUPC3w12tu/yFqH2ZZgKVl
 e/HCYdrexkTam5J88kAiIOCOVIErAFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-y_AzCrywPUeuXHQ0TPwmpg-1; Tue, 16 Feb 2021 14:10:43 -0500
X-MC-Unique: y_AzCrywPUeuXHQ0TPwmpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC426C284;
 Tue, 16 Feb 2021 19:10:42 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-215.ams2.redhat.com
 [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F0F05C1B4;
 Tue, 16 Feb 2021 19:10:41 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/10] qemu-options: update to show preferred boolean syntax
 for -netdev
Date: Tue, 16 Feb 2021 19:10:21 +0000
Message-Id: <20210216191027.595031-5-berrange@redhat.com>
In-Reply-To: <20210216191027.595031-1-berrange@redhat.com>
References: <20210216191027.595031-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The preferred syntax is to use "foo=on|off", rather than a bare
"foo" or "nofoo".

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu-options.hx | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index bdf159c929..fb2050cda9 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2406,8 +2406,8 @@ DEFHEADING(Network options:)
 
 DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
 #ifdef CONFIG_SLIRP
-    "-netdev user,id=str[,ipv4[=on|off]][,net=addr[/mask]][,host=addr]\n"
-    "         [,ipv6[=on|off]][,ipv6-net=addr[/int]][,ipv6-host=addr]\n"
+    "-netdev user,id=str[,ipv4=on|off][,net=addr[/mask]][,host=addr]\n"
+    "         [,ipv6=on|off][,ipv6-net=addr[/int]][,ipv6-host=addr]\n"
     "         [,restrict=on|off][,hostname=host][,dhcpstart=addr]\n"
     "         [,dns=addr][,ipv6-dns=addr][,dnssearch=domain][,domainname=domain]\n"
     "         [,tftp=dir][,tftp-server-name=name][,bootfile=f][,hostfwd=rule][,guestfwd=rule]"
@@ -2454,8 +2454,8 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
 #endif
 #ifdef __linux__
     "-netdev l2tpv3,id=str,src=srcaddr,dst=dstaddr[,srcport=srcport][,dstport=dstport]\n"
-    "         [,rxsession=rxsession],txsession=txsession[,ipv6=on/off][,udp=on/off]\n"
-    "         [,cookie64=on/off][,counter][,pincounter][,txcookie=txcookie]\n"
+    "         [,rxsession=rxsession],txsession=txsession[,ipv6=on|off][,udp=on|off]\n"
+    "         [,cookie64=on|off][,counter][,pincounter][,txcookie=txcookie]\n"
     "         [,rxcookie=rxcookie][,offset=offset]\n"
     "                configure a network backend with ID 'str' connected to\n"
     "                an Ethernet over L2TPv3 pseudowire.\n"
@@ -2884,7 +2884,7 @@ SRST
                          -device e1000,netdev=n1,mac=52:54:00:12:34:56 \\
                          -netdev socket,id=n1,mcast=239.192.168.1:1102,localaddr=1.2.3.4
 
-``-netdev l2tpv3,id=id,src=srcaddr,dst=dstaddr[,srcport=srcport][,dstport=dstport],txsession=txsession[,rxsession=rxsession][,ipv6][,udp][,cookie64][,counter][,pincounter][,txcookie=txcookie][,rxcookie=rxcookie][,offset=offset]``
+``-netdev l2tpv3,id=id,src=srcaddr,dst=dstaddr[,srcport=srcport][,dstport=dstport],txsession=txsession[,rxsession=rxsession][,ipv6=on|off][,udp=on|off][,cookie64][,counter][,pincounter][,txcookie=txcookie][,rxcookie=rxcookie][,offset=offset]``
     Configure a L2TPv3 pseudowire host network backend. L2TPv3 (RFC3931)
     is a popular protocol to transport Ethernet (and other Layer 2) data
     frames between two systems. It is present in routers, firewalls and
-- 
2.29.2


