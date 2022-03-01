Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D5F4C954E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:59:27 +0100 (CET)
Received: from localhost ([::1]:51668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8eb-0001Rb-CW
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:59:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nP8a7-0006zK-NE
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:54:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nP8a3-0006Us-JO
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:54:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646164480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bZcWr8XihpBFMzPBxFKduDnAtqN5CRTrJOWdeIqiSiw=;
 b=h97rfK04kdFhjKhNFXvRDP+VlAiGKv1K6xIks+E1rrcD/8HkYlAMYEZs7DHC5TWk3UIjxm
 e4Xjp8n7rPEA6BvLXuPQT9BCqund6tfusBZfpkyeYlBcvV91jvXl0Jj4YzV9+SRqdvw9i8
 ZqKv0I3CJtUEPof3tHcfBmp6IY5V9iU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-aMUNscayOhqCqEiDKfCamQ-1; Tue, 01 Mar 2022 14:54:39 -0500
X-MC-Unique: aMUNscayOhqCqEiDKfCamQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E59391854E26;
 Tue,  1 Mar 2022 19:54:38 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.192.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E76C60CC9;
 Tue,  1 Mar 2022 19:54:37 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, thuth@redhat.com, kraxel@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, libvir-list@redhat.com
Subject: [PATCH] deprecation: x86 default machine types
Date: Tue,  1 Mar 2022 19:54:32 +0000
Message-Id: <20220301195432.114252-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Declare the intent to require a machine type to be specified on x86
system emulation.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 docs/about/deprecated.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 85773db631..143c60d105 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -324,6 +324,14 @@ machine is hardly emulated at all (e.g. neither the LCD nor the USB part had
 been implemented), so there is not much value added by this board. Use the
 ``ref405ep`` machine instead.
 
+x86 default machine type
+''''''''''''''''''''''''
+
+x86 currently defaults to the ```pc``` machine type which is based on the very
+old ```i440fx``` chipset.  This default will be removed and the user will be
+required to specify a machine type explicitly using -M; users are encouraged to
+switch to the not quite as old ```q35``` machine types.
+
 Backend options
 ---------------
 
-- 
2.35.1


