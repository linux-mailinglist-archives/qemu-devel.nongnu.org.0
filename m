Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47EB3A0521
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 22:26:50 +0200 (CEST)
Received: from localhost ([::1]:52332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqiJF-0001kG-Ez
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 16:26:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3OdK_YAcKCugfOXdebOQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--venture.bounces.google.com>)
 id 1lqiI0-0008P9-FQ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:25:32 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49]:37468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3OdK_YAcKCugfOXdebOQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--venture.bounces.google.com>)
 id 1lqiHz-0001Ks-1r
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:25:32 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 g9-20020a25ae490000b029052f9e5b7d3fso28262599ybe.4
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 13:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=xhiM5LH9tk8kUEoTgO7t+5DVMEAyK/fb1QRXKuhYQPY=;
 b=fMUpTWBXBYThyj5f1b0CQo7R2n+9XHsKppAfXVk+WoLF+dP8Jn7P+4l9LnsNjf6uwY
 ZlycxhQ0GYapvYsxvZXhWdIHHNHxm4E8EbatVp1d5sNKV5qEI9/3O/2L5S7lf9d709Wy
 z+MsOpORQPWVv4q9GHkpsv4bbAv16OAjZX1YVcppzrIVuyRm1fZQnUtKfA4985gN4ZxP
 lFKgrfz8RHV/InjU+AHDlG2NyrxMu3KPAlDb48mAnUb+jAvJxBpVtxe6VwHdtbatNLXZ
 IUjGW1kAO4Qbrk+XlI1bqlxLqrz+evUXGLGw9WGA1N9oqScCbCU+8t/ReEtGMqBU42zF
 hLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=xhiM5LH9tk8kUEoTgO7t+5DVMEAyK/fb1QRXKuhYQPY=;
 b=uJ7sSZtSygc3hmbbX8yzQ8+4eVW0i/STkTp4WYaV7BSqJzGQYO00ZIUXRZbs9ADy/A
 U5Y6n7sLwbbadg327XDzGv1LhEibL4nk5J9ujIQSOM+xS0/HaK00TqHYtjzd7/cJUtQm
 /inw3rMDYrkP8/ylW/QKlobOpS7rMJJWwZr4zDiWP7oew0nAXOldJ33VMpBMi7QlweCt
 agaVzQYGukwM/XEE33ZqRmf63PxMqgb9dO90Cmkhli0bxwMj9GqfrhpigLQ2m1tC/xYk
 TDGjWzoFlUT6o3r3JUroIDGoPGOyC+4ovZYvlF4AmT/istCbLeUMxIhpN/iSN2MqRag3
 +h0g==
X-Gm-Message-State: AOAM531/GqK7t3SZsWvMjGBqH4camlgP6FfSAhdrjUzjb/B7IG33q4QA
 TNS/urUstvHIcxewgKodcmLfHqqAog/v
X-Google-Smtp-Source: ABdhPJwjwR39VANvMnsUp5ei/a6z65YtZAzkJXfskUzD5vYgYoGVVWmSoPOE76usRBlqfuHgV0c574Fhsj8b
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:f886:41e8:7e16:711b])
 (user=venture job=sendgmr) by 2002:a25:e803:: with SMTP id
 k3mr32687281ybd.268.1623183929261; Tue, 08 Jun 2021 13:25:29 -0700 (PDT)
Date: Tue,  8 Jun 2021 13:25:19 -0700
Message-Id: <20210608202522.2677850-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
Subject: [PATCH v2 0/3] With the pca954x i2c mux available, enable it on
 aspeed and nuvoton BMC boards.
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, clg@kaod.org, 
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3OdK_YAcKCugfOXdebOQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--venture.bounces.google.com;
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

v2:
- Dropped sonorapass patch.

Patrick Venture (3):
  hw/arm: gsj add i2c comments
  hw/arm: gsj add pca9548
  hw/arm: quanta-q71l add pca954x muxes

 hw/arm/Kconfig          |  2 ++
 hw/arm/aspeed.c         | 11 ++++++++---
 hw/arm/npcm7xx_boards.c | 14 +++++++++++++-
 3 files changed, 23 insertions(+), 4 deletions(-)

-- 
2.32.0.rc1.229.g3e70b5a671-goog


