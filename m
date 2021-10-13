Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CB242BB74
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:25:05 +0200 (CEST)
Received: from localhost ([::1]:60272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaVU-0003HD-D6
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEn-0002Hr-Et
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:49 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:42999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEh-0005jB-9G
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:49 -0400
Received: by mail-ed1-x529.google.com with SMTP id t16so7201982eds.9
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6VHmLLmXYeTvvAAKhJOvJbJzG0qMwqzai0Zg9brnVs8=;
 b=WblQnu2aF0ROY0sLjGQxN+HtaNt2iEZcW6Snv8c4aiZ2cC/s9xyddgnYUEojzllia7
 q42Zq80QYBo2PVXp7rvYtUpIVQ3Wk4Gkse8D16kNadUEXLa6m8j2Ruuh7aDhkJSftHuF
 Hf1Apo2ahdGoFFsYKxMEllSbOO05OX4idJNGQdoPNH7cfrYMUPV/FITLjF/7RqOXE2fs
 HG2Y1aRiQNZFP746klda5jmUbzY4fbU1pAjGpRvjczapCa8Sr0NUj6aiTLuShst2RLC2
 hnJdMyMdQ3gNM0M/jxyFNjapJRtB+H6eDy5AbxaxdDRV6mal9bpKGQp7B1MIGMYk4Yv6
 dbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6VHmLLmXYeTvvAAKhJOvJbJzG0qMwqzai0Zg9brnVs8=;
 b=CsKy3wrgwHq40FwBkNllyYc7X7YKPXbWKN4vMQGIkB8c85KZ9k2udW8XF+HVWTzTjB
 rUfe76I6vtWkHqm657ccthHe4cNglzMGHFGzy5UzYbR16WhAAdhtzUueLVZEZwytChPY
 sL2LGW5AGLvKqUTWXDIV8USUnFFYGh15KzQHC16Fz2vDZgivRyxWoJn19Pvlasbxpcwd
 qGExhYihleVjVQ2JVTK71Jygytby4FRPwhlujITvsy7QaflT5nAMlKbXtKwQ1r6LibvE
 UgdcfG++lARmXrbMY2yTZD/CWxuQGHkM26QUBAl03cq05BCSGzGgo8eP9QlZxmdsdfOI
 DtrQ==
X-Gm-Message-State: AOAM530r4VolJvU32yjfpHZf9qFpBCiyY19XpahI7lgNXvHdNMvzhFLU
 N6Lo5c1UKDCDFpW5sAUFnkafbL6Xp3g=
X-Google-Smtp-Source: ABdhPJxlJV+xMFwALfRb0qjiyrW5mn8ApI5+x3u9A5/gpVx4IwuODVbVW7jM1YOI/dtSGYcG/7Gn6w==
X-Received: by 2002:a50:da04:: with SMTP id z4mr7785725edj.52.1634116058977;
 Wed, 13 Oct 2021 02:07:38 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/40] target/i386/sev_i386.h: Remove unused headers
Date: Wed, 13 Oct 2021 11:07:01 +0200
Message-Id: <20211013090728.309365-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Declarations don't require these headers, remove them.

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211007161716.453984-9-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/sev-stub.c | 1 +
 target/i386/sev_i386.h | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/i386/sev-stub.c b/target/i386/sev-stub.c
index d8e6583171..408441768d 100644
--- a/target/i386/sev-stub.c
+++ b/target/i386/sev-stub.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "sev_i386.h"
 
 SevInfo *sev_get_info(void)
diff --git a/target/i386/sev_i386.h b/target/i386/sev_i386.h
index 2afe108069..9bf6cd1878 100644
--- a/target/i386/sev_i386.h
+++ b/target/i386/sev_i386.h
@@ -14,11 +14,7 @@
 #ifndef QEMU_SEV_I386_H
 #define QEMU_SEV_I386_H
 
-#include "qom/object.h"
-#include "qapi/error.h"
-#include "sysemu/kvm.h"
 #include "sysemu/sev.h"
-#include "qemu/error-report.h"
 #include "qapi/qapi-types-misc-target.h"
 
 #define SEV_POLICY_NODBG        0x1
-- 
2.31.1



