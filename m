Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9929146D98
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 16:58:17 +0100 (CET)
Received: from localhost ([::1]:59882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iues4-0002PC-Db
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 10:58:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52298)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iuct7-0007jA-Ak
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:51:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iuct6-0006wD-8P
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:51:13 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:38606
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iuct6-0006vZ-5K
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 08:51:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579787471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NqscLWDnKRxDhBqt6gkRB5/5l0nOX51w0oSzCS1wQGY=;
 b=D9uKJg7boPL51NzTr9+SxiOP3rzH43qpDl/HjrPuqAnNweDXvRAgqQP9/U5yKXfM5XfJ8Y
 LDwpn5XILb0UnE3P1wFMn6HBSAdlXtx5xtUthmtq3EMC67m9pb6KXLkJ5B2JWS9jObuYet
 Y6PcEfbFKhgDWJJDNl8OrtMh5O/ApCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-JQkRDZKqOGelQv7ipuNWZQ-1; Thu, 23 Jan 2020 08:51:10 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80CC21007EF0
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 13:51:09 +0000 (UTC)
Received: from 640k.localdomain.com (unknown [10.36.112.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C4BF8575C;
 Thu, 23 Jan 2020 13:51:08 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/59] hw/net/imx_fec: Rewrite fall through comments
Date: Thu, 23 Jan 2020 14:49:59 +0100
Message-Id: <1579787449-27599-10-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1579787449-27599-1-git-send-email-pbonzini@redhat.com>
References: <1579787449-27599-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: JQkRDZKqOGelQv7ipuNWZQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

GCC9 is confused by this comment when building with CFLAG
-Wimplicit-fallthrough=3D2:

  hw/net/imx_fec.c: In function =E2=80=98imx_eth_write=E2=80=99:
  hw/net/imx_fec.c:906:12: error: this statement may fall through [-Werror=
=3Dimplicit-fallthrough=3D]
    906 |         if (unlikely(single_tx_ring)) {
        |            ^
  hw/net/imx_fec.c:912:5: note: here
    912 |     case ENET_TDAR:     /* FALLTHROUGH */
        |     ^~~~
  cc1: all warnings being treated as errors

Rewrite the comments in the correct place,  using 'fall through'
which is recognized by GCC and static analyzers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20191218192526.13845-5-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/net/imx_fec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index bd99236..c01ce4f 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -909,7 +909,8 @@ static void imx_eth_write(void *opaque, hwaddr offset, =
uint64_t value,
                           TYPE_IMX_FEC, __func__);
             return;
         }
-    case ENET_TDAR:     /* FALLTHROUGH */
+        /* fall through */
+    case ENET_TDAR:
         if (s->regs[ENET_ECR] & ENET_ECR_ETHEREN) {
             s->regs[index] =3D ENET_TDAR_TDAR;
             imx_eth_do_tx(s, index);
--=20
1.8.3.1



