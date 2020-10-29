Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1723229ED11
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 14:39:06 +0100 (CET)
Received: from localhost ([::1]:35298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY88u-0005LL-NJ
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 09:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1kY87g-0004Wb-1z
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 09:37:48 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:45096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jandryuk@gmail.com>)
 id 1kY87e-0007zx-8e
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 09:37:47 -0400
Received: by mail-lf1-x144.google.com with SMTP id y184so1374772lfa.12
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 06:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YfRB8FQmwaiiY6xcRF4WpyWAS6wFDwuQyJf55DguVeI=;
 b=Fn544HyQ56FmED4VrrCTbRHrewY2uEkVSqzaOy/OKq87AbdPUFNUyYuUf/nm08B18F
 iio61xHYwW+0NlEBF+CzvBvhgYlXgOWybJHVIZoxTGgPyVXLGTrW9laQpieRFWS1efHN
 98NTlo3NyEXCCSY2B2kvZHKdjFr1y+vIRntqxydoyBb4SFvm+DZgT+SDoHafT9QMrEGd
 +330fhVygOyqlkdKj+YZ9sWNUgIICw5gLXA4G9I1yhnE8kRphXrZ9CgJHUH7AKeN9WW2
 QOXuca2P4poUhCZ/oNkEDcMIaO3ERXDygL++4LhCSvNvwcF+Fff7OeRQdXA5+MQIVC/9
 yr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YfRB8FQmwaiiY6xcRF4WpyWAS6wFDwuQyJf55DguVeI=;
 b=EXCnYTv6lb54BZykFNWdcsPr/DvJrehBhW1Hk4gY7hatUBZmVrBBLC4tQPeAbm5Au4
 S8p/nqTKkFsVrfIVj/llotZ+y8OwCbo4YKBfH5QIGFGt7OT8Gpd/UUAUHrCgq5O744BI
 7fwhmJ7g2rz8nFmLNT8hvBT+Jwad+9+TaZSl8S+OulxyzX1ybajWtI17erWTyEeJIwfg
 tfhHP+kWxLO66zI2plfaSfA0c0+voFxbAQD6R4i7sfLts2kNae/9PX07IhvyYj/U2dla
 F15hs9fxPeUj15vgF7wCu2UZrb2pJqD7BQogxum7AsBFmKDYm4pxdQ9E4rYR1+/5NMmK
 K25g==
X-Gm-Message-State: AOAM5301u97TSG2fMIshqBFuWTOWx3BaqwucoLI+xwJvKgS2c6ffJ+Mk
 EutNm3en58R5VpxlhUizUpm4jWjdeiDmvX58wIo=
X-Google-Smtp-Source: ABdhPJx8m++592/7jOeOjKwbpWqCnQXCFYegDVTkjfLC3umw/45ChrDJ7JUU2KiPV7DSMa6Ey9rVMi+ytX8h8FVXoMk=
X-Received: by 2002:ac2:455c:: with SMTP id j28mr1530509lfm.320.1603978661669; 
 Thu, 29 Oct 2020 06:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <20201028174406.23424-1-alex.bennee@linaro.org>
 <alpine.DEB.2.21.2010281406080.12247@sstabellini-ThinkPad-T480s>
 <87d011mjuw.fsf@linaro.org>
In-Reply-To: <87d011mjuw.fsf@linaro.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 29 Oct 2020 09:37:29 -0400
Message-ID: <CAKf6xpsYorMRYpuPcb8B1zVWz3GHgZZwF+NPVA=nFL2Tr13hqQ@mail.gmail.com>
Subject: Re: [PATCH] meson.build: fix building of Xen support for aarch64
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::144;
 envelope-from=jandryuk@gmail.com; helo=mail-lf1-x144.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Masami Hiramatsu <masami.hiramatsu@linaro.org>, Paul Durrant <paul@xen.org>,
 QEMU <qemu-devel@nongnu.org>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 29, 2020 at 6:01 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Stefano Stabellini <sstabellini@kernel.org> writes:
>
> > On Wed, 28 Oct 2020, Alex Benn=C3=A9e wrote:
> >> Xen is supported on aarch64 although weirdly using the i386-softmmu
> >> model. Checking based on the host CPU meant we never enabled Xen
> >> support. It would be nice to enable CONFIG_XEN for aarch64-softmmu to
> >> make it not seem weird but that will require further build surgery.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Cc: Masami Hiramatsu <masami.hiramatsu@linaro.org>
> >> Cc: Stefano Stabellini <sstabellini@kernel.org>
> >> Cc: Anthony Perard <anthony.perard@citrix.com>
> >> Cc: Paul Durrant <paul@xen.org>
> >> Fixes: 8a19980e3f ("configure: move accelerator logic to meson")
> >> ---
> >>  meson.build | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meson.build b/meson.build
> >> index 835424999d..f1fcbfed4c 100644
> >> --- a/meson.build
> >> +++ b/meson.build
> >> @@ -81,6 +81,8 @@ if cpu in ['x86', 'x86_64']
> >>      'CONFIG_HVF': ['x86_64-softmmu'],
> >>      'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
> >>    }
> >> +elif cpu in [ 'arm', 'aarch64' ]
> >> +  accelerator_targets +=3D { 'CONFIG_XEN': ['i386-softmmu'] }
> >>  endif
> >
> > This looks very reasonable -- the patch makes sense.

A comment would be useful to explain that Arm needs i386-softmmu for
the xenpv machine.

> >
> > However I have two questions, mostly for my own understanding. I tried
> > to repro the aarch64 build problem but it works at my end, even without
> > this patch.
>
> Building on a x86 host or with cross compiler?
>
> > I wonder why. I suspect it works thanks to these lines in
> > meson.build:

I think it's a runtime and not a build problem.  In osstest, Xen
support was detected and configured, but CONFIG_XEN wasn't set for
Arm.  So at runtime xen_available() returns 0, and QEMU doesn't start
with "qemu-system-i386: -xen-domid 1: Option not supported for this
target"

I posted my investigation here:
https://lore.kernel.org/xen-devel/CAKf6xpss8KpGOvZrKiTPz63bhBVbjxRTYWdHEkzU=
o2q1KEMjhg@mail.gmail.com/

Regards,
Jason

