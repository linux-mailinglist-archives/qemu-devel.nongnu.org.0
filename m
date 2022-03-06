Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEB44CEBB0
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:19:52 +0100 (CET)
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQqnf-0002zz-5D
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:19:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVf-0000sP-Ao
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:15 -0500
Received: from [2a00:1450:4864:20::429] (port=36628
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqVd-0003xf-MU
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:01:14 -0500
Received: by mail-wr1-x429.google.com with SMTP id r10so19338490wrp.3
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LDkOBzD1NeiyCs7398uvnovIqEumzOK3cJlInlmNTUU=;
 b=NEGBG6ANeBb1XrO+WQdvGqbV3soQeIRTPi/1qUi797XuoBe1/ged2u2Up/NrurEakQ
 qveyNCGrNcHDOFr++I8SJ9pm/MZjjYPucqRgj1XshCoFkDBozd05qspQnVyVBw4sZfsp
 2jdTaeAI2qByWaUysGebQr845ddFdANSKgO3soSSdcWG33biSrSYVOHxnpKaTZBMegf8
 EoAangXxLBRu40+5zFYxuDFhpKOmBDumWIUxO6tBAwO9MSqfiaqSYXOv7UNiHPVQxCq2
 dLe0RC/i7MjlE9sAU4V6Yyl2F4Kn58JtIt/QzyHR0LU3Nf4ByhUkw3cqN7IyA/3tSXSI
 J+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LDkOBzD1NeiyCs7398uvnovIqEumzOK3cJlInlmNTUU=;
 b=2MrQsR/1wM4I9oTnOhS/Ys/u98M842tzoFF/r9E0BfX0JUQaYi3Hn1wlC+ixXmbjGM
 uURLxcAr2NCpCc0v8C26/o3U21b8OOo1YBJ4xKwndWD2RqLOpCk3imaGwks20KswCIO6
 w7PiC6ZFEJ0DMyQFYHIU7IFWnwjNwDGuFIM+IVkTMwMyjPUjzlE0gE0+uGK+fqt702Sa
 CVB1WJT4SVCdH2Eazi6dxmuJnX/Y0l7bAXj81NQTrgIi2h5kLtwQCHcoRImdy6bb8fMC
 Nfq65d5CI2+Ypu4IVA+JgLY1qHKb0uJqr03iLGrTURUXQROIaitg8uSS6ix4e/FN3E7f
 RK7w==
X-Gm-Message-State: AOAM532eMKAA4QJLv7DdiOOZ1CNc7bQ5O92brT6tYQcjIIIZo0cOkgeA
 7OmFPDRPRXEa9M4WCSEA+dxNGK9zMtE=
X-Google-Smtp-Source: ABdhPJxQBe2YTtpO3EXRljjxlwtdkyTUyYf2pLXDZ7SqYnPZm/Qt+8LRSbGWQ6EWfxki+pMtbSRijQ==
X-Received: by 2002:a5d:4487:0:b0:1f1:232b:794f with SMTP id
 j7-20020a5d4487000000b001f1232b794fmr5359525wrq.715.1646571671990; 
 Sun, 06 Mar 2022 05:01:11 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 z2-20020a056000110200b001e7140ddb44sm8901714wrw.49.2022.03.06.05.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:01:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/33] softmmu/physmem: Remove unnecessary include
Date: Sun,  6 Mar 2022 13:59:40 +0100
Message-Id: <20220306130000.8104-14-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220207075426.81934-14-f4bug@amsat.org>
---
 softmmu/physmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index cf6b2b48995..364d563ee42 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -61,7 +61,6 @@
 
 #include "exec/memory-internal.h"
 #include "exec/ram_addr.h"
-#include "exec/log.h"
 
 #include "qemu/pmem.h"
 
-- 
2.35.1


