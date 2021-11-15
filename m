Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 643654507C3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:02:06 +0100 (CET)
Received: from localhost ([::1]:40212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdUj-00013E-Gn
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:02:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdNU-0003rR-M8
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:54:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdNS-0007qL-1A
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:54:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ax/J0cngJOyzUwkAz5FRH5HkX3+2Mw2inG8TjgLcLX4=;
 b=ZfFR/jTf6Az0N6JtUbgRv0ILsIVipt+eVZGCrriEQ9t6MmdUFHAPQiTQOAlUjf2/myPuK8
 lTV2l1avJhP13dCDHj0Z2pzs4kfeUvSIA803uEcK1xeGqM5KsB5YXdXzW5o7t9Kv7ZxTXz
 l3qVrJ1yV/zXfASi4nfgxTfqLkJH3WQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-CSE1DePwNGusYLiCbDPX2w-1; Mon, 15 Nov 2021 09:54:30 -0500
X-MC-Unique: CSE1DePwNGusYLiCbDPX2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1478315726;
 Mon, 15 Nov 2021 14:54:29 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1961C19729;
 Mon, 15 Nov 2021 14:54:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/13] docs: Deprecate incorrectly typed device_add arguments
Date: Mon, 15 Nov 2021 15:54:07 +0100
Message-Id: <20211115145409.176785-12-kwolf@redhat.com>
In-Reply-To: <20211115145409.176785-1-kwolf@redhat.com>
References: <20211115145409.176785-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
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
Message-Id: <20211111143530.18985-1-kwolf@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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


