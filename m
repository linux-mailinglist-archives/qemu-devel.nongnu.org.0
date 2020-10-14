Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2492028E071
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 14:20:05 +0200 (CEST)
Received: from localhost ([::1]:53526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSflE-0003JG-4V
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 08:20:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kSfd8-0005E0-UB
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 08:11:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kSfd6-0003Oc-T6
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 08:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602677500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ipbcGctNUG+3uSEfHb5xLukKS5GIrTbTQUwsczBIt8=;
 b=F1Z14AFbN2mBbPeGq7YCTHoKhlUGqi3W7guzU8evQroHbet6GdJTPljW6mbHwFfyDv4g5+
 inemJ/UIRDGxnohXup6sGYgnESCNGWHwfPNcr21Ug4vRhqLeJ6jKQAQNq/2iUMCHNzLVkw
 M3LHjPIi4Zbxz1WM3zH4n3xbstn/GlI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-Cw9aZMtONhigAhUwmADF4Q-1; Wed, 14 Oct 2020 08:11:38 -0400
X-MC-Unique: Cw9aZMtONhigAhUwmADF4Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47CEF18BE161
 for <qemu-devel@nongnu.org>; Wed, 14 Oct 2020 12:11:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A8151992F;
 Wed, 14 Oct 2020 12:11:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 30DE843BFBB; Wed, 14 Oct 2020 14:11:21 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 6/7] meson: add spice dependency to core spice source files.
Date: Wed, 14 Oct 2020 14:11:19 +0200
Message-Id: <20201014121120.13482-7-kraxel@redhat.com>
In-Reply-To: <20201014121120.13482-1-kraxel@redhat.com>
References: <20201014121120.13482-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 03:37:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now it happens to work by pure luck because the spice chardevs
add the spice dependency to the softmmu source set.  That'll change
though once we start building spice chardevs as module, so lets fix
it properly.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/meson.build b/ui/meson.build
index 8a080c38e325..bad7a3745148 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -14,7 +14,7 @@ softmmu_ss.add(files(
 ))
 
 softmmu_ss.add(when: 'CONFIG_LINUX', if_true: files('input-linux.c'))
-softmmu_ss.add(when: 'CONFIG_SPICE', if_true: files('spice-core.c', 'spice-input.c', 'spice-display.c'))
+softmmu_ss.add(when: [spice, 'CONFIG_SPICE'], if_true: files('spice-core.c', 'spice-input.c', 'spice-display.c'))
 softmmu_ss.add(when: cocoa, if_true: files('cocoa.m'))
 
 vnc_ss = ss.source_set()
-- 
2.27.0


