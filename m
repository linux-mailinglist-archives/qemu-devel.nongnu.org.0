Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C7F2DC56A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:35:41 +0100 (CET)
Received: from localhost ([::1]:36596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpaiC-0003ig-Du
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:35:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpaRr-0005Em-JE
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:18:47 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:46266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kpaRp-0007lg-3A
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:18:47 -0500
Received: by mail-ed1-x529.google.com with SMTP id b73so25630282edf.13
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 09:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0MI/7cy4hDPaH+EmJQ9mRMB36NiW6UqYx9A5KW/6RKA=;
 b=u2EKJfq14hFs9nxEQPGMwFkEpEwdg7xUYZeNGoHKM2Z6CHGaOSDIPxvdvF61gs8Sqb
 2pLORkHvuJrJrFCCzwzIRAVqum7cAQn4X+juMJ0DP5Ild0MmLoCCq67ScD3LCj6RV0IU
 9Gbb11dnxXVAvsuhblqXwJMByQJLNN+uiqOwFfpivwQRsem55UMWKS8PlBSkG+zlGHz0
 HmR+ncvHkMxOJCxKbdmxcguXTzVG/V/J5JsReugO1WUVG1aehWNcqgwUGeB3rwzfmzrr
 gzaiKptngqAmJj8rbVYzdfAlRpQs4gLER8AnizTO3+JtOdtWMnZqE3GRBNb6jxuksRUU
 ajvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0MI/7cy4hDPaH+EmJQ9mRMB36NiW6UqYx9A5KW/6RKA=;
 b=NFggEvuu5C+4uoqFSrj5atI6s5V0Q/AOEaR0xonLHO4cqGbKriDyAx9lG6Cm1OxMF4
 4OptHfE20PywLYCTehWeGcquxG5WCaTRQZdTBGATqA8MO53qzI4cHLBOZhcXepdWgJbS
 H39LWodrY4se3THgXjgktMygntsL419Ilb+gEzsdA5H5OjJANnuIo1c0miwZGHvB7+hs
 V2w6QH3zXMM4WKVAVdysOE2H+ThfulmRZ6douaMLRCYjV2NDce1EDikxknXj34ExyoSY
 +xCNXjsU2IqnHJ49ML9HMf43p5ybGJT5C/LlM/aq1CMMOTg84dUBHgD8YzNcj5lTGyCM
 msow==
X-Gm-Message-State: AOAM530RjqHYhSFu/eVUS5kgq2B6TyDnDgNPSpMJIAk8eXl4bgX6oIYe
 cRktuxkGdfUwj55JiytoommEPNhecuUkaOrxNO8=
X-Google-Smtp-Source: ABdhPJx/IA/IEr+xSjxFZ1M/WlnSUx7gdADEA3fHMt8ch5RZkhCs3Mw0OPRpo5/C7xEOIqPrLTNoaWNF4OOgtZKRYOE=
X-Received: by 2002:a05:6402:1155:: with SMTP id
 g21mr35857499edw.53.1608139123190; 
 Wed, 16 Dec 2020 09:18:43 -0800 (PST)
MIME-Version: 1.0
References: <20201216162006.433850-1-pbonzini@redhat.com>
 <20201216162006.433850-8-pbonzini@redhat.com>
In-Reply-To: <20201216162006.433850-8-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 16 Dec 2020 21:18:30 +0400
Message-ID: <CAJ+F1CJjChSZAbqpSH1u4eBdtXbHuzfQM=Sb7B=Hu+su2NBm3Q@mail.gmail.com>
Subject: Re: [PATCH 7/7] meson: cleanup Kconfig.host handling
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002feedf05b698110f"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x529.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002feedf05b698110f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 16, 2020 at 8:26 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Build the array of command line arguments coming from config_host
> once for all targets.  Add all accelerators to accel/Kconfig so
> that the command line arguments for accelerators can be computed
> easily in the existing "foreach sym: accelerators" loop.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

nice cleanup
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  accel/Kconfig          |  9 +++++++++
>  docs/devel/kconfig.rst | 19 +++++++++----------
>  meson.build            | 43 +++++++++++++++++-------------------------
>  3 files changed, 35 insertions(+), 36 deletions(-)
>
> diff --git a/accel/Kconfig b/accel/Kconfig
> index 2ad94a3839..461104c771 100644
> --- a/accel/Kconfig
> +++ b/accel/Kconfig
> @@ -1,3 +1,12 @@
> +config WHPX
> +    bool
> +
> +config HAX
> +    bool
> +
> +config HVF
> +    bool
> +
>  config TCG
>      bool
>
> diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst
> index 336ba0e8e5..cb2d7ffac0 100644
> --- a/docs/devel/kconfig.rst
> +++ b/docs/devel/kconfig.rst
> @@ -288,21 +288,20 @@ they will include all these symbols and some help
> text on what they do.
>  ----------------
>
>  In some special cases, a configurable element depends on host features
> -that are detected by QEMU's configure script; for example some devices
> -depend on the availability of KVM or on the presence of a library on
> -the host.
> +that are detected by QEMU's configure or ``meson.build`` scripts; for
> +example some devices depend on the availability of KVM or on the presenc=
e
> +of a library on the host.
>
>  These symbols should be listed in ``Kconfig.host`` like this::
>
> -    config KVM
> +    config TPM
>        bool
>
> -and also listed as follows in the top-level Makefile's ``MINIKCONF_ARGS`=
`
> +and also listed as follows in the top-level meson.build's host_kconfig
>  variable::
>
> -    MINIKCONF_ARGS =3D \
> -      $@ $*/config-devices.mak.d $< $(MINIKCONF_INPUTS) \
> -      CONFIG_KVM=3D$(CONFIG_KVM) \
> -      CONFIG_SPICE=3D$(CONFIG_SPICE) \
> -      CONFIG_TPM=3D$(CONFIG_TPM) \
> +    host_kconfig =3D \
> +      ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=3Dy'] : []) + \
> +      ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=3Dy'] : []) + \
> +      ('CONFIG_IVSHMEM' in config_host ? ['CONFIG_IVSHMEM=3Dy'] : []) + =
\
>        ...
> diff --git a/meson.build b/meson.build
> index 0b36fb38f1..bb198f792a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -954,21 +954,19 @@ if link_language =3D=3D 'cpp'
>    }
>  endif
>
> -kconfig_external_symbols =3D [
> -  'CONFIG_KVM',
> -  'CONFIG_XEN',
> -  'CONFIG_TPM',
> -  'CONFIG_SPICE',
> -  'CONFIG_IVSHMEM',
> -  'CONFIG_OPENGL',
> -  'CONFIG_X11',
> -  'CONFIG_VHOST_USER',
> -  'CONFIG_VHOST_VDPA',
> -  'CONFIG_VHOST_KERNEL',
> -  'CONFIG_VIRTFS',
> -  'CONFIG_LINUX',
> -  'CONFIG_PVRDMA',
> -]
> +host_kconfig =3D \
> +  ('CONFIG_TPM' in config_host ? ['CONFIG_TPM=3Dy'] : []) + \
> +  ('CONFIG_SPICE' in config_host ? ['CONFIG_SPICE=3Dy'] : []) + \
> +  ('CONFIG_IVSHMEM' in config_host ? ['CONFIG_IVSHMEM=3Dy'] : []) + \
> +  ('CONFIG_OPENGL' in config_host ? ['CONFIG_OPENGL=3Dy'] : []) + \
> +  ('CONFIG_X11' in config_host ? ['CONFIG_X11=3Dy'] : []) + \
> +  ('CONFIG_VHOST_USER' in config_host ? ['CONFIG_VHOST_USER=3Dy'] : []) =
+ \
> +  ('CONFIG_VHOST_VDPA' in config_host ? ['CONFIG_VHOST_VDPA=3Dy'] : []) =
+ \
> +  ('CONFIG_VHOST_KERNEL' in config_host ? ['CONFIG_VHOST_KERNEL=3Dy'] : =
[])
> + \
> +  ('CONFIG_VIRTFS' in config_host ? ['CONFIG_VIRTFS=3Dy'] : []) + \
> +  ('CONFIG_LINUX' in config_host ? ['CONFIG_LINUX=3Dy'] : []) + \
> +  ('CONFIG_PVRDMA' in config_host ? ['CONFIG_PVRDMA=3Dy'] : [])
> +
>  ignored =3D [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
>
>  default_targets =3D 'CONFIG_DEFAULT_TARGETS' in config_host
> @@ -1003,7 +1001,7 @@ foreach target : target_dirs
>      }
>    endif
>
> -  have_accel =3D false
> +  accel_kconfig =3D []
>    foreach sym: accelerators
>      if sym =3D=3D 'CONFIG_TCG' or target in accelerator_targets.get(sym,=
 [])
>        config_target +=3D { sym: 'y' }
> @@ -1011,10 +1009,10 @@ foreach target : target_dirs
>        if sym =3D=3D 'CONFIG_XEN' and have_xen_pci_passthrough
>          config_target +=3D { 'CONFIG_XEN_PCI_PASSTHROUGH': 'y' }
>        endif
> -      have_accel =3D true
> +      accel_kconfig +=3D [ sym + '=3Dy' ]
>      endif
>    endforeach
> -  if not have_accel
> +  if accel_kconfig.length() =3D=3D 0
>      if default_targets
>        continue
>      endif
> @@ -1068,13 +1066,6 @@ foreach target : target_dirs
>                                                 configuration:
> config_target_data)}
>
>    if target.endswith('-softmmu')
> -    base_kconfig =3D []
> -    foreach sym : kconfig_external_symbols
> -      if sym in config_target or sym in config_host
> -        base_kconfig +=3D '@0@=3Dy'.format(sym)
> -      endif
> -    endforeach
> -
>      config_devices_mak =3D target + '-config-devices.mak'
>      config_devices_mak =3D configure_file(
>        input: ['default-configs/devices' / target + '.mak', 'Kconfig'],
> @@ -1083,7 +1074,7 @@ foreach target : target_dirs
>        capture: true,
>        command: [minikconf, config_host['CONFIG_MINIKCONF_MODE'],
>                  config_devices_mak, '@DEPFILE@', '@INPUT@',
> -                base_kconfig])
> +                host_kconfig, accel_kconfig])
>
>      config_devices_data =3D configuration_data()
>      config_devices =3D keyval.load(config_devices_mak)
> --
> 2.29.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000002feedf05b698110f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 16, 2020 at 8:26 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Bu=
ild the array of command line arguments coming from config_host<br>
once for all targets.=C2=A0 Add all accelerators to accel/Kconfig so<br>
that the command line arguments for accelerators can be computed<br>
easily in the existing &quot;foreach sym: accelerators&quot; loop.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div>n=
ice cleanup<br></div><div class=3D"gmail_quote">Reviewed-by: Marc-Andr=C3=
=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lur=
eau@redhat.com</a>&gt; <div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
---<br>
=C2=A0accel/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 9 +++++++++<b=
r>
=C2=A0docs/devel/kconfig.rst | 19 +++++++++----------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 43 +++++++++++=
++++++-------------------------<br>
=C2=A03 files changed, 35 insertions(+), 36 deletions(-)<br>
<br>
diff --git a/accel/Kconfig b/accel/Kconfig<br>
index 2ad94a3839..461104c771 100644<br>
--- a/accel/Kconfig<br>
+++ b/accel/Kconfig<br>
@@ -1,3 +1,12 @@<br>
+config WHPX<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
+config HAX<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
+config HVF<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
=C2=A0config TCG<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
<br>
diff --git a/docs/devel/kconfig.rst b/docs/devel/kconfig.rst<br>
index 336ba0e8e5..cb2d7ffac0 100644<br>
--- a/docs/devel/kconfig.rst<br>
+++ b/docs/devel/kconfig.rst<br>
@@ -288,21 +288,20 @@ they will include all these symbols and some help tex=
t on what they do.<br>
=C2=A0----------------<br>
<br>
=C2=A0In some special cases, a configurable element depends on host feature=
s<br>
-that are detected by QEMU&#39;s configure script; for example some devices=
<br>
-depend on the availability of KVM or on the presence of a library on<br>
-the host.<br>
+that are detected by QEMU&#39;s configure or ``meson.build`` scripts; for<=
br>
+example some devices depend on the availability of KVM or on the presence<=
br>
+of a library on the host.<br>
<br>
=C2=A0These symbols should be listed in ``Kconfig.host`` like this::<br>
<br>
-=C2=A0 =C2=A0 config KVM<br>
+=C2=A0 =C2=A0 config TPM<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0bool<br>
<br>
-and also listed as follows in the top-level Makefile&#39;s ``MINIKCONF_ARG=
S``<br>
+and also listed as follows in the top-level meson.build&#39;s host_kconfig=
<br>
=C2=A0variable::<br>
<br>
-=C2=A0 =C2=A0 MINIKCONF_ARGS =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 $@ $*/config-devices.mak.d $&lt; $(MINIKCONF_INPUTS) =
\<br>
-=C2=A0 =C2=A0 =C2=A0 CONFIG_KVM=3D$(CONFIG_KVM) \<br>
-=C2=A0 =C2=A0 =C2=A0 CONFIG_SPICE=3D$(CONFIG_SPICE) \<br>
-=C2=A0 =C2=A0 =C2=A0 CONFIG_TPM=3D$(CONFIG_TPM) \<br>
+=C2=A0 =C2=A0 host_kconfig =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 (&#39;CONFIG_TPM&#39; in config_host ? [&#39;CONFIG_T=
PM=3Dy&#39;] : []) + \<br>
+=C2=A0 =C2=A0 =C2=A0 (&#39;CONFIG_SPICE&#39; in config_host ? [&#39;CONFIG=
_SPICE=3Dy&#39;] : []) + \<br>
+=C2=A0 =C2=A0 =C2=A0 (&#39;CONFIG_IVSHMEM&#39; in config_host ? [&#39;CONF=
IG_IVSHMEM=3Dy&#39;] : []) + \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
diff --git a/meson.build b/meson.build<br>
index 0b36fb38f1..bb198f792a 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -954,21 +954,19 @@ if link_language =3D=3D &#39;cpp&#39;<br>
=C2=A0 =C2=A0}<br>
=C2=A0endif<br>
<br>
-kconfig_external_symbols =3D [<br>
-=C2=A0 &#39;CONFIG_KVM&#39;,<br>
-=C2=A0 &#39;CONFIG_XEN&#39;,<br>
-=C2=A0 &#39;CONFIG_TPM&#39;,<br>
-=C2=A0 &#39;CONFIG_SPICE&#39;,<br>
-=C2=A0 &#39;CONFIG_IVSHMEM&#39;,<br>
-=C2=A0 &#39;CONFIG_OPENGL&#39;,<br>
-=C2=A0 &#39;CONFIG_X11&#39;,<br>
-=C2=A0 &#39;CONFIG_VHOST_USER&#39;,<br>
-=C2=A0 &#39;CONFIG_VHOST_VDPA&#39;,<br>
-=C2=A0 &#39;CONFIG_VHOST_KERNEL&#39;,<br>
-=C2=A0 &#39;CONFIG_VIRTFS&#39;,<br>
-=C2=A0 &#39;CONFIG_LINUX&#39;,<br>
-=C2=A0 &#39;CONFIG_PVRDMA&#39;,<br>
-]<br>
+host_kconfig =3D \<br>
+=C2=A0 (&#39;CONFIG_TPM&#39; in config_host ? [&#39;CONFIG_TPM=3Dy&#39;] :=
 []) + \<br>
+=C2=A0 (&#39;CONFIG_SPICE&#39; in config_host ? [&#39;CONFIG_SPICE=3Dy&#39=
;] : []) + \<br>
+=C2=A0 (&#39;CONFIG_IVSHMEM&#39; in config_host ? [&#39;CONFIG_IVSHMEM=3Dy=
&#39;] : []) + \<br>
+=C2=A0 (&#39;CONFIG_OPENGL&#39; in config_host ? [&#39;CONFIG_OPENGL=3Dy&#=
39;] : []) + \<br>
+=C2=A0 (&#39;CONFIG_X11&#39; in config_host ? [&#39;CONFIG_X11=3Dy&#39;] :=
 []) + \<br>
+=C2=A0 (&#39;CONFIG_VHOST_USER&#39; in config_host ? [&#39;CONFIG_VHOST_US=
ER=3Dy&#39;] : []) + \<br>
+=C2=A0 (&#39;CONFIG_VHOST_VDPA&#39; in config_host ? [&#39;CONFIG_VHOST_VD=
PA=3Dy&#39;] : []) + \<br>
+=C2=A0 (&#39;CONFIG_VHOST_KERNEL&#39; in config_host ? [&#39;CONFIG_VHOST_=
KERNEL=3Dy&#39;] : []) + \<br>
+=C2=A0 (&#39;CONFIG_VIRTFS&#39; in config_host ? [&#39;CONFIG_VIRTFS=3Dy&#=
39;] : []) + \<br>
+=C2=A0 (&#39;CONFIG_LINUX&#39; in config_host ? [&#39;CONFIG_LINUX=3Dy&#39=
;] : []) + \<br>
+=C2=A0 (&#39;CONFIG_PVRDMA&#39; in config_host ? [&#39;CONFIG_PVRDMA=3Dy&#=
39;] : [])<br>
+<br>
=C2=A0ignored =3D [ &#39;TARGET_XML_FILES&#39;, &#39;TARGET_ABI_DIR&#39;, &=
#39;TARGET_ARCH&#39; ]<br>
<br>
=C2=A0default_targets =3D &#39;CONFIG_DEFAULT_TARGETS&#39; in config_host<b=
r>
@@ -1003,7 +1001,7 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0endif<br>
<br>
-=C2=A0 have_accel =3D false<br>
+=C2=A0 accel_kconfig =3D []<br>
=C2=A0 =C2=A0foreach sym: accelerators<br>
=C2=A0 =C2=A0 =C2=A0if sym =3D=3D &#39;CONFIG_TCG&#39; or target in acceler=
ator_targets.get(sym, [])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0config_target +=3D { sym: &#39;y&#39; }<br>
@@ -1011,10 +1009,10 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if sym =3D=3D &#39;CONFIG_XEN&#39; and have_xen_=
pci_passthrough<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config_target +=3D { &#39;CONFIG_XEN_PCI_=
PASSTHROUGH&#39;: &#39;y&#39; }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0endif<br>
-=C2=A0 =C2=A0 =C2=A0 have_accel =3D true<br>
+=C2=A0 =C2=A0 =C2=A0 accel_kconfig +=3D [ sym + &#39;=3Dy&#39; ]<br>
=C2=A0 =C2=A0 =C2=A0endif<br>
=C2=A0 =C2=A0endforeach<br>
-=C2=A0 if not have_accel<br>
+=C2=A0 if accel_kconfig.length() =3D=3D 0<br>
=C2=A0 =C2=A0 =C2=A0if default_targets<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
=C2=A0 =C2=A0 =C2=A0endif<br>
@@ -1068,13 +1066,6 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 configuration: config_target_data)}<br>
<br>
=C2=A0 =C2=A0if target.endswith(&#39;-softmmu&#39;)<br>
-=C2=A0 =C2=A0 base_kconfig =3D []<br>
-=C2=A0 =C2=A0 foreach sym : kconfig_external_symbols<br>
-=C2=A0 =C2=A0 =C2=A0 if sym in config_target or sym in config_host<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 base_kconfig +=3D &#39;@0@=3Dy&#39;.format(sym=
)<br>
-=C2=A0 =C2=A0 =C2=A0 endif<br>
-=C2=A0 =C2=A0 endforeach<br>
-<br>
=C2=A0 =C2=A0 =C2=A0config_devices_mak =3D target + &#39;-config-devices.ma=
k&#39;<br>
=C2=A0 =C2=A0 =C2=A0config_devices_mak =3D configure_file(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0input: [&#39;default-configs/devices&#39; / targ=
et + &#39;.mak&#39;, &#39;Kconfig&#39;],<br>
@@ -1083,7 +1074,7 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0capture: true,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0command: [minikconf, config_host[&#39;CONFIG_MIN=
IKCONF_MODE&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config_device=
s_mak, &#39;@DEPFILE@&#39;, &#39;@INPUT@&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base_kconfig])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host_kconfig, acce=
l_kconfig])<br>
<br>
=C2=A0 =C2=A0 =C2=A0config_devices_data =3D configuration_data()<br>
=C2=A0 =C2=A0 =C2=A0config_devices =3D keyval.load(config_devices_mak)<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000002feedf05b698110f--

