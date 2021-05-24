Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974A838E1B7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 09:31:49 +0200 (CEST)
Received: from localhost ([::1]:50462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll53z-000087-WD
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 03:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alcho.tw@gmail.com>)
 id 1ll52Z-0007Rv-RU
 for qemu-devel@nongnu.org; Mon, 24 May 2021 03:30:19 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:40917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alcho.tw@gmail.com>)
 id 1ll52X-0008Bv-To
 for qemu-devel@nongnu.org; Mon, 24 May 2021 03:30:19 -0400
Received: by mail-io1-xd31.google.com with SMTP id e17so14351364iol.7
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 00:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N3+ByT0dLIVfeUKSCTgYkON1SPu1lRCcqkA2oXMFMeY=;
 b=c8NDAdEPZJ7eILWkA24FqAbSnoGAeVkkOyjcDbDA1Y0Nb7mr9Usofxmmk4GfTl82iq
 op68KzTc784bez1ZvGCWzSymZ/wQIUzD/eEEUx91woCeSmEEvsG0AOmuDYMvb2kIkfqr
 dv48UCtB/BgryONEyfLFrnzxE4pADLg+VlU3dVlkhatbjgfcliGI6uPEaXHvE0LUsxRy
 llLEvVYsiGxqC2pUPDNKVKwwVhsg3FnMYmUeGZafN7z9KDhidJCV9FYhtWfEAeYE90yf
 KJOJuCiPFbW65uxYbk0gBo52VdW4bTWXheFLK4QeKgrxn4CbIYUefTgRxu/37Wr8MQmc
 8TQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N3+ByT0dLIVfeUKSCTgYkON1SPu1lRCcqkA2oXMFMeY=;
 b=VmvZ3cWm2edycjF0SbkuJHjDsctj8nbaFSlfpNpdt/S9zRnf2XfXFHhoDf0fHS0dX7
 uz0PAjuvUZ2dxEYgsdiJfgq5BPnmXvoe/0EbLEu9oRBj6/zoeJ/hmIKQdnm8i2bXKmlC
 BBUPrRcB4S1wdipBZtecvxR6ou0jSwPNGfRvtnljnUJWiWGyP0vLvFWOIvyhIK2XxJNd
 tUA1BTVv1nyQ0G5M5C4l8qfjKGiQ3tUgcInIzD6UElR01m6/tSRdJovdkdDJmx0KmqAh
 QZQqVy3SmpiZI/BBOnK6u6TY8KOJFa8x0s+hw20drZ5si/oz8+t/GcB27iRa3oUJ5Bq4
 akqg==
X-Gm-Message-State: AOAM532b2dANy8R+mVrpG3sWZyQrkxODzY/T3fcDF4KHTegMM+6WR4d2
 vAlr/rAJ0C/SbHPOE+/1UJKSiEYvDbbThFN2J3U=
X-Google-Smtp-Source: ABdhPJw7va5ABa4VUo7funIK2ugUeXhVCg4WbBhC4xA5f4DNLiirBVvnGmW+X/56eX6x9sg14+fzz/1kJodMYuIss6Q=
X-Received: by 2002:a6b:d80b:: with SMTP id y11mr11374756iob.202.1621841415660; 
 Mon, 24 May 2021 00:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <466cf154-cabf-2e8f-021f-a82cf7b88b31@suse.de>
 <20be5f7e-f475-4f3c-0fca-fff1750c08fe@suse.de>
 <87tun0cf3d.fsf@linaro.org> <198d8ef3-cc15-6f9d-6455-286748a705a8@suse.de>
 <871ra1crx4.fsf@linaro.org>
In-Reply-To: <871ra1crx4.fsf@linaro.org>
From: Cho Yu-Chen <alcho.tw@gmail.com>
Date: Mon, 24 May 2021 15:30:04 +0800
Message-ID: <CAKA8beXS0GWm+z6h-eo7pG0toOs2WTGPUX3J2DMV+wjYPdaa_Q@mail.gmail.com>
Subject: Re: latest GOOD state of series i386 cleanup, arm cleanup,
 s390 cleanup
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alcho.tw@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Liang Yan <lyan@suse.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Al Cho <ACho@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I also done a branch for current master from [RFC v3 00/13] s390x cleanup

https://gitlab.com/alcho.tw/qemu/-/tree/s390_cleanup_v4

and it's also built and test success passed through my CI:

https://gitlab.com/alcho.tw/qemu/-/pipelines/307149915

Cheers,
           AL


Alex Benn=C3=A9e <alex.bennee@linaro.org> =E6=96=BC 2021=E5=B9=B45=E6=9C=88=
21=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8812:07=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
>
> Claudio Fontana <cfontana@suse.de> writes:
>
> > On 5/18/21 4:02 PM, Alex Benn=C3=A9e wrote:
> >>
> >> Claudio Fontana <cfontana@suse.de> writes:
> >>
> >>> On 5/17/21 11:53 AM, Claudio Fontana wrote:
> >>>> Hello all,
> >>>>
> >>>> due to my inactivity for a few weeks coupled likely with the upstrea=
m processes around qemu-6.0 now the series:
> >>>>
> >>>> 1) i386 cleanup
> >>>> 2) arm cleanup and experimental kvm-only build
> >>>> 3) s390 cleanup
> >>>>
> >>>> have become stale and hard to rebase on latest master.
> >>>> This effect is compounded by the fact that lots of broken tests in
> >>>> master have been added.
> >>
> >> Which tests are these? I know master suffers a bit from occasional
> >> falling red but to my knowledge everything should be green (at least
> >> from my last PR anyway ;-).
> >>
> >>>>
> >>>> In the interest of not losing work,
> >>>> I provide here the latest known good state of these series:
> >>>>
> >>>> For the i386 cleanup:
> >>>> https://gitlab.com/hw-claudio/qemu/-/pipelines/293603386
> >>>>
> >>>> Tests started breaking horribly since about 1/2 weeks.
> >>
> >> The pipeline only shows one failed test (checkpatch) which is an
> >> allowfail I believe. /me is confused.
> >
> > Hi Alex, yes, I pointed to the last pipeline that works :-)
> >
> >>
> >>>> The latest version of the cleanup is reachable here:
> >>>>
> >>>> https://github.com/qemu/qemu.git branch "i386_cleanup_9"
> >>>>
> >>>> In my understanding, Paolo has now picked up this one.
> >>>>
> >>>> For the ARM cleanup and experimental kvm-only build:
> >>>>
> >>>> https://gitlab.com/hw-claudio/qemu/-/pipelines/293603376
> >>>>
> >>>> https://github.com/qemu/qemu.git branch "arm_cleanup_v15"
> >>>>
> >>>> Again here tests started misbehaving in the same timeframe.
> >>>>
> >>>> The state of ARM cleanup is still experimental, maybe Liang or
> >>>> Philippe you can adopt this one?
>
> I've done a re-base onto the current master (and my testing/next):
>
>   https://github.com/stsquad/qemu/tree/review/arm_cleanup_v15
>
> which is currently working it's way through my CI:
>
>   https://gitlab.com/stsquad/qemu/-/pipelines/306727076
>
> As I've got patches waiting for this re-factor I'm happy to take the
> series on if you've run out of time/patience ;-)
>
> --
> Alex Benn=C3=A9e
>

