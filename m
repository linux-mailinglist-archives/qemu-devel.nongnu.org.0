Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E354CEBAB
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:15:43 +0100 (CET)
Received: from localhost ([::1]:36798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqjf-0005ZX-0W
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:15:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVa-0000p6-Sw
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:13 -0500
Received: from [2a00:1450:4864:20::434] (port=43905
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVZ-0003xC-GT
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:10 -0500
Received: by mail-wr1-x434.google.com with SMTP id e24so6344772wrc.10
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bZ6XfT5ghTxxwhHbhvIROOJOz3Z2nwVUuV/FAqsIjmw=;
 b=m75Ne29yrEqGK6prFkrreUAwuXh6r6gyHv9HLjeloTPVqGIJU/vlUPPScLWqmUcaNU
 32pGVVHWNEn9ogwL7X58nAJGXSf5MuNOgop/HRbSFPxU7j+t5Or0ZH/ufiW/BN9+VOsD
 BIg8wTO3QVPCjkoS/bSUArpTH6gLkOYV1syNS8SQ8vBDzUfQAsHo3JL8qJEmrXaZ8jc9
 xUGTYoCk8YjPmdn54QtxmUOjCs/qA0yWg0M9vsPznb0PRNLB+jEOoLfS1zheln60Rfqn
 /Cax2rum4BBiLn8uEoYkqFa0AjEeQdXJnIoqN3HRDe6mQ+kv6p5P7xteVp4wY0gpNxXN
 3bOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bZ6XfT5ghTxxwhHbhvIROOJOz3Z2nwVUuV/FAqsIjmw=;
 b=0mReQfMKBvMR1HrfJtcVW4YkkxWoyBEyeMIYC4vdIkg5UDDBlee7JqCJ5s1uNzLwjn
 SJIK1Pr4Ez4lGefNAZzXL/cHGuvJmobm26w8MEYHK0zj000Gn2fs2t7p48m2QG1ELnNc
 cn+2N2TBK+L94+iRa6BkVE2gBFy8sr3do1odu/8jiy/iYc2Tev/Wx6eo6dGMI8iQKJi6
 cQ4N0bWwnMz+9fvAjWsE3jk+JVSgz8iZK7IXMhwmfGj+gmFypK8gr1sSDhIXMYEy+4qi
 MSD0LFDY9dZesUczVdU6S/jXwjoBwWs86TauQ5AOGh5ce/F/0hdiunAJOvcPbTngpH02
 zL1g==
X-Gm-Message-State: AOAM532eXU5kxWUHxqhehCjIZmvq57Tqp98Y3fEpQFDZ99bitz7gz7HN
 t4iRNG7GVFO1krXKmIGBdMrKrQenVyA=
X-Google-Smtp-Source: ABdhPJwzwgCA8/4mnJdzQ+orfvcuJchdCZFyG4eRpAfw/ltg9oCJjfvPiL5rcKA/hi/j8SFNmaOj9g==
X-Received: by 2002:a5d:558d:0:b0:1f0:7309:b429 with SMTP id
 i13-20020a5d558d000000b001f07309b429mr4898734wrv.704.1646571667123; 
 Sun, 06 Mar 2022 05:01:07 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 7-20020a05600c228700b00389865c646dsm11243353wmf.14.2022.03.06.05.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:01:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/33] softmmu/globals: Remove unused 'hw/i386/*' headers
Date: Sun,  6 Mar 2022 13:59:39 +0100
Message-Id: <20220306130000.8104-13-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-13-f4bug@amsat.org>
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
2.35.1


