Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7551512BE16
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Dec 2019 17:59:42 +0100 (CET)
Received: from localhost ([::1]:44730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ilFRE-0005g1-Td
	for lists+qemu-devel@lfdr.de; Sat, 28 Dec 2019 11:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34755)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ilFPn-0004eR-KO
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 11:58:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ilFPl-0000CW-5F
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 11:58:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59525
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ilFPk-00005p-SX
 for qemu-devel@nongnu.org; Sat, 28 Dec 2019 11:58:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577552287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZDik/qENimSiOTNyE7E+6Lmlst/8Rr8Dtv2Nv/DAZRk=;
 b=ZWuQG42EmLHQIS+X1QZe7cXvRefSP1kdj4MxKRSIQSMAi0Nn+m600BNPXVU2zfRw3FizYg
 rACyRcce7pert3XZB6KUY2e1eWf8TWnmciTNBwkVl/9/dAhyUnHFLFjxcYqQTJbnAZsPGv
 7kxg1meheASPXwX+IBWB+jh32VRpP4k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-BlOWC0hlPzm-o8b6c3rvoQ-1; Sat, 28 Dec 2019 11:58:04 -0500
Received: by mail-wm1-f69.google.com with SMTP id o24so1229984wmh.0
 for <qemu-devel@nongnu.org>; Sat, 28 Dec 2019 08:58:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eAPYpgunDwkHnTrJpGjelWBSwhOarkRJCG3bFIaFXno=;
 b=L+l2ZtEpRYPEZ/Gxap0fZIAyQn804SIEnvLoANZkVtF6Vv5N13CJL98PGyfSFeUYxY
 J2h5BwzIgm8ERbag84sdU8MGJsBN6dxfGW9IEMLJmeYMm+xyOMV2gORq86rwnih6m6H7
 mH6msDGVkFjTF4ay2T+b687iQtVLJxNBqA5v82Dh9YiaLUwZrjQO0fyqGbJ/Uthd68VE
 aAtlsqcDx9zCeJJojNbt0wtZw0tWaMzOo4E8eztA1hbUGP9Fsq0JbKX9RZ8ksnw+dn8u
 J2z2EdUEnsbR0gSo/lrprAE933cTdMjNoVifcsexk9V6g6dAircMw4glKguh89m0/hYt
 //Iw==
X-Gm-Message-State: APjAAAUdGv8EQj+h75rOZdZRCg/RleGdk+QnZC2JHUOU/lfIAHDEr2Kn
 BYT8/4VVSYQgFXsc97djH3R6z/16WAI7vkLuqh78vCepOVbGH2gtZ/zRgGAVSFkQ8bcviepmiXB
 g1txy0EzlrpAsEc0=
X-Received: by 2002:a1c:2355:: with SMTP id j82mr25561360wmj.135.1577552282985; 
 Sat, 28 Dec 2019 08:58:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqybXEVye3NsPFqO6CMDAYzh75QR/hKvBd45IcXBziGwvLYRSDch4KXdpzckKsmYcptrC3F4qw==
X-Received: by 2002:a1c:2355:: with SMTP id j82mr25561346wmj.135.1577552282748; 
 Sat, 28 Dec 2019 08:58:02 -0800 (PST)
Received: from [192.168.1.25] (abayonne-654-1-186-92.w92-134.abo.wanadoo.fr.
 [92.134.161.92])
 by smtp.gmail.com with ESMTPSA id f65sm14960078wmf.2.2019.12.28.08.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Dec 2019 08:58:02 -0800 (PST)
Subject: Re: [PATCH V3] target/i386: Fix handling of k_gs_base register in
 32-bit mode in gdbstub
To: "Marek Dolata - mkdolata@us.ibm.com" <mkdolata@us.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <2cf601fe9f2d4447ba4eec653df634ee@us.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b44c1837-037d-24f4-3ff0-6a36e3fea1e0@redhat.com>
Date: Sat, 28 Dec 2019 17:57:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2cf601fe9f2d4447ba4eec653df634ee@us.ibm.com>
Content-Language: en-US
X-MC-Unique: BlOWC0hlPzm-o8b6c3rvoQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Doug Gale <doug16k@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/19 12:37 AM, Marek Dolata - mkdolata@us.ibm.com wrote:
> Fixes: corrects clobbering of registers appearing after k_gs_base
>=20
> Buglink: https://bugs.launchpad.net/qemu/+bug/1857640
>=20
> Signed-off-by: Marek Dolata <mkdolata@us.ibm.com=20
> <mailto:mkdolata@us.ibm.com>>
>=20
> ---
>=20
> target/i386/gdbstub.c | 4 ++--
>=20
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/i386/gdbstub.c b/target/i386/gdbstub.c
>=20
> index aef25b70f1..572ead641c 100644
>=20
> --- a/target/i386/gdbstub.c
>=20
> +++ b/target/i386/gdbstub.c
>=20
> @@ -350,15 +350,15 @@ int x86_cpu_gdb_write_register(CPUState *cs,=20
> uint8_t *mem_buf, int n)
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 env->segs[R_GS].base =3D ldl_p(mem_=
buf);
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 4;
>=20
> -#ifdef TARGET_X86_64
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0 case IDX_SEG_REGS + 8:
>=20
> +#ifdef TARGET_X86_64
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (env->hflags & HF_CS64_MASK) {
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 env->kernelgsbase =3D l=
dq_p(mem_buf);
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 8;
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 env->kernelgsbase =3D ldl_p(mem_buf=
);
>=20
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 4;
>=20
> #endif
>=20
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return 4;
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0case IDX_FP_REGS + 8:
>=20
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cpu_set_fpuc(env, ldl_p(mem_buf));
>=20
> --=20
>=20
> 2.24.1
>=20

Still:

$ pwclient git-am 11311411
Applying patch #11311411 using "git am"
Description: [V3] target/i386: Fix handling of k_gs_base register in=20
32-bit mode in gdbstub
Applying: target/i386: Fix handling of k_gs_base register in 32-bit mode=20
in gdbstub
error: corrupt patch at line 25
Patch failed at 0001 target/i386: Fix handling of k_gs_base register in=20
32-bit mode in gdbstub
hint: Use 'git am --show-current-patch' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
'git am' failed with exit status 128

I thought this could be due to this recent git change:
https://github.com/git/git/commit/5983ddc1652
and would suggest to try with:

$ git config sendemail.transferEncoding 8bit

but you use git 2.24 and this got introduced in 2.25, so I'm not sure=20
what's wrong. You could still try, in case this helps...


