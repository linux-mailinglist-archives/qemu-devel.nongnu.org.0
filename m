Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE5A649A08
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 09:33:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4eEx-0001Uv-MI; Mon, 12 Dec 2022 03:32:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4eEv-0001Ul-Gp
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:32:45 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4eEr-0004Bq-Un
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:32:45 -0500
Received: by mail-lf1-x12e.google.com with SMTP id p36so17300761lfa.12
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 00:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qmD434PoWWUCyMApGHimm7B1upQ03h3+/mt8IjCnHZ4=;
 b=Q2Hje7HLsyV47ZuNKcbx6T4h7V3mQ1Q5Nqln3qtSW1N7NFIzfXHifjpPIRuCP5QXp2
 wWAZVOE3Ilrlclu/W1Yp8I0xTmaBg8DKx7do+gFolinpHbla5GrBlQw670+LsKL0z/Ax
 4kqH0As8yMFZj+g2+WNk4oa5vuz1ca33qpXKEIVocvqYy/rQM4hiN0vfkz2K2xCvuUav
 r7cJKE5ufaT1snCIRrq1jCFEH+zP9ddeo2XX08X5Ur422jvgBFTHyNPNMpcwG/trm9Z7
 IWygSRAOUT8h0exevfAlXQ02YgLPTJs7Pcj0npmc/Nf2kPWjrXnzbVILbwrHbm13+Wph
 xDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qmD434PoWWUCyMApGHimm7B1upQ03h3+/mt8IjCnHZ4=;
 b=hDDluRrxCKES7zrJNMBMhRRQriqQWvy3vvfmTgqf8Zj9hHDlLqLyFvBkmkXFb90qpI
 taF1UZl6R0D4+M4JQxVq5h4AHluMRgISoFlBKu7wkuVjE9F+cG/ff+bWhpIeT1eBEDUm
 GV+GOPHiYvjAGmCJxNNO8vNF1MwR08/KBvgmXdg6Jb+p6YxVzkdzTSdLYbab8a9MqRrI
 Clo8XK1GXkgViAWhH/hZR7k6/1vcf3vFFjObPfZ826jv5bmXWbs7l+QUH8z1kD8QgIzX
 9bXcja2TZt+HZA0mYEd+eJL2N+WNP4hDlH9XwkjnHHpJw25bXJYc95P09m/hdb8vu+Id
 HeUA==
X-Gm-Message-State: ANoB5pmh2XtWO0eyT/HNu3SYPlSorp+eY0tiX5nw9dk5BDO9Mb/thgh/
 8k5FpMX+Jmi/OpLFeFhdqRFPHmfheYIjdvlz380LyoEZn88=
X-Google-Smtp-Source: AA0mqf7R7CtvOInufRSo4QKKpRW7bDLAzPuhLVwTGpoLllcPp8Sys7G8aN1ba5SVYLtt4YPmXogxeP8D46fA4sNhHk0=
X-Received: by 2002:a19:f016:0:b0:4b5:886b:d4af with SMTP id
 p22-20020a19f016000000b004b5886bd4afmr5005951lfc.276.1670833959956; Mon, 12
 Dec 2022 00:32:39 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-11-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-11-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 12:32:27 +0400
Message-ID: <CAJ+F1CKmqvTZsamU3jU=Um39GkSF73sVVK-OcJkSXxu-2L=R8w@mail.gmail.com>
Subject: Re: [PATCH 10/30] meson: remove static_kwargs
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x12e.google.com
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

