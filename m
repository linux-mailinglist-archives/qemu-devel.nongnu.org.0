Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1472040CB3C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 18:51:21 +0200 (CEST)
Received: from localhost ([::1]:54528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQY80-00040d-21
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 12:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXov-0004yq-16
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:31:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXos-0005Bi-AK
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:31:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631723493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wA1pGxD8zzaLC6+vTQoShsEIJELv6YaHT1FfhoujbyM=;
 b=VF9Fko8X075vl1gX59BIzeVm35caP6PTtnjBLnOKz83k2NMWMxX1vG8UNmDGDqrbWk+uuO
 kGJt7/PjAky41oyEOossEC/TVAp1NwL1xcFOxHhZowBqpKZEviXgi5TW5KjoPoKJIKZcK/
 TSzJfUmcGekBqBICUrP+kmJpswzCPOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-s6uxhIUKMXCrnkvYazCXaQ-1; Wed, 15 Sep 2021 12:31:32 -0400
X-MC-Unique: s6uxhIUKMXCrnkvYazCXaQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E11FD801B3D;
 Wed, 15 Sep 2021 16:31:31 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 905107771A;
 Wed, 15 Sep 2021 16:31:30 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/27] python/pylint: disable too-many-function-args
Date: Wed, 15 Sep 2021 12:29:44 -0400
Message-Id: <20210915162955.333025-17-jsnow@redhat.com>
In-Reply-To: <20210915162955.333025-1-jsnow@redhat.com>
References: <20210915162955.333025-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

too-many-function-args seems prone to failure when considering
things like Method Resolution Order, which mypy gets correct. When
dealing with multiple inheritance, pylint doesn't seem to understand
which method will actually get called, while mypy does.

Remove the less powerful, redundant check.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/setup.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/python/setup.cfg b/python/setup.cfg
index e8f3261691..5af35d0aa3 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -88,7 +88,7 @@ ignore_missing_imports = True
 # --enable=similarities". If you want to run only the classes checker, but have
 # no Warning level messages displayed, use "--disable=all --enable=classes
 # --disable=W".
-disable=
+disable=too-many-function-args,  # mypy handles this with less false positives.
 
 [pylint.basic]
 # Good variable names which should always be accepted, separated by a comma.
-- 
2.31.1


