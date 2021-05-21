Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AACD38C24B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 10:52:08 +0200 (CEST)
Received: from localhost ([::1]:39268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk0t5-0005VU-HI
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 04:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk0rN-0003oB-66
 for qemu-devel@nongnu.org; Fri, 21 May 2021 04:50:21 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lk0rJ-0001cH-5J
 for qemu-devel@nongnu.org; Fri, 21 May 2021 04:50:20 -0400
Received: by mail-ej1-x634.google.com with SMTP id p24so28090766ejb.1
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 01:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nHQf9aqjvDiQAloLKZf4E0K0KTaekuoeyXryd7vtLTA=;
 b=kI7hIvPzqWmwhSt6CZRdUnShAImbYznG4JCkU1hTXao3CWhdOKTVo9SPX/hGXzcQdR
 17x27lImPRFDwaHdjsuHkf9iCWE2xy9O1LzoDnhHIAtSPaCJ4Xpnf3Ys2Wg1qnUoc3s+
 HT37K3BAsLSssaJYtlkhdzi9kLb37qYQFMdBrV6llPVflq7vwLZ3CTVXt+cGHKM1/HI0
 xA3/LQ9GQaZAtlMXQcMR/c5lKTx0S7gq7fwR76Zce+qXbmcmXkMG3VsBUbsvbpldMWY/
 i9zU8NISyvSN8tZMqd68bC8Db0ECZqGcL8TiUsJnWTL/6Q8mVAFL4MkQuGvo4YtjXUy7
 H+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nHQf9aqjvDiQAloLKZf4E0K0KTaekuoeyXryd7vtLTA=;
 b=UblvdNells6Puuiz7n9LZb+lAqA+5rY/gWO2oyYs/wSnModbaIoTB1c9kiK4GPcYDI
 a/M0wea/nykcsGB3dQbMy+c/fFrjUlKmVq3SmDWyX5dBBzFVReGppNy+BPvWXQhnrACK
 gPHskWmlBAnCtWjbobr0d3/5NGoHDJSwmV5D3nj8szxtu/KZx6AOGZfn41SlO6WFibbz
 gkf083jHif7sWnUf736atOLDBGkwqwhYfw0PYDWm3cvW9ZRIkbpsShNTbrftnSwdSv0a
 QMuXV6RRVgo4UnNid+LErI8CVdKrJLSt/WgddjjWvIPfp8j8GM9/WCUAachrMZ+w6NGn
 M0BQ==
X-Gm-Message-State: AOAM5309DdNc2AOe+mRdf/gjjZwMB4K5QsJnZiGowABq80RhOGSQlgME
 UkTmHzBONI1EMp+7kcO5mimYkupsYWaIhQRQDzbygw==
X-Google-Smtp-Source: ABdhPJxkTzy1RkyufQPf2MOsz2cv6Qus5J5xl3EonDH0eM0tlVmCIvng9+EcaTbrBP8oZdovuIa4aP6k2nZ8JWkJhLY=
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr9256970ejb.85.1621587015080; 
 Fri, 21 May 2021 01:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210208182331.58897-1-pbonzini@redhat.com>
 <20210208182331.58897-22-pbonzini@redhat.com>
In-Reply-To: <20210208182331.58897-22-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 May 2021 09:49:55 +0100
Message-ID: <CAFEAcA_jvVVN4n330LZ3+oPtEEBUvH01vvrXdm6r_=wa-AwHGg@mail.gmail.com>
Subject: Re: [PULL 21/46] meson: Warn when TCI is selected but TCG backend is
 available
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 23:09, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> Some new users get confused with 'TCG' and 'TCI', and enable TCI
> support expecting to enable TCG.
>
> Emit a warning when native TCG backend is available on the
> host architecture, mentioning this is a suboptimal configuration.
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Suggested-by: Daniel Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Message-Id: <20210125144530.2837481-5-philmd@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  meson.build | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meson.build b/meson.build
> index 3a13ba3307..4cc3ebb827 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -231,6 +231,13 @@ if not get_option('tcg').disabled()
>      else
>        error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(c=
pu))
>      endif
> +  elif get_option('tcg_interpreter')
> +    warning('Use of the TCG interpretor is not recommended on this host'=
)
> +    warning('architecture. There is a native TCG execution backend avail=
able')
> +    warning('which provides substantially better performance and reliabi=
lity.')
> +    warning('It is strongly recommended to remove the --enable-tcg-inter=
preter')
> +    warning('configuration option on this architecture to use the native=
')
> +    warning('backend.')
>    endif
>    if get_option('tcg_interpreter')

Just noticed this one after it hit master, but there's a typo here:
"TCG interpretor" should be "interpreter".

thanks
-- PMM

