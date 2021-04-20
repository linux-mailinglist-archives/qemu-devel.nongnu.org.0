Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B125366044
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 21:37:26 +0200 (CEST)
Received: from localhost ([::1]:45712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYwBZ-0003N0-1W
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 15:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYw9D-0002CY-0p
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 15:34:59 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYw9B-0001sp-AY
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 15:34:58 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 w7-20020a1cdf070000b0290125f388fb34so20749846wmg.0
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 12:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tl+NmVfq00aXQ3zaP/O6EpXDUPOmnIfgLazcoQto0GU=;
 b=rIEHqLfGR/7rMM04IbLnLjJjT4D1/TMynj/ZcZz/M2haqmHL/tCo5EGvmp8uv++caz
 IymDSwVNJohak/bHSAZZeO8aQAJWatn3sBPihglkX+X/P7qQSg0OQVwsj6ZwKwDMZlej
 q3yeqhWZdUjqUlcVeBB/+4yIcJjEXEKIS+MRoAe3ctnq7xZzlXacXo7HZYWlhDxeyfA7
 p+YHFTC7OUYz2IEfn76dCVlhPpB9UIwp2QPNWiV7YVKnL9QSb7bXyjgeq53oMpLDGqay
 1gTUFQbATluuHsxJMEe79vEAW4VAb91nVzfwwRdmUooJ6BsUJcsztM9LTqmYVM9NcAt3
 X1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Tl+NmVfq00aXQ3zaP/O6EpXDUPOmnIfgLazcoQto0GU=;
 b=mnO5oVFEcRQTO6FVmzIf23jZbXSRYlrFR/Pvd1fl8VP6euslsBD24EgaKYhpFUyi17
 bJ93u1L00sQ6i9ugP282LpKTPjmHCwXWUIJS5K6pfuuVeGex8E7/z7INA/O01oiW8+Yu
 uCtxGwK0fIXdiRfGyeLfyMqcpU7Y7VPYP2iPuY6ya7GZys3gS+aKPXP+Jhj5QiWxYdnU
 pjGlCjVMkcwM6jAUbBJhW8X9uwyZl2FI/uxmb//ZdtZKUMNYUdDSeY8KfdHMAFEiyKzL
 JAjakEO+uZbnVbRfSl1riKS/gA17sBP08QeoDU9BUjtYJev+1G0kMnyY7OM0hDvN1WtU
 kCsQ==
X-Gm-Message-State: AOAM533JvnFvlniYFiGdUUNbVwu8YNuN1mDTvjTZoHPsVLJ5DP8n6uyL
 ikxxuUNhSzXX0QqJYCkX4GmGTnN/zNfhvw==
X-Google-Smtp-Source: ABdhPJyGy8iRcJXWF3yeIuRNNeswG8Kirnzn4VvbvHZW010A8lD0lpxe4GzYZVJVa0U0HwH31Dw5Aw==
X-Received: by 2002:a1c:4c04:: with SMTP id z4mr5943464wmf.28.1618947295550;
 Tue, 20 Apr 2021 12:34:55 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c16sm28421977wrt.83.2021.04.20.12.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 12:34:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] target/mips: Make check_cp0_enabled() return a boolean
Date: Tue, 20 Apr 2021 21:34:48 +0200
Message-Id: <20210420193453.1913810-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Address the following remark from Richard:=0D
=0D
 (1) check_cp0_enabled must return a boolean, so that the=0D
     caller can avoid emitting dead code after the=0D
     exception is emitted.=0D
=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg800114.html=0D
=0D
Based-on: <20210420175426.1875746-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  target/mips: Remove duplicated check_cp0_enabled() calls in gen_cp0()=0D
  target/mips: Simplify CP0 check in nanoMIPS P.LS.E0 EVA pool=0D
  target/mips: Make check_cp0_enabled() return a boolean=0D
  target/mips: Use check_cp0_enabled() returned value=0D
  target/mips: Restrict EVA opcodes to system emulation=0D
=0D
 target/mips/translate.h |   7 +-=0D
 target/mips/translate.c | 178 ++++++++++++++++++++--------------------=0D
 2 files changed, 96 insertions(+), 89 deletions(-)=0D
=0D
-- =0D
2.26.3=0D
=0D

