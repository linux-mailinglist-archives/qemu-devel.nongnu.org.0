Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE065F7776
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 13:33:29 +0200 (CEST)
Received: from localhost ([::1]:40384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oglbc-00064Y-77
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 07:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktz-0005QH-Pz
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkty-0003AT-77
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q5ovy9QylmpGx/UXJlu9Ds7mgbe7YegFqU4ze0cE1iw=;
 b=DdOq+PBznPodT11kUk14HVwPNgvqs+Ob2b6rEQJEBwTD7IUCVfbbuXSDMQM/7KaHM1iJdM
 OwzQSR+S40hZ4zwypib6VSwYwZEMhiXLSNxe4N3mpWrTP5y3l54nhBE4wMF6URK7/crOwn
 69+F3q1J8nBVZvDKZ27EMBeuVZM4hZQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-bmrYGjpwP7WSwyhE8bqM-Q-1; Fri, 07 Oct 2022 06:48:18 -0400
X-MC-Unique: bmrYGjpwP7WSwyhE8bqM-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55DF32A59555;
 Fri,  7 Oct 2022 10:48:18 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 959B22028DC1;
 Fri,  7 Oct 2022 10:48:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 18/50] qed: add missing coroutine_fn annotations
Date: Fri,  7 Oct 2022 12:47:20 +0200
Message-Id: <20221007104752.141361-19-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220922084924.201610-18-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/qed.c b/block/qed.c
index 324ca0e95a..bda00e6257 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -254,7 +254,7 @@ static CachedL2Table *qed_new_l2_table(BDRVQEDState *s)
     return l2_table;
 }
 
-static bool qed_plug_allocating_write_reqs(BDRVQEDState *s)
+static bool coroutine_fn qed_plug_allocating_write_reqs(BDRVQEDState *s)
 {
     qemu_co_mutex_lock(&s->table_lock);
 
@@ -273,7 +273,7 @@ static bool qed_plug_allocating_write_reqs(BDRVQEDState *s)
     return true;
 }
 
-static void qed_unplug_allocating_write_reqs(BDRVQEDState *s)
+static void coroutine_fn qed_unplug_allocating_write_reqs(BDRVQEDState *s)
 {
     qemu_co_mutex_lock(&s->table_lock);
     assert(s->allocating_write_reqs_plugged);
-- 
2.37.3


