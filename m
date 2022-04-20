Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A5C508DA1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:47:14 +0200 (CEST)
Received: from localhost ([::1]:39420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDU1-0002iU-2X
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:47:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhDBC-0000cB-QZ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:27:46 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:46780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhDBA-0000zp-CT
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:27:46 -0400
Received: by mail-qv1-xf36.google.com with SMTP id i14so1672267qvk.13
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 09:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kPO0y33zN1K9KzBsaMA3DZdblmXJUcWTBoKEgZ1nOO4=;
 b=p17k7AsFm2Xtsajunc+x85qyryJ5U9TwOzT/Aj5TJJXCndsi1J2thWE1oEvcP+ZiO2
 sHlU34WrdbdcSqZHxa9TRmOzjVwUFkCxf/rvG79qE1XkemlyRMlpOAWjQYHioeO5oJ3n
 NAOGJiMf6M5o5cEJvGGiYxOAzNzL7YPFciWU/noyPIyzOfsoJcXv0cjJymP0YNiF9tf8
 lkQ3OWjVsTMhDeimbXLDGRNcU33k9FV9LSvgQleNCxyA/bwW23Z88tV37djCRVeiD3vX
 nuFFWlT/FHVhRkRZii34WWZTryr01244g1E5pwwfZVSXd993k2i6RsJLeaVbm11GHVQG
 eYXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kPO0y33zN1K9KzBsaMA3DZdblmXJUcWTBoKEgZ1nOO4=;
 b=uB3rSwng4W/j0iXmVpkj5HikeMBnoZIhk4baPxcWPVIBB16IJU1lqQJM+pYS0BFzsS
 d3JOFYzydMnqLfKbhyxhwxqApzxgAKQUvvpWvvag0cMWiy46dOgdgoxy1OXjMCy6jTLk
 zdccU/A59hsoI5d9fPSF9ZVtcbIT4hNEKrcjjpV2ue0iSLQejuneoh1doML/e6PH5LHZ
 zamQDWPj3bNgfkKaiCDJb7eNK9J8AOOTKpd4Ub2b40/YuYE+8VSDkkfqhihcwxHIH5Dp
 xtSqqKbsEm/En2c5NxyuU5Vet+WPlPhTP5Qenq6kdvtuVog97ULeNJARX7i2BhSSOLW/
 rhQA==
X-Gm-Message-State: AOAM532TX3pq9KbNsjQJdR7XmeOpgIlTXbXiKy3H8UMfuqf2ImVd3njj
 +igl9gTqDiQ5p+sbOq8IFDV8vG5WIJiTytjaD9g=
X-Google-Smtp-Source: ABdhPJxNCGi9Kwr+6OaKoL9pZK2sEWjlHGoso8LUavFVwXWaWhsY8BhZ2NGNUHHk9Ba6S7nrtTZ/N+Djx1eXcAVPZ0A=
X-Received: by 2002:a05:6214:1c8f:b0:443:8505:14b3 with SMTP id
 ib15-20020a0562141c8f00b00443850514b3mr16535719qvb.7.1650472062959; Wed, 20
 Apr 2022 09:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-10-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-10-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 20:27:31 +0400
Message-ID: <CAJ+F1C+A_Ps67gv-uG_Cgkh3ct_ftUbQz2Eko=mOTapXaa8fyg@mail.gmail.com>
Subject: Re: [PATCH 09/34] meson, configure: move keyctl test to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000000644d705dd187980"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qv1-xf36.google.com
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

--0000000000000644d705dd187980
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 7:43 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  configure                     | 44 -----------------------------------
>  crypto/meson.build            |  4 +++-
>  meson.build                   | 15 +++++++++++-
>  meson_options.txt             |  2 ++
>  scripts/meson-buildoptions.sh |  3 +++
>  5 files changed, 22 insertions(+), 46 deletions(-)
>
> diff --git a/configure b/configure
> index cfd15c3518..1c74d2c5f2 100755
> --- a/configure
> +++ b/configure
> @@ -322,7 +322,6 @@ trace_file=3D"trace"
>  coroutine=3D""
>  tls_priority=3D"NORMAL"
>  plugins=3D"$default_feature"
> -secret_keyring=3D"$default_feature"
>  meson=3D""
>  meson_args=3D""
>  ninja=3D""
> @@ -1009,10 +1008,6 @@ for opt do
>    ;;
>    --gdb=3D*) gdb_bin=3D"$optarg"
>    ;;
> -  --enable-keyring) secret_keyring=3D"yes"
> -  ;;
> -  --disable-keyring) secret_keyring=3D"no"
> -  ;;
>    --enable-gio) gio=3Dyes
>    ;;
>    --disable-gio) gio=3Dno
> @@ -2440,41 +2435,6 @@ case "$slirp" in
>      ;;
>  esac
>
> -##########################################
> -# check for usable __NR_keyctl syscall
> -
> -if test "$linux" =3D "yes" ; then
> -
> -    have_keyring=3Dno
> -    cat > $TMPC << EOF
> -#include <errno.h>
> -#include <asm/unistd.h>
> -#include <linux/keyctl.h>
> -#include <unistd.h>
> -int main(void) {
> -    return syscall(__NR_keyctl, KEYCTL_READ, 0, NULL, NULL, 0);
> -}
> -EOF
> -    if compile_prog "" "" ; then
> -        have_keyring=3Dyes
> -    fi
> -fi
> -if test "$secret_keyring" !=3D "no"
> -then
> -    if test "$have_keyring" =3D "yes"
> -    then
> -       secret_keyring=3Dyes
> -    else
> -       if test "$secret_keyring" =3D "yes"
> -       then
> -           error_exit "syscall __NR_keyctl requested, \
> -but not implemented on your system"
> -       else
> -           secret_keyring=3Dno
> -       fi
> -    fi
> -fi
> -
>  ##########################################
>  # End of CC checks
>  # After here, no more $cc or $ld runs
> @@ -2760,10 +2720,6 @@ if test -n "$gdb_bin"; then
>      fi
>  fi
>
> -if test "$secret_keyring" =3D "yes" ; then
> -  echo "CONFIG_SECRET_KEYRING=3Dy" >> $config_host_mak
> -fi
> -
>  echo "ROMS=3D$roms" >> $config_host_mak
>  echo "MAKE=3D$make" >> $config_host_mak
>  echo "PYTHON=3D$python" >> $config_host_mak
> diff --git a/crypto/meson.build b/crypto/meson.build
> index 19c44bea89..f065f2f277 100644
> --- a/crypto/meson.build
> +++ b/crypto/meson.build
> @@ -34,7 +34,9 @@ else
>    crypto_ss.add(files('hash-glib.c', 'hmac-glib.c', 'pbkdf-stub.c'))
>  endif
>
> -crypto_ss.add(when: 'CONFIG_SECRET_KEYRING', if_true:
> files('secret_keyring.c'))
> +if have_keyring
> +  crypto_ss.add(files('secret_keyring.c'))
> +endif
>  if have_afalg
>    crypto_ss.add(if_true: files('afalg.c', 'cipher-afalg.c',
> 'hash-afalg.c'))
>  endif
> diff --git a/meson.build b/meson.build
> index bdee186702..066bb69174 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1938,6 +1938,19 @@ config_host_data.set('CONFIG_GETAUXVAL',
> cc.links(gnu_source_prefix + '''
>      return getauxval(AT_HWCAP) =3D=3D 0;
>    }'''))
>
> +have_keyring =3D get_option('keyring') \
> +  .require(targetos =3D=3D 'linux', error_message: 'keyring is only avai=
lable
> on Linux') \
> +  .require(cc.compiles('''
> +    #include <errno.h>
> +    #include <asm/unistd.h>
> +    #include <linux/keyctl.h>
> +    #include <sys/syscall.h>
> +    #include <unistd.h>
> +    int main(void) {
> +        return syscall(__NR_keyctl, KEYCTL_READ, 0, NULL, NULL, 0);
> +    }'''), error_message: 'keyctl syscall not available on this
> system').allowed()
> +config_host_data.set('CONFIG_SECRET_KEYRING', have_keyring)
> +
>  have_cpuid_h =3D cc.links('''
>    #include <cpuid.h>
>    int main(void) {
> @@ -3684,7 +3697,7 @@ if nettle.found()
>  endif
>  summary_info +=3D {'AF_ALG support':    have_afalg}
>  summary_info +=3D {'rng-none':          get_option('rng_none')}
> -summary_info +=3D {'Linux keyring':
>  config_host.has_key('CONFIG_SECRET_KEYRING')}
> +summary_info +=3D {'Linux keyring':     have_keyring}
>  summary(summary_info, bool_yn: true, section: 'Crypto')
>
>  # Libraries
> diff --git a/meson_options.txt b/meson_options.txt
> index c00e0866e9..d58c69315c 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -90,6 +90,8 @@ option('avx2', type: 'feature', value: 'auto',
>         description: 'AVX2 optimizations')
>  option('avx512f', type: 'feature', value: 'disabled',
>         description: 'AVX512F optimizations')
> +option('keyring', type: 'feature', value: 'auto',
> +       description: 'Linux keyring support')
>
>  option('attr', type : 'feature', value : 'auto',
>         description: 'attr/xattr support')
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.s=
h
> index cd922614e8..0daeb11fd3 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -68,6 +68,7 @@ meson_options_help() {
>    printf "%s\n" '  hvf             HVF acceleration support'
>    printf "%s\n" '  iconv           Font glyph conversion support'
>    printf "%s\n" '  jack            JACK sound support'
> +  printf "%s\n" '  keyring         Linux keyring support'
>    printf "%s\n" '  kvm             KVM acceleration support'
>    printf "%s\n" '  l2tpv3          l2tpv3 network backend support'
>    printf "%s\n" '  libdaxctl       libdaxctl support'
> @@ -229,6 +230,8 @@ _meson_option_parse() {
>      --disable-install-blobs) printf "%s" -Dinstall_blobs=3Dfalse ;;
>      --enable-jack) printf "%s" -Djack=3Denabled ;;
>      --disable-jack) printf "%s" -Djack=3Ddisabled ;;
> +    --enable-keyring) printf "%s" -Dkeyring=3Denabled ;;
> +    --disable-keyring) printf "%s" -Dkeyring=3Ddisabled ;;
>      --enable-kvm) printf "%s" -Dkvm=3Denabled ;;
>      --disable-kvm) printf "%s" -Dkvm=3Ddisabled ;;
>      --enable-l2tpv3) printf "%s" -Dl2tpv3=3Denabled ;;
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000000644d705dd187980
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:43 PM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sign=
ed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><div=
><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;</di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 44 -----------------------------------<br>
=C2=A0crypto/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4=
 +++-<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 15 +++++++++++-<br>
