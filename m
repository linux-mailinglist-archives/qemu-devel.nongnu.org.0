Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65E22C6CDC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 22:19:52 +0100 (CET)
Received: from localhost ([::1]:38188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kil9j-0005M4-FL
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 16:19:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kil86-0004o4-V3
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 16:18:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kil84-0003J7-J1
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 16:18:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606511887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ettb4PEiP373OrCOXPZLXN8fMtqqK45DMZkEjAgFf1k=;
 b=ZM1lvLRTl/r19RzyyskpNLZIVTmryfvcazJ1iepgF+98mymSng/NNFR8PvieFeTuKDiULN
 j65lQ+Bhov9s0hnhWmGKQGJgPJEfnrGuikQpsJrcPxecb561mTmfTdCVheR7BAQoEvK6yz
 p+qiteZ0nwwHy/p2kLJ5Z+OzMCEzLfg=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-fX33_advMS2WhmyRe9HIVg-1; Fri, 27 Nov 2020 16:18:01 -0500
X-MC-Unique: fX33_advMS2WhmyRe9HIVg-1
Received: by mail-pg1-f199.google.com with SMTP id k6so2317721pgh.19
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 13:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ettb4PEiP373OrCOXPZLXN8fMtqqK45DMZkEjAgFf1k=;
 b=AGXso41MEMwhjR1ys15HtVqtT1DQkOJ9ocRDm6ik0lTgbfRPFTu3mLXmmXyW5g38oJ
 wghBcNIu2NSTYBKExooENFzAmVugi951f+RQ6j81bN0m6+FawzZ3b/0w3G43a2HEYAmI
 wcrvysiYOutShBOF2wPFNqXGDrgDGYScdY6XwE5f/+B06JwWIv7RN/GHjFvRVsBRdxm/
 Zr7wPjyoYCC4DoZ/TwBO6rlVpA9iF4Zki20hi+o/KFVKzhN7nTHvCAf6iH+m1BuTE46C
 HqWgDjosniKNy+EPYHUBb9aBw4w3oxIQ4TuElyLRs1xc3fR0qtlZbe36AglGsfQLKDU9
 wGlg==
X-Gm-Message-State: AOAM531wWOLgMiiXeAPPKZMItS+tNSocBBy7uy8uywkuMGTZD9a9rJ1v
 4p9ROhXQIPjbeHugaAPdiPE0GlzS3fq3usaAuXSTc59OH/dg4HoWX7e7CVUc40Btq5RD3QVhbpz
 gakO5Hw564dErQNwX/G9XJqzrD61kJDU=
X-Received: by 2002:a63:344a:: with SMTP id b71mr8110683pga.146.1606511880752; 
 Fri, 27 Nov 2020 13:18:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxAmcriIDh61qXhSVuf0dfJmoHbPdLvdZpjFM/1nC+GfeD8pXD64EK/1jFxAuKekRivw9wMIZeAKnpd9lvH/qU=
X-Received: by 2002:a63:344a:: with SMTP id b71mr8110676pga.146.1606511880499; 
 Fri, 27 Nov 2020 13:18:00 -0800 (PST)
MIME-Version: 1.0
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-2-agraf@csgraf.de>
 <20201127194406.GB56950@SPB-NB-133.local>
In-Reply-To: <20201127194406.GB56950@SPB-NB-133.local>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 27 Nov 2020 22:17:48 +0100
Message-ID: <CABgObfaH1VnnyD0c60APVRNLw5y+605GtDPrKhLuXTRTZB+k1w@mail.gmail.com>
Subject: Re: [PATCH 1/8] hvf: Add hypervisor entitlement to output binaries
To: Roman Bolshakov <r.bolshakov@yadro.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f70a7b05b51d31fb"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f70a7b05b51d31fb
Content-Type: text/plain; charset="UTF-8"

Il ven 27 nov 2020, 20:44 Roman Bolshakov <r.bolshakov@yadro.com> ha
scritto:

> On Thu, Nov 26, 2020 at 10:50:10PM +0100, Alexander Graf wrote:
> > In macOS 11, QEMU only gets access to Hypervisor.framework if it has the
> > respective entitlement. Add an entitlement template and automatically
> self
> > sign and apply the entitlement in the build.
> >
> > Signed-off-by: Alexander Graf <agraf@csgraf.de>
> > ---
> >  accel/hvf/entitlements.plist |  8 ++++++++
> >  meson.build                  | 30 ++++++++++++++++++++++++++----
> >  scripts/entitlement.sh       | 11 +++++++++++
> >  3 files changed, 45 insertions(+), 4 deletions(-)
> >  create mode 100644 accel/hvf/entitlements.plist
> >  create mode 100755 scripts/entitlement.sh
>
> Hi,
>
> I think the patch should go ahead of other changes (with Paolo's fix for
> ^C) and land into 5.2 because entitlements are needed for x86_64 hvf too
> since Big Sur Beta 3. Ad-hoc signing is very convenient for development.
>

It's certainly too late for 5.2, but we could include the patch in the
release notes and in 5.2.1.

Paolo

Also, It might be good to have configure/meson option to disable signing
> at all. Primarily for homebrew:
>
> https://discourse.brew.sh/t/code-signing-installed-executables/2131/10
>
> There's no established process how to deal with it, e.g. GDB in homebrew
> has caveats section for now:
>
>   ==> Caveats
>   gdb requires special privileges to access Mach ports.
>   You will need to codesign the binary. For instructions, see:
>
>     https://sourceware.org/gdb/wiki/BuildingOnDarwin
>
> The discussion on discourse mentions some plans to do signing in
> homebrew CI (with real Developer ID) but none of them are implemented
> now.
>
> For now it'd be helpful to provide a way to disable signing and install
> the entitlements (if one wants to sign after installation). Similar
> issue was raised to fish-shell a while ago:
>
> https://github.com/fish-shell/fish-shell/issues/6952
> https://github.com/fish-shell/fish-shell/issues/7467
>
> >
> > diff --git a/accel/hvf/entitlements.plist b/accel/hvf/entitlements.plist
> > new file mode 100644
> > index 0000000000..154f3308ef
> > --- /dev/null
> > +++ b/accel/hvf/entitlements.plist
> > @@ -0,0 +1,8 @@
> > +<?xml version="1.0" encoding="UTF-8"?>
> > +<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "
> http://www.apple.com/DTDs/PropertyList-1.0.dtd">
> > +<plist version="1.0">
> > +<dict>
> > +    <key>com.apple.security.hypervisor</key>
> > +    <true/>
> > +</dict>
> > +</plist>
> > diff --git a/meson.build b/meson.build
> > index 5062407c70..2a7ff5560c 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1844,9 +1844,14 @@ foreach target : target_dirs
> >      }]
> >    endif
> >    foreach exe: execs
> > -    emulators += {exe['name']:
> > -         executable(exe['name'], exe['sources'],
> > -               install: true,
> > +    exe_name = exe['name']
> > +    exe_sign = 'CONFIG_HVF' in config_target
>
> I don't have Apple Silicon HW but it may require different kind of
> entitlements for CONFIG_TCG:
>
>
> https://developer.apple.com/documentation/apple_silicon/porting_just-in-time_compilers_to_apple_silicon
>
> Thanks,
> Roman
>
> > +    if exe_sign
> > +      exe_name += '-unsigned'
> > +    endif
> > +
> > +    emulator = executable(exe_name, exe['sources'],
> > +               install: not exe_sign,
> >                 c_args: c_args,
> >                 dependencies: arch_deps + deps + exe['dependencies'],
> >                 objects: lib.extract_all_objects(recursive: true),
> > @@ -1854,7 +1859,24 @@ foreach target : target_dirs
> >                 link_depends: [block_syms, qemu_syms] +
> exe.get('link_depends', []),
> >                 link_args: link_args,
> >                 gui_app: exe['gui'])
> > -    }
> > +
> > +    if exe_sign
> > +      exe_full = meson.current_build_dir() / exe['name']
> > +      emulators += {exe['name'] : custom_target(exe['name'],
> > +                   install: true,
> > +                   install_dir: get_option('bindir'),
> > +                   depends: emulator,
> > +                   output: exe['name'],
> > +                   command: [
> > +                     meson.current_source_dir() /
> 'scripts/entitlement.sh',
> > +                     meson.current_build_dir() / exe['name'] +
> '-unsigned',
> > +                     meson.current_build_dir() / exe['name'],
> > +                     meson.current_source_dir() /
> 'accel/hvf/entitlements.plist'
> > +                   ])
> > +      }
> > +    else
> > +      emulators += {exe['name']: emulator}
> > +    endif
> >
> >      if 'CONFIG_TRACE_SYSTEMTAP' in config_host
> >        foreach stp: [
> > diff --git a/scripts/entitlement.sh b/scripts/entitlement.sh
> > new file mode 100755
> > index 0000000000..7ed9590bf9
> > --- /dev/null
> > +++ b/scripts/entitlement.sh
> > @@ -0,0 +1,11 @@
> > +#!/bin/sh -e
> > +#
> > +# Helper script for the build process to apply entitlements
> > +
> > +SRC="$1"
> > +DST="$2"
> > +ENTITLEMENT="$3"
> > +
> > +rm -f "$2"
> > +cp -a "$SRC" "$DST"
> > +codesign --entitlements "$ENTITLEMENT" --force -s - "$DST"
> > --
> > 2.24.3 (Apple Git-128)
> >
> >
>
>

--000000000000f70a7b05b51d31fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 27 nov 2020, 20:44 Roman Bolshakov &lt;<a href=
=3D"mailto:r.bolshakov@yadro.com">r.bolshakov@yadro.com</a>&gt; ha scritto:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">On Thu, Nov 26, 2020 at 10:50:10PM=
 +0100, Alexander Graf wrote:<br>
&gt; In macOS 11, QEMU only gets access to Hypervisor.framework if it has t=
he<br>
&gt; respective entitlement. Add an entitlement template and automatically =
self<br>
&gt; sign and apply the entitlement in the build.<br>
&gt; <br>
&gt; Signed-off-by: Alexander Graf &lt;<a href=3D"mailto:agraf@csgraf.de" t=
arget=3D"_blank" rel=3D"noreferrer">agraf@csgraf.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 accel/hvf/entitlements.plist |=C2=A0 8 ++++++++<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 30 ++++++++++++++++++++++++++----<br>
&gt;=C2=A0 scripts/entitlement.sh=C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++++++++++=
+<br>
&gt;=C2=A0 3 files changed, 45 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0 create mode 100644 accel/hvf/entitlements.plist<br>
&gt;=C2=A0 create mode 100755 scripts/entitlement.sh<br>
<br>
Hi,<br>
<br>
I think the patch should go ahead of other changes (with Paolo&#39;s fix fo=
r<br>
^C) and land into 5.2 because entitlements are needed for x86_64 hvf too<br=
>
since Big Sur Beta 3. Ad-hoc signing is very convenient for development.<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">It&=
#39;s certainly too late for 5.2, but we could include the patch in the rel=
ease notes and in 5.2.1.</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Also, It might be good to have con=
figure/meson option to disable signing<br>
at all. Primarily for homebrew:<br>
<br>
<a href=3D"https://discourse.brew.sh/t/code-signing-installed-executables/2=
131/10" rel=3D"noreferrer noreferrer" target=3D"_blank">https://discourse.b=
rew.sh/t/code-signing-installed-executables/2131/10</a><br>
<br>
There&#39;s no established process how to deal with it, e.g. GDB in homebre=
w<br>
has caveats section for now:<br>
<br>
=C2=A0 =3D=3D&gt; Caveats<br>
=C2=A0 gdb requires special privileges to access Mach ports.<br>
=C2=A0 You will need to codesign the binary. For instructions, see:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://sourceware.org/gdb/wiki/BuildingOnDarwin" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://sourceware.org/gdb/=
wiki/BuildingOnDarwin</a><br>
<br>
The discussion on discourse mentions some plans to do signing in<br>
homebrew CI (with real Developer ID) but none of them are implemented<br>
now.<br>
<br>
For now it&#39;d be helpful to provide a way to disable signing and install=
<br>
the entitlements (if one wants to sign after installation). Similar<br>
issue was raised to fish-shell a while ago:<br>
<br>
<a href=3D"https://github.com/fish-shell/fish-shell/issues/6952" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">https://github.com/fish-shell/fish-sh=
ell/issues/6952</a><br>
<a href=3D"https://github.com/fish-shell/fish-shell/issues/7467" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">https://github.com/fish-shell/fish-sh=
ell/issues/7467</a><br>
<br>
&gt; <br>
&gt; diff --git a/accel/hvf/entitlements.plist b/accel/hvf/entitlements.pli=
st<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..154f3308ef<br>
&gt; --- /dev/null<br>
&gt; +++ b/accel/hvf/entitlements.plist<br>
&gt; @@ -0,0 +1,8 @@<br>
&gt; +&lt;?xml version=3D&quot;1.0&quot; encoding=3D&quot;UTF-8&quot;?&gt;<=
br>
&gt; +&lt;!DOCTYPE plist PUBLIC &quot;-//Apple//DTD PLIST 1.0//EN&quot; &qu=
ot;<a href=3D"http://www.apple.com/DTDs/PropertyList-1.0.dtd" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">http://www.apple.com/DTDs/PropertyList-1=
.0.dtd</a>&quot;&gt;<br>
&gt; +&lt;plist version=3D&quot;1.0&quot;&gt;<br>
&gt; +&lt;dict&gt;<br>
&gt; +=C2=A0 =C2=A0 &lt;key&gt;com.apple.security.hypervisor&lt;/key&gt;<br=
>
&gt; +=C2=A0 =C2=A0 &lt;true/&gt;<br>
&gt; +&lt;/dict&gt;<br>
&gt; +&lt;/plist&gt;<br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index 5062407c70..2a7ff5560c 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -1844,9 +1844,14 @@ foreach target : target_dirs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }]<br>
&gt;=C2=A0 =C2=A0 endif<br>
&gt;=C2=A0 =C2=A0 foreach exe: execs<br>
&gt; -=C2=A0 =C2=A0 emulators +=3D {exe[&#39;name&#39;]:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0executable(exe[&#39;name&#39;], exe=
[&#39;sources&#39;],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install: true,=
<br>
&gt; +=C2=A0 =C2=A0 exe_name =3D exe[&#39;name&#39;]<br>
&gt; +=C2=A0 =C2=A0 exe_sign =3D &#39;CONFIG_HVF&#39; in config_target<br>
<br>
I don&#39;t have Apple Silicon HW but it may require different kind of<br>
entitlements for CONFIG_TCG:<br>
<br>
<a href=3D"https://developer.apple.com/documentation/apple_silicon/porting_=
just-in-time_compilers_to_apple_silicon" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">https://developer.apple.com/documentation/apple_silicon/porti=
ng_just-in-time_compilers_to_apple_silicon</a><br>
<br>
Thanks,<br>
Roman<br>
<br>
&gt; +=C2=A0 =C2=A0 if exe_sign<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 exe_name +=3D &#39;-unsigned&#39;<br>
&gt; +=C2=A0 =C2=A0 endif<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 emulator =3D executable(exe_name, exe[&#39;sources&#39;=
],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install: not e=
xe_sign,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c_args: c=
_args,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dependenc=
ies: arch_deps + deps + exe[&#39;dependencies&#39;],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0objects: =
lib.extract_all_objects(recursive: true),<br>
&gt; @@ -1854,7 +1859,24 @@ foreach target : target_dirs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_depe=
nds: [block_syms, qemu_syms] + exe.get(&#39;link_depends&#39;, []),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link_args=
: link_args,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gui_app: =
exe[&#39;gui&#39;])<br>
&gt; -=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if exe_sign<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 exe_full =3D meson.current_build_dir() / exe[&#3=
9;name&#39;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 emulators +=3D {exe[&#39;name&#39;] : custom_tar=
get(exe[&#39;name&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
install: true,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
install_dir: get_option(&#39;bindir&#39;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
depends: emulator,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
output: exe[&#39;name&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
command: [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0meson.current_source_dir() / &#39;scripts/entitlement.sh&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0meson.current_build_dir() / exe[&#39;name&#39;] + &#39;-unsigned&#39=
;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0meson.current_build_dir() / exe[&#39;name&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0meson.current_source_dir() / &#39;accel/hvf/entitlements.plist&#39;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 emulators +=3D {exe[&#39;name&#39;]: emulator}<b=
r>
&gt; +=C2=A0 =C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if &#39;CONFIG_TRACE_SYSTEMTAP&#39; in config_host=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 foreach stp: [<br>
&gt; diff --git a/scripts/entitlement.sh b/scripts/entitlement.sh<br>
&gt; new file mode 100755<br>
&gt; index 0000000000..7ed9590bf9<br>
&gt; --- /dev/null<br>
&gt; +++ b/scripts/entitlement.sh<br>
&gt; @@ -0,0 +1,11 @@<br>
&gt; +#!/bin/sh -e<br>
&gt; +#<br>
&gt; +# Helper script for the build process to apply entitlements<br>
&gt; +<br>
&gt; +SRC=3D&quot;$1&quot;<br>
&gt; +DST=3D&quot;$2&quot;<br>
&gt; +ENTITLEMENT=3D&quot;$3&quot;<br>
&gt; +<br>
&gt; +rm -f &quot;$2&quot;<br>
&gt; +cp -a &quot;$SRC&quot; &quot;$DST&quot;<br>
&gt; +codesign --entitlements &quot;$ENTITLEMENT&quot; --force -s - &quot;$=
DST&quot;<br>
&gt; -- <br>
&gt; 2.24.3 (Apple Git-128)<br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div></div>

--000000000000f70a7b05b51d31fb--


