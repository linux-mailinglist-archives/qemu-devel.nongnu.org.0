Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3DB4A61BD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 17:58:38 +0100 (CET)
Received: from localhost ([::1]:48282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEwUH-0007uv-J8
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 11:58:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuyw-00037z-63
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:22:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEuyu-0004FR-Pn
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 10:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643728928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=07v9n6aFpox4B8MQtYAPY1l8TjV74mHKf+/dwqV4DNI=;
 b=Ic0ItfY1tpjj8rAZn83nTBJzzszU8K87UvvaAghvBJtxov4exIikAIbhSlrzJlqJnSIpi3
 pvlqMcGlS1H3j9uIjo4L1p5MWhO1tRQAE5fwpp6cfSPdVfA+MTGyDCIPjnt3o0SbV9XJmo
 NnWj9VbB62LC9/Hw17JS4HkRHk3hA7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-121-LoYqSASQOROwnQqoQ2LA_A-1; Tue, 01 Feb 2022 10:21:25 -0500
X-MC-Unique: LoYqSASQOROwnQqoQ2LA_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4664C84DA40;
 Tue,  1 Feb 2022 15:21:24 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 344E874E9B;
 Tue,  1 Feb 2022 15:21:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/10] block.h: remove outdated comment
Date: Tue,  1 Feb 2022 16:21:04 +0100
Message-Id: <20220201152108.171898-7-kwolf@redhat.com>
In-Reply-To: <20220201152108.171898-1-kwolf@redhat.com>
References: <20220201152108.171898-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

The comment "disk I/O throttling" doesn't make any sense at all
any more. It was added in commit 0563e191516 to describe
bdrv_io_limits_enable()/disable(), which were removed in commit
97148076, so the comment is just a forgotten leftover.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-Id: <20220131125615.74612-1-eesposit@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/block/block.h b/include/block/block.h
index 9d4050220b..e1713ee306 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -344,7 +344,6 @@ typedef unsigned int BdrvChildRole;
 char *bdrv_perm_names(uint64_t perm);
 uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm);
 
-/* disk I/O throttling */
 void bdrv_init(void);
 void bdrv_init_with_whitelist(void);
 bool bdrv_uses_whitelist(void);
-- 
2.31.1


