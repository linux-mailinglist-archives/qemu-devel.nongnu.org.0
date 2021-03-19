Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765573419D5
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:23:38 +0100 (CET)
Received: from localhost ([::1]:42472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNCI5-0003uz-Hc
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lNC8z-0001p2-8O
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:14:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lNC8w-0000Wh-GZ
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 06:14:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616148849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CqMqGk0e/3h+GQjFr39PNPm7y8l8h6Y1BbFGYHxAhQk=;
 b=JJ6P25dZZrnV/XlGx4f7ChVzTXsa48epQ5ljPfq01YBmHsMR6ffoHoSPionCFXoeZMz6b9
 POPf9bcuDrfFKAYwcyabez1ETNJGVaTvaMkRAkZdY3N6BZZsZbC+5ShZKPIpTsJePjq574
 xn21nrZjx2KOwIExMEys3VXDyJePXkk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-U1PEoZjvOvKPfFIkD9jVHw-1; Fri, 19 Mar 2021 06:14:06 -0400
X-MC-Unique: U1PEoZjvOvKPfFIkD9jVHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A99D910866A8;
 Fri, 19 Mar 2021 10:14:05 +0000 (UTC)
Received: from thuth.com (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F32A60CCB;
 Fri, 19 Mar 2021 10:14:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 2/2] cirrus.yml: Update the FreeBSD task to version 12.2
Date: Fri, 19 Mar 2021 11:14:02 +0100
Message-Id: <20210319101402.48871-1-thuth@redhat.com>
In-Reply-To: <87blbhd9ti.fsf@linaro.org>
References: <87blbhd9ti.fsf@linaro.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FreeBSD version 12.1 is out of service now, and the task in the
Cirrus-CI is failing. Update to 12.2 to get it working again.
Unfortunately, there is a bug in libtasn1 that triggers with the
new version of Clang that is used there (see this thread for details:
https://lists.gnu.org/archive/html/qemu-devel/2021-02/msg00739.html ),
so we have to disable gnutls for now to make it work again. We can
enable it later again once libtasn1 has been fixed in FreeBSD.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Added a TODO comment so that we remember to enable gnutls later again

 .cirrus.yml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index bc40a0550d..f53c519447 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -3,7 +3,7 @@ env:
 
 freebsd_12_task:
   freebsd_instance:
-    image_family: freebsd-12-1
+    image_family: freebsd-12-2
     cpu: 8
     memory: 8G
   install_script:
@@ -13,7 +13,10 @@ freebsd_12_task:
   script:
     - mkdir build
     - cd build
-    - ../configure --enable-werror || { cat config.log meson-logs/meson-log.txt; exit 1; }
+    # TODO: Enable gnutls again once FreeBSD's libtasn1 got fixed
+    # See: https://gitlab.com/gnutls/libtasn1/-/merge_requests/71
+    - ../configure --enable-werror --disable-gnutls
+      || { cat config.log meson-logs/meson-log.txt; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
     - gmake -j$(sysctl -n hw.ncpu) check V=1
 
-- 
2.27.0


