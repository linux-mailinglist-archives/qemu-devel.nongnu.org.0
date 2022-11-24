Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CB263784F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 13:02:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAuQ-0002ts-HB; Thu, 24 Nov 2022 07:00:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oyAuO-0002qf-J1
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 07:00:48 -0500
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oyAuM-0002Da-Sg
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 07:00:48 -0500
Received: by mail-lj1-x22f.google.com with SMTP id z4so1750471ljq.6
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 04:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qte74wm2A6M0tjKrtqejeZ6daViaeeQBm7uFLjMge+E=;
 b=NhtjEHqsu6iYPAaZMOaHaSg6QyMM/cDxzn+os1ZGNHZ0dmEb4kzxZFNkkTyde6kfMV
 r4XjgjnECyP0dNwiDnjMQj7UELmY27QQALCcCbKuKUtPQWmfzd/oZdpsezwvuhebZlzV
 9b0mBSks/2S4CZZdypNs8iGJQDyQEZklQ4jIlqgTiJoWsquv6nqCCRxbpK+Gcrjp6UHY
 OEFfipnaLO50yAuhiAJ92oYbDwxBnHxJ54iaSGa/+zgYLLZXiW+ezFZR0AQg++BDziZc
 hj737CKxoQP8HI2Ah8Db+vJCr3T/wp7EJHhCp4kG3eaEywZeuX+ddtRbaMUFqW6kbg3Y
 0q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qte74wm2A6M0tjKrtqejeZ6daViaeeQBm7uFLjMge+E=;
 b=hOhJrtP6uopxQtM/gjxtbsVcSioOBBzb5782I/7dyJJh67vIPEuOO9Ou2r97xK3fQk
 v3VzlR98+t3Z39N3+EWTxenha+77BQxB0AIsP5hzAlqnPIxsIcOw+10yx7ac55c8nB2u
 lR4DLVPXMm2JT2j31mi3KfL6+KkvMck2S+rEOXgwLuJ1Vad6rtRCQ/jFqHzArF2PqbW4
 KKtTbkKQMD0kTn1idfqOzpxuewaPpUd/8XF259jwH4Chjj+NZfiWjaOKzSDO06XFEINd
 fkbVc4CUY0bDkSdwIIPwY9LxYP97q9MSgPDp1HaNGrGe5uQuXSgb9viyDa9Gncqcv0kn
 zaBA==
X-Gm-Message-State: ANoB5plSMjCflRZBRLEQPlUxzhb1Xf47Obgjsd2MxSi8tN23P35JVkBj
 tuheQjuvfprjSuYpM32UMybIdgFs2kYow72N144=
X-Google-Smtp-Source: AA0mqf5htNsrw3A81BRXou26ruIQ2peCEjzSpzl3PdeKo1orFJ/knH7TLTxJViLlacTAcSBiTE3REsjzzlu4EogqgX0=
X-Received: by 2002:a05:651c:1954:b0:277:43c4:a864 with SMTP id
 bs20-20020a05651c195400b0027743c4a864mr9683433ljb.463.1669291244414; Thu, 24
 Nov 2022 04:00:44 -0800 (PST)
MIME-Version: 1.0
References: <20221028045736.679903-1-bin.meng@windriver.com>
 <20221028045736.679903-12-bin.meng@windriver.com>
 <CAJ+F1CJnW-95ZpfBBKFX=O_XsFOZ+quTU4dYmK8Cr8B-Ww_Hqw@mail.gmail.com>
 <3e3178f9-73a7-031a-6cd0-4a315989b567@redhat.com>
 <CAJ+F1CLvBgX1_t9QhZ6wnJbdE071CFdsuWtWHxSOTDqCsMRxEg@mail.gmail.com>
 <70b3b160-83fe-22f3-bdb8-243d50f1b2ff@redhat.com>
