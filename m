Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F417C2FD408
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:32:58 +0100 (CET)
Received: from localhost ([::1]:54026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FTe-0001Ug-2H
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2FFf-0000Lm-1y
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:18:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2FFW-0007kZ-2e
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:18:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611155901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Zabz53bkpxvAyuAye5doqdmzTSPe0X1Av7GxCoHmG0=;
 b=fQBenYvAr/DXDXPIwnk6a80GypuikP2r3eCIIMRziDVA+ykWyhBkHvVoK/wC336zEn4N/j
 /tg+l8NCw5xTcfsHHfYwuZ9d3A6WJsZdtQ+q9hNgoAZ6TUcvPQX9Ye+9j3uexUZR0Y8jg+
 hRzSNW7Hc9RhqsJMavwg23vmuqOYMrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-B9nSAuurOua51-xCln1E5Q-1; Wed, 20 Jan 2021 10:18:18 -0500
X-MC-Unique: B9nSAuurOua51-xCln1E5Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3481190A7A1;
 Wed, 20 Jan 2021 15:18:17 +0000 (UTC)
Received: from thuth.com (ovpn-114-135.ams2.redhat.com [10.36.114.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53C1960C6A;
 Wed, 20 Jan 2021 15:18:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 14/14] MAINTAINERS: Make status spellings consistent
Date: Wed, 20 Jan 2021 16:17:51 +0100
Message-Id: <20210120151751.520597-15-thuth@redhat.com>
In-Reply-To: <20210120151751.520597-1-thuth@redhat.com>
References: <20210120151751.520597-1-thuth@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201030153416.429791-3-jsnow@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 778b3da406..34359a99b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1142,7 +1142,7 @@ F: tests/acceptance/machine_mips_malta.py
 
 Mipssim
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
-S: Orphaned
+S: Orphan
 F: hw/mips/mipssim.c
 F: hw/net/mipsnet.c
 
@@ -2443,7 +2443,7 @@ T: git https://gitlab.com/jsnow/qemu.git python
 Python scripts
 M: Eduardo Habkost <ehabkost@redhat.com>
 M: Cleber Rosa <crosa@redhat.com>
-S: Odd fixes
+S: Odd Fixes
 F: scripts/*.py
 F: tests/*.py
 
@@ -2680,7 +2680,7 @@ F: tests/test-coroutine.c
 
 Buffers
 M: Daniel P. Berrange <berrange@redhat.com>
-S: Odd fixes
+S: Odd Fixes
 F: util/buffer.c
 F: include/qemu/buffer.h
 
@@ -2709,7 +2709,7 @@ F: qapi/sockets.json
 
 File monitor
 M: Daniel P. Berrange <berrange@redhat.com>
-S: Odd fixes
+S: Odd Fixes
 F: util/filemonitor*.c
 F: include/qemu/filemonitor.h
 F: tests/test-util-filemonitor.c
@@ -3263,7 +3263,7 @@ S: Odd Fixes
 F: scripts/git-submodule.sh
 
 UI translations
-S: Orphaned
+S: Orphan
 F: po/*.po
 
 Sphinx documentation configuration and build machinery
-- 
2.27.0


