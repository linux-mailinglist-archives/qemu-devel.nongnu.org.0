Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B8F4B7237
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 17:41:52 +0100 (CET)
Received: from localhost ([::1]:49704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK0tj-00029e-QE
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 11:41:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK0qX-0000c0-3A
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:38:34 -0500
Received: from [2a00:1450:4864:20::236] (port=35373
 helo=mail-lj1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK0qR-0003Vg-6x
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:38:29 -0500
Received: by mail-lj1-x236.google.com with SMTP id u16so6345299ljk.2
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 08:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J1AR/LyD+fU2ZCRpw3aXIvlasGEy5Y4jMFha/h03nFk=;
 b=FpMLIHBU+bxFHE790Xu1uCat3P/a5F8Uvfgo55m/XB6M9QsgyoGs5iFnoCuPc6uL3J
 agtXlWOVegNXh9HxlX2jAIy7+WfEaoPNTtPDRddGi5ML/Fc2TX6giZLIC1ca2I6cXe9z
 3zwACEuki83eA31k2cg84+zt8BBZOi98VAHsTN4hkxacU4RT2gyWgvnM1jnbZujIf7gC
 2Yu0oTJinUSkWhaxMktXBLyDTjVpTSZlerSd63wYK6TVPp/0YTG3+1eoiVMSILLrRiUK
 1/IrRs+TSSNiIavpKO3wpfyKLr+JKI1AroPWPn7d3hvCYYHrttm3GfOBM87x4ZKp9a7B
 Kqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J1AR/LyD+fU2ZCRpw3aXIvlasGEy5Y4jMFha/h03nFk=;
 b=ZJec9FBY27fBJ9DQta70GgVCXfWrpJ4awFT6Jjgwxzb3cjYtp/7WZ6xtHUXESBqDoV
 guag+i2vYN/em7kM9intyn7Ej7+zECaFf/fVJSbG4HxL+SYAARjrgE6GGv/y0ahIrnQO
 6kG2rQPg7wERa1S1nA1thxWkG2DtcTUguB7OF1Lzq+JdPndzcM2sf25EyjKqt40qN5nR
 hVQwb7tVE6+5V0ZXqHTNwBlVHOYf19f2zExOV5SrG+AU6wijaE/nLQb63D3n4QI10cyY
 1NMowebiu3AYstHMgg7JvIBU3rIu4qg0dvmqICPizaGNHw/CnCQJ07Bgrq04fkIccEPS
 CSgw==
X-Gm-Message-State: AOAM533bGC7sfQDmsMTwvn+fsGfKYVhVXMC6h0jxjDVSrQE9sf64ewRR
 ftMz6KlWZ5qTk2m49aMPwvbiwkODwxIbZR//dk0=
X-Google-Smtp-Source: ABdhPJxs1cTx53GGTXWatmKjTuDWxmB/QpjO8qiX3pbili8dHJJ/iYGdFy6RwxdqFX6Bv1IC197gEfdXqMWISHg2o/s=
X-Received: by 2002:a2e:b7c9:: with SMTP id p9mr3009240ljo.268.1644943104153; 
 Tue, 15 Feb 2022 08:38:24 -0800 (PST)
MIME-Version: 1.0
References: <20220215080307.69550-1-f4bug@amsat.org>
 <20220215080307.69550-12-f4bug@amsat.org>
In-Reply-To: <20220215080307.69550-12-f4bug@amsat.org>
From: Will Cohen <wwcohen@gmail.com>
Date: Tue, 15 Feb 2022 11:38:06 -0500
Message-ID: <CAB26zV2t70aHm5QyK4g4CNTxM55Lv9JXWR4+F4erwi8r2DnZEQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/15] ui/cocoa: Add Services menu
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000661c3d05d81129c4"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::236
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=wwcohen@gmail.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000661c3d05d81129c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022 at 3:04 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> From: Akihiko Odaki <akihiko.odaki@gmail.com>
>
> Services menu functionality of Cocoa is described at:
>
> https://developer.apple.com/design/human-interface-guidelines/macos/exten=
sions/services/
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20220214091320.51750-1-akihiko.odaki@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  ui/cocoa.m | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 7a1ddd4075..becca58cb7 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1591,11 +1591,15 @@ static void create_initial_menus(void)
>      NSMenuItem  *menuItem;
>
>      [NSApp setMainMenu:[[NSMenu alloc] init]];
> +    [NSApp setServicesMenu:[[NSMenu alloc] initWithTitle:@"Services"]];
>
>      // Application menu
>      menu =3D [[NSMenu alloc] initWithTitle:@""];
>      [menu addItemWithTitle:@"About QEMU" action:@selector(do_about_menu_=
item:)
> keyEquivalent:@""]; // About QEMU
>      [menu addItem:[NSMenuItem separatorItem]]; //Separator
> +    menuItem =3D [menu addItemWithTitle:@"Services" action:nil
> keyEquivalent:@""];
> +    [menuItem setSubmenu:[NSApp servicesMenu]];
> +    [menu addItem:[NSMenuItem separatorItem]];
>      [menu addItemWithTitle:@"Hide QEMU" action:@selector(hide:)
> keyEquivalent:@"h"]; //Hide QEMU
>      menuItem =3D (NSMenuItem *)[menu addItemWithTitle:@"Hide Others"
> action:@selector(hideOtherApplications:) keyEquivalent:@"h"]; // Hide
> Others
>      [menuItem
> setKeyEquivalentModifierMask:(NSEventModifierFlagOption|NSEventModifierFl=
agCommand)];
> --
> 2.34.1
>

Reviewed-by: Will Cohen <wwcohen@gmail.com>
Tested-by: Will Cohen <wwcohen@gmail.com>

--000000000000661c3d05d81129c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Feb 15, 2022 at 3:04 AM Philippe =
Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</=
a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">From: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.=
odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;<br>
<br>
Services menu functionality of Cocoa is described at:<br>
<a href=3D"https://developer.apple.com/design/human-interface-guidelines/ma=
cos/extensions/services/" rel=3D"noreferrer" target=3D"_blank">https://deve=
loper.apple.com/design/human-interface-guidelines/macos/extensions/services=
/</a><br>
<br>
Signed-off-by: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com"=
 target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.or=
g" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20220214091320.51750-1-akihiko.odaki@gmai=
l.com" target=3D"_blank">20220214091320.51750-1-akihiko.odaki@gmail.com</a>=
&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0ui/cocoa.m | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/ui/cocoa.m b/ui/cocoa.m<br>
index 7a1ddd4075..becca58cb7 100644<br>
--- a/ui/cocoa.m<br>
+++ b/ui/cocoa.m<br>
@@ -1591,11 +1591,15 @@ static void create_initial_menus(void)<br>
=C2=A0 =C2=A0 =C2=A0NSMenuItem=C2=A0 *menuItem;<br>
<br>
=C2=A0 =C2=A0 =C2=A0[NSApp setMainMenu:[[NSMenu alloc] init]];<br>
+=C2=A0 =C2=A0 [NSApp setServicesMenu:[[NSMenu alloc] initWithTitle:@&quot;=
Services&quot;]];<br>
<br>
=C2=A0 =C2=A0 =C2=A0// Application menu<br>
=C2=A0 =C2=A0 =C2=A0menu =3D [[NSMenu alloc] initWithTitle:@&quot;&quot;];<=
br>
=C2=A0 =C2=A0 =C2=A0[menu addItemWithTitle:@&quot;About QEMU&quot; action:@=
selector(do_about_menu_item:) keyEquivalent:@&quot;&quot;]; // About QEMU<b=
r>
=C2=A0 =C2=A0 =C2=A0[menu addItem:[NSMenuItem separatorItem]]; //Separator<=
br>
+=C2=A0 =C2=A0 menuItem =3D [menu addItemWithTitle:@&quot;Services&quot; ac=
tion:nil keyEquivalent:@&quot;&quot;];<br>
+=C2=A0 =C2=A0 [menuItem setSubmenu:[NSApp servicesMenu]];<br>
+=C2=A0 =C2=A0 [menu addItem:[NSMenuItem separatorItem]];<br>
=C2=A0 =C2=A0 =C2=A0[menu addItemWithTitle:@&quot;Hide QEMU&quot; action:@s=
elector(hide:) keyEquivalent:@&quot;h&quot;]; //Hide QEMU<br>
=C2=A0 =C2=A0 =C2=A0menuItem =3D (NSMenuItem *)[menu addItemWithTitle:@&quo=
t;Hide Others&quot; action:@selector(hideOtherApplications:) keyEquivalent:=
@&quot;h&quot;]; // Hide Others<br>
=C2=A0 =C2=A0 =C2=A0[menuItem setKeyEquivalentModifierMask:(NSEventModifier=
FlagOption|NSEventModifierFlagCommand)];<br>
-- <br>
2.34.1<br></blockquote><div><br></div><div>Reviewed-by: Will Cohen &lt;<a h=
ref=3D"mailto:wwcohen@gmail.com">wwcohen@gmail.com</a>&gt;<br>
Tested-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com">wwcohen@gmai=
l.com</a>&gt; <br></div></div></div>

--000000000000661c3d05d81129c4--

