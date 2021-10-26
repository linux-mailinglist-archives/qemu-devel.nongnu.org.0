Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0698643B030
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:37:57 +0200 (CEST)
Received: from localhost ([::1]:36828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJq8-0007q6-3Z
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJi7-0002PH-D0
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:39 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:46865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJi5-0004go-1B
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:39 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 83-20020a1c0456000000b0032cb02544aaso1673071wme.5
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VUz4ckBv/GqIzKgsmaqHJwpXTQ79XI8nAJO1iVIQRSo=;
 b=H/L+fXrOYjTZHjYt5DYE2zhmJTOC88xZhr1LkFTrOqR+igpEMDxYM1N/LOzx7zf1Jp
 xKr6h3ZtNnM/IgAlx0DURoMg8XaOnzPIcHDje+xBwoVO7p2B0/ue9uFze0gBSzIyO1JX
 T8WrE5heK0bOfUHD2SBbmj1g4O+Y50ThlTZcNmqWRD5Np1rXj5AJd1iUXJa4HDx5zxUu
 t8R8xvxNM2H9mpT0irPIWgRQSwBHI6bEsQMWy19OcvK83oaDZf+i2wFFFpKC5e3A/7BQ
 FJadg7p6J7QaV1NRPZxw6PiV+j92bZizDSFz9iBPZHO8BC16Cs4KNDSmPXS666/D3dxi
 Vt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VUz4ckBv/GqIzKgsmaqHJwpXTQ79XI8nAJO1iVIQRSo=;
 b=4gA3+KknPPMsoG46jHCY3p7VKtRsH5jjrrXnl/XxI4SfL0vLCz8SGQZw4ih+20RpUx
 6L3x7lhW3U8wYYPAq+dgjnmvlOAK1pU8Nx08+IgsXl0VAYD03z/MfQM3jKUZD7Ov58FU
 wgA9jEGK9nuATeAmwKe5PLlMOuvBt80Ld9bHKOWtM6pMngK0NoenB8W/v3UaHT1aZmlg
 YHvuG19f0JEm1VkITDw3ZgD5iuEoank+UlcZs0IvzKqBc/g/8hes37Yyd+CTSWRwuLbo
 TmXmNvrKxJg7ujffdhv2tF+UzJPJgpp8NSW0TTcRJ7JQtsLxpYFVRV40SgiNnh15rrtV
 sdPw==
X-Gm-Message-State: AOAM53265nLC0eL4o37M6DOquP8MHOjNwPdcuahj8NF0B5Z+XTCJaHvA
 Y9fAtdd4rc85GTX3rRUoSEy1xUuE4h+FQw==
X-Google-Smtp-Source: ABdhPJxTSqwglW6Fv/dOKQ60gwK9CKH0xgTzPYtuwyuBtrBRGmYR0kSp1ApxriKCZAf1dacJB0oEVw==
X-Received: by 2002:a05:600c:1c88:: with SMTP id
 k8mr26361662wms.169.1635244175670; 
 Tue, 26 Oct 2021 03:29:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k17sm18459965wrq.7.2021.10.26.03.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:29:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4BC231FFBD;
 Tue, 26 Oct 2021 11:22:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 27/28] tests/tcg: remove duplicate EXTRA_RUNS
Date: Tue, 26 Oct 2021 11:22:33 +0100
Message-Id: <20211026102234.3961636-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We set it bellow outside the #if leg.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/Makefile.target | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 6ccb592aac..c0d9e638e9 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -61,8 +61,6 @@ run-gdbstub-sha1: sha1
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/sha1.py, \
 	"basic gdbstub support")
 
-EXTRA_RUNS += run-gdbstub-sha1
-
 run-gdbstub-qxfer-auxv-read: sha1
 	$(call run-test, $@, $(GDB_SCRIPT) \
 		--gdb $(HAVE_GDB_BIN) \
-- 
2.30.2


