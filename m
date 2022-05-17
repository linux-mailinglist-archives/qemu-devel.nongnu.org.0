Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB11552A2E7
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 15:12:53 +0200 (CEST)
Received: from localhost ([::1]:37266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqx0O-0001PG-Qw
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 09:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXH-0001Pw-VS
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nqvXG-00030N-AO
 for qemu-devel@nongnu.org; Tue, 17 May 2022 07:38:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652787521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8ZGn1mwRF5eJYBssPx5tCYlzvjVCDP6Amd7KTebTKFI=;
 b=KQpAeNGxXwlH/4rIJcRsHRDLTVY8ifSic5goe9sH0nYZjX9v/6x9HE1xRogZ0mg1Ih6HU5
 SJj+kVOz8xL6tqSiGFqaKWl0TEdAAyCCl9ZWqUHDPoUO4m5scXRAC7U8ugO6iGv7b46T2P
 Qa62jVdfOZkuVxYg8+t47srEXPkpRwI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-TcbPv75RNZ-Sq28z6rZHKw-1; Tue, 17 May 2022 07:38:40 -0400
X-MC-Unique: TcbPv75RNZ-Sq28z6rZHKw-1
Received: by mail-wr1-f72.google.com with SMTP id
 e11-20020adffc4b000000b0020d059c2347so1205766wrs.18
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 04:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ZGn1mwRF5eJYBssPx5tCYlzvjVCDP6Amd7KTebTKFI=;
 b=e/XRIH99+qY8l+sE04hXfncpruiKbibx4LLrkJrMlzCa8LbuNHLGxauh3DqDDRLyT5
 CIUnwxYlN0e0oxCXdp6AcNanRzJAv0fuwGoe8PXrBzSp5DpEefYnsZAiHelGqDFk+tXJ
 9qpE6y6Blw+PzWPxxskrMolHr7LFhCYJHw2JRxPsLzhMdko4McSIi/DUhn4FrtoHzxPI
 xhYa3mwyzxX/sya2bR1gJeaeFRkhEaY5r2NAqk8tL1zx36oIIDWrsuMhEn0wh+Xs95c+
 HfmuVMik1DLiKF22tB/SG050Z6UpCRR00TzdYDupysiiabIlCr9vfooeDFGJNYGe055+
 /7gQ==
X-Gm-Message-State: AOAM53211YV/635nVkvAKSbV6WJHVSX1XI98cjIoRNVlWM5iZAddrLeI
 x6yrTNaNSSGVw6GcF/ulHjCsQb8v07Y/ufpUxtkXoAuYdpL9OJFheC80dGksEERaN9SaKo5EM9G
 byg/jtQBLEueoG1G3LXPUAfGiEo2lhbewdSRCXxV6YEH9FO6VxYQrzVaOp7MilBG1
X-Received: by 2002:adf:d1e3:0:b0:20c:6684:9b10 with SMTP id
 g3-20020adfd1e3000000b0020c66849b10mr18574481wrd.53.1652787519147; 
 Tue, 17 May 2022 04:38:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBZnPlObsyzuXXHiR/Tr/X2gI3mOYQ6oMGSW1Zo5xG98cbknZ+YgjRoS7klgM2FjOBB22DWw==
X-Received: by 2002:adf:d1e3:0:b0:20c:6684:9b10 with SMTP id
 g3-20020adfd1e3000000b0020c66849b10mr18574460wrd.53.1652787518980; 
 Tue, 17 May 2022 04:38:38 -0700 (PDT)
Received: from fedora.redhat.com ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 d24-20020adfa358000000b0020d02cbbb87sm8090317wrb.16.2022.05.17.04.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 04:38:38 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>
Subject: [PATCH 05/18] block: Make blk_co_pwrite() take a const buffer
Date: Tue, 17 May 2022 12:38:24 +0100
Message-Id: <20220517113837.199696-1-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220517113524.197910-1-afaria@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
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

It does not mutate the buffer.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 include/sysemu/block-backend-io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
index 6630316795..6440e92028 100644
--- a/include/sysemu/block-backend-io.h
+++ b/include/sysemu/block-backend-io.h
@@ -130,7 +130,7 @@ static inline int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset,
 }
 
 static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
-                                             int64_t bytes, void *buf,
+                                             int64_t bytes, const void *buf,
                                              BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-- 
2.35.3


