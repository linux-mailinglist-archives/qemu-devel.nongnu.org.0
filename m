Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654F921AEB4
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 07:29:53 +0200 (CEST)
Received: from localhost ([::1]:42606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtlbc-0005Ib-GK
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 01:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jtlUi-0007rU-Ve
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 01:22:44 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:22823
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jtlUh-0008GI-BY
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 01:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594358562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aw+4u07sLBxkyTq5k1epb1ejZH5/G/p+Hitk0UEMZ10=;
 b=V84JFYXNmXm7VcKYjDxKV09WaNXQOkDdjAfTDHvnUwH13Duqy/CkkqSb8GnBcAvFzFjvxT
 LLfQ51CNQihTqV2LFcZV5K4I2OAIZPrmH09Xc3gsgu9Pc5Q0n7w9vhlH+mMxncJeH6yGm6
 6DU6y3swQpGRfE0YduER8URPLEVjrfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-bQ_k2b3eMaqa7M25hmtFtg-1; Fri, 10 Jul 2020 01:22:41 -0400
X-MC-Unique: bQ_k2b3eMaqa7M25hmtFtg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EECB1009441;
 Fri, 10 Jul 2020 05:22:40 +0000 (UTC)
Received: from probe.redhat.com (ovpn-118-196.rdu2.redhat.com [10.10.118.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AF1A920C2;
 Fri, 10 Jul 2020 05:22:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 15/16] iotests.py: Adjust HMP kwargs typing
Date: Fri, 10 Jul 2020 01:22:19 -0400
Message-Id: <20200710052220.3306-16-jsnow@redhat.com>
In-Reply-To: <20200710052220.3306-1-jsnow@redhat.com>
References: <20200710052220.3306-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 22:08:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mypy wants to ensure there's consistency between the kwargs arguments
types and any unspecified keyword arguments. In this case, conv_keys is
a bool, but the remaining keys are Any type. Mypy (correctly) infers the
**kwargs type to be **Dict[str, str], which is not compatible with
conv_keys: bool.

Because QMP typing is a little fraught right now anyway, re-type kwargs
to Dict[str, Any] which has the benefit of silencing this check right
now.

A future re-design might type these more aggressively, but this will
give us a baseline to work from with minimal disruption.

(Thanks Kevin Wolf for the debugging assist here)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/iotests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 4457786f09..d5cde7c0da 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -553,7 +553,7 @@ def add_incoming(self, addr):
 
     def hmp(self, command_line: str, use_log: bool = False) -> QMPMessage:
         cmd = 'human-monitor-command'
-        kwargs = {'command-line': command_line}
+        kwargs: Dict[str, Any] = {'command-line': command_line}
         if use_log:
             return self.qmp_log(cmd, **kwargs)
         else:
-- 
2.21.3


