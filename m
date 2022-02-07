Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632034AB754
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:11:04 +0100 (CET)
Received: from localhost ([::1]:33492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH035-0000hr-E1
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:11:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyst-00062F-MF
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:29 -0500
Received: from [2a00:1450:4864:20::42a] (port=43788
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGysb-0002FP-FX
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:56:23 -0500
Received: by mail-wr1-x42a.google.com with SMTP id c19so8380696wrb.10
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b07+/0El+xESjB/OqqwkRUSwpK76kJG4x+JjfzXwDzk=;
 b=mVB2yohJTSNE4LWVYQrhuL5y8rsmciTTSMFgTD6J37QLNfQK79lihQcptS6xR1s1tJ
 HqmjmNCnRqK9wb9yKjGZR5+qXPOa1SGWNgf227AEuaOYbiAFeFwoHRb8ANC17eGRqYNL
 /DDdSud4nyB4QxvYwcLh/GMSOF2vEOfouu7R5zCpKCZEfWUlmiq5Z6XOg7QAt1B6JJ39
 70pdvkmJervlp0worwsjvHhwHZoltLj96ZDh3eOg9mSmiqC/DZlTAiMZUbuQ8sak8hE7
 HtnzTt+C/il7Nd/DVjRPb4SRt62htNYcX/RgixCHJ6X8TzMDS9wjcAB/8ZvSPewRInVy
 TAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=b07+/0El+xESjB/OqqwkRUSwpK76kJG4x+JjfzXwDzk=;
 b=8A3m4mzyYtNGgkoX1xyM2PY+tR9h9/89VwKxCU4iR2CTHlPCNVDcHJNsSn4EqL3A/s
 qhwJv9dt7nvvz55ZxXBvMRDDTaSsHhd85jdUFDEVsA57p2XN7FEjzVhpFNI10Cps/Z1S
 uARSQwOKH9aQro0VDRS+b3A/RQKkJGVxBtnAPlPQoM1MLy1za00Ega91Sqba+l4THWOm
 0X/MQdObwv2SrtxTrkPDOJfaWJu4EN3RhIBHEUsCmnstEYt4DvARl5CjRf5Rz+eKpksK
 tJzUmGUBpc+bNJ7GM1Y3BF4ys6fjfZConw0+9lJC8BWKu1ixWqvlGHg3tVb0qPJZt3n2
 E3Ww==
X-Gm-Message-State: AOAM530e4g85VtmCAylGI+JHnzr8S+qLzudkvjSFSCKMyUSnTZSJf+fR
 CAJcetNsHTiawIqCJfARYswuCgrzNYk=
X-Google-Smtp-Source: ABdhPJxhyZ3DXV7Aq1Wq3HNvjVxoNkCHDM66nAzJnncH1UBNE+pkq6nQ7skcEXIyb0VxgiasP+a35w==
X-Received: by 2002:a5d:4fc4:: with SMTP id h4mr2529295wrw.481.1644220536574; 
 Sun, 06 Feb 2022 23:55:36 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id n14sm9351469wri.75.2022.02.06.23.55.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:55:36 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 15/21] softmmu/cpu-timers: Remove unused 'exec/exec-all.h'
 header
Date: Mon,  7 Feb 2022 08:54:20 +0100
Message-Id: <20220207075426.81934-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/cpu-timers.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/softmmu/cpu-timers.c b/softmmu/cpu-timers.c
index 34ddfa02f1..204d946a17 100644
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
2.34.1


