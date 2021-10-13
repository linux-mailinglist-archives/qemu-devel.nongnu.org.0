Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E7E42C7CE
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 19:40:32 +0200 (CEST)
Received: from localhost ([::1]:45742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maiEw-0000sY-Fo
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 13:40:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maiBz-0007lv-54
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 13:37:27 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:33532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maiBw-0003wm-QQ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 13:37:26 -0400
Received: by mail-pl1-x635.google.com with SMTP id y4so2371331plb.0
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 10:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CHVcGyJ05q94XaZoKWW7eQtFGoL0z4rDxgBC/jfinRE=;
 b=O8mQsBXaQirlyvXD/f4v5ydksQVWV5RsV5fGGu3V9UixG4UC9xdf53gqgKiSo6hMae
 Tbdu6Yeul9PrM7wAMmec+jSU8w32AADvI9kx6RLsS0EBgnkFbcEFQegPOfP/ETNNiUI7
 W3SSNSugHoQws361fWVFoL02eiv43/hHWBzyaCf3PSn1F40vauASOuEsb/RfbOtBEs+v
 aSF4jFBTbGcBT057UThnCfXoqSv5y0tTka7/r72aRJKc8NSkFxdc5XFsNlxOxCsS5N4D
 7VEMtJfOjyw9a3ecPgR06W0Or/9ZpJyTtW01fiTm2hrKk6c6tBdZyFA0bDDjbl776jgE
 Q/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CHVcGyJ05q94XaZoKWW7eQtFGoL0z4rDxgBC/jfinRE=;
 b=PA3KEjFMoc44706jSdtQsBmOxsCrhMXVY3WTgEA0pZPzik0buu1KtnT2FEpTJo5QXW
 aXxsr6b2nygp1JutDaUnAb66AnqNiMt+G2QRy1bqXB4Awff14p09PRTtTz/YMh1YCTX5
 vwkq1Ii5eEqloSgBs+XGZqD71TWZK5bWrtRO9A6+q/LZG9aGeFmoCw7dbV4SCGO/12ZW
 IikQk3Hdv/Lnhz1H2shBItobd8bt0OuLpHPHPExNK+eXueJF8rILX/u/T4ci8X41vS9N
 pbfpiUzkihOAu9Z5bWylJAxnntB7RHCI3Tg0QceVrOIFF2SEt+BpDpAqAbhQYco8MHlc
 Iu/A==
X-Gm-Message-State: AOAM532JDe7/rsMJlu3rMkx8w4zMfj1iseGcdpOpWDhUaKbCWSszO5b5
 5X3OT/mKt/iBG9IbCtIWrEHwhhAMBHo=
X-Google-Smtp-Source: ABdhPJxIIokG1hV3UTLE2Vb7Z1zalUQKSNP3xc2ojRSLEILG56bqmoaTacL6RRi6uGnJxpY7dZIVqw==
X-Received: by 2002:a17:90b:4f88:: with SMTP id
 qe8mr629048pjb.223.1634146643033; 
 Wed, 13 Oct 2021 10:37:23 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm1797408pjb.27.2021.10.13.10.37.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 10:37:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] target/alpha update
Date: Wed, 13 Oct 2021 10:37:19 -0700
Message-Id: <20211013173721.989655-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ee26ce674a93c824713542cec3b6a9ca85459165:

  Merge remote-tracking branch 'remotes/jsnow/tags/python-pull-request' into staging (2021-10-12 16:08:33 -0700)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-axp-20211013

for you to fetch changes up to 5ffcb33426aaa2906daea2eee7a5195662a6580f:

  target/alpha: Reorg integer memory operations (2021-10-13 09:18:23 -0700)

----------------------------------------------------------------
Cleanup alpha memory ops prior to prctl PR_SET_UNALIGN

----------------------------------------------------------------
Richard Henderson (2):
      target/alpha: Reorg fp memory operations
      target/alpha: Reorg integer memory operations

 target/alpha/translate.c | 173 ++++++++++++++++++++++++-----------------------
 1 file changed, 90 insertions(+), 83 deletions(-)

