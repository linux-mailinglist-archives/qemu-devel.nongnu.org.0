Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 275102B5CA3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 11:09:27 +0100 (CET)
Received: from localhost ([::1]:42292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexvS-000065-6x
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 05:09:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkY-0003jK-Vp
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kexkX-0003Z5-3p
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:58:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605607088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=roLQ9xAuLbxQoLx9y7mZ1sDIrAf7Br0uy/wknZBshXU=;
 b=AqhXM2IHX+AlSbIThExar/3dLTlrtLqRgYv/ymBVxbKuOJO9kqFEjDXkyWIascJkD74xfd
 ogb0c+KhgYV9Tikrsu9d55/dvIs32bR91ZKq/UUjfv1QPct988lnMsBjevfIV83a+kqBJy
 CLXgJXIbX2TtFjD0A514/e8JGI0pIvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441--PCy8DWjMSWccJ0MQ9XpMA-1; Tue, 17 Nov 2020 04:58:00 -0500
X-MC-Unique: -PCy8DWjMSWccJ0MQ9XpMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04FCA64158;
 Tue, 17 Nov 2020 09:57:59 +0000 (UTC)
Received: from thuth.com (ovpn-113-138.ams2.redhat.com [10.36.113.138])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 323E15B4B6;
 Tue, 17 Nov 2020 09:57:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 06/12] tests/vm: update NetBSD to 9.1
Date: Tue, 17 Nov 2020 10:57:42 +0100
Message-Id: <20201117095748.122371-7-thuth@redhat.com>
In-Reply-To: <20201117095748.122371-1-thuth@redhat.com>
References: <20201117095748.122371-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brad Smith <brad@comstyle.com>

update NetBSD to 9.1

Signed-off-by: Brad Smith <brad@comstyle.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20201114040150.GD13329@humpty.home.comstyle.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/netbsd | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index 447de9747d..596717cc76 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -22,8 +22,8 @@ class NetBSDVM(basevm.BaseVM):
     name = "netbsd"
     arch = "x86_64"
 
-    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.0/images/NetBSD-9.0-amd64.iso"
-    csum = "34da4882ee61bdbf69f241195a8933dc800949d30b43fc6988da853d57fc2b8cac50cf97a0d2adaf93250b4e329d189c1a8b83c33bd515226f37745d50c33369"
+    link = "https://cdn.netbsd.org/pub/NetBSD/NetBSD-9.1/images/NetBSD-9.1-amd64.iso"
+    csum = "65bddc95945991c3b2021f9c8ded7f34c25f0a7611b7aa15a15fe23399e902307e926ae97fcd01dc1662ac67b5f6e4be643c6a2b581692ddcb616d30125066f9"
     size = "20G"
     pkgs = [
         # tools
@@ -38,7 +38,7 @@ class NetBSDVM(basevm.BaseVM):
         "bash",
         "gmake",
         "gsed",
-        "gettext",
+        "gettext-tools",
 
         # libs: crypto
         "gnutls",
-- 
2.18.4


