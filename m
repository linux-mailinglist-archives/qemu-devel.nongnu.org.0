Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D466A9D56
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:21:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY95E-0006R2-U8; Fri, 03 Mar 2023 12:20:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pY959-0006OG-Ev
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:20:35 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hshan@google.com>) id 1pY955-0003kq-O2
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:20:34 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 m20-20020a17090ab79400b00239d8e182efso6797118pjr.5
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1677864030;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+s8oMC7rxEi9RAEClItVXuO1ZBxLTjIXe2WffRy/C30=;
 b=WvEinUz5weStUBx17B+T1aIDEeNmljC6vfjfky0Djb8abOwOVlvaL1AwqV+9ZFGiC+
 FdQLY+2/gvULgidSv+KdQiJAgZ2Ucw1LFkW3xmlB2zBkF8k07yYDIJBYzjdhBN3I4NEC
 U/PiEB20jysbPjyWUAU9LdGgWeieqVXdUlZclT50WxnhwTBpU084X7FrQdLqo21puMnv
 JwMCnPZtg0lKonk2xr7QmYQ+rB7m/g26i5KvwpoHaMI8m4JeV8tpNBzac98b0XnxOTtQ
 tAA5w7EwPno7JwATkj4CmZ3ZsZeF4/fZSujDOnKq9f+f02CBAZp3B4ukaOlt/FIS9zUc
 jIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677864030;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+s8oMC7rxEi9RAEClItVXuO1ZBxLTjIXe2WffRy/C30=;
 b=DhYDMzSyDXGlCnEG5rJNp4HXKmKnNPhY1fq64bGw6BznIkk49CymIryC+9RjLGLpqP
 3v59H9KPyt13mhsqbVY9Cn6xFQDi6fFA/Bu77pxdM/E+vzeQ01AQtYIZk3Kv3lahr/2K
 H15gwjOkbaoVptRXtSK2jQjHjhL1o3uSlL52JB2byxCdraWH0ZHxklLaAvbW5Bv4qy90
 EFqOKmYKhIlJ5wix0Z3xJu7vtSsU5vsnRq1eLhNeFGwn9DNAzAf2j0jS9ec0psydlsdY
 dFtmeyh+TJzvwI56kcPWPUFBSQV5pSth0cpbXoHWoOufwcA6u8/fLBRpU/kesml6C6Ji
 zVKA==
X-Gm-Message-State: AO0yUKXZXFSWxK2brfsyDKIzjlNDmhIlJLM3xbxrEh84CROpwjx84quY
 rDDV/Ui/FQzr50Fj9Q+0xCkVSl47ui3KiPwqfLRFEw==
X-Google-Smtp-Source: AK7set9MDZvsRG8cyP9mvGU/2WCaij9hY11gPGmMnUp80EyzjFvzGuU+mB6NTg0VIdn7T20U1nUuleTISxxzU4AW3KY=
X-Received: by 2002:a17:903:3303:b0:19e:287b:6e16 with SMTP id
 jk3-20020a170903330300b0019e287b6e16mr1036432plb.2.1677864029887; Fri, 03 Mar
 2023 09:20:29 -0800 (PST)
MIME-Version: 1.0
References: <20230303022618.4098825-1-hshan@google.com>
 <20230303023013-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230303023013-mutt-send-email-mst@kernel.org>
From: Haitao Shan <hshan@google.com>
Date: Fri, 3 Mar 2023 09:20:18 -0800
Message-ID: <CAGD3tSyhjOx7vNUqatOVZKZjq+5bweskRT+v9nDFG1Fw7QD6YQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] Add the Android Emulator hypervisor driver (AEHD)
 accelerator.
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=hshan@google.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 2, 2023 at 11:33=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Thu, Mar 02, 2023 at 06:26:12PM -0800, Haitao Shan wrote:
> > Add the configure support for the Android Emulator hypervisor driver
> > accelerator. The Android Emulator hypervisor driver is a Windows
> > driver made by porting the KVM from kernel 4.9-rc7.
> >
> > Signed-off-by: Haitao Shan <hshan@google.com>
>
> Replying on patch 1 but it applies to the whole patchset.
>
> There's obvious duplication with kvm here - probably not surprising.
>
> I'd be interested to hear from KVM people to know whether
> there's interest in unifying code, or they would rather
> not bother supporting this platform and it's better off
> being kept separate.
Thanks for the reply.

