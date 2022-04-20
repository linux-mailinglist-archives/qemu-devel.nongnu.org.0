Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CB5509080
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:31:57 +0200 (CEST)
Received: from localhost ([::1]:38582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhG3Q-0006Se-90
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhF40-0002rX-GH
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:28:28 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:42806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhF3w-0004RD-GH
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:28:28 -0400
Received: by mail-qk1-x732.google.com with SMTP id j6so1865992qkp.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MYjSMsWrPRLSO5yUJPCUVW9HY4Vy4QXg5EAEm2OogXE=;
 b=NFH1mMwcy3Oq/HPUQlZW3CZHwku1NnVKj0N7cYR1I9pwVunyrag0wOvkMH+q8C4Oss
 WRfcNcfuKZ5CtuCKF/GazuBiSn/O5YmHtbW8bEG6POn2ZdAlKz2eQM0zuusTUbm0ufB8
 zsr1kr+VaFL3o24GvDUFgkEfXJqknCj8q7ZTequWMcfYgtfd40pevIK3NAv/ze3bPApc
 EIdhcBqvjgbelz/nvVDlLO1NQ8DoWCSIyQUk2j6brkrt9cPThlBAiEhuW47dJQHvahfg
 wSvwiMxMixq6TDIVaRxdmc7vU9SnWDHvQ1gXSTyD0xfVFWA9cxHjJgdb1XOhRzomDLnf
 TOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MYjSMsWrPRLSO5yUJPCUVW9HY4Vy4QXg5EAEm2OogXE=;
 b=ylsrLiieR8GbJCf5d4DEUFzN3DUVZrL0mjmB0GuxsCkvi+oC9mfXkei5gmXvHMN24g
 VgwkW9Km3aFCvDHgHtYj7MJUjipcD2kBtZn/ysqZG6KxZbcILBssNmZY+DIdLl7lueQb
 RNjq01uLKg9bAx84YputFjnic6AZaLoqkX+CsaAKxT0XbZkrDUGSb+dAtlM82gOZxMg6
 B3+l1aFxGxMjZHBwNzest+1cBUdJViufhAmxzPaSvmI/9IASvYHtHi8vnz87SYH23s7A
 3NkYNxo+OqTZDRDxSzIDC6L0nKbGkrtn94XsfMr/5yZUBd+t+ZcgtGcF+EyKd4AdfFjs
 o2pQ==
X-Gm-Message-State: AOAM5338q4eW6fWp57yL+myaDjhb/0nb/T0WtAo7UPeQQv1xU1cltML7
 fEE3VeIpwVnrusHY52CT6EuZIA+43ggWFlB5RGhXxJo9FcC2vA==
X-Google-Smtp-Source: ABdhPJwEBm3fBXfvilwDu7AkAstDEY3lwrLKtC4pCzActvF55zCZ5xVVpqNjkCkuk5JnFj+KKlJDEKe2wMdz5LmDii8=
X-Received: by 2002:a37:aa48:0:b0:69e:d351:9683 with SMTP id
 t69-20020a37aa48000000b0069ed3519683mr3089074qke.539.1650479303204; Wed, 20
 Apr 2022 11:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-21-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-21-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 22:28:11 +0400
Message-ID: <CAJ+F1CJp0Sexhvor4noRBi5p0UC-WZikvQd=iYF6Yr+w7kPkAQ@mail.gmail.com>
Subject: Re: [PATCH 20/34] meson, configure: move bdrv whitelists to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000093a93405dd1a285e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000093a93405dd1a285e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Apr 20, 2022 at 7:57 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Use the new support for string option parsing.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>





> ---
>  configure                     | 14 --------------
>  meson.build                   | 27 ++++++++++++++++-----------
>  meson_options.txt             |  4 ++++
>  scripts/meson-buildoptions.sh |  8 ++++++++
>  4 files changed, 28 insertions(+), 25 deletions(-)
>
> diff --git a/configure b/configure
> index 3327a4887a..bc15854578 100755
> --- a/configure
> +++ b/configure
> @@ -235,8 +235,6 @@ interp_prefix=3D"/usr/gnemul/qemu-%M"
>  static=3D"no"
>  cross_compile=3D"no"
>  cross_prefix=3D""
> -block_drv_rw_whitelist=3D""
> -block_drv_ro_whitelist=3D""
>  host_cc=3D"cc"
>  lto=3D"false"
>  stack_protector=3D""
> @@ -815,10 +813,6 @@ for opt do
>      # configure to be used by RPM and similar macros that set
>      # lots of directory switches by default.
>    ;;
> -  --block-drv-rw-whitelist=3D*|--block-drv-whitelist=3D*)
> block_drv_rw_whitelist=3D$(echo "$optarg" | sed -e 's/,/ /g')
> -  ;;
> -  --block-drv-ro-whitelist=3D*) block_drv_ro_whitelist=3D$(echo "$optarg=
" |
> sed -e 's/,/ /g')
> -  ;;
>    --enable-debug-tcg) debug_tcg=3D"yes"
>    ;;
>    --disable-debug-tcg) debug_tcg=3D"no"
> @@ -1154,12 +1148,6 @@ Advanced options (experts only):
>    --disable-stack-protector disable compiler-provided stack protection
>    --audio-drv-list=3DLIST    set audio drivers to try if -audiodev is no=
t
> used
>    --block-drv-whitelist=3DL  Same as --block-drv-rw-whitelist=3DL
> -  --block-drv-rw-whitelist=3DL
> -                           set block driver read-write whitelist
> -                           (by default affects only QEMU, not tools like
> qemu-img)
> -  --block-drv-ro-whitelist=3DL
> -                           set block driver read-only whitelist
> -                           (by default affects only QEMU, not tools like
> qemu-img)
>    --with-trace-file=3DNAME   Full PATH,NAME of file to store traces
>                             Default:trace-<pid>
>    --cpu=3DCPU                Build for host CPU [$cpu]
> @@ -2184,8 +2172,6 @@ fi
>  if test "$static" =3D "yes" ; then
>    echo "CONFIG_STATIC=3Dy" >> $config_host_mak
>  fi
> -echo "CONFIG_BDRV_RW_WHITELIST=3D$block_drv_rw_whitelist" >>
> $config_host_mak
> -echo "CONFIG_BDRV_RO_WHITELIST=3D$block_drv_ro_whitelist" >>
> $config_host_mak
>  qemu_version=3D$(head $source_path/VERSION)
>  echo "PKGVERSION=3D$pkgversion" >>$config_host_mak
>  echo "SRC_PATH=3D$source_path" >> $config_host_mak
> diff --git a/meson.build b/meson.build
> index 8a7e4ab5c7..ee96cbc64e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1592,6 +1592,19 @@ have_virtfs =3D get_option('virtfs') \
>
>  have_virtfs_proxy_helper =3D targetos !=3D 'darwin' and have_virtfs and
> have_tools
>
> +if get_option('block_drv_ro_whitelist') =3D=3D ''
> +  config_host_data.set('CONFIG_BDRV_RO_WHITELIST', '')
> +else
> +  config_host_data.set('CONFIG_BDRV_RO_WHITELIST',
> +        '"' + get_option('block_drv_ro_whitelist').replace(',', '", "') =
+
> '"')
> +endif
> +if get_option('block_drv_rw_whitelist') =3D=3D ''
> +  config_host_data.set('CONFIG_BDRV_RW_WHITELIST', '')
> +else
> +  config_host_data.set('CONFIG_BDRV_RO_WHITELIST',
>

RW

otherwise,
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> +        '"' + get_option('block_drv_rw_whitelist').replace(',', '", "') =
+
> '"')
> +endif
> +
>  foreach k : get_option('trace_backends')
>    config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
>  endforeach
> @@ -2207,16 +2220,8 @@ config_host_data.set('HAVE_VSS_SDK', have_vss_sdk)
>
>  ignored =3D ['CONFIG_QEMU_INTERP_PREFIX', # actually per-target
>      'HAVE_GDB_BIN']
> -arrays =3D ['CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
>  foreach k, v: config_host
> -  if ignored.contains(k)
> -    # do nothing
> -  elif arrays.contains(k)
> -    if v !=3D ''
> -      v =3D '"' + '", "'.join(v.split()) + '", '
> -    endif
> -    config_host_data.set(k, v)
> -  elif k.startswith('CONFIG_')
> +  if k.startswith('CONFIG_') and not ignored.contains(k)
>      config_host_data.set(k, v =3D=3D 'y' ? 1 : v)
>    endif
>  endforeach
> @@ -3786,8 +3791,8 @@ summary_info =3D {}
>  summary_info +=3D {'coroutine backend':
> config_host['CONFIG_COROUTINE_BACKEND']}
>  summary_info +=3D {'coroutine pool':    have_coroutine_pool}
>  if have_block
> -  summary_info +=3D {'Block whitelist (rw)':
> config_host['CONFIG_BDRV_RW_WHITELIST']}
> -  summary_info +=3D {'Block whitelist (ro)':
> config_host['CONFIG_BDRV_RO_WHITELIST']}
> +  summary_info +=3D {'Block whitelist (rw)':
> get_option('block_drv_rw_whitelist')}
> +  summary_info +=3D {'Block whitelist (ro)':
> get_option('block_drv_ro_whitelist')}
>    summary_info +=3D {'Use block whitelist in tools':
> get_option('block_drv_whitelist_in_tools')}
>    summary_info +=3D {'VirtFS support':    have_virtfs}
>    summary_info +=3D {'build virtiofs daemon': have_virtiofsd}
> diff --git a/meson_options.txt b/meson_options.txt
> index 891c0ec130..ec974003b3 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -21,6 +21,10 @@ option('default_devices', type : 'boolean', value :
> true,
>  option('audio_drv_list', type: 'array', value: ['default'],
>         choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss'=
,
> 'pa', 'sdl'],
>         description: 'Set audio driver list')
> +option('block_drv_rw_whitelist', type : 'string', value : '',
> +       description: 'set block driver read-write whitelist (by default
> affects only QEMU, not tools like qemu-img)')
> +option('block_drv_ro_whitelist', type : 'string', value : '',
> +       description: 'set block driver read-only whitelist (by default
> affects only QEMU, not tools like qemu-img)')
>  option('fuzzing_engine', type : 'string', value : '',
>         description: 'fuzzing engine library for OSS-Fuzz')
>  option('trace_file', type: 'string', value: 'trace',
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index 0e0548aa87..4c49d4af08 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -2,6 +2,12 @@
>  meson_options_help() {
>    printf "%s\n" '  --audio-drv-list=3DCHOICES Set audio driver list
> [default] (choices:'
>    printf "%s\n" '
>  alsa/coreaudio/default/dsound/jack/oss/pa/sdl)'
> +  printf "%s\n" '  --block-drv-ro-whitelist=3DVALUE'
> +  printf "%s\n" '                           set block driver read-only
> whitelist (by default'
> +  printf "%s\n" '                           affects only QEMU, not tools
> like qemu-img)'
> +  printf "%s\n" '  --block-drv-rw-whitelist=3DVALUE'
> +  printf "%s\n" '                           set block driver read-write
> whitelist (by default'
> +  printf "%s\n" '                           affects only QEMU, not tools
> like qemu-img)'
>    printf "%s\n" '  --disable-coroutine-pool coroutine freelist (better
> performance)'
>    printf "%s\n" '  --disable-install-blobs  install provided firmware
> blobs'
>    printf "%s\n" '  --enable-block-drv-whitelist-in-tools'
> @@ -161,6 +167,8 @@ _meson_option_parse() {
>      --disable-avx2) printf "%s" -Davx2=3Ddisabled ;;
>      --enable-avx512f) printf "%s" -Davx512f=3Denabled ;;
>      --disable-avx512f) printf "%s" -Davx512f=3Ddisabled ;;
> +    --block-drv-ro-whitelist=3D*) quote_sh "-Dblock_drv_ro_whitelist=3D$=
2" ;;
> +    --block-drv-rw-whitelist=3D*) quote_sh "-Dblock_drv_rw_whitelist=3D$=
2" ;;
>      --enable-block-drv-whitelist-in-tools) printf "%s"
> -Dblock_drv_whitelist_in_tools=3Dtrue ;;
>      --disable-block-drv-whitelist-in-tools) printf "%s"
> -Dblock_drv_whitelist_in_tools=3Dfalse ;;
>      --enable-bochs) printf "%s" -Dbochs=3Denabled ;;
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000093a93405dd1a285e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:57 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Us=
e the new support for string option parsing.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div><div><br></div><div><br></div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 14 --------------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 27 ++++++++++++++++-----------<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 4 ++++<br>
=C2=A0scripts/meson-buildoptions.sh |=C2=A0 8 ++++++++<br>
=C2=A04 files changed, 28 insertions(+), 25 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index 3327a4887a..bc15854578 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -235,8 +235,6 @@ interp_prefix=3D&quot;/usr/gnemul/qemu-%M&quot;<br>
=C2=A0static=3D&quot;no&quot;<br>
=C2=A0cross_compile=3D&quot;no&quot;<br>
=C2=A0cross_prefix=3D&quot;&quot;<br>
-block_drv_rw_whitelist=3D&quot;&quot;<br>
-block_drv_ro_whitelist=3D&quot;&quot;<br>
=C2=A0host_cc=3D&quot;cc&quot;<br>
=C2=A0lto=3D&quot;false&quot;<br>
=C2=A0stack_protector=3D&quot;&quot;<br>
@@ -815,10 +813,6 @@ for opt do<br>
=C2=A0 =C2=A0 =C2=A0# configure to be used by RPM and similar macros that s=
et<br>
=C2=A0 =C2=A0 =C2=A0# lots of directory switches by default.<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --block-drv-rw-whitelist=3D*|--block-drv-whitelist=3D*) block_drv_r=
w_whitelist=3D$(echo &quot;$optarg&quot; | sed -e &#39;s/,/ /g&#39;)<br>
-=C2=A0 ;;<br>
-=C2=A0 --block-drv-ro-whitelist=3D*) block_drv_ro_whitelist=3D$(echo &quot=
;$optarg&quot; | sed -e &#39;s/,/ /g&#39;)<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--enable-debug-tcg) debug_tcg=3D&quot;yes&quot;<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-debug-tcg) debug_tcg=3D&quot;no&quot;<br>
@@ -1154,12 +1148,6 @@ Advanced options (experts only):<br>
=C2=A0 =C2=A0--disable-stack-protector disable compiler-provided stack prot=
ection<br>
=C2=A0 =C2=A0--audio-drv-list=3DLIST=C2=A0 =C2=A0 set audio drivers to try =
if -audiodev is not used<br>
=C2=A0 =C2=A0--block-drv-whitelist=3DL=C2=A0 Same as --block-drv-rw-whiteli=
st=3DL<br>
-=C2=A0 --block-drv-rw-whitelist=3DL<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0set block driver read-write whitelist<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(by default affects only QEMU, not tools like qemu-=
img)<br>
-=C2=A0 --block-drv-ro-whitelist=3DL<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0set block driver read-only whitelist<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(by default affects only QEMU, not tools like qemu-=
img)<br>
=C2=A0 =C2=A0--with-trace-file=3DNAME=C2=A0 =C2=A0Full PATH,NAME of file to=
 store traces<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 Default:trace-&lt;pid&gt;<br>
=C2=A0 =C2=A0--cpu=3DCPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 Build for host CPU [$cpu]<br>
@@ -2184,8 +2172,6 @@ fi<br>
=C2=A0if test &quot;$static&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0echo &quot;CONFIG_STATIC=3Dy&quot; &gt;&gt; $config_host_mak<b=
r>
=C2=A0fi<br>
-echo &quot;CONFIG_BDRV_RW_WHITELIST=3D$block_drv_rw_whitelist&quot; &gt;&g=
t; $config_host_mak<br>
-echo &quot;CONFIG_BDRV_RO_WHITELIST=3D$block_drv_ro_whitelist&quot; &gt;&g=
t; $config_host_mak<br>
=C2=A0qemu_version=3D$(head $source_path/VERSION)<br>
=C2=A0echo &quot;PKGVERSION=3D$pkgversion&quot; &gt;&gt;$config_host_mak<br=
>
=C2=A0echo &quot;SRC_PATH=3D$source_path&quot; &gt;&gt; $config_host_mak<br=
>
diff --git a/meson.build b/meson.build<br>
index 8a7e4ab5c7..ee96cbc64e 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1592,6 +1592,19 @@ have_virtfs =3D get_option(&#39;virtfs&#39;) \<br>
<br>
=C2=A0have_virtfs_proxy_helper =3D targetos !=3D &#39;darwin&#39; and have_=
virtfs and have_tools<br>
<br>
+if get_option(&#39;block_drv_ro_whitelist&#39;) =3D=3D &#39;&#39;<br>
+=C2=A0 config_host_data.set(&#39;CONFIG_BDRV_RO_WHITELIST&#39;, &#39;&#39;=
)<br>
+else<br>
+=C2=A0 config_host_data.set(&#39;CONFIG_BDRV_RO_WHITELIST&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&quot;&#39; + get_option(&#39;block_drv_r=
o_whitelist&#39;).replace(&#39;,&#39;, &#39;&quot;, &quot;&#39;) + &#39;&qu=
ot;&#39;)<br>
+endif<br>
+if get_option(&#39;block_drv_rw_whitelist&#39;) =3D=3D &#39;&#39;<br>
+=C2=A0 config_host_data.set(&#39;CONFIG_BDRV_RW_WHITELIST&#39;, &#39;&#39;=
)<br>
+else<br>
+=C2=A0 config_host_data.set(&#39;CONFIG_BDRV_RO_WHITELIST&#39;,<br></block=
quote><div><br></div><div>RW</div><div><br></div><div>otherwise,</div><div>=
<div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&quot;&#39; + get_option(&#39;block_drv_r=
w_whitelist&#39;).replace(&#39;,&#39;, &#39;&quot;, &quot;&#39;) + &#39;&qu=
ot;&#39;)<br>
+endif<br>
+<br>
=C2=A0foreach k : get_option(&#39;trace_backends&#39;)<br>
=C2=A0 =C2=A0config_host_data.set(&#39;CONFIG_TRACE_&#39; + k.to_upper(), t=
rue)<br>
=C2=A0endforeach<br>
@@ -2207,16 +2220,8 @@ config_host_data.set(&#39;HAVE_VSS_SDK&#39;, have_vs=
s_sdk)<br>
<br>
=C2=A0ignored =3D [&#39;CONFIG_QEMU_INTERP_PREFIX&#39;, # actually per-targ=
et<br>
=C2=A0 =C2=A0 =C2=A0&#39;HAVE_GDB_BIN&#39;]<br>
-arrays =3D [&#39;CONFIG_BDRV_RW_WHITELIST&#39;, &#39;CONFIG_BDRV_RO_WHITEL=
IST&#39;]<br>
=C2=A0foreach k, v: config_host<br>
-=C2=A0 if ignored.contains(k)<br>
-=C2=A0 =C2=A0 # do nothing<br>
-=C2=A0 elif arrays.contains(k)<br>
-=C2=A0 =C2=A0 if v !=3D &#39;&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 v =3D &#39;&quot;&#39; + &#39;&quot;, &quot;&#39;.joi=
n(v.split()) + &#39;&quot;, &#39;<br>
-=C2=A0 =C2=A0 endif<br>
-=C2=A0 =C2=A0 config_host_data.set(k, v)<br>
-=C2=A0 elif k.startswith(&#39;CONFIG_&#39;)<br>
+=C2=A0 if k.startswith(&#39;CONFIG_&#39;) and not ignored.contains(k)<br>
=C2=A0 =C2=A0 =C2=A0config_host_data.set(k, v =3D=3D &#39;y&#39; ? 1 : v)<b=
r>
=C2=A0 =C2=A0endif<br>
=C2=A0endforeach<br>
@@ -3786,8 +3791,8 @@ summary_info =3D {}<br>
=C2=A0summary_info +=3D {&#39;coroutine backend&#39;: config_host[&#39;CONF=
IG_COROUTINE_BACKEND&#39;]}<br>
=C2=A0summary_info +=3D {&#39;coroutine pool&#39;:=C2=A0 =C2=A0 have_corout=
ine_pool}<br>
=C2=A0if have_block<br>
-=C2=A0 summary_info +=3D {&#39;Block whitelist (rw)&#39;: config_host[&#39=
;CONFIG_BDRV_RW_WHITELIST&#39;]}<br>
-=C2=A0 summary_info +=3D {&#39;Block whitelist (ro)&#39;: config_host[&#39=
;CONFIG_BDRV_RO_WHITELIST&#39;]}<br>
+=C2=A0 summary_info +=3D {&#39;Block whitelist (rw)&#39;: get_option(&#39;=
block_drv_rw_whitelist&#39;)}<br>
+=C2=A0 summary_info +=3D {&#39;Block whitelist (ro)&#39;: get_option(&#39;=
block_drv_ro_whitelist&#39;)}<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;Use block whitelist in tools&#39;: get=
_option(&#39;block_drv_whitelist_in_tools&#39;)}<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;VirtFS support&#39;:=C2=A0 =C2=A0 have=
_virtfs}<br>
=C2=A0 =C2=A0summary_info +=3D {&#39;build virtiofs daemon&#39;: have_virti=
ofsd}<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index 891c0ec130..ec974003b3 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -21,6 +21,10 @@ option(&#39;default_devices&#39;, type : &#39;boolean&#3=
9;, value : true,<br>
=C2=A0option(&#39;audio_drv_list&#39;, type: &#39;array&#39;, value: [&#39;=
default&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 choices: [&#39;alsa&#39;, &#39;coreaudio&#39;, =
&#39;default&#39;, &#39;dsound&#39;, &#39;jack&#39;, &#39;oss&#39;, &#39;pa=
&#39;, &#39;sdl&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;Set audio driver list&#39;)<b=
r>
+option(&#39;block_drv_rw_whitelist&#39;, type : &#39;string&#39;, value : =
&#39;&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;set block driver read-write w=
hitelist (by default affects only QEMU, not tools like qemu-img)&#39;)<br>
+option(&#39;block_drv_ro_whitelist&#39;, type : &#39;string&#39;, value : =
&#39;&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;set block driver read-only wh=
itelist (by default affects only QEMU, not tools like qemu-img)&#39;)<br>
=C2=A0option(&#39;fuzzing_engine&#39;, type : &#39;string&#39;, value : &#3=
9;&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;fuzzing engine library for OS=
S-Fuzz&#39;)<br>
=C2=A0option(&#39;trace_file&#39;, type: &#39;string&#39;, value: &#39;trac=
e&#39;,<br>
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh<=
br>
index 0e0548aa87..4c49d4af08 100644<br>
--- a/scripts/meson-buildoptions.sh<br>
+++ b/scripts/meson-buildoptions.sh<br>
@@ -2,6 +2,12 @@<br>
=C2=A0meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --audio-drv-list=3DCHOICES=
 Set audio driver list [default] (choices:&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0alsa/core=
audio/default/dsound/jack/oss/pa/sdl)&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --block-drv-ro-whitelist=3DVALU=
E&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set block driver=
 read-only whitelist (by default&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0affects only QEM=
U, not tools like qemu-img)&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 --block-drv-rw-whitelist=3DVALU=
E&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set block driver=
 read-write whitelist (by default&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0affects only QEM=
U, not tools like qemu-img)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --disable-coroutine-pool c=
oroutine freelist (better performance)&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --disable-install-blobs=C2=
=A0 install provided firmware blobs&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 --enable-block-drv-whiteli=
st-in-tools&#39;<br>
@@ -161,6 +167,8 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-avx2) printf &quot;%s&quot; -Davx2=3Ddisabled=
 ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-avx512f) printf &quot;%s&quot; -Davx512f=3Dena=
bled ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-avx512f) printf &quot;%s&quot; -Davx512f=3Ddi=
sabled ;;<br>
+=C2=A0 =C2=A0 --block-drv-ro-whitelist=3D*) quote_sh &quot;-Dblock_drv_ro_=
whitelist=3D$2&quot; ;;<br>
+=C2=A0 =C2=A0 --block-drv-rw-whitelist=3D*) quote_sh &quot;-Dblock_drv_rw_=
whitelist=3D$2&quot; ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-block-drv-whitelist-in-tools) printf &quot;%s&=
quot; -Dblock_drv_whitelist_in_tools=3Dtrue ;;<br>
=C2=A0 =C2=A0 =C2=A0--disable-block-drv-whitelist-in-tools) printf &quot;%s=
&quot; -Dblock_drv_whitelist_in_tools=3Dfalse ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-bochs) printf &quot;%s&quot; -Dbochs=3Denabled=
 ;;<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000093a93405dd1a285e--

