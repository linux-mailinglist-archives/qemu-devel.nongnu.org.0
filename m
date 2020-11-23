Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 561952C052B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 13:03:14 +0100 (CET)
Received: from localhost ([::1]:51078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAYp-0005gg-Su
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 07:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFv-0004oj-Mw
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:39 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:55932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFu-0002mD-04
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:39 -0500
Received: by mail-wm1-x331.google.com with SMTP id c9so17598145wml.5
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8rmCexmX2rKP27lv67f6uspA1xJ7m9Vudt4rESRW2Vg=;
 b=bYlUI/ukQGngsh1wt97hXYKLWN2pCkY3jbVr+CLe7S4FhkzPW6qIY1kShvsCNV+A5r
 strivO5M8Ya6+JMtjW3OTvTOxMCHljK4rRqR+6wuP9NjDl7LPNhk8gG7kpnq+PjRAS9I
 g3W8Uo3r4YoC5v07xq26n8ZeZ6g/o6qFCziB0ZHrWO5i0+MjOrHrgzQmo/ZGZNQ9aOQG
 SpSdCpv9TkFvEkz1gmrIh1jMhFSRuzLfUCODxe3RD07u2IhBKXkjqul0qPp6BTv4blUz
 hQRk0NlBSSb3YF3ZtAg10MeSrOkLx/H4hHkPkFVyqgjo7FCO5yRrro8m5plQzXYqywBy
 BvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8rmCexmX2rKP27lv67f6uspA1xJ7m9Vudt4rESRW2Vg=;
 b=temNtejxQBap7dMDvH0+3zoZob6lBUjgy5N7bc4+61dDKR8gxs7zKkedYDTywhigV4
 jTZ6ufZrSyPwq0rAzVztqTZXtrYsLNt22bxteWzM9uGMnZgW816zo0kVi0CtNxwpGdJD
 4RzT/hWdoh+sbk+2i1lyycZ1wlG/GwvjV2xh5960Hm+FEqUj9LraqFToRODxrvN5jfF4
 8bbIBbNx9Ufb6mOfFsC58fiKLxBmdBXL8CrTrtQfsBAVTxcqX3vT+RH9XhtWz7MghXUL
 L4srylshg9nG84m+3sp1nZjo4TwdiOcU4aBiLIl5fJo+5mmPgn8QtR4/b/4oFP08WQAO
 8ulg==
X-Gm-Message-State: AOAM532Y89J3iJVXtAFhDCybVIIpZlfgtRuxKSuJTsRPABwTglNuLc43
 M83WaTfhbRWu7xMzNEuPRpMsIMLq1PYO9w==
X-Google-Smtp-Source: ABdhPJwd/x+gvkLllKG7x1wDsa9LPbBXfA8IANgiY+MpZAvZxPgXS8jG4aUCeonYhY/SFob1kRjtuQ==
X-Received: by 2002:a1c:790b:: with SMTP id l11mr24501195wme.53.1606131816342; 
 Mon, 23 Nov 2020 03:43:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/24] docs: Move cpu-hotplug.rst into the system manual
Date: Mon, 23 Nov 2020 11:43:08 +0000
Message-Id: <20201123114315.13372-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The cpu-hotplug.rst documentation is currently orphan and not
included in any manual; move it into the system manual.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/{ => system}/cpu-hotplug.rst | 0
 docs/system/index.rst             | 1 +
 2 files changed, 1 insertion(+)
 rename docs/{ => system}/cpu-hotplug.rst (100%)

diff --git a/docs/cpu-hotplug.rst b/docs/system/cpu-hotplug.rst
similarity index 100%
rename from docs/cpu-hotplug.rst
rename to docs/system/cpu-hotplug.rst
diff --git a/docs/system/index.rst b/docs/system/index.rst
index d0613cd5f72..0f0f6d2e99d 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -29,6 +29,7 @@ Contents:
    tls
    gdb
    managed-startup
+   cpu-hotplug
    targets
    security
    deprecated
-- 
2.20.1


