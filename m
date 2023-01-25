Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C848E67B846
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 18:18:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKjOf-0002PS-QF; Wed, 25 Jan 2023 12:17:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smitterl@redhat.com>)
 id 1pKjOb-0002On-Sn
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 12:17:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smitterl@redhat.com>)
 id 1pKjOS-0003Oo-Sa
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 12:17:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674667021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RTjLRZXhiXJBykDxZuNmXAcx9d/wKSbsdnWLy82R26s=;
 b=RS3Jn2i2n9teecK8K7cFwk1J7HENg9XSQbE4j0DP6+RElSQt9wlLvrcNzF1gilGMLvAxx6
 FM03KhwcqXazcAlY0OW210XwWDuw5cXSUMLEnZ8y4K8tXpXxpnuKX43XBav1t8Q+wLvU/r
 6jhMS+2ds4j05f4mS0r2qZUwtgRmJps=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-ZrerjKkuMTit_m3Kuzfxmw-1; Wed, 25 Jan 2023 12:15:33 -0500
X-MC-Unique: ZrerjKkuMTit_m3Kuzfxmw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF17E3813F29;
 Wed, 25 Jan 2023 17:15:32 +0000 (UTC)
Received: from fedora.. (ovpn-194-166.brq.redhat.com [10.40.194.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 153A12026D4B;
 Wed, 25 Jan 2023 17:15:30 +0000 (UTC)
From: Sebastian Mitterle <smitterl@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-trivial@nongnu.org, thuth@redhat.com,
 clegoate@redhat.com, cohuck@redhat.com
Subject: [PATCH] docs/s390x/pcidevices: document pci devices on s390x
Date: Wed, 25 Jan 2023 18:15:30 +0100
Message-Id: <20230125171530.49542-1-smitterl@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=smitterl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add some documentation about the zpci device and how
to use it with pci devices on s390x.

Used source: Cornelia Huck's blog post
https://people.redhat.com/~cohuck/2018/02/19/notes-on-pci-on-s390x.html

Signed-off-by: Sebastian Mitterle <smitterl@redhat.com>
---
 docs/system/s390x/pcidevices.rst | 34 ++++++++++++++++++++++++++++++++
 docs/system/target-s390x.rst     |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 docs/system/s390x/pcidevices.rst

diff --git a/docs/system/s390x/pcidevices.rst b/docs/system/s390x/pcidevices.rst
new file mode 100644
index 0000000000..2086c1ca29
--- /dev/null
+++ b/docs/system/s390x/pcidevices.rst
@@ -0,0 +1,34 @@
+PCI devices on s390x
+====================
+
+PCI devices on s390x work differently than on other architectures.
+
+To start with, using a PCI device requires the additional ``zpci`` device. For example,
+in order to pass a PCI device ``0000:00:00.0`` through you'd specify::
+
+ qemu-system-s390x ... \
+                   -device zpci,uid=1,fid=0,target=hostdev0,id=zpci1 \ 
+                   -device vfio-pci,host=0000:00:00.0,id=hostdev0
+
+Here, the zpci device is joined with the PCI device via the ``target`` property.
+
+Note that we don't set bus, slot or function here for the guest as is common in other
+PCI implementations. Topology information is not available on s390x. Instead, ``uid``
+and ``fid`` determine how the device is presented to the guest operating system.
+
+In case of Linux, ``uid`` will be used in the ``domain`` part of the PCI identifier, and
+``fid`` identifies the physical slot, i.e.::
+
+ qemu-system-s390x ... \
+                   -device zpci,uid=7,fid=8,target=hostdev0,id=zpci1 \
+                   ...
+
+will be presented in the guest as::
+
+ # lspci -v
+ 0007:00:00.0 ...
+ Physical Slot: 00000008
+ ...
+
+Finally, note that you might have to enable the ``zpci`` feature in the cpu model in oder to use
+it.
diff --git a/docs/system/target-s390x.rst b/docs/system/target-s390x.rst
index c636f64113..fe8251bdef 100644
--- a/docs/system/target-s390x.rst
+++ b/docs/system/target-s390x.rst
@@ -33,3 +33,4 @@ Architectural features
 .. toctree::
    s390x/bootdevices
    s390x/protvirt
+   s390x/pcidevices
-- 
2.37.3


