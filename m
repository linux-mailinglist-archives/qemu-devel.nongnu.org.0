Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E536A11CF66
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 15:09:50 +0100 (CET)
Received: from localhost ([::1]:59967 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifPA5-0004zM-Eb
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 09:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46115)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1ifO3I-0001by-I6
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:58:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1ifO3G-0005Hj-TL
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:58:43 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26845
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1ifO3G-0005GE-Ob
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576155521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4BVR2ZIDZFU03OkFVALH6qlfykzii53qv0O0o9o0n5A=;
 b=e2uaD7j0ju/p4qN9lf9hScABq8lWUtuOTqAwVTJ3Vg4qNogX1zc7GcmOagBa43fIFO6vsn
 4/BB/tL2AarFWALQGpBveGnFydsDXlu90QcNUUolRFM6+HIo7OsM7d0B0JzUWqSSFWuBt/
 ZhQcwgTHVWqVn1fys8RxdDahrbj0Yug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-rRRcxDnZPHyZfEhLY5EhWg-1; Thu, 12 Dec 2019 07:58:40 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9AC3107ACC9;
 Thu, 12 Dec 2019 12:58:39 +0000 (UTC)
Received: from virtlab501.virt.lab.eng.bos.redhat.com
 (virtlab501.virt.lab.eng.bos.redhat.com [10.19.152.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFAFB10013A1;
 Thu, 12 Dec 2019 12:58:38 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] python/qemu: accel: Add list_accel() method
Date: Thu, 12 Dec 2019 07:58:28 -0500
Message-Id: <20191212125831.2654-3-wainersm@redhat.com>
In-Reply-To: <20191212125831.2654-1-wainersm@redhat.com>
References: <20191212125831.2654-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: rRRcxDnZPHyZfEhLY5EhWg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: fam@euphon.net, ehabkost@redhat.com, jsnow@redhat.com,
 alex.bennee@linaro.org, crosa@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit cbe6d6365a48 the command `qemu -accel help` returns
the list of accelerators enabled in the QEMU binary. This adds
the list_accel() method which return that same list.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 python/qemu/accel.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/python/qemu/accel.py b/python/qemu/accel.py
index cbeac10dd1..ddcdbfd9ae 100644
--- a/python/qemu/accel.py
+++ b/python/qemu/accel.py
@@ -14,7 +14,11 @@ accelerators.
 # the COPYING file in the top-level directory.
 #
=20
+import logging
 import os
+import subprocess
+
+LOG =3D logging.getLogger(__name__)
=20
 # Mapping host architecture to any additional architectures it can
 # support which often includes its 32 bit cousin.
@@ -23,6 +27,25 @@ ADDITIONAL_ARCHES =3D {
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
+        out =3D subprocess.check_output([qemu_bin, '-accel', 'help'],
+                                      universal_newlines=3DTrue)
+    except:
+        LOG.debug("Failed to get the list of accelerators in %s" % qemu_bi=
n)
+        raise
+    # Skip the first line which is the header.
+    return [acc.strip() for acc in out.splitlines()[1:]]
+
 def kvm_available(target_arch=3DNone):
     host_arch =3D os.uname()[4]
     if target_arch and target_arch !=3D host_arch:
--=20
2.21.0


