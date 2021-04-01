Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE08351516
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:22:41 +0200 (CEST)
Received: from localhost ([::1]:33986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxHU-0003wo-7x
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx80-0002Ef-Rm
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7w-0004WX-Vq
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617282768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=48s+HH9lc/7g2cL7yIzCnxJwjSpO7IN9Rhf+IxED1N0=;
 b=i+G12BuMvRLLBn8/LUzBKM+OX+OdY6jPfK7D+7xf/KhYfOG05IXjCH8VbVC4LeqGXDaf1C
 pgA3LK65fY1/G9XP5ykg7HiF4gRyYNApe2Bp7wh8Wtd3e5Ie4FplkNpA2Jy23Oozd4sMmH
 zX8EQgW1f26H/5jlyBbj64u/oNHlnHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-tWfrKZD2NHuJDjXXWjrTPw-1; Thu, 01 Apr 2021 09:12:46 -0400
X-MC-Unique: tWfrKZD2NHuJDjXXWjrTPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BABB107ACCD;
 Thu,  1 Apr 2021 13:12:45 +0000 (UTC)
Received: from thuth.com (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D92CF51C41;
 Thu,  1 Apr 2021 13:12:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/13] docs: Remove obsolete paragraph about config-target.mak
Date: Thu,  1 Apr 2021 15:12:18 +0200
Message-Id: <20210401131220.3252320-12-thuth@redhat.com>
In-Reply-To: <20210401131220.3252320-1-thuth@redhat.com>
References: <20210401131220.3252320-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

$TARGET-NAME/config-target.mak has been removed a while ago.
Remove it now from the documentation, too.

Fixes: fdb75aeff7 ("configure: remove target configuration")
Message-Id: <20210316124208.455456-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/build-system.rst | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 69ce3087e3..7ef36f42d0 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -426,14 +426,6 @@ Built by configure:
   build outputs. Variables which are potentially different for each
   emulator target are defined by the next file...
 
-`$TARGET-NAME/config-target.mak`
-  TARGET-NAME is the name of a system or userspace emulator, for example,
-  x86_64-softmmu denotes the system emulator for the x86_64 architecture.
-  This file contains the variables which need to vary on a per-target
-  basis. For example, it will indicate whether KVM or Xen are enabled for
-  the target and any other potential custom libraries needed for linking
-  the target.
-
 
 Built by Meson:
 
-- 
2.27.0