In-Reply-To: <70b3b160-83fe-22f3-bdb8-243d50f1b2ff@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 24 Nov 2022 16:00:32 +0400
Message-ID: <CAJ+F1C+Re+uTQD7Mg400y9w6_R2u1kr8tfjazi3vm07n0WmK4Q@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] tests/qtest: Enable qtest build on Windows
To: Thomas Huth <thuth@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22f.google.com
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

Hi

On Thu, Nov 24, 2022 at 3:49 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 24/11/2022 12.17, Marc-Andr=C3=A9 Lureau wrote:
> > Hi Thomas
> >
> > On Wed, Nov 23, 2022 at 6:19 PM Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> On 23/11/2022 15.13, Marc-Andr=C3=A9 Lureau wrote:
> >>> Hi Bin
> >>>
> >>> On Fri, Oct 28, 2022 at 9:06 AM Bin Meng <bin.meng@windriver.com> wro=
te:
> >>>>
> >>>> Now that we have fixed various test case issues as seen when running
> >>>> on Windows, let's enable the qtest build on Windows.
> >>>>
> >>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
> >>>
> >>> We haven't solved the CI timing out or eating all the CPU time, right=
?
> >>>
> >>> Can we simply exclude it from CI for now, ie add to this patch
> >>>
> >>> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> >>> index 093276ddbc..ba9045ec38 100644
> >>> --- a/.gitlab-ci.d/windows.yml
> >>> +++ b/.gitlab-ci.d/windows.yml
> >>> @@ -62,7 +62,7 @@ msys2-64bit:
> >>>      - .\msys64\usr\bin\bash -lc './configure --target-list=3Dx86_64-=
softmmu
> >>>          --enable-capstone'
> >>>      - .\msys64\usr\bin\bash -lc 'make'
> >>> -  - .\msys64\usr\bin\bash -lc 'make check || { cat
> >>> build/meson-logs/testlog.txt; exit 1; } ;'
> >>> +  - .\msys64\usr\bin\bash -lc 'make check MTESTARGS=3D"--no-suite
> >>> qtest" || { cat build/meson-logs/testlog.txt; exit 1; } ;'
> >>>
> >>>    msys2-32bit:
> >>>      extends: .shared_msys2_builder
> >>> @@ -96,4 +96,4 @@ msys2-32bit:
> >>>      - cd output
> >>>      - ..\msys64\usr\bin\bash -lc "../configure --target-list=3Dppc64=
-softmmu"
> >>>      - ..\msys64\usr\bin\bash -lc 'make'
> >>> -  - ..\msys64\usr\bin\bash -lc 'make check || { cat
> >>> meson-logs/testlog.txt; exit 1; } ;'
> >>> +  - ..\msys64\usr\bin\bash -lc 'make check MTESTARGS=3D"--no-suite
> >>> qtest" || { cat meson-logs/testlog.txt; exit 1; } ;'
> >>
> >> I think it's only the 64-bit job that is really problematic, so we cou=
ld
> >> still run the qtests in the 32-bit job?
> >>
> >> Alternatively, what about switching the 64-bit to another target that =
does
> >> not have so many qtests enabled? Some mips-softmmu or riscv-softmmu ma=
ybe?
> >> ... we still check x86_64-softmmu in the .cirrus.yml builds, so this i=
s
> >> hopefully not such a big loss...
> >>
> >
> > The change I propose above is to simply skip the qtests on msys CI
> > builds. They are not running today on !POSIX.
>
> Sure ... question is what would be more valuable in the gitlab-CI ... onl=
y
> compile-testing x86_64-softmmu on msys2 (since that also compile-tests th=
e
> HAX and WHPX stuff), but without qtests, or also run a (limited) set of
> qtests with another smaller softmmu target?
> I don't mind either way, I just wanted to suggest an alternative to consi=
der.
>

Yes, we can do that on top though. I would want qtest to run on my
local msys build first, hence Bin's patch :)


--=20
Marc-Andr=C3=A9 Lureau

