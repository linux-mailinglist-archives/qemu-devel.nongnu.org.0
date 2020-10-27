Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB4129A8A0
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 11:03:09 +0100 (CET)
Received: from localhost ([::1]:36842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXLoq-0001BJ-ET
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 06:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kXLlb-0006eq-9D
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 05:59:47 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kXLlZ-0000Ov-Lt
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 05:59:46 -0400
Received: by mail-wm1-x336.google.com with SMTP id k18so765632wmj.5
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 02:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uajyyIUVuN5H5ZPpAguAQpdeNr13la0Sl37siT1QEAg=;
 b=QmF0CU0V/97XMLAKay7Yuw+7o82DhB3wbVbIySUUfat/ll/kXlbP85bf1BxqWJvw3J
 DvTBoJ/qH7RtbzWeRK849S0JSmPKgBCCoPg7cft2JBZgZeTmIDEtdS/BPM6r7iQkVknI
 j8PR82hGbx/cvoat7UK27IRiq/dsNBEXXjjIeRXdfXFMSvNIyT19IUxIobeT+q13pbPn
 kuWsvVyoA3Y4D9bUyYlPQKSomdcxPzftMCvpCQpBIpUwx2Lu620hn6lE9p7YI7biEOGM
 YRpviBd923UACim/wUm32d7NIlv1At0VNlL02Ez8BL4FPPDaRnYU15BQ5ZN1PTNBAYpI
 GJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uajyyIUVuN5H5ZPpAguAQpdeNr13la0Sl37siT1QEAg=;
 b=WrY60khXA+rXSw5wgjGm9E+080CEycJXz8I7saGPU1IC2cCXWLehSl40YZqYFSN/Bb
 h2ACKb0AXVDu/N+pXekUjJT/GG5SSx8nMUoyzEmEyJfNdZlNWK20psY57lII/kZLFtwd
 wR+Iu/eEF/JEggZKRQQVCv76FV0FGSZblZ/OxPFgtPlOxukYOSafZpA4C3CaaU05xdtb
 nGCVhTKKcSmXBheD5lAswDR2No6YNCWvbmp7yJ7Cg0VYCwLN34SGk3+lRSyjdSMTX7FF
 9CuABid28Uivt3ZWoEFkCa76Vi49K0ajudI0bOn077I0604Kyc12HfxD7aFWtww7mLk5
 LwTQ==
X-Gm-Message-State: AOAM531XBHlGkyQiSzvdis4Hdopvn5RYnsW2rbE8IKY3/EQeOm+NRiDV
 IBp+CGY/R/ChSJI5sFFVvkiHWA==
X-Google-Smtp-Source: ABdhPJzz0A2FQuZorRLMbvz8dWFTag0A6r56oP1p8e2zje8LwsSpahint7HnNImSikoSOXDQYrRC/Q==
X-Received: by 2002:a1c:8145:: with SMTP id c66mr1761626wmd.75.1603792783715; 
 Tue, 27 Oct 2020 02:59:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s12sm195039wmc.6.2020.10.27.02.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 02:59:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E85AA1FF8C;
 Tue, 27 Oct 2020 09:59:38 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 2/8] contrib/gitdm: Add more individual contributors
Date: Tue, 27 Oct 2020 09:59:32 +0000
Message-Id: <20201027095938.28673-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201027095938.28673-1-alex.bennee@linaro.org>
References: <20201027095938.28673-1-alex.bennee@linaro.org>
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
Cc: Thomas Huth <huth@tuxfamily.org>, James Hogan <jhogan@kernel.org>,
 qemu-devel@nongnu.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Acked-by: Michael Rolnik <mrolnik@gmail.com>
Acked-by: Thomas Huth <huth@tuxfamily.org>
Acked-by: James Hogan <jhogan@kernel.org>
Acked-by: Artyom Tarasenko <atar4qemu@gmail.com>
Message-id: <20201004182506.2038515-1-f4bug@amsat.org>
Message-Id: <20201021163136.27324-3-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
index d135f4b143..36bbb77c39 100644
--- a/contrib/gitdm/group-map-individuals
+++ b/contrib/gitdm/group-map-individuals
@@ -24,3 +24,8 @@ nieklinnenbank@gmail.com
 devnexen@gmail.com
 pauldzim@gmail.com
 ani@anisinha.ca
+sundeep.lkml@gmail.com
+mrolnik@gmail.com
+huth@tuxfamily.org
+jhogan@kernel.org
+atar4qemu@gmail.com
-- 
2.20.1


