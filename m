Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8F952775
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 11:05:09 +0200 (CEST)
Received: from localhost ([::1]:57696 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfhNz-0004dB-EY
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 05:05:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36280)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dinechin@redhat.com>) id 1hfhK4-0003X8-Tz
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 05:01:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dinechin@redhat.com>) id 1hfhJy-0003uE-6b
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 05:01:00 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44056)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dinechin@redhat.com>) id 1hfhJu-0003jL-DJ
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 05:00:55 -0400
Received: by mail-wr1-f66.google.com with SMTP id r16so16871548wrl.11
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2019 02:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=d9ahpKE7sH2SH5j3Lrdal3YlScUkOLx1/zKcDhQbm3I=;
 b=Eeb7RM9+NBjptmlUe+NH+EDtbeP9Pq7HSlY7JXcv5yL8RrQ8R12nWcQaYu0AJo3nB8
 Ipdb9x5jZSvBiI4g2pxC/EqVjsaO1ud0kQDx00yR2tk5bMUk6nyxtNkQEImCplxTLVV/
 WHrnBX1GzYaINuoCM5iUff8/17j1xVp3pD7h8/WP5zzLaPX5uUpo27BBFOEOcjM1ZzMF
 CmAdN1sWTdk4tEcjxN4SIAoKHZOqLKyn98MxqmqW+qOpMWGiNmtEf94nVHWbiK4Iv5wb
 MjyprNpIgMqyQzbG43AA3vawgxHUg5Phrtw7nnY+qW8txHcO9SBvmYFv9KIsIIcKd0Gx
 Hvag==
X-Gm-Message-State: APjAAAX6UXE8mxOxSZ6LKCcQ8+7hLtTtwhuxTTpsfIEXl60JV3ytDWd5
 wqsfNhD3dJnl1i5O5P12iSgAAA==
X-Google-Smtp-Source: APXvYqxniLZSJdOHUTy0MrSU2SMD9ZGSawwfPBc+oyyWMbvHC/fqa/tQFFueH9/0QRDOz4PKA0TACg==
X-Received: by 2002:adf:ce03:: with SMTP id p3mr4279007wrn.94.1561453239676;
 Tue, 25 Jun 2019 02:00:39 -0700 (PDT)
Received: from ?IPv6:2a01:e35:8b6a:1220:e1dd:b35b:b1e3:d497?
 ([2a01:e35:8b6a:1220:e1dd:b35b:b1e3:d497])
 by smtp.gmail.com with ESMTPSA id g11sm12807217wru.24.2019.06.25.02.00.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 02:00:38 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: Christophe de Dinechin <dinechin@redhat.com>
In-Reply-To: <20190625081339.9176-1-pbonzini@redhat.com>
Date: Tue, 25 Jun 2019 11:00:37 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <07028450-D777-4A5C-A8F8-796B29E362BB@redhat.com>
References: <20190625081339.9176-1-pbonzini@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH] minikconf: do not include variables from
 MINIKCONF_ARGS in config-all-devices.mak
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 25 Jun 2019, at 10:13, Paolo Bonzini <pbonzini@redhat.com> wrote:
>=20
> When minikconf writes config-devices.mak, it includes all variables =
including
> those from MINIKCONF_ARGS.  This causes values from config-host.mak to =
"stick" to
> the ones used in generating config-devices.mak, because =
config-devices.mak is
> included after config-host.mak.  Avoid this by omitting assignments =
coming
> from the command line in the output of minikconf.
>=20
> Reported-by: Christophe de Dinechin <cdupontd@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
> scripts/minikconf.py | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/minikconf.py b/scripts/minikconf.py
> index 0ffc6c38da..3109a81db7 100644
> --- a/scripts/minikconf.py
> +++ b/scripts/minikconf.py
> @@ -688,11 +688,13 @@ if __name__ =3D=3D '__main__':
>=20
>     data =3D KconfigData(mode)
>     parser =3D KconfigParser(data)
> +    external_vars =3D set()
>     for arg in argv[3:]:
>         m =3D re.match(r'^(CONFIG_[A-Z0-9_]+)=3D([yn]?)$', arg)
>         if m is not None:
>             name, value =3D m.groups()
>             parser.do_assignment(name, value =3D=3D 'y')
> +            external_vars.add(name[7:])
>         else:
>             fp =3D open(arg, 'r')
>             parser.parse_file(fp)
> @@ -700,7 +702,8 @@ if __name__ =3D=3D '__main__':
>=20
>     config =3D data.compute_config()
>     for key in sorted(config.keys()):
> -        print ('CONFIG_%s=3D%s' % (key, ('y' if config[key] else =
'n')))
> +        if key not in external_vars:
> +            print ('CONFIG_%s=3D%s' % (key, ('y' if config[key] else =
'n')))

The approach is interesting, and shorter than the fix
I had in mind, which was to add a target to generate
all the config*.mak, then call that from the configure script,
forcing external variables on the command-line to
override config*.mak values

>=20
>     deps =3D open(argv[2], 'w')
>     for fname in data.previously_included:
> --=20
> 2.21.0

This seems to address the leftover CONFIG_SPICE=3Dy, but
I ran into what looks like new compilation errors with this.
For example, with a configure that strips quite a lot away:

monitor/hmp-cmds.c: In function =E2=80=98hmp_change=E2=80=99:
monitor/hmp-cmds.c:1946:17: error: unused variable =E2=80=98hmp_mon=E2=80=99=
 [-Werror=3Dunused-variable]
 1946 |     MonitorHMP *hmp_mon =3D container_of(mon, MonitorHMP, =
common);
      |                 ^~~~~~~

This is apparently a side effect of that variable being used
only under CONFIG_VNC. Patch upcoming. There may be
other similar side effects.


Tested-by: Christophe de Dinechin <dinechin@redhat.com>
Reviewed-by: Christophe de DInechin <dinechin@redhat.com>


