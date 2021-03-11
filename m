Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C0D3372BA
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:35:33 +0100 (CET)
Received: from localhost ([::1]:39318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKXM-0004dJ-VE
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:35:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKW9-0003eZ-OF
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lKKW2-0006TN-Sw
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615466050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fqWaTZpnIHATPc2r743MOt+DSl901yNVtjaflApgjio=;
 b=NPXk+ytLBP1hzeCCSgunjszahp8axLgd78ng6MWjWHk9ff7AezA9oUkae98u1ua7G/cge6
 m1N1jWXfmrx99udxdELiJr+adkz7nO6Q/d6jHFybnNPC/OAB8urYHpaVtNK36o/kVoNSIM
 JHg4NIjONKTth9zB4ZnkKjlGPifXbQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-9oc7zNCwPjipiFlOcfaMeQ-1; Thu, 11 Mar 2021 07:34:07 -0500
X-MC-Unique: 9oc7zNCwPjipiFlOcfaMeQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AADEA107ACCA;
 Thu, 11 Mar 2021 12:34:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3730D610AE;
 Thu, 11 Mar 2021 12:34:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CF812180090F; Thu, 11 Mar 2021 13:34:01 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/8] docs: Fix removal text of -show-cursor
Date: Thu, 11 Mar 2021 13:33:56 +0100
Message-Id: <20210311123401.340122-4-kraxel@redhat.com>
In-Reply-To: <20210311123401.340122-1-kraxel@redhat.com>
References: <20210311123401.340122-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

We should say now when it was removed, not when it was deprecated.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210310045821.1004396-1-thuth@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/system/removed-features.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 4dcf4f924cf9..83148dcfda6a 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -26,8 +26,8 @@ The ``-no-kvm`` argument was a synonym for setting ``-machine accel=tcg``.
 The ``-realtime mlock=on|off`` argument has been replaced by the
 ``-overcommit mem-lock=on|off`` argument.
 
-``-show-cursor`` option (since 5.0)
-'''''''''''''''''''''''''''''''''''
+``-show-cursor`` option (removed in 6.0)
+''''''''''''''''''''''''''''''''''''''''
 
 Use ``-display sdl,show-cursor=on``, ``-display gtk,show-cursor=on``
 or ``-display default,show-cursor=on`` instead.
-- 
2.29.2


