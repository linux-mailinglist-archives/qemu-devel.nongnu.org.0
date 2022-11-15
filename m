Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F18F262A250
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 20:58:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ov23Z-0004bg-Uz; Tue, 15 Nov 2022 14:57:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1ov23U-0004Zc-6d; Tue, 15 Nov 2022 14:57:12 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1ov23S-0006e2-T4; Tue, 15 Nov 2022 14:57:11 -0500
Received: by mail-vs1-xe33.google.com with SMTP id q127so15810729vsa.7;
 Tue, 15 Nov 2022 11:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N6lct/cnuL4mEz8iz8Ae5IE7veauZLzUQBQIM6RKlh4=;
 b=KJENdecFk91hDF5YBx/EWNXn16oVUk86pVxVBrR+loKTh/F/MIFZUOu6VMylbNBE4W
 Ch62DR4HBHtd+MNN3FzRwbo5/JxQhvm+sdIQZtH3UmDAn75lWDE25aZru5Syo6WvEE7m
 Du2ToNs2VdviGy9/ZBPrQSCLAkYCE5udvmPXoxihbpKZwrYOV4lW3l+hL85MqhQzuxgN
 tvUyTMbpza1eU/oXPljrENoabbo0CMtKsgeaMzvsNN8yHWIaHc+c/HV9kAES4GleX7UE
 RVJPUj6q3y9C2ALFDY3knh9u+koNzl8Q9TCVAeaGlszqTRWi47M40AhP6liRa6UlEibQ
 SUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N6lct/cnuL4mEz8iz8Ae5IE7veauZLzUQBQIM6RKlh4=;
 b=6nP/Nn9zlsNM+ZKoaIEtcS2rtZf6K4O12+kR9xDgfnUmy0sAnlsqW0cDdLoYIZ0AZG
 Vw1VEddtW0Pc8o8Siev6+0dZU7spCCLT000xZKzBGnP/npsh2M21mV+YrIDy+8MVXN5G
 gs3tM0zZSxQB7G26r3LDmbuSZwUUtqRcZbkG9OIvxRwolJpyD0dADYzZd9MebXpc9GDW
 M/OHQCl2dU8kB2N7uW/73fJBEk0jQnNdQ6rRlUEA1D5KO9wS8dVMxXsYTfCFFOWjLSL9
 eJcH/PAWTvPLHQT/T+9OZtxZeb6A70ABsuOK3+NeeW2MXzBMmt2T19AYrMQt6oBLWlhc
 5fhA==
X-Gm-Message-State: ANoB5plPAtI0kXcvqDWa724Dk73GQgcvFOwvIkyeO+WqljVMpaPW0swD
 6beCPtlLUMnm7KbuLYmS8HY2Qzbmr/4sTJHFF/I=
X-Google-Smtp-Source: AA0mqf65AWCnS+RGF341TbJTfvR1TJHDOpWer2/d2bjJxfuxTg4xlmg/uujUIJ/jp4skNycK8Dh8gPzlFXpMYL4TRDc=
X-Received: by 2002:a67:ea4e:0:b0:3aa:1249:73d3 with SMTP id
 r14-20020a67ea4e000000b003aa124973d3mr8910231vso.5.1668542229362; Tue, 15 Nov
 2022 11:57:09 -0800 (PST)
MIME-Version: 1.0
References: <20221112214900.24152-1-strahinja.p.jankovic@gmail.com>
 <CAFEAcA_F0jcjviRGjgmb4J_Kos22+UE0vPbcXoTbPCP7xz-nXA@mail.gmail.com>
 <CABtshVRnwQiTypOFaOqVE69+1wbVoVJEy_x7ELez8Mo6aXT=Yg@mail.gmail.com>
 <CAFEAcA-s9a2zCy6O0j6=OXZOcYbj=_mS=aa2vxbKbuSMKNjMoQ@mail.gmail.com>
 <CABtshVRjHMwoN+itKsty-==J8OpZFzuGUB5SsJ+UFPrZ97d6uw@mail.gmail.com>
 <CAFEAcA9e+--A-8-1S-sgvEhCwhsMB3ALAN3XO5NTKs+B7R7fJw@mail.gmail.com>
In-Reply-To: <CAFEAcA9e+--A-8-1S-sgvEhCwhsMB3ALAN3XO5NTKs+B7R7fJw@mail.gmail.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Tue, 15 Nov 2022 20:56:57 +0100
Message-ID: <CABtshVSNU0SBAry+DOfBNQWjgccGWTKQCa6ibLBd=kOb36Cgsw@mail.gmail.com>
Subject: Re: [PATCH] hw/sd: Fix sun4i allwinner-sdhost for U-Boot
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 15, 2022 at 5:02 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 14 Nov 2022 at 19:22, Strahinja Jankovic
> <strahinjapjankovic@gmail.com> wrote:
> > Ok, I will start preparing that separate patch for error logging for sun4i.
> >
> > Since this is my first time submitting a patch, is there anything else
> > I need to do with this one? Thanks!
>
> No, I'll take the patch from here. Since this is a bug fix
> and we're not yet at rc2 I think we'll be able to get it
> into the upcoming 7.2 release.
>
> Thanks for submitting the patch!

That sounds great, thank you very much!

Best regards,
Strahinja

>
> -- PMM

