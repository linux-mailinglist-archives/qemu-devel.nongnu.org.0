Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28139E11DB
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 07:55:12 +0200 (CEST)
Received: from localhost ([::1]:54548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iN9by-0000a0-MV
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 01:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iN9ad-0008Hk-N8
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 01:53:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iN9ab-0005l8-4a
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 01:53:45 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43679
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iN9aa-0005ik-Hr
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 01:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571810022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8469xb+2VuQlLPmjABSkRF0IvDPs/aiFrqjE7+Fyd4I=;
 b=Ab5x/m4NBV41Whwhji9lcE7Ji898+iTJeQcEOEmcB/2S+H5Tc3XyVEGzMymyYJQHn08dul
 4ncgVzlvutuyyn0NXzJjOLl3NT/06x3vCN90KVNTWSlQJI0viBqYIINOP0Ps0NvpS8IXsb
 Uuhp0XEfOLler+zg8U+/7bibCiiSKfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-z7VoON_0NWWLJyjJc4tKhA-1; Wed, 23 Oct 2019 01:53:40 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21244800D54
 for <qemu-devel@nongnu.org>; Wed, 23 Oct 2019 05:53:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7E165DA8D;
 Wed, 23 Oct 2019 05:53:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BDD469D69; Wed, 23 Oct 2019 07:53:36 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] paaudio: add missing break
Date: Wed, 23 Oct 2019 07:53:36 +0200
Message-Id: <20191023055336.21809-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: z7VoON_0NWWLJyjJc4tKhA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CID 1406449

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/paaudio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index df541a72d3a9..55a91f898073 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -385,6 +385,7 @@ static pa_stream *qpa_simple_new (
         map.map[5] =3D PA_CHANNEL_POSITION_REAR_RIGHT;
         map.map[6] =3D PA_CHANNEL_POSITION_SIDE_LEFT;
         map.map[7] =3D PA_CHANNEL_POSITION_SIDE_RIGHT;
+        break;
=20
     default:
         dolog("Internal error: unsupported channel count %d\n", ss->channe=
ls);
--=20
2.18.1


