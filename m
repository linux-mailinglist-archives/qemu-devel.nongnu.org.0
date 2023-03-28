Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B0C6CB5F8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 07:22:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph1kK-0005Ve-Ny; Tue, 28 Mar 2023 01:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ph1kF-0005Tg-K9
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 01:19:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ph1kE-0007TG-6G
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 01:19:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679980781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dsb5mjY+rPwYI+SQXo1CEBP8f7sXY0f2cAZqVaBIwes=;
 b=HTEB4dJ7oQbFPH2hGmaJUHr541qc1S0sbJbjHJkrcVKdLBAmvYSH1u8rG8MzmhYHNz8ETV
 k0RAyPqbTpmjsjq6oBHZeLpJVPPvvMUviQzvMF+FmREB/aEMBVP9WzAz7PESvR5qMhijqu
 0xLmqPSXHuKgpJolditqwumy5wrFxzk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-qJ7JpMzCPZ2F1pro6UE4Fw-1; Tue, 28 Mar 2023 01:19:36 -0400
X-MC-Unique: qJ7JpMzCPZ2F1pro6UE4Fw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70BAA8028AD;
 Tue, 28 Mar 2023 05:19:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-204.pek2.redhat.com
 [10.72.13.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AE6D2027040;
 Tue, 28 Mar 2023 05:19:34 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 05/12] MAINTAINERS: Add Sriram Yagnaraman as a igb reviewer
Date: Tue, 28 Mar 2023 13:19:10 +0800
Message-Id: <20230328051917.18006-6-jasowang@redhat.com>
In-Reply-To: <20230328051917.18006-1-jasowang@redhat.com>
References: <20230328051917.18006-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>

I would like to review and be informed on changes to igb device

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 34b50b2..ef45b5e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2252,6 +2252,7 @@ F: tests/qtest/libqos/e1000e.*
 
 igb
 M: Akihiko Odaki <akihiko.odaki@daynix.com>
+R: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
 S: Maintained
 F: docs/system/devices/igb.rst
 F: hw/net/igb*
-- 
2.7.4


