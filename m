Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989543B40DB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:50:42 +0200 (CEST)
Received: from localhost ([::1]:39208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiTx-0001R2-Jv
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4H-0004s0-Bb
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:10 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi4F-0001re-Mz
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:24:09 -0400
Received: by mail-wr1-x42d.google.com with SMTP id l8so1054098wry.13
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ogN8LU6jvlKXrmDdhXY50C3EJp0l5oxhM+0LviCV4xo=;
 b=tkXRTQpMLKbHpHkiFrN4EK6heOQI2VTZbm+hK6gapbFMxuWyUZLdE/yq1TrBdqdnOE
 tjVVOJN+ZYNf8Ki3pk8cMpSrmLP7g1GU+Nv/UgYI06KCHB+0/yarKzHDa5VzDhRPKxsc
 NRheyXPPD3U5mt8Vht6XcWRC15/yLy7zHTb7Ei5Np0VAwP0o0ahqpUHUFaOOwFT0ETvZ
 CoYpzdAVGYNfh0EiJ7v/WAzHErse8YeyI/cVKy6kpmiqdXyrkLUBiA8/c6YsQAp4hMf5
 9jmSZSaGadXwD2YqADdWanblxCp4hrsVa2T9VhO9Qyf8M7MVsUSF5K00jWaqkzJUYjLg
 tVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ogN8LU6jvlKXrmDdhXY50C3EJp0l5oxhM+0LviCV4xo=;
 b=rh7DYDwUTyPNepNLf6+OAXsKrVeG2IloPrqD1hFkS6hQi13nXoLhoKcTME0XP1MF9T
 g2ozQeyGsk99sqiZ0J6PeOPE4r5YcQN1QIgxBOQMDq8uVvA4ezhdTAZ/zc7RwoKQ9z05
 QDA1hAnT2kUH1/J03MlNniSUvkanjTSKijnBBWcb/rxUQ1JecmfHp5dxzE1qeaDPWRix
 bF0dDSvNkASHqglDX5CzHm03/fVe1QoGIin5Vc69gpy1sVmvynBoDiAyYjWXPfKlerwu
 2APJph3iHWculzMhDU13fxsAgLSpsJccAuK2G37lrMJpXQVneocXGPH08XhalJTp5kgg
 flqA==
X-Gm-Message-State: AOAM530WEavWpJuk11AxlHgHfecBg89FjkMVvxLtGkADqyiSgZjSThn/
 urd8+JJYlOdffjfPk3z1CrPL/iGnQcfXjA==
X-Google-Smtp-Source: ABdhPJxgIJPkux/OCx7zevRoyoYoAdZ0JkzfafKvHgETVe3hy1Nau6zcQ0wofUmLiH4/Mt+liCQfuw==
X-Received: by 2002:a05:6000:1788:: with SMTP id
 e8mr9950834wrg.218.1624613046344; 
 Fri, 25 Jun 2021 02:24:06 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id e12sm5595668wrw.34.2021.06.25.02.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:24:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/15] target/mips: Move translate.h to tcg/ sub directory
Date: Fri, 25 Jun 2021 11:23:21 +0200
Message-Id: <20210625092329.1529100-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625092329.1529100-1-f4bug@amsat.org>
References: <20210625092329.1529100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We moved various TCG source files in commit a2b0a27d33e
("target/mips: Move TCG source files under tcg/ sub directory")
but forgot to move the header declaring their prototypes.
Do it now, since all it declares is TCG specific.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210617174323.2900831-5-f4bug@amsat.org>
---
 target/mips/{ => tcg}/translate.h | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename target/mips/{ => tcg}/translate.h (100%)

diff --git a/target/mips/translate.h b/target/mips/tcg/translate.h
similarity index 100%
rename from target/mips/translate.h
rename to target/mips/tcg/translate.h
-- 
2.31.1


