Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BAAFE499
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 19:11:25 +0100 (CET)
Received: from localhost ([::1]:44136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVg44-0002Od-2V
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 13:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45753)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1iVg1S-0000au-Vr
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 13:08:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1iVg1R-00022a-Gp
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 13:08:42 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24148
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1iVg1R-00021w-DH
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 13:08:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573841320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7pA9RmU+lwnOLpnZQo5JRakPX4GfcAqKlKbu17utjAM=;
 b=NmqQPUmKPAPhT0b5o1Y1ja9gnxPhgesv31Ip3jdq829Hnpn1ITMiyzob+HMIdkbKQ31aBI
 Ctf1epfOIi5KoK8vFonA+c4dn3R8u3kFegm9sF6wFwYwReynUZu80tB58Es5HRlc9bTNoI
 vH9nbPf2c5G/VfhT1nHdcLapqRCrqLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-MCcKFsflN3msQCVGk58ivw-1; Fri, 15 Nov 2019 13:08:39 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56F8ADB20;
 Fri, 15 Nov 2019 18:08:38 +0000 (UTC)
Received: from virtlab501.virt.lab.eng.bos.redhat.com
 (virtlab501.virt.lab.eng.bos.redhat.com [10.19.152.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9018560557;
 Fri, 15 Nov 2019 18:08:37 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] python/qemu: accel: Add list_accel() method
Date: Fri, 15 Nov 2019 13:08:27 -0500
Message-Id: <20191115180829.10275-3-wainersm@redhat.com>
In-Reply-To: <20191115180829.10275-1-wainersm@redhat.com>
References: <20191115180829.10275-1-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: MCcKFsflN3msQCVGk58ivw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: fam@euphon.net, ehabkost@redhat.com, philmd@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit cbe6d6365a48 the command `qemu -accel help` returns
the list of accelerators enabled in the QEMU binary. This adds
the list_accel() method which return that same list.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 python/qemu/accel.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/python/qemu/accel.py b/python/qemu/accel.py
index 1b825126c5..a63ff980a9 100644
--- a/python/qemu/accel.py
+++ b/python/qemu/accel.py
@@ -18,6 +18,7 @@ accelerators.
=20
 import logging
 import os
+import subprocess
=20
 LOG =3D logging.getLogger(__name__)
=20
@@ -28,6 +29,25 @@ ADDITIONAL_ARCHES =3D {
     "aarch64" : "armhf"
 }
=20
+def list_accel(qemu_bin):
+    """
+    List accelerators enabled in the QEMU binary.
+
+    @param qemu_bin (str): path to the QEMU binary.
+    @raise Exception: if failed to run `qemu -accel help`
+    @return a list of accelerator names.
+    """
+    if not qemu_bin:
+        return []
+    try:
+        out =3D subprocess.check_output("%s -accel help" % qemu_bin, shell=
=3DTrue)
+    except:
+        LOG.debug("Failed to get the list of accelerators in %s" % qemu_bi=
n)
+        raise
+    lines =3D out.decode().splitlines()
+    # Skip the first line which is the header.
+    return [l.strip() for l in lines[1:] if l]
+
 def kvm_available(target_arch=3DNone):
     host_arch =3D os.uname()[4]
     if target_arch and target_arch !=3D host_arch:
--=20
2.18.1


