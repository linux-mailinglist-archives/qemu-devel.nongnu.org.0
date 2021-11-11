Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB7144D88A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:48:05 +0100 (CET)
Received: from localhost ([::1]:39014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlBMy-0006fG-LI
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:48:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mlBBb-0006IU-L2
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:36:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mlBBY-0001OC-Kq
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:36:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636641373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lJsNpjyWbvgVU2c/4XKMEI3UN+050by84MGWYoXykVg=;
 b=UbpMwP0xLBosgxHvyokKozPISFHwWRaCI+3s2+nlCMttMNi+dol8q40AKLQz8YL18AHbY2
 7Yngp5Th5v+iATK7KlSJgx4VFuwQD0mU5tdWcpAXRKVm9J+HtIDO0eBAuGNvW22FjvI5Gk
 1oKreJTeb6fnyvxbJyJttaZXBczTSMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-FQtZhxpSPPuB5MNpwae-nQ-1; Thu, 11 Nov 2021 09:36:10 -0500
X-MC-Unique: FQtZhxpSPPuB5MNpwae-nQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7486718D6A2A
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 14:36:08 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94D6C60C9F;
 Thu, 11 Nov 2021 14:35:35 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2] docs: Deprecate incorrectly typed device_add arguments
Date: Thu, 11 Nov 2021 15:35:30 +0100
Message-Id: <20211111143530.18985-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, libvir-list@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While introducing a non-QemuOpts code path for device creation for JSON
-device, we noticed that QMP device_add doesn't check its input
correctly (accepting arguments that should have been rejected), and that
users may be relying on this behaviour (libvirt did until it was fixed
recently).

Let's use a deprecation period before we fix this bug in QEMU to avoid
nasty surprises for users.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/about/deprecated.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 600031210d..c03fcf951f 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -250,6 +250,20 @@ options are removed in favor of using explicit ``blockdev-create`` and
 ``blockdev-add`` calls. See :doc:`/interop/live-block-operations` for
 details.
 
+Incorrectly typed ``device_add`` arguments (since 6.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Due to shortcomings in the internal implementation of ``device_add``, QEMU
+incorrectly accepts certain invalid arguments: Any object or list arguments are
+silently ignored. Other argument types are not checked, but an implicit
+conversion happens, so that e.g. string values can be assigned to integer
+device properties or vice versa.
+
+This is a bug in QEMU that will be fixed in the future so that previously
+accepted incorrect commands will return an error. Users should make sure that
+all arguments passed to ``device_add`` are consistent with the documented
+property types.
+
 System accelerators
 -------------------
 
-- 
2.31.1


