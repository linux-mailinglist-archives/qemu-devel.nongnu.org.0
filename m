Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A5C177BFE
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 17:36:57 +0100 (CET)
Received: from localhost ([::1]:49954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9AXP-0005gc-RU
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 11:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j9AVn-0004Ff-AZ
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j9AVl-0002y3-Vf
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:14 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60060
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j9AVl-0002x3-S1
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 11:35:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583253312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1rvAyJpM8UMVc6pLEJtcCaEzj3OieyggncMtCsiDiag=;
 b=GyZlrdfCFWPPFxPcaj3tkZqd3qnFJ4K2SwfVaM5DIgyvHyreefH1Gz6U8ChG1vcoI2fYfC
 UK/gxM4nWL7OpLM7ZSUddFwVkxE3CwWIkzTDrZ7neHq6xDn0UZ6Y41FAXF1dxKtTIoHLGq
 S14kdtwsMYo/KszTiWgYX7C+mLWWNgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-gvL2rKkGNm2-J4AdY1aJ9A-1; Tue, 03 Mar 2020 11:35:11 -0500
X-MC-Unique: gvL2rKkGNm2-J4AdY1aJ9A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6242918CA241;
 Tue,  3 Mar 2020 16:35:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-129.ams2.redhat.com
 [10.36.116.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42AB05DA2C;
 Tue,  3 Mar 2020 16:35:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B4F7911385F4; Tue,  3 Mar 2020 17:35:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/30] qapi: Belatedly update doc comment for @wait
 deprecation
Date: Tue,  3 Mar 2020 17:34:37 +0100
Message-Id: <20200303163505.32041-3-armbru@redhat.com>
In-Reply-To: <20200303163505.32041-1-armbru@redhat.com>
References: <20200303163505.32041-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: libvir-list@redhat.com, berrange@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit a9b305ba29 "socket: allow wait=3Dfalse for client socket"
deprecated use of @wait for client socket chardevs, but neglected to
update char.json's doc comment.  Make up for that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/char.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qapi/char.json b/qapi/char.json
index 6907b2bfdb..daceb20f84 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -258,6 +258,7 @@
 # @server: create server socket (default: true)
 # @wait: wait for incoming connection on server
 #        sockets (default: false).
+#        Silently ignored with server: false.  This use is deprecated.
 # @nodelay: set TCP_NODELAY socket option (default: false)
 # @telnet: enable telnet protocol on server
 #          sockets (default: false)
--=20
2.21.1


