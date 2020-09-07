Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD51525F3CA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 09:20:19 +0200 (CEST)
Received: from localhost ([::1]:53308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFBRq-0002jD-B4
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 03:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFBQo-0001TI-88
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 03:19:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46539
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFBQl-00014e-Q6
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 03:19:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599463150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTCyim/spbF7X6EPjACXkEKM8E7dMk6gQvhyh3Q8p8s=;
 b=LHP9M7pzDfW+jxrt1MsJ8CEMF2kcGzPouaIWIOkpLzkHLFDAM5GO/GJ+qezLxuiqcU98DV
 TTj4yqYa/Jv7+FsVjD6TXaR3Zy56o3MxefoPZAqp7A/3EY5OZlQNmHFvcIMwd74icrdwlG
 pGMPQzPlUCuoQDy+glAKWhKZgGc2Pew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-FIkWSN-1Oc2yt5ANBHhhgw-1; Mon, 07 Sep 2020 03:19:08 -0400
X-MC-Unique: FIkWSN-1Oc2yt5ANBHhhgw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D7C280ED8E
 for <qemu-devel@nongnu.org>; Mon,  7 Sep 2020 07:19:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5472519C4F;
 Mon,  7 Sep 2020 07:19:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6E379204A1; Mon,  7 Sep 2020 09:19:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] meson: remove duplicate qxl sources
Date: Mon,  7 Sep 2020 09:19:03 +0200
Message-Id: <20200907071903.8065-3-kraxel@redhat.com>
In-Reply-To: <20200907071903.8065-1-kraxel@redhat.com>
References: <20200907071903.8065-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 03:19:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.099,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should add sources to the softmmu_ss or module_ss but not both.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/meson.build | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/display/meson.build b/hw/display/meson.build
index 78adaf9db463..ef8eb093acbb 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -45,8 +45,6 @@ if config_all_devices.has_key('CONFIG_QXL')
   hw_display_modules += {'qxl': qxl_ss}
 endif
 
-softmmu_ss.add(when: 'CONFIG_QXL', if_true: files('qxl.c', 'qxl-logger.c', 'qxl-render.c'))
-
 softmmu_ss.add(when: 'CONFIG_DPCD', if_true: files('dpcd.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx_dp.c'))
 
-- 
2.27.0


