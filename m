Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D2F682A23
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:14:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMndG-0002o3-0k; Tue, 31 Jan 2023 05:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMnd9-0002aw-46
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMnd7-0002aG-0p
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675159963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qtL8SVF7OlFdn8USPoAuPM9WQ2QCSoCp6L5bn835oMo=;
 b=ChOhY4Cvhg665CVwBt1LL4/+Qe+Q2XZIl6TvLFAM49aF3WAvm6WirSdFe7XkVzaOBvfqG/
 MtdyAYCGFjeX4RNqu6FQLV13CYhxE6TWuyP5w7RORBeEfDkrPIMFy/unDqebcXACStYOHO
 RFsOJ4QBRPlBU2Y1Nz6ZcDdbFunTrhQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-lSAWC8HOMRyTnt-4kaXn8g-1; Tue, 31 Jan 2023 05:12:36 -0500
X-MC-Unique: lSAWC8HOMRyTnt-4kaXn8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA81E29AA39D;
 Tue, 31 Jan 2023 10:12:35 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D83A9C15BAD;
 Tue, 31 Jan 2023 10:12:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Sebastian Mitterle <smitterl@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PULL 22/27] docs/s390x/pcidevices: document pci devices on s390x
Date: Tue, 31 Jan 2023 11:12:00 +0100
Message-Id: <20230131101205.1499867-23-thuth@redhat.com>
In-Reply-To: <20230131101205.1499867-1-thuth@redhat.com>
References: <20230131101205.1499867-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Sebastian Mitterle <smitterl@redhat.com>

Add some documentation about the zpci device and how
to use it with pci devices on s390x.

Used source: Cornelia Huck's blog post
https://people.redhat.com/~cohuck/2018/02/19/notes-on-pci-on-s390x.html

Signed-off-by: Sebastian Mitterle <smitterl@redhat.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Message-Id: <20230127123349.55294-1-smitterl@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/s390x/pcidevices.rst | 41 ++++++++++++++++++++++++++++++++
 docs/system/target-s390x.rst     |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 docs/system/s390x/pcidevices.rst

diff --git a/docs/system/s390x/pcidevices.rst b/docs/system/s390x/pcidevices.rst
new file mode 100644
index 0000000000..628effa2f4
--- /dev/null
+++ b/docs/system/s390x/pcidevices.rst
@@ -0,0 +1,41 @@
+PCI devices on s390x
+====================
+
+PCI devices on s390x work differently than on other architectures and need to
+be configured in a slightly different way.
+
+Every PCI device is linked with an additional ``zpci`` device.
+While the ``zpci`` device will be autogenerated if not specified, it is
+recommended to specify it explicitly so that you can pass s390-specific
+PCI configuration.
+
+For example, in order to pass a PCI device ``0000:00:00.0`` through to the
+guest, you would specify::
+
+ qemu-system-s390x ... \
+                   -device zpci,uid=1,fid=0,target=hostdev0,id=zpci1 \
+                   -device vfio-pci,host=0000:00:00.0,id=hostdev0
+
+Here, the zpci device is joined with the PCI device via the ``target`` property.
+
+Note that we don't set bus, slot or function here for the guest as is common in
+other PCI implementations. Topology information is not available on s390x, and
+the guest will not see any of the bus, slot or function information specified
+on the command line.
+
+Instead, ``uid`` and ``fid`` determine how the device is presented to the guest
+operating system.
+
+In case of Linux, ``uid`` will be used in the ``domain`` part of the PCI
+identifier, and ``fid`` identifies the physical slot, i.e.::
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
diff --git a/docs/system/target-s390x.rst b/docs/system/target-s390x.rst
index c636f64113..f6f11433c7 100644
--- a/docs/system/target-s390x.rst
+++ b/docs/system/target-s390x.rst
@@ -26,6 +26,7 @@ or vfio-ap is also available.
    s390x/css
    s390x/3270
    s390x/vfio-ccw
+   s390x/pcidevices
 
 Architectural features
 ======================
-- 
2.31.1


