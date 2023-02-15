Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB08697ABE
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:29:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFyO-00041u-1U; Wed, 15 Feb 2023 06:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFxt-000316-Tc
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:51 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFxs-0003k5-6J
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:45 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so1284882wmb.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTwT5VGfn+8UwZX3OhE9cueSsB1q4gTrSW5DQD7KfW0=;
 b=J/Wmsp3VZdkGx4vxHG+B1F7gdRC0pbuz9DpRdm1wEU2+nbH8HiCqGsQ70cHugAry2R
 ktfybVzmqYYTfVAO1AFZhjnSkVO/TEo9wmM1mA7eR8sHij3iSTPFZSF8N5xPGI4EM+2J
 eKAlpToXOHI5LHju833m+uE5fpdT4Xfs3NUfptq0wY5W9lDOLPVGR7R5JGme6zYFTub0
 ZfuBn/BT0/DDKXdVpp7bs6hIf0pPbZWQo5rpP/+Y46AJUfPjCqxKxD75G3RIaZY9+Ubf
 8o4xuS8T5g4a+iHciqxrQBAyVJ1n90PAuVlFa21iV/v36/Fj2rQg1/5HFFdXUzPuD8F9
 d5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VTwT5VGfn+8UwZX3OhE9cueSsB1q4gTrSW5DQD7KfW0=;
 b=mxpp98fHY1HmaoT+5G1kaK3MOmJ0XSmlPLG/mdu5CHECG/lxEIJSE7xndLq+rGI53a
 V5RXRN527f4HrMvhPZ7ZwU51294MGH6i6gXgwjzMaDGPyGT5TwjOkztmvSOUA9aImfuD
 VUQiTLkMqkTBfvqfiOSkMmk3g3Ln6uUXbGHnImLz3CJ3ZDRu2xzSEVLNt0twF08k8WfV
 enAP5+clLBgEgcyf9Y/SWZ63Miugd36vENBp/A8knblHP+SND1Nvyr9buqwpjtQQULYb
 bUkDt+U7A6ku8xMgDtIAaDsYZz4EhhrutaunZaCsiZhlqDwe0EUQ8Cb+dUt7aM7tmB71
 PDzg==
X-Gm-Message-State: AO0yUKV2GaHn+a2wbCd9pPy4xwmdASYj3YgCWIrvuk7s9Nc14aOxnBjc
 ENOCECbLMLtnCI3+DZWcqUfshq4KqCg13fDn
X-Google-Smtp-Source: AK7set/CDuOFrxkha2P3ZaZ2sHD4jthr3T3bb94vWHQ9q7l74HqVx1FfZYzQ7001lYfkdl2LFTNYhg==
X-Received: by 2002:a05:600c:90a:b0:3df:50eb:7cd9 with SMTP id
 m10-20020a05600c090a00b003df50eb7cd9mr1887255wmp.14.1676460522361; 
 Wed, 15 Feb 2023 03:28:42 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n27-20020a05600c3b9b00b003e206cc7237sm33073wms.24.2023.02.15.03.28.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:28:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 18/20] hw/ide/piix: Remove unused includes
Date: Wed, 15 Feb 2023 12:27:10 +0100
Message-Id: <20230215112712.23110-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/piix.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 2f71376b93..6354ae740b 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -28,14 +28,9 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/pci/pci.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
-#include "qemu/module.h"
-#include "sysemu/block-backend.h"
-#include "sysemu/blockdev.h"
-#include "sysemu/dma.h"
-
+#include "hw/pci/pci.h"
 #include "hw/ide/piix.h"
 #include "hw/ide/pci.h"
 #include "trace.h"
-- 
2.38.1


