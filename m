Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7781032993A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 11:13:02 +0100 (CET)
Received: from localhost ([::1]:33958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH21V-00049C-Gn
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 05:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lH20c-0003Vd-Qx; Tue, 02 Mar 2021 05:12:06 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:39024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lH20a-0007RE-TQ; Tue, 02 Mar 2021 05:12:06 -0500
Received: by mail-yb1-xb32.google.com with SMTP id u3so20133440ybk.6;
 Tue, 02 Mar 2021 02:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qgFeem7DdvjQn5+6x6sHVnmHVJTnTDVJFd+ycuUthQU=;
 b=plSiP3Z9qFE/pgK/PU+dPUhFG+3yHKJQI6z3//vW0uub143Yj67b2lUdNJjybP+D6H
 CTwqIEXyIPRhb82SELH246zopsiaFcQGT4+UhhIaKyXxfSvOuP9ZFJxX0+ILEVnNV6uO
 G00C9m1R0kqTh307EkXl2ux2koLg37UpSJho5OG+msYVf4Ebe/IaISifmXsYDalgltqH
 sOpyRReKN4rJbr5qcuhQf+S/QsOXa1arLPJXDvWsuPm4qBt9l/JmLBIOxEzENUpuGMj2
 Cwb7lCGSMO7tb3GJsiJEm4XBM54vgT6thn1/lM/RBosQ91PtYNXT+NbT2X8JEU8Q5HUh
 dkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qgFeem7DdvjQn5+6x6sHVnmHVJTnTDVJFd+ycuUthQU=;
 b=GUPXcQtukuvZm/g2vw8nVaYXaRokKhquc9nHgKe5ZPL1GH9NwfHV7a74WVG6It+9M7
 jWdaZvf4/Ebz90P3js0Pn2rdgd/fl3XSl/JHRx1INTeR9j4f0yDMVHtCOv71aqHJyaMy
 e+z5koWHeMBRuk4v6eTfip+OZpZdUUlOC7YRHKebh4RhkTcAI4ig+6bmVabVXeh+le9I
 dm4Hzg76aTa655m+rAHCysXYFkLkRidU9KsUXyJ62myta+8r8jz5NgfHUpopMuBAcM58
 StZawaSM7uWGLm2DSYTRzf53IjyICcgsBmtkuM9Tjry64mmpXxyArIStELImqYN+KY+V
 qZ2g==
X-Gm-Message-State: AOAM532P8dAzM2V9hnmF8/QHwI0uFLe3gZLG0u3Woq8XYOKQoRqRP4+i
 dX6Fw76qqpcRVKBOUGeEj8ZTdOJFpnzPX/ChnJo=
X-Google-Smtp-Source: ABdhPJy4VoO8Z5IwKRLIZlXDc3bAfVr5X6dXY6HnkqiW3PioR7PVg73Edrx9cMtCQohjamPtuW3vtlfSi6+WLvct8uo=
X-Received: by 2002:a25:8712:: with SMTP id a18mr29652487ybl.306.1614679923556; 
 Tue, 02 Mar 2021 02:12:03 -0800 (PST)
MIME-Version: 1.0
References: <009801d70f44$a75be810$f613b830$@etri.re.kr>
 <0db71960-2a24-5c64-6e2b-42ecdd02b9d6@redhat.com>
In-Reply-To: <0db71960-2a24-5c64-6e2b-42ecdd02b9d6@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 2 Mar 2021 18:11:51 +0800
Message-ID: <CAEUhbmWxCuJEcGuBVr2K3rzL2tmHeKvGNnwgohc_cUOC=V7eOg@mail.gmail.com>
Subject: Re: ninja install on ubuntu 16.04 for qemu-5.2.0 build
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>, ckim@etri.re.kr,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 2, 2021 at 6:02 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> On 3/2/21 10:15 AM, ckim@etri.re.kr wrote:
> > Hello,
> >
> > qemu-5.2.0 now internally uses mesa for building qemu.
> >
> > Isn=E2=80=99t there any guideline for this new build method on qemu doc=
ument
> > page?( I couldn=E2=80=99t find one).
> >
> > I was met with this =E2=80=98couldn=E2=80=99t find Ninja 1.7 or newer=
=E2=80=99 and tried
> > installing ninja with apt-get but the version is too low.(it seems it=
=E2=80=99s 1.5)
>
> 1.7.1 is available, maybe try running "apt-get update" first?
>
> Package: ninja-build
> Architecture: amd64
> Version: 1.7.1-1~ubuntu16.04.1
> Priority: optional
> Section: universe/devel
> Origin: Ubuntu
> Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
> Original-Maintainer: Felix Geyer <fgeyer@debian.org>
> Bugs: https://bugs.launchpad.net/ubuntu/+filebug
> Installed-Size: 286
> Depends: libc6 (>=3D 2.15), libstdc++6 (>=3D 5.2)
> Conflicts: ninja
> Filename:
> pool/universe/n/ninja-build/ninja-build_1.7.1-1~ubuntu16.04.1_amd64.deb
> Size: 91424
> MD5sum: 6384d9c31ca18803e90b7bf3f5c3ab28
> SHA1: ab64ea16c36a39bbfd6929351fff8e2d5768e801
> SHA256: 8f8ba3ccb7873cb264bd648437eb8e7d7abd4093254135f6830e368a25512b9f
> SHA512:
> 222de7f1dc96979a9d1487f090cd138397b0f6cc935acf99166a5b6d8ba951529d93039e6=
d431b85fa9abaf4285961e643a97dce747e41f76f4b874e1932c25e
> Homepage: https://ninja-build.org/
> Description: small build system closest in spirit to Make
> Description-md5: 5ef1371c63de86fcf36c1ddc875d2f26
>
> >
> > I guess because I=E2=80=99m using ubuntu 16.04 - somewhat old version, =
I=E2=80=99ll have
> > to download the ninja and mesa.
> >
> > Can someone give me an advice on which is the best way to solve this?

FYI, Ubuntu 16.04 is no longer a supported host.

I am working on Ubuntu 16.04 with a ninja I built from source, and
passed it to QEMU configure script which works fine.

>
> An alternative when you can't update the system packages is to use a
> Docker container (you might need to ask the machine administrator to
> install it).
>

Regards,
Bin

