Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008942F367B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:05:08 +0100 (CET)
Received: from localhost ([::1]:43420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzN6R-0007N2-1a
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:05:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzW-0001QK-UC
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:57:58 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzV-0006wF-Cz
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:57:58 -0500
Received: by mail-wr1-x431.google.com with SMTP id d13so3209511wrc.13
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SOiul1QpeOOwd39s2BaIyL3jusMnSNt/3sMWzu/GZ6M=;
 b=ckHxN+ZzVftUsB06Jgj6LzBCCKV1zXGJs8OcHIhwbBF1ipxn34PmWF6X7bqRlz39GE
 5RtRRz9Keeub7Ya7HXr+TXMghiQEjLQNvSsZD3KvQgl/Q7KYJUXoHJiehfhk2FhSpzm0
 hWVLJVWy0IbSNEP2BWC4RdZZ6T8V7RvsWeT+eojAVpKtDw9a5jQMZ+JTQGggwRUdvMQl
 Eu1ZkCCNfQQYZBuDDVPYFtJKQHyBtHlbuL4gRVKZ8p6VgsXnAaHq+/VBPEG7WebfDvXg
 9evC6W04PNLlArNHfdch9tLvv3p8M7jT2ZccGngoT+GJF8cinojg3co9VwTFZfzSM1gB
 7g+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SOiul1QpeOOwd39s2BaIyL3jusMnSNt/3sMWzu/GZ6M=;
 b=DNnFCGy0kv79T0BsOEQDfrCLV904DWfOP/1Xpp4BWb3LkPgkgWZNYcforbgTeU7Elu
 /ntec7CBWH/GnUkugB8kRa+r7i7a/nItrJI/lY93rAG+Y74KYdTFzRRqh1X+kYIDN0d4
 8dxgm1oW1+NQ/ykQT433hY6PooQYdTsmmTVBqHziBvCuEFsIsfIacwNpXq0pGhpSe60W
 /ZwjTJ1x6QMV66tD0r2fwXMjhymTHXCy1d3ndtJp65OdKdKFTsoAd+mNoaDPiALaHRoZ
 GTDJbxK03vlKjXua4oQl5Y8UoDmF+pqqEyBBGChUeZYYBCA2Dlowuu/aWBQmwY/d6Whi
 TqKA==
X-Gm-Message-State: AOAM533z4LHvGZR5x6S0rhPmA5o6/ltHfPORFL+xiSzR8Z/NsAC1AoP3
 30dEx2y1GadY2H+wSQx23Osma3qfYyNrLg==
X-Google-Smtp-Source: ABdhPJyUC23UEUNBXD/uLgnjEIUvPyeKG+HApWgueRMag8MCvbwpYGr8hgvWZX6iLZZyem+4t6PfTg==
X-Received: by 2002:a5d:69d1:: with SMTP id s17mr5015108wrw.161.1610470675904; 
 Tue, 12 Jan 2021 08:57:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.57.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:57:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/21] target/arm: fix typo in cpu.h ID_AA64PFR1 field name
Date: Tue, 12 Jan 2021 16:57:32 +0000
Message-Id: <20210112165750.30475-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

From: Leif Lindholm <leif@nuviainc.com>

SBSS -> SSBS

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Message-id: 20210108185154.8108-2-leif@nuviainc.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ad37ff61c62..ed3e9fe2e4e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1883,7 +1883,7 @@ FIELD(ID_AA64PFR0, RAS, 28, 4)
 FIELD(ID_AA64PFR0, SVE, 32, 4)
 
 FIELD(ID_AA64PFR1, BT, 0, 4)
-FIELD(ID_AA64PFR1, SBSS, 4, 4)
+FIELD(ID_AA64PFR1, SSBS, 4, 4)
 FIELD(ID_AA64PFR1, MTE, 8, 4)
 FIELD(ID_AA64PFR1, RAS_FRAC, 12, 4)
 
-- 
2.20.1


