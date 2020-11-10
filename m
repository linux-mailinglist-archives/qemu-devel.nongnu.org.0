Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A682ADFE4
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 20:38:29 +0100 (CET)
Received: from localhost ([::1]:36988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcZTI-0003NA-Oe
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 14:38:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEr-0002Sv-5c
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:34 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEn-0007aI-8O
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:32 -0500
Received: by mail-wr1-x434.google.com with SMTP id o15so6143683wru.6
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 11:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OhJqzhnruESxyQBsuUBkTpXlj1KG2mpYOvcyz9G88Zg=;
 b=BYj3pLZXVoexXGwdJoXo1ydbNurkgF3mKNmPDG3Is3roLOOYY61mRZaAeKYdfR2SjW
 KxSfs6RQULqqvPzSFB6PN1DtWt5qXqNyLLD5MZlJHlewRYGyEPll6BUdFyVkwmtctZHJ
 Yq6WfWMDUmfhzZXQGnMOV0Mr5xZQDi3gXQHPL86mry8dGE8K0QCsj+F2vDaaVgKpDWOv
 gYGBrfXitnqfpKOWTZERUH6IU7koDoj4/oQf2QIKlCNkjqh6I3A1nvV4K1mGZ50cEUSX
 5zNzMZi7Y2Y+0Kch7/mDjmE/EyZ5cDSI9Zd+nUqgSxMUxDW963aHU9n0xlCSohwJr2hQ
 DBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OhJqzhnruESxyQBsuUBkTpXlj1KG2mpYOvcyz9G88Zg=;
 b=KLLFLoVlbCQ4S/ZXh7ElGiq7nhjd9whaF/5J5Mhrm7Cz+Cl8gA1ZsxTjVtcdr2pqlu
 +lYAttsZ9sJ5VlPwYnyLusiY14adGqtQsHDVBtSts2lIrVq6VtDwwPgOyCk4ew0M4URS
 Dqszr7Qd3gGPQSwdtoJzWRiQMVAopcwHCdoWeIG23yq/pjVSV94g/lrI17Y5QF12CUjI
 0i02c418xNCxQpadCXwUm7LBi2OL+9z1OeUe5y0j41xVjHuOB0OmXt4UgKI2VZ+EsAoe
 bl3SVd22JU2sAclrfVT5PqcE/ebONHPVtvodvYgmGo9BAc2u/7CVPQ2TsVF6NlO3fzaJ
 gWCg==
X-Gm-Message-State: AOAM533H8q+HLEsZAb25j1tD8rFNGi9H89tCYBC5KxSWt965+3O/rtte
 hOhwLsvC/Kz9vMkRN9gu0RGT0Q==
X-Google-Smtp-Source: ABdhPJzVSbE+5KXb+q3qWvL34oqGwQ/Ri7FBsgcn0thcQllMwFwg5o7MK5c47Opz1q4GH2WYIiwDzQ==
X-Received: by 2002:a5d:4d86:: with SMTP id b6mr25370577wru.369.1605036207888; 
 Tue, 10 Nov 2020 11:23:27 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p13sm18180232wrt.73.2020.11.10.11.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:23:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B762B1FF91;
 Tue, 10 Nov 2020 19:23:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 05/10] stubs/xen-hw-stub: drop
 xenstore_store_pv_console_info stub
Date: Tue, 10 Nov 2020 19:23:11 +0000
Message-Id: <20201110192316.26397-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110192316.26397-1-alex.bennee@linaro.org>
References: <20201110192316.26397-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should never build something that calls this without having it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201105175153.30489-13-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 stubs/xen-hw-stub.c | 4 ----
 1 file changed, 4 deletions(-)

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


