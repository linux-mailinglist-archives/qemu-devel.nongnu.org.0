Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9791743F7E1
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:34:45 +0200 (CEST)
Received: from localhost ([::1]:39142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgMPU-000577-Of
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:34:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mgM5F-000447-0k
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:13:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mgM5A-0008Fi-G4
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635491622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8HasuJ4HfxmPsksgIPEaXEK4hrL5A3Um1PmEB34c5+c=;
 b=fvPxRA8Ar7N6/+QUMchJ8MYXUwpyZ+qSLtb8R/FpsGccNMtZKZrRRxAckGwy1HzfPVCb4h
 hJjBj4nM7vKkunLJnF9cD6XbISd081I2YFfLfxL9ItCpYvGQJP/YeHX171aTKVuiQ0K9iE
 zd+/KHdae5lcyTXa+m5sQlWOHDTnFEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-JqKEPNdNMISKscCJMBpHvA-1; Fri, 29 Oct 2021 03:13:21 -0400
X-MC-Unique: JqKEPNdNMISKscCJMBpHvA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82ED110A8E09
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 07:13:20 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E03541017CE3;
 Fri, 29 Oct 2021 07:13:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] meson.build: Allow to disable OSS again
Date: Fri, 29 Oct 2021 09:13:18 +0200
Message-Id: <20211029071318.1780098-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If sys/soundcard.h is available, it is currently not possible to
disable OSS with the --disable-oss or --without-default-features
configure switches. Improve the check in meson.build to fix this.

Fixes: 87430d5b13 ("configure, meson: move audio driver detection to Meson")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index ed92454cab..0d7917db6a 100644
--- a/meson.build
+++ b/meson.build
@@ -915,7 +915,7 @@ if liblzfse.found() and not cc.links('''
 endif
 
 oss = not_found
-if not get_option('oss').auto() or have_system
+if get_option('oss').enabled() or (get_option('oss').auto() and have_system)
   if not cc.has_header('sys/soundcard.h')
     # not found
   elif targetos == 'netbsd'
-- 
2.27.0


