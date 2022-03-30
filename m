Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF124ECC41
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:28:37 +0200 (CEST)
Received: from localhost ([::1]:55128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZd3c-0000rj-4Z
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:28:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZczg-0006Sa-H5
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:24:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZczc-0005EC-VH
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648664668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8y1Bebhw+jZ69bbkLaEFywaRbwjLfw/YDC581xoqtPU=;
 b=VLhZ9vGm2f9XOBzZDLdo54wxsuxdzugeVGi6H3EY517HLFUVFk9UXrKOTO4hsZYzy169+x
 uPTliRWjoHpRKU4F5Dkni0SAoLTVWv+FHO1BX85gAoCLMsqODaV6qVqgcOsjNZLY/wdDgH
 vCVVX3AA+Wgy1vXWoDP3dvzk9fL8fWo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-YuoFffTHNxC91ed9T7MANg-1; Wed, 30 Mar 2022 14:24:25 -0400
X-MC-Unique: YuoFffTHNxC91ed9T7MANg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F56E1010366
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 18:24:25 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.35.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E18752166B4C;
 Wed, 30 Mar 2022 18:24:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu.qmp PATCH 01/13] pylint hotfix
Date: Wed, 30 Mar 2022 14:24:12 -0400
Message-Id: <20220330182424.3438872-2-jsnow@redhat.com>
In-Reply-To: <20220330182424.3438872-1-jsnow@redhat.com>
References: <20220330182424.3438872-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pylint released a new version and it broke tests. I've folded this patch
into patches pending for qemu.git, but for my own sanity, I'm not going
to rebase this series yet because it's... annoying to rebase a
git-filter-branch fork. I'll get it next time, sorry.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qemu/qmp/legacy.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/qemu/qmp/legacy.py b/qemu/qmp/legacy.py
index a8629b4..03b5574 100644
--- a/qemu/qmp/legacy.py
+++ b/qemu/qmp/legacy.py
@@ -106,8 +106,6 @@ class QEMUMonitorProtocol:
         return self
 
     def __exit__(self,
-                 # pylint: disable=duplicate-code
-                 # see https://github.com/PyCQA/pylint/issues/3619
                  exc_type: Optional[Type[BaseException]],
                  exc_val: Optional[BaseException],
                  exc_tb: Optional[TracebackType]) -> None:
-- 
2.34.1


