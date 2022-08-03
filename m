Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DC0588914
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 11:09:07 +0200 (CEST)
Received: from localhost ([::1]:48472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJANG-00087j-6u
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 05:09:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oJAHQ-0005Rl-Nh
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 05:03:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oJAHN-0006ZA-4G
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 05:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659517379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m1+ufJqALZBmPauTMwlVS4xCrONGMUUKN9s/fdiFons=;
 b=FTEyRKDVdYixxzweX9y3fHQKxwx3rNiYyGW6fsaAW2QFHWNU8pooO37M5TNprzKU374s9Q
 CMB5prEI9awtIodSc3Ir9hfqhmnh739t4OFwSxlySZdsrnZPtD2ivFqid/iCttmg11gB2E
 fCLKQtLYSayHBysPNC1ofhy4wzdCBQY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-1xVVjRFWNKWUUyem-tWnPA-1; Wed, 03 Aug 2022 05:02:58 -0400
X-MC-Unique: 1xVVjRFWNKWUUyem-tWnPA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63A992804007;
 Wed,  3 Aug 2022 09:02:58 +0000 (UTC)
Received: from gondolin.fritz.box (unknown [10.39.193.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B90472026D64;
 Wed,  3 Aug 2022 09:02:57 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] README.rst: fix link formatting
Date: Wed,  3 Aug 2022 11:02:50 +0200
Message-Id: <20220803090250.136556-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make the links render correctly.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 README.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README.rst b/README.rst
index 23795b837740..21df79ef4379 100644
--- a/README.rst
+++ b/README.rst
@@ -39,7 +39,7 @@ Documentation can be found hosted online at
 current development version that is available at
 `<https://www.qemu.org/docs/master/>`_ is generated from the ``docs/``
 folder in the source tree, and is built by `Sphinx
-<https://www.sphinx-doc.org/en/master/>_`.
+<https://www.sphinx-doc.org/en/master/>`_.
 
 
 Building
@@ -78,7 +78,7 @@ format-patch' and/or 'git send-email' to format & send the mail to the
 qemu-devel@nongnu.org mailing list. All patches submitted must contain
 a 'Signed-off-by' line from the author. Patches should follow the
 guidelines set out in the `style section
-<https://www.qemu.org/docs/master/devel/style.html>` of
+<https://www.qemu.org/docs/master/devel/style.html>`_ of
 the Developers Guide.
 
 Additional information on submitting patches can be found online via
-- 
2.37.1