=C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 ++<br>
=C2=A0scripts/meson-buildoptions.sh |=C2=A0 3 +++<br>
=C2=A05 files changed, 22 insertions(+), 46 deletions(-)<br>
<br>
diff --git a/configure b/configure<br>
index cfd15c3518..1c74d2c5f2 100755<br>
--- a/configure<br>
+++ b/configure<br>
@@ -322,7 +322,6 @@ trace_file=3D&quot;trace&quot;<br>
=C2=A0coroutine=3D&quot;&quot;<br>
=C2=A0tls_priority=3D&quot;NORMAL&quot;<br>
=C2=A0plugins=3D&quot;$default_feature&quot;<br>
-secret_keyring=3D&quot;$default_feature&quot;<br>
=C2=A0meson=3D&quot;&quot;<br>
=C2=A0meson_args=3D&quot;&quot;<br>
=C2=A0ninja=3D&quot;&quot;<br>
@@ -1009,10 +1008,6 @@ for opt do<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--gdb=3D*) gdb_bin=3D&quot;$optarg&quot;<br>
=C2=A0 =C2=A0;;<br>
-=C2=A0 --enable-keyring) secret_keyring=3D&quot;yes&quot;<br>
-=C2=A0 ;;<br>
-=C2=A0 --disable-keyring) secret_keyring=3D&quot;no&quot;<br>
-=C2=A0 ;;<br>
=C2=A0 =C2=A0--enable-gio) gio=3Dyes<br>
=C2=A0 =C2=A0;;<br>
=C2=A0 =C2=A0--disable-gio) gio=3Dno<br>
@@ -2440,41 +2435,6 @@ case &quot;$slirp&quot; in<br>
=C2=A0 =C2=A0 =C2=A0;;<br>
=C2=A0esac<br>
<br>
-##########################################<br>
-# check for usable __NR_keyctl syscall<br>
-<br>
-if test &quot;$linux&quot; =3D &quot;yes&quot; ; then<br>
-<br>
-=C2=A0 =C2=A0 have_keyring=3Dno<br>
-=C2=A0 =C2=A0 cat &gt; $TMPC &lt;&lt; EOF<br>
-#include &lt;errno.h&gt;<br>
-#include &lt;asm/unistd.h&gt;<br>
-#include &lt;linux/keyctl.h&gt;<br>
-#include &lt;unistd.h&gt;<br>
-int main(void) {<br>
-=C2=A0 =C2=A0 return syscall(__NR_keyctl, KEYCTL_READ, 0, NULL, NULL, 0);<=
br>
-}<br>
-EOF<br>
-=C2=A0 =C2=A0 if compile_prog &quot;&quot; &quot;&quot; ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 have_keyring=3Dyes<br>
-=C2=A0 =C2=A0 fi<br>
-fi<br>
-if test &quot;$secret_keyring&quot; !=3D &quot;no&quot;<br>
-then<br>
-=C2=A0 =C2=A0 if test &quot;$have_keyring&quot; =3D &quot;yes&quot;<br>
-=C2=A0 =C2=A0 then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0secret_keyring=3Dyes<br>
-=C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if test &quot;$secret_keyring&quot; =3D &quot;y=
es&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_exit &quot;syscall __NR_key=
ctl requested, \<br>
-but not implemented on your system&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0secret_keyring=3Dno<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 fi<br>
-fi<br>
-<br>
=C2=A0##########################################<br>
=C2=A0# End of CC checks<br>
=C2=A0# After here, no more $cc or $ld runs<br>
@@ -2760,10 +2720,6 @@ if test -n &quot;$gdb_bin&quot;; then<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0fi<br>
<br>
-if test &quot;$secret_keyring&quot; =3D &quot;yes&quot; ; then<br>
-=C2=A0 echo &quot;CONFIG_SECRET_KEYRING=3Dy&quot; &gt;&gt; $config_host_ma=
k<br>
-fi<br>
-<br>
=C2=A0echo &quot;ROMS=3D$roms&quot; &gt;&gt; $config_host_mak<br>
=C2=A0echo &quot;MAKE=3D$make&quot; &gt;&gt; $config_host_mak<br>
=C2=A0echo &quot;PYTHON=3D$python&quot; &gt;&gt; $config_host_mak<br>
diff --git a/crypto/meson.build b/crypto/meson.build<br>
index 19c44bea89..f065f2f277 100644<br>
--- a/crypto/meson.build<br>
+++ b/crypto/meson.build<br>
@@ -34,7 +34,9 @@ else<br>
=C2=A0 =C2=A0crypto_ss.add(files(&#39;hash-glib.c&#39;, &#39;hmac-glib.c&#3=
9;, &#39;pbkdf-stub.c&#39;))<br>
=C2=A0endif<br>
<br>
-crypto_ss.add(when: &#39;CONFIG_SECRET_KEYRING&#39;, if_true: files(&#39;s=
ecret_keyring.c&#39;))<br>
+if have_keyring<br>
+=C2=A0 crypto_ss.add(files(&#39;secret_keyring.c&#39;))<br>
+endif<br>
=C2=A0if have_afalg<br>
=C2=A0 =C2=A0crypto_ss.add(if_true: files(&#39;afalg.c&#39;, &#39;cipher-af=
alg.c&#39;, &#39;hash-afalg.c&#39;))<br>
=C2=A0endif<br>
diff --git a/meson.build b/meson.build<br>
index bdee186702..066bb69174 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1938,6 +1938,19 @@ config_host_data.set(&#39;CONFIG_GETAUXVAL&#39;, cc.=
links(gnu_source_prefix + &#39;&#39;&#39;<br>
=C2=A0 =C2=A0 =C2=A0return getauxval(AT_HWCAP) =3D=3D 0;<br>
=C2=A0 =C2=A0}&#39;&#39;&#39;))<br>
<br>
+have_keyring =3D get_option(&#39;keyring&#39;) \<br>
+=C2=A0 .require(targetos =3D=3D &#39;linux&#39;, error_message: &#39;keyri=
ng is only available on Linux&#39;) \<br>
+=C2=A0 .require(cc.compiles(&#39;&#39;&#39;<br>
+=C2=A0 =C2=A0 #include &lt;errno.h&gt;<br>
+=C2=A0 =C2=A0 #include &lt;asm/unistd.h&gt;<br>
+=C2=A0 =C2=A0 #include &lt;linux/keyctl.h&gt;<br>
+=C2=A0 =C2=A0 #include &lt;sys/syscall.h&gt;<br>
+=C2=A0 =C2=A0 #include &lt;unistd.h&gt;<br>
+=C2=A0 =C2=A0 int main(void) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return syscall(__NR_keyctl, KEYCTL_READ, 0, NU=
LL, NULL, 0);<br>
+=C2=A0 =C2=A0 }&#39;&#39;&#39;), error_message: &#39;keyctl syscall not av=
ailable on this system&#39;).allowed()<br>
+config_host_data.set(&#39;CONFIG_SECRET_KEYRING&#39;, have_keyring)<br>
+<br>
=C2=A0have_cpuid_h =3D cc.links(&#39;&#39;&#39;<br>
=C2=A0 =C2=A0#include &lt;cpuid.h&gt;<br>
=C2=A0 =C2=A0int main(void) {<br>
@@ -3684,7 +3697,7 @@ if nettle.found()<br>
=C2=A0endif<br>
=C2=A0summary_info +=3D {&#39;AF_ALG support&#39;:=C2=A0 =C2=A0 have_afalg}=
<br>
=C2=A0summary_info +=3D {&#39;rng-none&#39;:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 get_option(&#39;rng_none&#39;)}<br>
-summary_info +=3D {&#39;Linux keyring&#39;:=C2=A0 =C2=A0 =C2=A0config_host=
.has_key(&#39;CONFIG_SECRET_KEYRING&#39;)}<br>
+summary_info +=3D {&#39;Linux keyring&#39;:=C2=A0 =C2=A0 =C2=A0have_keyrin=
g}<br>
=C2=A0summary(summary_info, bool_yn: true, section: &#39;Crypto&#39;)<br>
<br>
=C2=A0# Libraries<br>
diff --git a/meson_options.txt b/meson_options.txt<br>
index c00e0866e9..d58c69315c 100644<br>
--- a/meson_options.txt<br>
+++ b/meson_options.txt<br>
@@ -90,6 +90,8 @@ option(&#39;avx2&#39;, type: &#39;feature&#39;, value: &#=
39;auto&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;AVX2 optimizations&#39;)<br>
=C2=A0option(&#39;avx512f&#39;, type: &#39;feature&#39;, value: &#39;disabl=
ed&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;AVX512F optimizations&#39;)<b=
r>
+option(&#39;keyring&#39;, type: &#39;feature&#39;, value: &#39;auto&#39;,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0description: &#39;Linux keyring support&#39;)<b=
r>
<br>
=C2=A0option(&#39;attr&#39;, type : &#39;feature&#39;, value : &#39;auto&#3=
9;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 description: &#39;attr/xattr support&#39;)<br>
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh<=
br>
index cd922614e8..0daeb11fd3 100644<br>
--- a/scripts/meson-buildoptions.sh<br>
+++ b/scripts/meson-buildoptions.sh<br>
@@ -68,6 +68,7 @@ meson_options_help() {<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 hvf=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0HVF acceleration support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 iconv=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Font glyph conversion support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 jack=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 JACK sound support&#39;<br>
+=C2=A0 printf &quot;%s\n&quot; &#39;=C2=A0 keyring=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Linux keyring support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 kvm=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0KVM acceleration support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 l2tpv3=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 l2tpv3 network backend support&#39;<br>
=C2=A0 =C2=A0printf &quot;%s\n&quot; &#39;=C2=A0 libdaxctl=C2=A0 =C2=A0 =C2=
=A0 =C2=A0libdaxctl support&#39;<br>
@@ -229,6 +230,8 @@ _meson_option_parse() {<br>
=C2=A0 =C2=A0 =C2=A0--disable-install-blobs) printf &quot;%s&quot; -Dinstal=
l_blobs=3Dfalse ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-jack) printf &quot;%s&quot; -Djack=3Denabled ;=
;<br>
=C2=A0 =C2=A0 =C2=A0--disable-jack) printf &quot;%s&quot; -Djack=3Ddisabled=
 ;;<br>
+=C2=A0 =C2=A0 --enable-keyring) printf &quot;%s&quot; -Dkeyring=3Denabled =
;;<br>
+=C2=A0 =C2=A0 --disable-keyring) printf &quot;%s&quot; -Dkeyring=3Ddisable=
d ;;<br>
=C2=A0 =C2=A0 =C2=A0--enable-kvm) printf &quot;%s&quot; -Dkvm=3Denabled ;;<=
br>
=C2=A0 =C2=A0 =C2=A0--disable-kvm) printf &quot;%s&quot; -Dkvm=3Ddisabled ;=
;<br>
=C2=A0 =C2=A0 =C2=A0--enable-l2tpv3) printf &quot;%s&quot; -Dl2tpv3=3Denabl=
ed ;;<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000000644d705dd187980--

