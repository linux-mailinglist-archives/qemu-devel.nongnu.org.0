Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CCB351515
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:22:35 +0200 (CEST)
Received: from localhost ([::1]:33614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxHO-0003lR-N9
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx80-0002Dw-GV
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7y-0004Xf-TX
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617282769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJVoZDEu0mOF1Bz8VqNtK9s70wy3KsmhgCzkJS3gMGQ=;
 b=GF6yz853EhVadSKmvSKY7/b+FG1CwNU3afCSOfsG2DMCuOjXC/tifJqTqj1NPPMlc2mZfy
 jACnQGV6uvSSjd5Bg0/sZzMeMTBAueTTd8RM0qABPJpJ404SBU3alPeZiMpcEToo4v4AL/
 EifXuWZkXTzLDRXCCV5qMDd4CFU27Ao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-DQmrdhS4N4i2tmRGeIIhLw-1; Thu, 01 Apr 2021 09:12:47 -0400
X-MC-Unique: DQmrdhS4N4i2tmRGeIIhLw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F815A40CA;
 Thu,  1 Apr 2021 13:12:47 +0000 (UTC)
Received: from thuth.com (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0479C2AC82;
 Thu,  1 Apr 2021 13:12:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 12/13] docs: Fix typo in the default name of the
 qemu-system-x86_64 binary
Date: Thu,  1 Apr 2021 15:12:19 +0200
Message-Id: <20210401131220.3252320-13-thuth@redhat.com>
In-Reply-To: <20210401131220.3252320-1-thuth@redhat.com>
References: <20210401131220.3252320-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's a '-' between 'qemu' and 'system', not a '_'.

Fixes: 324b2298fe ("docs/system: convert Texinfo documentation to rST")
Message-Id: <20210401051829.3169438-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/defs.rst.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/defs.rst.inc b/docs/defs.rst.inc
index 48d05aaf33..52d6454b93 100644
--- a/docs/defs.rst.inc
+++ b/docs/defs.rst.inc
@@ -10,6 +10,6 @@
    incorrectly in boldface.
 
 .. |qemu_system| replace:: qemu-system-x86_64
-.. |qemu_system_x86| replace:: qemu_system-x86_64
+.. |qemu_system_x86| replace:: qemu-system-x86_64
 .. |I2C| replace:: I\ :sup:`2`\ C
 .. |I2S| replace:: I\ :sup:`2`\ S
-- 
2.27.0


