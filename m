Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7449130C649
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:44:43 +0100 (CET)
Received: from localhost ([::1]:38142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ynC-00017c-GP
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6yYD-00058u-Tu
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:29:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6yY8-0000Dp-MW
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:29:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612283348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9qFHNOE+wMaVxXmCw7gv0O77gRUAN7x+2bg9GawzKbQ=;
 b=bKqlbjWJcehctxT5mRL4AAc0BfdMY6ndXb9fNa3xoK7TknfO4eY13X40NhwcQQ69z9/gIH
 IFAdZp2tb8N8/k3BsIfA9DnBoUQg/SCRCaI7jOdFqTzQa4xN0JRp8Bw/D0ZQz3dRHZpsb9
 tXU1YJBixK/FL1yfbn7kR7UJvJYP/HU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-bcGFp4AuOsSReHIqvtsmGA-1; Tue, 02 Feb 2021 11:29:06 -0500
X-MC-Unique: bcGFp4AuOsSReHIqvtsmGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 080941083E8F;
 Tue,  2 Feb 2021 16:29:05 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F1B57EA8A;
 Tue,  2 Feb 2021 16:29:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v2 05/10] iotests: Revert emulator selection to old behaviour
Date: Tue,  2 Feb 2021 17:28:29 +0100
Message-Id: <20210202162834.269789-6-kwolf@redhat.com>
In-Reply-To: <20210202162834.269789-1-kwolf@redhat.com>
References: <20210202162834.269789-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the qemu-system-{arch} binary for the host architecture can't be
found, the old 'check' implementation selected the alphabetically first
system emulator binary that it could find. The new Python implementation
just uses the first result of glob.iglob(), which has an undefined
order.

This is a problem that breaks CI because the iotests aren't actually
prepared to run on any emulator. They should be, so this is really a bug
in the failing test cases that should be fixed there, but as a quick
fix, let's revert to the old behaviour to let CI runs succeed again.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210202142802.119999-1-kwolf@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/testenv.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index b31275f518..1fbec854c1 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -135,7 +135,7 @@ class TestEnv(ContextManager['TestEnv']):
         if not os.path.exists(self.qemu_prog):
             pattern = root('qemu-system-*')
             try:
-                progs = glob.iglob(pattern)
+                progs = sorted(glob.iglob(pattern))
                 self.qemu_prog = next(p for p in progs if isxfile(p))
             except StopIteration:
                 sys.exit("Not found any Qemu executable binary by pattern "
-- 
2.29.2


