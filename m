Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5348B33F11C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 14:23:59 +0100 (CET)
Received: from localhost ([::1]:51522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMW9W-00060A-5e
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 09:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMW8f-0005Ps-K5
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:23:06 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:37204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMW8b-0004AJ-5Y
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:23:05 -0400
Received: by mail-ej1-x636.google.com with SMTP id bm21so2592088ejb.4
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 06:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rphJhjkCH8kuw+MPjRKlFNngaeDtByrEV/v9buyyszI=;
 b=QGmIM+DPndpdtVtKZwL6iNQrN/uXTpTOEQMPV8pm2a4cE8RvjmuseKSJ3p5Ke7NezF
 NN3WDo9DyrcUo4AF7W2BscZO8gH76XWIYZJJK71w3gNr6zlGZsniFKG3gKCGp4kK+eyv
 cAesUtpaePwSIleyjKbSDoJPxEggIWiVQiTM4CohTPwUWBLzXbQBUHtHcFafzaHvAkQR
 odgHehOPGOS9SglkvGQt+U7a4hrkD6z4tI7BGp979h5IrrISsTpGaNgqrQCeckf6+IV1
 VGRnpIz53GBfaAtAUGyGXYnYNDhE4ScKJypMEu8p8/TC6D6aAf0lKMMFdZN3EaB5uPHv
 y99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rphJhjkCH8kuw+MPjRKlFNngaeDtByrEV/v9buyyszI=;
 b=DVEupkwWCtBgl6fqEV9LtET1R5yIEdbgKteXz42fvTTsTY5BovqG8Kbfvh2Dx4HcjG
 R+KGJBwRVmJI69NJ9a+bwVaJEHbsgMML6aEhzlC7nITRugyDd/UZdcpdvNLjMfcy+B8z
 oA8UkueTOocOxxEgATshCdaGUo6g7yxKuwyHhv68LhyDmR/nA9LNHz+1uUkmKaZASN8P
 siqz9shuMNLPlFDYSQPX+g1DdMrgxJ1pLoT9KcxvdFv37pjDr2mOgQRCCwz4eyt4IKk3
 bSE/nuTcu73UN611Z76V+pcZp+SmEOmxVSkNP57FOVQV50nGw7VAXq2Po9VpP7Na18Gs
 0e/Q==
X-Gm-Message-State: AOAM533TKa2uWyPqS+2/5J+uWGO/ZNyN4tHFdMls/zWBzalZ9nrmnB4U
 qeKxDNx4LB9gT50c2RgvzpMVcHxv2J9g0f+54IDZOA==
X-Google-Smtp-Source: ABdhPJy/WkAoCz+iieBMPGj4KtsyUAygclUt6rA3GjlXfWh2LEV+NAzdwmEy/C7FE5snmFFGXTpMwMootI16bJZQbQQ=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr36065258ejc.250.1615987379486; 
 Wed, 17 Mar 2021 06:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210317044441.112313-1-gshan@redhat.com>
 <CAFEAcA8Wf+fYppz6kWurU=68NH7uvn0HFXc_FJ6twoA86bcBcg@mail.gmail.com>
 <73a30558-469e-8ef0-02b2-aaaaa2449cda@redhat.com>
 <CAFEAcA_yuSR=KkpBTh+21JkqiB7gKfnFvgvxYgPN2yLfvxpi_A@mail.gmail.com>
 <3e7ba090-c45e-8fa4-1a59-16856241cbdc@redhat.com>
 <CAFEAcA_zYaOXw5yaXWEjgBy6YeTpB5FRBCO96To-bv9xpQzbMQ@mail.gmail.com>
 <20210317125453.t6f7xs7bqf2vvbgu@kamzik.brq.redhat.com>
In-Reply-To: <20210317125453.t6f7xs7bqf2vvbgu@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 13:22:48 +0000
Message-ID: <CAFEAcA8RZB4-SYBq102T3ogCyTg8HCw2FZ3wV3KQ94zf9qSbwQ@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: Fix clock migration failure
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Luc Michel <luc@lmichel.fr>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Shan Gavin <shan.gavin@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Mar 2021 at 12:55, Andrew Jones <drjones@redhat.com> wrote:
> I'm also curious what the state of mach-virt's machine types are for
> migration.

Probably not great -- I don't think anybody is really testing
cross-version migration, and I don't think there's a great
deal of in-practice use of it for Arm either. (See also the
issue with accidentally having env->features in the CPU
migration data, which broke cross-version migration: that
was around a while and we only got one user complaint about it.)

Unless we have a serious test suite for this kind of thing
upstream it's just going to continue to be broken, because at
the moment all we have is "people make best-efforts to think
about migration compat when coding and reviewing, but don't
actually test".

thanks
-- PMM

