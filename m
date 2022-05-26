Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACFA534E21
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 13:37:19 +0200 (CEST)
Received: from localhost ([::1]:38662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuBnq-0003P9-9N
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 07:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuBLq-0000Vp-UF
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:08:24 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:36488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nuBLo-0003Za-L8
 for qemu-devel@nongnu.org; Thu, 26 May 2022 07:08:22 -0400
Received: by mail-yb1-xb34.google.com with SMTP id t26so2330559ybt.3
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 04:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vJvtrtguHiBYBE0gXOQz6BZa1GfeFyg8nDtaaE6/djE=;
 b=Tu/85a6YcltBWdG/sE5wTWypBr8Y1cQUD/s9WawsgvBcmv2A3KwGXWFBUzCVSvRbfY
 5GRZnFRumdidYnupv/r+3LcnnkrkAmA9FrEqSt5GQAHVt8b/4OCqQ+YcutIEuteMq1to
 uz/sdplWhr/x1Gi6cYUO2xfS+oB3ubew7qMEYzt5bmZeCWc/quxVSMFHhw4/jHbkVFzO
 xCo/8mYRyvil9XhHEZgM1hLv7IDu8S5QsmFSl9M9Iy7y8cmfdPPW9kv8F+ymRVj/XlVY
 M55fAV1TIGCYsTvlM0abFKsAj6dxAzsUdrMZ9BBIE1xhNQmzJy0uQm5iTRSe88Of7Zzj
 /00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vJvtrtguHiBYBE0gXOQz6BZa1GfeFyg8nDtaaE6/djE=;
 b=Q0KTilqq4I2nMxFx/RfdLwPJifP0c1u2/HYYlbIExjVcKZcky/IihYRuQ674SKYciY
 YHE+ZBFSWxi36GyuxlbewSEVuMd95I4oNOVspvSEmyJwmiRLjMbEwUKpDb//ZgArJRwn
 DvssgY5y9W6C5gmaFOog5XiOQyED7fPtDkJOTiXEnGAChZTzPox2dSRwVMUYtHbwO08R
 YpRxTrJ4WLID2pJfgK83g8nDwz25vHY4cwZyz9S4jtOVhzMNDCQmjSXn6whEupIG32/y
 5YRqRwXbouGBiMZ0kVjazmzX13z20XQH32b+hJmISRhkfPSsldQlpV0jv4xAu/e51rGH
 cZRw==
X-Gm-Message-State: AOAM532lj2w0diTBft7EUNgSf9aelzYIKIdaS6PnIRHJnYexO0dZVm+b
 moQcRuhE4ZKWioir+oQjcFQEgprxuJXj5zfzgzPeQg==
X-Google-Smtp-Source: ABdhPJxAyDJlbvMymUx4dMbAIMUuW2NLKwYJWbQ82q2p5iHQ6cRaLiaGIV+jTTMEx6/e6xRm4+UXOlleVETO6aeHRzM=
X-Received: by 2002:a5b:c08:0:b0:64f:de42:5ecc with SMTP id
 f8-20020a5b0c08000000b0064fde425eccmr18746645ybq.85.1653563299273; Thu, 26
 May 2022 04:08:19 -0700 (PDT)
MIME-Version: 1.0
References: <AADD58D2-C3BE-40DF-8EE5-3A901F4F8F04@livius.net>
 <CAFEAcA-n4GMq1_SCdTDp6sQmHzyyzTk5hav4QqOY3-j3Sr86Jg@mail.gmail.com>
 <EA9AEE55-A416-4819-98FF-E51B2317390F@livius.net>
 <CAFEAcA_beHgi7pg+ByW4ufG5qfz5n7o4ZP22WuayTtdGSQ_EQQ@mail.gmail.com>
 <0B956505-BFF3-4ACD-AAF9-7F939F426274@livius.net>
In-Reply-To: <0B956505-BFF3-4ACD-AAF9-7F939F426274@livius.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 May 2022 12:08:08 +0100
Message-ID: <CAFEAcA94DMQA_HeGJenzfPq2+eTv0gnpBd-EnGTjQzGnudNGNw@mail.gmail.com>
Subject: Re: AArch64 semihosting?
To: Liviu Ionescu <ilg@livius.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 May 2022 at 12:03, Liviu Ionescu <ilg@livius.net> wrote:
>
>
>
> > On 26 May 2022, at 13:01, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > Yes, I can reproduce this.
>
> Ok, it seems you diagnosed it pretty quickly, great!
>
> > Did you intend to pass '-s' (allow gdbstub connection) but not
> > '-S' (wait on startup for gdb to connect and say "continue"),
> > by the way?
>
> Oops! I forgot about this. I'll switch to -S.

You want both '-s' and '-S', usually (or '-S' and a '-gdb' option;
'-s' is shorthand for '-gdb tcp::1234'). '-S' is just "don't run
on startup" -- you can then start the guest using either the monitor
or the gdb stub.

> If you fix the bug, could you notify me when ready, to make a new xPack release?

Sure.

-- PMM

