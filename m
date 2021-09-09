Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42903405806
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 15:49:33 +0200 (CEST)
Received: from localhost ([::1]:32854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOKQm-0000sW-B9
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 09:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOKOs-0007sp-Lm
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:47:34 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mOKOq-0005JA-OT
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 09:47:34 -0400
Received: by mail-wr1-x431.google.com with SMTP id t18so2697646wrb.0
 for <qemu-devel@nongnu.org>; Thu, 09 Sep 2021 06:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8s0eFTRsUnLLbRXuZfQgMWA4BuSzg8LkOZ4/rwa3w50=;
 b=X/hL3kdGcIYgGgbuyH7JMyTyJ+//cM3UG0UcyfEW5hRPuSFGdcxua2ooMQctd0teMc
 A5SaZIgqrOTafNfUTghMtaAttZ7dB1QNyeQWZQ+r30SbdvmfTIhEE2/ROmaxxXtBMqSY
 2c5WDfcJilM480BJljcMF5C9bFr7jerdDFSiPzz+cati8TtuFWs+Pj9lgtslN8LfyD4R
 L5AduXiHOSG2G7DLxgHEwTPpCa73brpTfDyJsepcMiqAtnXVO/vFbmaLYskUhRxDazQ8
 +u8UfL6J0MgPE9yP/og9QSKtIcabOwq4sP1FgYW1daGqA0Gxky/K8ZXv+CWuZx5i3TKG
 hyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8s0eFTRsUnLLbRXuZfQgMWA4BuSzg8LkOZ4/rwa3w50=;
 b=tSVzcYWbE0CDKJU9V6GN20NB7Mf3U2xuwd+foGVMN3McaOjsbVJbfoMK0A54Bj0iLI
 pD8Qd17M+3zUviEVBdrNmDGTkuEiNO9TMswT58eqgmp0kEDb3wqASZbNKq5cXYA6+pUj
 kFGQm9yiQQ0lzQKCcRaqVd6m0mTnvyNHr2OutF+KIapBnd9X8GKVMuACJgrqpugwIMfO
 3d+pTth7n4g6XAN5z6I7KvDIkGSgUv0uirNlPNxb3Q9AS4qxOhEx5VZEn4RLAg9jkJey
 FpM05WXNfLsiaRgvQJq/w/PKYQoeZLAasAks8NH7VnIQrubJ7CRXpKiY5axjUfDdY7qW
 p0iQ==
X-Gm-Message-State: AOAM530YXf7E1KcIZFEDe9d0Gdnx8BqR+hUf/xW7PQyO4fWqLs+D/OAU
 T1SauIm5wo7pMX6B6+ZPHj9Ye9tOZXxgroSQV7eASw==
X-Google-Smtp-Source: ABdhPJzO9eP529PgilgDwxxi6sLRFsCnYdEMyigmC7URY62sTsCK6veryxzKyzI6rFiGVXr89mU+B3q+rIe12fsNrFM=
X-Received: by 2002:a5d:4647:: with SMTP id j7mr3737536wrs.149.1631195250255; 
 Thu, 09 Sep 2021 06:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
In-Reply-To: <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Sep 2021 14:46:40 +0100
Message-ID: <CAFEAcA_xUSMEoT34fkwiGef8D5Rwfkvre8o03YqgEw-qD86o=Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Sept 2021 at 14:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
> I think you need to go ahead and end the TB and resync immediately.
> Just set dc->base.is_jmp = DISAS_UPDATE_NOCHAIN instead.

Is there a rule for when we should set is_jmp to DISAS_UPDATE_NOCHAIN,
when we should set it to DISAS_UPDATE_EXIT, and when we should call
gen_lookup_tb() ? We seem to use all three methods at various points
for "I changed some CPU state and want to end the TB"...

-- PMM

