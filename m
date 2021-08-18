Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 202F83F0305
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 13:49:27 +0200 (CEST)
Received: from localhost ([::1]:51434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGK4U-0003Rg-6v
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 07:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mGK2m-0001Hy-1n
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 07:47:40 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:40794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arkaisp2021@gmail.com>)
 id 1mGK2k-00077S-KX
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 07:47:39 -0400
Received: by mail-lf1-x12d.google.com with SMTP id w20so4018700lfu.7
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 04:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=LA3iMmqPe+Bxr0GGT0eHe4rsEPSrxGRMgS7M2716jHA=;
 b=KGB1Z4QtGJZ5Rk6khHhj8P4mrI7w82slOT63TEqe2vxlKAh7Ji8+VMdzEARZYJb00z
 JL2+zkm3xr8arhAwzHWw+0OV6CF70GsZEhrLwccCPo3QYGYXK96dbVFFwPDQFaCUETzr
 tbtJ0CTPNb4/uy5TkPcU2f82iqahVNIzecRF3eLgRhckCn2VeGMMHXwg5GbVW3zYskut
 KSg5pZqwyFMrMeX+lOA6TO+CJBqal0wNKz3Af6oc3UU4OiEhYrgohXgRxtNQZDKTz9aE
 H3qNmAy3rQqp7fHXb1G2AfhB+tvB++P02I1dxaYCoTzxQkyw06zT2IHdwn8iqTEqfgVJ
 MptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=LA3iMmqPe+Bxr0GGT0eHe4rsEPSrxGRMgS7M2716jHA=;
 b=kyqjx7XktUedKyIiDCXVsnVjhPzgvX6E1gnkRnw/TWRteuK+8w0oR/8PuHcDvQSRQY
 0QnWvOkWTshxoZkxMqIl5f/9PYwdJt17eynjkehQrlYHLrnX1Bf0WDkMCzt5qH5xlDjr
 4o/1csCjj1vSQ0nXpDiSXJvgfOO6SS44jY3jk2VTVwUC6A8Yi9kqkM0fXbOHFuHJidK5
 AzifqF3WdEJq9SoNGk150Y17WKROtwGTEqSAJqguTo8IihcEatb1bg925Y/wFDlvyu0F
 PMyJ7bp2RkwmJNQoHWxvBwQsCGALy+efR2WGXTweMOrwgZwd6O7g++ABmqBjh8iBez+X
 Fqgg==
X-Gm-Message-State: AOAM532aBD4wsV1hnwRJ1SNcdt4zB/xHR6w5Q7i14PHU4q9o+qJBvoIQ
 6I6nulq4rWPZTt10r9p8WAvkm+EebIg=
X-Google-Smtp-Source: ABdhPJzPNIj3gi75RB6fj4iax2NdYAECTzx14jtVZgcxnIUM7R5cofScuP6ebZC0MV/K5dGObdiPaA==
X-Received: by 2002:a05:6512:3886:: with SMTP id
 n6mr6178423lft.279.1629287256192; 
 Wed, 18 Aug 2021 04:47:36 -0700 (PDT)
Received: from localhost.localdomain ([85.142.117.226])
 by smtp.gmail.com with ESMTPSA id o24sm476919lfr.41.2021.08.18.04.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 04:47:35 -0700 (PDT)
From: NDNF <arkaisp2021@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/2] arm: Add support for 'info tlb' command
Date: Wed, 18 Aug 2021 14:47:30 +0300
Message-Id: <162928715931.357603.15628842472925815718.stgit@pc-System-Product-Name>
X-Mailer: git-send-email 2.25.1
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=arkaisp2021@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, pavel.dovgaluk@ispras.ru, changbin.du@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds hmp 'info tlb' command support for the arm platform.
The limitation is that this only implements a page walker for
ARMv8-A AArch64 Long Descriptor format, 32bit addressing is
not supported yet.

To reuse existing code, this patch also extracts some APIs from
helper.c, including regime_translation_disabled(),
pt_start_level_stage1(), regime_ttbr(), arm_ldq_ptw().

---
v4:
    Dividing the patch into two parts.
    Removed some of the previously described
    problems by switching to arm_ldq_ptw().
v3: rebase to latest mainline.
v2:
    o fix coding style
    o extract common code pt_start_level_stage1()
---

Signed-off-by: Changbin Du <changbin.du@gmail.com>
Signed-off-by: Ivanov Arkady <arkaisp2021@gmail.com>

---

Ivanov Arkady (2):
      target/arm: Refactoring MMU helper function
      arm/monitor: Add support for 'info tlb' command


 hmp-commands-info.hx   |    3 +
 target/arm/helper.c    |   35 +---------
 target/arm/internals.h |   39 +++++++++++
 target/arm/monitor.c   |  170 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 214 insertions(+), 33 deletions(-)

--
Ivanov Arkady

