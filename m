Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA70414104
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 07:02:30 +0200 (CEST)
Received: from localhost ([::1]:57148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSuOr-0006mh-Qg
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 01:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJP-0006bB-UD
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:51 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:37775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJO-0007lD-CV
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:51 -0400
Received: by mail-io1-xd2e.google.com with SMTP id s20so1777398ioa.4
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 21:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YABXt7N5hYjs3+JGLkXDo6wCkHqEJQ3WPYs4NvgmbNI=;
 b=7WfSY3R9j2gJ/xVYkyHeoAZkIAbIder4dOHXHJihEXvIYubYxA9zd0eMoLxbb5Sjj4
 RCs4JLget78OqdlKID8yMtIFFDpRNzwCTpt/d/qcKjE4CTNhB232KIHSMeXSfw1vm7P7
 jyXpFC6/Zzp/x8I80M71269w2ho4ZQfybWy89v0mvJHCJMClsvYzSvXWLEZqK2bVWDCO
 TAaejUj0FDby131Dvbun4DXSBEV1Nba9/C9Wzcqc5y1MfWL111ohUAHFFWVUxrfztpEg
 Qav2zW6Si1Vq3RNDEtxbU2plw/D8N6Mf5UryUGRBQxPxFi5lQ98esnnLvJ4Ztjhc89az
 JZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YABXt7N5hYjs3+JGLkXDo6wCkHqEJQ3WPYs4NvgmbNI=;
 b=PaOF6vVkDZSMt09IAvIIkiZsjbK5MUsGlr25k8xJ9X+2IcrOJ0TPvkUsdwQ+DlOkEe
 9V+eN9rcUo3zfn2hki9sDQnJ18lFQJZ4XG6ssQ0NeYLTbwKlqDKDfz+03JsrIcxZSw0M
 Ej4yJ0I79nXrauwQelP9Jki4UYmdHZ6MHM9JSIp5SBpxjZ7mkvEIkHrlePTERQxUwYw2
 Rl+/a55zg70eqORJGBvUg6LqArBAZq/ejCaZ/e9RtjVTlp4ZTmMlvAv8gP26AyJd9nea
 F+WiGR5W08tl6SqDkidOIb1CX9t53m+j7WjhYN6iXD2gvvbGYAF+VpKrDyemU0+0skdg
 tyaA==
X-Gm-Message-State: AOAM533UE3f7Y3hPvg8TUz4jhVGQ4a+obqldPjig6ELm07AhFkOOF85m
 vgHgfVqDA0LsbRWys5A+bfFYfpOg+GxNi9P5xIU=
X-Google-Smtp-Source: ABdhPJyo0FvNT0+4CvayD9jMM/jGkkiKzBWemdpkHYHiEuBdPrcbGvD3qYv9kUoz6jygG1oJ76iSPw==
X-Received: by 2002:a6b:f610:: with SMTP id n16mr2902215ioh.139.1632286609179; 
 Tue, 21 Sep 2021 21:56:49 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j5sm512833ilk.58.2021.09.21.21.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:56:48 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/9] bsd-user/mmap.c: line wrap change
Date: Tue, 21 Sep 2021 22:56:33 -0600
Message-Id: <20210922045636.25206-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922045636.25206-1-imp@bsdimp.com>
References: <20210922045636.25206-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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
Cc: kevans@freebsd.org, richard.henderson@linaro.org, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep the shifted expression on one line. It's the same number of lines
and easier to read like this.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index bafbdacd31..8b763fffc3 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -399,8 +399,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                prot & PROT_WRITE ? 'w' : '-',
                prot & PROT_EXEC ? 'x' : '-');
         if (flags & MAP_ALIGNMENT_MASK) {
-            printf("MAP_ALIGNED(%u) ", (flags & MAP_ALIGNMENT_MASK)
-                    >> MAP_ALIGNMENT_SHIFT);
+            printf("MAP_ALIGNED(%u) ",
+                   (flags & MAP_ALIGNMENT_MASK) >> MAP_ALIGNMENT_SHIFT);
         }
         if (flags & MAP_GUARD) {
             printf("MAP_GUARD ");
-- 
2.32.0


