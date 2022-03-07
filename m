Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB204CFE79
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:29:30 +0100 (CET)
Received: from localhost ([::1]:58710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCUT-00035H-O9
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:29:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nRB99-0007pL-8x
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:03:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nRB96-0003m7-Rc
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646650999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLFXaEWGHb0M1LynjuQ03ZjDtfCkU4TnhRsU2793o5Y=;
 b=YntNu5/x7Eu4gV7FH+/Vnm3DGjrJcz3KeNOKv34JgVRLHTbuqmeJ3zSONxp4QHY/IIBwjL
 tmeOTZCjdj6ClH80P8E9/VifGiso5wjHlJweb4rs6jJOm6/tqk0EF6OkjIvQrwx6xitFD8
 1qLrh1o17T5eeLtHXAmxYJecaNrIqoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-DwMDbAkuOYmJQbZ8YTPU_A-1; Mon, 07 Mar 2022 06:03:18 -0500
X-MC-Unique: DwMDbAkuOYmJQbZ8YTPU_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4929B180FCD8
 for <qemu-devel@nongnu.org>; Mon,  7 Mar 2022 11:03:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FE9483091;
 Mon,  7 Mar 2022 11:03:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2CCD71800616; Mon,  7 Mar 2022 12:03:03 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] update seabios submodule to 1.16.0
Date: Mon,  7 Mar 2022 12:03:02 +0100
Message-Id: <20220307110303.1698186-2-kraxel@redhat.com>
In-Reply-To: <20220307110303.1698186-1-kraxel@redhat.com>
References: <20220307110303.1698186-1-kraxel@redhat.com>
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

git shortlog 6a62e0cb0dfe..rel-1.16.0
-------------------------------------

Florian Larysch (1):
      nvme: fix LBA format data structure

Jan Beulich via SeaBIOS (1):
      nvme: avoid use-after-free in nvme_controller_enable()

Kevin O'Connor (9):
      smm: Suppress gcc array-bounds warnings
      nvme: Rework nvme_io_readwrite() to return -1 on error
      nvme: Add nvme_bounce_xfer() helper function
      nvme: Convert nvme_build_prpl() to nvme_prpl_xfer()
      nvme: Pass prp1 and prp2 directly to nvme_io_xfer()
      nvme: Build the page list in the existing dma buffer
      nvme: Only allocate one dma bounce buffer for all nvme drives
      sercon: Fix missing GET_LOW() to access rx_bytes
      docs: Note v1.16.0 release

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 roms/seabios | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/roms/seabios b/roms/seabios
index 6a62e0cb0dfe..d239552ce722 160000
--- a/roms/seabios
+++ b/roms/seabios
@@ -1 +1 @@
-Subproject commit 6a62e0cb0dfe9cd28b70547dbea5caf76847c3a9
+Subproject commit d239552ce7220e448ae81f41515138f7b9e3c4db
-- 
2.35.1