On Fri, Dec 9, 2022 at 3:31 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> After static_kwargs has been changed to an empty dictionary, it has
> no functional effect and can be removed.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  meson.build     | 212 +++++++++++++++++++-----------------------------
>  tcg/meson.build |   2 +-
>  2 files changed, 84 insertions(+), 130 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index dced840bfbee..9ccbe0f6e4ee 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -18,7 +18,6 @@ sh =3D find_program('sh')
>  cc =3D meson.get_compiler('c')
>  config_host =3D keyval.load(meson.current_build_dir() / 'config-host.mak=
')
>  enable_modules =3D 'CONFIG_MODULES' in config_host
> -static_kwargs =3D {}
>
>  # Temporary directory used for files created while
>  # configure runs. Since it is in the build directory
> @@ -510,7 +509,7 @@ gdbus_codegen =3D not_found
>  gdbus_codegen_error =3D '@0@ requires gdbus-codegen, please install libg=
io'
>  if not get_option('gio').auto() or have_system
>    gio =3D dependency('gio-2.0', required: get_option('gio'),
> -                   method: 'pkg-config', kwargs: static_kwargs)
> +                   method: 'pkg-config')
>    if gio.found() and not cc.links('''
>      #include <gio/gio.h>
>      int main(void)
> @@ -527,7 +526,7 @@ if not get_option('gio').auto() or have_system
>      gdbus_codegen =3D find_program(gio.get_variable('gdbus_codegen'),
>                                   required: get_option('gio'))
>      gio_unix =3D dependency('gio-unix-2.0', required: get_option('gio'),
> -                          method: 'pkg-config', kwargs: static_kwargs)
> +                          method: 'pkg-config')
>      gio =3D declare_dependency(dependencies: [gio, gio_unix],
>                               version: gio.version())
>    endif
> @@ -540,20 +539,19 @@ endif
>  lttng =3D not_found
>  if 'ust' in get_option('trace_backends')
>    lttng =3D dependency('lttng-ust', required: true, version: '>=3D 2.1',
> -                     method: 'pkg-config', kwargs: static_kwargs)
> +                     method: 'pkg-config')
>  endif
>  pixman =3D not_found
>  if have_system or have_tools
>    pixman =3D dependency('pixman-1', required: have_system, version:'>=3D=
0.21.8',
> -                      method: 'pkg-config', kwargs: static_kwargs)
> +                      method: 'pkg-config')
>  endif
> -zlib =3D dependency('zlib', required: true, kwargs: static_kwargs)
> +zlib =3D dependency('zlib', required: true)
>
>  libaio =3D not_found
>  if not get_option('linux_aio').auto() or have_block
>    libaio =3D cc.find_library('aio', has_headers: ['libaio.h'],
> -                           required: get_option('linux_aio'),
> -                           kwargs: static_kwargs)
> +                           required: get_option('linux_aio'))
>  endif
>
>  linux_io_uring_test =3D '''
> @@ -566,7 +564,7 @@ linux_io_uring =3D not_found
>  if not get_option('linux_io_uring').auto() or have_block
>    linux_io_uring =3D dependency('liburing', version: '>=3D0.3',
>                                required: get_option('linux_io_uring'),
> -                              method: 'pkg-config', kwargs: static_kwarg=
s)
> +                              method: 'pkg-config')
>    if not cc.links(linux_io_uring_test)
>      linux_io_uring =3D not_found
>    endif
> @@ -576,7 +574,7 @@ libnfs =3D not_found
>  if not get_option('libnfs').auto() or have_block
>    libnfs =3D dependency('libnfs', version: '>=3D1.9.3',
>                        required: get_option('libnfs'),
> -                      method: 'pkg-config', kwargs: static_kwargs)
> +                      method: 'pkg-config')
>  endif
>
>  libattr_test =3D '''
> @@ -596,8 +594,7 @@ if get_option('attr').allowed()
>      libattr =3D declare_dependency()
>    else
>      libattr =3D cc.find_library('attr', has_headers: ['attr/xattr.h'],
> -                              required: get_option('attr'),
> -                              kwargs: static_kwargs)
> +                              required: get_option('attr'))
>      if libattr.found() and not \
>        cc.links(libattr_test, dependencies: libattr, args: '-DCONFIG_LIBA=
TTR')
>        libattr =3D not_found
> @@ -632,7 +629,7 @@ seccomp_has_sysrawrc =3D false
>  if not get_option('seccomp').auto() or have_system or have_tools
>    seccomp =3D dependency('libseccomp', version: '>=3D2.3.0',
>                         required: get_option('seccomp'),
> -                       method: 'pkg-config', kwargs: static_kwargs)
> +                       method: 'pkg-config')
>    if seccomp.found()
>      seccomp_has_sysrawrc =3D cc.has_header_symbol('seccomp.h',
>                                                  'SCMP_FLTATR_API_SYSRAWR=
C',
> @@ -643,8 +640,7 @@ endif
>  libcap_ng =3D not_found
>  if not get_option('cap_ng').auto() or have_system or have_tools
>    libcap_ng =3D cc.find_library('cap-ng', has_headers: ['cap-ng.h'],
> -                              required: get_option('cap_ng'),
> -                              kwargs: static_kwargs)
> +                              required: get_option('cap_ng'))
>  endif
>  if libcap_ng.found() and not cc.links('''
>     #include <cap-ng.h>
> @@ -665,13 +661,13 @@ if get_option('xkbcommon').auto() and not have_syst=
em and not have_tools
>    xkbcommon =3D not_found
>  else
>    xkbcommon =3D dependency('xkbcommon', required: get_option('xkbcommon'=
),
> -                         method: 'pkg-config', kwargs: static_kwargs)
> +                         method: 'pkg-config')
>  endif
>
>  slirp =3D not_found
>  if not get_option('slirp').auto() or have_system
>    slirp =3D dependency('slirp', required: get_option('slirp'),
> -                     method: 'pkg-config', kwargs: static_kwargs)
> +                     method: 'pkg-config')
>    # slirp < 4.7 is incompatible with CFI support in QEMU.  This is becau=
se
>    # it passes function pointers within libslirp as callbacks for timers.
>    # When using a system-wide shared libslirp, the type information for t=
he
> @@ -691,8 +687,7 @@ endif
>  vde =3D not_found
>  if not get_option('vde').auto() or have_system or have_tools
>    vde =3D cc.find_library('vdeplug', has_headers: ['libvdeplug.h'],
> -                           required: get_option('vde'),
> -                           kwargs: static_kwargs)
> +                           required: get_option('vde'))
>  endif
>  if vde.found() and not cc.links('''
>     #include <libvdeplug.h>
> @@ -714,35 +709,35 @@ endif
>  pulse =3D not_found
>  if not get_option('pa').auto() or (targetos =3D=3D 'linux' and have_syst=
em)
>    pulse =3D dependency('libpulse', required: get_option('pa'),
> -                     method: 'pkg-config', kwargs: static_kwargs)
> +                     method: 'pkg-config')
>  endif
>  alsa =3D not_found
>  if not get_option('alsa').auto() or (targetos =3D=3D 'linux' and have_sy=
stem)
>    alsa =3D dependency('alsa', required: get_option('alsa'),
> -                    method: 'pkg-config', kwargs: static_kwargs)
> +                    method: 'pkg-config')
>  endif
>  jack =3D not_found
>  if not get_option('jack').auto() or have_system
>    jack =3D dependency('jack', required: get_option('jack'),
> -                    method: 'pkg-config', kwargs: static_kwargs)
> +                    method: 'pkg-config')
>  endif
>  sndio =3D not_found
>  if not get_option('sndio').auto() or have_system
>    sndio =3D dependency('sndio', required: get_option('sndio'),
> -                    method: 'pkg-config', kwargs: static_kwargs)
> +                    method: 'pkg-config')
>  endif
>
>  spice_protocol =3D not_found
>  if not get_option('spice_protocol').auto() or have_system
>    spice_protocol =3D dependency('spice-protocol', version: '>=3D0.12.3',
>                                required: get_option('spice_protocol'),
> -                              method: 'pkg-config', kwargs: static_kwarg=
s)
> +                              method: 'pkg-config')
>  endif
>  spice =3D not_found
>  if not get_option('spice').auto() or have_system
>    spice =3D dependency('spice-server', version: '>=3D0.12.5',
>                       required: get_option('spice'),
> -                     method: 'pkg-config', kwargs: static_kwargs)
> +                     method: 'pkg-config')
>  endif
>  spice_headers =3D spice.partial_dependency(compile_args: true, includes:=
 true)
>
> @@ -752,13 +747,13 @@ libiscsi =3D not_found
>  if not get_option('libiscsi').auto() or have_block
>    libiscsi =3D dependency('libiscsi', version: '>=3D1.9.0',
>                           required: get_option('libiscsi'),
> -                         method: 'pkg-config', kwargs: static_kwargs)
> +                         method: 'pkg-config')
>  endif
>  zstd =3D not_found
>  if not get_option('zstd').auto() or have_block
>    zstd =3D dependency('libzstd', version: '>=3D1.4.0',
>                      required: get_option('zstd'),
> -                    method: 'pkg-config', kwargs: static_kwargs)
> +                    method: 'pkg-config')
>  endif
>  virgl =3D not_found
>
> @@ -766,29 +761,25 @@ have_vhost_user_gpu =3D have_tools and targetos =3D=
=3D 'linux' and pixman.found()
>  if not get_option('virglrenderer').auto() or have_system or have_vhost_u=
ser_gpu
>    virgl =3D dependency('virglrenderer',
>                       method: 'pkg-config',
> -                     required: get_option('virglrenderer'),
> -                     kwargs: static_kwargs)
> +                     required: get_option('virglrenderer'))
>  endif
>  blkio =3D not_found
>  if not get_option('blkio').auto() or have_block
>    blkio =3D dependency('blkio',
>                       method: 'pkg-config',
> -                     required: get_option('blkio'),
> -                     kwargs: static_kwargs)
> +                     required: get_option('blkio'))
>  endif
>  curl =3D not_found
>  if not get_option('curl').auto() or have_block
>    curl =3D dependency('libcurl', version: '>=3D7.29.0',
>                      method: 'pkg-config',
> -                    required: get_option('curl'),
> -                    kwargs: static_kwargs)
> +                    required: get_option('curl'))
>  endif
>  libudev =3D not_found
>  if targetos =3D=3D 'linux' and (have_system or have_tools)
>    libudev =3D dependency('libudev',
>                         method: 'pkg-config',
> -                       required: get_option('libudev'),
> -                       kwargs: static_kwargs)
> +                       required: get_option('libudev'))
>  endif
>
>  mpathlibs =3D [libudev]
> @@ -823,18 +814,15 @@ if targetos =3D=3D 'linux' and have_tools and get_o=
ption('mpath').allowed()
>            return 0;
>        }'''
>    libmpathpersist =3D cc.find_library('mpathpersist',
> -                                    required: get_option('mpath'),
> -                                    kwargs: static_kwargs)
> +                                    required: get_option('mpath'))
>    if libmpathpersist.found()
>      mpathlibs +=3D libmpathpersist
>      if get_option('prefer_static')
>        mpathlibs +=3D cc.find_library('devmapper',
> -                                     required: get_option('mpath'),
> -                                     kwargs: static_kwargs)
> +                                     required: get_option('mpath'))
>      endif
>      mpathlibs +=3D cc.find_library('multipath',
> -                                 required: get_option('mpath'),
> -                                 kwargs: static_kwargs)
> +                                 required: get_option('mpath'))
>      foreach lib: mpathlibs
>        if not lib.found()
>          mpathlibs =3D []
> @@ -884,8 +872,7 @@ if have_system and get_option('curses').allowed()
>    curses_dep_list =3D targetos =3D=3D 'windows' ? ['ncurses', 'ncursesw'=
] : ['ncursesw']
>    curses =3D dependency(curses_dep_list,
>                        required: false,
> -                      method: 'pkg-config',
> -                      kwargs: static_kwargs)
> +                      method: 'pkg-config')
>    msg =3D get_option('curses').enabled() ? 'curses library not found' : =
''
>    curses_compile_args =3D ['-DNCURSES_WIDECHAR=3D1']
>    if curses.found()
> @@ -907,8 +894,7 @@ if have_system and get_option('curses').allowed()
>        curses_libname_list =3D (targetos =3D=3D 'windows' ? ['pdcurses'] =
: ['ncursesw', 'cursesw'])
>        foreach curses_libname : curses_libname_list
>          libcurses =3D cc.find_library(curses_libname,
> -                                    required: false,
> -                                    kwargs: static_kwargs)
> +                                    required: false)
>          if libcurses.found()
>            if cc.links(curses_test, args: curses_compile_args, dependenci=
es: libcurses)
>              curses =3D declare_dependency(compile_args: curses_compile_a=
rgs,
> @@ -958,8 +944,7 @@ endif
>  brlapi =3D not_found
>  if not get_option('brlapi').auto() or have_system
>    brlapi =3D cc.find_library('brlapi', has_headers: ['brlapi.h'],
> -                         required: get_option('brlapi'),
> -                         kwargs: static_kwargs)
> +                         required: get_option('brlapi'))
>    if brlapi.found() and not cc.links('''
>       #include <brlapi.h>
>       #include <stddef.h>
> @@ -975,7 +960,7 @@ endif
>
>  sdl =3D not_found
>  if not get_option('sdl').auto() or have_system
> -  sdl =3D dependency('sdl2', required: get_option('sdl'), kwargs: static=
_kwargs)
> +  sdl =3D dependency('sdl2', required: get_option('sdl'))
>    sdl_image =3D not_found
>  endif
>  if sdl.found()
> @@ -983,7 +968,7 @@ if sdl.found()
>    sdl =3D declare_dependency(compile_args: '-Wno-undef',
>                             dependencies: sdl)
>    sdl_image =3D dependency('SDL2_image', required: get_option('sdl_image=
'),
> -                         method: 'pkg-config', kwargs: static_kwargs)
> +                         method: 'pkg-config')
>  else
>    if get_option('sdl_image').enabled()
>      error('sdl-image required, but SDL was @0@'.format(
> @@ -994,11 +979,9 @@ endif
>
>  rbd =3D not_found
>  if not get_option('rbd').auto() or have_block
> -  librados =3D cc.find_library('rados', required: get_option('rbd'),
> -                             kwargs: static_kwargs)
> +  librados =3D cc.find_library('rados', required: get_option('rbd'))
>    librbd =3D cc.find_library('rbd', has_headers: ['rbd/librbd.h'],
> -                           required: get_option('rbd'),
> -                           kwargs: static_kwargs)
> +                           required: get_option('rbd'))
>    if librados.found() and librbd.found()
>      if cc.links('''
>        #include <stdio.h>
> @@ -1026,7 +1009,7 @@ glusterfs_iocb_has_stat =3D false
>  if not get_option('glusterfs').auto() or have_block
>    glusterfs =3D dependency('glusterfs-api', version: '>=3D3',
>                           required: get_option('glusterfs'),
> -                         method: 'pkg-config', kwargs: static_kwargs)
> +                         method: 'pkg-config')
>    if glusterfs.found()
>      glusterfs_ftruncate_has_stat =3D cc.links('''
>        #include <glusterfs/api/glfs.h>
> @@ -1061,15 +1044,13 @@ libssh =3D not_found
>  if not get_option('libssh').auto() or have_block
>    libssh =3D dependency('libssh', version: '>=3D0.8.7',
>                      method: 'pkg-config',
> -                    required: get_option('libssh'),
> -                    kwargs: static_kwargs)
> +                    required: get_option('libssh'))
>  endif
>
>  libbzip2 =3D not_found
>  if not get_option('bzip2').auto() or have_block
>    libbzip2 =3D cc.find_library('bz2', has_headers: ['bzlib.h'],
> -                             required: get_option('bzip2'),
> -                             kwargs: static_kwargs)
> +                             required: get_option('bzip2'))
>    if libbzip2.found() and not cc.links('''
>       #include <bzlib.h>
>       int main(void) { BZ2_bzlibVersion(); return 0; }''', dependencies: =
libbzip2)
> @@ -1085,8 +1066,7 @@ endif
>  liblzfse =3D not_found
>  if not get_option('lzfse').auto() or have_block
>    liblzfse =3D cc.find_library('lzfse', has_headers: ['lzfse.h'],
> -                             required: get_option('lzfse'),
> -                             kwargs: static_kwargs)
> +                             required: get_option('lzfse'))
>  endif
>  if liblzfse.found() and not cc.links('''
>     #include <lzfse.h>
> @@ -1104,8 +1084,7 @@ if get_option('oss').allowed() and have_system
>    if not cc.has_header('sys/soundcard.h')
>      # not found
>    elif targetos =3D=3D 'netbsd'
> -    oss =3D cc.find_library('ossaudio', required: get_option('oss'),
> -                          kwargs: static_kwargs)
> +    oss =3D cc.find_library('ossaudio', required: get_option('oss'))
>    else
>      oss =3D declare_dependency()
>    endif
> @@ -1138,7 +1117,7 @@ endif
>  opengl =3D not_found
>  if not get_option('opengl').auto() or have_system or have_vhost_user_gpu
>    epoxy =3D dependency('epoxy', method: 'pkg-config',
> -                      required: get_option('opengl'), kwargs: static_kwa=
rgs)
> +                      required: get_option('opengl'))
>    if cc.has_header('epoxy/egl.h', dependencies: epoxy)
>      opengl =3D epoxy
>    elif get_option('opengl').enabled()
> @@ -1147,8 +1126,7 @@ if not get_option('opengl').auto() or have_system o=
r have_vhost_user_gpu
>  endif
>  gbm =3D not_found
>  if (have_system or have_tools) and (virgl.found() or opengl.found())
> -  gbm =3D dependency('gbm', method: 'pkg-config', required: false,
> -                   kwargs: static_kwargs)
> +  gbm =3D dependency('gbm', method: 'pkg-config', required: false)
>  endif
>  have_vhost_user_gpu =3D have_vhost_user_gpu and virgl.found() and opengl=
.found() and gbm.found()
>
> @@ -1170,16 +1148,14 @@ if get_option('gnutls').enabled() or (get_option(=
'gnutls').auto() and have_syste
>    # the platform support requirements
>    gnutls_crypto =3D dependency('gnutls', version: '>=3D3.6.14',
>                               method: 'pkg-config',
> -                             required: false,
> -                             kwargs: static_kwargs)
> +                             required: false)
>    if gnutls_crypto.found()
>      gnutls =3D gnutls_crypto
>    else
>      # Our min version if all we need is TLS
>      gnutls =3D dependency('gnutls', version: '>=3D3.5.18',
>                          method: 'pkg-config',
> -                        required: get_option('gnutls'),
> -                        kwargs: static_kwargs)
> +                        required: get_option('gnutls'))
>    endif
>  endif
>
> @@ -1206,34 +1182,31 @@ if not gnutls_crypto.found()
>    if (not get_option('gcrypt').auto() or have_system) and not get_option=
('nettle').enabled()
>      gcrypt =3D dependency('libgcrypt', version: '>=3D1.8',
>                          method: 'config-tool',
> -                        required: get_option('gcrypt'),
> -                        kwargs: static_kwargs)
> +                        required: get_option('gcrypt'))
>      # Debian has removed -lgpg-error from libgcrypt-config
>      # as it "spreads unnecessary dependencies" which in
>      # turn breaks static builds...
>      if gcrypt.found() and get_option('prefer_static')
>        gcrypt =3D declare_dependency(dependencies: [
>          gcrypt,
> -        cc.find_library('gpg-error', required: true, kwargs: static_kwar=
gs)])
> +        cc.find_library('gpg-error', required: true)])
>      endif
>    endif
>    if (not get_option('nettle').auto() or have_system) and not gcrypt.fou=
nd()
>      nettle =3D dependency('nettle', version: '>=3D3.4',
>                          method: 'pkg-config',
> -                        required: get_option('nettle'),
> -                        kwargs: static_kwargs)
> +                        required: get_option('nettle'))
>      if nettle.found() and not cc.has_header('nettle/xts.h', dependencies=
: nettle)
>        xts =3D 'private'
>      endif
>    endif
>  endif
>
> -gmp =3D dependency('gmp', required: false, method: 'pkg-config', kwargs:=
 static_kwargs)
