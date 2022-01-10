Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BEB48A3AB
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:31:36 +0100 (CET)
Received: from localhost ([::1]:42078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n748V-000249-7v
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:31:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n746Q-0008CC-Ig
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:29:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n746P-00087e-2P
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:29:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ufRxEqfN4BYABDdDAy7M/noltxaTvFSmR+E+X0sJiek=;
 b=CRHF0sUXFn/btiBVxyk7C8HH/xpEq2uJlVtOykxrZsyUigxmai3lq+P2kjyMYff2aCigVi
 4vhlbXrZLGlLkYWWubzPFBw7ffheYZfcXDtjnFFN2vJWKVtDjY4mV58e0ltkl9wpNgHHsQ
 iY8JNDNLvFKHjCmlXwobVEws1PuBTpg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-wXYYAMxiNgWXDmB9GjWlGQ-1; Mon, 10 Jan 2022 18:29:22 -0500
X-MC-Unique: wXYYAMxiNgWXDmB9GjWlGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91478E768;
 Mon, 10 Jan 2022 23:29:21 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFE9C7B022;
 Mon, 10 Jan 2022 23:29:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/31] python/aqmp: use absolute import statement
Date: Mon, 10 Jan 2022 18:28:40 -0500
Message-Id: <20220110232910.1923864-2-jsnow@redhat.com>
In-Reply-To: <20220110232910.1923864-1-jsnow@redhat.com>
References: <20220110232910.1923864-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

pylint's dependency astroid appears to have bugs in 2.9.1 and 2.9.2 (Dec
31 and Jan 3) that appear to erroneously expect the qemu namespace to
have an __init__.py file. astroid 2.9.3 (Jan 9) avoids that problem, but
appears to not understand a relative import within a namespace package.

Update the relative import - it was worth changing anyway, because these
packages will eventually be packaged and distributed separately.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20220110191349.1841027-2-jsnow@redhat.com
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


