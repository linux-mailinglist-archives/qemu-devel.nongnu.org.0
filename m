Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82623E5595
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:37:09 +0200 (CEST)
Received: from localhost ([::1]:42932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNG0-0000Js-PJ
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDNEA-0005tD-3Z
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:35:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDNE8-0006LO-GH
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:35:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628584511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+A1baJPERYgAjCOTTSh6pYqsoIRgE/QhH4n8450C0Lg=;
 b=OrqaH0xnOmhpy0SneypZii8c5MFOR6CQ3ZOCaMJ8DK34XjdLutK4VE/P1kHmxguKFq0kjs
 aHb5cIhHKB/AJ4zLkt4Wp7lm0Qw9bYXFZ1zuNswFaR2frMVgSZqdw9UgGWtMipJPR9jSG1
 Fp1yq4029Z4Z/5UQI74CmxXOQixlK94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-qNrEjbHeM_SpV7XUI2K2oQ-1; Tue, 10 Aug 2021 04:35:10 -0400
X-MC-Unique: qNrEjbHeM_SpV7XUI2K2oQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15FA187D579;
 Tue, 10 Aug 2021 08:34:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CF6E4100EB3D;
 Tue, 10 Aug 2021 08:34:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9296C180092E; Tue, 10 Aug 2021 10:34:50 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] MAINTAINERS: update usb entries.
Date: Tue, 10 Aug 2021 10:34:48 +0200
Message-Id: <20210810083450.2377374-6-kraxel@redhat.com>
In-Reply-To: <20210810083450.2377374-1-kraxel@redhat.com>
References: <20210810083450.2377374-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New maintainer wanted.  Switch role to "Reviewer" for usb-serial,
downgrade status to "Odd Fixes" for everything else.

Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ef916c993472..fda79d2449ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1832,7 +1832,7 @@ F: tests/qtest/sdhci-test.c
 
 USB
 M: Gerd Hoffmann <kraxel@redhat.com>
-S: Maintained
+S: Odd Fixes
 F: hw/usb/*
 F: stubs/usb-dev-stub.c
 F: tests/qtest/usb-*-test.c
@@ -1841,7 +1841,7 @@ F: include/hw/usb.h
 F: include/hw/usb/
 
 USB (serial adapter)
-M: Gerd Hoffmann <kraxel@redhat.com>
+R: Gerd Hoffmann <kraxel@redhat.com>
 M: Samuel Thibault <samuel.thibault@ens-lyon.org>
 S: Maintained
 F: hw/usb/dev-serial.c
-- 
2.31.1


