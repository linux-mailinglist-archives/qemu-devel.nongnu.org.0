Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7C13C825B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 12:03:45 +0200 (CEST)
Received: from localhost ([::1]:44686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bk0-0006gj-UP
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 06:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bZn-0005H5-J2
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:53:12 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:33579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bZl-0006dQ-QG
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:53:11 -0400
Received: by mail-wr1-x432.google.com with SMTP id d2so2514962wrn.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X8T4PtRFdtaY06IZK3sz9mBtVF7NeBTX8I+sA2XF8rw=;
 b=khIJxm9ftqU2vCmkhoVMOM9uTkDd/DLtDtyoUx2zBOT0mY/6Lg6oZiMwnxsNTUWW+R
 QqPky7YYKKq6uYJwkWsrB1wDh+UzG0ggPFBUOYR2KrpY29Wf9IDnF+lC5A1/I7s30pO/
 fmJz3gR0TLA9zfBUn1lucr761fv7maLEt3p2zqXCPjIFmBRsjn8CAPBicm5lj4W8kObp
 IyuEuL4q5OH/tHA+HCebHlOmPDXh24bKPx8E5SR+iaLBHRLMY+uC9S5cUs89J3Szf9BX
 iX8zJ7KQGSySdLetEUGYzQEmDmXNKnsKnnk7RyEdiSohocGAVQ9xdoz/Btd4G2RWr1qD
 9jrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X8T4PtRFdtaY06IZK3sz9mBtVF7NeBTX8I+sA2XF8rw=;
 b=IBQLk3VHe+TM8ZxHOkLErpVsid/U5ocQriel5xoKD4Fwz6iEWDlaz5XHUEGg/TxQ9B
 JjTsWKOSOrPfmz7vse7QadXuVuVg67Z+Jqpt0xJTafZg2X+GMld6u88lJri0yG8xLE5l
 TVb85joFlOctv52OoImhbe/h/YEV37lvjfj8c9owKbf66oFKBVCDRzQHS3AYc9DzSLyt
 u2Rz+SNi89Ohgzler9w3afBdUJSdj5v9SKINWctI+/8Jfu2/jBEPXWNbD38bQ8byvI5J
 D0ho1o02q3mi83WVu2TdrRC+0E9DrUtiEmMhd+99YoxATknPKC4JTo+RoB9Rx4JSbiPO
 CRxw==
X-Gm-Message-State: AOAM5324ymONIeShybDu4Z9nQMAoim/aYDbE35m758KPT018iZA7P4nb
 1HfEkau7P+civjms/E/wS0rXmw==
X-Google-Smtp-Source: ABdhPJzq9Of4jHLmPLqcskTquV2nw0swQCKfGoqHMdzF++QP6DF6U6UHzIlZAk3lAh4qJdOmYE0UIA==
X-Received: by 2002:a5d:5606:: with SMTP id l6mr11699469wrv.190.1626256387802; 
 Wed, 14 Jul 2021 02:53:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t15sm1920818wrx.17.2021.07.14.02.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:53:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7926F1FFA5;
 Wed, 14 Jul 2021 10:36:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 17/21] contrib/gitdm: add domain-map for NVIDIA
Date: Wed, 14 Jul 2021 10:36:34 +0100
Message-Id: <20210714093638.21077-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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


