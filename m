Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F55325CC7
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:59:23 +0100 (CET)
Received: from localhost ([::1]:59480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFVDm-0003ZM-R0
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:59:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lFVCx-000393-6D
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 23:58:32 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:39821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lFVCt-0005gG-9A
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 23:58:30 -0500
Received: by mail-ej1-x62f.google.com with SMTP id gt32so1095050ejc.6
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 20:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DyypG/pnqy4Tk3x8mWVttt6BCL/g38fk72tfDxnn2Kw=;
 b=rfhCZjw7bB37JSlpBUyqqTKvr/bNO8s7KxK2yqVRZ6f996IeHTNVmYMXw9/80oTWLr
 2vqAoUbWE/krVkgMDUhOPIrL4K8L9YQHWBhPa9+ineeMNXTjyV3U0yK6vqMGKv96wy6c
 icIIhsiT/zBMRVH9IdvgeTmTmLcmu5rjfe2Da/JHnd9X12TFY1cPJ1pr0zC2T14Ec+xm
 KzvJwVvYq6BH3DTSd/8Ri3zp7nejTDmLLBLFS+X2BnMRA/LhFA232gaQ0ysBvU4iv08M
 B+L9NDyA1l1Hta4EUyafJ8al3NVzi7D4pJ8A5Afb5xy5ajHQD2R8RN7cJUCZBQeyBLOm
 qnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DyypG/pnqy4Tk3x8mWVttt6BCL/g38fk72tfDxnn2Kw=;
 b=ODqWAZDNekkGNAyb0HTrSPEomcbSccZUZxHn9MgFHccd625Vvr+WdWWyPvUD3EfzB5
 ux9+oHxboV0F56U8i1sbAFnB5ycdPgQVfFkQLDD4BcRhNyf+Bz99B1LyOZ9tCcO1OEeR
 yp23mjBHWnr3mvEpaBpRnA4qbcb6vdz6IEGIatdsHxQ1hpVdQNf6KMUl970raziSyYwX
 PGRViwizjq/I2ZbpsZ3WQL6oZ5SJVJaVCb146uPXicszOBWprRaTVi+dZwZFIDAFJ7fn
 c8lw6Lp4rJPDUCNcJlYWypTGRJZCAi4TyvNKTUlRKCL7mRFgiVqsGds0A1lUytu6XAii
 vJJA==
X-Gm-Message-State: AOAM531HjFa0BoKEJK9R+d5Bdw38ody5Q3YR9SFW8cAzwDunX6E7bzu3
 YBu8fcXBobiH2/RTrlNS1kZWZ/B0X/ziflZWLI8=
X-Google-Smtp-Source: ABdhPJx0p1iSvWGS4N1Xz6Pmqp8rkfd6tkz1GgxM+bDl4ekT/5twpJeYYCZ0ggWAfdvGzZFrCuJf49WpaCfCmyd0p9Q=
X-Received: by 2002:a17:906:f01:: with SMTP id
 z1mr1316814eji.235.1614315505102; 
 Thu, 25 Feb 2021 20:58:25 -0800 (PST)
MIME-Version: 1.0
References: <419dbb9c-badd-25d8-1755-00978a592671@redhat.com>
 <20210225000614.46919-1-akihiko.odaki@gmail.com>
 <2d7fa111-9970-b417-392c-4ddaef3cc4a8@redhat.com>
In-Reply-To: <2d7fa111-9970-b417-392c-4ddaef3cc4a8@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Fri, 26 Feb 2021 13:58:10 +0900
Message-ID: <CAMVc7JXz5to68CShs5s1T=Xybg_AD78dk--9Ce-3D6HR2wATQw@mail.gmail.com>
Subject: Re: [PATCH] hvf: Sign the code after installation
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x62f.google.com
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
Cc: qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B42=E6=9C=8825=E6=97=A5(=E6=9C=A8) 22:48 Paolo Bonzini <pbonzini=
@redhat.com>:
>
> On 25/02/21 01:06, Akihiko Odaki wrote:
> > Before this change, the code signed during the build was installed
> > directly.
> >
> > However, the signature gets invalidated because meson modifies the code
> > to fix dynamic library install names during the install process.
> >
> > It also prevents meson to strip the code because the pre-signed file is
> > not marked as an executable (although it is somehow able to perform the
> > modification described above).
> >
> > With this change, the unsigned code will be installed and modified by
> > meson first, and a script signs it later.
> >
> > Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>
> Thanks very much!  As mentioned in the other message, I would prefer to
> have a single script so here is what I came up with.
>
> #!/bin/sh -e
> #
> # Helper script for the build process to apply entitlements
>
> copy=3D:
> if [ "$1" =3D --install ]; then
>    shift
>    copy=3Dfalse
>    cd "$MESON_INSTALL_DESTDIR_PREFIX"
> fi
>
> SRC=3D"$1"
> DST=3D"$2"
> ENTITLEMENT=3D"$3"
>
> if $copy; then
>    trap 'rm "$DST.tmp"' exit
>    cp -af "$SRC" "$DST.tmp"
>    SRC=3D"$DST.tmp"
> fi
>
> codesign --entitlements "$ENTITLEMENT" --force -s - "$SRC"
> mv -f "$SRC" "$DST"
> trap '' exit
>
>
> I'll include this in the next pull request, since I was able to test it
> with Cirrus CI.
>
> Thanks,
>
> Paolo
>

I wonder what happens if codesign fails when modifying "$SRC" during
installation. The half-modified binary is still at "$SRC" and mtime is
newer than the binary in the build directory, so meson given
--only-changed may think it is "not changed" and leave it corrupted.
"mv" should be performed earlier to avoid such a case.

It is kind of theoretical and *very* unlikely to happen anyway, so it
is fine for me to include it. Anything else looks good for me and
should solve the problem nicely.

Thanks,
Akihiko Odaki

