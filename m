Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F6230C689
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:52:55 +0100 (CET)
Received: from localhost ([::1]:51226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yv8-0007ax-Ip
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6yYD-00058k-MC
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:29:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6yY8-0000DS-8K
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:29:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612283347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x+Io9i83GPm6P+bB5eHK+MVUhvNuLf4Qi0NXyUQtYnw=;
 b=CJQjQ6fqGAeafkVIPKU4QaiSqkfuo+mzMIyXDODASFUcq3dAbR4rChLLZRYS8ulOvb4wPl
 HYUaEGrH7G21LolwkQzX+EwHeFt3br6goAKqcZcEdoJ7fcnNj4Qt5EqgnFhBLpNwlkwLKV
 I6SLqo0UaECj1eSXLCUCorcKEKzTcLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-h45aB3qsNlWw0FZ0gyochQ-1; Tue, 02 Feb 2021 11:29:03 -0500
X-MC-Unique: h45aB3qsNlWw0FZ0gyochQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0677D80DDF8;
 Tue,  2 Feb 2021 16:29:02 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41E915D749;
 Tue,  2 Feb 2021 16:28:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v2 04/10] iotests/297: pylint: ignore too many statements
Date: Tue,  2 Feb 2021 17:28:28 +0100
Message-Id: <20210202162834.269789-5-kwolf@redhat.com>
In-Reply-To: <20210202162834.269789-1-kwolf@redhat.com>
References: <20210202162834.269789-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Ignore two complains, which now lead to 297 failure on testenv.py and
testrunner.py.

Fixes: 2e5a2f57db481f18fcf70be2a36b1417370b8476
Fixes: d74c754c924ca34e90b7c96ce2f5609d82c0e628
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210129161323.615027-1-vsementsov@virtuozzo.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/pylintrc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/pylintrc b/tests/qemu-iotests/pylintrc
index cd3702e23c..7a6c0a9474 100644
--- a/tests/qemu-iotests/pylintrc
+++ b/tests/qemu-iotests/pylintrc
@@ -21,6 +21,8 @@ disable=invalid-name,
         unsubscriptable-object,
         # These are temporary, and should be removed:
         missing-docstring,
+        too-many-return-statements,
+        too-many-statements
 
 [FORMAT]
 
-- 
2.29.2


