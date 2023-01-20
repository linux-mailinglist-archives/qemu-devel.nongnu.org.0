Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D2767548E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:32:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqUI-0003Gv-A5; Fri, 20 Jan 2023 07:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUD-00033H-1J
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUB-0000RP-Bi
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=78tiWXRn+oboM/7dgkmIWkbKc1TC+1kpwU8fh8uqnvA=;
 b=GW/M6yacCgFrLmM+sWQZ/41Xccq3ETZ0b6ILjWY+vLRFZmM8U/Nfa+qjFQrCDSoNzrMnY5
 WbrscVH8Z0N3Lb5tIh/lzE+RWr4zWJKCBg5eV+fhNmGsciuNq/ru13EHHM4LEO7a/Furf1
 hN4Hi+BhuOR+01mpv3zeSZPr9vTdGfA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-f8izK1FCMUKAgdHOvMATyQ-1; Fri, 20 Jan 2023 07:27:05 -0500
X-MC-Unique: f8izK1FCMUKAgdHOvMATyQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36F7D381494A;
 Fri, 20 Jan 2023 12:27:05 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BD404014EBE;
 Fri, 20 Jan 2023 12:27:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 26/38] block/nbd: Add missing <qemu/bswap.h> include
Date: Fri, 20 Jan 2023 13:26:21 +0100
Message-Id: <20230120122633.84983-27-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The inlined nbd_readXX() functions call beXX_to_cpu(), themselves
declared in <qemu/bswap.h>. This fixes when refactoring:

  In file included from ../../block/nbd.c:44:
  include/block/nbd.h: In function 'nbd_read16':
  include/block/nbd.h:383:12: error: implicit declaration of function 'be16_to_cpu' [-Werror=implicit-function-declaration]
    383 |     *val = be##bits##_to_cpu(*val);                                     \
        |            ^~
  include/block/nbd.h:387:1: note: in expansion of macro 'DEF_NBD_READ_N'
    387 | DEF_NBD_READ_N(16) /* Defines nbd_read16(). */
        | ^~~~~~~~~~~~~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221125175328.48539-1-philmd@linaro.org>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/nbd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index 4ede3b2bd0..a4c98169c3 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -24,6 +24,7 @@
 #include "io/channel-socket.h"
 #include "crypto/tlscreds.h"
 #include "qapi/error.h"
+#include "qemu/bswap.h"
 
 extern const BlockExportDriver blk_exp_nbd;
 
-- 
2.38.1


