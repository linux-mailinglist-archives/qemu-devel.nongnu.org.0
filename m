Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291082950DB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 18:36:55 +0200 (CEST)
Received: from localhost ([::1]:52224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVH6c-0003Yp-3W
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 12:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kVH1f-0006PH-0S
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 12:31:51 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:36461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kVH1a-0005ZL-Cz
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 12:31:45 -0400
Received: by mail-wm1-x336.google.com with SMTP id e2so3273768wme.1
 for <qemu-devel@nongnu.org>; Wed, 21 Oct 2020 09:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VrZUZkv35Dha4FHPQGQWHNzIubpKTuDYGlJUzJ91zDI=;
 b=R9q8SPlE8BohN0qxEbt2d2Q1HhxwYRUaj+cNYM/YhRA9oNp1LlsryQeMdgDkJwoKj/
 HKXniPxBUEZNemIHYkGys5xHgHcTNzdxRcyo/8WEh6Bud3h7eGwnnD7mg5/BBu8r4Kcm
 JZgwJ1e8zm6pbiU6p1S1cqrrsw8+P3HXAxQUaSpbYvACcu3kxDOsevguQRrhIs9sqmAE
 JdVJBQJpxzwQFXKr5W8rWDrav9E6PfQaKxE7oAikHVTvAw7xosdVF95HlRZLn2n3xj0Y
 tLv928MPqG/HcwJsem2zWdOGq9cRQWO01yabI1KF83Xd3WNAvaXTZkGvyo1oOnjzfqyR
 Fk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VrZUZkv35Dha4FHPQGQWHNzIubpKTuDYGlJUzJ91zDI=;
 b=FHONu0GuABprs4YKN89UieHUaAcVb0sxCdchrOTzwNMHlR2mHXvXzGfQVXtSYcaSbA
 BMwk6yc1Ogu8NBZblXS3JEj080tC+4JCg3x6W6CB9HlIApntCjW97JgkB/Ea9rblrsCs
 CYPjQeSNDNMBofoJli4x2/E+DMwMJjH9RC709iYl0iWjpW7+T8bmJQjhnl5qzSt//FqA
 JDoSuR0Y56pTqRfvdwUUMTQhLS8X7Z7pSBIYReE3i7XAQEoAKefoSf+P2uJn88hE/qYD
 +Mosjycy5SK+UGLmeNS095PH7a0PJ6H9UwHVdvVF5Yd4YNfnKK5YXOGz1NQnC4mMranX
 fMbA==
X-Gm-Message-State: AOAM531DX3RtwETBKfwMy45X5egoPP3L3pcsWViyqQZFGXyBhOrcvVUc
 JQCebBC93b1b5BERMWLb/iiojQ==
X-Google-Smtp-Source: ABdhPJxRV755wWKo1hUGPX8hozb2+HqPI+IpGSn1LAiaTOB42EqBSapRgMJVNx58br6V1ZDlPz351A==
X-Received: by 2002:a1c:7c1a:: with SMTP id x26mr4514569wmc.4.1603297900372;
 Wed, 21 Oct 2020 09:31:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 71sm4749594wrm.20.2020.10.21.09.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 09:31:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E36A21FF87;
 Wed, 21 Oct 2020 17:31:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 1/6] Adding ani's email as an individual contributor
Date: Wed, 21 Oct 2020 17:31:31 +0100
Message-Id: <20201021163136.27324-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201021163136.27324-1-alex.bennee@linaro.org>
References: <20201021163136.27324-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

Ani is an individual contributor into qemu project. Adding my email into the
correct file to reflect so.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201007161940.1478-1-ani@anisinha.ca>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/gitdm/group-map-individuals | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index 641169fa63..d135f4b143 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -23,3 +23,4 @@ vr_qemu@t-online.de
 nieklinnenbank@gmail.com
 devnexen@gmail.com
 pauldzim@gmail.com
+ani@anisinha.ca
-- 
2.20.1


