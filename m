Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DA12C2C54
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 17:09:36 +0100 (CET)
Received: from localhost ([::1]:54670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khasp-00080T-Kt
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 11:09:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1khamg-00026O-Ou
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:03:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1khamc-0006e1-8j
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 11:03:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606233787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nuurhTmrp/qsnO2n3ArJ8tFOCVvXuHoTjKWIBvvKU/8=;
 b=h2XNrGKNSeSaK/Zwv0nMsXwkP9X/UeJMAsKIlIWlvf20WPe0L/yWql19kgIhtO74JuO/DR
 XhDkAYbbpcnqalU01SIWufiDDKVj4eqb2P+cWV8K8htvv6Ea6uKTrP50jT7H8/L74qaCk2
 P3lkVajuIKfVnWX7sNfI9k5+18ToMd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-JFwuiEsWN6SeU8ga1w2ZOw-1; Tue, 24 Nov 2020 11:03:04 -0500
X-MC-Unique: JFwuiEsWN6SeU8ga1w2ZOw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B1521012E89
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 16:03:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58ED65B4A0;
 Tue, 24 Nov 2020 16:02:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 65153A1E2; Tue, 24 Nov 2020 17:02:55 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] meson: move up hw subdir (specifically before trace
 subdir)
Date: Tue, 24 Nov 2020 17:02:53 +0100
Message-Id: <20201124160255.28111-3-kraxel@redhat.com>
In-Reply-To: <20201124160255.28111-1-kraxel@redhat.com>
References: <20201124160255.28111-1-kraxel@redhat.com>
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
index b62f71c6b4f1..a85d331668fa 100644
--- a/meson.build
+++ b/meson.build
@@ -1477,6 +1477,8 @@ trace_events_subdirs += [
   'util',
 ]
 
+subdir('hw')
+
 subdir('contrib/libvhost-user')
 subdir('qapi')
 subdir('qobject')
@@ -1564,7 +1566,6 @@ subdir('migration')
 subdir('monitor')
 subdir('net')
 subdir('replay')
-subdir('hw')
 subdir('accel')
 subdir('plugins')
 subdir('bsd-user')
-- 
2.27.0


