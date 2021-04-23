Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D79369B71
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 22:41:57 +0200 (CEST)
Received: from localhost ([::1]:41314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la2ce-0006sp-9Q
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 16:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2ab-000576-KC
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:49 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:39472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1la2aZ-0007w0-Tc
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 16:39:49 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 65-20020a9d03470000b02902808b4aec6dso41637653otv.6
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 13:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AAnkUc8jISOMiDfFCRCZEzuk5CxhelAHBXEwn56RXZk=;
 b=fMeRkeaRI4axHMRSN23/ylRTxCNFqGLD2q22Rvdctbhhix2+FyPFq3VFzCUqrUlcGV
 UFCynWmzmlwB+VlpWRYzYqplPpPms9o/aZn94KY6TGdOugJM+ONmSVEkgc5mhccTurAx
 FUSzks9aOwgoy3GTy76tw/AKluVacyeEdxgx4z/jfYZQvAsNlJYqMwDI10OiNopZOqN3
 i/Ej1BFQY8KEJXZ3Rr7zw/zbjSyO5zv9Asq86PD7tk5WQthltd3J5xE+fPXWKubyPmkP
 PuagieHXlqkLFbRzue0TbXWYnL5LbH1pQKGhJjueKWV7oYFv+c7I1FaEZd5em0/G43er
 1qYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AAnkUc8jISOMiDfFCRCZEzuk5CxhelAHBXEwn56RXZk=;
 b=fTR8AYrBos5yWLzLxpdnjCinr93QaZlSinKXHAJ5iPQ/7XglH2czjPCt37oTf4nblY
 Vmoqq3duNFWXnGZso5wlJn84MECahjK2xCVpXJhNvXTh1tvXe29PrTqFLMfHLHQZ4+IZ
 ilLTCidwabSk0WA7YlwjzG14gwrkqG6jd1msH7XBNwJuwi5Jn+P+lkWel2QgDqAdbtIh
 nsb4kd+nLM1Jq5zNJ7Iep7tGR1Z39TBprYNla8k0uCA/PpFtdlFq8pfkhYZI4eRsfQ2w
 7WX0kHqd5a6l9o3Nv6WBnmI+TQk6mknF9+wEonGjzIiITnrNHqfKWZeuL/bYlhjH1rmd
 Bl6w==
X-Gm-Message-State: AOAM53325XEPtkb8mf37IKNwsK0f6dX+CET6G78AjeJTjZWmS4RCjClv
 gQS31IV2YuYlPFOrR/pnPFUqWUJggkvhuoMI
X-Google-Smtp-Source: ABdhPJzO6lsSnQcekOyR5I0vGSIfEn/AxpKxoxhDwnozu6p4bIwcdS7aDJkgh9EraZpYquflmRDipg==
X-Received: by 2002:a05:6830:3497:: with SMTP id
 c23mr4791920otu.344.1619210386682; 
 Fri, 23 Apr 2021 13:39:46 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id m127sm1511911oib.32.2021.04.23.13.39.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 13:39:46 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 05/24] bsd-user: style tweak: keyword space (
Date: Fri, 23 Apr 2021 14:39:31 -0600
Message-Id: <20210423203935.78225-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210423203935.78225-1-imp@bsdimp.com>
References: <20210423203935.78225-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::32b;
 envelope-from=imp@bsdimp.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index d2bcaab741..b836b603af 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -233,7 +233,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 #define __put_user(x, hptr)\
 ({\
     int size = sizeof(*hptr);\
-    switch(size) {\
+    switch (size) {\
     case 1:\
         *(uint8_t *)(hptr) = (uint8_t)(typeof(*hptr))(x);\
         break;\
@@ -255,7 +255,7 @@ static inline bool access_ok(int type, abi_ulong addr, abi_ulong size)
 #define __get_user(x, hptr) \
 ({\
     int size = sizeof(*hptr);\
-    switch(size) {\
+    switch (size) {\
     case 1:\
         x = (typeof(*hptr))*(uint8_t *)(hptr);\
         break;\
-- 
2.22.1


