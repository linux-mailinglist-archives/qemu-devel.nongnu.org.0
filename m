Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21840308DAA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 20:47:20 +0100 (CET)
Received: from localhost ([::1]:58710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Zjj-0007hK-5A
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 14:47:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5Zh3-0005s9-7j; Fri, 29 Jan 2021 14:44:33 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5Zh1-0005Vp-Qt; Fri, 29 Jan 2021 14:44:33 -0500
Received: by mail-wr1-x430.google.com with SMTP id q7so9956838wre.13;
 Fri, 29 Jan 2021 11:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d1B6pvGk/tscGDXzqPDvBbdkbEz+7Rk/Sr0TvkmFW9w=;
 b=IlDRHRLthgIz2LSgZF44OyZgYRNHUPR50cA2NFmXs2bn7EDGr3NpCnXwNbaXdaCbY6
 RvXCZE73Z0RKOcanVypi5RWTlOdUcaT2wnSBbOt6StqEyD2THxt2+hPKNOyIcMv4RGlU
 hPFfi5+kzI+qMNpHxZZLCgogZoMSLXFBRbLeXfzmUWIrd7QQ0SSapCplEFtRXNZlaTs3
 QWny6IB9EHvedQj/e0ZYLpkAc2YA1cGW5F9Gxm1PNmNaheuGCWCZsZidvxyDhzoLPvyj
 akBlJJPf3RLQdrD1BGdgyGEDunb83hgBTo3NbSu0vzRlhzxblKEfkQeU2nIuOsPqPw+w
 yVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d1B6pvGk/tscGDXzqPDvBbdkbEz+7Rk/Sr0TvkmFW9w=;
 b=e1jv6CoHfclb5mza1ir7slnJiYXx+CufKmfoCnSbdGoS2aQIXDVb4j9VspnnZz33ur
 q2aCcIB5W4nmrJMNnT5kS2Tb38IquMOO9tyVV/NS16yaVkErGMXiE8x+ldjxtlsF+JMY
 u0jPuN2gMUd5XHKKUCnhVwIyufvcrvukvaycwbX0qMhxRBkclqEYt0/gtYMbLWTVmMw+
 iqKq7Rh2un0lZ2xLlPi5xyXrBG1lpwCOhVWc/GvSSH1SU5QVHYwzNzxOIgFw03Erd5+f
 AWhxMt+9wjn8aQ9TF+S1vghD/OciFIViQb7Tp1rDlVwonmDQOB3HkL4vyETgEq8MtBuZ
 zoEQ==
X-Gm-Message-State: AOAM533720oSp/W+GQujQyJqc1VneB+wAHz9229B0ehvIssrHaKkgZcE
 SJtX7BnuHRE7Wc2zjLuZ/hcbmbFc1xo=
X-Google-Smtp-Source: ABdhPJzEYjckP0B97VTypoBS6r/O87F47Z9tKjRdyvjMDKeyrVqB+pvBLfr/6bFmd8GqNGxoU6eUXA==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr6296371wrw.150.1611949469707; 
 Fri, 29 Jan 2021 11:44:29 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id v126sm11603122wma.22.2021.01.29.11.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 11:44:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 2/4] hw/ide/Kconfig: IDE_PIIX requires IDE_ISA
Date: Fri, 29 Jan 2021 20:44:13 +0100
Message-Id: <20210129194415.3925153-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210129194415.3925153-1-f4bug@amsat.org>
References: <20210129194415.3925153-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

hw/ide/piix.c has a strong dependency on hw/isa/isa-bus.c:

  /usr/bin/ld: libcommon.fa.p/hw_ide_piix.c.o: in function `pci_piix_init_ports':
  /usr/bin/ld: hw/ide/piix.c:141: undefined reference to `isa_get_irq'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ide/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
index 41cdd9cbe03..0f5d316558b 100644
--- a/hw/ide/Kconfig
+++ b/hw/ide/Kconfig
@@ -17,6 +17,7 @@ config IDE_ISA
 
 config IDE_PIIX
     bool
+    select IDE_ISA
     select IDE_PCI
     select IDE_QDEV
 
-- 
2.26.2


