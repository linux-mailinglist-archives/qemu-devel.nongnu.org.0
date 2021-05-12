Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F151737D4F5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 23:48:51 +0200 (CEST)
Received: from localhost ([::1]:59360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgwip-0003S9-1I
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 17:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwgu-0000ky-SW
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:46:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwgs-0007eA-5v
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620856009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j8nl0jcQO0S+XN6BD6lJAQ64y3jRqRoyQhzvjh6JnPs=;
 b=gfo/ddSdZyibhoIVRpvzZLAw9osjMdFLhnHOBI02/YgpMZtjgAYpQ0dSsO4UC72jYKdwiW
 y6vWXRmPqSM7VRhepbUbkQH6wnysR2P+l7SoKvSp7ffsfYQNyWIiYnkMmJhr4LKe4cSK3K
 md6VAOl0li33bu2EUNIaSgPFo+ve+iQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-BNDC15DqMxifDqkeiXa0mg-1; Wed, 12 May 2021 17:46:47 -0400
X-MC-Unique: BNDC15DqMxifDqkeiXa0mg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADAD2FC9B;
 Wed, 12 May 2021 21:46:46 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FB715D6AC;
 Wed, 12 May 2021 21:46:45 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/10] python/console_socket: avoid one-letter variable
Date: Wed, 12 May 2021 17:46:33 -0400
Message-Id: <20210512214642.2803189-2-jsnow@redhat.com>
In-Reply-To: <20210512214642.2803189-1-jsnow@redhat.com>
References: <20210512214642.2803189-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes pylint warnings.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 python/qemu/console_socket.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/python/qemu/console_socket.py b/python/qemu/console_socket.py
index ac21130e446..87237bebef7 100644
--- a/python/qemu/console_socket.py
+++ b/python/qemu/console_socket.py
@@ -46,11 +46,11 @@ def __init__(self, address: str, file: Optional[str] = None,
             self._drain_thread = self._thread_start()
 
     def __repr__(self) -> str:
-        s = super().__repr__()
-        s = s.rstrip(">")
-        s = "%s,  logfile=%s, drain_thread=%s>" % (s, self._logfile,
-                                                   self._drain_thread)
-        return s
+        tmp = super().__repr__()
+        tmp = tmp.rstrip(">")
+        tmp = "%s,  logfile=%s, drain_thread=%s>" % (tmp, self._logfile,
+                                                     self._drain_thread)
+        return tmp
 
     def _drain_fn(self) -> None:
         """Drains the socket and runs while the socket is open."""
-- 
2.30.2


