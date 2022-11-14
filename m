Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAED628EDA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:04:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouin8-00075L-W1; Mon, 14 Nov 2022 18:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ouifP-0002SL-Gh
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ouZSe-0003fp-NX
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 08:25:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668432315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=S+pRfrG9v8kOLPUjnWpuoGQKHosLSH+HCnMzAH/LMsE=;
 b=AoblWB2N+kux1mg2+JVVzrTebaS+6VULItQUvTdluj16xNGbs9293jGqYp/4wQts2i4IKF
 os64ELErf6nxxbiKhSdiVQDJqpilUwNE3M2DiXkct1mEVLm8SzkIkDvWLbVkMTS3zlM2zk
 fT2Kkl24MhsUsO6HpqgQbIM6/ff9np0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-XTeQb3zfPZSo-vDJrlTV3A-1; Mon, 14 Nov 2022 08:25:10 -0500
X-MC-Unique: XTeQb3zfPZSo-vDJrlTV3A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAAE7299E75F;
 Mon, 14 Nov 2022 13:25:09 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4FA82024CBF;
 Mon, 14 Nov 2022 13:25:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Collin Walling <walling@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 "Jason J . Herne" <jjherne@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>
Subject: [PATCH] docs/system/s390x: Document the "loadparm" machine property
Date: Mon, 14 Nov 2022 14:25:02 +0100
Message-Id: <20221114132502.110213-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

The "loadparm" machine property is useful for selecting alternative
kernels on the disk of the guest, but so far we do not tell the users
yet how to use it. Add some documentation to fill this gap.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2128235
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/system/s390x/bootdevices.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/docs/system/s390x/bootdevices.rst b/docs/system/s390x/bootdevices.rst
index b5950133e8..40089c35a9 100644
--- a/docs/system/s390x/bootdevices.rst
+++ b/docs/system/s390x/bootdevices.rst
@@ -53,6 +53,32 @@ recommended to specify a CD-ROM device via ``-device scsi-cd`` (as mentioned
 above) instead.
 
 
+Selecting kernels with the ``loadparm`` property
+------------------------------------------------
+
+The ``s390-ccw-virtio`` machine supports the so-called ``loadparm`` parameter
+which can be used to select the kernel on the disk of the guest that the
+s390-ccw bios should boot. When starting QEMU, it can be specified like this::
+
+ qemu-system-s390x -machine s390-ccw-virtio,loadparm=<string>
+
+The first way to use this parameter is to use the word ``PROMPT`` as the
+``<string>`` here. In that case the s390-ccw bios will show a list of
+installed kernels on the disk of the guest and ask the user to enter a number
+to chose which kernel should be booted -- similar to what can be achieved by
+specifying the ``-boot menu=on`` option when starting QEMU. Note that the menu
+list will only show the names of the installed kernels when using a DASD-like
+disk image with 4k byte sectors, on normal SCSI-style disks with 512-byte
+sectors, there is not enough space for the zipl loader on the disk to store
+the kernel names, so you only get a list without names here.
+
+The second way to use this parameter is to use a number in the range from 0
+to 31. The numbers that can be used here correspond to the numbers that are
+shown when using the ``PROMPT`` option, and the s390-ccw bios will then try
+to automatically boot the kernel that is associated with the given number.
+Note that ``0`` can be used to boot the default entry.
+
+
 Booting from a network device
 -----------------------------
 
-- 
2.31.1


