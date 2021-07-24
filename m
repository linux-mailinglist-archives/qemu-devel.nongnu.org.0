Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCD83D468D
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 11:02:12 +0200 (CEST)
Received: from localhost ([::1]:55158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7DXv-0007WM-GS
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 05:02:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m7DQz-00034B-R8
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 04:55:05 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:47084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m7DQy-0002vD-EW
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 04:55:01 -0400
Received: by mail-ed1-x52e.google.com with SMTP id f13so1954278edq.13
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 01:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4cH3wLGEq0JKZCYj4wrESPa9iNTNaZZMev7mR0tXzRE=;
 b=AZual6B8sELJDka5QEyHi80tsdeq+dhEYUxDBJ6DQLSr7vvxa3HPNACafQ8FuhfMmd
 j4sgCQ4at+XkRtIZnW/lX2bUvPfBJ7vvm5JzDiQZ7tCx5W2LEza833hGbDlHbzeFTsNO
 ynEbcvmByA7UVtD+5JhfnqxWLOO5avjeqRLOZMuBmhPlAexMCkwIYtyYiQbE8JcG0v/4
 2avuRrr5fsxA8oBC+DzZvRF/WB4ZwCc4TNBK07vbr6N1867zesT1HiqRceJhNYbtUUbV
 nTXHar+bb9hpA8e/FQ1Fskr2PafcO50witTi5Z7+8O3Mj5/qF2Kqxhe1eIoK4eDIXaXL
 /dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4cH3wLGEq0JKZCYj4wrESPa9iNTNaZZMev7mR0tXzRE=;
 b=K3vba1IyunEJwSYSRfrMsYSDQWwl7Kwugdi79+MMjJo14xFRmGI6zZyGHMoFMH2Ff9
 7v5ar0FnkmSO5jLSuRuPcB8qWQUnBxqB+m50Atm9P5PTATJRhU6x6u8XSjxVaDhKuWQq
 K/Di3eqwz49z5AhR/0I7sCpUjqaV+65YGVR+muKJJb1pwEhH0rPqfX7cSdUBUjiHzgur
 zEYmH+0F3ffbJCHtwARlh8kDJ5C+8x7ATtb2RV541iO9IcfLxC5P+Va8RReHu11fsu5T
 imDudv3NIouhgjtF4pZsnJJYplS//phKj4JHBpNZmQeFRx7izmWIWBN+eL7tBvCXfqNY
 5bLA==
X-Gm-Message-State: AOAM532qbmtDoQBy4WWrWuknu0duO1+3Vzlh6qTy/iMWOBbeQMFpsBE/
 vVT2dTQXAvH1ERYocAfw3+cv/I5cU2M6Sg==
X-Google-Smtp-Source: ABdhPJxGoLEyFiBttubb+adNi0ZHHDjCMHyoejRjYDFd08PvnsrtL9RPznOmY34XbEMPvYsfUmT+Dg==
X-Received: by 2002:aa7:d8c1:: with SMTP id k1mr10050413eds.28.1627116899209; 
 Sat, 24 Jul 2021 01:54:59 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id j21sm15723881edq.76.2021.07.24.01.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 01:54:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] MAINTAINERS: Add Peter Xu and myself as co-maintainer of
 "Memory API"
Date: Sat, 24 Jul 2021 10:54:49 +0200
Message-Id: <20210724085453.16791-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724085453.16791-1-pbonzini@redhat.com>
References: <20210724085453.16791-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Peter and myself volunteered to help out co-maintaining "Memory API"
with Paolo, so let's update the MAINTAINERS file.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210723100532.27353-3-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 420c8a48a1..190a90b541 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2452,6 +2452,8 @@ F: tests/tcg/multiarch/gdbstub/
 
 Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
+M: Peter Xu <peterx@redhat.com>
+M: David Hildenbrand <david@redhat.com>
 S: Supported
 F: include/exec/ioport.h
 F: include/exec/memop.h
-- 
2.31.1



