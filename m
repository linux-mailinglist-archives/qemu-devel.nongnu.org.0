Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA124AB753
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:10:55 +0100 (CET)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH02w-0000Qo-8U
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:10:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGysn-00061u-Uj
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:27 -0500
Received: from [2a00:1450:4864:20::42c] (port=34752
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGysS-0002Eq-N8
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:17 -0500
Received: by mail-wr1-x42c.google.com with SMTP id f17so23172448wrx.1
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zez4ISi9HLTg8wm1+LaHxiwt7rkz8IPb2uqsVohVlvY=;
 b=Sdxs7a/A6eKt1yvHPkFWYQQwfkIxnGff6TsTco0J5Ytf2fNGirNfQdog66+Q99H+PZ
 UZ4ffGDiaCh1pTcm9614hZ18AcKIp5qpkF+1h4uGBDt3uDyGiWX4ZqHeWRwQNjPIOfFN
 3cz972QdVLt26LRT7scNKkcVXhuJzyI1jlK99OG1Afk/0fqxIVXbpWQNMG3zQ7qaTrNQ
 wXut/KJxX+xwcwI+nQyCxhpHWdBSvO+JiVORvtKTrGNQHHQOcOei6kyW4so1cwKwne90
 3OuxLVjNweW61uPHJgtqXw+9NQoqmBt+Z22JG0jkypzxcdHrPISVl/HTepHxVPlzBvPe
 V9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zez4ISi9HLTg8wm1+LaHxiwt7rkz8IPb2uqsVohVlvY=;
 b=PPpEqbKNpPlmCWlJfbAhBQoZjQ95jdTEUbGaUs0tVWy8Q2qKhUA94jLxAGpe166O4u
 6NW7r5jCSfbJV8shTw9nmAX+Kqk2Ti8jk1lNVVckSQZYNKHWbgRTULo1+DPrnr194Mcc
 me/95w00dLNcZmQvjsIcyCjSFkzNKPyIkj3D4wOZUfai2y82ewuZsNIOT0omgdHcKs9h
 anW5Nib0duUhG5VI4YaWXoe0wJlZVTFrWw22xus/mh0+iEaaI+fIJgMGbesAK3ovYzKX
 nkLaYM2FW4ncDZT5VqWoZE6LPN2DFoflR1nrxoQvasUrx43d9JvWElQrCcfWU0VHaQET
 VtwQ==
X-Gm-Message-State: AOAM533OEzEpSp/77toWe4IUi7k/YbV1JO0AYcFLSR7xiDQ3699hN4ON
 /BN7lJmPXiq8cw5OgN7Voa470813FCs=
X-Google-Smtp-Source: ABdhPJwd3zE4MZIBTr4XCfqDzTIUJyFkAJI7xqRJh/y6/Z+d4iO1zgNNxCAOjfbin6K7KQ26pSrO4w==
X-Received: by 2002:adf:e18e:: with SMTP id az14mr9118922wrb.610.1644220532097; 
 Sun, 06 Feb 2022 23:55:32 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id o21sm8215577wmh.36.2022.02.06.23.55.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:55:31 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 14/21] softmmu/physmem: Remove unnecessary include
Date: Mon,  7 Feb 2022 08:54:19 +0100
Message-Id: <20220207075426.81934-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/physmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index eb4b3bcae7..09951c0996 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -60,7 +60,6 @@
 
 #include "exec/memory-internal.h"
 #include "exec/ram_addr.h"
-#include "exec/log.h"
 
 #include "qemu/pmem.h"
 
-- 
2.34.1


