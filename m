Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0070DFE35
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 09:26:24 +0200 (CEST)
Received: from localhost ([::1]:51008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMoYh-0001l1-Uz
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 03:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39167)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iMoUg-0005Z1-8T
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:22:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iMoUf-0005L9-9u
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:22:14 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:20006
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1iMoUf-0005Ks-5S
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:22:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571728932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gFfpjxekHST6uwbNE0nULW3Vo8TkWtQwwVYbEy8y9PI=;
 b=VEUsCTzYPfd3EB+NxN31N2yvnyVuXcfA0Ceq0gYiGFhmWP5DzyET6yMRsUQjnMboQ8pPP2
 L525uMRozM2x+8dTR2PRNeNZ8UUhJVbhK+6ubHHTCUiJEo4HtiTBXgSC28Vf/XvIjC/D8j
 TAiZchm6WaMcxKXKU8e9BPU2gTAyx8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-MBWIknRvPvy3StnlBFaiPw-1; Tue, 22 Oct 2019 03:22:10 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5551476;
 Tue, 22 Oct 2019 07:22:09 +0000 (UTC)
Received: from thuth.com (dhcp-200-228.str.redhat.com [10.33.200.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 963B92965D;
 Tue, 22 Oct 2019 07:22:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org
Subject: [PATCH v3 6/6] iotests: Remove 130 from the "auto" group
Date: Tue, 22 Oct 2019 09:21:35 +0200
Message-Id: <20191022072135.11188-7-thuth@redhat.com>
In-Reply-To: <20191022072135.11188-1-thuth@redhat.com>
References: <20191022072135.11188-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: MBWIknRvPvy3StnlBFaiPw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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

Peter hit a "Could not open 'TEST_DIR/t.IMGFMT': Failed to get shared
'write' lock - Is another process using the image [TEST_DIR/t.IMGFMT]?"
error with 130 already twice. Looks like this test is a little bit
shaky, so for the time being, let's disable it from the "auto" group so
that it does not gate the pull requests.

Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/group | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 33b499ed41..4596497bce 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -151,7 +151,7 @@
 127 rw auto backing quick
 128 rw quick
 129 rw quick
-130 rw auto quick
+130 rw quick
 131 rw quick
 132 rw quick
 133 auto quick
--=20
2.18.1


