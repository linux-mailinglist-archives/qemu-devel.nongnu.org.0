Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94F652F1FD
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 20:04:23 +0200 (CEST)
Received: from localhost ([::1]:56780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns6z1-0006ee-Fi
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 14:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wT-0003mp-BZ; Fri, 20 May 2022 14:01:37 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:41893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wR-0004Eu-Q0; Fri, 20 May 2022 14:01:37 -0400
Received: by mail-ed1-x52a.google.com with SMTP id h11so10584615eda.8;
 Fri, 20 May 2022 11:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=htzvdC/BCbW1MXiv7SG4+hSZfFR63Xit9ILua+9IyC0=;
 b=muuGr/R42A5/CZmvZB/V5AsCCioOxJ/JBA59qaG2l0sXezAsslmR8MCIH2Yn443IpW
 OBXaP9IRu8H7+RTh7v/0mtexxtUOyKu+jzZK095vsO8Ogu21Rkr9JX98/N4DVd/fWQGR
 DeN6bK02z9UwVbZEyDeC8Le7h01X2NzZxGdeBaXKB8Va5CEM9osnMuj1iLV+7PDV7OwS
 whWmkB/dl2LFFWcFvUJltVfoGB+qPkLl4Va/TztKVeXKbwIwtDqvRy2XqgtuUr6u8JUP
 VgqCiG0jPNF86w9c7NHq12hGeHKD6fVeLJIYF31XaVwCLc29AMRo5HD7l0p10KUSFXJ+
 qTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=htzvdC/BCbW1MXiv7SG4+hSZfFR63Xit9ILua+9IyC0=;
 b=RoM+lr9y4LjFETyBnCobt3KuFnbzO8TiSI3dBFqQkhm8F1UMewMtAlgjMkCYytosMX
 zbj6yw+8iEL2icwoyDM+fhFGliYg96NdvA8mHTnvX0bJyD+K7g/x6SvR+KLl78o9hlPZ
 WYcOGHaahX3gUiv0eM6K/Mv+6JAUpBg2ulsij0rJ2BuCTgToyVoOHgiItUDv0XOK9smT
 NEA00TUWoN/pOxJGiUrAQmpUGAKeyqJLP/ItqWtVjDACrXswPv5nJxXNSGhTvL74VVn2
 u1T5lPhPB5B1LXo6yn7gtSVSNcWsctukLYSRP+8DC0AkJnc9WcWxLDSnJV6nP/BVuNG2
 Awyg==
X-Gm-Message-State: AOAM532k1UKlKeHYuJuoRofB5ScS6LWMScNYQE9aUDxSzMd04mBJ29iz
 CC3xZFltxKnrpUU6ScXjeBLlxWXMa3M=
X-Google-Smtp-Source: ABdhPJwQCXBq5FFNo+rzueaNkje8Idux3A9fgWQ+KxBEwsMiFvBGeP5LPqQaS3GMqxoH9Kv38+V97g==
X-Received: by 2002:a05:6402:2789:b0:427:bc78:85c9 with SMTP id
 b9-20020a056402278900b00427bc7885c9mr12341509ede.50.1653069693782; 
 Fri, 20 May 2022 11:01:33 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-209-236.89.14.pool.telefonica.de. [89.14.209.236])
 by smtp.gmail.com with ESMTPSA id
 w5-20020aa7cb45000000b0042aa7e0f892sm4622029edt.15.2022.05.20.11.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 11:01:33 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 00/10] Random cleanup patches
Date: Fri, 20 May 2022 20:00:59 +0200
Message-Id: <20220520180109.8224-1-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
* Omit removal of isa_connect_gpio_out() (Mark)

v1:
This patch series contains random cleanups that I made while studying the code.

Bernhard Beschow (10):
  hw: Reuse TYPE_I8042 define
  hw/audio/cs4231a: Const'ify global tables
  hw/i386/pc: Unexport PC_CPU_MODEL_IDS macro
  hw/i386/pc: Unexport functions used only internally
  hw/i386/pc: Remove orphan declarations
  hw/ppc/e500: Remove unused BINARY_DEVICE_TREE_FILE
  hw/net/fsl_etsec/etsec: Remove obsolete and unused etsec_create()
  accel/tcg/cpu-exec: Unexport dump_drift_info()
  accel/tcg: Inline dump_opcount_info() and remove it
  docs/devel: Fix link to developer mailing lists

 accel/tcg/cpu-exec.c              |  4 ++--
 accel/tcg/translate-all.c         |  5 -----
 docs/devel/submitting-a-patch.rst |  6 +++---
 hw/audio/cs4231a.c                |  8 ++++----
 hw/i386/pc.c                      | 17 +++++++++++++----
 hw/net/fsl_etsec/etsec.c          | 23 -----------------------
 hw/net/fsl_etsec/etsec.h          |  7 -------
 hw/ppc/e500.c                     |  1 -
 hw/sparc64/sun4u.c                |  2 +-
 include/exec/cpu-all.h            |  3 ---
 include/hw/i386/pc.h              | 14 --------------
 11 files changed, 23 insertions(+), 67 deletions(-)

-- 
2.36.1


