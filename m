Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D98C51FAFE
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 13:10:00 +0200 (CEST)
Received: from localhost ([::1]:38658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no1H5-0006Hd-JW
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 07:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fr-0005L2-9D
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1no0fp-000373-88
 for qemu-devel@nongnu.org; Mon, 09 May 2022 06:31:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652092287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n6inZnLXWnAkdrOe9Q2dok2RBXEig9r/WC+XNq10mjA=;
 b=cAF/KEPhEdaV3nEuqHP8KvLywjE5IRGlDCXZeIeIE7/oCOSBS8xxipRTTg9wqmwM0rmCEe
 nvhjb5d+m8YDzRg5HBplHsQ1pQhheFyG1Z4gjRS9do4+aRL3f5oMf4EWIe+RfqWaMvurEj
 ZKbO3V308IuFMDUDdD24bn/XAc2iCS0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-uS4LQ-4UNTeK7Kl58wGaDw-1; Mon, 09 May 2022 06:31:26 -0400
X-MC-Unique: uS4LQ-4UNTeK7Kl58wGaDw-1
Received: by mail-wr1-f72.google.com with SMTP id
 v17-20020a056000163100b0020c9b0e9039so4566445wrb.18
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 03:31:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n6inZnLXWnAkdrOe9Q2dok2RBXEig9r/WC+XNq10mjA=;
 b=EX4Ounad4zHCRcxjRXVuQB/CGvOkOU5b9M9pxQ13pvnVuOvw+IP6Vk5tT4Uq2QI7yT
 kkZlFDGX583/RtquuEvhWZdKWPQDiXwq6eB3iyYEhwIve4rb1QIYE9UPMFylsYq8iF7Y
 kyvJl9HA9qa8DCzk8QSHbZhADPgxJludfz1wtJ/ICDkoWDEynSH3m6vglew15XertdG1
 RqvbgjBZgomEiGf41AG+Ud4mM7sAHIJXTVFiQLeY6dWjCTbMe43PukVxLba5+dWbw5XZ
 0EaQQ6x0oLpUy2vFKr9sG6wi4NcSQRHIjbBZrsKMNlX2dmSLs/zvozA3TWESxrRcKxWc
 EnUw==
X-Gm-Message-State: AOAM531SCMMxXYC7iyX9k7ha9lCdkZ48x+5Jf7DQIq2hog/dPqDKUTGb
 RqK60lj6HeUdkMPjr1p61aTr42DRNvQs9wbcANnaK2T/vj757jxMStWOrzy0ysLlJFMOVnH8d/f
 NFmhG8zEMMlo7NHVPyAhlxX4at6YOFJ1L2yP0l1LjrulXGQ5N53GB2CmNxKk5v6OgwkU=
X-Received: by 2002:adf:f10a:0:b0:20c:58e0:40aa with SMTP id
 r10-20020adff10a000000b0020c58e040aamr13672919wro.82.1652092284480; 
 Mon, 09 May 2022 03:31:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQqMdH87/eRhjkNKi3FOBawThWPqqcq8mJ6OyhJ78O8/kSm9Y44iMdXyzOseff7H9PXFwwXA==
X-Received: by 2002:adf:f10a:0:b0:20c:58e0:40aa with SMTP id
 r10-20020adff10a000000b0020c58e040aamr13672891wro.82.1652092284108; 
 Mon, 09 May 2022 03:31:24 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a7bc621000000b003945f955b51sm13641396wmk.3.2022.05.09.03.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 03:31:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Greg Kurz <groug@kaod.org>
Subject: [PATCH v2 24/26] 9p: add missing coroutine_fn annotations
Date: Mon,  9 May 2022 12:30:17 +0200
Message-Id: <20220509103019.215041-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509103019.215041-1-pbonzini@redhat.com>
References: <20220509103019.215041-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/9pfs/9p.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 994f952600..a523ac34a9 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -424,21 +424,24 @@ typedef struct V9fsGetlock
 extern int open_fd_hw;
 extern int total_open_fd;
 
-static inline void v9fs_path_write_lock(V9fsState *s)
+static inline void coroutine_fn
+v9fs_path_write_lock(V9fsState *s)
 {
     if (s->ctx.export_flags & V9FS_PATHNAME_FSCONTEXT) {
         qemu_co_rwlock_wrlock(&s->rename_lock);
     }
 }
 
-static inline void v9fs_path_read_lock(V9fsState *s)
+static inline void coroutine_fn
+v9fs_path_read_lock(V9fsState *s)
 {
     if (s->ctx.export_flags & V9FS_PATHNAME_FSCONTEXT) {
         qemu_co_rwlock_rdlock(&s->rename_lock);
     }
 }
 
-static inline void v9fs_path_unlock(V9fsState *s)
+static inline void coroutine_fn
+v9fs_path_unlock(V9fsState *s)
 {
     if (s->ctx.export_flags & V9FS_PATHNAME_FSCONTEXT) {
         qemu_co_rwlock_unlock(&s->rename_lock);
-- 
2.35.1


