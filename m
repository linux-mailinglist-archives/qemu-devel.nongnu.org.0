Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF84F5F77D7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 14:10:29 +0200 (CEST)
Received: from localhost ([::1]:60954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogmBQ-00031p-F6
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 08:10:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogku3-0005RC-Rv
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogku2-0003Bp-Cu
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LQ2hTjqwfX+63WO/urc0I8KAft3sfJgVBpYvz5/VcmI=;
 b=b0sqoIj2lzoRqQjZ6/2Uxpoix7oLYCTCVkwXB7ip3tnCjT1bmmRZ2e48kuGRt9u0ztp6le
 UHcnkW/GgvMMs9dE6Asa9By1lWA+ZRZVPpzEJV1FT8vLYMh9Kk3N6fRXdWFHp9UVaHUpfp
 yF/UDDptbWkGPeYL6JI/GrTTnIN/o7c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-Rk46bky-P1217U80RhrZ7g-1; Fri, 07 Oct 2022 06:48:24 -0400
X-MC-Unique: Rk46bky-P1217U80RhrZ7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37584101A528;
 Fri,  7 Oct 2022 10:48:24 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 772C52024CBB;
 Fri,  7 Oct 2022 10:48:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 24/50] raw-format: add missing coroutine_fn annotations
Date: Fri,  7 Oct 2022 12:47:26 +0200
Message-Id: <20221007104752.141361-25-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

From: Paolo Bonzini <pbonzini@redhat.com>

Callers of coroutine_fn must be coroutine_fn themselves, or the call
must be within "if (qemu_in_coroutine())".  Apply coroutine_fn to
functions where this holds.

Reviewed-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220922084924.201610-24-pbonzini@redhat.com>
[kwolf: Fixed up coding style]
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/raw-format.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/raw-format.c b/block/raw-format.c
index c7278e348e..f337ac7569 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -411,7 +411,8 @@ static void raw_lock_medium(BlockDriverState *bs, bool locked)
     bdrv_lock_medium(bs->file->bs, locked);
 }
 
-static int raw_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
+static int coroutine_fn raw_co_ioctl(BlockDriverState *bs,
+                                     unsigned long int req, void *buf)
 {
     BDRVRawState *s = bs->opaque;
     if (s->offset || s->has_size) {
-- 
2.37.3


