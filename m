Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438BC6A7688
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 23:00:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXUTi-0006uk-Cl; Wed, 01 Mar 2023 16:59:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXUTh-0006uI-1h
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:59:13 -0500
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pXUTe-00070A-9W
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:59:12 -0500
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1755e639b65so4646737fac.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 13:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677707948;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0yXhPwzd9xeLv+Bcgr8U+SQho4Zwj+7nLFiFpaG5yOg=;
 b=pZCZzbsJ5DoPu8fdbUWoLQSrBqQV4KUdNZXRZUl27muCDZHfv4r+EoIUy6KPwA9T3a
 iuW7B850tiZ8vPK6a+uPM+l6MKsemItiPrNYIbzoVKjS/1rkM+D2+mZWZY+CWk6q1ALB
 eUQtFWGPdC+SANApNjswgfd828qKVw0B6WTl7Tl8+zv+BAXzI6uM15Og1CmbxaNtbiHK
 +EE9LOnabjmqhfqpzDDs4bb98EoCA1xzgPwRXl4/Xwx/3Y3aC61C5L65qeEgP2tWxRjH
 KA25lOFkvaFkxZ5/YL5BIoH+0/dZ5Qsx+/7ei/Efnk5HU4y8+4IF5lCCSikUXTLDPAKU
 cJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677707948;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0yXhPwzd9xeLv+Bcgr8U+SQho4Zwj+7nLFiFpaG5yOg=;
 b=pcuM5+vIjlESzhEW5GWcST5WsVxHwhbwQk/8Xiy001U3UTqzgzOncusQMefWJrXz/j
 4snTOnvYrqL6qBDyHF6HGjDv1Zrt9ycVoEMG5ZM/29WFz5iizj4mRq5dFslBcp8aXJ4F
 PpJ/dfQwUUhL7NTVE9XXaQia8HfXav7e7FDGOsex5P/QtBIVRxawEMOD1O1uugnVyvD9
 Y4dYQiiYxQ/r8TwIMEJPOd1XZgXwEuFBkEEuWH9NCZJp2Qy8NdU2RdDkEN5WcCU9kmpC
 EeXcgNEE6bQaAIIFZQvwemmrmY3DG8+yirc9D78Hc6/5tAddLBTEojZrAzwJXjn+Efoe
 jmww==
X-Gm-Message-State: AO0yUKVuA8HLmP+XdsfWy0p0cQf88y5OcW/LOot15mkefy1Eb34dHVAK
 Xiwyg6tkeV9UglYKawwgVq9x0IYwkJik5B5W
X-Google-Smtp-Source: AK7set+ECNjMahnKIhE3hmQyqSEzIIKqHGa+tLTBAIi0+amkPBUQZ57Mut3jl6aVCLu5OjphbUgTvw==
X-Received: by 2002:a05:6870:4591:b0:175:7910:a32f with SMTP id
 y17-20020a056870459100b001757910a32fmr2792481oao.26.1677707948192; 
 Wed, 01 Mar 2023 13:59:08 -0800 (PST)
Received: from grind.. ([177.189.55.88]) by smtp.gmail.com with ESMTPSA id
 zf40-20020a0568716aa800b001722c5625e2sm4850307oab.7.2023.03.01.13.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:59:07 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 0/1] hw/riscv/virt.c: add cbom-block-size fdt property
Date: Wed,  1 Mar 2023 18:59:01 -0300
Message-Id: <20230301215902.375217-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
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

Hi,

I'm sending this almost last minute patch as part of the work done in:

[PATCH v8 0/4] riscv: Add support for Zicbo[m,z,p] instructions

It turns out that the Linux kernel expects a 'cbom-block-size' FDT prop
to be able to determine the cbom-block-size. Without this patch the
kernel will misbehave with the Zicbom extension in the virt machine.

Note that a similar patch would be need for other RISC-V machines that
wants to support Linux with Zicbom.


Anup Patel (1):
  hw/riscv/virt.c: add cbom-block-size fdt property

 hw/riscv/virt.c | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.39.2


