Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6431382B9D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:58:01 +0200 (CEST)
Received: from localhost ([::1]:51318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libsm-0006ou-Eu
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libqw-0003z4-W1
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:14 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libqt-0002wT-AN
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:06 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 z19-20020a7bc7d30000b029017521c1fb75so2822861wmk.0
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6K25Rk+jURG0ASVbfGKwW1bl2gEnBYtQHzFYqwQ6Y7w=;
 b=g6RfVtyRzr844kigFqFWHLaCd8810RmO324fJGBhJBLbvrcQYESFr7t9X20y5VtBhF
 Kj1IFGK/iB2slh+wtuDg3Cdhw14VGEJ51diKgvagpRFvgSGHguBwl8JIpDn5diexsARB
 AhnrjDW+z/6+t91uw43zRcCpkXJ1N7ut7Q7d7HZOaejdofsmZz+vcJuHp3IKC/L73s/U
 J7L/f8RhDMTXbDl1F02ubFA3b8vhzi/23sKCPYyOnrUOoFWVOBA0rztNkinV11as2EjS
 /DQDlWsmOMr7X4raZwShIKPUJtjpkRUatv1mSdjxTnstkQB3z9kxSvBkUoWIBCbapnQB
 gZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6K25Rk+jURG0ASVbfGKwW1bl2gEnBYtQHzFYqwQ6Y7w=;
 b=jU4uGa/Dn9+W18P4n0QFiJVVqJtc8fhJFp3IGJIiVUy4/2iGqJOvD1dM827nSXXrI9
 shjUHneiZk57c7hTYa7FKQONjA2nX8ljUbnnHOGYR5zNoqOpiK14UAhJ/+GMbyZ4CW79
 TN1RWUs1ukpawQxPq6c0E6bZsGpvdamkn/fqoURdGGVHuALTA9HcxbqjUgnHUq5WLouX
 WcAcdWrSyYJL8Lmx00UjE5gJ+oJd3tkjaaAmw2qW5oLl/kItwSnf58qcS7RzzqASIKbS
 DKGavo6QNXCJowBZhMa3KFH2zrf6i08uUJrfmJ98isDFk6fwXNURcNOENYcSgWGgfB16
 iNzw==
X-Gm-Message-State: AOAM530Ou9wUu21DbmqoJB8JCojhHkm+8u7fohICwDy9H2/UV37DIO1l
 l/6drBqg3tbSZmTeiuz1Jb/O3vB3Y2UMCQ==
X-Google-Smtp-Source: ABdhPJzsenCwWagdV5cM7EKW5/ie2ZdgVzdFcX24qTN69x+JGApDq0+bSf/gH79bh0xNez1YWK4EQw==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr15724245wmc.163.1621252561866; 
 Mon, 17 May 2021 04:56:01 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r17sm20961195wmh.25.2021.05.17.04.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:56:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 07/15] softmmu/globals: Remove unused 'hw/i386/*' headers
Date: Mon, 17 May 2021 13:55:17 +0200
Message-Id: <20210517115525.1088693-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517115525.1088693-1-f4bug@amsat.org>
References: <20210517115525.1088693-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/globals.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/softmmu/globals.c b/softmmu/globals.c
index 7d0fc811835..3ebd718e35d 100644
--- a/softmmu/globals.c
+++ b/softmmu/globals.c
@@ -25,8 +25,6 @@
 #include "qemu/osdep.h"
 #include "exec/cpu-common.h"
 #include "hw/display/vga.h"
-#include "hw/i386/pc.h"
-#include "hw/i386/x86.h"
 #include "hw/loader.h"
 #include "hw/xen/xen.h"
 #include "net/net.h"
-- 
2.26.3


