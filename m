Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 972383A0425
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 21:38:15 +0200 (CEST)
Received: from localhost ([::1]:33524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqhYE-0001UG-Iz
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 15:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3tsa_YAcKCk8Cv4AB8vx55x2v.t537v3B-uvCv2454x4B.58x@flex--venture.bounces.google.com>)
 id 1lqhWT-0007hY-V0
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:36:26 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:43921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3tsa_YAcKCk8Cv4AB8vx55x2v.t537v3B-uvCv2454x4B.58x@flex--venture.bounces.google.com>)
 id 1lqhWS-0001zM-H2
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 15:36:25 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 q63-20020a25d9420000b0290532e824f77cso28332266ybg.10
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 12:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=5LX8/9AG8cYA4y9g3HrAOBw7qQRlU6SryOU3/B80moU=;
 b=EPsBvQKi79EceczMTKajanAnL/gXIVJ4MDuoMh+uEeuTQS6sBHAwKeElZeMVh7SNnS
 TSRnT6Tst5oYJBj/t8CQNtUcZR3e4tE8npYZBMIG60os1v4Guosr20Nx9yU9MUmRKlDs
 5aKC1xgx9foYuu/Lwyu/Dd1pX9PWGkEKHRsW+k4hxFKyGShCWHRxPiZvoSKXUzlLewzK
 dNxkpxQm6LxJMQK+YwR+IxrgXZaqFWS3nX2ifIMgvNHlKtCc+l1KFQecWxgStAaEthsC
 yMbfewHeai6bDXBJGhmNwGc6um6BTTmD3Cyt7ZyGA7oF/oy6uuSPBFj0NL6UWVzoPtT9
 vasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=5LX8/9AG8cYA4y9g3HrAOBw7qQRlU6SryOU3/B80moU=;
 b=mtPSOmGGdN7wAoFujcvPr/TNdcezP7jn0zeU0MU3GjFk/tWz0GimXuMj2ecF/Tkx3L
 9VnoKN2yCkEuVQSJ1B5M/S+FJEpUCRQWBdYZ/ycHz1OLCX57OVQHYuEgMPSxskSYYgdh
 9Qkv3fpBpm2NjMyMgZbTA8OWYC/8CH6Xrdm7HhlcOR6DPn+VN4JEebycZOvDYHy55Siz
 aMLx/WnFsaqvdIs7Q1rEG9YYXFww6UlJB1UoO8ODFbMYtd4My7+Dph+qFT3nSeitkdRg
 lIoOr72cwXSYnEP6y5nTv3sCZT8Ogm0txoKHBZzTcvkja6V2CWHF5XEJ1psv+EFwko4I
 TOeA==
X-Gm-Message-State: AOAM533q962ZU5c4oY+vif0ThpRG0hEuJtucJrzfTUXttd+13N+oP9AW
 8DX1nMbsn0s/6sGfuMbywOL0TCQwVyW4
X-Google-Smtp-Source: ABdhPJweKW+dFVDq27kSTjxNDCEfRRgHxfutE6NiHnFdLgJgSTeXfwwXtEJ9LG6pi0WAzOj3D8nz+Kdrovju
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:f886:41e8:7e16:711b])
 (user=venture job=sendgmr) by 2002:a25:7085:: with SMTP id
 l127mr35166833ybc.293.1623180982888; Tue, 08 Jun 2021 12:36:22 -0700 (PDT)
Date: Tue,  8 Jun 2021 12:36:03 -0700
Message-Id: <20210608193605.2611114-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
Subject: [PATCH v2 0/2] Adds quanta-gbs-bmc machine to nuvoton boards.
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3tsa_YAcKCk8Cv4AB8vx55x2v.t537v3B-uvCv2454x4B.58x@flex--venture.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

v2:
- Fixed missing hyphen in Cortex name and dropped TODO on hardware
strap value.

Patrick Venture (2):
  hw/arm: add quanta-gbs-bmc machine
  hw/arm: quanta-gbs-bmc add i2c comments

 hw/arm/npcm7xx_boards.c | 93 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

-- 
2.31.1.751.gd2f1c929bd-goog