> +gmp =3D dependency('gmp', required: false, method: 'pkg-config')
>  if nettle.found() and gmp.found()
>    hogweed =3D dependency('hogweed', version: '>=3D3.4',
>                         method: 'pkg-config',
> -                       required: get_option('nettle'),
> -                       kwargs: static_kwargs)
> +                       required: get_option('nettle'))
>  endif
>
>
> @@ -1245,20 +1218,17 @@ have_gtk_clipboard =3D get_option('gtk_clipboard'=
).enabled()
>  if not get_option('gtk').auto() or have_system
>    gtk =3D dependency('gtk+-3.0', version: '>=3D3.22.0',
>                     method: 'pkg-config',
> -                   required: get_option('gtk'),
> -                   kwargs: static_kwargs)
> +                   required: get_option('gtk'))
>    if gtk.found()
>      gtkx11 =3D dependency('gtk+-x11-3.0', version: '>=3D3.22.0',
>                          method: 'pkg-config',
> -                        required: false,
> -                        kwargs: static_kwargs)
> +                        required: false)
>      gtk =3D declare_dependency(dependencies: [gtk, gtkx11])
>
>      if not get_option('vte').auto() or have_system
>        vte =3D dependency('vte-2.91',
>                         method: 'pkg-config',
> -                       required: get_option('vte'),
> -                       kwargs: static_kwargs)
> +                       required: get_option('vte'))
>      endif
>    elif have_gtk_clipboard
>      error('GTK clipboard requested, but GTK not found')
> @@ -1267,13 +1237,12 @@ endif
>
>  x11 =3D not_found
>  if gtkx11.found()
> -  x11 =3D dependency('x11', method: 'pkg-config', required: gtkx11.found=
(),
> -                   kwargs: static_kwargs)
> +  x11 =3D dependency('x11', method: 'pkg-config', required: gtkx11.found=
())
>  endif
>  png =3D not_found
>  if get_option('png').allowed() and have_system
>     png =3D dependency('libpng', version: '>=3D1.6.34', required: get_opt=
ion('png'),
> -                    method: 'pkg-config', kwargs: static_kwargs)
> +                    method: 'pkg-config')
>  endif
>  vnc =3D not_found
>  jpeg =3D not_found
> @@ -1281,10 +1250,9 @@ sasl =3D not_found
>  if get_option('vnc').allowed() and have_system
>    vnc =3D declare_dependency() # dummy dependency
>    jpeg =3D dependency('libjpeg', required: get_option('vnc_jpeg'),
> -                    method: 'pkg-config', kwargs: static_kwargs)
> +                    method: 'pkg-config')
>    sasl =3D cc.find_library('sasl2', has_headers: ['sasl/sasl.h'],
> -                         required: get_option('vnc_sasl'),
> -                         kwargs: static_kwargs)
> +                         required: get_option('vnc_sasl'))
>    if sasl.found()
>      sasl =3D declare_dependency(dependencies: sasl,
>                                compile_args: '-DSTRUCT_IOVEC_DEFINED')
> @@ -1294,8 +1262,7 @@ endif
>  pam =3D not_found
>  if not get_option('auth_pam').auto() or have_system
>    pam =3D cc.find_library('pam', has_headers: ['security/pam_appl.h'],
> -                        required: get_option('auth_pam'),
> -                        kwargs: static_kwargs)
> +                        required: get_option('auth_pam'))
>  endif
>  if pam.found() and not cc.links('''
>     #include <stddef.h>
> @@ -1319,8 +1286,7 @@ endif
>  snappy =3D not_found
>  if not get_option('snappy').auto() or have_system
>    snappy =3D cc.find_library('snappy', has_headers: ['snappy-c.h'],
> -                           required: get_option('snappy'),
> -                           kwargs: static_kwargs)
> +                           required: get_option('snappy'))
>  endif
>  if snappy.found() and not linker.links('''
>     #include <snappy-c.h>
> @@ -1336,8 +1302,7 @@ endif
>  lzo =3D not_found
>  if not get_option('lzo').auto() or have_system
>    lzo =3D cc.find_library('lzo2', has_headers: ['lzo/lzo1x.h'],
> -                        required: get_option('lzo'),
> -                        kwargs: static_kwargs)
> +                        required: get_option('lzo'))
>  endif
>  if lzo.found() and not cc.links('''
>     #include <lzo/lzo1x.h>
> @@ -1353,8 +1318,7 @@ endif
>  numa =3D not_found
>  if not get_option('numa').auto() or have_system or have_tools
>    numa =3D cc.find_library('numa', has_headers: ['numa.h'],
> -                              required: get_option('numa'),
> -                              kwargs: static_kwargs)
> +                              required: get_option('numa'))
>  endif
>  if numa.found() and not cc.links('''
>     #include <numa.h>
> @@ -1372,10 +1336,8 @@ rdma =3D not_found
>  if not get_option('rdma').auto() or have_system
>    libumad =3D cc.find_library('ibumad', required: get_option('rdma'))
>    rdma_libs =3D [cc.find_library('rdmacm', has_headers: ['rdma/rdma_cma.=
h'],
> -                               required: get_option('rdma'),
> -                               kwargs: static_kwargs),
> -               cc.find_library('ibverbs', required: get_option('rdma'),
> -                               kwargs: static_kwargs),
> +                               required: get_option('rdma')),
> +               cc.find_library('ibverbs', required: get_option('rdma')),
>                 libumad]
>    rdma =3D declare_dependency(dependencies: rdma_libs)
>    foreach lib: rdma_libs
> @@ -1388,30 +1350,30 @@ endif
>  xen =3D not_found
>  if get_option('xen').enabled() or (get_option('xen').auto() and have_sys=
tem)
>    xencontrol =3D dependency('xencontrol', required: false,
> -                          method: 'pkg-config', kwargs: static_kwargs)
> +                          method: 'pkg-config')
>    if xencontrol.found()
>      xen_pc =3D declare_dependency(version: xencontrol.version(),
>        dependencies: [
>          xencontrol,
>          # disabler: true makes xen_pc.found() return false if any is not=
 found
>          dependency('xenstore', required: false,
> -                   method: 'pkg-config', kwargs: static_kwargs,
> +                   method: 'pkg-config',
>                     disabler: true),
>          dependency('xenforeignmemory', required: false,
> -                   method: 'pkg-config', kwargs: static_kwargs,
> +                   method: 'pkg-config',
>                     disabler: true),
>          dependency('xengnttab', required: false,
> -                   method: 'pkg-config', kwargs: static_kwargs,
> +                   method: 'pkg-config',
>                     disabler: true),
>          dependency('xenevtchn', required: false,
> -                   method: 'pkg-config', kwargs: static_kwargs,
> +                   method: 'pkg-config',
>                     disabler: true),
>          dependency('xendevicemodel', required: false,
> -                   method: 'pkg-config', kwargs: static_kwargs,
> +                   method: 'pkg-config',
>                     disabler: true),
>          # optional, no "disabler: true"
>          dependency('xentoolcore', required: false,
> -                   method: 'pkg-config', kwargs: static_kwargs)])
> +                   method: 'pkg-config')])
>      if xen_pc.found()
>        xen =3D xen_pc
>      endif
> @@ -1469,60 +1431,53 @@ have_xen_pci_passthrough =3D get_option('xen_pci_=
passthrough') \
>  cacard =3D not_found
>  if not get_option('smartcard').auto() or have_system
>    cacard =3D dependency('libcacard', required: get_option('smartcard'),
> -                      version: '>=3D2.5.1', method: 'pkg-config',
> -                      kwargs: static_kwargs)
> +                      version: '>=3D2.5.1', method: 'pkg-config')
>  endif
>  u2f =3D not_found
>  if have_system
>    u2f =3D dependency('u2f-emu', required: get_option('u2f'),
> -                   method: 'pkg-config',
> -                   kwargs: static_kwargs)
> +                   method: 'pkg-config')
>  endif
>  canokey =3D not_found
>  if have_system
>    canokey =3D dependency('canokey-qemu', required: get_option('canokey')=
,
> -                   method: 'pkg-config',
> -                   kwargs: static_kwargs)
> +                   method: 'pkg-config')
>  endif
>  usbredir =3D not_found
>  if not get_option('usb_redir').auto() or have_system
>    usbredir =3D dependency('libusbredirparser-0.5', required: get_option(=
'usb_redir'),
> -                        version: '>=3D0.6', method: 'pkg-config',
> -                        kwargs: static_kwargs)
> +                        version: '>=3D0.6', method: 'pkg-config')
>  endif
>  libusb =3D not_found
>  if not get_option('libusb').auto() or have_system
>    libusb =3D dependency('libusb-1.0', required: get_option('libusb'),
> -                      version: '>=3D1.0.13', method: 'pkg-config',
> -                      kwargs: static_kwargs)
> +                      version: '>=3D1.0.13', method: 'pkg-config')
>  endif
>
>  libpmem =3D not_found
>  if not get_option('libpmem').auto() or have_system
>    libpmem =3D dependency('libpmem', required: get_option('libpmem'),
> -                       method: 'pkg-config', kwargs: static_kwargs)
> +                       method: 'pkg-config')
>  endif
>  libdaxctl =3D not_found
>  if not get_option('libdaxctl').auto() or have_system
>    libdaxctl =3D dependency('libdaxctl', required: get_option('libdaxctl'=
),
> -                         version: '>=3D57', method: 'pkg-config',
> -                         kwargs: static_kwargs)
> +                         version: '>=3D57', method: 'pkg-config')
>  endif
>  tasn1 =3D not_found
>  if gnutls.found()
>    tasn1 =3D dependency('libtasn1',
> -                     method: 'pkg-config',
> -                     kwargs: static_kwargs)
> +                     method: 'pkg-config')
>  endif
>  keyutils =3D dependency('libkeyutils', required: false,
> -                      method: 'pkg-config', kwargs: static_kwargs)
> +                      method: 'pkg-config')
>
>  has_gettid =3D cc.has_function('gettid')
>
>  # libselinux
>  selinux =3D dependency('libselinux',
>                       required: get_option('selinux'),
> -                     method: 'pkg-config', kwargs: static_kwargs)
> +                     method: 'pkg-config')
>
>  # Malloc tests
>
> @@ -1586,8 +1541,7 @@ if get_option('fuse').disabled() and get_option('fu=
se_lseek').enabled()
>  endif
>
>  fuse =3D dependency('fuse3', required: get_option('fuse'),
> -                  version: '>=3D3.1', method: 'pkg-config',
> -                  kwargs: static_kwargs)
> +                  version: '>=3D3.1', method: 'pkg-config')
>
>  fuse_lseek =3D not_found
>  if get_option('fuse_lseek').allowed()
> @@ -2677,7 +2631,7 @@ genh +=3D custom_target('config-poison.h',
>  capstone =3D not_found
>  if not get_option('capstone').auto() or have_system or have_user
>    capstone =3D dependency('capstone', version: '>=3D3.0.5',
> -                        kwargs: static_kwargs, method: 'pkg-config',
> +                        method: 'pkg-config',
>                          required: get_option('capstone'))
>
>    # Some versions of capstone have broken pkg-config file
> @@ -2713,7 +2667,7 @@ if have_system
>    fdt_opt =3D get_option('fdt')
>    if fdt_opt in ['enabled', 'auto', 'system']
>      have_internal =3D fs.exists(meson.current_source_dir() / 'dtc/libfdt=
/Makefile.libfdt')
> -    fdt =3D cc.find_library('fdt', kwargs: static_kwargs,
> +    fdt =3D cc.find_library('fdt',
>                            required: fdt_opt =3D=3D 'system' or
>                                      fdt_opt =3D=3D 'enabled' and not hav=
e_internal)
>      if fdt.found() and cc.links('''
> diff --git a/tcg/meson.build b/tcg/meson.build
> index c4c63b19d4ed..3db551bb3485 100644
> --- a/tcg/meson.build
> +++ b/tcg/meson.build
> @@ -12,7 +12,7 @@ tcg_ss.add(files(
>
>  if get_option('tcg_interpreter')
>    libffi =3D dependency('libffi', version: '>=3D3.0', required: true,
> -                      method: 'pkg-config', kwargs: static_kwargs)
> +                      method: 'pkg-config')
>    specific_ss.add(libffi)
>    specific_ss.add(files('tci.c'))
>  endif
> --
> 2.38.1
>
>


--=20
Marc-Andr=C3=A9 Lureau

