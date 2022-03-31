Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD954ED2FA
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 06:42:11 +0200 (CEST)
Received: from localhost ([::1]:43208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZmdP-0002RR-1f
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 00:42:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <38S5FYgcKCnwptrqtinlttlqj.htrvjrz-ij0jqstslsz.twl@flex--komlodi.bounces.google.com>)
 id 1nZmbp-0000WU-94
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 00:40:33 -0400
Received: from [2607:f8b0:4864:20::f4a] (port=34580
 helo=mail-qv1-xf4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <38S5FYgcKCnwptrqtinlttlqj.htrvjrz-ij0jqstslsz.twl@flex--komlodi.bounces.google.com>)
 id 1nZmbn-0002qm-NU
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 00:40:32 -0400
Received: by mail-qv1-xf4a.google.com with SMTP id
 z2-20020a056214060200b00440d1bc7815so17708963qvw.1
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 21:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=GGfpj726lfuwBPg4kAvGdiQVEKoenoTK47uxeWfoqag=;
 b=QiXtu+T8P54wOrT/9ixxN090Id9w+LDiE2QvY/A2QCR//M0yTfJfwqVgKIsYmoaFgs
 PGYlkzewaDs+hPogDPgp+PYrz8bLs2QEPeIUiiQi0X9UrP/2joOYg90uwwtgPdEggYOp
 lSL8U/xqXwF+cAToU7R+DG8hf2Vn3UYVCn2RsFEut8DAHRMTlh/an+MN1cRIqHul41R2
 tQSmFd2codW3QcP0XTkw1nSxhQgx/x30P1ShQz1c3JY6JyeLukj4TjA2KTCeaTbsqbuC
 Zw+huwWvh83ACak6Gzj4CFyKBVrICqvz3vvag+qdsc5iVXLT/giA6qJJ4FlWuMqhYaHf
 5acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=GGfpj726lfuwBPg4kAvGdiQVEKoenoTK47uxeWfoqag=;
 b=a0SqibGliLDCQIchm6vlH6tmHHKQKkFVUfKoeEUCwGLdh6e3R0tRAs4z6vYktEFKIe
 33+9a/QUSb5gY0oEsTBKKgN9B/B0Chi1nad6K7HXYrPk47jBlRZFdlSNoNZqdRaJWNeH
 ipEfMqsEckp/R/HHxx4sDaVBm1PAxG9G9nCfo6jGmu1X+lsYzahb35IN2kLvEWxiARzc
 pNPwBAH/zC8zPUGEVD+d74KgH++btdiGx5GGwmoZIVgqEX2ybFqQgiZSYMa/m7csKxcN
 Q3qXaL05zwCkTgSDUeywwizSnuIJQik0f/F91djtEBzfL10rhJGD51tEGc2uj3OTBZ6w
 lv0w==
X-Gm-Message-State: AOAM530vtK6WhCFfkAKmtNMIEK1vsYitvJ4Zk6Z6h+sHe+m2Ry1pO7h+
 rMXcMfCfh5lOTJyjqTi6K7N97TbRqPq41+qXbC7FCXRt6U2oZmprNhfqeFLBcCDTI13PSFsTJUJ
 c3I05F8XgwE82rrOmIYr5qjlJFEWZ+d3W32kjiyeoO3zcifHTnmZ7v/Puc/1nwHM=
X-Google-Smtp-Source: ABdhPJwW50maYtdyq8rxDVNTe1VVQnbu8PrOJcCS37w+jyesxa/tklm3mW2sAC+CqmcwRYrWDn3jjXvnSIBf
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a05:6a00:22cb:b0:4fa:ad77:1510 with SMTP
 id f11-20020a056a0022cb00b004faad771510mr3447689pfj.80.1648701169719; Wed, 30
 Mar 2022 21:32:49 -0700 (PDT)
Date: Thu, 31 Mar 2022 04:32:41 +0000
Message-Id: <20220331043248.2237838-1-komlodi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
Subject: [RFC PATCH 0/7] aspeed: i2c: Add new mode support
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au, 
 venture@google.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f4a;
 envelope-from=38S5FYgcKCnwptrqtinlttlqj.htrvjrz-ij0jqstslsz.twl@flex--komlodi.bounces.google.com;
 helo=mail-qv1-xf4a.google.com
X-Spam_score_int: -81
X-Spam_score: -8.2
X-Spam_bar: --------
X-Spam_report: (-8.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

Hi all,

This series migrates the Aspeed I2C controller to use the register API,
and then adds new mode support.

New mode has some behavior changes and a register layout change compared
to old mode.

The series starts by adding "shared field" macros to help simplify logic
when adding new mode.
Generally, the macros are to be used in cases where register locations
change depending on what mode a peripheral is operating in, but
the fields in those registers have the same offsets.
Specifically, this happens very frequently with new and old I2C modes on
Aspeed I2C.

After that we migrate over to the register API and then add new mode
support.

Thanks!
Joe

Joe Komlodi (7):
  hw/registerfields: Add shared fields macros
  aspeed: i2c: Add ctrl_global_rsvd property
  aspeed: i2c: Migrate to registerfields API
  aspeed: i2c: Use reg array instead of individual vars
  aspeed: i2c: Add new mode support
  aspeed: i2c: Add PKT_DONE IRQ to trace
  aspeed: i2c: Move regs and helpers to header file

 hw/arm/aspeed_ast2600.c     |   2 +
 hw/i2c/aspeed_i2c.c         | 792 ++++++++++++++++++++++--------------
 hw/i2c/trace-events         |   2 +-
 include/hw/i2c/aspeed_i2c.h | 282 ++++++++++++-
 include/hw/registerfields.h |  70 ++++
 5 files changed, 828 insertions(+), 320 deletions(-)

-- 
2.35.1.1021.g381101b075-goog


