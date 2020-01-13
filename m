Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A480E138F22
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jan 2020 11:32:07 +0100 (CET)
Received: from localhost ([::1]:48366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iqx0w-00058Z-8U
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 05:32:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52844)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iqwzU-0004EQ-O8
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 05:30:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iqwzP-00032i-VF
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 05:30:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45357
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1iqwzP-00031P-RF
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 05:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578911430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hHZiJnRMy5ceQptrEW1It4IcHAXnhUmAagh3qezZqHk=;
 b=PODRSRfeBYCRhSUvyecQRvE9vydX0d6+FjpAn23rDJy8VLVeeQBau0+x/VKN07IHSH8UaO
 dzH3EPVN4uJ+KW0oqBKJPRFmTCxE780RB3X+mDXYtFdTxpMReLeh0y1OT+BgRX4cnKzzIK
 y3cjho9pmImz52sRICaVgA42HgxoZ1k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-xvqSux5GPPi3wFa0YNrIqQ-1; Mon, 13 Jan 2020 05:30:28 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95D63800D4E
 for <qemu-devel@nongnu.org>; Mon, 13 Jan 2020 10:30:27 +0000 (UTC)
Received: from localhost (dhcp-192-245.str.redhat.com [10.33.192.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C834100EBAF;
 Mon, 13 Jan 2020 10:30:27 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs/devel: fix stable process doc formatting
Date: Mon, 13 Jan 2020 11:30:23 +0100
Message-Id: <20200113103023.31255-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: xvqSux5GPPi3wFa0YNrIqQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enumeration of stable criteria needs proper bullet points.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 docs/devel/stable-process.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/devel/stable-process.rst b/docs/devel/stable-process.rst
index 98736a9ea487..e541b983fac7 100644
--- a/docs/devel/stable-process.rst
+++ b/docs/devel/stable-process.rst
@@ -18,8 +18,10 @@ What should go into a stable release?
 -------------------------------------
=20
 Generally, the following patches are considered stable material:
-- Patches that fix severe issues, like fixes for CVEs
-- Patches that fix regressions
+
+* Patches that fix severe issues, like fixes for CVEs
+
+* Patches that fix regressions
=20
 If you think the patch would be important for users of the current release
 (or for a distribution picking fixes), it is usually a good candidate
--=20
2.21.1


