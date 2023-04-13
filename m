Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D74116E1238
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 18:26:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmzkU-0000QH-G4; Thu, 13 Apr 2023 12:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmzkR-0000Pk-T4
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 12:24:35 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmzkQ-0004zQ-5V
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 12:24:35 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50506111a6eso1576853a12.1
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 09:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681403072; x=1683995072;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OXfwtRzQmEn81PLVCV+MCz51SoBE4egR8SyExfQ4oIs=;
 b=b08e355zHTkvEr8kZNUrmMWWKvUU2Rgky0qYJpf0kbWNZDBIZMYD7T8FXk71ExAfN6
 QqnQnz2Qs2juLyDbhOvYQbwWi4MhjOWiF73328uyJCQWsiuXr9L54sXUdjSVeO3TEUMu
 6E1Clx+yoKdUUKzrKhs8BrTh08eY0gFoSNwf9aNWalIt43108//79wg+nusZ/jLDyPYM
 AeX3VYKYXZ6DdzmIOKkvbQFDi1klmzdBsEHF4gq8ltMqNJEhKIFStolT6fTeRhuqJnQr
 2ao+5L8AT08M0rYUBSkbkp7MpefAmlBW/LXd59FUOHitzpHsEoHfQU17VeJ2BS6FU911
 T+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681403072; x=1683995072;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OXfwtRzQmEn81PLVCV+MCz51SoBE4egR8SyExfQ4oIs=;
 b=U9v8zPx7KbP3QTGvJ9iFLYDCbq9nedx5KR9ptD5vv+Kzh72BtJ45sfZyCQo7aiZc9W
 5UmoARVYMSOGZ782do36hnF09fhonE+Y53zBowtn+z70Oyr2Ga+/qc6D5QqumvgepoZ6
 EstxuHANgMEt+I4p/kdaZT1ar9gQL4Kq6N7vZFB0U3vaR9LIRbEyt4+tWsTRVz1SHjFD
 pHowW3yljxyuP0Zx9nxiAZltqoFyBsQuWdGJ972/+/W9a+LnBifc2UtJchC8yyDbQJ6k
 vXbArmYTe9CfHVmkQlMq/AVvjR0CEBWUlP52P3PjeWhl0yvthUKzpvKHpFrC1s8zvJja
 S9Lg==
X-Gm-Message-State: AAQBX9f7or0w8y2SPDrhm/kX4q5h7ophf23IUcUuq3Q2ETaDCHtuI17f
 pEf8PZnyfcAgTBS5DCb+isIaNc62hy4t7yth+n+GWg==
X-Google-Smtp-Source: AKy350Yo1ymoDZLNp8X9AbSlFgksgCjTP/mCM+4AYXq68T+XFwUOKNVzr0t10vvwG451oYx07XlZ2DGQOpL/U7b3T+c=
X-Received: by 2002:a50:a40a:0:b0:505:4fb:4430 with SMTP id
 u10-20020a50a40a000000b0050504fb4430mr1553312edb.6.1681403072251; Thu, 13 Apr
 2023 09:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-4-peter.maydell@linaro.org>
 <db294649-0b72-914e-d6eb-328a996912f7@linaro.org>
In-Reply-To: <db294649-0b72-914e-d6eb-328a996912f7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Apr 2023 17:24:21 +0100
Message-ID: <CAFEAcA80ON=OfSucYhfEY8PiYc1xvkb20rWUYJbFYPg8qiywNw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] tcg: Use one-insn-per-tb accelerator property in
 curr_cflags()
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, 
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 3 Apr 2023 at 19:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/3/23 07:46, Peter Maydell wrote:
> >   uint32_t curr_cflags(CPUState *cpu)
> >   {
> >       uint32_t cflags = cpu->tcg_cflags;
> > +    TCGState *tcgstate = TCG_STATE(current_accel());
>
> As mentioned against the cover, this is a very hot path.
>
> We should try for something less expensive.  Perhaps as simple as
>
>      return cpu->tcg_cflags | tcg_cflags_global;
>
> where cpu->tcg_cflags is updated with cpu->singlestep_enabled.

I feel like that introduces atomicity issues. If I'm reading
the code right, curr_cflags() is called without any kind
of lock held. At the moment we get away with this because
'singlestep' is an int and is always going to be atomically
updated. If we make tcg_cflags_global a value which might have
multiple bits set or not set I'm not entirely sure what the
right way is to handle the reads and writes of it.

I think we can assume we have the iothread lock at any
point where we want to change either 'singlestep' or
the 'nochain' option, at least.

Any suggestions? I'm not very familiar with the
qemu atomic primitives...

thanks
-- PMM

