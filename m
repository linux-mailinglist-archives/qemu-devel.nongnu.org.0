Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD501FF0CC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 13:39:06 +0200 (CEST)
Received: from localhost ([::1]:34768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlssr-00047V-UH
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 07:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlsrq-0003VO-AO
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 07:38:02 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:42816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlsrn-0002sA-Is
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 07:38:02 -0400
Received: by mail-oi1-x241.google.com with SMTP id s21so4750887oic.9
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 04:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OEkD0MKtKYrhh1Ml0/jzE1VEHMrSYiNOWo+yf5ADuvU=;
 b=FWEUEIOR9lj13KyR5qwPjSV2JW4KEo3+WtGO8jMEKuTPsLeJy1cIj4xLAqEa0RcLfl
 HnNrX5pUS1FwkexFsWPTTeqaedlw8WQ5405DkH5NSWconc0KKd+u20XUjcwp9fiMA07M
 yPknkVetISylyYIUIiCBMKjYdazRggmMLOkttEaS+/fQxIk8BSEbaX2S+jIwWK4HDdeK
 /PoYU2F0DyY3RRZwBdUaCiLr/CPoxQfapJKXQTXBwqQPPzpQPvLHKuBmnzoKX6jEPU4u
 Z8u9SCrxEQWzuRNLA2o0gwmy4C3O9+c/uvE+Poyz29v2Z6aWDiaewn3DNSoulcXHgf6v
 IDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OEkD0MKtKYrhh1Ml0/jzE1VEHMrSYiNOWo+yf5ADuvU=;
 b=WXx6ljCIkX/ECFfJylzDyCTrMFww+9+OifAacR/3DBDcQW4oImBanykfaO3ah65Ic+
 ixGg5PUNAbbG1jHfHpHzwQy1bL6wXronJZj30C1+MrXOmJSKv0R6V3WSfvml92hPexqp
 usFcdZSlhesFM4+xHc2CSPVxJNvhF39QeSEOjUQgmq+HDd/3NhddcFxtgGFaU9qtis/O
 GSSUo4j6YOxQIDTNk2/i7lobtyiTysTOxgnLerece6rWXAksh8XSJ44ko4s8PEvlMWHT
 R8XnCEDGHGa6WegAGwUwq2jWZpEZcIyMDEqYRslykerw2qHbZMBv84nu5Iujn4dlrUmP
 0QSQ==
X-Gm-Message-State: AOAM5306EpBY9ctJVeX2SSN6VmEv5GIi87N4+IZqa82v4hmCNxEsHNih
 a1UxSY/kzZEbZrzI9XAN4hGGIFfstGTYS05Z89tvDw==
X-Google-Smtp-Source: ABdhPJxPceEXEWjfNjmZUmCUAAmyEVdLPJOxlB8cj983OEI/KwEJ9EOuaQUWwwHEo/pcgTrVpEwtiO/ajUwmFxOOKbM=
X-Received: by 2002:aca:568c:: with SMTP id k134mr2359942oib.48.1592480278368; 
 Thu, 18 Jun 2020 04:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
 <20200603011317.473934-9-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2020 12:37:47 +0100
Message-ID: <CAFEAcA8u9au_5pp2qZ=1oGaHvEzK8wpvxYRXsp185DjfV6ByRQ@mail.gmail.com>
Subject: Re: [PATCH v7 08/42] target/arm: Add MTE bits to tb_flags
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cache the composite ATA setting.
>
> Cache when MTE is fully enabled, i.e. access to tags are enabled
> and tag checks affect the PE.  Do this for both the normal context
> and the UNPRIV context.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

