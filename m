Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9B0482CE4
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jan 2022 23:12:09 +0100 (CET)
Received: from localhost ([::1]:50620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n495D-0003pu-39
	for lists+qemu-devel@lfdr.de; Sun, 02 Jan 2022 17:12:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3HCDSYQcKCrkudmstqdfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--venture.bounces.google.com>)
 id 1n48zx-0001PW-Bw
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 17:06:41 -0500
Received: from [2607:f8b0:4864:20::c4a] (port=47063
 helo=mail-oo1-xc4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3HCDSYQcKCrkudmstqdfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--venture.bounces.google.com>)
 id 1n48zu-0006BK-Qe
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 17:06:41 -0500
Received: by mail-oo1-xc4a.google.com with SMTP id
 g2-20020a4a9242000000b002da7c459222so16544009ooh.13
 for <qemu-devel@nongnu.org>; Sun, 02 Jan 2022 14:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=dqiWh61Ltx0KweLLwdv+Yg6cUqnUGT6QGn0gQRY0MJU=;
 b=EY7SMYbmHdqMCbk6sL8wzaeuNZuuyHnPL5twbplZeQ95nMe02ab0qyTydcOj4grlyJ
 +48P3IjIX+iyNhCPQBoUsYkaJh4E5r7KC+rDikafoiBeQ/0h+CUFO7SuxPR7vyz7DjPz
 i8XeZeqlOM3AL+2S4EYY3lTqZlp4qRSRDN370s9ZRZ5RIQOw1T6+e/FRraJZrkp6FtAX
 5FXyyeX9oDuYbG4sfNsjgdzdO8wGR1DtQ6qt+bY4QobyZXCrs7JgVoFSBws6wqBEuIwn
 jTi975yGOuprUCPLckXl/sG9XCkqkjXyF8Fm/VLvzqoUemlKCUDvV9fBb0r3quQlC8Z4
 pq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=dqiWh61Ltx0KweLLwdv+Yg6cUqnUGT6QGn0gQRY0MJU=;
 b=7B8cTQAugTiX+kGFokv8SqmSqB8s75nbay8BkbvK1lfKCT77VolKd+D+Tjx6eWe1Th
 SjU+nU+7wRCGCXjdvYG/hR8MYf101tXd0vYDjZVWpB1hQvWj/ktekyP6wAs42iR9hzbw
 eMeNMENfl29dMpXKcPVvhpA72WenPiMPgQBGNeLHniCRkAKTI1kcERJ8fUgR/YQgzob4
 e0itkKfpGsAjIRhvxrrMDuVMXZxL/RIyI2IHKkmtan/dyPhBDKbS55p5Z2+HrLI42uJ9
 F6oHS4PusNJ+/41NnkIuAddm1euIuNidBRGf3WxpwDAn5v141YTvhxFlbLFVA4Srlpyf
 Jp7A==
X-Gm-Message-State: AOAM532ER8Y1LiyF0OhfXHL5uS1vtTzObKQ+hZkwZi/rUTLnwohDvuPm
 sM/dS1OSv0JFFB44spGwoMgv5X5I0yBU
X-Google-Smtp-Source: ABdhPJy6R0qmlZljbpI9Bpqg1nD6eFBaJVWmJYnF7aPPVFcKl9LiKRV4EmB3Jie9ZPN/UtcmTTNy/t4C4pqw
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:9adc:6d14:2e33:8585])
 (user=venture job=sendgmr) by 2002:a25:b081:: with SMTP id
 f1mr42622516ybj.409.1641160732500; Sun, 02 Jan 2022 13:58:52 -0800 (PST)
Date: Sun,  2 Jan 2022 13:58:40 -0800
Message-Id: <20220102215844.2888833-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 0/4] hw/arm: Add more devices to kudo-bmc
From: Patrick Venture <venture@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, crauer@google.com, 
 wuhaotsh@google.com, titusr@google.com, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c4a;
 envelope-from=3HCDSYQcKCrkudmstqdfnnfkd.bnlpdlt-cdudkmnmfmt.nqf@flex--venture.bounces.google.com;
 helo=mail-oo1-xc4a.google.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

This series of patches adds various devices that are defined in the device-tree for this board.

Chris Rauer (1):
  hw/arm: Add kudo i2c eeproms.

Patrick Venture (2):
  hw/arm: add i2c muxes to kudo-bmc
  hw/arm: kudo add lm75s on bus 13

Shengtan Mao (1):
  hw/arm: attach MMC to kudo-bmc

 hw/arm/npcm7xx_boards.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

-- 
2.34.1.448.ga2b2bfdf31-goog


