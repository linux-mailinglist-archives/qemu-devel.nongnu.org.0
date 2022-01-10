Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F4148A018
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:26:43 +0100 (CET)
Received: from localhost ([::1]:56546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n70JW-00062E-05
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:26:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n707M-0003bS-2q
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:14:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n707J-0004K3-7z
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:14:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641842039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R3DOD+6A818wXSNBjhzU9R78xumTHf3z2M82tyexEWs=;
 b=NalsfC5iVAq0LkH//RYLwO53GwFuMuLkdjrO4wMpKwJiihJ+AW1RGPxVJGc8gRmw0ZX6WO
 WQLOqhwjvFwhQyBZyZxT4HpiLAKsZvl79KQ8yzwcDBHsXEz0bTzrhkWifZDFXNliUt026z
 V54pxltO/ZEBNmi01I506TSOtayrqcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-ZdeE_pvXM3yWrx3OHlLtgA-1; Mon, 10 Jan 2022 14:13:56 -0500
X-MC-Unique: ZdeE_pvXM3yWrx3OHlLtgA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C29F681EE60;
 Mon, 10 Jan 2022 19:13:54 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EB2119D9B;
 Mon, 10 Jan 2022 19:13:53 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] python/aqmp: use absolute import statement
Date: Mon, 10 Jan 2022 14:13:47 -0500
Message-Id: <20220110191349.1841027-2-jsnow@redhat.com>
In-Reply-To: <20220110191349.1841027-1-jsnow@redhat.com>
References: <20220110191349.1841027-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pylint's dependency astroid appears to have bugs in 2.9.1 and 2.9.2 (Dec
31 and Jan 3) that appear to erroneously expect the qemu namespace to
have an __init__.py file. astroid 2.9.3 (Jan 9) avoids that problem, but
appears to not understand a relative import within a namespace package.

Update the relative import - it was worth changing anyway, because these
packages will eventually be packaged and distributed separately.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/aqmp_tui.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
index a2929f771c..f1e926dd75 100644
--- a/python/qemu/aqmp/aqmp_tui.py
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -35,7 +35,8 @@
 import urwid
 import urwid_readline
 
-from ..qmp import QEMUMonitorProtocol, QMPBadPortError
+from qemu.qmp import QEMUMonitorProtocol, QMPBadPortError
+
 from .error import ProtocolError
 from .message import DeserializationError, Message, UnexpectedTypeError
 from .protocol import ConnectError, Runstate
-- 
2.31.1


