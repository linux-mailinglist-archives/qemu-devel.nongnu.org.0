Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7113C1950
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:38:55 +0200 (CEST)
Received: from localhost ([::1]:55242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YvG-00065n-2x
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1Ypy-0005xB-2m
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:33:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1Ypt-00022Y-0s
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625769200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ISqBKCG50Q+uHJRY5BwLzy4YuIGTUPjzlmsgxcUgY+E=;
 b=c9av/ZrUoIqBmkT9rZDfn7DL+xLbLKkoN2n9fI2lPX2RCeEKpL6gO1yAyocghcq140OgpB
 yF9SEoc7GVUZVWdEbvPO/DrXNUEzqutTsN906sjruLThrmslI6Mqg7Je52W8pQJ+TvDs0+
 d9ol2AIYvrAjHK+gCh9frN+0q5tnp8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-EZey6X8XN4qQgjmZnOmBMQ-1; Thu, 08 Jul 2021 14:33:18 -0400
X-MC-Unique: EZey6X8XN4qQgjmZnOmBMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADEB2106B7F3
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 18:33:10 +0000 (UTC)
Received: from worklaptop.home (ovpn-115-15.rdu2.redhat.com [10.10.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D283817567;
 Thu,  8 Jul 2021 18:32:49 +0000 (UTC)
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] contrib: qemu-guest-agent.service: Add Documentation= link
Date: Thu,  8 Jul 2021 14:32:00 -0400
Message-Id: <f813134a01ec1d4edd6da5930595d505a361a33c.1625769000.git.crobinso@redhat.com>
In-Reply-To: <cover.1625769000.git.crobinso@redhat.com>
References: <cover.1625769000.git.crobinso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

OpenSUSE adds this to their service file

Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
 contrib/systemd/qemu-guest-agent.service | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/systemd/qemu-guest-agent.service b/contrib/systemd/qemu-guest-agent.service
index 59f7ecb1b8..7e1c50577b 100644
--- a/contrib/systemd/qemu-guest-agent.service
+++ b/contrib/systemd/qemu-guest-agent.service
@@ -1,5 +1,6 @@
 [Unit]
 Description=QEMU Guest Agent
+Documentation=https://wiki.qemu.org/Features/GuestAgent
 BindsTo=dev-virtio\x2dports-org.qemu.guest_agent.0.device
 After=dev-virtio\x2dports-org.qemu.guest_agent.0.device
 
-- 
2.31.1


