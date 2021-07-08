Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9074A3C1952
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:40:01 +0200 (CEST)
Received: from localhost ([::1]:58350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YwK-0008CO-Ka
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1YqE-0006OY-GG
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:33:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m1YqC-00026O-J4
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 14:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625769219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zO/h5X9UPnGQiOCuPnMzSAfAIq7BXyvkfwQU7S8Y810=;
 b=Lp12P3pPm10fvytRcDZm5gANTDXrJSZ3bLM1caTfAY/4/4GXYK6moNuN8GW3nCFI7DjgC+
 Zq/yc4sxPjZ6r/4EgJvKZ6EnSOKbfnnsN8UQXdlrww6GSmR3eFVsQeXA27fvx+sMc95ZkP
 pQn63I9gSEAvhMRaLF20kDj4j3sho+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-t580vm8LOEyF99v7EUmgWw-1; Thu, 08 Jul 2021 14:33:38 -0400
X-MC-Unique: t580vm8LOEyF99v7EUmgWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D3D81926DCC
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 18:33:17 +0000 (UTC)
Received: from worklaptop.home (ovpn-115-15.rdu2.redhat.com [10.10.115.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAE6569320;
 Thu,  8 Jul 2021 18:33:16 +0000 (UTC)
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] contrib: qemu-guest-agent.service: Use
 IgnoreOnIsolate=True
Date: Thu,  8 Jul 2021 14:32:02 -0400
Message-Id: <a4e48006fe2e705c40bea7a45c9142250dd63651.1625769000.git.crobinso@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crobinso@redhat.com;
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

Changing runlevel (telinit 3) will stop qemu-guest-agent.service, and
it won't ever restart, because it's intended to only start when the
specified virtio device is added.

Use IgnoreOnIsolate=True plus Install WantedBy= to keep the agent
running regardless of runlevel, which is the expected behavior IMO.

This has been in RHEL since 7.2ish timeframe:
https://bugzilla.redhat.com/show_bug.cgi?id=1165176

Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
 contrib/systemd/qemu-guest-agent.service | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/contrib/systemd/qemu-guest-agent.service b/contrib/systemd/qemu-guest-agent.service
index 505636a5ba..bb419fe55f 100644
--- a/contrib/systemd/qemu-guest-agent.service
+++ b/contrib/systemd/qemu-guest-agent.service
@@ -3,6 +3,7 @@ Description=QEMU Guest Agent
 Documentation=https://wiki.qemu.org/Features/GuestAgent
 BindsTo=dev-virtio\x2dports-org.qemu.guest_agent.0.device
 After=dev-virtio\x2dports-org.qemu.guest_agent.0.device
+IgnoreOnIsolate=True
 
 [Service]
 ExecStart=/usr/bin/qemu-ga
@@ -10,3 +11,4 @@ Restart=always
 RestartSec=0
 
 [Install]
+WantedBy=dev-virtio\x2dports-org.qemu.guest_agent.0.device
-- 
2.31.1


