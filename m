Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBAB3E8A4D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:44:11 +0200 (CEST)
Received: from localhost ([::1]:44644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDhyE-0007rT-1f
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDhvx-00056B-7X
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:41:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mDhvv-0006en-5w
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:41:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628664106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQMG706gkKo+oHLq4crL6aAyhXV7NbeZLh3keb/e5IA=;
 b=QqCiY4QGJ5cCodlABURwsSa+A2IGY+T9xjxWEHZRAAUpNpfASQ7GcvOvYYEmF3ES0q6ek2
 f4mO2/GHPzdrLWhQsWNruLHjvyEsO7dvfdcgPpJ916BO5zIP1ACtPK1GWXOYUZcBnjCL/u
 sdnLsFvqNyQbntecXQyTg+Ts4lNZjvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-9d-5hSNoMre6JIt2M8jzEQ-1; Wed, 11 Aug 2021 02:41:45 -0400
X-MC-Unique: 9d-5hSNoMre6JIt2M8jzEQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73533107ACF5
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 06:41:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98A185C1B4;
 Wed, 11 Aug 2021 06:41:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 84E0A1800991; Wed, 11 Aug 2021 08:41:28 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] MAINTAINERS: update sockets entry.
Date: Wed, 11 Aug 2021 08:41:23 +0200
Message-Id: <20210811064128.2776317-3-kraxel@redhat.com>
In-Reply-To: <20210811064128.2776317-1-kraxel@redhat.com>
References: <20210811064128.2776317-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have not touched the code for years.
Make the entry match reality and drop my name.

Cc: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210810083450.2377374-3-kraxel@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d6c84bd0a983..79b0148cfc27 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2843,7 +2843,6 @@ F: tests/unit/test-authz-*
 
 Sockets
 M: Daniel P. Berrange <berrange@redhat.com>
-M: Gerd Hoffmann <kraxel@redhat.com>
 S: Maintained
 F: include/qemu/sockets.h
 F: util/qemu-sockets.c
-- 
2.31.1


