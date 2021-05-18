Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389A13880C0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:49:56 +0200 (CEST)
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5j1-0003Pu-6h
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xBmkYAcKCpMI1AGHE13BB381.zB9D19H-01I18ABA3AH.BE3@flex--venture.bounces.google.com>)
 id 1lj5gi-0007uv-Rm
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:47:32 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:43687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xBmkYAcKCpMI1AGHE13BB381.zB9D19H-01I18ABA3AH.BE3@flex--venture.bounces.google.com>)
 id 1lj5gU-00077E-Sa
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:47:32 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 129-20020a2504870000b0290513326cc5e0so2217766ybe.10
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=LsVPgL3TR/DLvNR166EDGInKD/HJObu0z2fv8TpJ1yE=;
 b=rO5lwvv6Opr3Nbkamv65643pioqO0vHSPf1ycfSmMz5VIvPJWb2OY2mqHvwzjQ91KV
 7iah783zLoZCnBURuV3NO7CuK0G82M4whSz5EZROZWI1BPiVh/lVvPn7zZYzbZ8q4EaR
 nwDOhWJLowcdx9UYcjBQwQSE+0+0ViGF6hITuJpnUIRDsm60cIQlbJIgWfd9UaoH4PYw
 S5WBSYzbR7ToIeVs4S+htcQVK2mjIlpDpGRfzscJ9Xt+23UNtyNKdC8cYZJ4m56ly/wK
 SuiBhE4u6QgvkWH/XPJ7L6LKXipG2LAmeinAJ1OZzJnvt3yfRX6jrRunrwmiTmYIRkFa
 FaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=LsVPgL3TR/DLvNR166EDGInKD/HJObu0z2fv8TpJ1yE=;
 b=QHR3z3nxXjp8UmSMqx0Lj0KYS/BNL08qwpioqYO9JCs4QzBwVkJnqoZCN5M7y9FyPV
 5pH7X58CnAabBvHI3a2kynB8nrHyORuIXNQgnZWbKHo05bioyJZChvfgpVmIWCrHJiWO
 nZgYBuWcvLHrp9fTRkq0Yy3q2AivwFK24yN9sPUX+ZoxhtP7oDa/lgP1Nw1jjvzKIjB4
 /S+3CySBJFUbVnYv385+1L4eat4nE/keHYesqV5pqfk+JOht+DMz52GaBu8w30xL9UbZ
 ///l4OnybmWaNEqn1wLxF2I/xZeHso/Aq25UW1iX4S6RYwtf0FA4e601pQYKKMsPTArp
 eckA==
X-Gm-Message-State: AOAM530Nwy+pvckfN1YphLLygpQyFJCjX3uPzCic70uiuEkfowdrWZDZ
 oMnbyGAhWF2HuTpKOqC5huijXKX6xyr0
X-Google-Smtp-Source: ABdhPJzVQIE9c5smIvNYoygqZXSvdGu/CseWSzC5qESIbM/Gm72YSVoa8fyTK4TfJGCzgG97YaiO3ba0y/X3
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:5902:8a04:d917:4e93])
 (user=venture job=sendgmr) by 2002:a05:6902:1147:: with SMTP id
 p7mr9592485ybu.3.1621367236386; Tue, 18 May 2021 12:47:16 -0700 (PDT)
Date: Tue, 18 May 2021 12:47:02 -0700
Message-Id: <20210518194704.764241-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH 0/2] Adds quanta-gbs-bmc machine to nuvoton boards.
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3xBmkYAcKCpMI1AGHE13BB381.zB9D19H-01I18ABA3AH.BE3@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a board supported by OpenBmc.

Patrick Venture (2):
  hw/arm: add quanta-gbs-bmc machine
  hw/arm: quanta-gbs-bmc add i2c comments

 hw/arm/npcm7xx_boards.c | 93 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

-- 
2.31.1.751.gd2f1c929bd-goog


