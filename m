Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECD434FB70
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 10:20:07 +0200 (CEST)
Received: from localhost ([::1]:52426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRW57-0005dm-Iz
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 04:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lRW42-0005Bu-Uv
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 04:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lRW40-0003Mo-Kk
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 04:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617178731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ojJz88qWRRYFSm3CPCeOxFKK/TjmF5NEWZrnLsx71Z0=;
 b=iM5uglDWzlKZiIJC/yYZBcDEMTMODeXQgqFIRQCPwWbKTzRTouMYbtVpOdvfe3eXAsMHa2
 tYDtRvZk4QOPRYV4aucHDVS382N6C5t455cNPJoLV90ZLFUdB6C9pMS2C/i9a8nLkR1JfB
 oiqOV1zFG9UpibkkzBT1pZ9zN09RbOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-msGoLb6_NamRywOavooOHQ-1; Wed, 31 Mar 2021 04:18:48 -0400
X-MC-Unique: msGoLb6_NamRywOavooOHQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD928CC622;
 Wed, 31 Mar 2021 08:18:47 +0000 (UTC)
Received: from workimage2020.rezanina.moe.rezanina.moe (unknown
 [10.40.194.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E197C6F991;
 Wed, 31 Mar 2021 08:18:46 +0000 (UTC)
From: mrezanin@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Do not use default_feature for EXESUF
Date: Wed, 31 Mar 2021 10:18:45 +0200
Message-Id: <20210331081845.105089-1-mrezanin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mrezanin@redhat.com;
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miroslav Rezanina <mrezanin@redhat.com>

Commit "c87ea11631 configure: add --without-default-features" use
default_feature to set default values for configure option. This value
is used for EXESUF too.

However, EXESUF is not option to be tested, it is just append to any
binary name so using --without-default-features set EXESUF to "n"o and
all binaries using it has form <name>no (e.g. qemu-imgno).

This is not expected behavior as disabling features should not cause
generating different binary names.

Reverting back to setting EXESUF to empty value unless needed otherwise.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 535e6a9269..8275df1506 100755
--- a/configure
+++ b/configure
@@ -365,7 +365,7 @@ tcg_interpreter="false"
 bigendian="no"
 mingw32="no"
 gcov="no"
-EXESUF="$default_feature"
+EXESUF=""
 HOST_DSOSUF=".so"
 modules="no"
 module_upgrades="no"
-- 
2.27.0


