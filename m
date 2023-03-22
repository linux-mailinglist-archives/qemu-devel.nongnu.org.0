Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D2E6C4D81
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:23:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezLc-0007ps-OX; Wed, 22 Mar 2023 10:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLY-0007oT-Jx
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:21:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLV-0007GY-OY
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:21:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679494905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=84Cr/6MZMABQKFW5vYpViPyJnkJMcWbdHEFemWFRFTg=;
 b=Zugf4i22tvTZTzqAyGeHoZqXuz/iQBuBLVZHYwP9ok/x6aUiX+QacVKkJyMUbEatEVOi70
 hFsR4rWFEaDDmzqF+aZZbgBM/Iv2FdCnGxcdIHIyxFFDB1JxnPUTP1l3hj3QR9PdPAaJaz
 u81kdr+NxPNn0/xBwNmBlLWrpxw6pWQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-OT--XM9WPCiTjdxKUkK2jQ-1; Wed, 22 Mar 2023 10:21:42 -0400
X-MC-Unique: OT--XM9WPCiTjdxKUkK2jQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5582285530E;
 Wed, 22 Mar 2023 14:21:42 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.226.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBEB240C6E67;
 Wed, 22 Mar 2023 14:21:39 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, fmartine@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, eballetb@redhat.com,
 Albert Esteve <aesteve@redhat.com>, alex.bennee@linaro.org,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 sgarzare@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 peter.griffin@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 02/12] MAINTAINERS: Add virtio-video section
Date: Wed, 22 Mar 2023 15:21:22 +0100
Message-Id: <20230322142132.22909-3-aesteve@redhat.com>
In-Reply-To: <20230322142132.22909-1-aesteve@redhat.com>
References: <20230322142132.22909-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=aesteve@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Griffin <peter.griffin@linaro.org>

Add myself as maintainer of the virtio-video files added
in this series.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b56ccdd92..c6cc04c4f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2176,6 +2176,14 @@ F: hw/virtio/vhost-user-gpio*
 F: include/hw/virtio/vhost-user-gpio.h
 F: tests/qtest/libqos/virtio-gpio.*
 
+virtio-video
+M: Albert Esteve <aesteve@redhat.com>
+S: Supported
+F: hw/display/vhost-user-video.c
+F: hw/display/vhost-user-video-pci.c
+F: include/hw/virtio/vhost-user-video.h
+F: tools/vhost-user-video/*
+
 virtio-crypto
 M: Gonglei <arei.gonglei@huawei.com>
 S: Supported
-- 
2.39.2


