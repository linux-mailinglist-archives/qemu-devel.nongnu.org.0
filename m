Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413651D541C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 17:18:43 +0200 (CEST)
Received: from localhost ([::1]:58288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZc6k-0000Fs-A7
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 11:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jZc3f-000403-Ne
 for qemu-devel@nongnu.org; Fri, 15 May 2020 11:15:31 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:20509
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jZc3e-0005x8-9v
 for qemu-devel@nongnu.org; Fri, 15 May 2020 11:15:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589555729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zfjuT4LY+VaWUB8rPtCcPetLXEZKyEWaB1/4ZEsB1Gc=;
 b=QVPrz1/74U7pp704WCzMkDGKIQNnYqIbnqIN2W5Y8xQg+yv0kcJYLThhEpT+bWx+LCWOvY
 0IueGKqs09iIePFXZ6ldVqnzIbJvwLvCqKiD0YMFcnLmOLW5qAOWIlSqrBhSOLX0+qXlf5
 WgiyjAhgjNqBVYofRVGBf/hbJK8fJJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-CdPyugUVN4i2tNkGPdtP-g-1; Fri, 15 May 2020 11:15:27 -0400
X-MC-Unique: CdPyugUVN4i2tNkGPdtP-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AAD453;
 Fri, 15 May 2020 15:15:26 +0000 (UTC)
Received: from localhost (ovpn-112-229.ams2.redhat.com [10.36.112.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D87691001B07;
 Fri, 15 May 2020 15:15:25 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v2 1/3] docs/s390x: document the virtual css
Date: Fri, 15 May 2020 17:15:16 +0200
Message-Id: <20200515151518.83950-2-cohuck@redhat.com>
In-Reply-To: <20200515151518.83950-1-cohuck@redhat.com>
References: <20200515151518.83950-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:07:24
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add some hints about "devno" rules.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 docs/system/s390x/css.rst    | 86 ++++++++++++++++++++++++++++++++++++
 docs/system/target-s390x.rst |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 docs/system/s390x/css.rst

diff --git a/docs/system/s390x/css.rst b/docs/system/s390x/css.rst
new file mode 100644
index 000000000000..9e472b7813ec
--- /dev/null
+++ b/docs/system/s390x/css.rst
@@ -0,0 +1,86 @@
+The virtual channel subsystem
+=============================
+
+QEMU implements a virtual channel subsystem with subchannels, (mostly
+functionless) channel paths, and channel devices (virtio-ccw, 3270, and
+devices passed via vfio-ccw). It supports multiple subchannel sets (MSS) and
+multiple channel subsystems extended (MCSS-E).
+
+All channel devices support the ``devno`` property, which takes a parameter
+in the form ``<cssid>.<ssid>.<device number>``.
+
+The default channel subsystem image id (``<cssid>``) is ``0xfe``. Devices in
+there will show up in channel subsystem image ``0`` to guests that do not
+enable MCSS-E. Note that devices with a different cssid will not be visible
+if the guest OS does not enable MCSS-E (which is true of all supported guest
+operating systems today).
+
+Supported values for the subchannel set id (``<ssid>``) range from ``0-3``.
+Devices with a ssid that is not ``0`` will not be visible if the guest OS
+does not enable MSS (any Linux version that supports virtio also enables MSS).
+Any device may be put into any subchannel set, there is no restriction by
+device type.
+
+The device number can range from ``0-0xffff``.
+
+If the ``devno`` property is not specified for a device, QEMU will choose the
+next free device number in subchannel set 0, skipping to the next subchannel
+set if no more device numbers are free.
+
+QEMU places a device at the first free subchannel in the specified subchannel
+set. If a device is hotunplugged and later replugged, it may appear at a
+different subchannel. (This is similar to how z/VM works.)
+
+
+Examples
+--------
+
+* a virtio-net device, cssid/ssid/devno automatically assigned::
+
+    -device virtio-net-ccw
+
+  In a Linux guest (without default devices and no other devices specified
+  prior to this one), this will show up as ``0.0.0000`` under subchannel
+  ``0.0.0000``.
+
+  The auto-assigned-properties in QEMU (as seen via e.g. ``info qtree``)
+  would be ``dev_id = "fe.0.0000"`` and ``subch_id = "fe.0.0000"``.
+
+* a virtio-rng device in subchannel set ``0``::
+
+    -device virtio-rng-ccw,devno=fe.0.0042
+
+  If added to the same Linux guest as above, it would show up as ``0.0.0042``
+  under subchannel ``0.0.0001``.
+
+  The properties for the device would be ``dev_id = "fe.0.0042"`` and
+  ``subch_id = "fe.0.0001"``.
+
+* a virtio-gpu device in subchannel set ``2``::
+
+    -device virtio-gpu-ccw,devno=fe.2.1111
+
+  If added to the same Linux guest as above, it would show up as ``0.2.1111``
+  under subchannel ``0.2.0000``.
+
+  The properties for the device would be ``dev_id = "fe.2.1111"`` and
+  ``subch_id = "fe.2.0000"``.
+
+* a virtio-mouse device in a non-standard channel subsystem image::
+
+    -device virtio-mouse-ccw,devno=2.0.2222
+
+  This would not show up in a standard Linux guest.
+
+  The properties for the device would be ``dev_id = "2.0.2222"`` and
+  ``subch_id = "2.0.0000"``.
+
+* a virtio-keyboard device in another non-standard channel subsystem image::
+
+    -device virtio-keyboard-ccw,devno=0.0.1234
+
+  This would not show up in a standard Linux guest, either, as ``0`` is not
+  the standard channel subsystem image id.
+
+  The properties for the device would be ``dev_id = "0.0.1234"`` and
+  ``subch_id = "0.0.0000"``.
diff --git a/docs/system/target-s390x.rst b/docs/system/target-s390x.rst
index 7d76ae97b401..37ca032d98ef 100644
--- a/docs/system/target-s390x.rst
+++ b/docs/system/target-s390x.rst
@@ -23,6 +23,7 @@ or vfio-ap is also available.
 
 .. toctree::
    s390x/vfio-ap
+   s390x/css
 
 Architectural features
 ======================
-- 
2.25.4


