Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BE53D5849
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 13:09:02 +0200 (CEST)
Received: from localhost ([::1]:42816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7yTl-0005GP-62
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 07:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m7yR3-0001mz-OV
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:06:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m7yR2-0004mh-AD
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 07:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627297571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Di0F3LCvOBeDbQ7BzCvZZKHbH19V1ZpRlTzQl2Bbzpc=;
 b=EXl6naQul6R251mumwA5Gx/wiEHPbsFNqNchNGlm4ahPDT9hcb0wCjv3QJEeHNS5CATSwx
 5tATv5hzPe2ZIiEaxAdDBgDdOeNSoIeqQKjVCvwetXl+QqJz7BAfdSBWBFBy3FNFZGWTf5
 3x+j9uTLm1bdNponuj6lUuG8PzA4yM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-bcBHPFqiPvWN-H32PLVg2Q-1; Mon, 26 Jul 2021 07:06:09 -0400
X-MC-Unique: bcBHPFqiPvWN-H32PLVg2Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F10CF1008061;
 Mon, 26 Jul 2021 11:06:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C99A01000358;
 Mon, 26 Jul 2021 11:06:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6EAAE180090A; Mon, 26 Jul 2021 13:05:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] ui: update keycodemapdb submodule commit
Date: Mon, 26 Jul 2021 13:05:43 +0200
Message-Id: <20210726110544.1934386-6-kraxel@redhat.com>
In-Reply-To: <20210726110544.1934386-1-kraxel@redhat.com>
References: <20210726110544.1934386-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

The change of ui/keycodemapdb effective on QEMU is only commit
d21009b1c9f94b740ea66be8e48a1d8ad8124023, which adds mappings for key
codes added in commit d7696ff884e35c6dacf83a7cbe3355e3b0a90125.

d21009b1c9f94b740ea66be8e48a1d8ad8124023 Add QEMU QKeyCode "lang1" and "lang2"
320f92c36a80bfafc5d57834592a7be5fd79f104 rust: fix cargo clippy
e62d42f0fd76f7bb8bf78385a83c060e66ff52b0 tests: add rust test
3e25e1ca1772fc3f2039f739f8f920450dc68e50 gen: add --lang rust
9133a0b8022d1fb063a81cc2ba3b627c14ccdfd1 tests: fix argument order

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210705075912.2280-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/keycodemapdb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/keycodemapdb b/ui/keycodemapdb
index 6119e6e19a05..d21009b1c9f9 160000
--- a/ui/keycodemapdb
+++ b/ui/keycodemapdb
@@ -1 +1 @@
-Subproject commit 6119e6e19a050df847418de7babe5166779955e4
+Subproject commit d21009b1c9f94b740ea66be8e48a1d8ad8124023
-- 
2.31.1


