Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E14D33E559D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:37:30 +0200 (CEST)
Received: from localhost ([::1]:44982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNGL-0001gy-TA
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDNE0-0005ZQ-Lm
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:35:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDNDz-0006DP-5D
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628584501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ppfL2QVg5lahFqxSyi9Lfnb1rRKi41Ypttru3yzK2Kw=;
 b=I918KgHGbC7SfZE8aCeS6D66eCcbsU7+ujbKiR2FYvSrAe7S3jtL+avPzvc8KHK8CyG2Jb
 PqgoWiZCifNghJK+RooZm8X/tg/vHVQLlQRyEYZ7c98/bL1uMmZ44+AiA3Yq0pBUXgIzXk
 7jcvJB8pzy1c8zcfe7+7ZI8YEcQhjV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-AIMcLEaWO12FWAUGYTb3oA-1; Tue, 10 Aug 2021 04:35:00 -0400
X-MC-Unique: AIMcLEaWO12FWAUGYTb3oA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5574196DD16
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:34:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0342F797E4;
 Tue, 10 Aug 2021 08:34:51 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6898E18007AD; Tue, 10 Aug 2021 10:34:50 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] MAINTAINERS: update edk2 entry.
Date: Tue, 10 Aug 2021 10:34:44 +0200
Message-Id: <20210810083450.2377374-2-kraxel@redhat.com>
In-Reply-To: <20210810083450.2377374-1-kraxel@redhat.com>
References: <20210810083450.2377374-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I want keep an eye on the edk2 things happening in qemu.

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 37b1a8e4428c..9d31e42786b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2947,6 +2947,7 @@ F: docs/interop/firmware.json
 
 EDK2 Firmware
 M: Philippe Mathieu-Daudé <philmd@redhat.com>
+R: Gerd Hoffmann <kraxel@redhat.com>
 S: Supported
 F: hw/i386/*ovmf*
 F: pc-bios/descriptors/??-edk2-*.json
-- 
2.31.1


