Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C19C1F5436
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 14:07:25 +0200 (CEST)
Received: from localhost ([::1]:48180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jizVs-00034q-6M
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 08:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jizKU-0003iK-Vy
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 07:55:39 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26229
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1jizKU-0002C1-6O
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 07:55:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591790137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gfo8N/39HuNuGms67Iz3gfpzyYs5Q5599cbmKQTi7kc=;
 b=NsuruMnef/SeXrInDcbk1Tv3QbOVo9piPty2T2GrMBeTlv5O0l0SJlPL2l9783FMZCnADS
 M1SfiRiEEfFRQRYGoqtSdD1gVT6U/UCUaTuzFRewy5bRaqFIyNhHi7fDrl8SKGt5gSkB1b
 Js2UjyyUfW+ZKO7WLK3sewJlvgUYbXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-PRFe2t6NMSCLqb1PnzQQoQ-1; Wed, 10 Jun 2020 07:55:33 -0400
X-MC-Unique: PRFe2t6NMSCLqb1PnzQQoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67AF0100A8EB;
 Wed, 10 Jun 2020 11:55:32 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-42.ams2.redhat.com [10.36.114.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D5E75D9D3;
 Wed, 10 Jun 2020 11:55:30 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/21] MAINTAINERS: Add myself as virtio-mem maintainer
Date: Wed, 10 Jun 2020 13:54:10 +0200
Message-Id: <20200610115419.51688-13-david@redhat.com>
In-Reply-To: <20200610115419.51688-1-david@redhat.com>
References: <20200610115419.51688-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=205.139.110.120; envelope-from=david@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 23:51:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3abe3faa4e..4889485e6c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1762,6 +1762,14 @@ F: hw/virtio/virtio-crypto.c
 F: hw/virtio/virtio-crypto-pci.c
 F: include/hw/virtio/virtio-crypto.h
 
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
-- 
2.26.2


