Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BB43D4D5F
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 14:29:20 +0200 (CEST)
Received: from localhost ([::1]:53510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7dFv-0004H0-3G
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 08:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dBF-0000ae-99
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:29 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dBD-0003oG-RV
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:29 -0400
Received: by mail-pl1-x634.google.com with SMTP id i1so8387950plr.9
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 05:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jfHnxKO+h/7J4Tm9ly0oXqhrTY2aGD6lpNPS47bAq0Y=;
 b=xDfJQsnk/1lpEGEfiYyzLvkPOqNVm2cDua1hLaMF9cPdQRfDfMrIGp57UYz896VVYe
 jZf2bGz1IkQXwohHs3y76NJsa9/QY3NOYL1Juu9uaSmBF/WRJSZYyQpG4q5K7Spkm2t9
 95DxTmbf7gYDza/zw5VkVQAbQ3gseJOXrFSP5rQK9Y/wj3a1ZvklHEQgotNgSWah59I3
 wpyIXeAJBvZQ4iHeWr/+3HOg3IlLNq12hOkro/ExIV+00joBCs2coR8hhJSiTDsyjCOR
 nA+1eOe7xre2eS0DPXfLPGD5ezdkq3mlqIovVS1Fe0IjnuD1eoZzQv0wLrSQlhAg7ppH
 1uhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jfHnxKO+h/7J4Tm9ly0oXqhrTY2aGD6lpNPS47bAq0Y=;
 b=lzGVpiSZHs8yO6KkgTP0nPJ4a2P8U6p2ISEMXNhhRk93N01zTIfQl/ekB54dee7AYd
 +VI23ZgpVNKp/owEICPpvYY4AvbuT68tAZPRQFo5xUSF0H9Law4cDH2hf2j2YySOYVGg
 LiyVXlwNSTnLvQB8M+uppr3tPYPkDEbASatvIHkeNTAdUN92wnHrCjJdKhJ6VqW3Egi9
 u/KLIRCW48FfoAcKMoB/+ADbN5uM5bJP1t97/O5on4eQn+D96GFkARN5l073SXA+gi77
 eQ5634bt+UIKjbEfy7HcpA1Au/g4eBsyYSHz0BmKrylZNHW/2KnDGk4Emfh3DI+GS5kn
 /ZDQ==
X-Gm-Message-State: AOAM5302mafx5FowcKLS13vOqA6hdaJdNokpTVE/zHR+pv8PggudxUsM
 lVTBPPnSG/xfPg7zW7MIZ5HU7zV3o1HNLg==
X-Google-Smtp-Source: ABdhPJxVw0hUlsgO/9kcl4KntMNMdZkciqqCT2oSVKy4c0l9cbFE/fbdV+EzCzZymc8C3OwfcIOuyg==
X-Received: by 2002:a63:ef4c:: with SMTP id c12mr13544003pgk.441.1627215866662; 
 Sun, 25 Jul 2021 05:24:26 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id k37sm15005093pgm.84.2021.07.25.05.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 05:24:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1? v2 7/9] hw/pci-hist/pnv_phb4: Fix typo in
 pnv_phb4_ioda_write
Date: Sun, 25 Jul 2021 02:24:14 -1000
Message-Id: <20210725122416.1391332-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210725122416.1391332-1-richard.henderson@linaro.org>
References: <20210725122416.1391332-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
hw/pci-host/pnv_phb4.c:375:18: error: variable 'v' set but not used \
    [-Werror,-Wunused-but-set-variable]

It's pretty clear that we meant to write back 'v' after
all that computation and not 'val'.

Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/pci-host/pnv_phb4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 54f57c660a..5c375a9f28 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -392,7 +392,7 @@ static void pnv_phb4_ioda_write(PnvPHB4 *phb, uint64_t val)
             v &= 0xffffffffffff0000ull;
             v |= 0x000000000000cfffull & val;
         }
-        *tptr = val;
+        *tptr = v;
         break;
     }
     case IODA3_TBL_MBT:
-- 
2.25.1


