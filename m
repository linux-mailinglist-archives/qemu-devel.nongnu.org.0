Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9901C2B2EB1
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 17:58:13 +0100 (CET)
Received: from localhost ([::1]:40474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdysO-0005y6-MN
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 11:58:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kdyqf-0004KU-Il
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 11:56:25 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:44892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kdyqd-0001zi-Hn
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 11:56:25 -0500
Received: by mail-lj1-x242.google.com with SMTP id s9so14651967ljo.11
 for <qemu-devel@nongnu.org>; Sat, 14 Nov 2020 08:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=xJqOpTE1O981dQ1OzL6Q2VHr1lqI36GYx2i1fgDeFK4=;
 b=r+bCewSYXDXBWYlpg4WuQ51gu/RFMu7fEIksI1xCr+MeMrmWZH7atTOicjb1bXO6+P
 feEAHQe8TNenohFIF94QlQvVMVu+kqxWsLG8qDjFxjXMKMOmYgJC7FLuJlYIJ11ADJW3
 aDCzRNwlnKQUiAacJnewXU+cgJXUs856gbhvTuebSNJCn3zP8HLLA0oNWyb3/mvT/uXP
 Qy7R/HNrvLFrnG6EeBlxneS0Uwzf7Lf788c5f2rNEj8LNUqqX7CZPW49FgkKLaaYmqZb
 5ZtZs7GizBoSGwPGPZa0OaOkHf+PU/lAmZq4EE6Z4DwQrW7cl3CgLjL43hmvw2kv5yUz
 texg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=xJqOpTE1O981dQ1OzL6Q2VHr1lqI36GYx2i1fgDeFK4=;
 b=BHo0+rb9KqA1ZCb/IHCgo6fFu4CvIDktgE3wxR0TIVmu9J2enCT+ID5hD42CiGfNP8
 7QIpCNdDAQ11FW5NtRP0S5WeMUou/6i69jvhk6MqUHfDtqYcm5uUrKl7Q6vROPTkhqZI
 nsEir+K91rJClhaYUiNWMxhmI3h8dbgzvZSHZVNG01NnY2wncGviG6CKljQkJ93k3Ll5
 1FarOZTCN3ARUC1WWJo788hypU2p2hEB9nv+pv4Ab6FbvCbrUGfdYn0y5JD0cNXadPfW
 5JBQG9zINv2D1k26wzKshJObDomGB3LZmCNAxnxe/GhSDo9rtHtp3QaMqAPY8DIS+Lgb
 KLzQ==
X-Gm-Message-State: AOAM532kv4y/bPbF5Cjn5bZQtyOES2hcv8CEJrYsERMQOwt4CpU9w1Gq
 mw65gu5FmvZvM5ElOST1sNtkOgelWCDVwnx1cYs=
X-Google-Smtp-Source: ABdhPJzu+moHaEsS0MwiA335X0kIYMUFI3K9smN3iVzEjBPJlDSmG22K0cpaggertUA+tCUyzaFUpl10pO49hj6iU54=
X-Received: by 2002:a05:651c:29c:: with SMTP id
 b28mr3335286ljo.368.1605372979994; 
 Sat, 14 Nov 2020 08:56:19 -0800 (PST)
MIME-Version: 1.0
References: <20201114165137.15379-1-thuth@redhat.com>
 <20201114165137.15379-4-thuth@redhat.com>
In-Reply-To: <20201114165137.15379-4-thuth@redhat.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Sun, 15 Nov 2020 00:56:08 +0800
Message-ID: <CAE2XoE9yU4S=N5eQKaY6NHCVFOQPg+WQFiv05SbrtrUUMWmMQg@mail.gmail.com>
Subject: Re: [PATCH 3/4] configure: Add a proper check for sys/ioccom.h and
 use it in tpm_ioctl.h
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000034655005b4140666"
Received-SPF: pass client-ip=2a00:1450:4864:20::242;
 envelope-from=luoyonggang@gmail.com; helo=mail-lj1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-level <qemu-devel@nongnu.org>, David CARLIER <devnexen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000034655005b4140666
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can we check this in meson.build?

On Sun, Nov 15, 2020 at 12:53 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On Solaris and Haiku, the _IO() macros are defined in <sys/ioccom.h>.
> Add a proper check for this header to our configure scripts, and
> make sure to include the header in tpm_ioctl.h to fix a build failure
> on Solaris and Haiku.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  backends/tpm/tpm_ioctl.h |  4 ++++
>  configure                | 11 ++++++++++-
>  nbd/nbd-internal.h       |  2 +-
>  3 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/backends/tpm/tpm_ioctl.h b/backends/tpm/tpm_ioctl.h
> index f5f5c553a9..bd6c12cb86 100644
> --- a/backends/tpm/tpm_ioctl.h
> +++ b/backends/tpm/tpm_ioctl.h
> @@ -12,6 +12,10 @@
>  #include <sys/uio.h>
>  #include <sys/ioctl.h>
>
> +#ifdef HAVE_SYS_IOCCOM_H
> +#include <sys/ioccom.h>
> +#endif
> +
>  /*
>   * Every response from a command involving a TPM command execution must
hold
>   * the ptm_res as the first element.
> diff --git a/configure b/configure
> index c0acda164d..764e903748 100755
> --- a/configure
> +++ b/configure
> @@ -3123,6 +3123,13 @@ if check_include "sys/signal.h" ; then
>    have_sys_signal_h=3Dyes
>  fi
>
> +#########################################
> +# sys/ioccom.h check
> +have_sys_ioccom_h=3Dno
> +if check_include "sys/ioccom.h" ; then
> +  have_sys_ioccom_h=3Dyes
> +fi
> +
>  ##########################################
>  # VTE probe
>
> @@ -6214,7 +6221,9 @@ fi
>  if test "$have_sys_signal_h" =3D "yes" ; then
>      echo "HAVE_SYS_SIGNAL_H=3Dy" >> $config_host_mak
>  fi
> -
> +if test "$have_sys_ioccom_h" =3D "yes" ; then
> +    echo "HAVE_SYS_IOCCOM_H=3Dy" >> $config_host_mak
> +fi
>  # Work around a system header bug with some kernel/XFS header
>  # versions where they both try to define 'struct fsxattr':
>  # xfs headers will not try to redefine structs from linux headers
> diff --git a/nbd/nbd-internal.h b/nbd/nbd-internal.h
> index 60629ef160..1b2141ab4b 100644
> --- a/nbd/nbd-internal.h
> +++ b/nbd/nbd-internal.h
> @@ -19,7 +19,7 @@
>  #ifndef _WIN32
>  #include <sys/ioctl.h>
>  #endif
> -#if defined(__sun__) || defined(__HAIKU__)
> +#ifdef HAVE_SYS_IOCCOM_H
>  #include <sys/ioccom.h>
>  #endif
>
> --
> 2.18.4
>
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000034655005b4140666
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can we check this in meson.build?<br><br>On Sun, Nov 15, 2=
020 at 12:53 AM Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@r=
edhat.com</a>&gt; wrote:<br>&gt;<br>&gt; On Solaris and Haiku, the _IO() ma=
cros are defined in &lt;sys/ioccom.h&gt;.<br>&gt; Add a proper check for th=
is header to our configure scripts, and<br>&gt; make sure to include the he=
ader in tpm_ioctl.h to fix a build failure<br>&gt; on Solaris and Haiku.<br=
>&gt;<br>&gt; Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat=
.com">thuth@redhat.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0backends/tpm/tpm_i=
octl.h | =C2=A04 ++++<br>&gt; =C2=A0configure =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++++++++++-<br>&gt; =C2=A0nbd/nbd-internal.=
h =C2=A0 =C2=A0 =C2=A0 | =C2=A02 +-<br>&gt; =C2=A03 files changed, 15 inser=
tions(+), 2 deletions(-)<br>&gt;<br>&gt; diff --git a/backends/tpm/tpm_ioct=
l.h b/backends/tpm/tpm_ioctl.h<br>&gt; index f5f5c553a9..bd6c12cb86 100644<=
br>&gt; --- a/backends/tpm/tpm_ioctl.h<br>&gt; +++ b/backends/tpm/tpm_ioctl=
.h<br>&gt; @@ -12,6 +12,10 @@<br>&gt; =C2=A0#include &lt;sys/uio.h&gt;<br>&=
gt; =C2=A0#include &lt;sys/ioctl.h&gt;<br>&gt;<br>&gt; +#ifdef HAVE_SYS_IOC=
COM_H<br>&gt; +#include &lt;sys/ioccom.h&gt;<br>&gt; +#endif<br>&gt; +<br>&=
gt; =C2=A0/*<br>&gt; =C2=A0 * Every response from a command involving a TPM=
 command execution must hold<br>&gt; =C2=A0 * the ptm_res as the first elem=
ent.<br>&gt; diff --git a/configure b/configure<br>&gt; index c0acda164d..7=
64e903748 100755<br>&gt; --- a/configure<br>&gt; +++ b/configure<br>&gt; @@=
 -3123,6 +3123,13 @@ if check_include &quot;sys/signal.h&quot; ; then<br>&g=
t; =C2=A0 =C2=A0have_sys_signal_h=3Dyes<br>&gt; =C2=A0fi<br>&gt;<br>&gt; +#=
########################################<br>&gt; +# sys/ioccom.h check<br>&=
gt; +have_sys_ioccom_h=3Dno<br>&gt; +if check_include &quot;sys/ioccom.h&qu=
ot; ; then<br>&gt; + =C2=A0have_sys_ioccom_h=3Dyes<br>&gt; +fi<br>&gt; +<br=
>&gt; =C2=A0##########################################<br>&gt; =C2=A0# VTE =
probe<br>&gt;<br>&gt; @@ -6214,7 +6221,9 @@ fi<br>&gt; =C2=A0if test &quot;=
$have_sys_signal_h&quot; =3D &quot;yes&quot; ; then<br>&gt; =C2=A0 =C2=A0 =
=C2=A0echo &quot;HAVE_SYS_SIGNAL_H=3Dy&quot; &gt;&gt; $config_host_mak<br>&=
gt; =C2=A0fi<br>&gt; -<br>&gt; +if test &quot;$have_sys_ioccom_h&quot; =3D =
&quot;yes&quot; ; then<br>&gt; + =C2=A0 =C2=A0echo &quot;HAVE_SYS_IOCCOM_H=
=3Dy&quot; &gt;&gt; $config_host_mak<br>&gt; +fi<br>&gt; =C2=A0# Work aroun=
d a system header bug with some kernel/XFS header<br>&gt; =C2=A0# versions =
where they both try to define &#39;struct fsxattr&#39;:<br>&gt; =C2=A0# xfs=
 headers will not try to redefine structs from linux headers<br>&gt; diff -=
-git a/nbd/nbd-internal.h b/nbd/nbd-internal.h<br>&gt; index 60629ef160..1b=
2141ab4b 100644<br>&gt; --- a/nbd/nbd-internal.h<br>&gt; +++ b/nbd/nbd-inte=
rnal.h<br>&gt; @@ -19,7 +19,7 @@<br>&gt; =C2=A0#ifndef _WIN32<br>&gt; =C2=
=A0#include &lt;sys/ioctl.h&gt;<br>&gt; =C2=A0#endif<br>&gt; -#if defined(_=
_sun__) || defined(__HAIKU__)<br>&gt; +#ifdef HAVE_SYS_IOCCOM_H<br>&gt; =C2=
=A0#include &lt;sys/ioccom.h&gt;<br>&gt; =C2=A0#endif<br>&gt;<br>&gt; --<br=
>&gt; 2.18.4<br>&gt;<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br>You=
rs<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div>

--00000000000034655005b4140666--

