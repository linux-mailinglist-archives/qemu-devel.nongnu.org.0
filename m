Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C270A2B43B1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:28:18 +0100 (CET)
Received: from localhost ([::1]:33458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedcH-0005iZ-S0
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:28:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYe-0001gp-LI
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:32 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYc-0003A1-Fd
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:32 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d12so18441991wrr.13
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I5N/dAQ0srBictVseT2rP2fA4AanR0t+DIq+DoGQDUA=;
 b=kUv5YnOumF/Ptfw2eqBb3oW9vbtrXH2sp4GACYHhA96xfqkjYNrDu1E4hPFaiMhABN
 5r6Bp5+qFL+41JkZts4NLOMDU+BOZ7f+B3OxTSrsN4NMQ1sCmvnPaCAgK7AUxbRQBHMz
 2eie64PA2/H4D4HRatmXT07ZJAMsiUF2S2iEBlis90fJOUM3ifH+NgoBJ7NHRUe5GSxJ
 51rArOQXs0dhUX8EN7kitzVSfDEdlKri/ftf2l6VWkJuIkLMNx4oHB7NGAIgPePTFDsa
 KOcaFHJBgMjEndAwhqkKbtIf/jfW3DQ88lvtkMKy0vdV8Oahf+jklSClwHom/imIJJtL
 QtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I5N/dAQ0srBictVseT2rP2fA4AanR0t+DIq+DoGQDUA=;
 b=c7ZowIQ3w4lIOBqbiyu1POkv9owjC/uv2Azfn3kcEeos/u64f1DWXK7HGvoN3iopJh
 CWGTqT4wDrLM62iA+UJ4B9CnsU4EIxXHOlLRJHNf966+43ua0jQ2KnZsWTtmF3alASFX
 dHVbw/4qLIefc1fSYxvTb08LNAdJLpM75kjar8ObDEoy101rHhlEaYLCQ+1c+UBxhiA1
 xxNoGL/DpU1eEf86hrIB4IzQUnGJmzNoBj6N/wJaOPzhJt18cB83R/72fDs3oNmn9YNW
 XWpKaivVPFrYESX9kjS9Hwp8stDWPjF67fE53+QsAagBUqI1uWm2v8uanEqZqHZ1qusj
 fAtw==
X-Gm-Message-State: AOAM530cgChzkcTXj8tDolOyboIV63Av0NyD0c9T2GYWjiYqxSQCSrg6
 j02gh1I2UAcvrWpcLzS4o1BJzA==
X-Google-Smtp-Source: ABdhPJxEtcR4ZeY941H3WHkpWZMVMIuDrHc4wCNctDwDHmfdBIFTxqjPSisyc+pQG175SXdcSQDB4A==
X-Received: by 2002:adf:e74d:: with SMTP id c13mr19836328wrn.277.1605529469173; 
 Mon, 16 Nov 2020 04:24:29 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w15sm23012424wrp.52.2020.11.16.04.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:24:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4553E1FF91;
 Mon, 16 Nov 2020 12:24:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 5/9] stubs/xen-hw-stub: drop xenstore_store_pv_console_info stub
Date: Mon, 16 Nov 2020 12:24:13 +0000
Message-Id: <20201116122417.28346-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116122417.28346-1-alex.bennee@linaro.org>
References: <20201116122417.28346-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should never build something that calls this without having it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201110192316.26397-6-alex.bennee@linaro.org>

diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 2ea8190921..15f3921a76 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -10,10 +10,6 @@
 #include "hw/xen/xen.h"
 #include "hw/xen/xen-x86.h"
 
-void xenstore_store_pv_console_info(int i, Chardev *chr)
-{
-}
-
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
 {
     return -1;
-- 
2.20.1


