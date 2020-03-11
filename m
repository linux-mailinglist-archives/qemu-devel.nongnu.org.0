Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D76181AC5
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 15:07:04 +0100 (CET)
Received: from localhost ([::1]:52834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC20k-0005nl-I1
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 10:07:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36180)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1jC1mo-0003sw-Cy
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 09:52:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1jC1mn-0002XO-6G
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 09:52:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47371
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1jC1mn-0002X1-1U
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 09:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583934756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8WjUtZP30gnI4PhVaeaDwn/qhVv9JohctZmRarIUqY0=;
 b=OIQrqZ5OnCeWOKqCfMlWPjYLsp8PEp5lSFecX57Q8iuAOWnFCFk5M7w5suaSycnpV3O1XB
 WWOCJa2UFiOirz9iaeQrSdZpnDHmltlNmSXkuEwAwjiqupbxsQW0m4YsNI+rTja1eFRopQ
 hZFUSu7A0Xd78REQdFfMHaKlrxl1Kn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-7JERtupvOgGc8vS2VmzktQ-1; Wed, 11 Mar 2020 09:52:34 -0400
X-MC-Unique: 7JERtupvOgGc8vS2VmzktQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A558800D54;
 Wed, 11 Mar 2020 13:52:33 +0000 (UTC)
Received: from localhost (ovpn-117-216.ams2.redhat.com [10.36.117.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 190505C1C3;
 Wed, 11 Mar 2020 13:52:32 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/19] block/curl: HTTP header field names are case insensitive
Date: Wed, 11 Mar 2020 14:52:00 +0100
Message-Id: <20200311135213.1242028-7-mreitz@redhat.com>
In-Reply-To: <20200311135213.1242028-1-mreitz@redhat.com>
References: <20200311135213.1242028-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

RFC 7230 section 3.2 indicates that HTTP header field names are case
insensitive.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20200224101310.101169-3-david.edmondson@oracle.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/curl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index f9ffb7f4e2..6e325901dc 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -216,11 +216,12 @@ static size_t curl_header_cb(void *ptr, size_t size, =
size_t nmemb, void *opaque)
     size_t realsize =3D size * nmemb;
     const char *header =3D (char *)ptr;
     const char *end =3D header + realsize;
-    const char *accept_ranges =3D "Accept-Ranges:";
+    const char *accept_ranges =3D "accept-ranges:";
     const char *bytes =3D "bytes";
=20
     if (realsize >=3D strlen(accept_ranges)
-        && strncmp(header, accept_ranges, strlen(accept_ranges)) =3D=3D 0)=
 {
+        && g_ascii_strncasecmp(header, accept_ranges,
+                               strlen(accept_ranges)) =3D=3D 0) {
=20
         char *p =3D strchr(header, ':') + 1;
=20
--=20
2.24.1


