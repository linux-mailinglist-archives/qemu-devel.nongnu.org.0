Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B95EDFE36
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 09:26:39 +0200 (CEST)
Received: from localhost ([::1]:51012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMoYw-00027X-4p
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 03:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39135)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iMoUV-0005Hx-H2
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:22:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iMoUU-0005Ha-DS
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:22:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58003
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iMoUU-0005HO-AH
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571728921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O2Z3+As+UUjZZvK4a3KeXRi6hSKm32Oq0U6w7Ks/Y0U=;
 b=XPNQv9eBoof4SeG7K1RZH7Rxe10VvyqaB4TaR771i7GCbphCRQx5KBHAHSSKJVI5cxD+u/
 IGbefIWjAh0d4Hd82cjKJbH8SDOwtfAFzJwmzsen5NLga73KoZuA0YHG5ndelNWPgebxBZ
 HEBTzOrv1aLzAlFdbL/9cvCbPlPXPW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-BDyTGkvSMput6CWI5Y_VRQ-1; Tue, 22 Oct 2019 03:21:57 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19BA61005509;
 Tue, 22 Oct 2019 07:21:56 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E9C61B465;
 Tue, 22 Oct 2019 07:21:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org
Subject: [PATCH v3 3/6] iotests: Test 183 does not work on macOS and OpenBSD
Date: Tue, 22 Oct 2019 09:21:32 +0200
Message-Id: <20191022072135.11188-4-thuth@redhat.com>
In-Reply-To: <20191022072135.11188-1-thuth@redhat.com>
References: <20191022072135.11188-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: BDyTGkvSMput6CWI5Y_VRQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the long term, we might want to add test 183 to the "auto" group
(but it still fails occasionally, so we cannot do that yet). However,
when running 183 in Cirrus-CI on macOS, or with our vm-build-openbsd
target, it currently always fails with an "Timeout waiting for return
on handle 0" error.

Let's mark it as supported only on systems where the test is working
fine (i.e. Linux, FreeBSD and NetBSD).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/183 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/183 b/tests/qemu-iotests/183
index bced83fae0..0bbae13647 100755
--- a/tests/qemu-iotests/183
+++ b/tests/qemu-iotests/183
@@ -42,6 +42,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 . ./common.filter
 . ./common.qemu
=20
+_supported_os Linux FreeBSD NetBSD
 _supported_fmt qcow2 raw qed quorum
 _supported_proto file
=20
--=20
2.18.1


