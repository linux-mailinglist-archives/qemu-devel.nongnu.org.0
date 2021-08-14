Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211453EC0DF
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 08:17:10 +0200 (CEST)
Received: from localhost ([::1]:48420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEmyj-00047k-7X
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 02:17:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEmsB-0006r2-66
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEms8-0004Qi-S4
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628921419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZXOAyLv9LbJIvAftS+idZid8DV+hxef/1YY+3yojgf0=;
 b=BAQ9wwhbaIHldzOwQ3QFVJI5KTVxE9g7SpDdmbEsOVobVl0FfUP/7z7MhNpzDsZU6dGoRu
 ZSMZ8ZX+ArGFdxIdQGt8YpT0QiEGtHS4A2bkBiNJ8f2GwRZ+EudzS6cWs9TrbD1NYqWHII
 1NWOXJYqsLJg+qga8Nd/q9Q0Uu9s7Ug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-B6vt44qgPNW6j-lg6jcmEw-1; Sat, 14 Aug 2021 02:10:18 -0400
X-MC-Unique: B6vt44qgPNW6j-lg6jcmEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AE16101C8A5;
 Sat, 14 Aug 2021 06:10:17 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66E6B5D9FC;
 Sat, 14 Aug 2021 06:10:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 09/11] docs/about/removed-features: Document removed HMP
 commands from QEMU v2.12
Date: Sat, 14 Aug 2021 08:09:54 +0200
Message-Id: <20210814060956.12852-10-thuth@redhat.com>
In-Reply-To: <20210814060956.12852-1-thuth@redhat.com>
References: <20210814060956.12852-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

These HMP commands had been removed/replaced in QEMU v2.12. Still, some
people might want to update from older versions to the recent QEMU version,
so we should give some recommendations for the replacements in our
documentation.

Message-Id: <20210811084103.74832-5-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/removed-features.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 40d2cc4ffa..8bf3ebecab 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -356,6 +356,17 @@ Specify the properties for the object as top-level arguments instead.
 Human Monitor Protocol (HMP) commands
 -------------------------------------
 
+``usb_add`` and ``usb_remove`` (removed in 2.12)
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+Replaced by ``device_add`` and ``device_del`` (use ``device_add help`` for a
+list of available devices).
+
+``host_net_add`` and ``host_net_remove`` (removed in 2.12)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Replaced by ``netdev_add`` and ``netdev_del``.
+
 The ``hub_id`` parameter of ``hostfwd_add`` / ``hostfwd_remove`` (removed in 5.0)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
-- 
2.27.0


