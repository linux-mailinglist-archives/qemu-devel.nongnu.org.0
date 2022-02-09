Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B78564AF6E2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 17:38:01 +0100 (CET)
Received: from localhost ([::1]:58230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHpyh-0004ij-US
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 11:37:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnu4-0000b0-UC
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:25:05 -0500
Received: from [2a00:1450:4864:20::42f] (port=43663
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnu3-0001Mn-Bw
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:25:04 -0500
Received: by mail-wr1-x42f.google.com with SMTP id i14so4307261wrc.10
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P2xvJFwBI9dmx9ZaaVbwVUHI6W0eJjWbWWEmT3FIFsI=;
 b=X1dSaV4oKNSpJiHTSnhpuPABlv+LpSGnzBkQ5EYXB3y0HH7N43hg27EaDgLJv+3bC/
 dXLYKnYd2Cx++a6iZTEHF2EWwMd4KOvGSbkkQP7K/YR3fUqXHltBpvjeXMuFs7PQys3m
 ozwif3jJWbOyjJYvseQj+C9wQh+Py7bpK5EpFUgFBZrVqdYUy7nns++UxexxUnqSPaFL
 NsbIVX0lvIziUoQaEWcwdACf1ZshDPUOFHY2h13LdhqzfguAl4toHGMBUXP+Z5sugt0i
 PbPAHkhln8k13c1PF9SSSEja1xmbCiaTRMYy8qApXnp5XKYGcHXf/Y/rbFvGLN3vAOQq
 djZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P2xvJFwBI9dmx9ZaaVbwVUHI6W0eJjWbWWEmT3FIFsI=;
 b=ZDnOEFM+RULNuAmZkM0HAngGghSyc165I1DDHCOIQa+sbUr98mUx1RukWJF9Ik1oO8
 YUePHKUjdmwDL3SXM1O/oL2gf15/En5jDEZDwEmo6ep17MNizgLg6UCpxO56rSaTNovY
 DF8zMoYOe/OW2b8ejWFzS5ELs7SK4+9FeOevN6fGSTb1LuPBy+TMODWVodBUBsTHzz6i
 vWHN1g8NFq+l0JdmiDEVeZ9XiNExdsAgi9hgw+gG6iPK/O54iu9lYDnyeqQtZJlatJIj
 MIGxjdiaxwa1vksGq7fD/6D0vFEZyCfd7zs5lzZTDrF9nr+eWWtjoDu/lpP2XFgH7CDH
 Aj3Q==
X-Gm-Message-State: AOAM531+zTuZyqKjzDtpwCh6Phd5DXjI+hDRf28wMG6UmGqPFZvR2717
 luT5e6S6VT0i35Q+0QXAsHieMw==
X-Google-Smtp-Source: ABdhPJzMeBeUG7QcwQwlZmokPM2COntuilzlW8H7swzTO1JredcLhrWllj3u0xIQYd6z3AeNSYtl5g==
X-Received: by 2002:adf:a39a:: with SMTP id l26mr2375433wrb.150.1644416701970; 
 Wed, 09 Feb 2022 06:25:01 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l10sm15774203wrz.20.2022.02.09.06.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:24:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D9B711FFD3;
 Wed,  9 Feb 2022 14:15:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 28/28] include/exec: fix softmmu version of TARGET_ABI_FMT_lx
Date: Wed,  9 Feb 2022 14:15:29 +0000
Message-Id: <20220209141529.3418384-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TARGET_ABI_FMT_lx isn't available for softmmu which causes confusion
when trying to print. As abi_ptr == target_ulong use its format string
instead.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index a878fd0105..da987fe8ad 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -121,7 +121,7 @@ static inline bool guest_range_valid_untagged(abi_ulong start, abi_ulong len)
 })
 #else
 typedef target_ulong abi_ptr;
-#define TARGET_ABI_FMT_ptr TARGET_ABI_FMT_lx
+#define TARGET_ABI_FMT_ptr TARGET_FMT_lx
 #endif
 
 uint32_t cpu_ldub_data(CPUArchState *env, abi_ptr ptr);
-- 
2.30.2


