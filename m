Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A2928114D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 13:35:05 +0200 (CEST)
Received: from localhost ([::1]:48986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOJL6-00045U-48
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 07:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kOJJ8-0002h0-Mj
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 07:33:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kOJJ4-00076D-Fp
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 07:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601638377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T0C33xk27iwHi2CyJPAmpAvPjfZEjt9O5EboSui9wPk=;
 b=JDrbwjZoIDq3HwQcaun69y3/Uh5h13dWm51fVz14F75kESVmzsgR8MWq5TO/nvfRr+X8E+
 Vg89+W5tJ2R+nsMAgS5QanDgRnV4WcnLwI6MMw5obClkf0Hs5tWAb862l+Kw1Ddhjq0EaV
 pYZKH53ESJ2aLubZGTGi2xtSbdDlMyQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-yk2ji8_1Obu78NO3dcwczQ-1; Fri, 02 Oct 2020 07:32:55 -0400
X-MC-Unique: yk2ji8_1Obu78NO3dcwczQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5784C425DB;
 Fri,  2 Oct 2020 11:32:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-9.ams2.redhat.com
 [10.36.114.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1F9A60C05;
 Fri,  2 Oct 2020 11:32:51 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] block: drop moderated sheepdog mailing list from
 MAINTAINERS file
Date: Fri,  2 Oct 2020 12:32:42 +0100
Message-Id: <20201002113243.2347710-2-berrange@redhat.com>
In-Reply-To: <20201002113243.2347710-1-berrange@redhat.com>
References: <20201002113243.2347710-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 01:13:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 sheepdog@lists.wpkg.org, qemu-block@nongnu.org, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Liu Yuan <namei.unix@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sheepdog mailing list is setup to stop and queue messages from
non-subscribers, pending moderator approval. Unfortunately it seems
that the moderation queue is not actively dealt with. Even when messages
are approved, the sender is never added to the whitelist, so every
future mail from the same sender continues to get stopped for moderation.

MAINTAINERS entries should be responsive and not unneccessarily block
mails from QEMU contributors, so drop the sheepdog mailing list.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b76fb31861..c7d6601adf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2874,7 +2874,6 @@ F: block/rbd.c
 Sheepdog
 M: Liu Yuan <namei.unix@gmail.com>
 L: qemu-block@nongnu.org
-L: sheepdog@lists.wpkg.org
 S: Odd Fixes
 F: block/sheepdog.c
 
-- 
2.26.2


