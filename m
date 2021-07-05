Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F50A3BC357
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 22:14:55 +0200 (CEST)
Received: from localhost ([::1]:46924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0UzV-0001cR-MZ
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 16:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0Uy4-0000DK-Bu
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 16:13:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m0Uxz-0004Ks-2i
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 16:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625515996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tQl/brNmjtz+b45eniUwQdGAsZex64MtZ/D+gIBvsbg=;
 b=Cop4gyk34gAND2HNVfbB+eFxXoVrxGYufEfK0QFHiCrO79tmCKzbAp8ssls9f/wl6b3knF
 Wq0kJxmB60874mmq3kv9EWFc7DHtNxr1Ml7X8J/kzQtqG1ojSlVEf7/ucMmfHTj889GG5I
 UY3f2uQ6o7j1kdiVeCo8bqE1Px/6Ssw=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-DKoYW5o0O-CjUfPVox5Zvg-1; Mon, 05 Jul 2021 16:13:15 -0400
X-MC-Unique: DKoYW5o0O-CjUfPVox5Zvg-1
Received: by mail-io1-f72.google.com with SMTP id
 v21-20020a5d99550000b029050931b8c73dso5600376ios.20
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 13:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tQl/brNmjtz+b45eniUwQdGAsZex64MtZ/D+gIBvsbg=;
 b=S2LsMNMYVsKcbmMC6p/75xpS+9EvZfou/DK4MJV0qX1WlSnbfyxE8ix/9iZLobgunW
 Z5Dav/MnbMCD2gQFGjF7XyQaH25H7q6yUKJ3+KqzsYGtziTy0q7VAexEs+Lh9j9gR8TE
 cpnCUdVrM4O/Jo+AUW/XF6Aqa3gNHrNBi75WwLXkpKyBW0zgk01B14zfP39/WS5KUqjX
 pO84/dFEMISNRpY6qkKIFcOiivYghHvOpqLZD8fGraq7SdJ8BuGEu9FrL7E5JzUmnKGb
 Tq4R1mfpKSsiIchJman3enNQEYLC3yVPn0Dh8muUF9jc1bq83Zk9Puj2UrGWZ57cVXLX
 T5oA==
X-Gm-Message-State: AOAM533VyHQAGh7w0/61uIfblkwwX0r5AaO3h8TsIJISPgsE9bll5zP3
 4CeICtSdwIed7vXiyzMzp7HEbnwihFmP4nPN5kVGqnu0qFgpmnh6OQTHO7dqAdOFoH2x+tmmrMJ
 010dHcJKvTcpm6ZnNqz6hizHAkqEalaE=
X-Received: by 2002:a63:5cb:: with SMTP id 194mr17083658pgf.146.1625515684849; 
 Mon, 05 Jul 2021 13:08:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMjx+oNviUPL4pnrxXPIAEr4rAV0zdj/E5q9LQkyXxBsvOnddgHUjluXBmG7fkls/hR82a1L/NVY2BLfTno9s=
X-Received: by 2002:a63:5cb:: with SMTP id 194mr17083641pgf.146.1625515684573; 
 Mon, 05 Jul 2021 13:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210705195328.36442-1-programmingkidx@gmail.com>
In-Reply-To: <20210705195328.36442-1-programmingkidx@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 5 Jul 2021 22:07:52 +0200
Message-ID: <CABgObfagru8NH36anTRU-DkOoRDrsQ1MOHMtxbHcZu5pU1ZYmg@mail.gmail.com>
Subject: Re: [PATCH v2] Set icon for QEMU binary on Mac OS
To: John Arbuckle <programmingkidx@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f4c8d605c665dc5a"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f4c8d605c665dc5a
Content-Type: text/plain; charset="UTF-8"

Well, you're not using $ICON at all but I can clean that up myself. Thanks
for testing.

Paolo

Il lun 5 lug 2021, 21:53 John Arbuckle <programmingkidx@gmail.com> ha
scritto:

> Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
> ---
> v1 changes:
> Rewrote the patch as the maintainer had wanted.
>
>  meson.build            | 15 ++++++++++-----
>  scripts/entitlement.sh | 10 +++++++++-
>  2 files changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index db6789af9c..499ab49981 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2360,8 +2360,7 @@ foreach target : target_dirs
>    endif
>    foreach exe: execs
>      exe_name = exe['name']
> -    exe_sign = 'CONFIG_HVF' in config_target
> -    if exe_sign
> +    if targetos == 'darwin'
>        exe_name += '-unsigned'
>      endif
>
> @@ -2375,7 +2374,13 @@ foreach target : target_dirs
>                 link_args: link_args,
>                 gui_app: exe['gui'])
>
> -    if exe_sign
> +    if 'CONFIG_HVF' in config_target
> +      entitlements = meson.current_source_dir() /
> 'accel/hvf/entitlements.plist'
> +    else
> +      entitlements = '/dev/null'
> +    endif
> +    if targetos == 'darwin'
> +      icon = '...'
>        emulators += {exe['name'] : custom_target(exe['name'],
>                     depends: emulator,
>                     output: exe['name'],
> @@ -2383,14 +2388,14 @@ foreach target : target_dirs
>                       meson.current_source_dir() /
> 'scripts/entitlement.sh',
>                       meson.current_build_dir() / exe_name,
>                       meson.current_build_dir() / exe['name'],
> -                     meson.current_source_dir() /
> 'accel/hvf/entitlements.plist'
> +                     entitlements, icon
>                     ])
>        }
>
>        meson.add_install_script('scripts/entitlement.sh', '--install',
>                                 get_option('bindir') / exe_name,
>                                 get_option('bindir') / exe['name'],
> -                               meson.current_source_dir() /
> 'accel/hvf/entitlements.plist')
> +                               entitlements, icon)
>      else
>        emulators += {exe['name']: emulator}
>      endif
> diff --git a/scripts/entitlement.sh b/scripts/entitlement.sh
> index f7aaaf2766..46e378426b 100755
> --- a/scripts/entitlement.sh
> +++ b/scripts/entitlement.sh
> @@ -11,6 +11,7 @@ fi
>  SRC="$1"
>  DST="$2"
>  ENTITLEMENT="$3"
> +ICON="$4"
>
>  if $in_place; then
>    trap 'rm "$DST.tmp"' exit
> @@ -20,6 +21,13 @@ else
>    cd "$MESON_INSTALL_DESTDIR_PREFIX"
>  fi
>
> -codesign --entitlements "$ENTITLEMENT" --force -s - "$SRC"
> +if test "$ENTITLEMENT" != '/dev/null'; then
> +  codesign --entitlements "$ENTITLEMENT" --force -s - "$SRC"
> +fi
> +
> +# Add the QEMU icon to the binary on Mac OS
> +Rez -append '../pc-bios/qemu.rsrc' -o "$SRC"
> +SetFile -a C "$SRC"
> +
>  mv -f "$SRC" "$DST"
>  trap '' exit
> --
> 2.24.3 (Apple Git-128)
>
>

