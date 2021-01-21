Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FE42FEACB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:57:37 +0100 (CET)
Received: from localhost ([::1]:57100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ZWq-0003uH-TZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:57:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2ZQK-0005WX-Up
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:50:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l2ZQB-0003Qk-3a
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:50:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611233440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VsKdlBVawZeBN4Si7KUfMK734ZvcDTkU+t32RrdklQI=;
 b=Nj/jL6Du9ydPLHT3bvaaIqEs2tOzY1luEdBeu9pGOZtgkjZoL4joiWF3urbGsWGDLiVI36
 uA+DX50nejqS2y4wepIp9dygz3dioVT76aptAb2NZKKfE6ElRyCGevCFnszJcgyO3z0mB9
 c+EOeiYt1hi57fnWDyJRGBsakPqY/Fk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1--zs5NjykN7urc-omKqx63Q-1; Thu, 21 Jan 2021 07:50:37 -0500
X-MC-Unique: -zs5NjykN7urc-omKqx63Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF8D2800D55
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 12:50:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 582E92CFD8;
 Thu, 21 Jan 2021 12:50:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D7F43180039E; Thu, 21 Jan 2021 13:50:28 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/8] meson: move up hw subdir (specifically before trace
 subdir)
Date: Thu, 21 Jan 2021 13:50:22 +0100
Message-Id: <20210121125028.3247190-3-kraxel@redhat.com>
In-Reply-To: <20210121125028.3247190-1-kraxel@redhat.com>
References: <20210121125028.3247190-1-kraxel@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Needed so trace/meson.build can see
stuff done in hw/*/meson.build.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 1f3d48b53a06..7462a50b4c36 100644
--- a/meson.build
+++ b/meson.build
@@ -1777,6 +1777,8 @@ if 'CONFIG_VHOST_USER' in config_host
   vhost_user = libvhost_user.get_variable('vhost_user_dep')
 endif
 
+subdir('hw')
+
 subdir('qapi')
 subdir('qobject')
 subdir('stubs')
@@ -1863,7 +1865,6 @@ subdir('migration')
 subdir('monitor')
 subdir('net')
 subdir('replay')
-subdir('hw')
 subdir('accel')
 subdir('plugins')
 subdir('bsd-user')
-- 
2.29.2


