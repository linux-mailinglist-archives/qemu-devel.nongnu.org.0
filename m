Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF5F3E8A91
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:50:16 +0200 (CEST)
Received: from localhost ([::1]:33366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDi47-0002YD-Qo
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDhw2-0005Kr-7D
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:41:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDhw0-0006jV-Mz
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628664112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EBQMR+pBsYGkGiMfurXJVRfKPWjXcLgVXWQaJP/M9cg=;
 b=BO09ejcWtkqoUVWJ5cvVLAr3wvvwI3aETxiRMf5K1QGn0V6aKdadiqSwJa4YflqCDT6zhA
 2ljptckETvgVp07Rsqbdog84SlDq9ThYlxXqB1RYWOzUkvrQiJTwgDZFojdYbfGtbokd5/
 8lpNL0MSBShwaAMKTKXyIaYjrEeIfS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-l04KZ5YQOvCkkOugJI1r8A-1; Wed, 11 Aug 2021 02:41:50 -0400
X-MC-Unique: l04KZ5YQOvCkkOugJI1r8A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA56E190A7A1;
 Wed, 11 Aug 2021 06:41:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 112FA5D6AD;
 Wed, 11 Aug 2021 06:41:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A42151800995; Wed, 11 Aug 2021 08:41:28 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] MAINTAINERS: update usb entries.
Date: Wed, 11 Aug 2021 08:41:26 +0200
Message-Id: <20210811064128.2776317-6-kraxel@redhat.com>
In-Reply-To: <20210811064128.2776317-1-kraxel@redhat.com>
References: <20210811064128.2776317-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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
Message-Id: <20210810083450.2377374-6-kraxel@redhat.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 33b4fc25e349..b84b7e33e4d0 100644
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


