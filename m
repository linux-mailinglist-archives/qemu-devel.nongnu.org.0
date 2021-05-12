Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A352C37D4F6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 23:48:52 +0200 (CEST)
Received: from localhost ([::1]:59458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgwip-0003WQ-Na
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 17:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwgz-0000nr-Ql
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:46:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgwgv-0007ge-4m
 for qemu-devel@nongnu.org; Wed, 12 May 2021 17:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620856012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBvBDPav6xvmQm82GofvgIrCGu6g8/LKkdDHgtH1lZ8=;
 b=LhxYkthbm6qccY2FNwpbnmiLD1U5d4SlWVpYV4N/NhHNbG5fvxLbH9WrKW4+0JiJXdx7Ur
 k67Kjie3d61PAdqvwE5/qbUUFOdHv+uFWkUkXrmSaqQAI4P/pOil8STPwaVMLivQ75u4OM
 xz6r8hAyaNCEuOuodRWo+LI+KbBvt0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-fjxI_zlvNLu5WQuxp95gBw-1; Wed, 12 May 2021 17:46:50 -0400
X-MC-Unique: fjxI_zlvNLu5WQuxp95gBw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F33548015F7;
 Wed, 12 May 2021 21:46:49 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DC4B5D6AC;
 Wed, 12 May 2021 21:46:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/10] python/console_socket: Add a pylint ignore
Date: Wed, 12 May 2021 17:46:36 -0400
Message-Id: <20210512214642.2803189-5-jsnow@redhat.com>
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

We manage cleaning up this resource ourselves. Pylint should shush.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/console_socket.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/python/qemu/console_socket.py b/python/qemu/console_socket.py
index 87237bebef7..8c4ff598ad7 100644
--- a/python/qemu/console_socket.py
+++ b/python/qemu/console_socket.py
@@ -39,6 +39,7 @@ def __init__(self, address: str, file: Optional[str] = None,
         self.connect(address)
         self._logfile = None
         if file:
+            # pylint: disable=consider-using-with
             self._logfile = open(file, "bw")
         self._open = True
         self._drain_thread = None
-- 
2.30.2


