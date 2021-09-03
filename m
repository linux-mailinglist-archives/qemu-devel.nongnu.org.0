Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 993E03FFBA4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 10:17:06 +0200 (CEST)
Received: from localhost ([::1]:43580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM4Nl-0005QE-4E
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 04:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mM4L3-0002eP-2d
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:14:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mM4Kz-0005Oz-Un
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 04:14:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630656853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6zuyUECTcpu9eDWgnE7OkvWtYjYE93yjgmdf9k1li1U=;
 b=KVhNKKnaoVu7umUcXs0OsxcvbZa8SNATFajDznlMJeWGKLgaAAI8iUn4/inrrzCrlR28j0
 DhfLv85mwcOVR6eHIK674qFAgV/9nLwpu4iCYuJoj78mm8lcWwgSiCaaTrhhfOrL7KoPCI
 2q+LIwQJqpz/WeVc9g2xKAE0InJ4AHw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-Uv1cBEP4Oj6tM3CxMVvlvg-1; Fri, 03 Sep 2021 04:14:12 -0400
X-MC-Unique: Uv1cBEP4Oj6tM3CxMVvlvg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74A151854E2C
 for <qemu-devel@nongnu.org>; Fri,  3 Sep 2021 08:14:11 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4759D5C3DF;
 Fri,  3 Sep 2021 08:14:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 2/5] meson_options.txt: Switch the default value for the
 vnc option to 'auto'
Date: Fri,  3 Sep 2021 10:13:55 +0200
Message-Id: <20210903081358.956267-3-thuth@redhat.com>
In-Reply-To: <20210903081358.956267-1-thuth@redhat.com>
References: <20210903081358.956267-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no reason why VNC should always be enabled and not be set to
the default value. We already switched the setting in the "configure"
script in commit 3a6a1256d4 ("configure: Allow vnc to get disabled with
--without-default-features"), so let's do that in meson_options.txt now,
too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson_options.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson_options.txt b/meson_options.txt
index a9a9b8f4c6..2c89e79e8b 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -120,7 +120,7 @@ option('usb_redir', type : 'feature', value : 'auto',
        description: 'libusbredir support')
 option('virglrenderer', type : 'feature', value : 'auto',
        description: 'virgl rendering support')
-option('vnc', type : 'feature', value : 'enabled',
+option('vnc', type : 'feature', value : 'auto',
        description: 'VNC server')
 option('vnc_jpeg', type : 'feature', value : 'auto',
        description: 'JPEG lossy compression for VNC server')
-- 
2.27.0


