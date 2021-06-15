Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6463A3A8983
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 21:31:20 +0200 (CEST)
Received: from localhost ([::1]:58954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltEmN-00057I-EE
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 15:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3e__IYAcKCqofOXdebOQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--venture.bounces.google.com>)
 id 1ltEkA-0002yp-Mh
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 15:29:02 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:50807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3e__IYAcKCqofOXdebOQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--venture.bounces.google.com>)
 id 1ltEk9-0003KZ-2h
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 15:29:02 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 o12-20020a5b050c0000b02904f4a117bd74so21486180ybp.17
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 12:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=C1eohHTV0XUTMRXswyp0PNbGjOLyIuh1fCMrlfoaaGw=;
 b=eHU6FJTLz8/3I0hibSpsHOCC8tTEnA+vjKrWPgZwkRlzp3qIex84dZ31hCrwbhjMbb
 VS3tozo8jnvIXvF4jezx6mVHgPnz+dRlmiR0u5ReDu+m4WloO1Q4M5YUD9g6un+2mkR5
 5pv6OdZbGZhWt6JG5E6s+gM2v1SldQpplHtxcfK6hpkaBAVx0yz8Hit9K6bGx64pUntQ
 NSGiBVJ7aJaAPs2gQDK7RfDZ/bLyaimJKZxEk2pv/7/7QuLMnaNqRdHms2VsSqnXIWEg
 6TrF2IrJW13iQzb3tRv/fDE8wKgiaXriVwybAEY0HudUgsKuWN1aJ+t2nSN8vD9xmeBJ
 oogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=C1eohHTV0XUTMRXswyp0PNbGjOLyIuh1fCMrlfoaaGw=;
 b=gAIR50barmWm/Twh5c3Ea2Yk0faAH9KU+jGTcK/6YZyqycQ5HX1c6cCcDEI78fLVZf
 V0H7icXQ0qPfvuibXUZozP/58q9ZchRf1iOQ/3D2WDcZGzZlHRwyDNAJu1l2znaHB483
 Is5dfSf1oFWfVypcrrMPwneWj9HDUI12Xrgocqwdwrws1At5JzWWisJhjjYx2DKeBjD+
 Vby9c8J40H/0l4xUMelAdQTVXpxXRpTxFebq3y581bVeD5vg7+OLqoQTRWwUEHhNMmQP
 rs3N3RHqPk0GeN4cmiHMLNf3wTMoXuu8SmAAgBjRaPX+eKy69XXDk1Y7rogbHi8mtXqj
 rIpQ==
X-Gm-Message-State: AOAM5339vvUXhKCJUL3mCWOE6NylScd/mVQqoe/qGNdcg1yZB5cVGYlm
 rgXj/07lAZkpU21bYvIrfrh0ImYi4AEw
X-Google-Smtp-Source: ABdhPJzxG9okYhZ5yNQRnCNFzZiDegn9NTmQjBHgoRCypC8O9ymhjXBecCDKu6WujiBm12ZEELTU2gMfw0dg
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:abe8:110a:b827:ef39])
 (user=venture job=sendgmr) by 2002:a25:218b:: with SMTP id
 h133mr1038915ybh.160.1623785339189; Tue, 15 Jun 2021 12:28:59 -0700 (PDT)
Date: Tue, 15 Jun 2021 12:28:46 -0700
Message-Id: <20210615192848.1065297-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
Subject: [PATCH 0/2] Updates docs/system/arm to include new bmc machines
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org, 
 clg@kaod.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3e__IYAcKCqofOXdebOQYYQVO.MYWaOWe-NOfOVXYXQXe.YbQ@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
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


Patrick Venture (2):
  docs/system/arm: Add quanta-q7l1-bmc reference
  docs/system/arm: Add quanta-gbs-bmc reference

 docs/system/arm/aspeed.rst  | 1 +
 docs/system/arm/nuvoton.rst | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.32.0.272.g935e593368-goog


