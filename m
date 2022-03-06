Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F374CEBAD
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:18:57 +0100 (CET)
Received: from localhost ([::1]:43360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqmm-0001ga-20
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:18:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVl-00012E-Pt
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:25 -0500
Received: from [2a00:1450:4864:20::436] (port=36641
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVk-0003yN-AG
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:21 -0500
Received: by mail-wr1-x436.google.com with SMTP id r10so19338746wrp.3
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YdbZvlc0FrncOukX/EiU9GaXKsbE6O28gBUzThGWAu0=;
 b=UV84Zl3SH2cTrEaCFRyTBoRONHpXXosyo3e1fGYZuym+ZyD9Ef3YnAKk6hTXMr8MwK
 JLtyeUyqtXpIRyCOGDK15Vij9U1P+PN98QWWDoGsLAgMd8f5XhLMKNPfh4vR0vwVVebw
 F21hBLMZIlLy0kJO81YjUxjo4XKnaUDiobyBRZmQlzAukgoxWYz+P/Ggx2VW8yXTjTf/
 LKa3a94bcKo+qfO4FWLlG6W4nXzT6LtWXlATM9SMvbeE/iUS/s+ZDwB1I9TeAINt4vNI
 BfVYKX7e1KVj0atLmd7+j234ksJ4VeM9O1s0Jku3AxaxcFRpTOJMjkfE+R9BwDBrUc6M
 tHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YdbZvlc0FrncOukX/EiU9GaXKsbE6O28gBUzThGWAu0=;
 b=1f4B/2O4BVXbwO18JNPCr3wC5th+S5L2iEsVJ8QtEmjUp8g4L4krfxMvPLE0vFdPgp
 MvYLheUV1HGBdHBuX968vXL5cWc7ASdpyffofXyIGrzqfxit+l0CzIcCgQgmPuawBctA
 EmZeWgrAoSJ1MQnqR1qcL55MjSJ3sWc1ity7V0uf+62PN+dv6ctHLuOLcjJp3zOjhKVI
 7J5wXHrKf2RN9HHmw5sYcWMFwlM289lTeB15kBrUOa0MX7LFz3CwwYGQsXFUFREClMb2
 aO3UGLzwW4feVhNlCtbgQw4wBxHrAoMDpIInti5c1FxPbULchpos+FxBG8tQ25yWK9ga
 mxCw==
X-Gm-Message-State: AOAM53010K0BPxlzZsPYnySbKnkDT00UEzI3qRfjjs6bqvjJwxBZfkmf
 jAkIrAB7+GMyHyfz7hrOKfG/+0CVRds=
X-Google-Smtp-Source: ABdhPJw0Ie+STosZe0iZDmvGJaVd7ucKPGPZZ8Aljke9SCckpkCtIKN3yQzFVps6ABODPChdC+Yi8w==
X-Received: by 2002:adf:fa46:0:b0:1f1:d99a:4b1 with SMTP id
 y6-20020adffa46000000b001f1d99a04b1mr5208602wrr.516.1646571677849; 
 Sun, 06 Mar 2022 05:01:17 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 f4-20020a5d4dc4000000b001d8e67e5214sm8994444wru.48.2022.03.06.05.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:01:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/33] softmmu/cpu-timers: Remove unused 'exec/exec-all.h'
 header
Date: Sun,  6 Mar 2022 13:59:41 +0100
Message-Id: <20220306130000.8104-15-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Message-Id: <20220207075426.81934-16-f4bug@amsat.org>
---
 softmmu/cpu-timers.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/softmmu/cpu-timers.c b/softmmu/cpu-timers.c
index 34ddfa02f1e..204d946a172 100644
--- a/softmmu/cpu-timers.c
+++ b/softmmu/cpu-timers.c
@@ -28,7 +28,6 @@
 #include "migration/vmstate.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
-#include "exec/exec-all.h"
 #include "sysemu/cpus.h"
 #include "qemu/main-loop.h"
 #include "qemu/option.h"
-- 
2.35.1


