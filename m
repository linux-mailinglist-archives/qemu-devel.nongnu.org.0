Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C41598969
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 18:56:14 +0200 (CEST)
Received: from localhost ([::1]:56194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOioX-0005V5-3L
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 12:56:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oOimW-0003YF-KM
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 12:54:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oOimQ-0005XJ-Sx
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 12:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660841640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=z2FnAJ837RUXLdNPbvEzaNrGBIiFPpFnFjRPj5coNSE=;
 b=WyfldyxPdG4HZX7bVnU7dIpy21uvFScP7ZjubZPh4Fn6sBxCSIXywEv5Z5IHPIV/G4Zi75
 lNsxOZ3nKEw1DFhAnfcBOEGjK5wQ73aN9/uw5gwDDKQzn9XYUbtcdKRYAl/CBwfXN2pFoS
 cEMeYNSl9145W++z0Eg8trCu0F2EXSQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-QvQ7yO7BOVGu8IzO0Yl9gw-1; Thu, 18 Aug 2022 12:53:59 -0400
X-MC-Unique: QvQ7yO7BOVGu8IzO0Yl9gw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C42DB3800C25
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 16:53:58 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FC71C15BB8;
 Thu, 18 Aug 2022 16:53:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Subject: [qemu-web PATCH] Add signing pubkey for python-qemu-qmp package
Date: Thu, 18 Aug 2022 12:53:58 -0400
Message-Id: <20220818165358.217613-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Add the pubkey currently used for signing PyPI releases of qemu.qmp to a
stable location where it can be referenced by e.g. Fedora RPM specfiles.

At present, the key happens to just simply be my own -- but future
releases may be signed by a different key. In that case, we can
increment '1.txt' to '2.txt' and so on. The old keys should be left in
place.

The format for the keyfile was chosen by copying what OpenStack was
doing:
https://releases.openstack.org/_static/0x2426b928085a020d8a90d0d879ab7008d0896c8a.txt

Generated with:
> gpg --with-fingerprint --list-keys jsnow@redhat.com > pubkey
> gpg --armor --export jsnow@redhat.com >> pubkey

Signed-off-by: John Snow <jsnow@redhat.com>
---
 assets/keys/python-qemu-qmp.1.txt | 288 ++++++++++++++++++++++++++++++
 1 file changed, 288 insertions(+)
 create mode 100644 assets/keys/python-qemu-qmp.1.txt

diff --git a/assets/keys/python-qemu-qmp.1.txt b/assets/keys/python-qemu-qmp.1.txt
new file mode 100644
index 0000000..54edbbd
--- /dev/null
+++ b/assets/keys/python-qemu-qmp.1.txt
@@ -0,0 +1,288 @@
+pub   rsa4096 2015-01-29 [SC] [expires: 2023-05-28]
+      FAEB 9711 A12C F475 812F  18F2 88A9 064D 1835 61EB
+uid           [ultimate] John Snow (John Huston) <jsnow@redhat.com>
+sub   rsa4096 2015-01-29 [E] [expires: 2023-05-28]
+sub   rsa4096 2015-01-29 [S] [expires: 2023-05-28]
+
+-----BEGIN PGP PUBLIC KEY BLOCK-----
+
+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
+WOJTqPKSWNIDwqX9
+=OZ7X
+-----END PGP PUBLIC KEY BLOCK-----
-- 
2.37.2


