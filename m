Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D850A5F598A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 20:08:39 +0200 (CEST)
Received: from localhost ([::1]:47746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og8ok-0000u2-Ol
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 14:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1og8ZH-0004dT-G9
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 13:52:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1og8ZE-0007pJ-K1
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 13:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664992343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3ICEkg+S7atfdcQPGc2/e0iElqa7euQxsVbHBuySkyA=;
 b=dHFihIubUSXwMRCTQcYB45eiKejJYo/3yI/3tKkXzEAU4zD2TMnxNYHvp3sJoPMD/E9Fwz
 QOmW1DOYavRVbPIB7hlHI8pScz1gauQDXftlegC732Jgxp0XBc7G+HJESvd2J+18GIjR3E
 eHKlvHXzMm3FGmHv4RYbDhlmRwhO56E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-Zd9l0wRPOTGjW0DdvB-nSw-1; Wed, 05 Oct 2022 13:52:21 -0400
X-MC-Unique: Zd9l0wRPOTGjW0DdvB-nSw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50229185A7B1
 for <qemu-devel@nongnu.org>; Wed,  5 Oct 2022 17:52:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F655492B11;
 Wed,  5 Oct 2022 17:52:19 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alberto Faria <afaria@redhat.com>
Subject: [PATCH] coroutine: Drop coroutine_fn annotation from
 qemu_coroutine_self()
Date: Wed,  5 Oct 2022 18:52:09 +0100
Message-Id: <20221005175209.975797-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu_coroutine_self() can be called from outside coroutine context,
returning the leader coroutine, and several such invocations currently
exist (mostly in qcow2 tracing calls).

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 include/qemu/coroutine.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index c61dd2d3f7..c77ccd80f5 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -122,7 +122,7 @@ AioContext *coroutine_fn qemu_coroutine_get_aio_context(Coroutine *co);
 /**
  * Get the currently executing coroutine
  */
-Coroutine *coroutine_fn qemu_coroutine_self(void);
+Coroutine *qemu_coroutine_self(void);
 
 /**
  * Return whether or not currently inside a coroutine
-- 
2.37.3


