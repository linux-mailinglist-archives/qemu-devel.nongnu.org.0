Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1FE63CE46
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 05:15:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0ETn-00030O-B2; Tue, 29 Nov 2022 23:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <evgeny.v.ermakov@gmail.com>)
 id 1p0ETl-000302-9O
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 23:13:49 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <evgeny.v.ermakov@gmail.com>)
 id 1p0ETj-00024a-F3
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 23:13:48 -0500
Received: by mail-lj1-x22b.google.com with SMTP id x11so492023ljh.7
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 20:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=7tRN4m8CZ5v+lV0I/k/knUEOFSHuCQturGSdXFO8MQQ=;
 b=MSCvyYQ6D3wGiJSsfKJ7Z2cnb75uR7q81IZeM+vkbnyHf+AxtXHxmfiH7dN6XddRF2
 QD1lReg7tN/t6Jy0mfVdWOA6DgxT+WidjdUPjO9XQgPqFGmaPorQcE3/bvJg+1zZhIOn
 Pvb5jFGPqL/xV6zLyC1ro/rq0NrLf7cLzmNakZ+fyQlmcRWqC+g8tD9imcGDMf2L+sh6
 OACwDayShjd6tfYHilYGr6DuwvMLnP2gIMDoFSHDr9khr7Qxp7wSj2OtU3w4GKYqs758
 +1rMjy3DeE9Q78kHN79sfhKOssmr4s570CP2psYtq5Zw9qhSqIbBs445E6RnhXnPPX+U
 nYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7tRN4m8CZ5v+lV0I/k/knUEOFSHuCQturGSdXFO8MQQ=;
 b=EpaZdHjauhDgdKSTSLWDl1V4PA1sd28Ro3rnhsqRk4ti0S7aHQn9ElztXQeVcVU/2+
 XtNmv/nZvAh8SEFdBei3F9uIAL+IfkAY6YsQU4CNDKgoxCRf2K3+UfWMaUf0Kk6dte9B
 hpv9Zk5qhSIYamp1jvL59M9Q047LWnPHkExiLJC6Gm8wFrRfmtBiI2JD2/cM+kmziV97
 31Zik5gy+taTjhZXqKGrb1aRZT8N5ivnBAZGmciFA1wbBZcjJN94sE7iVKvcoFohYewK
 zF4ibPTIOiUygdLybLUI4rGsyQAMmDkSfrPC4ZWAwIs/W4/+Idzuuot+ET9IuLSUoig7
 zVPg==
X-Gm-Message-State: ANoB5pnQdJHypvghAHhJ+1RaWvy2wvKJZMjeVrSl7PEMiV1lLKrtYcOz
 UFmvsoEEPuKvB1/nZ8sWw6D1WXZTwEw=
X-Google-Smtp-Source: AA0mqf4SAsn7VAyFb+c7QbRN7MTs492ND1hUq6K5riXMsitCQ3gOMMkATAViCPAME/Q9weqIZIqkoA==
X-Received: by 2002:a05:651c:1952:b0:26f:dfb2:9b9c with SMTP id
 bs18-20020a05651c195200b0026fdfb29b9cmr17948562ljb.461.1669781625190; 
 Tue, 29 Nov 2022 20:13:45 -0800 (PST)
Received: from front.loc ([80.83.238.100])
 by smtp.googlemail.com with ESMTPSA id
 f27-20020a19381b000000b004a25468d86asm81737lfa.68.2022.11.29.20.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 20:13:44 -0800 (PST)
From: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
To: qemu-devel@nongnu.org,
	Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
Subject: [PATCH 0/2] Implement something
Date: Wed, 30 Nov 2022 15:12:57 +1100
Message-Id: <20221130041259.12032-1-evgeny.v.ermakov@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=evgeny.v.ermakov@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hello!

Evgeny Ermakov (2):
  hw/char: Add STM32F7 peripheral: USART
  hw/input: Add FT5336 touch controller

 include/hw/char/stm32f7xx_usart.h |  30 +++
 include/hw/input/ft5336.h         |  14 ++
 hw/char/stm32f7xx_usart.c         | 361 ++++++++++++++++++++++++++++++
 hw/input/ft5336.c                 | 357 +++++++++++++++++++++++++++++
 hw/arm/Kconfig                    |   1 +
 hw/char/Kconfig                   |   3 +
 hw/char/meson.build               |   1 +
 hw/char/trace-events              |   4 +
 hw/input/Kconfig                  |   4 +
 hw/input/meson.build              |   2 +
 10 files changed, 777 insertions(+)
 create mode 100644 include/hw/char/stm32f7xx_usart.h
 create mode 100644 include/hw/input/ft5336.h
 create mode 100644 hw/char/stm32f7xx_usart.c
 create mode 100644 hw/input/ft5336.c

-- 
2.38.1


