Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC0A60CBD6
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 14:29:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onJ15-0007bj-48; Tue, 25 Oct 2022 08:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onJ11-0007UV-VL
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:26:44 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1onJ10-0007l2-82
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 08:26:43 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1324e7a1284so15272115fac.10
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 05:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xmdA6NZplMNta8NYC+X/xb/pamcbB+Xedm0rpOb2K+s=;
 b=NrlkVUTI56rAIPoF9GaxUDWprUIDwHHcrQPu1TCTgbuZ8psY8WvbD4Xk+bmD0nRtZa
 EvlGoMtGE6Rty22BD6aBCa099rC4SIRDw8nuvBX4al+zi6SrZ1JaFO2KuASYunPSU7x6
 MSDX+SkNS5pro417epMErX2lD9tk4iBDkEICVDDdbtDT3skIAq6FkPDuaSbK1VQbIlSD
 znAq+BQHFsKcYq4hw6C84wWFUFR1v42cD+3R37wGIRAO67M2o4N+Hhj1K537K6Xc0wYz
 h1otYwkf/p8ahICNf4CTmypx98r42uLCFoyaQr0fs+AcBu6B+tuL985da4RmYEHjC6Jc
 a2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xmdA6NZplMNta8NYC+X/xb/pamcbB+Xedm0rpOb2K+s=;
 b=Qfk5AcQQ3bc4cp09PO/rO2N4taXfhoYVI/s1+MvbXimenlPlKg/UnVMBpmejBEzQVz
 Bv/8yYD49JRhCPt4TyWYY9rAyrw0LmT6VKbjv7prbk6x98Qyr6g4upC79bKpJ1k7JnTI
 z1RWcUyzp2NVVAxvFohqvrSef/KFGRu8d5aItxrgd2GOK4QeYSbvZfAvpDEqvMJfgb+s
 vcD33f/ZxbZAgFvNLf7iRaOIh1XcI+b48ymla0odLCIyMx48GAZ//4e9O9k67ZO8AzbL
 FvXfGArSNmVE6d5ZIYTEnsUDXytKSqRDMkJY6sbMEZv/irSEmB7l9AxSWaRfWCOq9S7E
 JxVQ==
X-Gm-Message-State: ACrzQf0J2WWiY5nMhIuJMWYEasJRFknzWElWiHCzuIXiOnDFXaErWWpK
 lxGrIwlHYrDfAcE8DukdsrZ/KPcMoxe791yZpw3YMHCyEDU=
X-Google-Smtp-Source: AMsMyM5E5Npor429kFty7QW0UKp/V0baHsI2mU1AelpMKjWKw0AMoItKL20CILDf1ckvvaNwPwlrKOYjBdCbyZPrkxA=
X-Received: by 2002:a17:90b:f06:b0:212:cb07:fb82 with SMTP id
 br6-20020a17090b0f0600b00212cb07fb82mr26428832pjb.221.1666700790378; Tue, 25
 Oct 2022 05:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221025004327.568476-1-Jason@zx2c4.com>
 <20221025004327.568476-2-Jason@zx2c4.com>
 <874jvs5t5k.fsf@pond.sub.org> <Y1fR/bMo/HcDvo7A@zx2c4.com>
In-Reply-To: <Y1fR/bMo/HcDvo7A@zx2c4.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Oct 2022 13:26:18 +0100
Message-ID: <CAFEAcA-cqzoEyWiCd0RCGezqijvWfnXso1kH9zDb9fYdYpa_6w@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] reset: allow registering handlers that aren't
 called by snapshot loading
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Markus Armbruster <armbru@redhat.com>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=peter.maydell@linaro.org; helo=mail-oa1-x33.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 25 Oct 2022 at 13:09, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Markus,
>
> On Tue, Oct 25, 2022 at 08:11:51AM +0200, Markus Armbruster wrote:
> > > diff --git a/qapi/run-state.json b/qapi/run-state.json
> > > index 49989d30e6..e44c0de914 100644
> > > --- a/qapi/run-state.json
> > > +++ b/qapi/run-state.json
> > > @@ -86,12 +86,15 @@
> > >  #                   ignores --no-reboot. This is useful for sanitizing
> > >  #                   hypercalls on s390 that are used during kexec/kdump/boot
> > >  #
> > > +# @snapshot-load: A snapshot is being loaded by the record & replay
> > > +#                 subsystem; internal value (since 7.2)
> > > +#
> >
> > If "internal value" was an established way to mark parts that aren't
> > visible externally, this would do.  Since it isn't, it's too terse.
> > Suggest something like "This value is used only within QEMU.  It doesn't
> > occur in QMP."
>
> Thanks for the precise text. I can do that for a v5, or, Peter - do you
> want to just fold that in upon committing these patches?

If there's no other issues with the series I'll just fold that change in.

-- PMM

