Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578692F094D
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 20:11:04 +0100 (CET)
Received: from localhost ([::1]:43448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyg7C-0000q5-VQ
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 14:11:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kyg4l-0007zY-Io
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 14:08:31 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:42102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kyg4j-0002t2-9x
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 14:08:31 -0500
Received: by mail-lf1-x136.google.com with SMTP id b26so34723448lff.9
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 11:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=w2JSh9jzqKWndW7zhRcP8mtflKr30F+Nvu+Y358mYpw=;
 b=MvkJ/h6sJp/5XgvcjaQuXVzqj5wXC70sYwNVNaA2+nXxSLTNcAUBD7n4gJjlJw8mDD
 w0rXArf/jVbuB3KdVJKJbH6/HYZ6mfQiR9t3gRjNIBZLDeTZjB1n+Yx0awIiw2J7t2FM
 KjQ4DaEX8nUFbtpN6/F5JnNSmyItoRiaaP47zLhGDRriBBA2F/2I2HzYuALw22Ja7Ktm
 IwOjlXj544w5p6Hed5389XT6m++C7PPJWdGHZDk09Fw18CMZevBaJXqWU0/blTtuiOOi
 zMeQTUFr0vyR/Wo/OVFe/ODuBCSUWFaGqKkRjj138Ljyf1eEKFHPOq6Sa+CF4R+CNSBH
 oAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=w2JSh9jzqKWndW7zhRcP8mtflKr30F+Nvu+Y358mYpw=;
 b=uIez5/pyg8To2TbT2oDIhd6GIc62qcfJmGpg4Kg0qeU0Hs488Q+LoTS8os8Tke0iJ6
 UvjJMV24rYw8dI/JISYvMV8Szb0rW1Rf8rLrhbXIUxCq+96Gc7hZCEgUxm3qsaaiP8lh
 rMcFSbIwyo6aDm5cir4VAMGJcwnhCAZ7T4AsRROQYcD4uQBrKvZTvdCl/F4kfG2c4ExH
 rSdnYdRJjhoetHgv3mrG8XvseTvWMwy95eKyOAoM2Shy7vlnmBxIOGYohfVLnWPWCHNJ
 U6c0XnNE5UDu2uK4bPjUQQEHfNgx/cobpyE7RsXxrFvXVwa9uKq3sey8afiQzISenQp6
 G9ww==
X-Gm-Message-State: AOAM531v8nvbxk2w8yXWwwZ4c/iE+4mB7G/KEpi3W5/iERrzQp+fn4yV
 mtvou5CWQunKUdKKWQ/voWoKGXfil/Ifx2qmlxs=
X-Google-Smtp-Source: ABdhPJwSqC4fCI4hmtgnoRFIDNyn7iQCwOu0xyII49pF+QJHOQW7gcDBhhCh+uhf41udfAhCkhMCYiXpeia+eo3EVKM=
X-Received: by 2002:a19:ecb:: with SMTP id 194mr5473475lfo.70.1610305706880;
 Sun, 10 Jan 2021 11:08:26 -0800 (PST)
MIME-Version: 1.0
References: <20210108153621.3868-1-peter.maydell@linaro.org>
 <CAFEAcA93-13NZY_om35rRYOXimWDHMndGdxjY8NwGarzbgDwwQ@mail.gmail.com>
In-Reply-To: <CAFEAcA93-13NZY_om35rRYOXimWDHMndGdxjY8NwGarzbgDwwQ@mail.gmail.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Mon, 11 Jan 2021 03:08:15 +0800
Message-ID: <CAE2XoE_1q+vq8Qb6=wWPWansBRjqZ=UOBgTefVK2fA_K64r5Ng@mail.gmail.com>
Subject: Re: [PULL 00/23] target-arm queue
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a3722e05b89083ea"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: luoyonggang@gmail.com
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a3722e05b89083ea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 9, 2021 at 1:51 AM Peter Maydell <peter.maydell@linaro.org>
wrote:
>
> On Fri, 8 Jan 2021 at 15:36, Peter Maydell <peter.maydell@linaro.org>
wrote:
> >
> > Nothing too exciting, but does include the last bits of v8.1M support
work.
> >
> > -- PMM
> >
> > The following changes since commit
e79de63ab1bd1f6550e7b915e433bec1ad1a870a:
> >
> >   Merge remote-tracking branch
'remotes/rth-gitlab/tags/pull-tcg-20210107' into staging (2021-01-07
20:34:05 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://git.linaro.org/people/pmaydell/qemu-arm.git
tags/pull-target-arm-20210108
> >
> > for you to fetch changes up to c9f8511ea8d2b80723af0fea1f716d752c1b5208=
:
> >
> >   docs/system: arm: Add sabrelite board description (2021-01-08
15:13:39 +0000)
> >
> > ----------------------------------------------------------------
> > target-arm queue:
> >  * intc/arm_gic: Fix gic_irq_signaling_enabled() for vCPUs
> >  * target/arm: Fix MTE0_ACTIVE
> >  * target/arm: Implement v8.1M and Cortex-M55 model
> >  * hw/arm/highbank: Drop dead KVM support code
> >  * util/qemu-timer: Make timer_free() imply timer_del()
> >  * various devices: Use ptimer_free() in finalize function
> >  * docs/system: arm: Add sabrelite board description
> >  * sabrelite: Minor fixes to allow booting U-Boot
>
>
> Applied, thanks.
>
> Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
> for any user-visible changes.
>
> -- PMM
>
Caused win32 CI failure

https://cirrus-ci.com/task/6055645751279616?command=3Dtest#L593


MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
G_TEST_SRCDIR=3DC:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus-c=
i-build/tests
G_TEST_BUILDDIR=3DC:/Users/ContainerAdministrator/AppData/Local/Temp/cirrus=
-ci-build/build/tests
tests/test-qht.exe --tap -k
ERROR test-qht - too few tests run (expected 2, got 0)
make: *** [Makefile.mtest:256: run-test-30] Error 1
--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000a3722e05b89083ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Sat, Jan 9, 2021 at 1:51 AM Peter Maydell &lt;<=
a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt;=
 wrote:<br>&gt;<br>&gt; On Fri, 8 Jan 2021 at 15:36, Peter Maydell &lt;<a h=
ref=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wr=
ote:<br>&gt; &gt;<br>&gt; &gt; Nothing too exciting, but does include the l=
ast bits of v8.1M support work.<br>&gt; &gt;<br>&gt; &gt; -- PMM<br>&gt; &g=
t;<br>&gt; &gt; The following changes since commit e79de63ab1bd1f6550e7b915=
e433bec1ad1a870a:<br>&gt; &gt;<br>&gt; &gt; =C2=A0 Merge remote-tracking br=
anch &#39;remotes/rth-gitlab/tags/pull-tcg-20210107&#39; into staging (2021=
-01-07 20:34:05 +0000)<br>&gt; &gt;<br>&gt; &gt; are available in the Git r=
epository at:<br>&gt; &gt;<br>&gt; &gt; =C2=A0 <a href=3D"https://git.linar=
o.org/people/pmaydell/qemu-arm.git">https://git.linaro.org/people/pmaydell/=
qemu-arm.git</a> tags/pull-target-arm-20210108<br>&gt; &gt;<br>&gt; &gt; fo=
r you to fetch changes up to c9f8511ea8d2b80723af0fea1f716d752c1b5208:<br>&=
gt; &gt;<br>&gt; &gt; =C2=A0 docs/system: arm: Add sabrelite board descript=
ion (2021-01-08 15:13:39 +0000)<br>&gt; &gt;<br>&gt; &gt; -----------------=
-----------------------------------------------<br>&gt; &gt; target-arm que=
ue:<br>&gt; &gt; =C2=A0* intc/arm_gic: Fix gic_irq_signaling_enabled() for =
vCPUs<br>&gt; &gt; =C2=A0* target/arm: Fix MTE0_ACTIVE<br>&gt; &gt; =C2=A0*=
 target/arm: Implement v8.1M and Cortex-M55 model<br>&gt; &gt; =C2=A0* hw/a=
rm/highbank: Drop dead KVM support code<br>&gt; &gt; =C2=A0* util/qemu-time=
r: Make timer_free() imply timer_del()<br>&gt; &gt; =C2=A0* various devices=
: Use ptimer_free() in finalize function<br>&gt; &gt; =C2=A0* docs/system: =
arm: Add sabrelite board description<br>&gt; &gt; =C2=A0* sabrelite: Minor =
fixes to allow booting U-Boot<br>&gt;<br>&gt;<br>&gt; Applied, thanks.<br>&=
gt;<br>&gt; Please update the changelog at <a href=3D"https://wiki.qemu.org=
/ChangeLog/6.0">https://wiki.qemu.org/ChangeLog/6.0</a><br>&gt; for any use=
r-visible changes.<br>&gt;<br>&gt; -- PMM<br>&gt;<br>Caused win32 CI failur=
e<br><br><a href=3D"https://cirrus-ci.com/task/6055645751279616?command=3Dt=
est#L593">https://cirrus-ci.com/task/6055645751279616?command=3Dtest#L593</=
a><br><br><br>MALLOC_PERTURB_=3D${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 +=
 1))} G_TEST_SRCDIR=3DC:/Users/ContainerAdministrator/AppData/Local/Temp/ci=
rrus-ci-build/tests G_TEST_BUILDDIR=3DC:/Users/ContainerAdministrator/AppDa=
ta/Local/Temp/cirrus-ci-build/build/tests tests/test-qht.exe --tap -k<br>ER=
ROR test-qht - too few tests run (expected 2, got 0)<br>make: *** [Makefile=
.mtest:256: run-test-30] Error 1<br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>Yours<=
br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo<br></div>

--000000000000a3722e05b89083ea--

