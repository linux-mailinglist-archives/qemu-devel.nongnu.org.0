Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 056F33B6672
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:10:33 +0200 (CEST)
Received: from localhost ([::1]:42284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtqC-0000Ck-11
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxtnM-0004Hr-Vk
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:07:37 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:41475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lxtnL-0000b8-2c
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:07:36 -0400
Received: by mail-ed1-x52d.google.com with SMTP id n20so26708651edv.8
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l23eHWT/ls8bPJlrARCfI8HyGB8FT81yvijJxlmRWpE=;
 b=HdCkxjHM0xUH/5UiANXHgFvVEEAJzaHKW0sQ1DNCo55ty9YU0zAcq2ONLeKNq2T40n
 weohXz2hl1cCOwmmH01QEhQ7a+V/vc/cSQJGmkmGPesPTvom8w2qYHmnPjad1aYpn/+i
 K6fcBhudw4ucEijXCzURgz4qpR4o+tNXyOcYbsSpgCX8sU2K0B0CT7YTpUxRbri0acby
 iwSb43wmxG2zSYPhd26qjoQzNiOKCmLiQCh4JqMRjks8LcpEhJ1t929cX2fnIyeRwqBE
 ZmT5E+t/zcmxX5i6RaP7yrGzLok2Qq8OB91/YktsZO+Qd+ZpTcrDdX8ITgJd1mFt8YUI
 jUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l23eHWT/ls8bPJlrARCfI8HyGB8FT81yvijJxlmRWpE=;
 b=h1w0n1qR8yM66eRHee6BHtMvPyRHOLZPyY5HhStTU05UgRlw/ypZeQmeMSaE1NAQTy
 pl7N87dAppWX3/aQNPG2gaBHvZU2W6CnegREo3kLvHBVPRf41HgnZdAOAKWh8lCOg71s
 l3iS6jQpX2En47BvoznuFXMS2W72JUMd8i6xgQPLoUI+I8LPi5JNjqxwHZYPlnGpC/TF
 x2VAil9p8VTuRLgUAuw8+nVoZ9M76up6MMDZEW/xJwaQm8JpWFxOfzGNmKEfHaYeKGUS
 xwnGVO2RMmypsq7jiAaL3h+r3PmZw5vXKhmOT2TY09en924P/Wv63RH8gDy6t7NRp8CH
 uTbg==
X-Gm-Message-State: AOAM533iRmvrjBH1TDNvEqIz6DR4URrU29x5huyoe14QfArCA/EawO20
 utA7V9xw/oHophakYgqqcfdp5uJx430/+8AzQ2NqWw==
X-Google-Smtp-Source: ABdhPJy5uh/eh4TPkOjjoFEwZKrLJaTPTxsuqrOFiSeGD6cTaALf9/GfXg1ORmy0EC5eqBRXy/eqszqdha1Zoe02HHs=
X-Received: by 2002:a50:fd0a:: with SMTP id i10mr33683853eds.251.1624896453388; 
 Mon, 28 Jun 2021 09:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210625125441.756802-1-jsnow@redhat.com>
In-Reply-To: <20210625125441.756802-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jun 2021 17:06:56 +0100
Message-ID: <CAFEAcA8Pzn3oi-NacLrod420vTft92w0kJMysT-ntaB6R=g4TA@mail.gmail.com>
Subject: Re: [PULL 0/6] Floppy patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Jun 2021 at 13:56, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit e0da9171e02f4534124b9a9e07333382b38376c6:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/ui-20210624-pull-request' into staging (2021-06-25 09:10:37 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/jsnow/qemu.git tags/floppy-pull-request
>
> for you to fetch changes up to 9362984f569a5b979714dfba556e370847d5fb87:
>
>   hw/block/fdc: Add description to floppy controllers (2021-06-25 08:53:28 -0400)
>
> ----------------------------------------------------------------
> FDC Pull request
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

