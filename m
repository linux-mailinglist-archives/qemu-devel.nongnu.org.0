Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DE926C256
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 13:56:18 +0200 (CEST)
Received: from localhost ([::1]:57374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIW2r-0001g2-Da
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 07:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kIVun-0006ki-Uf
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 07:47:58 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:35916
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kIVul-00089J-O5
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 07:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600256874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u6xnzQ6b8V+F32QLov/5uFoZGZRP072rQkXZBdII+jY=;
 b=N3jdRzhFm2jtAkVU2oXOw2Yzs5aTNAm3PMQwFeCHSCRUfFJwrK0Twk5BRxRYnha54+hx7C
 KHWTXJI+cwpdyLch5PZluQs0vSx6/VetPt7kiH6BpjnwqtJAQWQ9lFzxUXcPDVt55IXPMD
 IJI62mHAXakAnObKnyZqlHZcc0HNHu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-8_kw8DjZOfqXsUEwgZkydw-1; Wed, 16 Sep 2020 07:47:52 -0400
X-MC-Unique: 8_kw8DjZOfqXsUEwgZkydw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B18A9802B4C;
 Wed, 16 Sep 2020 11:47:51 +0000 (UTC)
Received: from thuth.com (ovpn-113-19.ams2.redhat.com [10.36.113.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEB225DA71;
 Wed, 16 Sep 2020 11:47:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/24] meson: disable crypto tests are empty under win32
Date: Wed, 16 Sep 2020 13:47:18 +0200
Message-Id: <20200916114731.102080-12-thuth@redhat.com>
In-Reply-To: <20200916114731.102080-1-thuth@redhat.com>
References: <20200916114731.102080-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 00:53:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
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
Cc: Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

Disable following tests on msys2/mingw
      'test-crypto-tlscredsx509': ['crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c',
                                   tasn1, crypto],
      'test-crypto-tlssession': ['crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c', 'crypto-tls-psk-helpers.c',
                                 tasn1, crypto],
      'test-io-channel-tls': ['io-channel-helpers.c', 'crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c',
                              tasn1, io, crypto]}
These tests are failure with:
ERROR test-crypto-tlscredsx509 - missing test plan
ERROR test-crypto-tlssession - missing test plan
ERROR test-io-channel-tls - missing test plan

Because on win32 those test case are all disabled.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Message-Id: <20200909094617.1582-12-luoyonggang@gmail.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/meson.build b/tests/meson.build
index 82342a2f97..8c3e930687 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -145,7 +145,8 @@ if have_block
     'test-crypto-block': [io],
   }
   if 'CONFIG_GNUTLS' in config_host and \
-     'CONFIG_TASN1' in config_host
+     'CONFIG_TASN1' in config_host and \
+     'CONFIG_POSIX' in config_host
     tests += {
       'test-crypto-tlscredsx509': ['crypto-tls-x509-helpers.c', 'pkix_asn1_tab.c',
                                    tasn1, crypto],
-- 
2.18.2


