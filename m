Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006363A3E0C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 10:32:45 +0200 (CEST)
Received: from localhost ([::1]:34960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrcaq-00074A-3Z
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 04:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrcZR-0005Wq-Mt
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 04:31:17 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:34770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrcZO-0003ox-Mv
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 04:31:17 -0400
Received: by mail-ej1-x62d.google.com with SMTP id g8so3382978ejx.1
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 01:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=os1Zi9gB9AmbSY+oAb903lickpXSZxQY7RdNqWuC4b4=;
 b=LJmLZ9G4EnMG4p5x/yvBBbb+ErjgJGZ2zipZjNtLOKDIIuBPQKyt0jhZy9myT+dJoM
 U4Be0ip2hWmLbAf+//U4pKEi+zoF5xESvpKFY8GbMUsWH98n6porHpsVrqct51+A/Hcn
 ndFpvtaxLnaEKyDsoeSBpqOr1xKuklC1kU6irdPWJeNxjF261DEtH6bu2ZqN7DLl/x/a
 UUbD3TyK0/Ga1gBzVKcowxRU4wbzLU1xWjyhFKIn2+2T/GCsOB3eonX3j6EXKqXTl9tZ
 0cbaZBJMeZObSizL5Rg/LbsCA8kk/eeRgQKZQj4cq/YWHNTrNTnYTWOZ9o7q69SHTkkB
 2yXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=os1Zi9gB9AmbSY+oAb903lickpXSZxQY7RdNqWuC4b4=;
 b=d6DmSBhatag80quO82Mdz/h4PgeLiATrIjpcSV1P3+QAl/N/0lj4p9LnufN0GM+rWZ
 FIowQXCqba1gv35jV3CRoy7RUNqgLWmICXZwY3Wi0CsxDabo5zf38Ui0b9E/GiLzxCn7
 zFoAeRaOMqFXUcJY3svwuVj47TatifH0PjFIXA6c6TOauv0WPCyeQSWUpDnubmmbQRDB
 24nzeAO1+SMmsmfbWQPcJCogd8m5S0E2xH85arC5KlPkiZ+YOAVT58wGKxZHrmfnPmqE
 g0/whVEFB74apvPDfl3BCy2Jf+8bGklJZAFkDnFyThVLcIrIV1wJBz4SKmrJjmxIf8CR
 yFYg==
X-Gm-Message-State: AOAM530dBVEfg6JQj0XYgu3rcAcObExDg0Izsl+cxiCzkOKT/BeRKo49
 PIF++QQqXydGLSSPd/XVmF4jNBp1vFMoqT4SLA8Q3A==
X-Google-Smtp-Source: ABdhPJyWTs7EYd5OmCIWgfJVwaUJFKVKmU7jSfmVnvsm2btpiKBt+2S+As7kLq1hxJexMKkuisZZa1lRZnnrqvZ9FaQ=
X-Received: by 2002:a17:906:b294:: with SMTP id
 q20mr2579808ejz.382.1623400270748; 
 Fri, 11 Jun 2021 01:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA-=w8WA5o-nnR4VuEDV28n65aCzM9M0Km8yTDGy=NHL+A@mail.gmail.com>
 <551DAA51-CB17-423D-896F-AF0443A5E7AE@getmailspring.com>
In-Reply-To: <551DAA51-CB17-423D-896F-AF0443A5E7AE@getmailspring.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Jun 2021 09:30:36 +0100
Message-ID: <CAFEAcA8aPy9kwLhSOk+VjBf_44ktS_VhTAAah_N2nOH_gJuOkw@mail.gmail.com>
Subject: Re: [PATCH v4 6/8] hw/intc: GICv3 redistributor ITS processing
To: Shashi Mallela <shashi.mallela@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Jun 2021 at 00:39, Shashi Mallela <shashi.mallela@linaro.org> wr=
ote:
>
> Have addressed all comments except the ones with responses(inline) below:=
-
>
> On Jun 8 2021, at 9:57 am, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> > + cs->lpivalid =3D false;
> > + cs->hpplpi.prio =3D 0xff;
> > + gicv3_redist_update_lpi(cs);
>
> You can avoid doing a full update a lot of the time:
> * if this LPI is worse than the current value in hpplpi
> (where by "worse" I mean lower-priority by the same kind of
> comparison irqbetter() does) then we haven't changed the best-available
> pending LPI, so we don't need to do an update
> * if we set the pending bit to 1 and the LPI is enabled and the priority
> of this LPI is better than the current hpplpi, then we know this LPI
> is now the best, so we can just set hpplpi.prio and .irq without
> doing a full rescan
> * if we didn't actually change the value of the pending bit, we
> don't need to do an update (you get this for free if you take the
> simplification suggestion I make above, which does an early-return
> in the "no change" case)
>
> > Accepted the code simplification,but by not calling gicv3_redist_update=
_lpi(cs) here ,the scenario of an activated LPI fails because
> this LPI's priority (which could be lower than current hpplpi) is never c=
hecked/updated and gicv3_redist_update_noirqset() fails to present a valid =
active high priority LPI(if applicable) to the cpu,since it is always check=
ing against a stale hpplpi info.

If the LPI is lower priority (higher number) than the current
hpplpi then it would not change the existing hpplpi info in
a full-scan. If the LPI being activated is higher priority
(lower number) than the current hpplpi then that is my point 2 above,
and we set it as the hpplpi without needing the full-scan. And for
the other cases (eg highest-priority LPI being deactivated) we
should fall through to the default "call update_lpi" case.

So I don't really understand why this wouldn't work.

-- PMM

