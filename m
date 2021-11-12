Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B56944E25C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 08:25:24 +0100 (CET)
Received: from localhost ([::1]:41372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlQw7-0003mZ-If
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 02:25:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mlQtI-0001e9-0c
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 02:22:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mlQtF-0002uD-Mp
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 02:22:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636701745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rO9rXAqJuxgLAKGROddNf3tM/oSSS2hl2p4R7Sk1F2c=;
 b=GI2836FNezNlP85W4IwYQJURozeDp8jqHRULzC5otOrh4FEVNGm5hK/jz1K/zfxTKJ9iDA
 KhY2DN9A9/+8GUrm529G0nHcWsoPx5EATQqXSx+QMpJm3slXKYHwMWvk7oE7ySOVQRGxTB
 FXYAfRhGQcUXgz9zUGkLW0Yqa/CR6Yg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-qmSKe1J-MOSJkbZ0BBYoDQ-1; Fri, 12 Nov 2021 02:22:23 -0500
X-MC-Unique: qmSKe1J-MOSJkbZ0BBYoDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21888102C84E
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 07:22:23 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5711C604CC;
 Fri, 12 Nov 2021 07:22:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] Revert "device-crash-test: Ignore errors about a bus not
 being available"
Date: Fri, 12 Nov 2021 08:22:20 +0100
Message-Id: <20211112072220.108580-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit ca89d15f8e42f2e5eac5bd200af38fdbfb32e875.

There is already an entry for this kind of messages earlier in the
ERROR_RULE_LIST - when I added this patch, I just got fooled by
the other errors that occur due to a race between QMP connection
and QEMU terminating early (which still spit out the 'No bus found'
messages in their backtrace), but these other problems have now
fortunately been tackled by John Snow, so we certainly don't need
this duplicated entry here anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/device-crash-test | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 3db0ffe5b8..1c73dac93e 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -176,7 +176,6 @@ ERROR_RULE_LIST = [
     {'log':r"Multiple VT220 operator consoles are not supported"},
     {'log':r"core 0 already populated"},
     {'log':r"could not find stage1 bootloader"},
-    {'log':r"No '.*' bus found for device"},
 
     # other exitcode=1 failures not listed above will just generate INFO messages:
     {'exitcode':1, 'loglevel':logging.INFO},
-- 
2.27.0


