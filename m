Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B9741F15B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:38:36 +0200 (CEST)
Received: from localhost ([::1]:46050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKcN-0005dr-5g
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXx-0006Tl-6B
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:34:01 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:39427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXp-0007eX-CU
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:34:00 -0400
Received: by mail-qk1-x735.google.com with SMTP id f130so9503421qke.6
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=unOqLzAPd6poy21NosqfBpvujG84W8QKJdncOwMlFts=;
 b=XMDSSMcTds/NDUiSONIDw+OjL8I5PWKMfrVbDQN+35fiyW1d63n+5QkTPLAGnk24lV
 2G0w8GQIB5meuGSFfVOzK8Jq/q8yOR5ekWgHBjHWAdhoyUbFvnUKYv+P6RyZz+wlwMh8
 OarvrZe+oeKtdOJCrKFuiTiHdBGpR/4ccvGnwGGRr9KpfenpQ2rFNvFHaex23Fq+SffK
 kjJ8HG81scG3QplEWgQUnem/QRBvahuuj+qFC5NoD2qkjne+mpVG78lgiOitkoac1+TX
 5n04tWhDDxMSfcpEqJX16/C4Gup+d7N79ubjiQmBeaPciG1DdT5gxX1sMXVPrcqJ8+w/
 +xkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=unOqLzAPd6poy21NosqfBpvujG84W8QKJdncOwMlFts=;
 b=qbFcJOQq0D+kUmfwXKbxhOuCxDWw/NzJ+oO+0nujIS06gFHs309TL7CG4PMVXWAqKK
 33/0ctNed0emqp2tWlebCYdUx8zXsMFlaEcyol9RthNjA0v7i7+JvvNhC6EPNxGgob4+
 dy45yhHIMCyWb2wJV4G3hDYi5PUeMDBy0RhO+UVOOKIvAJGA5vFbbIwm9Vou9TD34R5u
 9poDkDDWNYZrsw/ijsgF9JDpOsv1B6GKnCFCjSZlzYAhtSWrF2vRvUvumXHK2L/OtJuc
 EdF9a7N7ZyX2UC5TsIqTvhSgBOKr4xMocSCVIowuQeM71E/Pp1nsrKfRiU7s3X5BIYzs
 CV0g==
X-Gm-Message-State: AOAM533Cv4F2u9n0oSOIuplCj+YfHON8+CwudZKWAKP0MyA2gEBtXdfD
 30EXp/tkT6eNMd74HwoP2+c7hY8b3tf0rw==
X-Google-Smtp-Source: ABdhPJxf7bIpk0U68G/HNqw6MVlB+bjt1P8EpCPMhkSLHjwyGqD0+hX7YZg/Wwrt/YClbYYzjxFwaQ==
X-Received: by 2002:a37:9606:: with SMTP id y6mr10103269qkd.13.1633102431417; 
 Fri, 01 Oct 2021 08:33:51 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id x8sm3484823qtv.5.2021.10.01.08.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:33:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] tests/docker: Remove fedora-i386-cross from
 DOCKER_PARTIAL_IMAGES
Date: Fri,  1 Oct 2021 11:33:38 -0400
Message-Id: <20211001153347.1736014-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001153347.1736014-1-richard.henderson@linaro.org>
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marex@denx.de, Thomas Huth <thuth@redhat.com>, crwulff@gmail.com,
 alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The image was upgraded to a full image in ee381b7fe146.
This makes it possible to use docker-test@image syntax
with this container.

Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index ff5d732889..0806c6f726 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -184,7 +184,7 @@ DOCKER_PARTIAL_IMAGES += debian-riscv64-cross
 DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
-DOCKER_PARTIAL_IMAGES += fedora-i386-cross fedora-cris-cross
+DOCKER_PARTIAL_IMAGES += fedora-cris-cross
 
 # Rules for building linux-user powered images
 #
-- 
2.25.1


