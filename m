Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 167283BC473
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 02:52:37 +0200 (CEST)
Received: from localhost ([::1]:44532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0ZKG-0006PC-4n
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 20:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m0ZJS-0005Tl-PH
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 20:51:46 -0400
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c]:44683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1m0ZJR-0002xK-78
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 20:51:46 -0400
Received: by mail-qv1-xf2c.google.com with SMTP id c5so209245qvu.11
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 17:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=uqN+xjDgwlyEfF2U6KsFk9FKkWJ99BLhz2dKjIWUx3Q=;
 b=f3p9zObxGSG0pCnTYv+FZxjceWfDgGKFk57e3x82kiJayTGbl94icQ558juUGFwmkQ
 OTe8UJM3uc7geO+BEZNdKnfME7Tofgn5TMkiCfiylyIMjZ4iUyxvOT9NchkSU2muBqwq
 TrPeckGJsFjj+nWzDbIc9U5pQCm5fr6teL9tMqs/IA3w/BfpF1d5D8TWObrXhGqt/io1
 Oelwze2AxRPHx7k/FyIw1g+SIygQ8Lj72K+az4/0rERICK0AbdomhrOyIz44ESDAQ/Tq
 +ZpfKioa8GnBC8l/WaXSIwnFeiz9ODO0UgfUSKeLzorY9J/+GXvqPae6h8gQitPoNnpp
 /E8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=uqN+xjDgwlyEfF2U6KsFk9FKkWJ99BLhz2dKjIWUx3Q=;
 b=MlHqFU/SNsHkrx5UDpgimX8dZPIErpM2YXBZ/ZEBtXySl7xpjZ4bliJzUQVBHuexhp
 Dp9AY2Ek2axVl01E2fIeJYBLv8P2lF8jQWAcMZENOkh8q0gX+5+Wj+PWGE8uqWtDnDjc
 ygkncpJ2ypSxlYzh7NqSWDHAOkQwIPuIl7g/21Hj1viwXZTZw0OOSwEQ+Tv1IXr4WbAH
 jS1BUoz8ldvzN5mvLX2xeCIzr7KKS8wqkG3Dc82BYLYrU/H6pz6TcysAG7JkG2eXKPSO
 m5Y3FVKq3yk0Hu2+hM2/yE5pViwZCT4e86BKbwgTNuXu+DUaWlMaevKJlVbQVOB9p34B
 mgVw==
X-Gm-Message-State: AOAM533VF2oV2A+WuHrNqWpB74caPvv0YVNpGmYn2dwiwYbW6b8OMxi+
 Z8p7fFFXFRG8AA/sk6imGdE=
X-Google-Smtp-Source: ABdhPJz4Z+bRffNMPCc4UfLdtIQpm/aF3i0K3EPmknsU63lAMEmmu1ev7Al4mLWftkqplqH5cq4VFA==
X-Received: by 2002:a0c:eb12:: with SMTP id j18mr15225515qvp.1.1625532703945; 
 Mon, 05 Jul 2021 17:51:43 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id y3sm6030783qkf.2.2021.07.05.17.51.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Jul 2021 17:51:43 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH v2] Set icon for QEMU binary on Mac OS
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <CABgObfagru8NH36anTRU-DkOoRDrsQ1MOHMtxbHcZu5pU1ZYmg@mail.gmail.com>
Date: Mon, 5 Jul 2021 20:51:42 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <34D6C0E3-AD64-47C7-83F9-5D37921450CA@gmail.com>
References: <20210705195328.36442-1-programmingkidx@gmail.com>
 <CABgObfagru8NH36anTRU-DkOoRDrsQ1MOHMtxbHcZu5pU1ZYmg@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2c;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



> On Jul 5, 2021, at 4:07 PM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>=20
> Well, you're not using $ICON at all but I can clean that up myself. =
Thanks for testing.
>=20
> Paolo
>=20

Please send me the cleaned up patch for testing once you complete it. =
Thank you.


> Il lun 5 lug 2021, 21:53 John Arbuckle <programmingkidx@gmail.com> ha =
scritto:
> Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
> ---
> v1 changes:
> Rewrote the patch as the maintainer had wanted.
>=20
>  meson.build            | 15 ++++++++++-----
>  scripts/entitlement.sh | 10 +++++++++-
>  2 files changed, 19 insertions(+), 6 deletions(-)
>=20
> diff --git a/meson.build b/meson.build
> index db6789af9c..499ab49981 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2360,8 +2360,7 @@ foreach target : target_dirs
>    endif
>    foreach exe: execs
>      exe_name =3D exe['name']
> -    exe_sign =3D 'CONFIG_HVF' in config_target
> -    if exe_sign
> +    if targetos =3D=3D 'darwin'
>        exe_name +=3D '-unsigned'
>      endif
>=20
> @@ -2375,7 +2374,13 @@ foreach target : target_dirs
>                 link_args: link_args,
>                 gui_app: exe['gui'])
>=20
> -    if exe_sign
> +    if 'CONFIG_HVF' in config_target
> +      entitlements =3D meson.current_source_dir() / =
'accel/hvf/entitlements.plist'
> +    else
> +      entitlements =3D '/dev/null'
> +    endif
> +    if targetos =3D=3D 'darwin'
> +      icon =3D '...'
>        emulators +=3D {exe['name'] : custom_target(exe['name'],
>                     depends: emulator,
>                     output: exe['name'],
> @@ -2383,14 +2388,14 @@ foreach target : target_dirs
>                       meson.current_source_dir() / =
'scripts/entitlement.sh',
>                       meson.current_build_dir() / exe_name,
>                       meson.current_build_dir() / exe['name'],
> -                     meson.current_source_dir() / =
'accel/hvf/entitlements.plist'
> +                     entitlements, icon
>                     ])
>        }
>=20
>        meson.add_install_script('scripts/entitlement.sh', '--install',
>                                 get_option('bindir') / exe_name,
>                                 get_option('bindir') / exe['name'],
> -                               meson.current_source_dir() / =
'accel/hvf/entitlements.plist')
> +                               entitlements, icon)
>      else
>        emulators +=3D {exe['name']: emulator}
>      endif
> diff --git a/scripts/entitlement.sh b/scripts/entitlement.sh
> index f7aaaf2766..46e378426b 100755
> --- a/scripts/entitlement.sh
> +++ b/scripts/entitlement.sh
> @@ -11,6 +11,7 @@ fi
>  SRC=3D"$1"
>  DST=3D"$2"
>  ENTITLEMENT=3D"$3"
> +ICON=3D"$4"
>=20
>  if $in_place; then
>    trap 'rm "$DST.tmp"' exit
> @@ -20,6 +21,13 @@ else
>    cd "$MESON_INSTALL_DESTDIR_PREFIX"
>  fi
>=20
> -codesign --entitlements "$ENTITLEMENT" --force -s - "$SRC"
> +if test "$ENTITLEMENT" !=3D '/dev/null'; then
> +  codesign --entitlements "$ENTITLEMENT" --force -s - "$SRC"
> +fi
> +
> +# Add the QEMU icon to the binary on Mac OS
> +Rez -append '../pc-bios/qemu.rsrc' -o "$SRC"
> +SetFile -a C "$SRC"
> +
>  mv -f "$SRC" "$DST"
>  trap '' exit
> --=20
> 2.24.3 (Apple Git-128)
>=20


