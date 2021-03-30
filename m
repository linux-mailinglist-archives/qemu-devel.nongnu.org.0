Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303DF34E7E3
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:50:58 +0200 (CEST)
Received: from localhost ([::1]:36134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDph-0001Kt-7D
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRDfV-0000uT-Vl
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:40:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRDfM-0003Mx-CA
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617108007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AwDR5O/JZykM9n2lyE5mqiz6JuRnNahP5Rc4teXnJdE=;
 b=cZBfYY1qeB7K3gGXdVBsr/surEPTy7Deg4U9/fkt2IVS0nMY9KXaeou39ld+dIinal0Rij
 7FOViiArGOf7yEPew3avDqdPRIpn8CddTMGo7S8pbMcDvXUOiisx2mpp7P/XLY66V8PZdS
 NfoSRnIyVbIFR0QGA5s7HkHk8uL6uNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-AYkgjKrGOIaETUUet87AHw-1; Tue, 30 Mar 2021 08:40:05 -0400
X-MC-Unique: AYkgjKrGOIaETUUet87AHw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02BBE1B18BC3;
 Tue, 30 Mar 2021 12:40:04 +0000 (UTC)
Received: from localhost (ovpn-113-220.ams2.redhat.com [10.36.113.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A3B45C1D1;
 Tue, 30 Mar 2021 12:40:03 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 2/9] iotests: fix 051.out expected output after error text
 touchups
Date: Tue, 30 Mar 2021 14:39:50 +0200
Message-Id: <20210330123957.826170-3-mreitz@redhat.com>
In-Reply-To: <20210330123957.826170-1-mreitz@redhat.com>
References: <20210330123957.826170-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Connor Kuehl <ckuehl@redhat.com>

A patch was recently applied that touched up some error messages that
pertained to key names like 'node-name'. The trouble is it only updated
tests/qemu-iotests/051.pc.out and not tests/qemu-iotests/051.out as
well.

Do that now.

Fixes: 785ec4b1b9 ("block: Clarify error messages pertaining to
'node-name'")
Signed-off-by: Connor Kuehl <ckuehl@redhat.com>
Message-Id: <20210318200949.1387703-2-ckuehl@redhat.com>
Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/051.out | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/051.out b/tests/qemu-iotests/051.out
index 437053c839..441f83e41a 100644
--- a/tests/qemu-iotests/051.out
+++ b/tests/qemu-iotests/051.out
@@ -61,13 +61,13 @@ QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) quit
 
 Testing: -drive file=TEST_DIR/t.qcow2,node-name=123foo
-QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=123foo: Invalid node name
+QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=123foo: Invalid node-name: '123foo'
 
 Testing: -drive file=TEST_DIR/t.qcow2,node-name=_foo
-QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=_foo: Invalid node name
+QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=_foo: Invalid node-name: '_foo'
 
 Testing: -drive file=TEST_DIR/t.qcow2,node-name=foo#12
-QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=foo#12: Invalid node name
+QEMU_PROG: -drive file=TEST_DIR/t.qcow2,node-name=foo#12: Invalid node-name: 'foo#12'
 
 
 === Device without drive ===
-- 
2.29.2


