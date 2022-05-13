Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D545266C7
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 18:11:20 +0200 (CEST)
Received: from localhost ([::1]:39144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npXst-0007c5-5n
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 12:11:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npXfz-0001Pw-9V
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:58:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npXfx-0002IZ-LH
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652457477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GpampNajM5UgtrwDmiLk0bVq9KGYx4aWYW3nYWLwC4w=;
 b=YWJBnCXz3k6kyY0g3mL+2hLhteTfws6wlbvtZL3qIDTfD6BZQ5k9u/BEEpis/YVhBH+CjL
 ZKQY6W8zScohUGCxzg4l6t7m5jb0LlPwXsjA/Cw/RQRgv467cB3b1qHYom7/ZARZiy5Yon
 H1ollL85Yyz7cCu/JVECn7/+54vD0S8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-7z7Zg8ffOWuq-at06ogtCA-1; Fri, 13 May 2022 11:57:55 -0400
X-MC-Unique: 7z7Zg8ffOWuq-at06ogtCA-1
Received: by mail-wm1-f69.google.com with SMTP id
 h6-20020a7bc926000000b0039470bcb9easo3180360wml.1
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GpampNajM5UgtrwDmiLk0bVq9KGYx4aWYW3nYWLwC4w=;
 b=Juvw+r4JAEO9PNzIMpiASfYtyoCsJkb1SPu9N538Ogmy7Z4fwxovEya2xc8wWFeWzT
 mQETaOpk2vMAGY1Iz+CHwKGxNBkkaI/n982voLT/ezSk5UStm8e23r23IgP9BdqDjhRc
 2Qa2vnR4PU0rbcxWt1T3sJRkSwKJRTUY/GghN1hLkbUu1Ph+Kk3w5OYrnPmOE9+147ud
 XHt69HSRvDpgUVyPEH9slWbl9oexnxkKEty6jPL76FfOB4ywtFmW/cs2RbXmJZW72N19
 amE6Xjmd7xNFQkNlN9flATNOKVIRGxbwtmvso54oazZJxA6Kbamgka62qqY80l2jlTwC
 IQvA==
X-Gm-Message-State: AOAM532VvDSaaKKZhuNiAxYe8Twyk6jmYC2GzcStl1jluOC9PixG6uqO
 N0LLL1e3IC8GaQcBbPyMejAhC4iXlaWsuVTbe0m0lgAZukNhrXAiPK/23NPCszAATvrBPHHnSUz
 +mSg17hCNGQ3aWlR8haBW7q27cYeuq6A7AS+BWixDCZh3SkOuu1BPFAvpXV4AW9v2
X-Received: by 2002:adf:fc52:0:b0:20c:4c8a:e370 with SMTP id
 e18-20020adffc52000000b0020c4c8ae370mr4560447wrs.161.1652457474377; 
 Fri, 13 May 2022 08:57:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJAE0fGtJv3gUO91O/W1T/M67GYszbpgHbSgm+d3Adw4uqut1VMHW98oJzbfo26FQxSM3BXQ==
X-Received: by 2002:adf:fc52:0:b0:20c:4c8a:e370 with SMTP id
 e18-20020adffc52000000b0020c4c8ae370mr4560426wrs.161.1652457474192; 
 Fri, 13 May 2022 08:57:54 -0700 (PDT)
Received: from DESKTOP-E7ACR7D.lan ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 l5-20020adfc785000000b0020cdcb0efa2sm2558758wrg.34.2022.05.13.08.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 08:57:53 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 05/10] block: Make bdrv_co_pwrite() take a const buffer
Date: Fri, 13 May 2022 16:57:44 +0100
Message-Id: <20220513155749.2488070-3-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220513155418.2486450-1-afaria@redhat.com>
References: <20220513155418.2486450-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It does not mutate the buffer.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/block/block_int-io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index bb454200e5..d4d3bed783 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -65,7 +65,7 @@ static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
 }
 
 static inline int coroutine_fn bdrv_co_pwrite(BdrvChild *child,
-    int64_t offset, unsigned int bytes, void *buf, BdrvRequestFlags flags)
+    int64_t offset, unsigned int bytes, const void *buf, BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_CODE();
-- 
2.35.3


