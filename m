Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F99425E39
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:55:34 +0200 (CEST)
Received: from localhost ([::1]:34890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYaQP-0003Ke-N3
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDp-00065q-NG
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:34 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mYaDl-0006MT-5T
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 16:42:32 -0400
Received: by mail-wr1-x433.google.com with SMTP id o20so22822228wro.3
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 13:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nHf7Y5iVxi9UnoRhM+Pu0d5DMc2Loa9DdNeKa0FnvaM=;
 b=FsoY6qVFNB5PO619oz2EPRJfLO22dwyoqAl0G8N3/UwkeeC03mDcWFbwgZqW086G9x
 9qzUBfQ1kzWVG48cdhhk/SAceWMtV4Ms9v41nbdOv9A3br5N6TuhqKdTWgUnHOF18q5B
 MfMjLCCzgEoIdeXyVei6ihUES+xCw8Yxy6v1WSNFc5+p8xDQWFJgPdrKcbrhTqoEb0Bz
 q1z5l3XDzW8EELp5CHGo/SZi6syYjIjXbZk7kkLjN+mQotTtUyUCpUh8NPdLsC206LdI
 NSyDaCc9+dlLGBrTHbOYEHJ4zhr1tK5th3P9ovzUVJvJVNH6jD1iYFOSStjMj8DNpDFc
 IoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nHf7Y5iVxi9UnoRhM+Pu0d5DMc2Loa9DdNeKa0FnvaM=;
 b=ePVR7rpVYibOytha/LdpvgANtrRCvxpgy0oCyis3d+qvUeO5MFCanfaoD1HZeR5SCe
 Mm9wX/Ggyc07+lKiQRTsbAKRO/UFhnRpM+7om/yP+VsImAWc7uQbwwPqNeNHauKjSo2e
 QF2QyeVAyQk5GtwrEOtR8M+9I+imrIoZicqBwJ0pgNDLy4Qk4TMuDecECjIrjTUgJSjY
 dlOMZZElcKVfQy/jjQciKSSRrlaUJnB5TaFH1Wo4GTlCUhmfZQPzkMS6t9EolKtd5sfB
 AtoXvZMY99g2UuSphR0JFXMlvUg73D/H5zqB3EWLeJGKFRLfJWfMYKQ4nw0tcK5YY0Qp
 tnRg==
X-Gm-Message-State: AOAM532LoEtoR8r+rm/J5od4M0rlxy+YWb0aA6ZkYd+hBn2LyEIily0j
 B8DSqJNKof6PAE/pEWSbsE6Cd/ewDu6rrzNIUFyEpqQu
X-Google-Smtp-Source: ABdhPJw33Lhz/ry71uGbwZtQmwSUm7Vn+KMyN7uBAQW3+XHi3kG6aqSmEIh16jS95vkWE4BIuUs5oJyfPJeQIZZcg5A=
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr7259012wmh.140.1633639347849; 
 Thu, 07 Oct 2021 13:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211007130630.632028-1-pbonzini@redhat.com>
 <20211007130630.632028-4-pbonzini@redhat.com>
In-Reply-To: <20211007130630.632028-4-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 8 Oct 2021 00:42:13 +0400
Message-ID: <CAJ+F1CKQYCTRcyFpHCsuJ3qy3iHbQY0=sg8_c_ZxpGm5XawJfA@mail.gmail.com>
Subject: Re: [PATCH 03/24] configure,
 meson: move audio driver detection to Meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000050fc105cdc94d8b"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>,
 QEMU <qemu-devel@nongnu.org>, Gerd Hoffman <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000050fc105cdc94d8b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 7, 2021 at 5:07 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> This brings a change that makes audio drivers more similar to all
> other modules.  All drivers are built by default, while
> --audio-drv-list only governs the default choice of the audio driver.
>
> Meson options are added to disable the drivers, and the next patches
> will fix the help messages and command line options, and especially
> make the non-default drivers available via -audiodev.
>
> Cc: Gerd Hoffman <kraxel@redhat.com>
> Cc: Volker R=C3=BCmelin <vr_qemu@t-online.de>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

tricky.. but lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  audio/meson.build |  23 +++---
>  configure         | 184 +---------------------------------------------
>  meson.build       | 137 +++++++++++++++++++++++++++++-----
>  meson_options.txt |  18 ++++-
>  4 files changed, 147 insertions(+), 215 deletions(-)
>
> diff --git a/audio/meson.build b/audio/meson.build
> index 9a95c58f18..462533bb8c 100644
> --- a/audio/meson.build
> +++ b/audio/meson.build
> @@ -7,23 +7,22 @@ softmmu_ss.add(files(
>    'wavcapture.c',
>  ))
>
> -softmmu_ss.add(when: [coreaudio, 'CONFIG_AUDIO_COREAUDIO'], if_true:
> files('coreaudio.c'))
> -softmmu_ss.add(when: [dsound, 'CONFIG_AUDIO_DSOUND'],
> -               if_true: files('dsoundaudio.c', 'audio_win_int.c'))
> +softmmu_ss.add(when: coreaudio, if_true: files('coreaudio.c'))
> +softmmu_ss.add(when: dsound, if_true: files('dsoundaudio.c',
> 'audio_win_int.c'))
>
>  audio_modules =3D {}
>  foreach m : [
> -  ['CONFIG_AUDIO_ALSA', 'alsa', alsa, 'alsaaudio.c'],
> -  ['CONFIG_AUDIO_OSS', 'oss', oss, 'ossaudio.c'],
> -  ['CONFIG_AUDIO_PA', 'pa', pulse, 'paaudio.c'],
> -  ['CONFIG_AUDIO_SDL', 'sdl', sdl, 'sdlaudio.c'],
> -  ['CONFIG_AUDIO_JACK', 'jack', jack, 'jackaudio.c'],
> -  ['CONFIG_SPICE', 'spice', spice, 'spiceaudio.c']
> +  ['alsa', alsa, files('alsaaudio.c')],
> +  ['oss', oss, files('ossaudio.c')],
> +  ['pa', pulse, files('paaudio.c')],
> +  ['sdl', sdl, files('sdlaudio.c')],
> +  ['jack', jack, files('jackaudio.c')],
> +  ['spice', spice, files('spiceaudio.c')]
>  ]
> -  if config_host.has_key(m[0])
> +  if m[1].found()
>      module_ss =3D ss.source_set()
> -    module_ss.add(when: m[2], if_true: files(m[3]))
> -    audio_modules +=3D {m[1] : module_ss}
> +    module_ss.add(m[1], m[2])
> +    audio_modules +=3D {m[0] : module_ss}
>    endif
>  endforeach
>
> diff --git a/configure b/configure
> index 6a6273ce7b..fcadcf9577 100755
> --- a/configure
> +++ b/configure
> @@ -240,7 +240,7 @@ interp_prefix=3D"/usr/gnemul/qemu-%M"
>  static=3D"no"
>  cross_compile=3D"no"
>  cross_prefix=3D""
> -audio_drv_list=3D""
> +audio_drv_list=3D"default"
>  block_drv_rw_whitelist=3D""
>  block_drv_ro_whitelist=3D""
>  block_drv_whitelist_tools=3D"no"
> @@ -299,7 +299,6 @@ fdt=3D"auto"
>  netmap=3D"no"
>  sdl=3D"auto"
>  sdl_image=3D"auto"
> -coreaudio=3D"auto"
>  virtiofsd=3D"auto"
>  virtfs=3D"auto"
>  libudev=3D"auto"
> @@ -356,7 +355,6 @@ module_upgrades=3D"no"
>  prefix=3D"/usr/local"
>  qemu_suffix=3D"qemu"
>  slirp=3D"auto"
> -oss_lib=3D""
>  bsd=3D"no"
>  linux=3D"no"
>  solaris=3D"no"
> @@ -703,54 +701,35 @@ fi
>  case $targetos in
>  MINGW32*)
>    mingw32=3D"yes"
> -  audio_possible_drivers=3D"dsound sdl"
> -  if check_include dsound.h; then
> -    audio_drv_list=3D"dsound"
> -  else
> -    audio_drv_list=3D""
> -  fi
>    supported_os=3D"yes"
>    plugins=3D"no"
>    pie=3D"no"
>  ;;
>  GNU/kFreeBSD)
>    bsd=3D"yes"
> -  audio_drv_list=3D"oss try-sdl"
> -  audio_possible_drivers=3D"oss sdl pa"
>  ;;
>  FreeBSD)
>    bsd=3D"yes"
>    bsd_user=3D"yes"
>    make=3D"${MAKE-gmake}"
> -  audio_drv_list=3D"oss try-sdl"
> -  audio_possible_drivers=3D"oss sdl pa"
>    # needed for kinfo_getvmmap(3) in libutil.h
>    netmap=3D""  # enable netmap autodetect
>  ;;
>  DragonFly)
>    bsd=3D"yes"
>    make=3D"${MAKE-gmake}"
> -  audio_drv_list=3D"oss try-sdl"
> -  audio_possible_drivers=3D"oss sdl pa"
>  ;;
>  NetBSD)
>    bsd=3D"yes"
>    make=3D"${MAKE-gmake}"
> -  audio_drv_list=3D"oss try-sdl"
> -  audio_possible_drivers=3D"oss sdl"
> -  oss_lib=3D"-lossaudio"
>  ;;
>  OpenBSD)
>    bsd=3D"yes"
>    make=3D"${MAKE-gmake}"
> -  audio_drv_list=3D"try-sdl"
> -  audio_possible_drivers=3D"sdl"
>  ;;
>  Darwin)
>    bsd=3D"yes"
>    darwin=3D"yes"
> -  audio_drv_list=3D"try-coreaudio try-sdl"
> -  audio_possible_drivers=3D"coreaudio sdl"
>    # Disable attempts to use ObjectiveC features in os/object.h since the=
y
>    # won't work when we're compiling with gcc as a C compiler.
>    QEMU_CFLAGS=3D"-DOS_OBJECT_USE_OBJC=3D0 $QEMU_CFLAGS"
> @@ -759,10 +738,6 @@ SunOS)
>    solaris=3D"yes"
>    make=3D"${MAKE-gmake}"
>    smbd=3D"${SMBD-/usr/sfw/sbin/smbd}"
> -  if test -f /usr/include/sys/soundcard.h ; then
> -    audio_drv_list=3D"oss try-sdl"
> -  fi
> -  audio_possible_drivers=3D"oss sdl"
>  # needed for CMSG_ macros in sys/socket.h
>    QEMU_CFLAGS=3D"-D_XOPEN_SOURCE=3D600 $QEMU_CFLAGS"
>  # needed for TIOCWIN* defines in termios.h
> @@ -774,8 +749,6 @@ Haiku)
>    QEMU_CFLAGS=3D"-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -fPIC
> $QEMU_CFLAGS"
>  ;;
>  Linux)
> -  audio_drv_list=3D"try-pa oss"
> -  audio_possible_drivers=3D"oss alsa sdl pa"
>    linux=3D"yes"
>    linux_user=3D"yes"
>    vhost_user=3D${default_feature:-yes}
> @@ -1795,7 +1768,6 @@ Advanced options (experts only):
>    --disable-werror         disable compilation abort on warning
>    --disable-stack-protector disable compiler-provided stack protection
>    --audio-drv-list=3DLIST    set audio drivers list:
> -                           Available drivers: $audio_possible_drivers
>    --block-drv-whitelist=3DL  Same as --block-drv-rw-whitelist=3DL
>    --block-drv-rw-whitelist=3DL
>                             set block driver read-write whitelist
> @@ -2398,12 +2370,6 @@ if test -z "$want_tools"; then
>      fi
>  fi
>
> -##########################################
> -# Disable features only meaningful for system-mode emulation
> -if test "$softmmu" =3D "no"; then
> -    audio_drv_list=3D""
> -fi
> -
>  ##########################################
>  # L2TPV3 probe
>
> @@ -2982,130 +2948,6 @@ EOF
>    fi
>  fi
>
> -##########################################
> -# detect CoreAudio
> -if test "$coreaudio" !=3D "no" ; then
> -  coreaudio_libs=3D"-framework CoreAudio"
> -  cat > $TMPC << EOF
> -#include <CoreAudio/CoreAudio.h>
> -int main(void)
> -{
> -  return (int)AudioGetCurrentHostTime();
> -}
> -EOF
> -  if compile_prog "" "$coreaudio_libs" ; then
> -    coreaudio=3Dyes
> -  else
> -    coreaudio=3Dno
> -  fi
> -fi
> -
> -##########################################
> -# Sound support libraries probe
> -
> -audio_drv_list=3D$(echo "$audio_drv_list" | sed -e 's/,/ /g')
> -for drv in $audio_drv_list; do
> -    case $drv in
> -    alsa | try-alsa)
> -    if $pkg_config alsa --exists; then
> -        alsa_libs=3D$($pkg_config alsa --libs)
> -        alsa_cflags=3D$($pkg_config alsa --cflags)
> -        alsa=3Dyes
> -        if test "$drv" =3D "try-alsa"; then
> -            audio_drv_list=3D$(echo "$audio_drv_list" | sed -e
> 's/try-alsa/alsa/')
> -        fi
> -    else
> -        if test "$drv" =3D "try-alsa"; then
> -            audio_drv_list=3D$(echo "$audio_drv_list" | sed -e
> 's/try-alsa//')
> -        else
> -            error_exit "$drv check failed" \
> -                "Make sure to have the $drv libs and headers installed."
> -        fi
> -    fi
> -    ;;
> -
> -    pa | try-pa)
> -    if $pkg_config libpulse --exists; then
> -        libpulse=3Dyes
> -        pulse_libs=3D$($pkg_config libpulse --libs)
> -        pulse_cflags=3D$($pkg_config libpulse --cflags)
> -        if test "$drv" =3D "try-pa"; then
> -            audio_drv_list=3D$(echo "$audio_drv_list" | sed -e
> 's/try-pa/pa/')
> -        fi
> -    else
> -        if test "$drv" =3D "try-pa"; then
> -            audio_drv_list=3D$(echo "$audio_drv_list" | sed -e 's/try-pa=
//')
> -        else
> -            error_exit "$drv check failed" \
> -                "Make sure to have the $drv libs and headers installed."
> -        fi
> -    fi
> -    ;;
> -
> -    sdl)
> -    if test "$sdl" =3D "no"; then
> -        error_exit "sdl not found or disabled, can not use sdl audio
> driver"
> -    fi
> -    ;;
> -
> -    try-sdl)
> -    if test "$sdl" =3D "no"; then
> -        audio_drv_list=3D$(echo "$audio_drv_list" | sed -e 's/try-sdl//'=
)
> -    else
> -        audio_drv_list=3D$(echo "$audio_drv_list" | sed -e 's/try-sdl/sd=
l/')
> -    fi
> -    ;;
> -
> -    coreaudio | try-coreaudio)
> -    if test "$coreaudio" =3D "no"; then
> -      if test "$drv" =3D "try-coreaudio"; then
> -        audio_drv_list=3D$(echo "$audio_drv_list" | sed -e
> 's/try-coreaudio//')
> -      else
> -        error_exit "$drv check failed" \
> -                "Make sure to have the $drv is available."
> -      fi
> -    else
> -      coreaudio_libs=3D"-framework CoreAudio"
> -      if test "$drv" =3D "try-coreaudio"; then
> -        audio_drv_list=3D$(echo "$audio_drv_list" | sed -e
> 's/try-coreaudio/coreaudio/')
> -      fi
> -    fi
> -    ;;
> -
> -    dsound)
> -      dsound_libs=3D"-lole32 -ldxguid"
> -    ;;
> -
> -    oss)
> -      oss_libs=3D"$oss_lib"
> -    ;;
> -
> -    jack | try-jack)
> -    if $pkg_config jack --exists; then
> -        libjack=3Dyes
> -        jack_libs=3D$($pkg_config jack --libs)
> -        if test "$drv" =3D "try-jack"; then
> -            audio_drv_list=3D$(echo "$audio_drv_list" | sed -e
> 's/try-jack/jack/')
> -        fi
> -    else
> -        if test "$drv" =3D "try-jack"; then
> -            audio_drv_list=3D$(echo "$audio_drv_list" | sed -e
> 's/try-jack//')
> -        else
> -            error_exit "$drv check failed" \
> -                "Make sure to have the $drv libs and headers installed."
> -        fi
> -    fi
> -    ;;
> -
> -    *)
> -    echo "$audio_possible_drivers" | grep -q "\<$drv\>" || {
> -        error_exit "Unknown driver '$drv' selected" \
> -            "Possible drivers are: $audio_possible_drivers"
> -    }
> -    ;;
> -    esac
> -done
> -
>  ##########################################
>  # plugin linker support probe
>
> @@ -4536,28 +4378,6 @@ fi
>  if test "$gprof" =3D "yes" ; then
>    echo "CONFIG_GPROF=3Dy" >> $config_host_mak
>  fi
> -echo "CONFIG_AUDIO_DRIVERS=3D$audio_drv_list" >> $config_host_mak
> -for drv in $audio_drv_list; do
> -    def=3DCONFIG_AUDIO_$(echo $drv | LC_ALL=3DC tr '[a-z]' '[A-Z]')
> -    echo "$def=3Dy" >> $config_host_mak
> -done
> -if test "$alsa" =3D "yes" ; then
> -    echo "CONFIG_ALSA=3Dy" >> $config_host_mak
> -fi
> -echo "ALSA_LIBS=3D$alsa_libs" >> $config_host_mak
> -echo "ALSA_CFLAGS=3D$alsa_cflags" >> $config_host_mak
> -if test "$libpulse" =3D "yes" ; then
> -    echo "CONFIG_LIBPULSE=3Dy" >> $config_host_mak
> -fi
> -echo "PULSE_LIBS=3D$pulse_libs" >> $config_host_mak
> -echo "PULSE_CFLAGS=3D$pulse_cflags" >> $config_host_mak
> -echo "COREAUDIO_LIBS=3D$coreaudio_libs" >> $config_host_mak
> -echo "DSOUND_LIBS=3D$dsound_libs" >> $config_host_mak
> -echo "OSS_LIBS=3D$oss_libs" >> $config_host_mak
> -if test "$libjack" =3D "yes" ; then
> -    echo "CONFIG_LIBJACK=3Dy" >> $config_host_mak
> -fi
> -echo "JACK_LIBS=3D$jack_libs" >> $config_host_mak
>  echo "CONFIG_BDRV_RW_WHITELIST=3D$block_drv_rw_whitelist" >>
> $config_host_mak
>  echo "CONFIG_BDRV_RO_WHITELIST=3D$block_drv_ro_whitelist" >>
> $config_host_mak
>  if test "$block_drv_whitelist_tools" =3D "yes" ; then
> @@ -5195,7 +5015,7 @@ if test "$skip_meson" =3D no; then
>          -Dvhost_user_blk_server=3D$vhost_user_blk_server
> -Dmultiprocess=3D$multiprocess \
>          -Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek
> -Dguest_agent_msi=3D$guest_agent_msi -Dbpf=3D$bpf\
>          $(if test "$default_feature" =3D no; then echo
> "-Dauto_features=3Ddisabled"; fi) \
> -       -Dtcg_interpreter=3D$tcg_interpreter \
> +        -Daudio_drv_list=3D$audio_drv_list
> -Dtcg_interpreter=3D$tcg_interpreter \
>          $cross_arg \
>          "$PWD" "$source_path"
>
> diff --git a/meson.build b/meson.build
> index 7b596fdcd9..13b725181a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -430,20 +430,23 @@ vde =3D not_found
>  if config_host.has_key('CONFIG_VDE')
>    vde =3D declare_dependency(link_args: config_host['VDE_LIBS'].split())
>  endif
> +
>  pulse =3D not_found
> -if 'CONFIG_LIBPULSE' in config_host
> -  pulse =3D declare_dependency(compile_args:
> config_host['PULSE_CFLAGS'].split(),
> -                             link_args: config_host['PULSE_LIBS'].split(=
))
> +if not get_option('pa').auto() or (targetos =3D=3D 'linux' and have_syst=
em)
> +  pulse =3D dependency('libpulse', required: get_option('pa'),
> +                     method: 'pkg-config', kwargs: static_kwargs)
>  endif
>  alsa =3D not_found
> -if 'CONFIG_ALSA' in config_host
> -  alsa =3D declare_dependency(compile_args:
> config_host['ALSA_CFLAGS'].split(),
> -                            link_args: config_host['ALSA_LIBS'].split())
> +if not get_option('alsa').auto() or (targetos =3D=3D 'linux' and have_sy=
stem)
> +  alsa =3D dependency('alsa', required: get_option('alsa'),
> +                    method: 'pkg-config', kwargs: static_kwargs)
>  endif
>  jack =3D not_found
> -if 'CONFIG_LIBJACK' in config_host
> -  jack =3D declare_dependency(link_args: config_host['JACK_LIBS'].split(=
))
> +if not get_option('jack').auto() or have_system
> +  jack =3D dependency('jack', required: get_option('jack'),
> +                    method: 'pkg-config', kwargs: static_kwargs)
>  endif
> +
>  spice =3D not_found
>  spice_headers =3D not_found
>  spice_protocol =3D not_found
> @@ -803,16 +806,59 @@ if liblzfse.found() and not cc.links('''
>  endif
>
>  oss =3D not_found
> -if 'CONFIG_AUDIO_OSS' in config_host
> -  oss =3D declare_dependency(link_args: config_host['OSS_LIBS'].split())
> +if not get_option('oss').auto() or have_system
> +  if not cc.has_header('sys/soundcard.h')
> +    # not found
> +  elif targetos =3D=3D 'netbsd'
> +    oss =3D cc.find_library('ossaudio', required: get_option('oss'),
> +                          kwargs: static_kwargs)
> +  else
> +    oss =3D declare_dependency()
> +  endif
> +
> +  if not oss.found()
> +    if get_option('oss').enabled()
> +      error('OSS not found')
> +    else
> +      warning('OSS not found, disabling')
> +    endif
> +  endif
>  endif
>  dsound =3D not_found
> -if 'CONFIG_AUDIO_DSOUND' in config_host
> -  dsound =3D declare_dependency(link_args:
> config_host['DSOUND_LIBS'].split())
> +if not get_option('dsound').auto() or (targetos =3D=3D 'windows' and
> have_system)
> +  if cc.has_header('dsound.h')
> +    dsound =3D declare_dependency(link_args: ['-lole32', '-ldxguid'])
> +  endif
> +
> +  if not dsound.found()
> +    if get_option('dsound').enabled()
> +      error('DirectSound not found')
> +    else
> +      warning('DirectSound not found, disabling')
> +    endif
> +  endif
>  endif
> +
>  coreaudio =3D not_found
> -if 'CONFIG_AUDIO_COREAUDIO' in config_host
> -  coreaudio =3D declare_dependency(link_args:
> config_host['COREAUDIO_LIBS'].split())
> +if not get_option('coreaudio').auto() or (targetos =3D=3D 'darwin' and
> have_system)
> +  coreaudio =3D dependency('appleframeworks', modules: 'CoreAudio',
> +                         required: get_option('coreaudio'))
> +  if coreaudio.found() and not cc.links('''
> +    #include <CoreAudio/CoreAudio.h>
> +    int main(void)
> +    {
> +      return (int)AudioGetCurrentHostTime();
> +    }''')
> +    coreaudio =3D not_found
> +  endif
> +
> +  if not coreaudio.found()
> +    if get_option('coreaudio').enabled()
> +      error('CoreAudio not found')
> +    else
> +      warning('CoreAudio not found, disabling')
> +    endif
> +  endif
>  endif
>
>  opengl =3D not_found
> @@ -1158,6 +1204,49 @@ if libbpf.found() and not cc.links('''
>    endif
>  endif
>
> +#################
> +# config-host.h #
> +#################
> +
> +audio_drivers_selected =3D []
> +if have_system
> +  audio_drivers_available =3D {
> +    'alsa': alsa.found(),
> +    'coreaudio': coreaudio.found(),
> +    'dsound': dsound.found(),
> +    'jack': jack.found(),
> +    'oss': oss.found(),
> +    'pa': pulse.found(),
> +    'sdl': sdl.found(),
> +  }
> +
> +  # Default to native drivers first, OSS second, SDL third
> +  audio_drivers_priority =3D \
> +    [ 'pa', 'coreaudio', 'dsound', 'oss' ] + \
> +    (targetos =3D=3D 'linux' ? [] : [ 'sdl' ])
> +  audio_drivers_default =3D []
> +  foreach k: audio_drivers_priority
> +    if audio_drivers_available[k]
> +      audio_drivers_default +=3D k
> +    endif
> +  endforeach
> +
> +  foreach k: get_option('audio_drv_list')
> +    if k =3D=3D 'default'
> +      audio_drivers_selected +=3D audio_drivers_default
> +    elif not audio_drivers_available[k]
> +      error('Audio driver "@0@" not available.'.format(k))
> +    else
> +      audio_drivers_selected +=3D k
> +    endif
> +  endforeach
> +endif
> +foreach k: audio_drivers_selected
> +  config_host_data.set('CONFIG_AUDIO_' + k.to_upper(), true)
> +endforeach
> +config_host_data.set('CONFIG_AUDIO_DRIVERS',
> +                     '"' + '", "'.join(audio_drivers_selected) + '", ')
> +
>  if get_option('cfi')
>    cfi_flags=3D[]
>    # Check for dependency on LTO
> @@ -1201,10 +1290,6 @@ endif
>  have_host_block_device =3D (targetos !=3D 'darwin' or
>      cc.has_header('IOKit/storage/IOMedia.h'))
>
> -#################
> -# config-host.h #
> -#################
> -
>  have_virtfs =3D (targetos =3D=3D 'linux' and
>      have_system and
>      libattr.found() and
> @@ -1449,7 +1534,7 @@ config_host_data.set('HAVE_BROKEN_SIZE_MAX', not
> cc.compiles('''
>
>
>  ignored =3D ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
> -arrays =3D ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST',
> 'CONFIG_BDRV_RO_WHITELIST']
> +arrays =3D ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
>  strings =3D ['HOST_DSOSUF', 'CONFIG_IASL']
>  foreach k, v: config_host
>    if ignored.contains(k)
> @@ -2885,7 +2970,7 @@ if config_host.has_key('CONFIG_MODULES')
>  endif
>  summary_info +=3D {'fuzzing support':   config_host.has_key('CONFIG_FUZZ=
')}
>  if have_system
> -  summary_info +=3D {'Audio drivers':
>  config_host['CONFIG_AUDIO_DRIVERS']}
> +  summary_info +=3D {'Audio drivers':     ' '.join(audio_drivers_selecte=
d)}
>  endif
>  summary_info +=3D {'Trace backends':    config_host['TRACE_BACKENDS']}
>  if config_host['TRACE_BACKENDS'].split().contains('simple')
> @@ -3073,6 +3158,18 @@ if vnc.found()
>    summary_info +=3D {'VNC JPEG support':  jpeg}
>    summary_info +=3D {'VNC PNG support':   png}
>  endif
> +if targetos not in ['darwin', 'haiku', 'windows']
> +  summary_info +=3D {'OSS support':     oss}
> +elif targetos =3D=3D 'darwin'
> +  summary_info +=3D {'CoreAudio support': coreaudio}
> +elif targetos =3D=3D 'windows'
> +  summary_info +=3D {'DirectSound support': dsound}
> +endif
> +if targetos =3D=3D 'linux'
> +  summary_info +=3D {'ALSA support':    alsa}
> +  summary_info +=3D {'PulseAudio support': pulse}
> +endif
> +summary_info +=3D {'JACK support':      jack}
>  summary_info +=3D {'brlapi support':    brlapi}
>  summary_info +=3D {'vde support':       config_host.has_key('CONFIG_VDE'=
)}
>  summary_info +=3D {'netmap support':
> config_host.has_key('CONFIG_NETMAP')}
> diff --git a/meson_options.txt b/meson_options.txt
> index 2c89e79e8b..052c4f088e 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -6,9 +6,12 @@ option('qemu_firmwarepath', type : 'string', value : '',
>         description: 'search PATH for firmware files')
>  option('sphinx_build', type : 'string', value : '',
>         description: 'Use specified sphinx-build [$sphinx_build] for
> building document (default to be empty)')
> -
>  option('default_devices', type : 'boolean', value : true,
>         description: 'Include a default selection of devices in emulators=
')
> +option('audio_drv_list', type: 'array', value: ['default'],
> +       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss'=
,
> 'pa', 'sdl'],
> +       description: 'Set audio driver list')
> +
>  option('docs', type : 'feature', value : 'auto',
>         description: 'Documentations build support')
>  option('gettext', type : 'feature', value : 'auto',
> @@ -139,6 +142,19 @@ option('fuse', type: 'feature', value: 'auto',
>  option('fuse_lseek', type : 'feature', value : 'auto',
>         description: 'SEEK_HOLE/SEEK_DATA support for FUSE exports')
>
> +option('alsa', type: 'feature', value: 'auto',
> +       description: 'ALSA sound support')
> +option('coreaudio', type: 'feature', value: 'auto',
> +       description: 'CoreAudio sound support')
> +option('dsound', type: 'feature', value: 'auto',
> +       description: 'DirectSound sound support')
> +option('jack', type: 'feature', value: 'auto',
> +       description: 'JACK sound support')
> +option('oss', type: 'feature', value: 'auto',
> +       description: 'OSS sound support')
> +option('pa', type: 'feature', value: 'auto',
> +       description: 'PulseAudio sound support')
> +
>  option('vhost_user_blk_server', type: 'feature', value: 'auto',
>         description: 'build vhost-user-blk server')
>  option('virtfs', type: 'feature', value: 'auto',
> --
> 2.31.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000050fc105cdc94d8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 7, 2021 at 5:07 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzi=
ni@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">This brings a change that makes audio drivers more similar to =
all<br>
other modules.=C2=A0 All drivers are built by default, while<br>
--audio-drv-list only governs the default choice of the audio driver.<br>
<br>
Meson options are added to disable the drivers, and the next patches<br>
will fix the help messages and command line options, and especially<br>
make the non-default drivers available via -audiodev.<br>
<br>
Cc: Gerd Hoffman &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank"=
>kraxel@redhat.com</a>&gt;<br>
Cc: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de" target=
=3D"_blank">vr_qemu@t-online.de</a>&gt;<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>tricky.. but lgtm<br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt=
;<a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre=
.lureau@redhat.com</a>&gt;</div><div> <br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
---<br>
=C2=A0audio/meson.build |=C2=A0 23 +++---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 184 +-------------------=
--------------------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 137 +++++++++++++++++++++++++=
++++-----<br>
=C2=A0meson_options.txt |=C2=A0 18 ++++-<br>
=C2=A04 files changed, 147 insertions(+), 215 deletions(-)<br>
<br>
diff --git a/audio/meson.build b/audio/meson.build<br>
index 9a95c58f18..462533bb8c 100644<br>
--- a/audio/meson.build<br>
+++ b/audio/meson.build<br>
@@ -7,23 +7,22 @@ softmmu_ss.add(files(<br>
=C2=A0 =C2=A0&#39;wavcapture.c&#39;,<br>
=C2=A0))<br>
<br>
-softmmu_ss.add(when: [coreaudio, &#39;CONFIG_AUDIO_COREAUDIO&#39;], if_tru=
e: files(&#39;coreaudio.c&#39;))<br>
-softmmu_ss.add(when: [dsound, &#39;CONFIG_AUDIO_DSOUND&#39;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if_true: files(&#39=
;dsoundaudio.c&#39;, &#39;audio_win_int.c&#39;))<br>
+softmmu_ss.add(when: coreaudio, if_true: files(&#39;coreaudio.c&#39;))<br>
+softmmu_ss.add(when: dsound, if_true: files(&#39;dsoundaudio.c&#39;, &#39;=
audio_win_int.c&#39;))<br>
<br>
=C2=A0audio_modules =3D {}<br>
=C2=A0foreach m : [<br>
-=C2=A0 [&#39;CONFIG_AUDIO_ALSA&#39;, &#39;alsa&#39;, alsa, &#39;alsaaudio.=
c&#39;],<br>
-=C2=A0 [&#39;CONFIG_AUDIO_OSS&#39;, &#39;oss&#39;, oss, &#39;ossaudio.c&#3=
9;],<br>
-=C2=A0 [&#39;CONFIG_AUDIO_PA&#39;, &#39;pa&#39;, pulse, &#39;paaudio.c&#39=
;],<br>
-=C2=A0 [&#39;CONFIG_AUDIO_SDL&#39;, &#39;sdl&#39;, sdl, &#39;sdlaudio.c&#3=
9;],<br>
-=C2=A0 [&#39;CONFIG_AUDIO_JACK&#39;, &#39;jack&#39;, jack, &#39;jackaudio.=
c&#39;],<br>
-=C2=A0 [&#39;CONFIG_SPICE&#39;, &#39;spice&#39;, spice, &#39;spiceaudio.c&=
#39;]<br>
+=C2=A0 [&#39;alsa&#39;, alsa, files(&#39;alsaaudio.c&#39;)],<br>
+=C2=A0 [&#39;oss&#39;, oss, files(&#39;ossaudio.c&#39;)],<br>
+=C2=A0 [&#39;pa&#39;, pulse, files(&#39;paaudio.c&#39;)],<br>
+=C2=A0 [&#39;sdl&#39;, sdl, files(&#39;sdlaudio.c&#39;)],<br>
+=C2=A0 [&#39;jack&#39;, jack, files(&#39;jackaudio.c&#39;)],<br>
+=C2=A0 [&#39;spice&#39;, spice, files(&#39;spiceaudio.c&#39;)]<br>
=C2=A0]<br>
-=C2=A0 if config_host.has_key(m[0])<br>
+=C2=A0 if m[1].found()<br>
=C2=A0 =C2=A0 =C2=A0module_ss =3D ss.source_set()<br>
-=C2=A0 =C2=A0 module_ss.add(when: m[2], if_true: files(m[3]))<br>
-=C2=A0 =C2=A0 audio_modules +=3D {m[1] : module_ss}<br>
+=C2=A0 =C2=A0 module_ss.add(m[1], m[2])<br>
+=C2=A0 =C2=A0 audio_modules +=3D {m[0] : module_ss}<br>
=C2=A0 =C2=A0endif<br>
=C2=A0endforeach<br>
<br>
diff --git a/configure b/configure<br>
index 6a6273ce7b..fcadcf9577 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -240,7 +240,7 @@ interp_prefix=3D&quot;/usr/gnemul/qemu-%M&quot;<br>
=C2=A0static=3D&quot;no&quot;<br>
=C2=A0cross_compile=3D&quot;no&quot;<br>
=C2=A0cross_prefix=3D&quot;&quot;<br>
-audio_drv_list=3D&quot;&quot;<br>
+audio_drv_list=3D&quot;default&quot;<br>
=C2=A0block_drv_rw_whitelist=3D&quot;&quot;<br>
=C2=A0block_drv_ro_whitelist=3D&quot;&quot;<br>
=C2=A0block_drv_whitelist_tools=3D&quot;no&quot;<br>
@@ -299,7 +299,6 @@ fdt=3D&quot;auto&quot;<br>
=C2=A0netmap=3D&quot;no&quot;<br>
=C2=A0sdl=3D&quot;auto&quot;<br>
=C2=A0sdl_image=3D&quot;auto&quot;<br>
-coreaudio=3D&quot;auto&quot;<br>
=C2=A0virtiofsd=3D&quot;auto&quot;<br>
=C2=A0virtfs=3D&quot;auto&quot;<br>
=C2=A0libudev=3D&quot;auto&quot;<br>
@@ -356,7 +355,6 @@ module_upgrades=3D&quot;no&quot;<br>
=C2=A0prefix=3D&quot;/usr/local&quot;<br>
=C2=A0qemu_suffix=3D&quot;qemu&quot;<br>
=C2=A0slirp=3D&quot;auto&quot;<br>
-oss_lib=3D&quot;&quot;<br>
=C2=A0bsd=3D&quot;no&quot;<br>
=C2=A0linux=3D&quot;no&quot;<br>
=C2=A0solaris=3D&quot;no&quot;<br>
@@ -703,54 +701,35 @@ fi<br>
=C2=A0case $targetos in<br>
=C2=A0MINGW32*)<br>
=C2=A0 =C2=A0mingw32=3D&quot;yes&quot;<br>
-=C2=A0 audio_possible_drivers=3D&quot;dsound sdl&quot;<br>
-=C2=A0 if check_include dsound.h; then<br>
-=C2=A0 =C2=A0 audio_drv_list=3D&quot;dsound&quot;<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 audio_drv_list=3D&quot;&quot;<br>
-=C2=A0 fi<br>
=C2=A0 =C2=A0supported_os=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0plugins=3D&quot;no&quot;<br>
=C2=A0 =C2=A0pie=3D&quot;no&quot;<br>
=C2=A0;;<br>
=C2=A0GNU/kFreeBSD)<br>
=C2=A0 =C2=A0bsd=3D&quot;yes&quot;<br>
-=C2=A0 audio_drv_list=3D&quot;oss try-sdl&quot;<br>
-=C2=A0 audio_possible_drivers=3D&quot;oss sdl pa&quot;<br>
=C2=A0;;<br>
=C2=A0FreeBSD)<br>
=C2=A0 =C2=A0bsd=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0bsd_user=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0make=3D&quot;${MAKE-gmake}&quot;<br>
-=C2=A0 audio_drv_list=3D&quot;oss try-sdl&quot;<br>
-=C2=A0 audio_possible_drivers=3D&quot;oss sdl pa&quot;<br>
=C2=A0 =C2=A0# needed for kinfo_getvmmap(3) in libutil.h<br>
=C2=A0 =C2=A0netmap=3D&quot;&quot;=C2=A0 # enable netmap autodetect<br>
=C2=A0;;<br>
=C2=A0DragonFly)<br>
=C2=A0 =C2=A0bsd=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0make=3D&quot;${MAKE-gmake}&quot;<br>
-=C2=A0 audio_drv_list=3D&quot;oss try-sdl&quot;<br>
-=C2=A0 audio_possible_drivers=3D&quot;oss sdl pa&quot;<br>
=C2=A0;;<br>
=C2=A0NetBSD)<br>
=C2=A0 =C2=A0bsd=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0make=3D&quot;${MAKE-gmake}&quot;<br>
-=C2=A0 audio_drv_list=3D&quot;oss try-sdl&quot;<br>
-=C2=A0 audio_possible_drivers=3D&quot;oss sdl&quot;<br>
-=C2=A0 oss_lib=3D&quot;-lossaudio&quot;<br>
=C2=A0;;<br>
=C2=A0OpenBSD)<br>
=C2=A0 =C2=A0bsd=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0make=3D&quot;${MAKE-gmake}&quot;<br>
-=C2=A0 audio_drv_list=3D&quot;try-sdl&quot;<br>
-=C2=A0 audio_possible_drivers=3D&quot;sdl&quot;<br>
=C2=A0;;<br>
=C2=A0Darwin)<br>
=C2=A0 =C2=A0bsd=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0darwin=3D&quot;yes&quot;<br>
-=C2=A0 audio_drv_list=3D&quot;try-coreaudio try-sdl&quot;<br>
-=C2=A0 audio_possible_drivers=3D&quot;coreaudio sdl&quot;<br>
=C2=A0 =C2=A0# Disable attempts to use ObjectiveC features in os/object.h s=
ince they<br>
=C2=A0 =C2=A0# won&#39;t work when we&#39;re compiling with gcc as a C comp=
iler.<br>
=C2=A0 =C2=A0QEMU_CFLAGS=3D&quot;-DOS_OBJECT_USE_OBJC=3D0 $QEMU_CFLAGS&quot=
;<br>
@@ -759,10 +738,6 @@ SunOS)<br>
=C2=A0 =C2=A0solaris=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0make=3D&quot;${MAKE-gmake}&quot;<br>
=C2=A0 =C2=A0smbd=3D&quot;${SMBD-/usr/sfw/sbin/smbd}&quot;<br>
-=C2=A0 if test -f /usr/include/sys/soundcard.h ; then<br>
-=C2=A0 =C2=A0 audio_drv_list=3D&quot;oss try-sdl&quot;<br>
-=C2=A0 fi<br>
-=C2=A0 audio_possible_drivers=3D&quot;oss sdl&quot;<br>
=C2=A0# needed for CMSG_ macros in sys/socket.h<br>
=C2=A0 =C2=A0QEMU_CFLAGS=3D&quot;-D_XOPEN_SOURCE=3D600 $QEMU_CFLAGS&quot;<b=
r>
=C2=A0# needed for TIOCWIN* defines in termios.h<br>
@@ -774,8 +749,6 @@ Haiku)<br>
=C2=A0 =C2=A0QEMU_CFLAGS=3D&quot;-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURC=
E -fPIC $QEMU_CFLAGS&quot;<br>
=C2=A0;;<br>
=C2=A0Linux)<br>
-=C2=A0 audio_drv_list=3D&quot;try-pa oss&quot;<br>
-=C2=A0 audio_possible_drivers=3D&quot;oss alsa sdl pa&quot;<br>
=C2=A0 =C2=A0linux=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0linux_user=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0vhost_user=3D${default_feature:-yes}<br>
@@ -1795,7 +1768,6 @@ Advanced options (experts only):<br>
=C2=A0 =C2=A0--disable-werror=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0disable comp=
ilation abort on warning<br>
=C2=A0 =C2=A0--disable-stack-protector disable compiler-provided stack prot=
ection<br>
=C2=A0 =C2=A0--audio-drv-list=3DLIST=C2=A0 =C2=A0 set audio drivers list:<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0Available drivers: $audio_possible_drivers<br>
=C2=A0 =C2=A0--block-drv-whitelist=3DL=C2=A0 Same as --block-drv-rw-whiteli=
st=3DL<br>
=C2=A0 =C2=A0--block-drv-rw-whitelist=3DL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 set block driver read-write whitelist<br>
@@ -2398,12 +2370,6 @@ if test -z &quot;$want_tools&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# Disable features only meaningful for system-mode emulation<br>
-if test &quot;$softmmu&quot; =3D &quot;no&quot;; then<br>
-=C2=A0 =C2=A0 audio_drv_list=3D&quot;&quot;<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# L2TPV3 probe<br>
<br>
@@ -2982,130 +2948,6 @@ EOF<br>
=C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-##########################################<br>
-# detect CoreAudio<br>
-if test &quot;$coreaudio&quot; !=3D &quot;no&quot; ; then<br>
-=C2=A0 coreaudio_libs=3D&quot;-framework CoreAudio&quot;<br>
-=C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;CoreAudio/CoreAudio.h&gt;<br>
-int main(void)<br>
-{<br>
-=C2=A0 return (int)AudioGetCurrentHostTime();<br>
-}<br>
-EOF<br>
-=C2=A0 if compile_prog &quot;&quot; &quot;$coreaudio_libs&quot; ; then<br>
-=C2=A0 =C2=A0 coreaudio=3Dyes<br>
-=C2=A0 else<br>
-=C2=A0 =C2=A0 coreaudio=3Dno<br>
-=C2=A0 fi<br>
-fi<br>
-<br>
-##########################################<br>
-# Sound support libraries probe<br>
-<br>
-audio_drv_list=3D$(echo &quot;$audio_drv_list&quot; | sed -e &#39;s/,/ /g&=
#39;)<br>
-for drv in $audio_drv_list; do<br>
-=C2=A0 =C2=A0 case $drv in<br>
-=C2=A0 =C2=A0 alsa | try-alsa)<br>
-=C2=A0 =C2=A0 if $pkg_config alsa --exists; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 alsa_libs=3D$($pkg_config alsa --libs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 alsa_cflags=3D$($pkg_config alsa --cflags)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 alsa=3Dyes<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$drv&quot; =3D &quot;try-alsa&qu=
ot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 audio_drv_list=3D$(echo &quot;$a=
udio_drv_list&quot; | sed -e &#39;s/try-alsa/alsa/&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$drv&quot; =3D &quot;try-alsa&qu=
ot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 audio_drv_list=3D$(echo &quot;$a=
udio_drv_list&quot; | sed -e &#39;s/try-alsa//&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_exit &quot;$drv check fail=
ed&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Make sure to=
 have the $drv libs and headers installed.&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 ;;<br>
-<br>
-=C2=A0 =C2=A0 pa | try-pa)<br>
-=C2=A0 =C2=A0 if $pkg_config libpulse --exists; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 libpulse=3Dyes<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pulse_libs=3D$($pkg_config libpulse --libs)<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 pulse_cflags=3D$($pkg_config libpulse --cflags=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$drv&quot; =3D &quot;try-pa&quot=
;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 audio_drv_list=3D$(echo &quot;$a=
udio_drv_list&quot; | sed -e &#39;s/try-pa/pa/&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$drv&quot; =3D &quot;try-pa&quot=
;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 audio_drv_list=3D$(echo &quot;$a=
udio_drv_list&quot; | sed -e &#39;s/try-pa//&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_exit &quot;$drv check fail=
ed&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Make sure to=
 have the $drv libs and headers installed.&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 ;;<br>
-<br>
-=C2=A0 =C2=A0 sdl)<br>
-=C2=A0 =C2=A0 if test &quot;$sdl&quot; =3D &quot;no&quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_exit &quot;sdl not found or disabled, ca=
n not use sdl audio driver&quot;<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 ;;<br>
-<br>
-=C2=A0 =C2=A0 try-sdl)<br>
-=C2=A0 =C2=A0 if test &quot;$sdl&quot; =3D &quot;no&quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 audio_drv_list=3D$(echo &quot;$audio_drv_list&=
quot; | sed -e &#39;s/try-sdl//&#39;)<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 audio_drv_list=3D$(echo &quot;$audio_drv_list&=
quot; | sed -e &#39;s/try-sdl/sdl/&#39;)<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 ;;<br>
-<br>
-=C2=A0 =C2=A0 coreaudio | try-coreaudio)<br>
-=C2=A0 =C2=A0 if test &quot;$coreaudio&quot; =3D &quot;no&quot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 if test &quot;$drv&quot; =3D &quot;try-coreaudio&quot=
;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 audio_drv_list=3D$(echo &quot;$audio_drv_list&=
quot; | sed -e &#39;s/try-coreaudio//&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_exit &quot;$drv check failed&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Make sure to=
 have the $drv is available.&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 coreaudio_libs=3D&quot;-framework CoreAudio&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 if test &quot;$drv&quot; =3D &quot;try-coreaudio&quot=
;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 audio_drv_list=3D$(echo &quot;$audio_drv_list&=
quot; | sed -e &#39;s/try-coreaudio/coreaudio/&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 ;;<br>
-<br>
-=C2=A0 =C2=A0 dsound)<br>
-=C2=A0 =C2=A0 =C2=A0 dsound_libs=3D&quot;-lole32 -ldxguid&quot;<br>
-=C2=A0 =C2=A0 ;;<br>
-<br>
-=C2=A0 =C2=A0 oss)<br>
-=C2=A0 =C2=A0 =C2=A0 oss_libs=3D&quot;$oss_lib&quot;<br>
-=C2=A0 =C2=A0 ;;<br>
-<br>
-=C2=A0 =C2=A0 jack | try-jack)<br>
-=C2=A0 =C2=A0 if $pkg_config jack --exists; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 libjack=3Dyes<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 jack_libs=3D$($pkg_config jack --libs)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$drv&quot; =3D &quot;try-jack&qu=
ot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 audio_drv_list=3D$(echo &quot;$a=
udio_drv_list&quot; | sed -e &#39;s/try-jack/jack/&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;$drv&quot; =3D &quot;try-jack&qu=
ot;; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 audio_drv_list=3D$(echo &quot;$a=
udio_drv_list&quot; | sed -e &#39;s/try-jack//&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_exit &quot;$drv check fail=
ed&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Make sure to=
 have the $drv libs and headers installed.&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 fi<br>
-=C2=A0 =C2=A0 ;;<br>
-<br>
-=C2=A0 =C2=A0 *)<br>
-=C2=A0 =C2=A0 echo &quot;$audio_possible_drivers&quot; | grep -q &quot;\&l=
t;$drv\&gt;&quot; || {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_exit &quot;Unknown driver &#39;$drv&#39;=
 selected&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Possible drivers are: $aud=
io_possible_drivers&quot;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 ;;<br>
-=C2=A0 =C2=A0 esac<br>
-done<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# plugin linker support probe<br>
<br>
@@ -4536,28 +4378,6 @@ fi<br>
=C2=A0if test &quot;$gprof&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_GPROF=3Dy&quot; &gt;&gt; $config_host_mak<br=
>
=C2=A0fi<br>
-echo &quot;CONFIG_AUDIO_DRIVERS=3D$audio_drv_list&quot; &gt;&gt; $config_h=
ost_mak<br>
-for drv in $audio_drv_list; do<br>
-=C2=A0 =C2=A0 def=3DCONFIG_AUDIO_$(echo $drv | LC_ALL=3DC tr &#39;[a-z]&#3=
9; &#39;[A-Z]&#39;)<br>
-=C2=A0 =C2=A0 echo &quot;$def=3Dy&quot; &gt;&gt; $config_host_mak<br>
-done<br>
-if test &quot;$alsa&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 echo &quot;CONFIG_ALSA=3Dy&quot; &gt;&gt; $config_host_mak<b=
r>
-fi<br>
-echo &quot;ALSA_LIBS=3D$alsa_libs&quot; &gt;&gt; $config_host_mak<br>
-echo &quot;ALSA_CFLAGS=3D$alsa_cflags&quot; &gt;&gt; $config_host_mak<br>
-if test &quot;$libpulse&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 echo &quot;CONFIG_LIBPULSE=3Dy&quot; &gt;&gt; $config_host_m=
ak<br>
-fi<br>
-echo &quot;PULSE_LIBS=3D$pulse_libs&quot; &gt;&gt; $config_host_mak<br>
-echo &quot;PULSE_CFLAGS=3D$pulse_cflags&quot; &gt;&gt; $config_host_mak<br=
>
-echo &quot;COREAUDIO_LIBS=3D$coreaudio_libs&quot; &gt;&gt; $config_host_ma=
k<br>
-echo &quot;DSOUND_LIBS=3D$dsound_libs&quot; &gt;&gt; $config_host_mak<br>
-echo &quot;OSS_LIBS=3D$oss_libs&quot; &gt;&gt; $config_host_mak<br>
-if test &quot;$libjack&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 =C2=A0 echo &quot;CONFIG_LIBJACK=3Dy&quot; &gt;&gt; $config_host_ma=
k<br>
-fi<br>
-echo &quot;JACK_LIBS=3D$jack_libs&quot; &gt;&gt; $config_host_mak<br>
=C2=A0echo &quot;CONFIG_BDRV_RW_WHITELIST=3D$block_drv_rw_whitelist&quot; &=
gt;&gt; $config_host_mak<br>
=C2=A0echo &quot;CONFIG_BDRV_RO_WHITELIST=3D$block_drv_ro_whitelist&quot; &=
gt;&gt; $config_host_mak<br>
=C2=A0if test &quot;$block_drv_whitelist_tools&quot; =3D &quot;yes&quot; ; =
then<br>
@@ -5195,7 +5015,7 @@ if test &quot;$skip_meson&quot; =3D no; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dvhost_user_blk_server=3D$vhost_user_blk=
_server -Dmultiprocess=3D$multiprocess \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dfuse=3D$fuse -Dfuse_lseek=3D$fuse_lseek=
 -Dguest_agent_msi=3D$guest_agent_msi -Dbpf=3D$bpf\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(if test &quot;$default_feature&quot; =
=3D no; then echo &quot;-Dauto_features=3Ddisabled&quot;; fi) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-Dtcg_interpreter=3D$tcg_interpreter \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -Daudio_drv_list=3D$audio_drv_list -Dtcg_inter=
preter=3D$tcg_interpreter \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$cross_arg \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$PWD&quot; &quot;$source_path&quot;=
<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 7b596fdcd9..13b725181a 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -430,20 +430,23 @@ vde =3D not_found<br>
=C2=A0if config_host.has_key(&#39;CONFIG_VDE&#39;)<br>
=C2=A0 =C2=A0vde =3D declare_dependency(link_args: config_host[&#39;VDE_LIB=
S&#39;].split())<br>
=C2=A0endif<br>
+<br>
=C2=A0pulse =3D not_found<br>
-if &#39;CONFIG_LIBPULSE&#39; in config_host<br>
-=C2=A0 pulse =3D declare_dependency(compile_args: config_host[&#39;PULSE_C=
FLAGS&#39;].split(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_args: config_host[&#39;PULSE_LIBS&#39;]=
.split())<br>
+if not get_option(&#39;pa&#39;).auto() or (targetos =3D=3D &#39;linux&#39;=
 and have_system)<br>
+=C2=A0 pulse =3D dependency(&#39;libpulse&#39;, required: get_option(&#39;=
pa&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0method: &#39;pkg-config&#39;, kwargs: static_kwargs)<br>
=C2=A0endif<br>
=C2=A0alsa =3D not_found<br>
-if &#39;CONFIG_ALSA&#39; in config_host<br>
-=C2=A0 alsa =3D declare_dependency(compile_args: config_host[&#39;ALSA_CFL=
AGS&#39;].split(),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 link_args: config_host[&#39;ALSA_LIBS&#39;].split(=
))<br>
+if not get_option(&#39;alsa&#39;).auto() or (targetos =3D=3D &#39;linux&#3=
9; and have_system)<br>
+=C2=A0 alsa =3D dependency(&#39;alsa&#39;, required: get_option(&#39;alsa&=
#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meth=
od: &#39;pkg-config&#39;, kwargs: static_kwargs)<br>
=C2=A0endif<br>
=C2=A0jack =3D not_found<br>
-if &#39;CONFIG_LIBJACK&#39; in config_host<br>
-=C2=A0 jack =3D declare_dependency(link_args: config_host[&#39;JACK_LIBS&#=
39;].split())<br>
+if not get_option(&#39;jack&#39;).auto() or have_system<br>
+=C2=A0 jack =3D dependency(&#39;jack&#39;, required: get_option(&#39;jack&=
#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 meth=
od: &#39;pkg-config&#39;, kwargs: static_kwargs)<br>
=C2=A0endif<br>
+<br>
=C2=A0spice =3D not_found<br>
=C2=A0spice_headers =3D not_found<br>
=C2=A0spice_protocol =3D not_found<br>
@@ -803,16 +806,59 @@ if liblzfse.found() and not cc.links(&#39;&#39;&#39;<=
br>
=C2=A0endif<br>
<br>
=C2=A0oss =3D not_found<br>
-if &#39;CONFIG_AUDIO_OSS&#39; in config_host<br>
-=C2=A0 oss =3D declare_dependency(link_args: config_host[&#39;OSS_LIBS&#39=
;].split())<br>
+if not get_option(&#39;oss&#39;).auto() or have_system<br>
+=C2=A0 if not cc.has_header(&#39;sys/soundcard.h&#39;)<br>
+=C2=A0 =C2=A0 # not found<br>
+=C2=A0 elif targetos =3D=3D &#39;netbsd&#39;<br>
+=C2=A0 =C2=A0 oss =3D cc.find_library(&#39;ossaudio&#39;, required: get_op=
tion(&#39;oss&#39;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 kwargs: static_kwargs)<br>
+=C2=A0 else<br>
+=C2=A0 =C2=A0 oss =3D declare_dependency()<br>
+=C2=A0 endif<br>
+<br>
+=C2=A0 if not oss.found()<br>
+=C2=A0 =C2=A0 if get_option(&#39;oss&#39;).enabled()<br>
+=C2=A0 =C2=A0 =C2=A0 error(&#39;OSS not found&#39;)<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 warning(&#39;OSS not found, disabling&#39;)<br>
+=C2=A0 =C2=A0 endif<br>
+=C2=A0 endif<br>
=C2=A0endif<br>
=C2=A0dsound =3D not_found<br>
-if &#39;CONFIG_AUDIO_DSOUND&#39; in config_host<br>
-=C2=A0 dsound =3D declare_dependency(link_args: config_host[&#39;DSOUND_LI=
BS&#39;].split())<br>
+if not get_option(&#39;dsound&#39;).auto() or (targetos =3D=3D &#39;window=
s&#39; and have_system)<br>
+=C2=A0 if cc.has_header(&#39;dsound.h&#39;)<br>
+=C2=A0 =C2=A0 dsound =3D declare_dependency(link_args: [&#39;-lole32&#39;,=
 &#39;-ldxguid&#39;])<br>
+=C2=A0 endif<br>
+<br>
+=C2=A0 if not dsound.found()<br>
+=C2=A0 =C2=A0 if get_option(&#39;dsound&#39;).enabled()<br>
+=C2=A0 =C2=A0 =C2=A0 error(&#39;DirectSound not found&#39;)<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 warning(&#39;DirectSound not found, disabling&#39;)<b=
r>
+=C2=A0 =C2=A0 endif<br>
+=C2=A0 endif<br>
=C2=A0endif<br>
+<br>
=C2=A0coreaudio =3D not_found<br>
-if &#39;CONFIG_AUDIO_COREAUDIO&#39; in config_host<br>
-=C2=A0 coreaudio =3D declare_dependency(link_args: config_host[&#39;COREAU=
DIO_LIBS&#39;].split())<br>
+if not get_option(&#39;coreaudio&#39;).auto() or (targetos =3D=3D &#39;dar=
win&#39; and have_system)<br>
+=C2=A0 coreaudio =3D dependency(&#39;appleframeworks&#39;, modules: &#39;C=
oreAudio&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0required: get_option(&#39;coreaudio&#39;))<br>
+=C2=A0 if coreaudio.found() and not cc.links(&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0 #include &lt;CoreAudio/CoreAudio.h&gt;<br>
+=C2=A0 =C2=A0 int main(void)<br>
+=C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 return (int)AudioGetCurrentHostTime();<br>
+=C2=A0 =C2=A0 }&#39;&#39;&#39;)<br>
+=C2=A0 =C2=A0 coreaudio =3D not_found<br>
+=C2=A0 endif<br>
+<br>
+=C2=A0 if not coreaudio.found()<br>
+=C2=A0 =C2=A0 if get_option(&#39;coreaudio&#39;).enabled()<br>
+=C2=A0 =C2=A0 =C2=A0 error(&#39;CoreAudio not found&#39;)<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 warning(&#39;CoreAudio not found, disabling&#39;)<br>
+=C2=A0 =C2=A0 endif<br>
+=C2=A0 endif<br>
=C2=A0endif<br>
<br>
=C2=A0opengl =3D not_found<br>
@@ -1158,6 +1204,49 @@ if libbpf.found() and not cc.links(&#39;&#39;&#39;<b=
r>
=C2=A0 =C2=A0endif<br>
=C2=A0endif<br>
<br>
+#################<br>
+# config-host.h #<br>
+#################<br>
+<br>
+audio_drivers_selected =3D []<br>
+if have_system<br>
+=C2=A0 audio_drivers_available =3D {<br>
+=C2=A0 =C2=A0 &#39;alsa&#39;: alsa.found(),<br>
+=C2=A0 =C2=A0 &#39;coreaudio&#39;: coreaudio.found(),<br>
+=C2=A0 =C2=A0 &#39;dsound&#39;: dsound.found(),<br>
+=C2=A0 =C2=A0 &#39;jack&#39;: jack.found(),<br>
+=C2=A0 =C2=A0 &#39;oss&#39;: oss.found(),<br>
+=C2=A0 =C2=A0 &#39;pa&#39;: pulse.found(),<br>
+=C2=A0 =C2=A0 &#39;sdl&#39;: sdl.found(),<br>
+=C2=A0 }<br>
+<br>
+=C2=A0 # Default to native drivers first, OSS second, SDL third<br>
+=C2=A0 audio_drivers_priority =3D \<br>
+=C2=A0 =C2=A0 [ &#39;pa&#39;, &#39;coreaudio&#39;, &#39;dsound&#39;, &#39;=
oss&#39; ] + \<br>
+=C2=A0 =C2=A0 (targetos =3D=3D &#39;linux&#39; ? [] : [ &#39;sdl&#39; ])<b=
r>
+=C2=A0 audio_drivers_default =3D []<br>
+=C2=A0 foreach k: audio_drivers_priority<br>
+=C2=A0 =C2=A0 if audio_drivers_available[k]<br>
+=C2=A0 =C2=A0 =C2=A0 audio_drivers_default +=3D k<br>
+=C2=A0 =C2=A0 endif<br>
+=C2=A0 endforeach<br>
+<br>
+=C2=A0 foreach k: get_option(&#39;audio_drv_list&#39;)<br>
+=C2=A0 =C2=A0 if k =3D=3D &#39;default&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 audio_drivers_selected +=3D audio_drivers_default<br>
+=C2=A0 =C2=A0 elif not audio_drivers_available[k]<br>
+=C2=A0 =C2=A0 =C2=A0 error(&#39;Audio driver &quot;@0@&quot; not available=
.&#39;.format(k))<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 audio_drivers_selected +=3D k<br>
+=C2=A0 =C2=A0 endif<br>
+=C2=A0 endforeach<br>
+endif<br>
+foreach k: audio_drivers_selected<br>
+=C2=A0 config_host_data.set(&#39;CONFIG_AUDIO_&#39; + k.to_upper(), true)<=
br>
+endforeach<br>
+config_host_data.set(&#39;CONFIG_AUDIO_DRIVERS&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&#39;&quot;&#39; + &#39;&quot;, &quot;&#39;.join(audio_drivers_selected)=
 + &#39;&quot;, &#39;)<br>
+<br>
=C2=A0if get_option(&#39;cfi&#39;)<br>
=C2=A0 =C2=A0cfi_flags=3D[]<br>
=C2=A0 =C2=A0# Check for dependency on LTO<br>
@@ -1201,10 +1290,6 @@ endif<br>
=C2=A0have_host_block_device =3D (targetos !=3D &#39;darwin&#39; or<br>
=C2=A0 =C2=A0 =C2=A0cc.has_header(&#39;IOKit/storage/IOMedia.h&#39;))<br>
<br>
-#################<br>
-# config-host.h #<br>
-#################<br>
-<br>
=C2=A0have_virtfs =3D (targetos =3D=3D &#39;linux&#39; and<br>
=C2=A0 =C2=A0 =C2=A0have_system and<br>
=C2=A0 =C2=A0 =C2=A0libattr.found() and<br>
@@ -1449,7 +1534,7 @@ config_host_data.set(&#39;HAVE_BROKEN_SIZE_MAX&#39;, =
not cc.compiles(&#39;&#39;&#39;<br>
<br>
<br>
=C2=A0ignored =3D [&#39;CONFIG_QEMU_INTERP_PREFIX&#39;] # actually per-targ=
et<br>
-arrays =3D [&#39;CONFIG_AUDIO_DRIVERS&#39;, &#39;CONFIG_BDRV_RW_WHITELIST&=
#39;, &#39;CONFIG_BDRV_RO_WHITELIST&#39;]<br>
+arrays =3D [&#39;CONFIG_BDRV_RW_WHITELIST&#39;, &#39;CONFIG_BDRV_RO_WHITEL=
IST&#39;]<br>
=C2=A0strings =3D [&#39;HOST_DSOSUF&#39;, &#39;CONFIG_IASL&#39;]<br>
=C2=A0foreach k, v: config_host<br>
=C2=A0 =C2=A0if ignored.contains(k)<br>
@@ -2885,7 +2970,7 @@ if config_host.has_key(&#39;CONFIG_MODULES&#39;)<br>
=C2=A0endif<br>
=C2=A0summary_info +=3D {&#39;fuzzing support&#39;:=C2=A0 =C2=A0config_host=
.has_key(&#39;CONFIG_FUZZ&#39;)}<br>
=C2=A0if have_system<br>
-=C2=A0 summary_info +=3D {&#39;Audio drivers&#39;:=C2=A0 =C2=A0 =C2=A0conf=
ig_host[&#39;CONFIG_AUDIO_DRIVERS&#39;]}<br>
+=C2=A0 summary_info +=3D {&#39;Audio drivers&#39;:=C2=A0 =C2=A0 =C2=A0&#39=
; &#39;.join(audio_drivers_selected)}<br>
=C2=A0endif<br>
=C2=A0summary_info +=3D {&#39;Trace backends&#39;:=C2=A0 =C2=A0 config_host=
[&#39;TRACE_BACKENDS&#39;]}<br>
=C2=A0if config_host[&#39;TRACE_BACKENDS&#39;].split().contains(&#39;simple=
&#39;)<br>
@@ -3073,6 +3158,18 @@ if vnc.found()<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;VNC JPEG support&#39;:=C2=A0 jpeg}<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;VNC PNG support&#39;:=C2=A0 =C2=A0png}=
<br>
=C2=A0endif<br>
+if targetos not in [&#39;darwin&#39;, &#39;haiku&#39;, &#39;windows&#39;]<=
br>
+=C2=A0 summary_info +=3D {&#39;OSS support&#39;:=C2=A0 =C2=A0 =C2=A0oss}<b=
r>
+elif targetos =3D=3D &#39;darwin&#39;<br>
+=C2=A0 summary_info +=3D {&#39;CoreAudio support&#39;: coreaudio}<br>
+elif targetos =3D=3D &#39;windows&#39;<br>
+=C2=A0 summary_info +=3D {&#39;DirectSound support&#39;: dsound}<br>
+endif<br>
+if targetos =3D=3D &#39;linux&#39;<br>
+=C2=A0 summary_info +=3D {&#39;ALSA support&#39;:=C2=A0 =C2=A0 alsa}<br>
+=C2=A0 summary_info +=3D {&#39;PulseAudio support&#39;: pulse}<br>
+endif<br>
+summary_info +=3D {&#39;JACK support&#39;:=C2=A0 =C2=A0 =C2=A0 jack}<br>
=C2=A0summary_info +=3D {&#39;brlapi support&#39;:=C2=A0 =C2=A0 brlapi}<br>
=C2=A0summary_info +=3D {&#39;vde support&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0c=
onfig_host.has_key(&#39;CONFIG_VDE&#39;)}<br>
=C2=A0summary_info +=3D {&#39;netmap support&#39;:=C2=A0 =C2=A0 config_host=
.has_key(&#39;CONFIG_NETMAP&#39;)}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 2c89e79e8b..052c4f088e 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -6,9 +6,12 @@ option(&#39;qemu_firmwarepath&#39;, type : &#39;string&#39=
;, value : &#39;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;search PATH for firmware file=
s&#39;)<br>
=C2=A0option(&#39;sphinx_build&#39;, type : &#39;string&#39;, value : &#39;=
&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Use specified sphinx-build [$=
sphinx_build] for building document (default to be empty)&#39;)<br>
-<br>
=C2=A0option(&#39;default_devices&#39;, type : &#39;boolean&#39;, value : t=
rue,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Include a default selection o=
f devices in emulators&#39;)<br>
+option(&#39;audio_drv_list&#39;, type: &#39;array&#39;, value: [&#39;defau=
lt&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0choices: [&#39;alsa&#39;, &#39;coreaudio&#39;, =
&#39;default&#39;, &#39;dsound&#39;, &#39;jack&#39;, &#39;oss&#39;, &#39;pa=
&#39;, &#39;sdl&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Set audio driver list&#39;)<b=
r>
+<br>
=C2=A0option(&#39;docs&#39;, type : &#39;feature&#39;, value : &#39;auto&#3=
9;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Documentations build support&=
#39;)<br>
=C2=A0option(&#39;gettext&#39;, type : &#39;feature&#39;, value : &#39;auto=
&#39;,<br>
@@ -139,6 +142,19 @@ option(&#39;fuse&#39;, type: &#39;feature&#39;, value:=
 &#39;auto&#39;,<br>
=C2=A0option(&#39;fuse_lseek&#39;, type : &#39;feature&#39;, value : &#39;a=
uto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;SEEK_HOLE/SEEK_DATA support f=
or FUSE exports&#39;)<br>
<br>
+option(&#39;alsa&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;ALSA sound support&#39;)<br>
+option(&#39;coreaudio&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;CoreAudio sound support&#39;)=
<br>
+option(&#39;dsound&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;DirectSound sound support&#39=
;)<br>
+option(&#39;jack&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;JACK sound support&#39;)<br>
+option(&#39;oss&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;OSS sound support&#39;)<br>
+option(&#39;pa&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;PulseAudio sound support&#39;=
)<br>
+<br>
=C2=A0option(&#39;vhost_user_blk_server&#39;, type: &#39;feature&#39;, valu=
e: &#39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;build vhost-user-blk server&#=
39;)<br>
=C2=A0option(&#39;virtfs&#39;, type: &#39;feature&#39;, value: &#39;auto&#3=
9;,<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>

--000000000000050fc105cdc94d8b--

