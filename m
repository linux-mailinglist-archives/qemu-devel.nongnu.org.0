Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF315443B0E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 02:34:44 +0100 (CET)
Received: from localhost ([::1]:34436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi5Ap-0005nV-Sy
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 21:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mi59I-000571-DY
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 21:33:08 -0400
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31]:43806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@google.com>) id 1mi59G-0000on-MU
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 21:33:08 -0400
Received: by mail-vk1-xa31.google.com with SMTP id h133so543472vke.10
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 18:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vTIut1ymaDabKkqB12mW1+gOwQtugPp4jFZ8ypIxeAs=;
 b=NjqHxqgrxFsZ0bsh2dnhaItxtifP9aRWI/v5WRQ10YASsasvPWQwPqvaL72TPOQAvK
 a6Tpenu/eI09r6zipxqhk6IN93iuU5Qgy8iUtzZIT6hS+mCUhoVzEnHXCLqhwU1qL8pF
 jf6e1Ot/5vr/spLOL6wbjl3Poe+knDXN2EiiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vTIut1ymaDabKkqB12mW1+gOwQtugPp4jFZ8ypIxeAs=;
 b=BdnT4fsuJ7C9vxtIwse0PXUv/WFeLbX+KDLUHVzUrgLOGUImrLBzPEazISDe0Iou4O
 raGJhUMJv3wSNF3gTa02bBHJ9lUmE4FFP5hWX8V9cImQofnbPEEllMiks/sYFNukMn08
 l2gF1SbcZmMXBu9alUpYGM5qAIRn/7nErAVexzuIstoFB+XJEGEjC/s+W41mcEiBOeeR
 ZmlapHv/2IKzy+T4LSokqARDRvnd75wApuMOqlOOGIXDGYNkYbYI54nWEZZqsvNbkg1V
 b+8vRYaL1xIM6zRFSuFV8Kg3fion3Nd0pX7rm+oyjQT/V2QV5n3BiY9aocTddslbEPvh
 RIxA==
X-Gm-Message-State: AOAM533Phb9G5kqdV4a3f7WMnDtbhDOw9n3T/2RmAFjfqmp78XaTV3qO
 zfFdrbtLlE0SV8cW0LrGQSK8UWJM6HrcqjSgkxgvcQ==
X-Google-Smtp-Source: ABdhPJxykPw0xbaH+SS8On5xptBVk0H2ZQ2fCavTGAjGrjgc8Y1611tlzp5Koo7EZOJu+NY5ILUnK7VH/Mhh4l6KVaY=
X-Received: by 2002:a1f:1904:: with SMTP id 4mr21787603vkz.9.1635903185278;
 Tue, 02 Nov 2021 18:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211026002344.405160-1-sjg@chromium.org>
 <20211026002344.405160-7-sjg@chromium.org>
 <CAFEAcA-UukuQXT3ebcboiVOSn0J+88w-kzoH8jE1JVxQnoeuvQ@mail.gmail.com>
 <CAPnjgZ2C8okdUMcgKjuLgV8JdPexYY0=9NtbSOHO81dN7=2RCg@mail.gmail.com>
 <CAHFG_=XWc+Fb=m=SHC6=y4KeF533yqCNk=Ae088oAZyjOULPaw@mail.gmail.com>
 <CAPnjgZ0O56yokanMjybQKa1kBmtFHHbDfQ0sPPawrbLWtw7aDQ@mail.gmail.com>
 <20211102165718.GR24579@bill-the-cat>
In-Reply-To: <20211102165718.GR24579@bill-the-cat>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 2 Nov 2021 19:32:54 -0600
Message-ID: <CAPnjgZ1KYRY9a-WBeHVX-5r2O-KBNVU1-6wHRw1of0qHrCt4yA@mail.gmail.com>
Subject: Re: [PATCH v5 06/26] arm: qemu: Add a devicetree file for qemu_arm64
To: Tom Rini <trini@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=sjg@google.com; helo=mail-vk1-xa31.google.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Sean Anderson <seanga2@gmail.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Tom,

On Tue, 2 Nov 2021 at 10:57, Tom Rini <trini@konsulko.com> wrote:
>
> On Tue, Nov 02, 2021 at 08:59:45AM -0600, Simon Glass wrote:
> > Hi Fran=C3=A7ois,
> >
> > On Mon, 1 Nov 2021 at 11:33, Fran=C3=A7ois Ozog <francois.ozog@linaro.o=
rg> wrote:
> > >
> > > Hi Simon
> > >
> > > Le lun. 1 nov. 2021 =C3=A0 17:58, Simon Glass <sjg@chromium.org> a =
=C3=A9crit :
> > >>
> > >> Hi Peter,
> > >>
> > >> On Mon, 1 Nov 2021 at 04:48, Peter Maydell <peter.maydell@linaro.org=
> wrote:
> > >> >
> > >> > On Tue, 26 Oct 2021 at 01:33, Simon Glass <sjg@chromium.org> wrote=
:
> > >> > >
> > >> > > Add this file, generated from qemu, so there is a reference devi=
cetree
> > >> > > in the U-Boot tree.
> > >> > >
> > >> > > Signed-off-by: Simon Glass <sjg@chromium.org>
> > >> >
> > >> > Note that the dtb you get from QEMU is only guaranteed to work if:
> > >> >  1) you run it on the exact same QEMU version you generated it wit=
h
> > >> >  2) you pass QEMU the exact same command line arguments you used
> > >> >     when you generated it
> > >>
> > >> Yes, I certainly understand that. In general this is not safe, but i=
n
> > >> practice it works well enough for development and CI.
> > >
> > > You recognize that you hijack a product directory with development ha=
ck facility. There is a test directory to keep things clear. There can be a=
 dev-dts or something similar for Dev time tools.
> > > I have only seen push back on those fake dts files in the dts directo=
ry: I guess that unless someone strongly favors a continuation of the discu=
ssion, you may consider re-shaping the proposal to address concerns.
> >
> > As stated previously, I would like to have at least a sample DT
> > in-tree for all boards. I cannot see another way to get the Kconfig
>
> What's the point of having a sample when it's not going to always be
> correct or may be actively wrong and we can tell interested developers /
> users how to get the correct DTB/DTS to examine?
>
> > options in line. If we are able to put these files somewhere else in
> > the future and get them out of U-Boot, with perhaps just an overlay
> > for development purposes, I'd be keen to see it. But for now, this is
> > where we are, I believe.
> >
> > In this particular case, this is not just a dev hack. It is also for
> > CI tests which need to use a devicetree. See for example here:
> >
> > https://patchwork.ozlabs.org/project/uboot/patch/20211101011734.1614781=
-15-sjg@chromium.org/
> > https://patchwork.ozlabs.org/project/uboot/patch/20211101011734.1614781=
-24-sjg@chromium.org/
>
> This example would probably be better done on vexpress_ca9x4 where we do
> test in CI via QEMU but do not need to modify a device tree that is
> passed on to us, we already control the source of truth DTB in this
> case.

But that board:

- uses OF_EMBED, which it should not
- does not use SPL, which I need

>
> And also yes, I'm behind on reviewing things I need to review.

Aren't we all...I can't even keep up with these threads.

Regards,
Simon

