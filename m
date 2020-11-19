Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AA32B8DE6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 09:51:33 +0100 (CET)
Received: from localhost ([::1]:36782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfffA-0002eH-K6
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 03:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kffZB-0005ti-3e
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:45:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kffZ9-0002Qr-0B
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 03:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605775517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XcBuP2kU2fxwlpdRUgR9Hp38wxCt6wO/FcLbo2CAgZM=;
 b=gg9MZn6ZAdtggaV4HM6a9djohnNaQhrEYvhzX+e9ZJYFJPkWPbdB50J7/K7EUJdWfPNhJN
 mq9wz9dtzXM0HkJCkmbEkHoc5mEOXYZ6JtDgnDbMmXMzfhVsY3IYb2w6tm05laD/UUnHqY
 ey+uc2iYLlaLWEKpZPh7ebxt98xfkrE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-IpPhHSihNhqCrmzYcpokDg-1; Thu, 19 Nov 2020 03:44:56 -0500
X-MC-Unique: IpPhHSihNhqCrmzYcpokDg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6562018A226E
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 08:44:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BEF15D6A8;
 Thu, 19 Nov 2020 08:44:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1E7D2A1FB; Thu, 19 Nov 2020 09:44:48 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] meson: move up hw subdir (specifically before trace
 subdir)
Date: Thu, 19 Nov 2020 09:44:46 +0100
Message-Id: <20201119084448.24397-3-kraxel@redhat.com>
In-Reply-To: <20201119084448.24397-1-kraxel@redhat.com>
References: <20201119084448.24397-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 03:44:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Needed so trace/meson.build can see
stuff done in hw/*/meson.build.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 04bd9b57e401..41009b9685de 100644
--- a/meson.build
+++ b/meson.build
@@ -1456,6 +1456,8 @@ trace_events_subdirs += [
   'util',
 ]
 
+subdir('hw')
+
 subdir('contrib/libvhost-user')
 subdir('qapi')
 subdir('qobject')
@@ -1543,7 +1545,6 @@ subdir('migration')
 subdir('monitor')
 subdir('net')
 subdir('replay')
-subdir('hw')
 subdir('accel')
 subdir('plugins')
 subdir('bsd-user')
-- 
2.27.0


