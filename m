Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DD8417BCD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 21:27:08 +0200 (CEST)
Received: from localhost ([::1]:50872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTqqh-0002cP-Fq
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 15:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mTqQb-0007xg-Q5
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:00:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1mTqQZ-0007L1-9U
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:00:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632510005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z475muSu1pqrmK3HZu2mRhApOVG4ddbO3gnTyqgsR3I=;
 b=dpA0BB/lc/kTush4HWUFTVsjhDcxaEg596TT2xCPVBjslXD4tc4eclsenCVUnQYr2W4Gy1
 ofM01nsqk1LIXGYczBfLRPneed+6yanu0jZYNpqh3Tol4y3t9xNQceIvwJ9cJtMvTRTu/p
 SItKzti0S8azPM99Qxd3UmiFt3sN4rg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-XfxJPCIYP3q-1KDbbnPfXg-1; Fri, 24 Sep 2021 15:00:03 -0400
X-MC-Unique: XfxJPCIYP3q-1KDbbnPfXg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64C191808316;
 Fri, 24 Sep 2021 19:00:01 +0000 (UTC)
Received: from p50.net (unknown [10.22.33.186])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFDC35C1A3;
 Fri, 24 Sep 2021 18:59:42 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/16] tests/acceptance/ppc_prep_40p.py: NetBSD 7.1.2 location
 update
Date: Fri, 24 Sep 2021 14:55:04 -0400
Message-Id: <20210924185506.2542588-15-crosa@redhat.com>
In-Reply-To: <20210924185506.2542588-1-crosa@redhat.com>
References: <20210924185506.2542588-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Greg Kurz <groug@kaod.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The NetBSD-7.1.2-prep.iso is no longer available on the CDN, but it's
still available in the archive.

Let's update its location so that users without the file on cache can
still fetch it and run the test.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/ppc_prep_40p.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/acceptance/ppc_prep_40p.py
index 2993ee3b07..6b28a69ea5 100644
--- a/tests/acceptance/ppc_prep_40p.py
+++ b/tests/acceptance/ppc_prep_40p.py
@@ -67,8 +67,8 @@ def test_openbios_and_netbsd(self):
         :avocado: tags=machine:40p
         :avocado: tags=os:netbsd
         """
-        drive_url = ('https://cdn.netbsd.org/pub/NetBSD/iso/7.1.2/'
-                     'NetBSD-7.1.2-prep.iso')
+        drive_url = ('https://archive.netbsd.org/pub/NetBSD-archive/'
+                     'NetBSD-7.1.2/iso/NetBSD-7.1.2-prep.iso')
         drive_hash = 'ac6fa2707d888b36d6fa64de6e7fe48e'
         drive_path = self.fetch_asset(drive_url, asset_hash=drive_hash,
                                       algorithm='md5')
-- 
2.31.1


