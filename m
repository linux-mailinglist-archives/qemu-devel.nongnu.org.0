Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB265650AAF
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 12:22:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7EDp-0006eq-8F; Mon, 19 Dec 2022 06:22:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p7EDe-0006eL-Pj
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:22:06 -0500
Received: from mout.gmx.net ([212.227.15.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p7EDc-0000zR-Ka
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:22:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671448913; bh=JsIoVp+eODZ+PCks4+Bn5UnzgfurWI8lMugfbd1xl78=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=dC5KqmQauug+XMg91BCC7t73zLBe0XGDJaBjghc053DjD0v2nl+Y7M3/njzEaXfJv
 aKHP9afa0fJOrnYIKYc8WVAzmUYk63H81tVU9Yz3bWqi4ZKEHkJkDhdrazQt+JzAmA
 +SR532qiy4Abxq4QQsVVfxU6rAAqp2DGKvHONDbU7kSwAkddzLykppPgPanE1D2a0c
 SCbdHvZaJRett4zGmC5tQnb7a7jVudXvP5TF6yCXHGbIsUJOzrxLS9P6cUujULLwob
 6uKVI65jlM0z4Fwf9pq0N/JVI/kpUrjwIPuld5x7ZsrqWcqleTZk/r7aGVqUq/PInp
 J45H0dCGw+88w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.151.196]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHG8g-1p2sdN1aqG-00DKr0; Mon, 19
 Dec 2022 12:21:53 +0100
Message-ID: <75b841f6-1eab-9d5f-2ad7-89440931ac18@gmx.de>
Date: Mon, 19 Dec 2022 12:21:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>
References: <Y5zB+5t5K0AEj6Rn@p100>
 <31003f9a-5392-67ee-9ef2-01794c09510c@redhat.com>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] meson: Clean up some dependencies regarding qemu-system
In-Reply-To: <31003f9a-5392-67ee-9ef2-01794c09510c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Bbmm0LSncwPwLhCuGKPlcwcZLMamvzMCPNtTvWUEBehYAXm+hal
 mpg84Kb+9RCok9d5upMBgbYOSeW3ggU994VGXqKi/Zm2+vDldDdOoTJSjqqQERAvpKGCTg1
 ATXU+h6z8N2buwd5TM6qITwkbMgvd8gPPqNCL4m+NxqHQ34Kh9ZXdfAN3XSwMbhLt3+TEnN
 YwtJbyMz/VWS0TCmrtqog==
UI-OutboundReport: notjunk:1;M01:P0:65bJWLKxegY=;s1ym/Qqw00UXq441irfNWvNPZGQ
 wtLDWXXdMaiM7E7DrkHOAm9sGUvONXJ+4ZAuWckk9KTWcPDchZh/87Z06V9uumGS1BiJdGoGV
 ssEOZ/95SvMA2yWRhYLFyrDYngOIX0QBchXBTyRPSIhNrUMK6KV+B8yf9+uMISCKge1aMQAdi
 aL8A2tlED96DYo7we36KVka9YEcoWbUijuspCZCTqfUMokOQkAgQ1FJnbELzLuqzO1xk/sx2M
 19i/IZVqSRRtDKY2LjTEzAw+CE/f9HrsHY/9g0zUqnFAR0Hxpno9ZwOjP2089dZnNnFUgTB3l
 IYGnWrR6UyWmHUG8YaA1CnwONztSWj8s1sm3xtut+9Wl80FXQ63K2Hpkc/CEyQt/IgGP6WGm1
 cWbFSVvVVO3vaJuaDfNaH/7y5C8XhG/Zh3Ns61ZahA9o13XxTxgdwdPlECGTft1L8LRxh55b/
 dbfodHbyBD8lOCjSu8zgtq8yh+/CJyoyKXZSOp4kwp+mlw1nKMtMGvDDvJHpflKR0I4ZoBJ+p
 OVh4d2T9qUtFVy2z3o2YO93ie7LGPW5krGy559epNjA75gVCmou7goX3KzQ9+BuW+Gb81AGiM
 EkbizvL3AkvbygaPktsc1HiiPJ4Se7qeSOcawNiNOXuqYBaNBROgHqIaRdKPhTeoyEE/srIvC
 8DsUh7mEqgC+Jq0wp6SrSbv+fsYB+Uw88x9gOPKee+I0GtF+TiYLWJ6PNe9/9DPZzxeWCVdXh
 j/Q05bOEnyLeS1kEsEbw6o/FOTlIy0YhmZIWqvTmL6HaknapICQ/4IkmOVtyoyUU4h2jn2Hic
 Kzz2DqXqVzOAppwrMbEVsOwk3RyTcaB1U0TDAOxD3lcGQkcrR7pM7U/nUWaLvn2whllOZyJeG
 B1S9oFCrPQbzTEm5NxWhiLO71zZtYm5uzHpbWzxSNkApuPz31Lqm1GRNI33vFzD+ZHLy9okYQ
 MmY3wCJPVJzK36k27mnGHa/3shc=
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Paolo,

