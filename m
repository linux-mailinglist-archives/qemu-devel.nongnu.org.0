Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B77E93E55A7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:40:01 +0200 (CEST)
Received: from localhost ([::1]:57288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNIm-0001NU-CW
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDNEB-0005xC-QF
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:35:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDNEA-0006NK-20
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628584513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rYPImCZdahptXS1i6zlZ0473tnxmUX1f27fUhlDqSvY=;
 b=Ko+XOlupgP5wY+2q+zuDi7vYtN58YBurVfJ1NkvcAJQ0S9xBsIpV6ukUjWGTAHBgpFVTm7
 5ClhkAvkgp4FSTkfR2SsSWl4xjA2lEZMiMRBBRfyXD3SUDE5slNvC+sDV2/yL8Ikd0eZwn
 YazyAy4hRJS+i3gx8xnIrmjStwSz57s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-zp0xc-CsNlaPZ1CfQ2X7yw-1; Tue, 10 Aug 2021 04:35:11 -0400
X-MC-Unique: zp0xc-CsNlaPZ1CfQ2X7yw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B89F610119D9
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:34:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 839E65B4BC;
 Tue, 10 Aug 2021 08:34:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9D018180092F; Tue, 10 Aug 2021 10:34:50 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] MAINTAINERS: update virtio-input entry.
Date: Tue, 10 Aug 2021 10:34:49 +0200
Message-Id: <20210810083450.2377374-7-kraxel@redhat.com>
In-Reply-To: <20210810083450.2377374-1-kraxel@redhat.com>
References: <20210810083450.2377374-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New maintainer wanted. Downgrade status to "Odd Fixes" for now.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fda79d2449ad..5d24ac453bb6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1951,7 +1951,7 @@ L: virtio-fs@redhat.com
 
 virtio-input
 M: Gerd Hoffmann <kraxel@redhat.com>
-S: Maintained
+S: Odd Fixes
 F: hw/input/vhost-user-input.c
 F: hw/input/virtio-input*.c
 F: include/hw/virtio/virtio-input.h
-- 
2.31.1


