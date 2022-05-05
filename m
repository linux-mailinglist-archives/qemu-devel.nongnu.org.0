Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB96B51C535
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:33:54 +0200 (CEST)
Received: from localhost ([::1]:52306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmeQL-0001MT-L1
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBK-0001qT-9o; Thu, 05 May 2022 12:18:22 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBI-0005hv-Mh; Thu, 05 May 2022 12:18:21 -0400
Received: by mail-ej1-x634.google.com with SMTP id kq17so9712526ejb.4;
 Thu, 05 May 2022 09:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tv9AxzODnRCu/J/saD9DSTP9AfGHSVWnR2amh5NSPzA=;
 b=Px7ZpOIWMZ6VXB//G+gEYOVhSOV/jLq6sspe3u09F88Vb9c1EbdQtAnxNdApQK/0+R
 huFAPYdF6SkjbMWbCX04gNnNg+j0/FDajqgXMyjBLfTAH3y6/ez8ClMb3rwEp62e5iHN
 CO29q01s+dkxyVz6bRtiWFq2PsXE1JQUXCfsgUACbI6ryKVEzMnPs92+Uth7gRMZ3UxK
 BEz+WFuj8Ed/NRXVfs9zTwzDO7XbTa4Qc0cLe4zW1neimWFp+DldUnp1y/zF3tkeOkEh
 c9XL+F9tQnnKHIUv2i9GUi6oR6CybvnS4BRKv+7d23rzalpcZRz5G24TJvU0W7PQHyPO
 Hj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tv9AxzODnRCu/J/saD9DSTP9AfGHSVWnR2amh5NSPzA=;
 b=Z0pdtyLLsvTMz3OIF/l5Aw8xbBZs1uRiVmDbgKKHe4/rAAF3X9tBqw51aFBliI5aDr
 381AuNf0ZQt6MarKnJp2uPHWCSs1tQB+jsJu+QNQoatqsu4YQUCygneTxJXB3Ylpyxvl
 iY5VEFVbMwZGHvMm+PEN6islODny2O2FKPvj2tYADcyCgARHsJZCf/Xl9MCPO9h1MKOr
 BjJfzUO0y3T3yjraoLl2jFhEmNo/8xRaCT8ClFIVUTIxeSUnZjAOEyEPDKWUZyH0MWAa
 HQ4lWRMH1/KXiHg5b4dBIBYINSfLRBKf60enoFAyfHUclp4SbsT+7ZdCe8osQpdZqQuH
 OJyQ==
X-Gm-Message-State: AOAM531P/1djnvpd4yczJwWQxzWjsP9GS4JxwqpDBdoTsU+pzU/jjLo4
 obtbSj4Vr7Uy5NWoM3tw4asRhP3/YxE=
X-Google-Smtp-Source: ABdhPJx9VeNC5HURScCTmro1xdR/GFGWn907ElqwlfbhC8XCB3H2gZirH0vt+wi5OHzhYEaE+D+G9g==
X-Received: by 2002:a17:907:1c82:b0:6f4:d2ee:2f8e with SMTP id
 nb2-20020a1709071c8200b006f4d2ee2f8emr8358140ejc.714.1651767497950; 
 Thu, 05 May 2022 09:18:17 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-123-159.78.54.pool.telefonica.de. [78.54.123.159])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090685c600b006f3ef214dcfsm868542ejy.53.2022.05.05.09.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 09:18:17 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 00/11] Random cleanup patches
Date: Thu,  5 May 2022 18:17:54 +0200
Message-Id: <20220505161805.11116-1-shentey@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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

This patch series contains random cleanups that I made while studying the code.

Bernhard Beschow (11):
  hw/rtc/mc146818rtc: Inline isa_connect_gpio_out() and remove it
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
 hw/isa/isa-bus.c                  |  6 ------
 hw/net/fsl_etsec/etsec.c          | 23 -----------------------
 hw/net/fsl_etsec/etsec.h          |  7 -------
 hw/ppc/e500.c                     |  1 -
 hw/rtc/mc146818rtc.c              |  3 ++-
 hw/sparc64/sun4u.c                |  2 +-
 include/exec/cpu-all.h            |  3 ---
 include/hw/i386/pc.h              | 14 --------------
 include/hw/isa/isa.h              |  1 -
 14 files changed, 25 insertions(+), 75 deletions(-)

-- 
2.36.0


