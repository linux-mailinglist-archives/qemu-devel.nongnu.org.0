Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F403ED11D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 11:38:34 +0200 (CEST)
Received: from localhost ([::1]:36178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFZ4j-0003Pv-8a
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 05:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFZ3n-0002H0-V8
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:37:35 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFZ3l-0004Ev-9s
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 05:37:35 -0400
Received: by mail-ej1-x630.google.com with SMTP id u3so30626406ejz.1
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 02:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cEeJFdbC9rRTnTQqm32d3tN6zCBpZhmaH3HltzkXtuc=;
 b=p1tC1ICAUdKFDP9Aeo2Rvf/ek3H7uOIZpf+1i8G4jDh2JcYE9o72WMrbs9BbfcuEwM
 z8C8vc6e0qFwovkmKo1jJCTOsWr6RWdK/f1Kq/vRWBhA+jETUwxJbZoDTdqVmtYNLO/k
 ZOT0MyiXtgo+PagY2yYbxicww0PB9UnYQ+2CTZiLphR4jybGbNpCh1hn1DSjcsjFpV5d
 fXcrbIdIfbTpwTDxtLWJ8GsJcJchnhMjrE0MfCOajQ2id1WHp1A81ENucdHk2xwZzWPA
 XcZb+NikMPuz69F8lhz6C+n8In04czO5g2esj1SXLSDxMW0OFY/3i2eTltBoV8C06CDb
 GaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cEeJFdbC9rRTnTQqm32d3tN6zCBpZhmaH3HltzkXtuc=;
 b=TsvoUYxwtoLQvL/uNKbQwGJMKkh1KSVm9ezr2iBHYcI8w/MzZNptnwvNG+JO81LeWP
 297GftiUINDpgUeNz7BPEJammke8+D/az1DxhGXUEN2E/6cdMMh7Ah+jqyOCq40AZsPC
 y1EecB6pJv8uTt+iEZfTuS15v+gND9k0rS49zoKo6XKhLdu4XDLjym+y4dLGiAMrZyJ9
 01LmiyQF7NKhTZwUc2BMLY975jeeYbBln88Mj7q/IDRU2KwV2iJ0rmNnna3h+Y//KajQ
 oN8hd5kC6k5vWI9ZyEJJSA1MYZSFRaq11AG4po+rdCC+EiuReBekfeDSDE2QMW4XEC0r
 K8sg==
X-Gm-Message-State: AOAM5318UwFiYzDtWmxTFIn17Vii85D0WocB59/IDBhRz4jST4qUYyNU
 qHIh8s7m9PcIi0Z9ai71QosEn2z0Wlw+x390LPrqXA==
X-Google-Smtp-Source: ABdhPJyRvv56R0U+jjD2z2H8qUhi1Ra6d1vOGVrWIJk5aqT2nvOIEADz5L7o0nFfZUDEZDWVKr7WVZDIMW07J99cok4=
X-Received: by 2002:a17:906:aac7:: with SMTP id
 kt7mr15236885ejb.4.1629106651495; 
 Mon, 16 Aug 2021 02:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-10-peter.maydell@linaro.org>
 <86d7a767-f53e-dfa2-3641-9e39512c0512@amsat.org>
 <CAFEAcA8DNSS-0oXCDWeFNkin=mbNePS3CamnCgvvC+89KOWXTw@mail.gmail.com>
 <bad5ee5a-0f13-6d12-5055-4c649f78aa4e@amsat.org>
In-Reply-To: <bad5ee5a-0f13-6d12-5055-4c649f78aa4e@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Aug 2021 10:36:46 +0100
Message-ID: <CAFEAcA-iG=a_A+OSXrJhh2+qo09vvSJPH7oF0fft_kg229eAvQ@mail.gmail.com>
Subject: Re: [PATCH for-6.2 09/25] clock: Provide builtin multiplier/divider
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Aug 2021 at 10:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 8/16/21 11:05 AM, Peter Maydell wrote:
> > On Sun, 15 Aug 2021 at 17:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >> I only wonder if we shouldn't check clock_is_enabled() here.
> >> Maybe not assert, but at least report a GUEST_ERROR?
> >
> > Setting the multiplier on a disabled clock doesn't seem like
> > an error to me. I would expect a common way for the guest to
> > program a clock-controller would be "first set the divider
> > and any other parameters; finally, enable the clock".
>
> Eh sorry I meant the other way around :/ It is usually either
> illegal or undefined behavior on real hw to change a clock scale
> while it is active. Personally I'd be interested to catch guests
> doing so. I was thinking of:
>
>     if (clock_is_enabled(clk)) {
>         qemu_log_mask(LOG_GUEST_ERROR,
>                       "Changing scale of ENABLED clock '%s'\n'",
>                       CLOCK_PATH(clk));
>     }

I think if particular clock-controller hardware has that
restriction we should be logging guest errors there. (Doing that
also has the advantage that we can make the error clearer by being
specific about what guest hardware register/device is being
mis-programmed.) I don't think we can be certain enough that it's
always wrong to change the divider on a running clock to put the error
in the common clock API code. (Among other things, I suspect a warning
here would be easy to trigger incorrectly when connecting up hard-wired
clock dividers at startup.)

thanks
-- PMM

