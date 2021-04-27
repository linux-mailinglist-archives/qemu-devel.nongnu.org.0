Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D5336C847
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:06:41 +0200 (CEST)
Received: from localhost ([::1]:41146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbPIM-0007eK-G4
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbPE7-0005Bd-0O
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:02:15 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lbPE3-0006fA-Gz
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:02:14 -0400
Received: by mail-ej1-x634.google.com with SMTP id u3so11277758eja.12
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 08:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oJrVBDHex5YpvXWAveYMDCFlbK1GPSpZNZ8ojedwoQM=;
 b=Ih0sLAuk3aCX4v0aXRbtWJRmi/Rn0Dh4oLHnikYDU1utC/i21JdHsqlN/O4DBvXj+M
 c56CwuECdr7sBiLpvQrm/Py+KoSjL1M768uujqsTdio648HjM2zc1d87mpSGh3hWWAKM
 MiNsAvTx7AshxiLQBD0rBCO4PLkTBq7RRDYXehnueIl1F2vJilshJ05lNU/r0CpVEfod
 1wsmaXkBZOKJpc5cihthp8fretFaScDIgWErlN0LH0tW6wePbnACx8Uufb+6j98tyoHn
 N8QSMqYy5HXdl+0PJ4XX6ILfB/4MR21hrekzoYj9cRy9DX7X3fTt10f5tbAtIEYhtXmO
 +aYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oJrVBDHex5YpvXWAveYMDCFlbK1GPSpZNZ8ojedwoQM=;
 b=Mf5lpsUyyMHWpS/7GEXL5vsmc6I7BoG8Ad80Viv5nzgneMnWMK508qXnJMqgh6u85e
 +Hmme1ZpPXui20wuGT/xchkoHK9Kspgy8qBVPUo0yxn5sMe/qeR5A7LCKEqgngvdwYDB
 R9F97ypH3tY2LzKa8vcx4SbBnyrlezfu2i+87Q8vtC+rPBqMSoi4BwABguqsmRMi3gIb
 uBXX0x7/8jFHpII5UpKD5AuFT3RJgmc9G5fpbZNxRqSVaEQ3I/8vmTWPz8IrSdWiJm40
 KgSBCy0EfEtdI18EjhmaIueKNYPd3RdGbvMwdT2lmduS4xzhS4p2jD1LGLNzRT2jmXNC
 78BA==
X-Gm-Message-State: AOAM530Fji3fU4Uwulsetq+Ox+6e29SoLU9V4ihDtzbo4LV+2eaHWjjc
 Z1Cte82zLWpcXQDNPDweswPy5aTSeMBjWRTNyuzBWg==
X-Google-Smtp-Source: ABdhPJwxm12L+xfJGE78UJHK5y8M1N/Q8Acq0/wTpDRJtj/70gUFQA6Z6fGtD5+IHmRbyQUntpgDa0i966z7601k1ws=
X-Received: by 2002:a17:906:93f7:: with SMTP id
 yl23mr22769482ejb.407.1619535729876; 
 Tue, 27 Apr 2021 08:02:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <CAFEAcA8a53rCGBGVr_mb0fVJPXFaCShGTJE0bh=L5Nvw6ATz6A@mail.gmail.com>
 <20210427095458.3hbckyqbmfztcmge@gator.home>
 <CAFEAcA82VJqgD+B4gCr1M0n5oV869rBdoTzNS6xSs0f2f8iFvw@mail.gmail.com>
 <20210427144819.fiecdpdgre7tznvq@gator.home>
 <CAFEAcA_hvxAmodWKdEUQH4as4vMuaDVGDK7C6KeZ3-TBbPxEFA@mail.gmail.com>
In-Reply-To: <CAFEAcA_hvxAmodWKdEUQH4as4vMuaDVGDK7C6KeZ3-TBbPxEFA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Apr 2021 16:01:10 +0100
Message-ID: <CAFEAcA9CoW7JSdF6mT3gJOterYDAFQrYd5Czt0rZOpogTewNNg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 0/6] target/arm: Add nested virtualization
 support
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Haibo Xu <haibo.xu@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 27 Apr 2021 at 15:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 27 Apr 2021 at 15:48, Andrew Jones <drjones@redhat.com> wrote:
>
> > Since these types of features seem to blur the line between being a CPU
> > and board property, then I think I'd prefer we call them CPU properties,
> > as they come from the CPU manual.
>
> Conversely, I prefer to call them board properties, because that's
> the way it works in hardware: the hardware board has the necessary
> support for the system-level feature, and part of that is that it
> has an SoC or CPU which has been configured to have the properties
> that are needed for the board to support the feature. Having a CPU
> that nominally supports a feature is useless if the system as a whole
> doesn't handle it.

...this also means that we're consistent between boards: some board
models unconditionally have support for a feature (and always set it
on the CPU, GIC, etc), some don't ever support the feature (and always
disable it), and a few offer the user the choice. Having the user
use CPU properties suggests that they can, for instance, plug a
has-el3 CPU into any board model, which in general won't work.

-- PMM

