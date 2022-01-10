Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6C9488F0B
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 04:51:46 +0100 (CET)
Received: from localhost ([::1]:47064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6lij-0001ML-S8
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 22:51:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n6lYO-00072I-GQ
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 22:41:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n6lYM-0006He-Ss
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 22:41:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641786060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJSZ4MO77st32NCmeKRdiFhhEHxxpYN2cF0u8lg0jMc=;
 b=Af+qy8/z/Xk+423Hh04S8NyanLjrRMdwnPF6k4aDFGHuTYUV9q1k691Bfob+NjIHCGBzYk
 c4o7uiCOXya/sAIJd1Z0GAKvpQqj0nPcRATemZ/hvo1kMT8rtIfGwii7bqH8Hjz9v8LeRA
 PyVSW/RoWX7+/puECpLmLax41PBE3so=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-LTKRyvCyPJWhkhL20AWhaA-1; Sun, 09 Jan 2022 22:40:52 -0500
X-MC-Unique: LTKRyvCyPJWhkhL20AWhaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DAB581CCB4;
 Mon, 10 Jan 2022 03:40:51 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-6.pek2.redhat.com [10.72.14.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76104E72B;
 Mon, 10 Jan 2022 03:40:44 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 13/13] net/vmnet: update MAINTAINERS list
Date: Mon, 10 Jan 2022 11:40:00 +0800
Message-Id: <20220110034000.20221-14-jasowang@redhat.com>
In-Reply-To: <20220110034000.20221-1-jasowang@redhat.com>
References: <20220110034000.20221-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>

Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c98a61c..638d129 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2641,6 +2641,11 @@ W: http://info.iet.unipi.it/~luigi/netmap/
 S: Maintained
 F: net/netmap.c
 
+Apple vmnet network backends
+M: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
+S: Maintained
+F: net/vmnet*
+
 Host Memory Backends
 M: David Hildenbrand <david@redhat.com>
 M: Igor Mammedov <imammedo@redhat.com>
-- 
2.7.4


