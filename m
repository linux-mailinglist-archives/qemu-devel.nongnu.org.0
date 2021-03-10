Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 497EC334610
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 19:01:48 +0100 (CET)
Received: from localhost ([::1]:42378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK39X-00016K-Au
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 13:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK2iO-0007ka-Eu
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:33:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lK2iM-0006yl-OA
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615397618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZjFwI+KSKuugYDbZakv5yY78c7DTTRMp5MYSvg/el3g=;
 b=bOIRDZ+a2iwdYxeRQvA3GXcTg826QPIbs6baRwT9h1wwaUk2RpL+0tpuwg7srhlum9u335
 h2Q4PWEMvoHXl60+EKbXC7gqsXaoDMYubtjYaLetgM+AflbpAc+L9a0h5uX8LY2k7PKRqb
 BkOkhO1KF+7wXxgybOr9icBylKogeQw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-m8Z7I3DzO0etQsAO5wfQjw-1; Wed, 10 Mar 2021 12:33:36 -0500
X-MC-Unique: m8Z7I3DzO0etQsAO5wfQjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADAB71966320;
 Wed, 10 Mar 2021 17:33:35 +0000 (UTC)
Received: from thuth.com (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E04E560C13;
 Wed, 10 Mar 2021 17:33:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 2/4] usb: remove '-usbdevice u2f-key'
Date: Wed, 10 Mar 2021 18:33:21 +0100
Message-Id: <20210310173323.1422754-3-thuth@redhat.com>
In-Reply-To: <20210310173323.1422754-1-thuth@redhat.com>
References: <20210310173323.1422754-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

It never worked.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/usb/u2f.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/usb/u2f.c b/hw/usb/u2f.c
index bc09191f06..56001249a4 100644
--- a/hw/usb/u2f.c
+++ b/hw/usb/u2f.c
@@ -346,7 +346,6 @@ static const TypeInfo u2f_key_info = {
 static void u2f_key_register_types(void)
 {
     type_register_static(&u2f_key_info);
-    usb_legacy_register(TYPE_U2F_KEY, "u2f-key", NULL);
 }
 
 type_init(u2f_key_register_types)
-- 
2.27.0


