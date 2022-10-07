Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DDD5F772D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 13:09:31 +0200 (CEST)
Received: from localhost ([::1]:59876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oglEP-0002xa-Nz
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 07:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktu-0005Pa-I1
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogktq-00037A-Hu
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0lnpcvVks2bsy6qvNvZjYGGTISVVcqMyRRyF850AK9U=;
 b=HrXuHYFXqrzUUO2/8aNmGIi241flo5XX8czgW7esxdco/hNYI/rjzVaBN+Xo6GRBLzsK1b
 Ag1TpX+3IdvbJ4kZMNID1rhQN4CGnMuD2xnW6vRhzUtagjyhX3tDRjlwHSYVBxDuk8rCbs
 IRA02x+YX46d3iJtFozJtcNdwBcrXt4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-m06fXfdxM6-xa4bIu0VCHw-1; Fri, 07 Oct 2022 06:48:10 -0400
X-MC-Unique: m06fXfdxM6-xa4bIu0VCHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 838481C0515C;
 Fri,  7 Oct 2022 10:48:10 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C1F2F2024CBB;
 Fri,  7 Oct 2022 10:48:09 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 10/50] iscsi: add missing coroutine_fn annotations
Date: Fri,  7 Oct 2022 12:47:12 +0200
Message-Id: <20221007104752.141361-11-kwolf@redhat.com>
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
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220922084924.201610-10-pbonzini@redhat.com>
[kwolf: Fixed up coding style]
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/iscsi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index 612de127e5..a316d46d96 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -290,7 +290,8 @@ iscsi_co_generic_cb(struct iscsi_context *iscsi, int status,
     }
 }
 
-static void iscsi_co_init_iscsitask(IscsiLun *iscsilun, struct IscsiTask *iTask)
+static void coroutine_fn
+iscsi_co_init_iscsitask(IscsiLun *iscsilun, struct IscsiTask *iTask)
 {
     *iTask = (struct IscsiTask) {
         .co         = qemu_coroutine_self(),
-- 
2.37.3