On 12/17/22 14:28, Paolo Bonzini wrote:
> On 12/16/22 20:07, Helge Deller wrote:
>> @@ -3581,7 +3581,7 @@ subdir('qga')
>>
>> =C2=A0 # Don't build qemu-keymap if xkbcommon is not explicitly enabled
>> =C2=A0 # when we don't build tools or system
>> -if xkbcommon.found()
>> +if xkbcommon.found() and have_system
>> =C2=A0=C2=A0=C2=A0 # used for the update-keymaps target, so include rul=
es even if !have_tools
>> =C2=A0=C2=A0=C2=A0 qemu_keymap =3D executable('qemu-keymap', files('qem=
u-keymap.c', 'ui/input-keymap.c') + genh,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 dependencies: [qemuutil, xkbcommon], install: =
have_tools)
>> @@ -3596,7 +3596,9 @@ if have_tools
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 dependencies: [blockdev, qemuutil, gnutls, sel=
inux],
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 install: true)
>>
>> -=C2=A0 subdir('storage-daemon')
>> +=C2=A0 if have_system
>> +=C2=A0=C2=A0=C2=A0 subdir('storage-daemon')
>> +=C2=A0 endif
>> =C2=A0=C2=A0=C2=A0 subdir('contrib/rdmacm-mux')
>> =C2=A0=C2=A0=C2=A0 subdir('contrib/elf2dmp')
>>
>> @@ -3611,7 +3613,7 @@ if have_tools
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 subdir('contrib/vhost-user-scsi')
>> =C2=A0=C2=A0=C2=A0 endif
>>
>> -=C2=A0 if targetos =3D=3D 'linux'
>> +=C2=A0 if targetos =3D=3D 'linux' and have_system
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 executable('qemu-bridge-helper', files('=
qemu-bridge-helper.c'),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 dependencies: [qemuutil, libcap_ng],
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 install: true,
>> diff --git a/tools/meson.build b/tools/meson.build
>> index 10eb3a043f..740d572a94 100644
>> --- a/tools/meson.build
>> +++ b/tools/meson.build
>> @@ -5,7 +5,7 @@ have_virtiofsd =3D get_option('virtiofsd') \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 error_message: 'virtiofsd requires libcap-ng-devel and sec=
comp-devel') \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .require(have_vhost_user,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 error_message: 'virtiofsd needs vhost-user-support') \
>> -=C2=A0=C2=A0=C2=A0 .disable_auto_if(not have_tools and not have_system=
) \
>> +=C2=A0=C2=A0=C2=A0 .disable_auto_if(not have_system) \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .allowed()
>>
>> =C2=A0 if have_virtiofsd
>>
>
> These are wrong.  qemu-bridge-helper, virtiofsd, qemu-storage-daemon
> and qemu-keymap *are* tools; if they fail to build due to any
> dependencies, or due to other compilation issues, you need to add
> tests to meson.build and check for the cause of the issues.

No doubt, those are *tools*.
But aren't those only required when you run system- and/or user-emulation?

Looking at the packaging of qemu in debian:

qemu-system-common debian package consists of thse *tools*:
   qemu-bridge-helper, vhost-user-gpu, virtfs-proxy-helper, virtiofsd

qemu-utils debian package consists of the *utilities*:
   qemu-img, qemu-io, qemu-nbd

IMHO this categorization makes sense.
My patch was targetting at making "qemu-utils" possible to build
and that's why I think the tools you mention should depend on "have_system=
".

> The rest is okay.

Ok, thanks!

Helge

