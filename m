Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13193C8AFC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:34:34 +0200 (CEST)
Received: from localhost ([::1]:50948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jiL-0004B0-U8
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVZ-0004BU-MQ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:21 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:50726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVX-0002A6-TU
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:21 -0400
Received: by mail-wm1-x335.google.com with SMTP id l6so2210896wmq.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N2DtqjvFHn9zDh8Fuf7ubcsXK+LA1vRNOTRqEa7lRVY=;
 b=GHOGTiXlMv6T5yCVOii1O/7jbwpK20tF6Spsi6NlypgzG5ZHbQoKJb3azNYswCUbuv
 pyPimOLUJzmYdMW5SYDNKUGLehver0mGXAD+yYSuqvWLH8d5dWd2emRqy3GXUjUoOZVK
 oW08rRzcNOxZgpCgEsvLR4aj0772VFZ6Jzdu8O7EC3SoztMNaNryvanHNtPUQBu29a82
 qDdoRJuBKCnfzMVYbf8Z6oJajaHMQld//rOPYBFoM+S9Cd2k7qtNsiob6Wou4KRUNyJX
 aiGtsjzcwWkeoy8tc9Cq+i2cRHKakaGlbztnuUgODHK6+u2iqKd+TzxBMJo0PqV4MEir
 dwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N2DtqjvFHn9zDh8Fuf7ubcsXK+LA1vRNOTRqEa7lRVY=;
 b=OaKcxYmyLq4ZQCbwzZ5gnkra14L+v5ZvyZrLsxW3Hbs+i7hpXqbrTZ3wnvHbMB2l4B
 JTePYtrrlIZo8vqcb9qG351A36q/diRCf3MD4BGPqYswNl3LT+elKqRiPf1PlNWHC7zp
 Q8mei4hw3ZSvQPp1fhTNWpXPZh9VGURfJbqTQUzRlNOlDG3878YwgD4rRJWZscOJC9/L
 7a0IdZPENGDSMb7gk7YJgffOoeIIuPa0g3S8fq0KeokfEWbchZoND580VcHlT5vChLtb
 cXBMJNGrvWZexnPOzZOBFL2D+ZbqPss6m7H/2KQ9sCJvIeIF87+mgqy4Ek8fEoPNbeye
 Z7kQ==
X-Gm-Message-State: AOAM5332OCPE5C+T2gS23glZx4VhSaLozG6tbSPUjR3aWmlNFM63gjqU
 IrY9VfFIn6hYd3DS0eZ/XIMP+A==
X-Google-Smtp-Source: ABdhPJxzQriTd3g9j6TI6o5VTZmHYfAS8lGkFhOxoozECJntGtL35Tg/wkXQYpmY8xnBAwrGDw7Jgw==
X-Received: by 2002:a1c:2782:: with SMTP id n124mr5659100wmn.114.1626286878519; 
 Wed, 14 Jul 2021 11:21:18 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c15sm2796295wmr.28.2021.07.14.11.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:21:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3F1771FFA5;
 Wed, 14 Jul 2021 19:20:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 17/21] contrib/gitdm: add domain-map for NVIDIA
Date: Wed, 14 Jul 2021 19:20:52 +0100
Message-Id: <20210714182056.25888-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Kirti Wankhede <kwankhede@nvidia.com>
Cc: Yishai Hadas <yishaih@nvidia.com>
Message-Id: <20210714093638.21077-18-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 0b0cd9feee..329ff09029 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -24,6 +24,7 @@ microsoft.com   Microsoft
 mvista.com      MontaVista
 nokia.com       Nokia
 nuviainc.com    NUVIA
+nvidia.com      NVIDIA
 oracle.com      Oracle
 proxmox.com     Proxmox
 quicinc.com     Qualcomm Innovation Center
-- 
2.20.1


