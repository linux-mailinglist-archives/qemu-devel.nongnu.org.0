Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822D128DB28
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 10:24:14 +0200 (CEST)
Received: from localhost ([::1]:51420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSc4y-0001lQ-5B
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 04:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kSc2s-0008V3-Jh
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 04:22:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kSc2p-0007ay-Rv
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 04:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602663718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f73Ck4DO9ri0tAJzjHrlzoIp9hcZEvu5GRRGi61o4Sk=;
 b=fR39w5PLcjFnZLeV/zPA5Md2vV615F7zv9fwKsKaoRUuzJxLnCQRHF8c2AAojVN+gJz+35
 DOhwOuu+YI9h+Squjkr5wsGqDiQOc/TOJTc//l/yApNpC3Nef+7hP8AheqsWMhr+Cl3UEH
 CWlUOz5yDxwAT9t+pzcafrlML4jOP2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-OKaecRkUM-usv7IhGperBA-1; Wed, 14 Oct 2020 04:21:56 -0400
X-MC-Unique: OKaecRkUM-usv7IhGperBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 455B51006709;
 Wed, 14 Oct 2020 08:21:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C13C76655;
 Wed, 14 Oct 2020 08:21:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 450ED43BFBB; Wed, 14 Oct 2020 10:21:50 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/9] vnc-stubs: Allow -vnc none
Date: Wed, 14 Oct 2020 10:21:46 +0200
Message-Id: <20201014082149.26853-7-kraxel@redhat.com>
In-Reply-To: <20201014082149.26853-1-kraxel@redhat.com>
References: <20201014082149.26853-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 01:12:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Andryuk <jandryuk@gmail.com>

Currently `-vnc none` is fatal when built with `--disable-vnc`.  Make
vnc_parse accept "none", so QEMU still run without using vnc.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Message-id: 20201009014032.3507-1-jandryuk@gmail.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vnc-stubs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/vnc-stubs.c b/ui/vnc-stubs.c
index 06c4ac6296eb..c6b737dcec67 100644
--- a/ui/vnc-stubs.c
+++ b/ui/vnc-stubs.c
@@ -12,6 +12,9 @@ int vnc_display_pw_expire(const char *id, time_t expires)
 };
 QemuOpts *vnc_parse(const char *str, Error **errp)
 {
+    if (strcmp(str, "none") == 0) {
+        return NULL;
+    }
     error_setg(errp, "VNC support is disabled");
     return NULL;
 }
-- 
2.27.0


