Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F819175EB4
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 16:48:58 +0100 (CET)
Received: from localhost ([::1]:34402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8nJR-0003DW-9V
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 10:48:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44132)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lvivier@redhat.com>) id 1j8nHP-0000zv-6o
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 10:46:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lvivier@redhat.com>) id 1j8nHO-0002CN-AH
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 10:46:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57559
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lvivier@redhat.com>) id 1j8nHO-0002C3-5O
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 10:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583164009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dOp5FGIaF1MS/iTTwHH3gmeKIz4xY36hDfbRPRQKoKY=;
 b=eT5kVYU2bxqZJ7Xt8qPiyleClGQTt+NH6E4Lf+kaIshfB2gfkdbo15Kp/0P+Y4qVuKduLE
 Jf4R7cv0T0029C9cQDVj7dPhZCzin1sQP+C3NJ26zEpeQ0SdRR5t1POItUpPO9lXc/cEPH
 YKZKrqySbY9R2SRjf0GAZzzXovEESfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-Y5iMKAcMOZiMb5F1qxi8rQ-1; Mon, 02 Mar 2020 10:46:46 -0500
X-MC-Unique: Y5iMKAcMOZiMb5F1qxi8rQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F4611416;
 Mon,  2 Mar 2020 15:46:43 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-117-17.ams2.redhat.com [10.36.117.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 433625D9C9;
 Mon,  2 Mar 2020 15:46:41 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] virtiofsd: add it to the tools list
Date: Mon,  2 Mar 2020 16:46:29 +0100
Message-Id: <20200302154630.45620-2-lvivier@redhat.com>
In-Reply-To: <20200302154630.45620-1-lvivier@redhat.com>
References: <20200302154630.45620-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

it will be built only when tools are enabled (always enabled by default)

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 218b8259a49a..ba8ffc9331c3 100644
--- a/Makefile
+++ b/Makefile
@@ -327,7 +327,7 @@ HELPERS-y +=3D vhost-user-gpu$(EXESUF)
 vhost-user-json-y +=3D contrib/vhost-user-gpu/50-qemu-gpu.json
 endif
=20
-ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yyy)
+ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG)$(CONFIG_TOOLS),y=
yyy)
 HELPERS-y +=3D virtiofsd$(EXESUF)
 vhost-user-json-y +=3D tools/virtiofsd/50-qemu-virtiofsd.json
 endif
@@ -697,7 +697,7 @@ rdmacm-mux$(EXESUF): $(rdmacm-mux-obj-y) $(COMMON_LDADD=
S)
 =09$(call LINK, $^)
=20
 # relies on Linux-specific syscalls
-ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yyy)
+ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG)$(CONFIG_TOOLS),y=
yyy)
 virtiofsd$(EXESUF): $(virtiofsd-obj-y) libvhost-user.a $(COMMON_LDADDS)
 =09$(call LINK, $^)
 endif
--=20
2.24.1


