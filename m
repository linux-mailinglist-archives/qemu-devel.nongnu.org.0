Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62B1418A54
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 19:20:33 +0200 (CEST)
Received: from localhost ([::1]:54222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUXpI-0007KQ-OK
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 13:20:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mUXmC-0004hQ-E2
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:17:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mUXm8-00080K-Kw
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 13:17:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632676633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=atYib1jCpRAo1p1rhd5iQWpbST5QDuf5aYf4t+Pqdb8=;
 b=VHEJ5180RKoLNaC7KEw14xoTwht7ZRuDpXXGyPupL3jGDwKWuGTHy4M4SExzzsjLO13GJ7
 FqdKUHv4EOSva8jlm64TfETvngLyILR089PMdFe3tEY0q6PN79mXPnV7Aoe3LSEwQbCqqV
 uD/jaUhfn8L+ishBUl+gvH6ONqZqjTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-29iKGpX-OguGA1wI-Decgw-1; Sun, 26 Sep 2021 13:17:10 -0400
X-MC-Unique: 29iKGpX-OguGA1wI-Decgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A282018125C0
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 17:17:09 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 725BD2AF99
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 17:17:09 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 1/5] meson: bump submodule to 0.58.2
Date: Sun, 26 Sep 2021 13:17:04 -0400
Message-Id: <20210926171708.455435-2-pbonzini@redhat.com>
In-Reply-To: <20210926171708.455435-1-pbonzini@redhat.com>
References: <20210926171708.455435-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The update to 0.57 has been delayed due to it causing warnings for
some actual issues, but it brings in important bugfixes and new
features.  0.58 also brings in a bugfix that is useful for modinfo.

Important bugfixes:

- 0.57: https://github.com/mesonbuild/meson/pull/7760, build: use PIE
objects for non-PIC static libraries if b_pie=true

- 0.57: https://github.com/mesonbuild/meson/pull/7900, thus avoiding
unnecessary rebuilds after running meson.

- 0.58.2: https://github.com/mesonbuild/meson/pull/8900, fixes for
passing extract_objects() to custom_target (useful for modinfo)

Features:

- 0.57: the keyval module has now been stabilized

- 0.57: env argument to custom_target (useful for hexagon)

- 0.57: Feature parity between "meson test" and QEMU's TAP driver

- 0.57: https://github.com/mesonbuild/meson/pull/8231, allows bringing
back version numbers in the configuration summary

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson b/meson
index 776acd2a80..8bcd4c72e3 160000
--- a/meson
+++ b/meson
@@ -1 +1 @@
-Subproject commit 776acd2a805c9b42b4f0375150977df42130317f
+Subproject commit 8bcd4c72e321705cb6cde02c684ffd2ec5cc8843
-- 
2.27.0



