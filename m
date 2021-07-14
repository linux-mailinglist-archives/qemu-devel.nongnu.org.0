Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBE33C8B12
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:38:07 +0200 (CEST)
Received: from localhost ([::1]:59052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jlm-0001Ff-3f
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jcJ-000318-Br
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:28:19 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jcH-0006gJ-RC
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:28:19 -0400
Received: by mail-wr1-x433.google.com with SMTP id a13so4361160wrf.10
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wUpWSwOJThxopK1mUIFhF7OpmRcKS2iKsTIsbGjr5H8=;
 b=Ny8lgAScomPx2rvow/cAgVIVbQVHagNdaibQkvDBdB2JbEUokwEA9LPihF0OZnkEWl
 0DwhEtksbhsOnV5Bp6X9Kj53EHJoV/T4vyKHq9BEuAgJJuhzzoloOEYRLzehMTeUgQsd
 sUTCzdeJPVER9Z8VsctNj0rChh/A5yiUXKr60r0LS08wMuR92pPjZ2JG/qxHlrTY7Axn
 t4DsxMeUsaHIRqtrBO99mXPtr4jiZ90S2ndFvvuD6pNT1DNZ4RVo8VupWVxYwZCZjpwt
 BuT/pNZaLW8IWaga6atHycgplUYPetZsArmQYaIKwxOB+Y4ORvwf1wSLzi0kz9pQAOgW
 dgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wUpWSwOJThxopK1mUIFhF7OpmRcKS2iKsTIsbGjr5H8=;
 b=QaaHDD0+ziKqCNqAT040JpbZwSIlO9qy2o8JRemHtkK2fGaTWgRFHa0PR70u7jP+AI
 DdOV7zeAh8JbRob3Lv7y+bmOJii+nR9LT+mMmazSln0F2vtmt1RNcWK6wMaxRW+EFXt7
 4N+O0ioNeT8oM99vPTPfsS1vv0DjLS8ODgiVkv0GpsVVXeG1HQrqXhEGYLqTY21Pn0r7
 RpsYEx1UAFVhyTx8ZWOFEcRXrm9vRRmC72e63skRzYvuIEtTu5JPFrniwpf6/BKazDKg
 Mv0mM3Q0XN1MfLmpIWY425/06KiJT76DEd88StsKPIbPXShEegPZ15Vsy9INS38C/8Ms
 NyQQ==
X-Gm-Message-State: AOAM533y/usQ5kTCXU7Vlf/IBEbvAx4qAJOcSVb07HwdPzUEXK50w9QW
 6LZD5zpVUgmfYmJUCBs0/i8Ndg==
X-Google-Smtp-Source: ABdhPJzCO5dIxvWSjh510ttLyadeT/ggUPbopO0/qc2IiqMIMMEOyK+Hmg8ah1on7+xtehumqHrYPA==
X-Received: by 2002:adf:f54e:: with SMTP id j14mr14511783wrp.91.1626287296594; 
 Wed, 14 Jul 2021 11:28:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s24sm4023070wra.33.2021.07.14.11.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:28:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 278831FF9F;
 Wed, 14 Jul 2021 19:20:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 16/21] contrib/gitdm: add domain-map for Syrmia
Date: Wed, 14 Jul 2021 19:20:51 +0100
Message-Id: <20210714182056.25888-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Filip Bozuta <Filip.Bozuta@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have multiple engineers contributing from this domain.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Filip Bozuta <Filip.Bozuta@syrmia.com>
Cc: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>
Message-Id: <20210714093638.21077-17-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index bada5384dd..0b0cd9feee 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -34,6 +34,7 @@ siemens.com     Siemens
 sifive.com      SiFive
 suse.com        SUSE
 suse.de         SUSE
+syrmia.com      Syrmia
 virtuozzo.com   Virtuozzo
 wdc.com         Western Digital
 windriver.com   Wind River
-- 
2.20.1


