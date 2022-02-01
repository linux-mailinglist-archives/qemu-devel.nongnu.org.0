Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256C24A60F7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 17:07:09 +0100 (CET)
Received: from localhost ([::1]:54360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvgS-0003dG-93
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 11:07:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuRS-0002mH-42
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuRK-00035o-Vp
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mZ7oPLP4UxfLyIyf/qXkjqCDbpV8idHpSluH2HZaDug=;
 b=SFr9wtRfuopI/IsbZOV8+Wr0OlFS6Y3S15bXaMmQ4PgSVqmES+I9otNe9oK9BlPG2NJFss
 ka4cLCGb06XWAD1Yf3u5Tul2X3BLehkhUcBnYCbP2sQG/BdycMA/DyMxsXjBJWfk4WwC1N
 BqxNtEwbBEif/BfotCwFDpHnoIe63hM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-l7WNQVr2ODOP1xstS2Sh-w-1; Tue, 01 Feb 2022 09:44:18 -0500
X-MC-Unique: l7WNQVr2ODOP1xstS2Sh-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 764511091DA1;
 Tue,  1 Feb 2022 14:44:17 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E0F110A4B2A;
 Tue,  1 Feb 2022 14:44:09 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 24/24] block.h: remove outdated comment
Date: Tue,  1 Feb 2022 15:42:33 +0100
Message-Id: <20220201144233.617021-25-hreitz@redhat.com>
In-Reply-To: <20220201144233.617021-1-hreitz@redhat.com>
References: <20220201144233.617021-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
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
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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
2.34.1


