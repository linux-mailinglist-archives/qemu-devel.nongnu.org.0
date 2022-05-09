Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AE351FA4B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 12:48:27 +0200 (CEST)
Received: from localhost ([::1]:38954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no0wE-0002kJ-KQ
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 06:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fB-0004bA-PB
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fA-0002oF-6s
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4PvFr4zAg2gcZWEKCQhyWR6VZ3/7rqXVGgtUQ04S3mk=;
 b=Cl0SwUuDFfVGob+n3YN4fgYe3Zfn1Epi6S6vFyo9+Lunc/q9jKu0NRO/OUgcJpM4klrtE0
 +0oBKvhEBoTgPwDxCvA+uzAuKmGQJ/i5+yB2HThxRGJ1dnH02gCuFavMHHlb1kuk7HARGq
 xQ3I4UWk/cuiaWTvNcJ0CVJbV1bYWPI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-Z9SdP648NnacKzpwOL2c9A-1; Mon, 09 May 2022 06:30:46 -0400
X-MC-Unique: Z9SdP648NnacKzpwOL2c9A-1
Received: by mail-wm1-f70.google.com with SMTP id
 u3-20020a05600c210300b0039430c7665eso3724095wml.2
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4PvFr4zAg2gcZWEKCQhyWR6VZ3/7rqXVGgtUQ04S3mk=;
 b=vyi6FwRMS1PD5FZs/4BPjqUlfYFLGzcWRTls/h9UGif4AZsvSWmSVaZCztAP7EzGx0
 0sK5O/PHlyJLcNaSiCrzc7UB0l40O4rK2r+lTtrPvAbW+E+7VxjUbgcE0AClkkvIxbq+
 FBqibWqgaFjo39bqvPTFVlsKtEO9hJBK9QCdNbKB5cEXHoSzu469uZaP4jn31kkXYv8E
 ZYGBXYBH3lb+n7flQWNeD9NCkBEcLNW0jau8ld/twhrEGedXyuwsW+sCjvDI2fZQ5tgs
 ayhDaNv1VVm9x1FY2/WkPth/So9sFqVpGCgL+k9dPxG8ctZLcZmQbxDG6e7CCfpF5OCY
 xfKg==
X-Gm-Message-State: AOAM533IqPPg7JpOsWKL26aFGxQfGdN4+/qOk3dPv6mz8xW9X6vel4iw
 pPk0ZSWsX3Q3WevywB0N3jzbeBuTcNvvbAVLzzqqz5DR2c0d7MXdHyMZJG+BUU/ak7bR3SJ2E5E
 onwVQVL5MqtjAV99bgU52IH1Y2dFZZeJokFZJV0f4W7F7xO40LILt4UtJ03TtiZzUQtA=
X-Received: by 2002:a05:6000:86:b0:20a:d7be:e09b with SMTP id
 m6-20020a056000008600b0020ad7bee09bmr12832966wrx.398.1652092244404; 
 Mon, 09 May 2022 03:30:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc2t/cV5kjG9EZlJmD0QGZdPkwJpyhrrYDrv1ZaZaq9/7u8BfXJSgNmTfY13TVi6eB+vgCMg==
X-Received: by 2002:a05:6000:86:b0:20a:d7be:e09b with SMTP id
 m6-20020a056000008600b0020ad7bee09bmr12832945wrx.398.1652092243999; 
 Mon, 09 May 2022 03:30:43 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a5d4688000000b0020c5253d8ecsm10289152wrq.56.2022.05.09.03.30.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:30:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/26] nfs: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:04 +0200
Message-Id: <20220509103019.215041-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/nfs.c b/block/nfs.c
index 444c40b458..596ebe98cb 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -223,7 +223,7 @@ static void nfs_process_write(void *arg)
     qemu_mutex_unlock(&client->mutex);
 }
 
-static void nfs_co_init_task(BlockDriverState *bs, NFSRPC *task)
+static void coroutine_fn nfs_co_init_task(BlockDriverState *bs, NFSRPC *task)
 {
     *task = (NFSRPC) {
         .co             = qemu_coroutine_self(),
-- 
2.35.1


