Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6101F4C7730
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:12:04 +0100 (CET)
Received: from localhost ([::1]:46058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkV8-00072n-U4
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:12:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOkSa-0004uQ-C7
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:09:24 -0500
Received: from [2607:f8b0:4864:20::435] (port=36701
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOkSY-0005wn-AS
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:09:23 -0500
Received: by mail-pf1-x435.google.com with SMTP id z16so11735835pfh.3
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NC1ugHKRUYWvOHthNyCb6PZ0afO6/sBdy5Q2qHRUp+Y=;
 b=JaaYGBHqI7MbXHtPVvixWrjNZx5pqGWF7xSFAfyPN5DnSYNrt1PrBXffN/32rMpBxZ
 LP+XwLffa/w+iczcKw8tEnF3O5OqP3GpGuHXocC61uZiIfXp1Lbk9Hq6KV7jrFH7F/Rx
 cK85j6vp5NB3UJ2bZLysqfilObwBjnP3C3gXTaGwljW2rydjqYBTOYYCr1wwaWJdDR+e
 JXn8jMI49rBgxDDnA/HjD+tro9Ny24rho0gCx8Qq1KU6ltK6UWK2OAv1pJGRry6uYatc
 MyvitXsS7u+uyJ5cqyPoDke5RSgV3RclkGI147P51cpxCQ20g5OUmNmFrKSZ10SAgAmJ
 3DPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NC1ugHKRUYWvOHthNyCb6PZ0afO6/sBdy5Q2qHRUp+Y=;
 b=YtgKakQgA1W8VY5jrXEwqfJQSfA45nkp6oAPjuaW5f54Q3u28fO4CzD5Yq0CsrEWju
 Ih+ap2uBcugDQ/SKVytWW9kOFbC9+rx8VP/tpz3C9MQ8AFrcVZoUHNpBmnCn1hf+mobH
 cTfdmJv0mzIbuKw8IdLdtAM7Weq2mFrpEkRVljhPPFncJFXATbGoZO7ag4dVrT9MI7DJ
 Z57djo9u2vWkb9xvu8O4mb/DAILhLLgowKeB+tuvSFQyM10HQYRxA4JIp2pH1b4h4Uch
 +CqvyzyOVNo6XvL5lhUWyImGTiQd5bjJ7Ipr4TLgNYEM2tncT6iFcAojrSDQ/++CkXf4
 F91A==
X-Gm-Message-State: AOAM5321eGqzeu8NDcGt9buFZbu5Vl5M0MrhIrrjHgrMhapsXxKLceL6
 4kCtWTKNPHDV6oSZ/kL2w8RVe2BVWfCMtg==
X-Google-Smtp-Source: ABdhPJzFXBoGJgOalECD04gYlecEXWnW3PLxcD/SvDKp2pvpGE5g/OsHKI56SlZIkdPO+TjNPG7q4Q==
X-Received: by 2002:a65:6d09:0:b0:378:5646:24c2 with SMTP id
 bf9-20020a656d09000000b00378564624c2mr12359133pgb.522.1646071760752; 
 Mon, 28 Feb 2022 10:09:20 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 q24-20020aa79618000000b004e0e89985eesm13463223pfg.156.2022.02.28.10.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:09:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] tcg patch queue
Date: Mon, 28 Feb 2022 08:09:15 -1000
Message-Id: <20220228180918.38188-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 00483d386901173e84c7965f9f0d678791a75e01:

  Merge remote-tracking branch 'remotes/shorne/tags/or1k-pull-request' into staging (2022-02-28 11:27:16 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20220228

for you to fetch changes up to 2ccf40f00e3f29d85d4ff48a9a98870059002290:

  tcg/tci: Use tcg_out_ldst in tcg_out_st (2022-02-28 08:04:10 -1000)

----------------------------------------------------------------
Fix typecode generation for tcg helpers
Fix single stepping into interrupt handlers
Fix out-of-range offsets for stores in TCI

----------------------------------------------------------------
Luc Michel (1):
      accel/tcg/cpu-exec: Fix precise single-stepping after interrupt

Richard Henderson (2):
      tcg: Remove dh_alias indirection for dh_typecode
      tcg/tci: Use tcg_out_ldst in tcg_out_st

 include/exec/helper-head.h   | 19 ++++++++++---------
 target/hppa/helper.h         |  2 ++
 target/i386/ops_sse_header.h |  3 +++
 target/m68k/helper.h         |  1 +
 target/ppc/helper.h          |  3 +++
 accel/tcg/cpu-exec.c         |  8 ++++++--
 tcg/tci/tcg-target.c.inc     |  5 ++---
 7 files changed, 27 insertions(+), 14 deletions(-)

