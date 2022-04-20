Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F5E508E1A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 19:11:13 +0200 (CEST)
Received: from localhost ([::1]:40270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDrE-0001KG-OQ
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 13:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhDS7-0001q7-Kz
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:45:15 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:40507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nhDS5-0003ja-LC
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:45:15 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id hu11so1729507qvb.7
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 09:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z33BrgzFqSXpmPlS8pKtuwc/80Sm/3Wp4jUt08Iiptw=;
 b=fycU+wsLoCkgDRtcRAjCfet7ipS+twoVE8SxSYP17kIe0qL5zBgbEofA3i55mE3NIX
 ar6JsEdiSrSFuyv8SBHNQaG7NosvNANhGndbQyvalQ6lQn3ERJYV+tuiDrHK3oTMI7X1
 Q8GH+5R8z6WSRCi0ZPV9b835CMBoR2n7bnan0ob7RXDow9c54uDLXobEX3IjApRnP6Vw
 i667nFLGRAlAPJOE7TQAlQ+V2MkaIfLGIp9retVDqxs1xtEXu77F1CzO6l1jhzPBHU+f
 RIcKOT8WArocMGfPuuXOSCeZKrqXhmVGPB8XMY0yrOAX51ZZ3sqPKW1l2Q42GqXFcIPK
 rkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z33BrgzFqSXpmPlS8pKtuwc/80Sm/3Wp4jUt08Iiptw=;
 b=gL+douaKR8No7gUaqPhD+egedzTVHJdMK3/M7U3rZBfGN5L+z2UPf2QdFrcZQlD0K6
 1h2pZEwE/d0/p3le5jF6nkdTVT8FVHoqWFDQ6enxXbGnDGG0p2ECM/ktIYZJzktOccFe
 9zKXd1DouDgBYsL1MLKaP/5l15pkPe/fkdroyD8nsyNNTgZJ9PJDKEHkXrHuVkbPqI1o
 3H0KW6an1X0MAwvMosYnHxHu8ioeAvVNAoKEnvXgvEOwJ74Mkk8a21F/Mxpnh5E0nH4d
 Q9TwiczXkhgyDxT+GVRDV1/b75LDAPtdY5jdRvM9H9U/hrh1AbPtnQW1SS4iEjgF3DoX
 bxnQ==
X-Gm-Message-State: AOAM5328w0TPCXmMeHHy6dmTg9bzZVrk5SyyT91OSIp37SHRRCBcdbvP
 kork+i0mnckChSKfanD/qc5+nnsGIkOkvVH7uP8=
X-Google-Smtp-Source: ABdhPJzivTTvGyE79/tsaf9x7XnrIuFmuViOaIq4RXId17SlaakMl5/XsVE5KWxqpDgmMbMALIyIBXP7AaGDOd6dBZU=
X-Received: by 2002:a05:6214:262c:b0:446:3464:57cd with SMTP id
 gv12-20020a056214262c00b00446346457cdmr16177709qvb.89.1650473112666; Wed, 20
 Apr 2022 09:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220420153407.73926-1-pbonzini@redhat.com>
 <20220420153407.73926-13-pbonzini@redhat.com>
In-Reply-To: <20220420153407.73926-13-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 20 Apr 2022 20:45:01 +0400
Message-ID: <CAJ+F1CL2ogdER1R=VY_ihHwWh3TwxUPVN3uD=MaR_h9ndkJ_=w@mail.gmail.com>
Subject: Re: [PATCH 12/34] meson: move CONFIG_XEN_PCI_PASSTHROUGH to
 config-host.h
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000097884c05dd18b771"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qv1-xf2c.google.com
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

--00000000000097884c05dd18b771
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Apr 20, 2022 at 8:02 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> CONFIG_XEN_PCI_PASSTHROUGH is just a global configuration option; the
> selection
> of the actual files in hw/xen/meson.build is also conditional on
> CONFIG_XEN,
> so there is no need to put CONFIG_XEN_PCI_PASSTHROUGH in config-target.h.
>
> This inaccuracy was copied over from the configure script in commit
> 8a19980e3f ("configure: move accelerator logic to meson", 2020-10-03).
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/xen/meson.build | 20 ++++++++++++--------
>  meson.build        |  3 +--
>  2 files changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/hw/xen/meson.build b/hw/xen/meson.build
> index 076954b89c..08dc1f6857 100644
> --- a/hw/xen/meson.build
> +++ b/hw/xen/meson.build
> @@ -8,13 +8,17 @@ softmmu_ss.add(when: ['CONFIG_XEN', xen], if_true: file=
s(
>  ))
>
>  xen_specific_ss =3D ss.source_set()
> -xen_specific_ss.add(when: 'CONFIG_XEN_PCI_PASSTHROUGH', if_true: files(
> -  'xen-host-pci-device.c',
> -  'xen_pt.c',
> -  'xen_pt_config_init.c',
> -  'xen_pt_graphics.c',
> -  'xen_pt_load_rom.c',
> -  'xen_pt_msi.c',
> -), if_false: files('xen_pt_stub.c'))
> +if have_xen_pci_passthrough
> +  xen_specific_ss.add(files(
> +    'xen-host-pci-device.c',
> +    'xen_pt.c',
> +    'xen_pt_config_init.c',
> +    'xen_pt_graphics.c',
> +    'xen_pt_load_rom.c',
> +    'xen_pt_msi.c',
> +  ))
> +else
> +  xen_specific_ss.add('xen_pt_stub.c')
> +endif
>
>  specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
> diff --git a/meson.build b/meson.build
> index b8046efcf1..84156df809 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1627,6 +1627,7 @@ config_host_data.set('CONFIG_X11', x11.found())
>  config_host_data.set('CONFIG_DBUS_DISPLAY', dbus_display)
>  config_host_data.set('CONFIG_CFI', get_option('cfi'))
>  config_host_data.set('CONFIG_SELINUX', selinux.found())
> +config_host_data.set('CONFIG_XEN_PCI_PASSTHROUGH',
> have_xen_pci_passthrough)
>

afaict, nothing uses this then.


>  config_host_data.set('QEMU_VERSION', '"@0@
> "'.format(meson.project_version()))
>  config_host_data.set('QEMU_VERSION_MAJOR',
> meson.project_version().split('.')[0])
>  config_host_data.set('QEMU_VERSION_MINOR',
> meson.project_version().split('.')[1])
> @@ -2228,8 +2229,6 @@ foreach target : target_dirs
>        config_all +=3D { sym: 'y' }
>        if sym =3D=3D 'CONFIG_TCG' and tcg_arch =3D=3D 'tci'
>          config_target +=3D { 'CONFIG_TCG_INTERPRETER': 'y' }
> -      elif sym =3D=3D 'CONFIG_XEN' and have_xen_pci_passthrough
> -        config_target +=3D { 'CONFIG_XEN_PCI_PASSTHROUGH': 'y' }
>        endif
>        if target in modular_tcg
>          config_target +=3D { 'CONFIG_TCG_MODULAR': 'y' }
> --
> 2.35.1
>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000097884c05dd18b771
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 8:02 PM Pao=
lo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">CO=
NFIG_XEN_PCI_PASSTHROUGH is just a global configuration option; the selecti=
on<br>
of the actual files in hw/xen/meson.build is also conditional on CONFIG_XEN=
,<br>
so there is no need to put CONFIG_XEN_PCI_PASSTHROUGH in config-target.h.<b=
r>
<br>
This inaccuracy was copied over from the configure script in commit<br>
8a19980e3f (&quot;configure: move accelerator logic to meson&quot;, 2020-10=
-03).<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/xen/meson.build | 20 ++++++++++++--------<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +--<br>
=C2=A02 files changed, 13 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/hw/xen/meson.build b/hw/xen/meson.build<br>
index 076954b89c..08dc1f6857 100644<br>
--- a/hw/xen/meson.build<br>
+++ b/hw/xen/meson.build<br>
@@ -8,13 +8,17 @@ softmmu_ss.add(when: [&#39;CONFIG_XEN&#39;, xen], if_true=
: files(<br>
=C2=A0))<br>
<br>
=C2=A0xen_specific_ss =3D ss.source_set()<br>
-xen_specific_ss.add(when: &#39;CONFIG_XEN_PCI_PASSTHROUGH&#39;, if_true: f=
iles(<br>
-=C2=A0 &#39;xen-host-pci-device.c&#39;,<br>
-=C2=A0 &#39;xen_pt.c&#39;,<br>
-=C2=A0 &#39;xen_pt_config_init.c&#39;,<br>
-=C2=A0 &#39;xen_pt_graphics.c&#39;,<br>
-=C2=A0 &#39;xen_pt_load_rom.c&#39;,<br>
-=C2=A0 &#39;xen_pt_msi.c&#39;,<br>
-), if_false: files(&#39;xen_pt_stub.c&#39;))<br>
+if have_xen_pci_passthrough<br>
+=C2=A0 xen_specific_ss.add(files(<br>
+=C2=A0 =C2=A0 &#39;xen-host-pci-device.c&#39;,<br>
+=C2=A0 =C2=A0 &#39;xen_pt.c&#39;,<br>
+=C2=A0 =C2=A0 &#39;xen_pt_config_init.c&#39;,<br>
+=C2=A0 =C2=A0 &#39;xen_pt_graphics.c&#39;,<br>
+=C2=A0 =C2=A0 &#39;xen_pt_load_rom.c&#39;,<br>
+=C2=A0 =C2=A0 &#39;xen_pt_msi.c&#39;,<br>
+=C2=A0 ))<br>
+else<br>
+=C2=A0 xen_specific_ss.add(&#39;xen_pt_stub.c&#39;)<br>
+endif<br>
<br>
=C2=A0specific_ss.add_all(when: [&#39;CONFIG_XEN&#39;, xen], if_true: xen_s=
pecific_ss)<br>
diff --git a/meson.build b/meson.build<br>
index b8046efcf1..84156df809 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1627,6 +1627,7 @@ config_host_data.set(&#39;CONFIG_X11&#39;, x11.found(=
))<br>
=C2=A0config_host_data.set(&#39;CONFIG_DBUS_DISPLAY&#39;, dbus_display)<br>
=C2=A0config_host_data.set(&#39;CONFIG_CFI&#39;, get_option(&#39;cfi&#39;))=
<br>
=C2=A0config_host_data.set(&#39;CONFIG_SELINUX&#39;, selinux.found())<br>
+config_host_data.set(&#39;CONFIG_XEN_PCI_PASSTHROUGH&#39;, have_xen_pci_pa=
ssthrough)<br></blockquote><div><br></div><div>afaict, nothing uses this th=
en.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
=C2=A0config_host_data.set(&#39;QEMU_VERSION&#39;, &#39;&quot;@0@&quot;&#39=
;.format(meson.project_version()))<br>
=C2=A0config_host_data.set(&#39;QEMU_VERSION_MAJOR&#39;, meson.project_vers=
ion().split(&#39;.&#39;)[0])<br>
=C2=A0config_host_data.set(&#39;QEMU_VERSION_MINOR&#39;, meson.project_vers=
ion().split(&#39;.&#39;)[1])<br>
@@ -2228,8 +2229,6 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0config_all +=3D { sym: &#39;y&#39; }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if sym =3D=3D &#39;CONFIG_TCG&#39; and tcg_arch =
=3D=3D &#39;tci&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config_target +=3D { &#39;CONFIG_TCG_INTE=
RPRETER&#39;: &#39;y&#39; }<br>
-=C2=A0 =C2=A0 =C2=A0 elif sym =3D=3D &#39;CONFIG_XEN&#39; and have_xen_pci=
_passthrough<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 config_target +=3D { &#39;CONFIG_XEN_PCI_PASST=
HROUGH&#39;: &#39;y&#39; }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if target in modular_tcg<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config_target +=3D { &#39;CONFIG_TCG_MODU=
LAR&#39;: &#39;y&#39; }<br>
-- <br>
2.35.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000097884c05dd18b771--

