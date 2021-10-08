Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3F34264AA
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 08:33:33 +0200 (CEST)
Received: from localhost ([::1]:47588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYjRk-0006j5-Mb
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 02:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYjNO-0004uY-RG
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 02:29:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYjNE-0007us-VD
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 02:29:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633674531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8z7PmuUSUbX+pSVX0kyium85dFA+rvfcmUkxh8ivRkE=;
 b=XTwpXJ4D5mSwS6HyrMyrFAsxzzUYxQ3SOjHKTOaPzdTSo/imy9HAseB8PQhrVBvbZsmJIR
 8MVCBRM7fFOzcqxwwBvA9ioEYWa7vAQDwIprAE1bZsdK82i0bzJvjISNv56IOeOcicwF3v
 rYkDcg4H2oHrK62l4yNOldkwkirdIY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-_bfkV15xO2CBqDPywhfIUA-1; Fri, 08 Oct 2021 02:28:50 -0400
X-MC-Unique: _bfkV15xO2CBqDPywhfIUA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08E48100C61A;
 Fri,  8 Oct 2021 06:28:50 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F1C35D9C6;
 Fri,  8 Oct 2021 06:28:49 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/2] qemu-iotests: fix image-fleecing pylint errors
Date: Fri,  8 Oct 2021 02:28:21 -0400
Message-Id: <20211008062821.1010967-3-eesposit@redhat.com>
In-Reply-To: <20211008062821.1010967-1-eesposit@redhat.com>
References: <20211008062821.1010967-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The problem here is that some variables are formatted with
unnecessary spaces to make it prettier and easier to read.

However, pylint complains about those additional spaces.
Temporarly remove the check, but just on those variables.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 tests/qemu-iotests/tests/image-fleecing | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/tests/image-fleecing b/tests/qemu-iotests/tests/image-fleecing
index 8c5472f421..99101fe902 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -30,6 +30,9 @@ iotests.script_initialize(
     supported_platforms=['linux'],
 )
 
+# Temporarly disable bad-whitespace pylint check to keep
+# this formatting.
+# pylint: disable=bad-whitespace
 patterns = [('0x5d', '0',         '64k'),
             ('0xd5', '1M',        '64k'),
             ('0xdc', '32M',       '64k'),
@@ -47,6 +50,7 @@ zeroes = [('0', '0x00f8000', '32k'), # Left-end of partial-left (1M-32K)
 remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
              ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
              ('0xcd', '0x3ff0000', '64k')] # patterns[3]
+# pylint: enable=bad-whitespace
 
 def do_test(use_cbw, base_img_path, fleece_img_path, nbd_sock_path, vm):
     log('--- Setting up images ---')
-- 
2.27.0


