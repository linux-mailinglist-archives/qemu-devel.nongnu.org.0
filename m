Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB74FDE1B8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 03:15:19 +0200 (CEST)
Received: from localhost ([::1]:54692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMMI2-0004ow-NV
	for lists+qemu-devel@lfdr.de; Sun, 20 Oct 2019 21:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45914)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hhan@redhat.com>) id 1iMMGs-000471-SX
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 21:14:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hhan@redhat.com>) id 1iMMGr-0004fu-RG
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 21:14:06 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46869
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <hhan@redhat.com>) id 1iMMGr-0004fY-O9
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 21:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571620445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hvPOC83TFmIPkNxqxmDoKWdTzvISl7j/eoqdVERqfbQ=;
 b=eSb8ENtdGKC7CUd1OuUYHP6RbubUOIhX0OvLGChr+9E7d0gnUqrIRP1BsBaBla/oJ4Q0Ni
 MvGQKGuQVZYWYsScxmgJUP8waHchLDmMhxhq3ZBz+dO3bWmOyqWQJvxfqaLBsInNciPa8y
 bKKicfX04VHkRwLTa05nGSMkU4wONy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-rx2J_UxCNf2S75e_3_lKoA-1; Sun, 20 Oct 2019 21:14:03 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2E511800DC7;
 Mon, 21 Oct 2019 01:14:02 +0000 (UTC)
Received: from hansolo.nay.redhat.com (unknown [10.66.4.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DAAA1001DC2;
 Mon, 21 Oct 2019 01:14:01 +0000 (UTC)
From: Han Han <hhan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qemu-img.texi: Describe data_file and data_file_raw
Date: Mon, 21 Oct 2019 09:14:21 +0800
Message-Id: <20191021011421.24748-1-hhan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: rx2J_UxCNf2S75e_3_lKoA-1
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
Cc: Han Han <hhan@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

https://bugzilla.redhat.com/show_bug.cgi?id=3D1763105

Signed-off-by: Han Han <hhan@redhat.com>
---
 qemu-img.texi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/qemu-img.texi b/qemu-img.texi
index b5156d6316..983c6122f8 100644
--- a/qemu-img.texi
+++ b/qemu-img.texi
@@ -763,6 +763,16 @@ file which is COW and has data blocks already, it coul=
dn't be changed to NOCOW
 by setting @code{nocow=3Don}. One can issue @code{lsattr filename} to chec=
k if
 the NOCOW flag is set or not (Capital 'C' is NOCOW flag).
=20
+@item data_file
+File name of data file that is stored in the image and used as a default f=
or
+opening the image. If the option is used, qcow2 file only stores the metad=
ata
+for the image.
+
+@item data_file_raw
+This option requires @option{data_file}. If this option is set to @code{on=
},
+qemu will always keep the external data file consistent as a standalone
+read-only raw image. Default value is @code{off}.
+
 @end table
=20
 @item Other
--=20
2.20.1


