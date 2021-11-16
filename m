Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5104532E6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 14:31:57 +0100 (CET)
Received: from localhost ([::1]:55762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmyZ2-0005zo-IU
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 08:31:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmyAw-0004IC-La
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:07:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmyAu-000794-Nv
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637068020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CVCrRVmjwMZGUiiQ0F5IEURwpXArLc+CGj9dAxpfhD4=;
 b=HhQK+32hQHKvOBWOJRv0pmYlgul6JB4+E2hIU6HlqJlaIxMgvsED1vVjzp8jCpaQtEffMG
 A+mze4GxgF8X7vloe2gu9xPdngpdWiiVkYqDKgVMB92yWE5kOW1wqQe6uQVd9UhAGV4tuH
 c7qoUQLFHXnnab8GtiXKd7ogHNW4C7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-kP7-7FwPMBaxzdUKJ_bqcw-1; Tue, 16 Nov 2021 08:06:56 -0500
X-MC-Unique: kP7-7FwPMBaxzdUKJ_bqcw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A62BF1023F4F;
 Tue, 16 Nov 2021 13:06:55 +0000 (UTC)
Received: from localhost (unknown [10.39.192.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BF835D9DE;
 Tue, 16 Nov 2021 13:06:55 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v2 11/13] docs: Deprecate incorrectly typed device_add arguments
Date: Tue, 16 Nov 2021 14:06:16 +0100
Message-Id: <20211116130618.700441-12-hreitz@redhat.com>
In-Reply-To: <20211116130618.700441-1-hreitz@redhat.com>
References: <20211116130618.700441-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kevin Wolf <kwolf@redhat.com>

While introducing a non-QemuOpts code path for device creation for JSON
-device, we noticed that QMP device_add doesn't check its input
correctly (accepting arguments that should have been rejected), and that
users may be relying on this behaviour (libvirt did until it was fixed
recently).

Let's use a deprecation period before we fix this bug in QEMU to avoid
nasty surprises for users.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20211111143530.18985-1-kwolf@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20211115145409.176785-12-kwolf@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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
2.33.1


