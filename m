Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D0F424169
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:34:11 +0200 (CEST)
Received: from localhost ([::1]:57220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY8vq-0007Xq-3t
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8iT-0002Ei-QR
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:21 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:43800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8iP-0007at-Dn
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:21 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so2579922pji.2
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yfk7/LM5fsvrxl2pvJxKKnvgZ7wOe6YBjzHiaWZN81A=;
 b=l7j54CRuDHIQpdG5+8S2CXySwM1cbEEA2QtHWcJ3l36h6Xd2QfI+2+ulSqxzSRYm6n
 Ub41hpdaUrM+k3uCXNxh4fDyROdavXyBI0K5BWbFEVznRtseiSr1Ne++EXRTCQArjP3U
 FpG4nSpghOB3LJE53zYFmhvEAdGYG2g4lBvzN4yX4Pwi+KDoHchrSDL+BIwCDscpRC1O
 yPGUTi1OEqcDU4VxHxu3HQU2siqqbbuIeZH+msBx3wzeEjuLQgOXZEAAC+VZdZHgshhl
 ygir6onneWia5hbQAvIM3lGKlQ1ZFhtn42LqlXQ0w1BCeIuhUDeWjtirQzBl+6YAlAir
 BkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yfk7/LM5fsvrxl2pvJxKKnvgZ7wOe6YBjzHiaWZN81A=;
 b=66JroQqCGj60ZyPofXDsqtEQ5HSbLSwRE0aiUQuWujMloxNULdLp5razNnGF0CuwqQ
 fBBiXdERnJS5zgDTEYBDKMiw26Kc9Cz3ReFIsl3CSTaxE64KDNdWCZUdMUBpsifvZjRN
 PDv+WX3vro4zdCFKSt3EhuULiuBUdhdHuxia2uBa+begWoFRXxCKHVcmfyg+4bDa8Lh5
 l3E7G7yfioheE1wiMBFsR9ykLDctTRLvfDNxmLGT6XMeVG8bHIoWijBLJ3iZbPeiWQt2
 vlhs30BuQ93ozj/DExT9urngdw5GlVa9NLFHB8310aZMsP4LPmPbEsgsOImO4casUPiV
 V7bQ==
X-Gm-Message-State: AOAM531hVdqW9W4QutyY8Ug6lClwlkrPaHULECdKEIBZeWEKtRpp12AW
 ocQqPcT5w3CoOwXo5AVbyIz/XSBzuLxS8g==
X-Google-Smtp-Source: ABdhPJzyA4XWC4/xF1dETfW+vtaLk2Jk1lW0w1jq41joWE8/NpBhxh9H/uBcgXADGKM4j1ahumS/+w==
X-Received: by 2002:a17:90a:d58b:: with SMTP id
 v11mr11577448pju.207.1633533616030; 
 Wed, 06 Oct 2021 08:20:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/28] tests/docker: Remove fedora-i386-cross from
 DOCKER_PARTIAL_IMAGES
Date: Wed,  6 Oct 2021 08:19:47 -0700
Message-Id: <20211006152014.741026-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The image was upgraded to a full image in ee381b7fe146.
This makes it possible to use docker-test@image syntax
with this container.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210930163636.721311-2-richard.henderson@linaro.org>
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


