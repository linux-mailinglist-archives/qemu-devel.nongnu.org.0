Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A207A083
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 07:46:22 +0200 (CEST)
Received: from localhost ([::1]:58092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsKxp-00038G-Pa
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 01:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49292)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <rashmica.g@gmail.com>) id 1hsKwm-00023o-6j
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 01:45:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rashmica.g@gmail.com>) id 1hsKwl-0002j5-7U
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 01:45:16 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39276)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rashmica.g@gmail.com>)
 id 1hsKwj-0002hp-2f; Tue, 30 Jul 2019 01:45:13 -0400
Received: by mail-pl1-x643.google.com with SMTP id b7so28475381pls.6;
 Mon, 29 Jul 2019 22:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0c5Fk5uuse8MwbXJXkiQRerY3AzzOY/o674bSmI3StM=;
 b=qddvOICzjQlP2YToI0YL4IEWmZdTvJKs+dxCFSEpyvyAnBbo+e9XRpCuS72br/ubQz
 v+Z9PM/eRvh+xJQZpatsV976LpIDYP60yDo7sH6EBwY1ylHZDvXRIl7MItkss9RXgtr1
 ypLIDrK8pLqNLrq6JIw3mgXw8HbQxguEXto8amAK6iaIMBek6xY9Ifk5E6Qvoq9oeBCm
 qkKSv/DEuRe7oQeHMIZU3yqSlOk8ILgJB+c971XX2O51k/UDESlI428RbblItkzXxN8+
 bgTOaVP7+gi59Ia/jbULUOP1J0XoVOD55mR5kQDzlu1pd5xNXoALaeBdLfjldYPVfGSt
 U31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0c5Fk5uuse8MwbXJXkiQRerY3AzzOY/o674bSmI3StM=;
 b=aVC/JnTcKWmDoFI5LqF2hLNAz7l9hkcWwBnITv6Keh8IKkfKjPLC8oyM4CgSXpfIOy
 CN9PLoYONxYXAYsN46SIeFIpB1xW4k8qxdXHi1qZcHNI8zblwqhuj2+AKgXC7bx5kplD
 5wF22CYzoPPF2zTqVVLn1EsM6WAAfnqV1IESpdTQSVBZI4SrYbRygaRy5YxeGxlARFSL
 N0qWW8ZXc47oHELbsWYaC4eVNjSER5ZcXX8P/WBpVdYjQYEkzLh4Q3JooW995ZEeTdCE
 qU7bXfaIugzxPx8D+mN8bFZ37zbjKDzzQ7gbiAzgqSdAv8pAIHvytkNX0aLI1uHF/+ga
 uEtg==
X-Gm-Message-State: APjAAAXmu2/1ikBwXOq9AFQd+6+OUQMNaODuzttxa7CpMBHTK6baKgGg
 Sa6v9er8Yw32SU/ci/gsDhU=
X-Google-Smtp-Source: APXvYqwYLDQutsM4r46TNsT6fVLfw4loor/JqvAN/DfcUOnFg07eQPdFhBWADk56HHGbzt88luzwuw==
X-Received: by 2002:a17:902:d892:: with SMTP id
 b18mr106373896plz.165.1564465511916; 
 Mon, 29 Jul 2019 22:45:11 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 81sm99171221pfx.111.2019.07.29.22.45.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 22:45:11 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: peter.maydell@linaro.org
Date: Tue, 30 Jul 2019 15:44:58 +1000
Message-Id: <20190730054501.32727-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-devel] [PATCH v3 0/3] Add Aspeed GPIO controller model
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
Cc: andrew@aj.id.au, qemu-devel@nongnu.org, qemu-arm@nongnu.org, joel@jms.id.au,
 Rashmica Gupta <rashmica.g@gmail.com>, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are a couple of things I'm not confident about here:
- what should be in init vs realize?
- should the irq state be in vmstate?
- is there a better way to do composition of classes (patch 3)?

v3:
- didn't have each gpio set up as an irq 
- now can't access set AC on ast2400 (only exists on ast2500)
- added ast2600 implementation (patch 3)
- renamed a couple of variables for clarity


v2: Addressed Andrew's feedback, added debounce regs, renamed get/set to
read/write to minimise confusion with a 'set' of registers.

Rashmica Gupta (3):
  hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500
  aspeed: add a GPIO controller to the SoC
  hw/gpio: Add in AST2600 specific implementation

 hw/arm/aspeed_soc.c           |   17 +
 hw/gpio/Makefile.objs         |    1 +
 hw/gpio/aspeed_gpio.c         | 1103 +++++++++++++++++++++++++++++++++
 include/hw/arm/aspeed_soc.h   |    3 +
 include/hw/gpio/aspeed_gpio.h |   91 +++
 5 files changed, 1215 insertions(+)
 create mode 100644 hw/gpio/aspeed_gpio.c
 create mode 100644 include/hw/gpio/aspeed_gpio.h

-- 
2.20.1


