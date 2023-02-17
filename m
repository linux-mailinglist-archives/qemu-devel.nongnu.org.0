Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E24B69AF21
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 16:11:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pT2Ni-00050c-TM; Fri, 17 Feb 2023 10:10:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NY-0004tK-1I
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pT2NV-0007YW-Bx
 for qemu-devel@nongnu.org; Fri, 17 Feb 2023 10:10:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676646624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AXQgVWaQES+pKXQokSrrczUQsrx5n6vWlsNSC1fjj5M=;
 b=LQFtiOKCJPPlRe2SLIlkWcHi77mssM1hsKPes5ndwkPf9uXTz1MswFigLYx/FZ/V1zPd2A
 PwTL+oPejxowtPcqNgYH1rRrznnaJl+9Z4m/L/RjtTAX/BixSdsEqOVXPpTw6TeQxKTgbS
 FyxEWGVIjDAqtRMh5AIdTnLOlYfGQrI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-VWeUMB_pOrWUhTBh0o0-MQ-1; Fri, 17 Feb 2023 10:10:21 -0500
X-MC-Unique: VWeUMB_pOrWUhTBh0o0-MQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7D82185A794;
 Fri, 17 Feb 2023 15:10:20 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C746492C14;
 Fri, 17 Feb 2023 15:10:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 20/22] MAINTAINERS: drop Vladimir from parallels block driver
Date: Fri, 17 Feb 2023 16:09:52 +0100
Message-Id: <20230217150954.283920-20-kwolf@redhat.com>
In-Reply-To: <20230217150954.283920-1-kwolf@redhat.com>
References: <20230217150829.283583-1-kwolf@redhat.com>
 <20230217150954.283920-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

I have to admit this is out of my scope now. Still feel free to Cc me
directly if my help is needed :)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20230214182848.1564714-1-vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd54c1f140..65ee4c31b1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3579,13 +3579,11 @@ F: block/dmg.c
 parallels
 M: Stefan Hajnoczi <stefanha@redhat.com>
 M: Denis V. Lunev <den@openvz.org>
-M: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/parallels.c
 F: block/parallels-ext.c
 F: docs/interop/parallels.txt
-T: git https://gitlab.com/vsementsov/qemu.git block
 
 qed
 M: Stefan Hajnoczi <stefanha@redhat.com>
-- 
2.39.2


