Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0343B41DB80
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 15:51:49 +0200 (CEST)
Received: from localhost ([::1]:47362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVwTU-00071B-26
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 09:51:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVwBO-00086O-1x
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:33:11 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:36844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVwBL-0005DK-Fy
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 09:33:05 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h15so8490526wrc.3
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 06:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JqmlKLizONgEjnZPec0fBTavTsjsC4JPAMjk8DVQkD4=;
 b=FP8m6tuNWkZ2fZZvaBSI+T2m0Gj0i8oXKLmMKcaoVf+QgoW64zEhPw/yaKPBhdevAW
 eXjAg6pe5vb+N50B8YkoPjf5b+axgQjt/EY/I6wB9k1iN70tur6IgfRezu9sjE59tRF7
 eEG9cDrFh0ywG/sjPHxNFG+l813TQjS5WyC9bw+4zgOCeSlp4JvbCMq4wm7C0e3oyL8u
 xyN7ohPcZ8VORij4CcHNm8k3miMLl1jth2KPev0au3ciYsI4EM4Z0Rh866ytzaiDCZ2n
 IFpZNtbGc5n8ZCR+NilNQVGuzLX+sEAH8idBWCbQTu6BxlMIotaJvDiG8hhGTkaeWlNb
 qL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JqmlKLizONgEjnZPec0fBTavTsjsC4JPAMjk8DVQkD4=;
 b=FUA0376zSokDlvMd9PqaCuizVlqI1Os8/oKhaEIc5n7CQ+3Fl96Resp/2u3Rk65DSQ
 d0MtvmU31r9gU23vTyQ6BkN5pVluC3+kOQYqjIa1Q+CNek2BHHbHzksEP2bMHBc2gWg7
 NNNQOzqzNbfBNqBl6GGm5Vq//M5jBUAUyMO5tSp1sye0EG7v44Is1s232OZd+qLyUEJs
 ifK/WwmrL3FICkhIRhxhr8by0E9pxzSwSyt36RJNEh2L4vpYw/iAbSEw3JFsE+bBmxTH
 UN/cMzS8scRH2o5zIVXWhxoHHc/znG+yfF5JuL67vngLbXvzzGrZ3ZA+gm+8JP4hpsYB
 HmHg==
X-Gm-Message-State: AOAM5300AD/ktaok+oQGGv/N1NXl1P6UpNtJGtjDk39B9BSQxthVH3MR
 j1HCkaN+70xPj5kBR8FXHy0vZlCDgps=
X-Google-Smtp-Source: ABdhPJy2l5nbFCFJtTPW+Tm1m38HvuHtlYm5MZkhmhb4SrLi4l6MJlvIr117KNxSX5qyChudX5pKkg==
X-Received: by 2002:a5d:6292:: with SMTP id k18mr6276234wru.110.1633008779878; 
 Thu, 30 Sep 2021 06:32:59 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c4sm3037168wrt.23.2021.09.30.06.32.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 06:32:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] docs: name included files ".rst.inc"
Date: Thu, 30 Sep 2021 15:32:44 +0200
Message-Id: <20210930133250.181156-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210930133250.181156-1-pbonzini@redhat.com>
References: <20210930133250.181156-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/{ci-definitions.rst => ci-definitions.rst.inc} | 0
 docs/devel/{ci-jobs.rst => ci-jobs.rst.inc}               | 0
 docs/devel/{ci-runners.rst => ci-runners.rst.inc}         | 0
 docs/devel/ci.rst                                         | 6 +++---
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename docs/devel/{ci-definitions.rst => ci-definitions.rst.inc} (100%)
 rename docs/devel/{ci-jobs.rst => ci-jobs.rst.inc} (100%)
 rename docs/devel/{ci-runners.rst => ci-runners.rst.inc} (100%)

diff --git a/docs/devel/ci-definitions.rst b/docs/devel/ci-definitions.rst.inc
similarity index 100%
rename from docs/devel/ci-definitions.rst
rename to docs/devel/ci-definitions.rst.inc
diff --git a/docs/devel/ci-jobs.rst b/docs/devel/ci-jobs.rst.inc
similarity index 100%
rename from docs/devel/ci-jobs.rst
rename to docs/devel/ci-jobs.rst.inc
diff --git a/docs/devel/ci-runners.rst b/docs/devel/ci-runners.rst.inc
similarity index 100%
rename from docs/devel/ci-runners.rst
rename to docs/devel/ci-runners.rst.inc
diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
index 8d95247188..d106610096 100644
--- a/docs/devel/ci.rst
+++ b/docs/devel/ci.rst
@@ -8,6 +8,6 @@ found at::
 
    https://wiki.qemu.org/Testing/CI
 
-.. include:: ci-definitions.rst
-.. include:: ci-jobs.rst
-.. include:: ci-runners.rst
+.. include:: ci-definitions.rst.inc
+.. include:: ci-jobs.rst.inc
+.. include:: ci-runners.rst.inc
-- 
2.31.1



