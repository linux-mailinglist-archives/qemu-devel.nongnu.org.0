Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4674BDB52
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:37:05 +0100 (CET)
Received: from localhost ([::1]:47150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCcS-0000mM-0p
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:37:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMCKb-0007BI-HJ
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:18:37 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=33593
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMCKZ-0006qn-E4
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:18:37 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id j2so35940285ybu.0
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 09:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q01uazB+ysAQ4pfGo7MFrIPK58QOU1I4Lm5evUYp4GA=;
 b=MJ2zBEZlEs4Y0rzG4cHgdW/q6DFQo0Z9sfg7kxQdlslfTdOdYel16wz4qYzrop2GPI
 nA7iv+gR2ruKVt/vGi+tFFaAgxrWfuBEmDSzrGU1stXfT1FHKpDja7FLMgLF/yiXiaxW
 gEyGthK87DozbP5XSIeGhSIpFyuUkWdOFZmjG1xFnmyuZZIz36rpcQeemVy7C0pZchok
 v0a8UF+JXHvc0h6TDwYfTX9WqjiXoF/ZH8uCQPlVCt3sZYYbilFHQoyYuv0QNAk+oVvt
 LcrxNaLhb0RqL47vp4MLDagAmKNsWHmkUXahg0kJtHB/JykkxhR8Lly5UwJAkk1Ul72F
 /ryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q01uazB+ysAQ4pfGo7MFrIPK58QOU1I4Lm5evUYp4GA=;
 b=JTzt4Eanqxo1LqJvaG4rTDeQ9VcBF7Vk1R1kcGqB2SqvYY61pSWDSPGmDR15xw9fYK
 zIvXhoedxWBX9gkJHzVuHxQYzOhKtfi/jzfCaUUXXG2m87gUOg0DR2ifpZn2wOtKviQJ
 6ta/geJ2C8uwm71kgY8N6IGu1TBuO6ZyNx9G8mDHlwtJH35F9wBuQiDTtfdnJwrpD7sM
 wSUPNsMDFeBmNSA4gwGaUfyDqlRD2IsAgaqSpxDCSevsejCOAIZQM0S+1+1YEa3qSNuo
 kfSMFkn0jAnWYEilSmIfNyXysP2MHESpDgFuU9bRPgT3CUhO54y+VLU/oo8Hblm2GHnX
 JJxg==
X-Gm-Message-State: AOAM531/ZtFtKFcjWCrtRnKXDkP3tNDdv9j09SBlu6j03QgoS7sjRYMA
 HLw71N+fiXPWkTHn8BJzYkEUeFL7p8CUXpj95rq0Vw==
X-Google-Smtp-Source: ABdhPJzNoj0+rUqFwF28PZCRU+CfiU6RFtbeJ8SY/zr4vicQMUxclaN2HKgxeTp3N/1JNdrXfrJYyx2jLvON9Q9fXc8=
X-Received: by 2002:a25:69c4:0:b0:624:4ee4:a142 with SMTP id
 e187-20020a2569c4000000b006244ee4a142mr13840313ybc.85.1645463914577; Mon, 21
 Feb 2022 09:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-2-alex.bennee@linaro.org>
 <CAFEAcA8852qLhKhKT9rnr00CG38i97gSnhoh_A0BoEp_xhe_vg@mail.gmail.com>
 <87h78sm9oo.fsf@linaro.org>
In-Reply-To: <87h78sm9oo.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Feb 2022 17:18:23 +0000
Message-ID: <CAFEAcA-thpNdaTVUXrfHG5+pPD8RyORQXWG9V7eCFMp97y_56g@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Keith Packard <keithp@keithp.com>, qemu-arm@nongnu.org,
 Andrew Strauss <astrauss11@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Feb 2022 at 17:06, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 10 Feb 2022 at 11:30, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> The previous numbers were a guess at best and rather arbitrary without
> >> taking into account anything that might be loaded. Instead of using
> >> guesses based on the state of registers implement a new function that:
> >>
> >>  a) scans the MemoryRegions for the largest RAM block
> >>  b) iterates through all "ROM" blobs looking for the biggest gap
> >>
> >> The "ROM" blobs include all code loaded via -kernel and the various
> >> -device loader techniques.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Cc: Andrew Strauss <astrauss11@gmail.com>
> >> Cc: Keith Packard <keithp@keithp.com>
> >> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
> >>
> >
> >
> >> +/*
> >> + * Sort into address order. We break ties between rom-startpoints
> >> + * and rom-endpoints in favour of the startpoint, by sorting the 0->1
> >> + * transition before the 1->0 transition. Either way round would
> >> + * work, but this way saves a little work later by avoiding
> >> + * dealing with "gaps" of 0 length.
> >> + */
> >> +static gint sort_secs(gconstpointer a, gconstpointer b)
> >> +{
> >> +    RomSec *ra =3D (RomSec *) a;
> >> +    RomSec *rb =3D (RomSec *) b;
> >> +
> >> +    if (ra->base =3D=3D rb->base) {
> >> +        return ra->se - rb->se;
> >> +    }
> >> +    return ra->base > rb->base ? 1 : -1;
> >> +}
> >
> > This sort comparator still doesn't report the equality
> > case as actually equal.
>
> When ra->se and rb->se are the same it returns 0. Is that not what you wa=
nt?

Oops, yes it does. I misread it because I was expecting it to be
structured differently. (AFAIK there is no "standard" way to
structure a comparator-function that works with multiple fields,
so the way you have it is fine.)

-- PMM

