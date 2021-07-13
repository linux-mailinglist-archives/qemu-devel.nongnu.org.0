Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CB03C6D8B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:33:33 +0200 (CEST)
Received: from localhost ([::1]:34150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3EnE-0004qW-BQ
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3Elr-00026R-Ey
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:32:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3Elp-0001ma-6B
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:32:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626168724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hIYsrOpqxvAbiZavlkHiYx+Dm+aeGDVjfN6/6O9RXIE=;
 b=ejyUYpm2pTSDPkPX8VM06kNhSHJCptUADv6fHkh1+mgit0Yt29pX2nHeobcfVj9vtegYTe
 D1GPYvmfcB9wXoO378cseMegr4Sfs89JszLkUfXyg+FDLLp1Liq7nGf6vCu/7hLTRHFo6S
 i+XA8SuddVdDf41BWhW+mpjcMIXimPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-0ArlSNE7MgOTDoVMNdeGQQ-1; Tue, 13 Jul 2021 05:32:02 -0400
X-MC-Unique: 0ArlSNE7MgOTDoVMNdeGQQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 166CE100CCC5
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 09:32:02 +0000 (UTC)
Received: from thuth.com (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F15145DAA5;
 Tue, 13 Jul 2021 09:32:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/4] configure: Allow vnc to get disabled with
 --without-default-features
Date: Tue, 13 Jul 2021 11:31:53 +0200
Message-Id: <20210713093155.677589-3-thuth@redhat.com>
In-Reply-To: <20210713093155.677589-1-thuth@redhat.com>
References: <20210713093155.677589-1-thuth@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no reason why we should keep VNC enabled when the user
specified --without-default-features.

Reported-by: Cole Robinson <crobinso@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure   | 2 +-
 meson.build | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 229ea52516..1974c46f6e 100755
--- a/configure
+++ b/configure
@@ -304,7 +304,7 @@ virtiofsd="auto"
 virtfs="auto"
 libudev="auto"
 mpath="auto"
-vnc="enabled"
+vnc="auto"
 sparse="auto"
 vde="$default_feature"
 vnc_sasl="auto"
diff --git a/meson.build b/meson.build
index 6cd2dc582a..5dedaf73e3 100644
--- a/meson.build
+++ b/meson.build
@@ -900,7 +900,7 @@ vnc = not_found
 png = not_found
 jpeg = not_found
 sasl = not_found
-if get_option('vnc').enabled()
+if not get_option('vnc').disabled()
   vnc = declare_dependency() # dummy dependency
   png = dependency('libpng', required: get_option('vnc_png'),
                    method: 'pkg-config', kwargs: static_kwargs)
-- 
2.27.0


