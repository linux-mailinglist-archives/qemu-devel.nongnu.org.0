Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8323CC260
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 12:06:50 +0200 (CEST)
Received: from localhost ([::1]:48932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4hDd-0002Ir-Ec
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 06:06:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4hC0-0000rQ-5J
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:05:08 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4hBy-00048X-IF
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 06:05:07 -0400
Received: by mail-ed1-x52e.google.com with SMTP id h8so16282594eds.4
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 03:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=++BrSy2PrG34MMhRSpdwMbf5p5+1BNGglL3inEXUbWM=;
 b=ONI9LEIK4nZ8Mk/Rv1GTluQLkn5DN687OFnC4yY1Ql4nHuvqbj/N0AlzhjBQQvPbOQ
 j/PZBjoWV8YhntU03vPM3sBsK0G0hIRkvagXrWAu1z7Iv4EC+f9V+Bju6gu21pF2Fxuj
 fxFAMSe87ImOHaBEK4FLjHoL0khBW53hvhUGsABRHyEOg/8oJNK6gYVlMSHngo3ihyRT
 mZPfitThznpI64fvTwhbYBSWz/Mw5IqH8dTbJg2o9Bu7iOxXl7YLpjumF1W1BHgc11P1
 t/f32VN0yX2dKOfijCqsy/ltqxU+B3bqzfp1N1y6qnqqOYd7vO42rJuqB53o5ZBZF2Tm
 LPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=++BrSy2PrG34MMhRSpdwMbf5p5+1BNGglL3inEXUbWM=;
 b=b7iIeu8gtwDAk16Li9NZl7/0gS3BzmWJh41+JMfIX6hxK4uEad2fhzHpmAPykj2hAN
 4F3wp76EdWB00XOTziZQyXFMZhqQ8SF8OOq8PAKdT1xm9SSAuBI+Z592/baxlREjJN/J
 P3oDhMjOCAknMjiohGz+UdEgLKEJh3eR7NXeUitqC6ONjeM5pudRlU16MjWrktD81G5N
 Po6ASSjxfm6mFGZNG7gLMZtUL3OA4gLHo6HooKUY8Cb5ytZQH+bNwaZeKnVJCGldF8Av
 CnUHUfbQdNnwgxWoaN21yb6dbyZFTpY98dWrqo39B6JcPjPiJnJkZZIXSlLvroIQXMKg
 3FdQ==
X-Gm-Message-State: AOAM532Bg7zP8GKKip08Yy2cgWGqnFtF5wNf0XgCzuNivwLNwF0zcZbZ
 yyalVN2+pJ3xS4xLQyZMOSNNaamboq3VLg6Ku8/h2YTA2MXghC9Y
X-Google-Smtp-Source: ABdhPJw4gmcJmUKwc0RSf4Kmy69sYzcvZ9kB3Uf96VvYxG1QRIC115fR48WRwPGz9VNokQSXCtPjj7+OLv5ILjOnuXs=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr20620100eds.204.1626516304694; 
 Sat, 17 Jul 2021 03:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp_5vmoL1xFr6rVUzbyb2LyxyndOrxKMsyvgkqq_EX=hOg@mail.gmail.com>
 <CAFEAcA_jBPwqHCyCAq6yJPfHtwV-h2xdNARX=GTe6gn1Cao97Q@mail.gmail.com>
 <CAK7rcp99ZiRw1zVMAGAO6t=yaDuZyNPwToRd1x34JzEvNHtj2w@mail.gmail.com>
 <CAFEAcA8dcouHz=UnDyksZ17fsGom4r=ciHu7oX-f3gDjnCX54Q@mail.gmail.com>
 <CAK7rcp_S5Z5M3bDum3f_ppequ47PaYHs0Gp=LST5jnF_VsCkuA@mail.gmail.com>
 <CAK7rcp9uNpQcFepqMugg6qv2LWMY5O=TPBDp7uKAUs0whjmrbQ@mail.gmail.com>
 <CAFEAcA8rGR9=f9Nt+Z0FeFR_m77OvC4SrmJ91+fU5NjR4ATcKg@mail.gmail.com>
 <CAK7rcp-dc7d=4M6STfuWV9=pFTmO_0ST1Cd=7mLBmnxLsp-+NQ@mail.gmail.com>
 <CAFEAcA-riRg8A1mosMHjnD=tKAA_PMe2VGcinBO=YViDqJc7qQ@mail.gmail.com>
 <CAK7rcp952ROfhNk124p0KiwdTifz+J2ibtE_qGuKRnc+wHzC0Q@mail.gmail.com>
 <CAK7rcp8BowAWjbfkK8SAUB+WTqXxroXuzsac7BtmPLJRUJkD2A@mail.gmail.com>
In-Reply-To: <CAK7rcp8BowAWjbfkK8SAUB+WTqXxroXuzsac7BtmPLJRUJkD2A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Jul 2021 11:04:24 +0100
Message-ID: <CAFEAcA-_p3n_ez6Oc-k3Gpjmb268yzBR4FK0H5UnxBEX2dtpXg@mail.gmail.com>
Subject: Re: QEMU System and User targets
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Fri, 16 Jul 2021 at 21:06, Kenneth Adam Miller
<kennethadammiller@gmail.com> wrote:
>
> After checking around, I don't see any <target>_user_ss in any target directory. And I only see *_user_ss in the linux-user subdirectory. Were you talking about that meson.build in linux-user?

$ git grep _user_ss target
target/i386/meson.build:i386_user_ss = ss.source_set()
target/i386/meson.build:target_user_arch += {'i386': i386_user_ss}
target/i386/tcg/user/meson.build:i386_user_ss.add(when: ['CONFIG_TCG',
'CONFIG_USER_ONLY'], if_true: files(
target/mips/meson.build:mips_user_ss = ss.source_set()
target/mips/meson.build:target_user_arch += {'mips': mips_user_ss}
target/mips/tcg/user/meson.build:mips_user_ss.add(files(
target/s390x/meson.build:s390x_user_ss = ss.source_set()
target/s390x/meson.build:s390x_user_ss.add(files(
target/s390x/meson.build:target_user_arch += {'s390x': s390x_user_ss}

i386, mips and s390 all have a foo_user_ss sourceset defined in
their target/foo/meson.build files.

You don't need to use the *_user_ss sourceset if you don't have
any files which should only be compiled for the user emulator,
which is why most of the targets don't use it. Having files
to be compiled only for softmmu is much more common.

-- PMM

