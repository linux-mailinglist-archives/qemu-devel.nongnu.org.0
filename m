Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E8C1298D5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 17:43:42 +0100 (CET)
Received: from localhost ([::1]:58725 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijQo0-00058W-PD
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 11:43:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1ijQlf-00039o-HQ
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:41:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1ijQle-0005KM-KB
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:41:15 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:59307
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1ijQle-0005Jn-GG
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 11:41:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577119273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTcB6zAIaRzY9EwvftE6Rtrz5u5tIha89kZ+phnxUYk=;
 b=ZOJslvX0iHlQep/wo+NSr1eoDnuaEPxOvEVgj6gh5bKjoPX/cMRlbd8dYmZRW4AJKWGRyF
 N36KaA27DWkp2Dj2u+Z9RadOoUf+jsGZgLbiWy6QoHasbKM/a6JPeEKfsAiizERDbGhNFx
 B7FxAKpt6sE/NOFysWh46JMyJf34Y8w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-XCg5pc_NNaiKT6uJ8LlzQQ-1; Mon, 23 Dec 2019 11:41:12 -0500
Received: by mail-qv1-f69.google.com with SMTP id di5so6634141qvb.3
 for <qemu-devel@nongnu.org>; Mon, 23 Dec 2019 08:41:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RMQMUHnYVnq2AcC/aQn0pR+4gejts1KmX+FDMoG77/0=;
 b=DD8Yyfi1Qyuw/K84v3LE+xw9WqYxgbHTXnoTfwjtfnZnW+fYF8JDboXZV0IruKtsZ0
 CJ7uCzDE52rRQgBQS6JpP020MYdnGuOOH8CRJtc/thTBF6FMc5d5Qj5fU+Htv5LRDdHK
 vakxW6e5cfrfdFtNUCppPNY7q6piOmeCcORnUrA99s92opjFefbloC+QK3xWAg7ohHgB
 3f3m4etMZqJ1/WlT6HK6/VxV3LDe9zJ7sB1L5G25fzibmQ0WLI+CDhpsAUwZIajPWz7A
 fLN1CBojEPxDiUaABm5MqIhtqrw4DERvvYSk9lETlxh20TO0GXH9260aHIRZgR4ERbkN
 qHiQ==
X-Gm-Message-State: APjAAAX4ZNPWblDnmjW36l7jpfPyquvcMRO2Uk7KYwz6uNMlSe72OkIv
 kum1bHBcV3dlCh1DB+DVm70TyAaQDvC5NarnUtJIkIR6oAp3T2zazQtrZK12Q3hR7+7KfmVGfUK
 Eqijv28J1AD61wy0=
X-Received: by 2002:ae9:c205:: with SMTP id j5mr25502953qkg.58.1577119271210; 
 Mon, 23 Dec 2019 08:41:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqy2bphtPkQkNeDyoeIZgfkCT2JccSJ5nMuTU00bO8+mq4IUGvuuHQY/FwQwo0q+Ihv1HVXlOQ==
X-Received: by 2002:ae9:c205:: with SMTP id j5mr25502926qkg.58.1577119270981; 
 Mon, 23 Dec 2019 08:41:10 -0800 (PST)
Received: from redhat.com (bzq-109-64-31-13.red.bezeqint.net. [109.64.31.13])
 by smtp.gmail.com with ESMTPSA id
 a14sm5951023qko.92.2019.12.23.08.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2019 08:41:10 -0800 (PST)
Date: Mon, 23 Dec 2019 11:41:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/27] virtio: make virtio_delete_queue idempotent
Message-ID: <20191223141536.72682-3-mst@redhat.com>
References: <20191223141536.72682-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191223141536.72682-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: XCg5pc_NNaiKT6uJ8LlzQQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pan Nengyuan <pannengyuan@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's make sure calling this twice is harmless -
no known instances, but seems safer.

Suggested-by: Pan Nengyuan <pannengyuan@huawei.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 31dd140990..6de3cfdc2c 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2337,6 +2337,7 @@ void virtio_delete_queue(VirtQueue *vq)
     vq->handle_output =3D NULL;
     vq->handle_aio_output =3D NULL;
     g_free(vq->used_elems);
+    vq->used_elems =3D NULL;
 }
=20
 void virtio_del_queue(VirtIODevice *vdev, int n)
--=20
MST


