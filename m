Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8A52FBC9E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 17:38:49 +0100 (CET)
Received: from localhost ([::1]:39708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1u1n-0008B0-IO
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 11:38:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1tvh-0003yL-4h
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:32:29 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:38514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1tvb-0006nz-0Q
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 11:32:27 -0500
Received: by mail-ej1-x633.google.com with SMTP id 6so29381104ejz.5
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 08:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pLTOjNhfZ2tZ8+jCpKbEUfQe6vUSIwXxXGXDSEYsRr8=;
 b=te4fmMlGP15SOykLroUyEKrkRXwx7fAeFNvF+JdStOOoqYM2/4TYI4hSGJGH49Wln5
 Pz38YyvseVq/2xToiArPAkYCDHJRyg9d33NE0zrVRz0q2HIQ4gzWMGB+BGUKo/O1lt9a
 GJPENbodPlSAtIZAvLNvl8Iwvk+a0kAKymQto+K78e73DACa+vdx5yEgoCOZnSM1du3T
 +cqbp0alTvVYK/3IyNNzglf//fXAsFWvjDpo7NYamgBmLFGwB4tA9ZLpCDNW8M12CJG/
 0ourc9yHgJF0ZF6uD/m3RYhgGoflNZQ2PWBg6nNXjeWeCECrYJ/LSS+/ZDcomXAyvAK1
 lSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pLTOjNhfZ2tZ8+jCpKbEUfQe6vUSIwXxXGXDSEYsRr8=;
 b=OPC4fUuNWPfHdG+OJ1Yz5Ld30EGehKs6/d4gLPfZ8jL3RgekIFvrxNDk+CckfcVkGn
 HXYBnJvtgKRKCO6lzjvf5fE1e+PH+UANnHDRSl7YSHHhrm6A91yV85vGTbGFL6SwewjK
 S+0Cr128w3dVIf1ikq6/Ee+BfPJE4BKVNYAxyMwJ6vtcOrAmd9Xo+0fCFwW2sJAigEYe
 gpdRgMf3rvhLMeJf0U+kP0Mg7XKhPhUO1VJw9SOwL056OUrytZizUw81cTwtyGuW1l5f
 tiDDzV8AQkXp488+YAr42iyWGazVweKbvrZXLPz0ubvEOMERyH+RSWcEehTRoUIeMzYO
 SF3w==
X-Gm-Message-State: AOAM532QlymU2qgAbtvF2OLjnuApBIsKL9CDYXhczlAl2aYVZDC2gswP
 BU7je17cxLxKSEWARP48X9DNhSqoZnD0UurCdeQ0LAIIQJQ=
X-Google-Smtp-Source: ABdhPJyLwhZqffVW1NEXKvhqDmiUC28CkYBg/5W/mOg/yTiV4xfpZ+CP1Y1PfuDbfJcWWwOpdxEFGkUARqY2uFxltRE=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr3613587ejd.250.1611073940483; 
 Tue, 19 Jan 2021 08:32:20 -0800 (PST)
MIME-Version: 1.0
References: <20210118162537.779542-1-pbonzini@redhat.com>
In-Reply-To: <20210118162537.779542-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 16:32:09 +0000
Message-ID: <CAFEAcA_n84NBupM6C58Tbb5xNLosVphGbt=kWawM34Yk=riTOQ@mail.gmail.com>
Subject: Re: [PATCH] arm: rename xlnx-zcu102.canbusN properties
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Jan 2021 at 16:25, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The properties to attach a CANBUS object to the xlnx-zcu102 machine have
> a period in them.  We want to use periods in properties for compound QAPI types,
> and besides the "xlnx-zcu102." prefix is both unnecessary and different
> from any other machine property name.  Remove it.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

I was wondering if we needed to go through the 2-release deprecate-and-drop
before we could rename these, but luckily for us they were only added
in this cycle so we've never released a QEMU with the current naming.

thanks
-- PMM

