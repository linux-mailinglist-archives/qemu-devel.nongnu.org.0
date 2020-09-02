Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B62025ABA4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 15:03:22 +0200 (CEST)
Received: from localhost ([::1]:58280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDSQ5-00037l-DE
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 09:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDSMP-0005xP-P6
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:59:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kDSMM-000757-QS
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 08:59:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599051569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qpt4czLx2tmu9iRB1NMLp80kdhBl897DufdhqCweXbI=;
 b=KohIN72yvOgfmbeUeWlOkjnglwRBh4r0pinmGhDujAoRqKiGB7sUJvdIfPKrNgwQAQra4J
 rOD1nHXzfHCMF2o5gqpsRDGAAanhpN/Gib/KD2VYpO05IVC/u1Mp3I145rL1v8CE8bkixw
 jLFSfWthW4l75sFAeHdaTe4bro5J3eM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-CECoF0b6NKaa8_BnVKGMpA-1; Wed, 02 Sep 2020 08:59:26 -0400
X-MC-Unique: CECoF0b6NKaa8_BnVKGMpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D783D107B277
 for <qemu-devel@nongnu.org>; Wed,  2 Sep 2020 12:59:21 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BAF65D9CC
 for <qemu-devel@nongnu.org>; Wed,  2 Sep 2020 12:59:21 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/39] configure: include cross sdl2-config in meson cross file
Date: Wed,  2 Sep 2020 08:58:46 -0400
Message-Id: <20200902125917.26021-9-pbonzini@redhat.com>
In-Reply-To: <20200902125917.26021-1-pbonzini@redhat.com>
References: <20200902125917.26021-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:42:29
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index 131a9e518b..2790cf15d7 100755
--- a/configure
+++ b/configure
@@ -8147,6 +8147,9 @@ echo "ar = $(meson_quote $ar)" >> $cross
 echo "nm = $(meson_quote $nm)" >> $cross
 echo "pkgconfig = $(meson_quote $pkg_config_exe)" >> $cross
 echo "ranlib = $(meson_quote $ranlib)" >> $cross
+if has $sdl2_config; then
+  echo "sdl2-config = $(meson_quote $sdl2_config)" >> $cross
+fi
 echo "strip = $(meson_quote $strip)" >> $cross
 echo "windres = $(meson_quote $windres)" >> $cross
 if test -n "$cross_prefix"; then
-- 
2.26.2



