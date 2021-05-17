Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD58383D74
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 21:31:48 +0200 (CEST)
Received: from localhost ([::1]:48932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liixv-0005H4-49
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 15:31:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liiHz-0001MY-SU
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:48:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1liiHs-0006wj-Qd
 for qemu-devel@nongnu.org; Mon, 17 May 2021 14:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621277300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uBvBDPav6xvmQm82GofvgIrCGu6g8/LKkdDHgtH1lZ8=;
 b=VZOolZhC0iDet/Aznp9KxjLbKwdyBrWj2+pnVzPI8oK1d863Mq/o6m+cbcVgXuS8SKvwlU
 VyaYRAh0Sz+qLSDxeycNChJwFvWWPAytKUMgC/bkZG91UY6zhDMf+u9Zt1tfnhiI5PauMZ
 j3HQi1/kZIO4CmJmEBw42Os0K6xEQ08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-_Q_RtSHLMRy31bta7TOH7w-1; Mon, 17 May 2021 14:48:18 -0400
X-MC-Unique: _Q_RtSHLMRy31bta7TOH7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 850E980006E
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 18:48:17 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78E4B19C46;
 Mon, 17 May 2021 18:48:16 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] python/console_socket: Add a pylint ignore
Date: Mon, 17 May 2021 14:48:06 -0400
Message-Id: <20210517184808.3562549-5-jsnow@redhat.com>
In-Reply-To: <20210517184808.3562549-1-jsnow@redhat.com>
References: <20210517184808.3562549-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
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


