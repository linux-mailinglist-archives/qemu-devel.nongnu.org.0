Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D53637772
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 12:19:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyAEj-0002e3-Bt; Thu, 24 Nov 2022 06:17:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oyAEg-0002dp-Js
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:17:43 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oyAEe-0004Ep-O3
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 06:17:42 -0500
Received: by mail-lf1-x12c.google.com with SMTP id g12so2084547lfh.3
 for <qemu-devel@nongnu.org>; Thu, 24 Nov 2022 03:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhxUmkalyZWIXRzY7qEve1Fk0E2Ph/LUBUI2GhJnYhQ=;
 b=Ee+QnpkjvNDy85MinSB9/dGPi9uTcUDW9GOb4vhC9B7Q2QFgEqh2PXAwFvHLFXepZ/
 TTHoGPNIXxM2FyALmmESwKZiNZx3W7tfplM+APUAWEL7D6H5C4p87I1OT4/3zLXKuj40
 qY4YAFGlDdmBw2Uhc+ePK05tSpFqC/6/OEUCBbgIsjHKlXQcqV0SrlTgTbfsru/usw/N
 cZ8LVaswy9kaX0Kln7bmaRFpWjjhp5YkAF5P48eCILbS9y6fDtw0feC2IXN+RVac3pRw
 gnfvDTHFFvxMoZCsjNyUneK/Zd/+s5hE+fg+wk/wlvRm/Eb05XRRRCLU4OB+zdm3xVFe
 WYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HhxUmkalyZWIXRzY7qEve1Fk0E2Ph/LUBUI2GhJnYhQ=;
 b=FkszKguktWdXGKpJfDRiLAkUp4pQPugs9YL4o9BFZ7cGetuuHPFMmkUlSz7fiScciy
 6y35S/YhZ2ZtZ0GxkGoLkJesx9YArVNHHIdFF6VBeccKS/MGd7ZDyI5C0nuaW9isdAEe
 5s14/RFIo9koIFppvl9d/OTQzUJ1Vo7q6DfPzJcNx6nqXpVtKmQGB1pKiR6P+YC/4Yr1
 /ssb46b1pO9Xb1xdrLGzxNlqgbfoFxZ5G9OT1wLdzTMdo+iqcOPWWn0cFGTnXSTYenV4
 cYEYQqiF4pR2GeY/XQMO5Mr/Eq2e97zD3TQmXIWz6iDWCLjOI50gVpGy3OnZkNEbQoNN
 4fvQ==
X-Gm-Message-State: ANoB5pkcvTkfp+Le6x2efY/cdL+TpAR7VExUs+XrVrTL2QnaeGBNuOXL
 6EPscCcWhcmqa5C/J1YNp4D2uNngLYmc7Qwkx8E=
X-Google-Smtp-Source: AA0mqf6rM6zXBZxYLvLdi4PLYkNKveAicTwwMiRRVGPE9LSg2SvZWc1E5k0PDhk7+oDCg7AqhZGaTU6EhxzxAT4ANJQ=
X-Received: by 2002:a19:6a18:0:b0:48b:1973:e3bf with SMTP id
 u24-20020a196a18000000b0048b1973e3bfmr7508349lfu.328.1669288658461; Thu, 24
 Nov 2022 03:17:38 -0800 (PST)
MIME-Version: 1.0
References: <20221028045736.679903-1-bin.meng@windriver.com>
 <20221028045736.679903-12-bin.meng@windriver.com>
 <CAJ+F1CJnW-95ZpfBBKFX=O_XsFOZ+quTU4dYmK8Cr8B-Ww_Hqw@mail.gmail.com>
 <3e3178f9-73a7-031a-6cd0-4a315989b567@redhat.com>
In-Reply-To: <3e3178f9-73a7-031a-6cd0-4a315989b567@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 24 Nov 2022 15:17:26 +0400
Message-ID: <CAJ+F1CLvBgX1_t9QhZ6wnJbdE071CFdsuWtWHxSOTDqCsMRxEg@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] tests/qtest: Enable qtest build on Windows
To: Thomas Huth <thuth@redhat.com>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12c.google.com
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

Hi Thomas

On Wed, Nov 23, 2022 at 6:19 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 23/11/2022 15.13, Marc-Andr=C3=A9 Lureau wrote:
> > Hi Bin
> >
> > On Fri, Oct 28, 2022 at 9:06 AM Bin Meng <bin.meng@windriver.com> wrote=
:
> >>
> >> Now that we have fixed various test case issues as seen when running
> >> on Windows, let's enable the qtest build on Windows.
> >>
> >> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >> Reviewed-by: Thomas Huth <thuth@redhat.com>
> >
> > We haven't solved the CI timing out or eating all the CPU time, right?
> >
> > Can we simply exclude it from CI for now, ie add to this patch
> >
> > diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> > index 093276ddbc..ba9045ec38 100644
> > --- a/.gitlab-ci.d/windows.yml
> > +++ b/.gitlab-ci.d/windows.yml
> > @@ -62,7 +62,7 @@ msys2-64bit:
> >     - .\msys64\usr\bin\bash -lc './configure --target-list=3Dx86_64-sof=
tmmu
> >         --enable-capstone'
> >     - .\msys64\usr\bin\bash -lc 'make'
> > -  - .\msys64\usr\bin\bash -lc 'make check || { cat
> > build/meson-logs/testlog.txt; exit 1; } ;'
> > +  - .\msys64\usr\bin\bash -lc 'make check MTESTARGS=3D"--no-suite
> > qtest" || { cat build/meson-logs/testlog.txt; exit 1; } ;'
> >
> >   msys2-32bit:
> >     extends: .shared_msys2_builder
> > @@ -96,4 +96,4 @@ msys2-32bit:
> >     - cd output
> >     - ..\msys64\usr\bin\bash -lc "../configure --target-list=3Dppc64-so=
ftmmu"
> >     - ..\msys64\usr\bin\bash -lc 'make'
> > -  - ..\msys64\usr\bin\bash -lc 'make check || { cat
> > meson-logs/testlog.txt; exit 1; } ;'
> > +  - ..\msys64\usr\bin\bash -lc 'make check MTESTARGS=3D"--no-suite
> > qtest" || { cat meson-logs/testlog.txt; exit 1; } ;'
>
> I think it's only the 64-bit job that is really problematic, so we could
> still run the qtests in the 32-bit job?
>
> Alternatively, what about switching the 64-bit to another target that doe=
s
> not have so many qtests enabled? Some mips-softmmu or riscv-softmmu maybe=
?
> ... we still check x86_64-softmmu in the .cirrus.yml builds, so this is
> hopefully not such a big loss...
>

The change I propose above is to simply skip the qtests on msys CI
builds. They are not running today on !POSIX.


--=20
Marc-Andr=C3=A9 Lureau

