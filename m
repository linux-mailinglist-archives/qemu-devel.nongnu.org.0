Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAD145908A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:49:00 +0100 (CET)
Received: from localhost ([::1]:39238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAct-0007qo-Va
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:49:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAXy-0007xz-4b
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:43:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAXn-0004K6-NE
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637592222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SFAIOcbSoDF4v5hwLFaL98Cg4L2ojN8xij90Aq3r7yM=;
 b=ZKxJsCyZzsk5dz5ZnrJEE8hpThOrNY2zVDNT4lB+Jubetm3goSFnnkdG+PmgmbGXWeO9I9
 2bgkszI9cQc2N9u+DpCFIGMoV7JiwT9SrkCoNZmM0tJ+JIph++0xGPqS1AT7iiH4kKyRTg
 mQXD/VHD3WDx11E7/3H/8ixPhjxtgYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-LYN90xB3M3CNdNhUTE-SlA-1; Mon, 22 Nov 2021 09:43:41 -0500
X-MC-Unique: LYN90xB3M3CNdNhUTE-SlA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34DA1801A02;
 Mon, 22 Nov 2021 14:43:40 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8DFD607D5;
 Mon, 22 Nov 2021 14:43:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 2/6] docs: List more commit-message tags in "submitting-a-patch"
Date: Mon, 22 Nov 2021 15:43:16 +0100
Message-Id: <20211122144320.29178-3-thuth@redhat.com>
In-Reply-To: <20211122144320.29178-1-thuth@redhat.com>
References: <20211122144320.29178-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
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
Cc: Eric Blake <eblake@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kashyap Chamarthy <kchamart@redhat.com>

Add some more examples of commonly used commit-message tags.

(Thanks: Alex Bennée)

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
Message-Id: <20211119193118.949698-3-kchamart@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/submitting-a-patch.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index 6acded5c93..e51259eb9c 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -195,6 +195,10 @@ Example::
  Resolves: https://gitlab.com/qemu-project/qemu/-/issues/42
  Buglink: https://bugs.launchpad.net/qemu/+bug/1804323``
 
+Some other tags that are used in commit messages include "Message-Id:"
+"Tested-by:", "Acked-by:", "Reported-by:", "Suggested-by:".  See ``git
+log`` for these keywords for example usage.
+
 .. _test_your_patches:
 
 Test your patches
-- 
2.27.0


