Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4513D14706B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 19:06:04 +0100 (CET)
Received: from localhost ([::1]:34242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iugri-0006SR-Ii
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 13:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40979)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufdQ-0004Qn-O6
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufdP-0006Gh-JV
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:12 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20429
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufdP-0006GZ-H6
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y2WNwji8vFxZMWUnAg6MrfH8EXNGbEPh2jlfcUds6Cg=;
 b=XnxBvgNLjBBC2Xintgn1ytSenoynx32Lpavm3Tijt8Jg3u82oaxnE+kM1kGmf34uGJbqyG
 ziDNej/uRcwsueEk08Qt44o3CbACDWoB8Fa8MIURi2wcNnCn/wFBOPRdFoMZbh1m9SAAeI
 XHbvYxDx/4UGc0iM0cg6kGfiUBBWs/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-N5uI62A6MAq4SnoADNc-UA-1; Thu, 23 Jan 2020 11:47:09 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFFC718543A8
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:47:08 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1ACC128DD2;
 Thu, 23 Jan 2020 16:47:05 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 017/108] virtiofsd: add -o source=PATH to help output
Date: Thu, 23 Jan 2020 16:44:59 +0000
Message-Id: <20200123164630.91498-18-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: N5uI62A6MAq4SnoADNc-UA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

The -o source=3DPATH option will be used by most command-line invocations.
Let's document it!

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/passthrough_ll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough=
_ll.c
index 26ac87013b..fc9b264d56 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -1319,6 +1319,7 @@ int main(int argc, char *argv[])
     if (opts.show_help) {
         printf("usage: %s [options]\n\n", argv[0]);
         fuse_cmdline_help();
+        printf("    -o source=3DPATH             shared directory tree\n")=
;
         fuse_lowlevel_help();
         ret =3D 0;
         goto err_out1;
--=20
2.24.1


