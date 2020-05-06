Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3BA1C6DEB
	for <lists+qemu-devel@lfdr.de>; Wed,  6 May 2020 12:03:41 +0200 (CEST)
Received: from localhost ([::1]:41110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWGtw-0000Ys-AF
	for lists+qemu-devel@lfdr.de; Wed, 06 May 2020 06:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jWGhe-0005RQ-HP
 for qemu-devel@nongnu.org; Wed, 06 May 2020 05:50:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36030
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jWGhd-0004tZ-Ie
 for qemu-devel@nongnu.org; Wed, 06 May 2020 05:50:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588758656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wNnV1o2sGn2mnkPQHzSb908sWqnev3kAZicrjpV0Uu4=;
 b=WTk60kHGKVpyG7EaWFIZbvet5rcGXT+bMSGxc/19lCACQGsaGxr+KPCeiwcstJY7putYv5
 JyoP59ek7mxI9betM/bZUF1RivquVze//GveHUYH7DgCs/tQMpfgt8ykc+fi4pBxAaABdP
 1R7vpWb+99MRi1aHyFefHKhbRKSBMmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-k6OBLxMJN6aj_s6dkKEgGQ-1; Wed, 06 May 2020 05:50:55 -0400
X-MC-Unique: k6OBLxMJN6aj_s6dkKEgGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4280107ACCA;
 Wed,  6 May 2020 09:50:53 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-113-17.ams2.redhat.com [10.36.113.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 591515C1BD;
 Wed,  6 May 2020 09:50:46 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 12/17] MAINTAINERS: Add myself as virtio-mem maintainer
Date: Wed,  6 May 2020 11:49:43 +0200
Message-Id: <20200506094948.76388-13-david@redhat.com>
In-Reply-To: <20200506094948.76388-1-david@redhat.com>
References: <20200506094948.76388-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=david@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 23:48:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's make sure patches/bug reports find the right person.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1f84e3ae2c..09fff9e1bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1734,6 +1734,14 @@ F: hw/virtio/virtio-crypto.c
 F: hw/virtio/virtio-crypto-pci.c
 F: include/hw/virtio/virtio-crypto.h
=20
+virtio-mem
+M: David Hildenbrand <david@redhat.com>
+S: Supported
+F: hw/virtio/virtio-mem.c
+F: hw/virtio/virtio-mem-pci.h
+F: hw/virtio/virtio-mem-pci.c
+F: include/hw/virtio/virtio-mem.h
+
 nvme
 M: Keith Busch <kbusch@kernel.org>
 L: qemu-block@nongnu.org
--=20
2.25.3


