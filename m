Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 793C649385B
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:24:33 +0100 (CET)
Received: from localhost ([::1]:52138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA88i-0004e2-W1
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:24:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nA81O-0007UU-3T
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 05:16:54 -0500
Received: from [2a00:1450:4864:20::333] (port=52186
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nA81M-0006w3-C7
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 05:16:53 -0500
Received: by mail-wm1-x333.google.com with SMTP id c2so4363869wml.1
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 02:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kDaGuC/3I6GY28yofv4J4FfAi6TRS0I1eAzI9PO99Hw=;
 b=p/YZAn//11v5gimEqWFOMGrZzhI3nVs/1HfMl9QfcJshqaYeabjqAhXQDUFiW6/LCH
 QQhHCAF9junDR/e9bApiq54mew0S2gbNgzng29/aokepMpJvRIU3V1SGQOA+bWf/wQKX
 o1akDkPm5JvqAaEI+uAqubZPvAhfChftHCLecnkVJtwVV+piTkEtec+AufbaqIGb8cps
 oXmJhfeMziCrFOaMCYNDQ0zijHMkuNQF4WhEHjNzCAaDSCV33WnIet2MvbLQz5cD0fHl
 vWG+FQMwW9YkIYU0cE8eaZdNcBAWR6QN1DwHTf7SW1de19zigBCx9RSSOzY9FzpjMHPD
 hKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kDaGuC/3I6GY28yofv4J4FfAi6TRS0I1eAzI9PO99Hw=;
 b=6aOPgdAMhB8AGgZeA9rIMBOysuvp781gvj+tsg/dP4XA7Cdr8AFvulTBricFLJSwBg
 CbVfzvv960L3MPNzOUwmxddd2DeEqE+i2CIs6hoTTcU0ar94Q4zUG+U2IIjxePNY4Q/r
 CGI80hu1geQRhvyQMx01Vc5rXFCgpEdwmeWts2u5ZA9r617xmxdbVaeleXjMaOzQSZIw
 dayLuWsitvJlIdRbkztrnaacrKucJgmvwlzrFSpetYdatP3c9eui7QB4fag7wTMdgNQz
 6bA4EpBW5XSOWoJ7g8vcJHs93Sq//YenDknU3d5A7qtlfDRXQeX1EB0MRgcxQ5lriRzL
 2Vwg==
X-Gm-Message-State: AOAM5330+uVutHXn9TRj6c9QgtOwdCDWN1oeBy6rHdLa/FokWwnEvGbU
 irDHiziTV5JZHP/7g7UuF5JshHRkiYwS+eACQyS/fktM6FQ=
X-Google-Smtp-Source: ABdhPJx86ygIwjudGumdGP3rknqmpQsJ0WGYqZAFqiL+J81PmC6J6ypshhK086hJvfpVy9y08WyWmIlfpVzLvx/iZXw=
X-Received: by 2002:adf:fa0c:: with SMTP id m12mr1551126wrr.172.1642587406820; 
 Wed, 19 Jan 2022 02:16:46 -0800 (PST)
MIME-Version: 1.0
References: <20220107072423.2278113-1-aik@ozlabs.ru>
 <CAFEAcA9JS9SfN3LmGfd8T_icCUx8tJXC=tKDE6j1i1GQE2c-mg@mail.gmail.com>
 <abbd9923-04a9-be7f-edd0-e1b2ebcc8b20@ozlabs.ru>
In-Reply-To: <abbd9923-04a9-be7f-edd0-e1b2ebcc8b20@ozlabs.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Jan 2022 10:16:35 +0000
Message-ID: <CAFEAcA_bYJV675ome4-LqovEmZkKZDyhoVZACbpZiQqDST1Oyg@mail.gmail.com>
Subject: Re: [PATCH qemu] spapr: Force 32bit when resetting a core
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 Jan 2022 at 04:03, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
>
>
> On 1/17/22 03:45, Peter Maydell wrote:
> > On Fri, 7 Jan 2022 at 07:29, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> >>
> >> "PowerPC Processor binding to IEEE 1275" says in
> >> "8.2.1. Initial Register Values" that the initial state is defined as
> >> 32bit so do it for both SLOF and VOF.
> >>
> >> This should not cause behavioral change as SLOF switches to 64bit very
> >> early anyway. As nothing enforces LE anywhere, this drops it for VOF.
> >>
> >> The goal is to make VOF work with TCG as otherwise it barfs with
> >> qemu: fatal: TCG hflags mismatch (current:0x6c000004 rebuilt:0x6c000000)
> >
> > If you get this assert it means that something is changing
> > the CPU state and not calling the function to recalculate
> > the hflags (which are basically caching part of the CPU state).
> > So I don't know whether this patch is correct or not in updating
> > MSR bits, but in any case I think it is only masking the
> > missing-hflags-update that is causing the assertion...
>
>
> If we emulate a bare metal machine, then most likely we want MSR_SF
> (==64bit) set. But this particular case is paravirtual pseries/spapr and
> it requires special handling so spapr_reset_vcpu() seems to be the right
> place.

That may be so, but my point remains: if you are getting hflags
mismatch asserts then something is failing to recalculate the
hflags after updating CPU state.

-- PMM