When I first started working on the new
hypervisor (I am also the author of the hypervisor itself), I
tried to make it "unified" with the KVM. But I soon gave up.
One of the reasons is type "long or unsigned long". It is used
everywhere by the KVM (or perhaps the kernel itself) to
represent memory addresses. But the Microsoft compiler
does not think "long =3D=3D 64bit integer" targeting 64bit Windows.
I could not think of a way to change it beautifully and make
AEHD ready for periodically rebasing to the latest KVM.

Since being fully compatible with KVM was not a goal
any more, I also gave up support of some of KVM legacies.
For example, those related to enlightened guests be it
KVM or HyperV enlightenment. The userspace can
assume certain capabilities without checking, for example,
in kernel irqchip.

Currently, the decision for the AEHD is to clone once
and go seperated with KVM.

With that said, it was still possible to share codes in
the user space code with KVM. But I was afraid
whether the qemu KVM part could see this as a burden
if I tried to hack the KVM user space to support AEHD.
Anyway, KVM keeps revolving. There might be more
and more conditioned code branches simply to make
AEHD happy, should the user space code be "unified".

>
> > ---
> >  accel/Kconfig                  |  3 +++
> >  docs/about/build-platforms.rst |  2 +-
> >  include/exec/poison.h          |  1 +
> >  meson.build                    | 16 ++++++++++++++++
> >  meson_options.txt              |  2 ++
> >  qemu-options.hx                | 20 ++++++++++----------
> >  scripts/meson-buildoptions.sh  |  2 ++
> >  7 files changed, 35 insertions(+), 11 deletions(-)
> >
> > diff --git a/accel/Kconfig b/accel/Kconfig
> > index 8bdedb7d15..187d8f6acf 100644
> > --- a/accel/Kconfig
> > +++ b/accel/Kconfig
> > @@ -16,6 +16,9 @@ config TCG
> >  config KVM
> >      bool
> >
> > +config AEHD
> > +    bool
> > +
> >  config XEN
> >      bool
> >      select FSDEV_9P if VIRTFS
> > diff --git a/docs/about/build-platforms.rst b/docs/about/build-platform=
s.rst
> > index 20b97c3310..184707bd62 100644
> > --- a/docs/about/build-platforms.rst
> > +++ b/docs/about/build-platforms.rst
> > @@ -52,7 +52,7 @@ Those hosts are officially supported, with various ac=
celerators:
> >     * - SPARC
> >       - tcg
> >     * - x86
> > -     - hax, hvf (64 bit only), kvm, nvmm, tcg, whpx (64 bit only), xen
> > +     - aehd (64 bit only), hax, hvf (64 bit only), kvm, nvmm, tcg, whp=
x (64 bit only), xen
> >
> >  Other host architectures are not supported. It is possible to build QE=
MU system
> >  emulation on an unsupported host architecture using the configure
> > diff --git a/include/exec/poison.h b/include/exec/poison.h
> > index 140daa4a85..cb851744d1 100644
> > --- a/include/exec/poison.h
> > +++ b/include/exec/poison.h
> > @@ -86,6 +86,7 @@
> >  #pragma GCC poison CONFIG_HVF
> >  #pragma GCC poison CONFIG_LINUX_USER
> >  #pragma GCC poison CONFIG_KVM
> > +#pragma GCC poison CONFIG_AEHD
> >  #pragma GCC poison CONFIG_SOFTMMU
> >  #pragma GCC poison CONFIG_WHPX
> >  #pragma GCC poison CONFIG_XEN
> > diff --git a/meson.build b/meson.build
> > index 77d2ae87e4..f2b049ceac 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -146,6 +146,11 @@ if cpu in ['x86', 'x86_64']
> >      'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
> >    }
> >  endif
> > +if cpu in ['x86_64']
> > +  accelerator_targets +=3D {
> > +    'CONFIG_AEHD': ['i386-softmmu', 'x86_64-softmmu'],
> > +  }
> > +endif
> >
> >  modular_tcg =3D []
> >  # Darwin does not support references to thread-local variables in modu=
les
> > @@ -421,6 +426,13 @@ accelerators =3D []
> >  if get_option('kvm').allowed() and targetos =3D=3D 'linux'
> >    accelerators +=3D 'CONFIG_KVM'
> >  endif
> > +if get_option('aehd').allowed() and targetos =3D=3D 'windows'
> > +  if get_option('aehd').enabled() and host_machine.cpu() !=3D 'x86_64'
> > +    error('AEHD requires 64-bit host')
> > +  else
> > +    accelerators +=3D 'CONFIG_AEHD'
> > +  endif
> > +endif
> >  if get_option('whpx').allowed() and targetos =3D=3D 'windows'
> >    if get_option('whpx').enabled() and host_machine.cpu() !=3D 'x86_64'
> >      error('WHPX requires 64-bit host')
> > @@ -482,6 +494,9 @@ endif
> >  if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()
> >    error('KVM not available on this platform')
> >  endif
> > +if 'CONFIG_AEHD' not in accelerators and get_option('aehd').enabled()
> > +  error('AEHD not available on this platform')
> > +endif
> >  if 'CONFIG_HVF' not in accelerators and get_option('hvf').enabled()
> >    error('HVF not available on this platform')
> >  endif
> > @@ -3873,6 +3888,7 @@ endif
> >  summary_info =3D {}
> >  if have_system
> >    summary_info +=3D {'KVM support':       config_all.has_key('CONFIG_K=
VM')}
> > +  summary_info +=3D {'AEHD support':      config_all.has_key('CONFIG_A=
EHD')}
> >    summary_info +=3D {'HAX support':       config_all.has_key('CONFIG_H=
AX')}
> >    summary_info +=3D {'HVF support':       config_all.has_key('CONFIG_H=
VF')}
> >    summary_info +=3D {'WHPX support':      config_all.has_key('CONFIG_W=
HPX')}
> > diff --git a/meson_options.txt b/meson_options.txt
> > index fc9447d267..d3e9805b6d 100644
> > --- a/meson_options.txt
> > +++ b/meson_options.txt
> > @@ -66,6 +66,8 @@ option('malloc', type : 'combo', choices : ['system',=
 'tcmalloc', 'jemalloc'],
> >
> >  option('kvm', type: 'feature', value: 'auto',
> >         description: 'KVM acceleration support')
> > +option('aehd', type: 'feature', value: 'auto',
> > +       description: 'AEHD acceleration support')
> >  option('hax', type: 'feature', value: 'auto',
> >         description: 'HAX acceleration support')
> >  option('whpx', type: 'feature', value: 'auto',
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index beeb4475ba..2870c54a43 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -26,7 +26,7 @@ DEF("machine", HAS_ARG, QEMU_OPTION_machine, \
> >      "-machine [type=3D]name[,prop[=3Dvalue][,...]]\n"
> >      "                selects emulated machine ('-machine help' for lis=
t)\n"
> >      "                property accel=3Daccel1[:accel2[:...]] selects ac=
celerator\n"
> > -    "                supported accelerators are kvm, xen, hax, hvf, nv=
mm, whpx or tcg (default: tcg)\n"
> > +    "                supported accelerators are kvm, xen, hax, hvf, nv=
mm, whpx, aehd or tcg (default: tcg)\n"
> >      "                vmport=3Don|off|auto controls emulation of vmport=
 (default: auto)\n"
> >      "                dump-guest-core=3Don|off include guest memory in =
a core dump (default=3Don)\n"
> >      "                mem-merge=3Don|off controls memory merge support =
(default: on)\n"
> > @@ -59,10 +59,10 @@ SRST
> >
> >      ``accel=3Daccels1[:accels2[:...]]``
> >          This is used to enable an accelerator. Depending on the target
> > -        architecture, kvm, xen, hax, hvf, nvmm, whpx or tcg can be ava=
ilable.
> > -        By default, tcg is used. If there is more than one accelerator
> > -        specified, the next one is used if the previous one fails to
> > -        initialize.
> > +        architecture, kvm, xen, hax, hvf, nvmm, whpx, aehd or tcg can =
be
> > +        available. By default, tcg is used. If there is more than one
> > +        accelerator specified, the next one is used if the previous on=
e
> > +        fails to initialize.
> >
> >      ``vmport=3Don|off|auto``
> >          Enables emulation of VMWare IO port, for vmmouse etc. auto say=
s
> > @@ -178,7 +178,7 @@ ERST
> >
> >  DEF("accel", HAS_ARG, QEMU_OPTION_accel,
> >      "-accel [accel=3D]accelerator[,prop[=3Dvalue][,...]]\n"
> > -    "                select accelerator (kvm, xen, hax, hvf, nvmm, whp=
x or tcg; use 'help' for a list)\n"
> > +    "                select accelerator (kvm, xen, hax, hvf, nvmm, whp=
x, aehd or tcg; use 'help' for a list)\n"
> >      "                igd-passthru=3Don|off (enable Xen integrated Inte=
l graphics passthrough, default=3Doff)\n"
> >      "                kernel-irqchip=3Don|off|split controls accelerate=
d irqchip support (default=3Don)\n"
> >      "                kvm-shadow-mem=3Dsize of KVM shadow MMU in bytes\=
n"
> > @@ -190,10 +190,10 @@ DEF("accel", HAS_ARG, QEMU_OPTION_accel,
> >  SRST
> >  ``-accel name[,prop=3Dvalue[,...]]``
> >      This is used to enable an accelerator. Depending on the target
> > -    architecture, kvm, xen, hax, hvf, nvmm, whpx or tcg can be availab=
le. By
> > -    default, tcg is used. If there is more than one accelerator
> > -    specified, the next one is used if the previous one fails to
> > -    initialize.
> > +    architecture, kvm, xen, hax, hvf, nvmm, whpx, aehd or tcg can be
> > +    available. By default, tcg is used. If there is more than one
> > +    accelerator specified, the next one is used if the previous one
> > +    fails to initialize.
> >
> >      ``igd-passthru=3Don|off``
> >          When Xen is in use, this option controls whether Intel
> > diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions=
.sh
> > index 009fab1515..f17df07c5d 100644
> > --- a/scripts/meson-buildoptions.sh
> > +++ b/scripts/meson-buildoptions.sh
> > @@ -289,6 +289,8 @@ _meson_option_parse() {
> >      --disable-guest-agent) printf "%s" -Dguest_agent=3Ddisabled ;;
> >      --enable-guest-agent-msi) printf "%s" -Dguest_agent_msi=3Denabled =
;;
> >      --disable-guest-agent-msi) printf "%s" -Dguest_agent_msi=3Ddisable=
d ;;
> > +    --enable-aehd) printf "%s" -Daehd=3Denabled ;;
> > +    --disable-aehd) printf "%s" -Daehd=3Ddisabled ;;
> >      --enable-hax) printf "%s" -Dhax=3Denabled ;;
> >      --disable-hax) printf "%s" -Dhax=3Ddisabled ;;
> >      --enable-hexagon-idef-parser) printf "%s" -Dhexagon_idef_parser=3D=
true ;;
> > --
> > 2.40.0.rc0.216.gc4246ad0f0-goog
> >
> >
> >
>


--=20
Haitao @Google

