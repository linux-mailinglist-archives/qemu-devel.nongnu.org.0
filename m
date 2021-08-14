Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9023EC0E2
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 08:19:48 +0200 (CEST)
Received: from localhost ([::1]:53492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEn1H-0007YD-4t
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 02:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEmsD-0006tV-5V
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEmsA-0004RR-S6
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628921420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cIKYl9R73RSDxblnxSjgtVHV4aHEEiTkCoxHOGMuGzw=;
 b=SNj5OaewRn7Up9D1B76BqjAofSUrwoXJDSpBH0mNzbkA1gO1a2q36cStBBuqjjBSzppecD
 CRd5fAgXi6ezDJlR66XbNS26SS9Ik3NNmVcYm17JRGtzFlNiOH/5A1FfjQH7dU3HYHX/UZ
 fDGmsEovCodWIDh9jySjklNeFVakO+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-A47g1Xb9PCGLI6yxhvR50A-1; Sat, 14 Aug 2021 02:10:19 -0400
X-MC-Unique: A47g1Xb9PCGLI6yxhvR50A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 640F118C8C00;
 Sat, 14 Aug 2021 06:10:18 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A0DD5D9FC;
 Sat, 14 Aug 2021 06:10:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 10/11] docs/about/removed-features: Document removed devices
 from older QEMU versions
Date: Sat, 14 Aug 2021 08:09:55 +0200
Message-Id: <20210814060956.12852-11-thuth@redhat.com>
In-Reply-To: <20210814060956.12852-1-thuth@redhat.com>
References: <20210814060956.12852-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These devices had been removed/replaced in QEMU v2.12 and v4.0.

Message-Id: <20210811084103.74832-6-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/removed-features.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 8bf3ebecab..0c860be62d 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -513,6 +513,17 @@ running the old binaries, you can use older versions of QEMU.
 System emulator devices
 -----------------------
 
+``spapr-pci-vfio-host-bridge`` (removed in 2.12)
+'''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``spapr-pci-vfio-host-bridge`` device type has been replaced by the
+``spapr-pci-host-bridge`` device type.
+
+``ivshmem`` (removed in 4.0)
+''''''''''''''''''''''''''''
+
+Replaced by either the ``ivshmem-plain`` or ``ivshmem-doorbell``.
+
 ``ide-drive`` (removed in 6.0)
 ''''''''''''''''''''''''''''''
 
-- 
2.27.0


