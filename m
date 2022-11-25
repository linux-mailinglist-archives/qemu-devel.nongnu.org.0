Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897BC638702
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 11:05:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyVZs-0003Z7-9L; Fri, 25 Nov 2022 05:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyVZR-0003TF-5M
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 05:04:43 -0500
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyVZO-00058M-KZ
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 05:04:32 -0500
Received: by mail-qt1-x830.google.com with SMTP id l2so2254494qtq.11
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 02:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZTllPnEQ+BT7CA3VeYgM63/BhKCgc7IIsPgAvW6XTX0=;
 b=AHL6B/V3eWaRAonJjgSmkrWWqxNFFFzVkxmRoNmBiPDwMbaGL6RV6XdDfo3QFmsaBn
 hiCbA5dkJE6UfpM1IfxKacAlo+UI4jZALiburS+L1z58oLBUPyipjCi8dl3hYzjvHe3g
 rKQMdIt4HSKleb4MLcbbzqtyikfjudHnJWnmkQAuAOUkrzwEJ5F4f8+ZDXGSzFzfw84G
 TQ0A660z6OaQu7WXJh9lcTcEpydPtgGFHrnUE738E5C/YTpVMWrgwhH4t64ShQPdpePn
 9tSbosmjlsmL+43CWUmt+5vk8HJPm3D/3DdWRIGfikssDQ5xSg/sldnimEe1HSeAoknA
 zGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZTllPnEQ+BT7CA3VeYgM63/BhKCgc7IIsPgAvW6XTX0=;
 b=pQeCH7IHwDZd0RNuepjK4oiwRmOtAPnAMgJGK8J349igRaAtAih1DsEMRUZRzl0WMD
 xv65prz0yvu5n8AYkkgXTEY/kpBE88DXicxuCCZBptj1vKc6mEI9xllOdahqVB1B8o2D
 vSkcJgzbVGu46GV7TnoMoGy0uo9dA/rBOe2pTnSseKTqyQOYyte36qJ2zCcko57Ev9mH
 viC/Jce2RqvJMAE9yjUYOQwN8F3XfBuHQx36p/1reyx39qUDqkeD1TAq3xl7xUMLUvl1
 pp1CT01XpIqXQYlZF33tVwEfV+nBOZu9o4A9vhak2mkBrvwxn/vFR9JceBUYMIfNbB1s
 lIpA==
X-Gm-Message-State: ANoB5pmTyPfGY2ROT/cmFIAmxd+cBVenQyBWtwRIu0CKYPCd6wQpPgS7
 fmy0q+MKN6L/PiiFL8dQP/D0HVvpwNBISa9u7RA=
X-Google-Smtp-Source: AA0mqf7JDfA6IRIF75zRrNHqwWhiofwABYNYTipvNLOS9ICIJoEyj0CaW8c10RzBa6J+BzDprVv0jUTPfsUELlRZkZ0=
X-Received: by 2002:a05:622a:258b:b0:3a5:c5a4:c1ac with SMTP id
 cj11-20020a05622a258b00b003a5c5a4c1acmr15973028qtb.276.1669370669452; Fri, 25
 Nov 2022 02:04:29 -0800 (PST)
MIME-Version: 1.0
References: <20221028045736.679903-1-bin.meng@windriver.com>
 <20221028045736.679903-12-bin.meng@windriver.com>
 <CAJ+F1CJnW-95ZpfBBKFX=O_XsFOZ+quTU4dYmK8Cr8B-Ww_Hqw@mail.gmail.com>
In-Reply-To: <CAJ+F1CJnW-95ZpfBBKFX=O_XsFOZ+quTU4dYmK8Cr8B-Ww_Hqw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 25 Nov 2022 18:04:19 +0800
Message-ID: <CAEUhbmVPymrJPigc7UOqJN4HTN55Y62+NJ-MC46BSZJugE6YBQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/11] tests/qtest: Enable qtest build on Windows
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x830.google.com
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

Hi Marc-Andr=C3=A9,

On Wed, Nov 23, 2022 at 10:14 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi Bin
>
> On Fri, Oct 28, 2022 at 9:06 AM Bin Meng <bin.meng@windriver.com> wrote:
> >
> > Now that we have fixed various test case issues as seen when running
> > on Windows, let's enable the qtest build on Windows.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
>
> We haven't solved the CI timing out or eating all the CPU time, right?

Correct

>
> Can we simply exclude it from CI for now, ie add to this patch

Thanks for your suggestion!

>
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index 093276ddbc..ba9045ec38 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -62,7 +62,7 @@ msys2-64bit:
>    - .\msys64\usr\bin\bash -lc './configure --target-list=3Dx86_64-softmm=
u
>        --enable-capstone'
>    - .\msys64\usr\bin\bash -lc 'make'
> -  - .\msys64\usr\bin\bash -lc 'make check || { cat
> build/meson-logs/testlog.txt; exit 1; } ;'
> +  - .\msys64\usr\bin\bash -lc 'make check MTESTARGS=3D"--no-suite
> qtest" || { cat build/meson-logs/testlog.txt; exit 1; } ;'

The double quote should be escaped.

>
>  msys2-32bit:
>    extends: .shared_msys2_builder
> @@ -96,4 +96,4 @@ msys2-32bit:
>    - cd output
>    - ..\msys64\usr\bin\bash -lc "../configure --target-list=3Dppc64-softm=
mu"
>    - ..\msys64\usr\bin\bash -lc 'make'
> -  - ..\msys64\usr\bin\bash -lc 'make check || { cat
> meson-logs/testlog.txt; exit 1; } ;'
> +  - ..\msys64\usr\bin\bash -lc 'make check MTESTARGS=3D"--no-suite
> qtest" || { cat meson-logs/testlog.txt; exit 1; } ;'

I don't think we need to touch 32-bit.

> Could you resubmit your missing win test patches and check if gitlab is h=
appy?
>

Sure, will do soon.

Regards,
Bin

