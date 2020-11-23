Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB91E2C04E0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:49:52 +0100 (CET)
Received: from localhost ([::1]:36034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khALu-0004Ss-HX
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFo-0004T5-01
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:32 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFm-0002i8-8v
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:31 -0500
Received: by mail-wm1-x32a.google.com with SMTP id a65so16938464wme.1
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FrfwZwErGseC//Qoz/cwNLqCAUJXhjDUcMpf6MVUOXI=;
 b=B6BssR2iwJUVpUm57F2YUjim7Pvwx8x8gSyhzoKmhcm8wJlgbRNTAE67EYTe53iOCZ
 Ctizjk8m9jeyNcWbI8XXExAH2S7SU9Tb40ggSQrkAl57c/zC88zfQYi1W1WP7qTz9qwy
 aw5btaLXKJhY46wiY/B6AHqlZ2ODod3oRk7oD4X882DePKfSXevjdLmX8bbaPiZVph3J
 u+Segb674Qyz0ee5EUhlnNsb+NG5kHC6UPf72G+sZ0+iLADxsImr5uVE6R0L4gxyXURw
 6ylOewKOh08pN7Upy6dEIEsgBIXTiAWBFGL5Ux1GzSnERi9wP6r5OpNU4sB8vDpudM38
 jKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FrfwZwErGseC//Qoz/cwNLqCAUJXhjDUcMpf6MVUOXI=;
 b=YVaUFBROpM6BF3GjDmJHheynCxjum8tqkthp7KSv8f+XGtoXFBrzWMJ7sqXm5+71Lz
 BWKhienEQ/qG/WrjB9ZoHkDmfjEFA9KBTH6doD652sj80ddssuvlsD5Tj44RID8sPwrv
 nwZmenxit7yDpp79z3yv6e3ZEr1nHHhBH5JGIxQdqe9D60vAgfa1DR4/bIxuTWHQ8dKb
 y+NJL8jbCKG2Q9kgKWmbKdT0ojkIEvqs/KUprHZdljSe439Pd3V47tKYlRg+7MZihHTb
 +lT3IpCBKzOuRRHL7c5ui0WTeh22i5b6yjuvBRbB8NufF5HLdeijIMabhI01jaS7G/HT
 DyFg==
X-Gm-Message-State: AOAM530Ezpp+C1pYdU0CfBTfr5L455Ke/UKxlVOy6H3Kc8mJ6kg7Hq4G
 mM1wW0XANYUgBj07lSFZ7IydkaD8wz5+HA==
X-Google-Smtp-Source: ABdhPJx9MEYAX5SES7jnb1frVliq+BVBocPCrhZZo822OqH0RUO2UdMaBn5Nj45PQEOC/K9cAuBx5A==
X-Received: by 2002:a05:600c:2048:: with SMTP id
 p8mr24154009wmg.165.1606131808319; 
 Mon, 23 Nov 2020 03:43:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/24] docs/system: Deprecate raspi2/raspi3 machine aliases
Date: Mon, 23 Nov 2020 11:43:01 +0000
Message-Id: <20201123114315.13372-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Since commit aa35ec2213b ("hw/arm/raspi: Use more specific
machine names") the raspi2/raspi3 machines have been renamed
as raspi2b/raspi3b.

Note, rather than the raspi3b, the raspi3ap introduced in
commit 5be94252d34 ("hw/arm/raspi: Add the Raspberry Pi 3
model A+") is a closer match to what QEMU models, but only
provides 512 MB of RAM.

As more Raspberry Pi 2/3 models are emulated, in order
to avoid confusion, deprecate the raspi2/raspi3 machine
aliases.

ACKed-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201120173953.2539469-2-f4bug@amsat.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/deprecated.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index d98464098f5..565389697e8 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -346,6 +346,13 @@ This machine has been renamed ``fuloong2e``.
 These machine types are very old and likely can not be used for live migration
 from old QEMU versions anymore. A newer machine type should be used instead.
 
+Raspberry Pi ``raspi2`` and ``raspi3`` machines (since 5.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The Raspberry Pi machines come in various models (A, A+, B, B+). To be able
+to distinguish which model QEMU is implementing, the ``raspi2`` and ``raspi3``
+machines have been renamed ``raspi2b`` and ``raspi3b``.
+
 Device options
 --------------
 
-- 
2.20.1


