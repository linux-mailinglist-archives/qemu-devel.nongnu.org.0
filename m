Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012A01C5776
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 15:52:32 +0200 (CEST)
Received: from localhost ([::1]:41674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVxzr-0006Jf-1L
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 09:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jVxy6-0004Tc-4j
 for qemu-devel@nongnu.org; Tue, 05 May 2020 09:50:42 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25889
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jVxy5-0003DI-7p
 for qemu-devel@nongnu.org; Tue, 05 May 2020 09:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588686640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NTdEIxm9fOejVm3VhMcln3vTOUaqBblNOSSuKeS2mM=;
 b=PjitRmjUaRB9UjKZSebPkMgsa1cKvsA0XzXAubs1Ff65Lrsv6lOUKoxsJVT+W/RdzwUWkc
 i3TySLLZihvwEne2M5MR7W3jsY1Ol/9IPXSSYFdBv5YGTDCc5JKPvusS3obDgW0siFkQZW
 lVtkDdLnVrYkTkfleMBwgTdfHhWZIX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-FtakOY2uOX6Jm0mt-79CVA-1; Tue, 05 May 2020 09:50:37 -0400
X-MC-Unique: FtakOY2uOX6Jm0mt-79CVA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06EA08014C1;
 Tue,  5 May 2020 13:50:36 +0000 (UTC)
Received: from localhost (ovpn-112-219.ams2.redhat.com [10.36.112.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F9F31000232;
 Tue,  5 May 2020 13:50:35 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH 3/3] docs/s390x: document vfio-ccw
Date: Tue,  5 May 2020 15:50:25 +0200
Message-Id: <20200505135025.14614-4-cohuck@redhat.com>
In-Reply-To: <20200505135025.14614-1-cohuck@redhat.com>
References: <20200505135025.14614-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 00:37:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a basic example for passing a dasd via vfio-ccw.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 docs/system/s390x/vfio-ccw.rst | 58 ++++++++++++++++++++++++++++++++++
 docs/system/target-s390x.rst   |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 docs/system/s390x/vfio-ccw.rst

diff --git a/docs/system/s390x/vfio-ccw.rst b/docs/system/s390x/vfio-ccw.rs=
t
new file mode 100644
index 000000000000..3b465578971f
--- /dev/null
+++ b/docs/system/s390x/vfio-ccw.rst
@@ -0,0 +1,58 @@
+Subchannel passthrough via vfio-ccw
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+vfio-ccw (based upon the mediated vfio device infrastructure) allows to
+make certain I/O subchannels and their devices available to a guest. The
+host will not interact with those subchannels/devices any more.
+
+Note that while vfio-ccw should work with most non-QDIO devices, only ECKD
+DASD have really been tested.
+
+Example configuration
+---------------------
+
+Step 1: configure the host device
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Note: it is recommended to use the ``mdevctl`` tool for this step. If this
+is not possible or wanted, follow the manual procedure below.
+
+* Locate the subchannel for the device (in this example, ``0.0.2b09``)::
+
+    [root@host ~]# lscss | grep 0.0.2b09 | awk '{print $2}'
+    0.0.0313
+
+* Unbind the subchannel (in this example, ``0.0.0313``) from the standard
+  I/O subchannel driver and bind it to the vfio-ccw driver::
+
+    [root@host ~]# echo 0.0.0313 > /sys/bus/css/devices/0.0.0313/driver/un=
bind
+    [root@host ~]# echo 0.0.0313 > /sys/bus/css/drivers/vfio_ccw/bind
+
+* Create the mediated device (identified by a uuid)::
+
+    [root@host ~]# uuidgen
+    7e270a25-e163-4922-af60-757fc8ed48c6
+    [root@host ~]# echo "7e270a25-e163-4922-af60-757fc8ed48c6" > /sys/bus/=
css/devices/0.0.0313/mdev_supported_types/vfio_ccw-io/create
+
+Step 2: configure QEMU
+~~~~~~~~~~~~~~~~~~~~~~
+
+* Reference the created mediated device and (optionally) pick a device id =
to
+  be presented in the guest (here, ``fe.0.1234``, which will end up visibl=
e
+  in the guest as ``0.0.1234``::
+
+    -device vfio-ccw,devno=3Dfe.0.1234,sysfsdev=3D/sys/bus/mdev/devices/7e=
270a25-e163-4922-af60-757fc8ed48c6
+
+* Start the guest. The device (here, ``0.0.1234``) should now be usable::
+
+    [root@guest ~]# lscss -d 0.0.1234
+    Device   Subchan.  DevType CU Type Use  PIM PAM POM  CHPIDs          =
=20
+    ----------------------------------------------------------------------
+    0.0.1234 0.0.0007  3390/0e 3990/e9      f0  f0  ff   1a2a3a0a 00000000
+    [root@guest ~]# chccwdev -e 0.0.1234
+    Setting device 0.0.1234 online
+    [  197.011652] dasd-eckd 0.0.1234: A channel path to the device has be=
come operational
+    [  197.014468] dasd-eckd 0.0.1234: New DASD 3390/0E (CU 3990/01) with =
10017 cylinders, 15 heads, 224 sectors
+    [  197.045606] dasd-eckd 0.0.1234: DASD with 4 KB/block, 7212240 KB to=
tal size, 48 KB/track, compatible disk layout
+    [  197.049034]  dasda:VOL1/  0X2B09: dasda1
+    Done
diff --git a/docs/system/target-s390x.rst b/docs/system/target-s390x.rst
index 2592a05303ef..644e404ef9fd 100644
--- a/docs/system/target-s390x.rst
+++ b/docs/system/target-s390x.rst
@@ -25,6 +25,7 @@ or vfio-ap is also available.
    s390x/vfio-ap
    s390x/css
    s390x/3270
+   s390x/vfio-ccw
=20
 Architectural features
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--=20
2.21.3