--000000000000f4c8d605c665dc5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Well, you&#39;re not using $ICON at all but I can clean t=
hat up myself. Thanks for testing.<div dir=3D"auto"><br></div><div dir=3D"a=
uto">Paolo</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">Il lun 5 lug 2021, 21:53 John Arbuckle &lt;<a href=3D"mailt=
o:programmingkidx@gmail.com">programmingkidx@gmail.com</a>&gt; ha scritto:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Signed-off-by: John Arbuckle &lt;<a=
 href=3D"mailto:programmingkidx@gmail.com" target=3D"_blank" rel=3D"norefer=
rer">programmingkidx@gmail.com</a>&gt;<br>
---<br>
v1 changes:<br>
Rewrote the patch as the maintainer had wanted.<br>
<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 ++++++++++-=
----<br>
=C2=A0scripts/entitlement.sh | 10 +++++++++-<br>
=C2=A02 files changed, 19 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index db6789af9c..499ab49981 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -2360,8 +2360,7 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0endif<br>
=C2=A0 =C2=A0foreach exe: execs<br>
=C2=A0 =C2=A0 =C2=A0exe_name =3D exe[&#39;name&#39;]<br>
-=C2=A0 =C2=A0 exe_sign =3D &#39;CONFIG_HVF&#39; in config_target<br>
-=C2=A0 =C2=A0 if exe_sign<br>
+=C2=A0 =C2=A0 if targetos =3D=3D &#39;darwin&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0exe_name +=3D &#39;-unsigned&#39;<br>
=C2=A0 =C2=A0 =C2=A0endif<br>
<br>
@@ -2375,7 +2374,13 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 link_args: link_arg=
s,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gui_app: exe[&#39;g=
ui&#39;])<br>
<br>
-=C2=A0 =C2=A0 if exe_sign<br>
+=C2=A0 =C2=A0 if &#39;CONFIG_HVF&#39; in config_target<br>
+=C2=A0 =C2=A0 =C2=A0 entitlements =3D meson.current_source_dir() / &#39;ac=
cel/hvf/entitlements.plist&#39;<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 entitlements =3D &#39;/dev/null&#39;<br>
+=C2=A0 =C2=A0 endif<br>
+=C2=A0 =C2=A0 if targetos =3D=3D &#39;darwin&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 icon =3D &#39;...&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0emulators +=3D {exe[&#39;name&#39;] : custom_tar=
get(exe[&#39;name&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depen=
ds: emulator,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 outpu=
t: exe[&#39;name&#39;],<br>
@@ -2383,14 +2388,14 @@ foreach target : target_dirs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 meson.current_source_dir() / &#39;scripts/entitlement.sh&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 meson.current_build_dir() / exe_name,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 meson.current_build_dir() / exe[&#39;name&#39;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0meson.current_source_dir() / &#39;accel/hvf/entitlements.plist&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0entitlements, icon<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ])<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0meson.add_install_script(&#39;scripts/entitlemen=
t.sh&#39;, &#39;--install&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_option(&#39;bindir&#39;) / exe_n=
ame,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 get_option(&#39;bindir&#39;) / exe[&=
#39;name&#39;],<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0meson.current_source_dir() / &#39;acc=
el/hvf/entitlements.plist&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entitlements, icon)<br>
=C2=A0 =C2=A0 =C2=A0else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0emulators +=3D {exe[&#39;name&#39;]: emulator}<b=
r>
=C2=A0 =C2=A0 =C2=A0endif<br>
diff --git a/scripts/entitlement.sh b/scripts/entitlement.sh<br>
index f7aaaf2766..46e378426b 100755<br>
--- a/scripts/entitlement.sh<br>
+++ b/scripts/entitlement.sh<br>
@@ -11,6 +11,7 @@ fi<br>
=C2=A0SRC=3D&quot;$1&quot;<br>
=C2=A0DST=3D&quot;$2&quot;<br>
=C2=A0ENTITLEMENT=3D&quot;$3&quot;<br>
+ICON=3D&quot;$4&quot;<br>
<br>
=C2=A0if $in_place; then<br>
=C2=A0 =C2=A0trap &#39;rm &quot;$DST.tmp&quot;&#39; exit<br>
@@ -20,6 +21,13 @@ else<br>
=C2=A0 =C2=A0cd &quot;$MESON_INSTALL_DESTDIR_PREFIX&quot;<br>
=C2=A0fi<br>
<br>
-codesign --entitlements &quot;$ENTITLEMENT&quot; --force -s - &quot;$SRC&q=
uot;<br>
+if test &quot;$ENTITLEMENT&quot; !=3D &#39;/dev/null&#39;; then<br>
+=C2=A0 codesign --entitlements &quot;$ENTITLEMENT&quot; --force -s - &quot=
;$SRC&quot;<br>
+fi<br>
+<br>
+# Add the QEMU icon to the binary on Mac OS<br>
+Rez -append &#39;../pc-bios/qemu.rsrc&#39; -o &quot;$SRC&quot;<br>
+SetFile -a C &quot;$SRC&quot;<br>
+<br>
=C2=A0mv -f &quot;$SRC&quot; &quot;$DST&quot;<br>
=C2=A0trap &#39;&#39; exit<br>
-- <br>
2.24.3 (Apple Git-128)<br>
<br>
</blockquote></div>

--000000000000f4c8d605c665dc5a--


