Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A515A1546
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 17:10:34 +0200 (CEST)
Received: from localhost ([::1]:56024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oREV7-00013E-LV
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 11:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRERq-0003uL-1k
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:07:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:40600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oRERo-0002Ln-Bs
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:07:09 -0400
Received: by mail-wr1-x42c.google.com with SMTP id h5so24198134wru.7
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 08:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=+xZTakyk5u2TBFgliT7wIbbLXV3Gbp3ddv6mrgYQohs=;
 b=ZYSk01CxiLczD40wouVLJecG1AXCSnlnXRuxq56S2aqpt0Z9D2Vai4fbTZAQjfkc4m
 Ikeog7nuHmb2V+ffoZZlcsFMHgEBfRqZmW9QsAoyH0WE8ANy+I4EYWKQrVgB7vr+MiZU
 W5VRgrMUEWxzAfZAXLmzlax0FNpM/lqoVjdvWNuNHTUbedp3EgAMCs9IKnh87Zi16/Ba
 x0LTjHJJlZbYD286cct//l3eYRKGUQiIqhYGdXImFGqNl3O79sOCIrM/ceCLL2gpt5+/
 +nqHlMp+K4reBvPsd11KAoAX3zLVONYSwo9JkhMN4bnnI/v8LCbWHD8oSEhXg0kt7IWo
 fNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=+xZTakyk5u2TBFgliT7wIbbLXV3Gbp3ddv6mrgYQohs=;
 b=e2ZE1/JsAnp6uwsGr//788NZnPWW1aMyzifiosM463RD2qAn2V0C1niLiJkiak3ucV
 dR7xKzaqFhXj1mlG9i5ojNmZOJ5LP75s7UY6DVL2cyY9uzOufaolRY7qQP8Xi9wGa1o+
 wZBhf+xDRCnFyE+t4mjuUKFVyuCejwMsvtne53eVOFunYuWIoZ+EWKxASC3v34KnXnK3
 bxyGcLEgdcPLyopFgvUd93mZCyyuQ7N0f2jDXPsV7aVh5E+2nImCvGq/ClRiOApqX9HU
 5Xstp3ecMHOTEUb0Kqmxpu+WWZYnjTxX7QVvfikwFGr9EFakCQ0Pg3L2m50l0PeY63GG
 zAzA==
X-Gm-Message-State: ACgBeo1HD0V6PkyYicHtBsnlek02WRZRxpKOOZPUGc2zCNOpJvNrxqcG
 2xsDufFCJAByCwUcOIjsqopDIiiBXiN3cw==
X-Google-Smtp-Source: AA6agR7hPgLBSPl0sRglyQyWg60jUhB2k+LtN7ngDRsHA/dE4jqxX5UN67KapAyReHhtSkjPQj+FYg==
X-Received: by 2002:a5d:6881:0:b0:225:28cb:332f with SMTP id
 h1-20020a5d6881000000b0022528cb332fmr2582713wru.405.1661440026902; 
 Thu, 25 Aug 2022 08:07:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bo20-20020a056000069400b0022585f6679dsm1064638wrb.106.2022.08.25.08.07.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 08:07:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] configure: Remove unused python_version variable
Date: Thu, 25 Aug 2022 16:06:57 +0100
Message-Id: <20220825150703.4074125-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220825150703.4074125-1-peter.maydell@linaro.org>
References: <20220825150703.4074125-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Shellcheck correctly reports that we set python_version and never use
it.  This is a leftover from commit f9332757898a7: we used to use
python_version purely to as part of the summary information printed
at the end of a configure run, and that commit changed to printing
the information from meson (which looks up the python version
itself). Remove the unused variable.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/configure b/configure
index 72ab03f11aa..efe28050234 100755
--- a/configure
+++ b/configure
@@ -1112,9 +1112,6 @@ if ! $python -c 'import sys; sys.exit(sys.version_info < (3,6))'; then
       "Use --python=/path/to/python to specify a supported Python."
 fi
 
-# Preserve python version since some functionality is dependent on it
-python_version=$($python -c 'import sys; print("%d.%d.%d" % (sys.version_info[0], sys.version_info[1], sys.version_info[2]))' 2>/dev/null)
-
 # Suppress writing compiled files
 python="$python -B"
 
-- 
2.25.1


