Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D491136C851
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:07:49 +0200 (CEST)
Received: from localhost ([::1]:42960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbPJU-0000AT-V7
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbPBK-0003oT-Dx
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:59:22 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbPBH-00058O-Ax
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 10:59:22 -0400
Received: by mail-ed1-x535.google.com with SMTP id z5so33826245edr.11
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 07:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jMQA7MQFqdIqSePnm1Lm8XKO8WRx/PB1IoBI0gZbtag=;
 b=aP0GH/LpZw0gJXd7Nt8vXgSrhGhKNBORYMQtFjHVZ0rmHDNijkrOkqR0uBEq+FRxQx
 MYR5G/bLOtMFFTv2fHcrJU8MIPPVDzPO3UI9CJUNzVSbtwlqdhlcTbOKec3g6W9d41/M
 Ub6yZg8303pE/BUfAZ/LSFIPsJQhKSxDOEx1SQWa7x/tgTzGK5LQ53FjKasrsfRsD0oM
 8QiZHILymOa2IC/0noIccw/L65YSL49UIrQNlYAhIixX/UyP4lrPHD+s+EGZUJTJmcdi
 uM8p6aPbGZvw7ER1BODMGpu0tMdx/3+AvDir/lw34y/U66UIXgoHzjYT685iM77b3wBn
 FyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jMQA7MQFqdIqSePnm1Lm8XKO8WRx/PB1IoBI0gZbtag=;
 b=RpzekiDds31FqOCcGlLgfWm0QX2cGmq+q+olzXK2unDyHeIvz51iy3LBd2EwQ2sstx
 Oj/HzWaDCH1ofIMueW2FcBLPA2f/IJJFG6BfwzCh4gQJCoI8TDAlG/6QDg1/ncQKD6mE
 DG+nvANRUOZ6FbKr+pvXiCJY8Q92AZPfC2cplnhoCZll/+UTqClPSP7W+y9jicVzxhvy
 M5PvnT/M7iZfaJYa239c/kgi+CGawgpjGSQ+7UsbvA6FO4E9sgYpDc1kkN8/Lr6UW4UE
 JaplDrJtwmoMf/bab2GlH80Z7eQ1uLtHRklOEZNFb46c9zmdZn36CMvOR+AS2oQplars
 sN+g==
X-Gm-Message-State: AOAM532huPySxF+IvGuIVs3HRFYQZgZ+UlQBbWu1HoBljJK9v4tkrWsz
 aklExnpRQUeCvSJJBXM3tBQQK3VxfT+ODiRpo0oRLzm0g1Q=
X-Google-Smtp-Source: ABdhPJwgyYjWi3oT5X/3mcyU/IK8tJJtPIOV443y3Ck01av2ADTz74dYGboCPfPBXe1HSVgJOLIYeoHdJrMvIi5owT0=
X-Received: by 2002:a05:6402:51d0:: with SMTP id
 r16mr4920320edd.52.1619535557501; 
 Tue, 27 Apr 2021 07:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <CAFEAcA8a53rCGBGVr_mb0fVJPXFaCShGTJE0bh=L5Nvw6ATz6A@mail.gmail.com>
 <20210427095458.3hbckyqbmfztcmge@gator.home>
 <CAFEAcA82VJqgD+B4gCr1M0n5oV869rBdoTzNS6xSs0f2f8iFvw@mail.gmail.com>
 <20210427144819.fiecdpdgre7tznvq@gator.home>
In-Reply-To: <20210427144819.fiecdpdgre7tznvq@gator.home>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Apr 2021 15:58:18 +0100
Message-ID: <CAFEAcA_hvxAmodWKdEUQH4as4vMuaDVGDK7C6KeZ3-TBbPxEFA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 0/6] target/arm: Add nested virtualization
 support
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Haibo Xu <haibo.xu@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Apr 2021 at 15:48, Andrew Jones <drjones@redhat.com> wrote:

> Since these types of features seem to blur the line between being a CPU
> and board property, then I think I'd prefer we call them CPU properties,
> as they come from the CPU manual.

Conversely, I prefer to call them board properties, because that's
the way it works in hardware: the hardware board has the necessary
support for the system-level feature, and part of that is that it
has an SoC or CPU which has been configured to have the properties
that are needed for the board to support the feature. Having a CPU
that nominally supports a feature is useless if the system as a whole
doesn't handle it.

thanks
-- PMM

