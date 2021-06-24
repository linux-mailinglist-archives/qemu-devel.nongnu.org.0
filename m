Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392443B2CF9
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:54:32 +0200 (CEST)
Received: from localhost ([::1]:45240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwN0B-0001aq-3a
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMnO-0004EC-RN
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMnI-0008AS-KJ
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624531271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rHIChWgkOKd/ty+O8y/YBUb6p7lpc7qKzmuQYkr/5Ig=;
 b=KRSd3HlszqK9KCbfM7rNsp0OnCkcI0WNj7R99dYrMnpaVXLBBIoKVC/2JuppQtpAjPADbJ
 IB+nncB4+kC5lrw0iycWUSio5FoxHndu8Aj2pA0mFDCNIOJ+w/P1mjLmkC/GDZ3H82JCHO
 +W1JH4HqP5UxRUbGuaCAFP6BTzhF8dk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-lpPdkHdmPSGvdvClsJqqBA-1; Thu, 24 Jun 2021 06:41:10 -0400
X-MC-Unique: lpPdkHdmPSGvdvClsJqqBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08B7536306;
 Thu, 24 Jun 2021 10:41:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55B765D9F0;
 Thu, 24 Jun 2021 10:40:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 03696180354B; Thu, 24 Jun 2021 12:38:38 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/34] modules: add documentation for module sourcesets
Date: Thu, 24 Jun 2021 12:38:23 +0200
Message-Id: <20210624103836.2382472-22-kraxel@redhat.com>
In-Reply-To: <20210624103836.2382472-1-kraxel@redhat.com>
References: <20210624103836.2382472-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/build-system.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 7ef36f42d0f5..fd1650442ecc 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -272,6 +272,23 @@ Target-dependent emulator sourcesets:
     target_arch += {'arm': arm_ss}
     target_softmmu_arch += {'arm': arm_softmmu_ss}
 
+Module sourcesets:
+  There are two dictionaries for modules: `modules` is used for
+  target-independent modules and `target_modules` is used for
+  target-dependent modules.  When modules are disabled the `module`
+  source sets are added to `softmmu_ss` and the `target_modules`
+  source sets are added to `specific_ss`.
+
+  Both dictionaries are nested.  One dictionary is created per
+  subdirectory, and these per-subdirectory dictionaries are added to
+  the toplevel dictionaries.  For example::
+
+    hw_display_modules = {}
+    qxl_ss = ss.source_set()
+    ...
+    hw_display_modules += { 'qxl': qxl_ss }
+    modules += { 'hw-display': hw_display_modules }
+
 Utility sourcesets:
   All binaries link with a static library `libqemuutil.a`.  This library
   is built from several sourcesets; most of them however host generated
-- 
2.31.1


