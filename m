Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D33CC4467D7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 18:25:02 +0100 (CET)
Received: from localhost ([::1]:45986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2xa-0005i6-0k
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 13:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj2uf-0002Vg-Uz; Fri, 05 Nov 2021 13:22:03 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj2uZ-0007B2-FG; Fri, 05 Nov 2021 13:22:01 -0400
Received: by mail-wr1-x436.google.com with SMTP id w29so3251146wra.12;
 Fri, 05 Nov 2021 10:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SsnqRxIkydd+fBkqtBAbIt03sgAtTSLHMDKWB0oS4kc=;
 b=pCaUPMoM62z9hOL/qFCbYyPISRI/+cCSvBvZM5YPt0g3/vMud3LsRqgTjJ1NEPHgF9
 hXTmxRgsQJKz+kbgO94zhJM+4n9xvErtMlbLlF679qS+8h3CTseEM2+f+hH8iYiNwWXq
 gHYt7RmDX8m5vvUyaJokwZd81W4dcx7di3v1LlvbW51G4WAcPoEFw5uhvrBGOEqjadoj
 BYkRhd11/pXLJm9pjoiPAnZZAcaL1bSVaI4KdAMOfEAhto5/ozizL65yoX1Yi1M/YKM2
 2xSF3f7eHE7/bp+f/2Y6oF9s6lyTZ0QcTp6XYqkpE3EgchO4E7ObgKPNcf7G3YMRoARN
 gMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=SsnqRxIkydd+fBkqtBAbIt03sgAtTSLHMDKWB0oS4kc=;
 b=MTY7lShH3hRSnmTw7LfCXgOKmHmLsEi4RGNZGV5dV5vsA5BV5fjPwxMyghIa3sWp7C
 2OjanfYnB+Ul4KaiR4NngXDIXHzyIgLSKQCU43Nl58brGFpSlrk1xrsQLu00LxX+fNJ/
 XrXVv3SixVYFtwJULpJkjqUBS/GDwO3O+U67QG55dEGVxrETNXR5Pc6x7u65er882DBD
 bSrq8gtekiezz7RoQbp3b5VBXDYWCp+RcL6a7BcUnS31V+hbSyjnxoPq7/GCtVV8Aucb
 KHcGtWXA+S9d6s5BHJ7FDPQTbb8w+HNBaNpB9PtAlHXoIRTzkCkW0+xPAp6oD44y28xo
 tu4Q==
X-Gm-Message-State: AOAM533SEh0UprkQipvEHT2QzHYVK+VUpvhMFXXfOPSE52eTvovnpkQp
 pQ2z+8+qcrpfIsLbEhRNLXYthYLU7SA=
X-Google-Smtp-Source: ABdhPJx5RVAv1V9T/CMy1GoKol5PAvdme73O8Uhdzpcnakkmclhb1i1NwjCssCNt9Z/tWh56Yb1QCA==
X-Received: by 2002:adf:eece:: with SMTP id a14mr25377402wrp.333.1636132889285; 
 Fri, 05 Nov 2021 10:21:29 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c5sm5237205wrd.13.2021.11.05.10.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 10:21:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/qdev: Clarify qdev_connect_gpio_out() documentation
Date: Fri,  5 Nov 2021 18:21:24 +0100
Message-Id: <20211105172127.224462-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial patches clarifying qdev_connect_gpio_out() use,=0D
basically that the qemu_irq argument is an input.=0D
No logical change, only function name / parameter changed.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/qdev: Correct qdev_connect_gpio_out_named() documentation=0D
  hw/qdev: Rename qdev_connect_gpio_out*() 'input_pin' parameter=0D
  hw/input/pckbd: Rename i8042_setup_a20_line() and its a20 irq argument=0D
=0D
 include/hw/input/i8042.h |  2 +-=0D
 include/hw/qdev-core.h   | 13 ++++++-------=0D
 hw/core/gpio.c           | 13 +++++++------=0D
 hw/i386/pc.c             |  2 +-=0D
 hw/input/pckbd.c         |  4 ++--=0D
 5 files changed, 17 insertions(+), 17 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

