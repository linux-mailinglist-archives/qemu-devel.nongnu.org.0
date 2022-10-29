Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D598612258
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 13:26:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oojxG-0003vT-Ut; Sat, 29 Oct 2022 07:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oojxF-0003uw-CY; Sat, 29 Oct 2022 07:24:45 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oojxD-0006WG-Hv; Sat, 29 Oct 2022 07:24:45 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 c7-20020a05600c0ac700b003c6cad86f38so7996202wmr.2; 
 Sat, 29 Oct 2022 04:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EtSySslr/yhIcNV+IC8eyk5jT3dzu/2c0zam/IsvjR0=;
 b=npvg7JOVl7oT7e8Ws0RnZ7wvAaGnUhEznrOjYPv3un2Aq/P4axXWZjbJxdysNZ/leF
 b2nfuMVBzDFsqfm4J0t1mwJsuuLxWQwoGicRIieIWHVokOb2CnSUb06dmmie66o/Wq6g
 hTitP5ZfJOL5MAUdY2XxHnagA2BBVuZ6zdyNknmtTpC29qiDSxBt8lGZh8ASrLH2LOLx
 PZnNJH+xqPhYD74AYgIie5daBKWAVo139OCO+cVDhQE9yA/yJxC6y0DxR9CZoqd2s25K
 //4mz6onRvLZOk6C8DeBJXG+gpvEjPu6Q0+WyJpzCsn9kI33ihCcE6ac5NXWPkbiDTW5
 lAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EtSySslr/yhIcNV+IC8eyk5jT3dzu/2c0zam/IsvjR0=;
 b=LZoK7/8F8tV1STNneie4DFBPUNzV2ktTOCaTPml56K2FPyYKsStr6nHO1Kmh6WEbmu
 KDAaVgnGZhR45gzWJGQG0q0exUDnytMSSD2V3INYSgQOHOJVjq/h8GoKJEjTsopH/FGQ
 lf9UJzRFV8igKfoehe4WAjW5t3lxmQCvHH5gO1wU8kLGa0lwD2Oj58yZTLMbOp2qmulB
 sqgtBCP+5jHp6qMatwb5agjKheWa2pG2lm8+OPLr8theMWhC8FGwA8m1EpAmPJAc1nkt
 kPZXbj57uuf7N7BLOnhEPDdvNpFhfXOBvuYgMpzb/vanVBw23NHZuUPYzLI1VLRKbKNu
 sAQQ==
X-Gm-Message-State: ACrzQf3+vVTLLyKrL/khFFZmNoYBZQfAdS+fnbio4GVR/AXVjADmo39O
 GPg6WFBsnobBRkC2aiV8k7I=
X-Google-Smtp-Source: AMsMyM6CDLHp0N5ORL3CGqFXlibR5vtJbqAjiZLZI3TW71vFzR56hv1R2WqQabXI64WbrbrR2j942A==
X-Received: by 2002:a05:600c:1da8:b0:3c6:ca7c:2e87 with SMTP id
 p40-20020a05600c1da800b003c6ca7c2e87mr2130628wms.126.1667042680241; 
 Sat, 29 Oct 2022 04:24:40 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf0bb200c875a4c76b3be6c4.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:c875:a4c7:6b3b:e6c4])
 by smtp.gmail.com with ESMTPSA id
 e11-20020adfa44b000000b0023655e51c33sm1293079wra.4.2022.10.29.04.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Oct 2022 04:24:39 -0700 (PDT)
Date: Sat, 29 Oct 2022 11:24:37 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Antony Pavlov <antonynpavlov@gmail.com>, BALATON Zoltan <balaton@eik.bme.hu>, 
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>, 
 Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jan Kiszka <jan.kiszka@web.de>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v4 5/7] hw/ppc/e500: Implement pflash handling
In-Reply-To: <87865821-9729-e9d8-e789-cc8dc4159acb@gmail.com>
References: <20221018210146.193159-1-shentey@gmail.com>
 <20221018210146.193159-6-shentey@gmail.com>
 <eea963b8-f6d9-b345-376e-7fd6dad73cd4@gmail.com>
 <202ae9ed-c1d1-ea57-6c50-b9c24f12dd5e@linaro.org>
 <87865821-9729-e9d8-e789-cc8dc4159acb@gmail.com>
Message-ID: <19965CB1-606E-4B98-A8E2-B33AEC491C02@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 29=2E Oktober 2022 09:29:33 UTC schrieb Daniel Henrique Barboza <danielh=
b413@gmail=2Ecom>:
>
>
>On 10/28/22 19:42, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 28/10/22 17:09, Daniel Henrique Barboza wrote:
>>> Bernhard,
>>>=20
>>> The 32 builds aren't fancying this patch=2E The issue is down there:
>>>=20
>>> On 10/18/22 18:01, Bernhard Beschow wrote:
>>>> Allows e500 boards to have their root file system reside on flash usi=
ng
>>>> only builtin devices located in the eLBC memory region=2E
>>>>=20
>>>> Note that the flash memory area is only created when a -pflash argume=
nt is
>>>> given, and that the size is determined by the given file=2E The idea =
is to
>>>> put users into control=2E
>>>>=20
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>> ---
>>>> =C2=A0 docs/system/ppc/ppce500=2Erst | 16 ++++++++
>>>> =C2=A0 hw/ppc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
>>>> =C2=A0 hw/ppc/e500=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 79 ++++++++++++++++++++++++++++++=
+++++++
>>>> =C2=A0 3 files changed, 96 insertions(+)
>>=20
>>>> @@ -1024,6 +1061,48 @@ void ppce500_init(MachineState *machine)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmc->platform_bus_ba=
se,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &pms->pbus_dev->mmio=
);
>>>> +=C2=A0=C2=A0=C2=A0 dinfo =3D drive_get(IF_PFLASH, 0, 0);
>>>> +=C2=A0=C2=A0=C2=A0 if (dinfo) {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BlockBackend *blk =3D blk=
_by_legacy_dinfo(dinfo);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BlockDriverState *bs =3D =
blk_bs(blk);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t size =3D bdrv_ge=
tlength(bs);
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t mmio_size =3D pm=
s->pbus_dev->mmio=2Esize;
>>>=20
>>> ^ here=2E The issue is that on a 32 bit system it is not possible to c=
ast the
>>> Int128 type to uint64_t:
>>>=20
>>> FAILED: libqemu-ppc64-softmmu=2Efa=2Ep/hw_ppc_e500=2Ec=2Eo
>>> 3746cc -m32 -Ilibqemu-ppc64-softmmu=2Efa=2Ep -I=2E -I=2E=2E -Itarget/p=
pc -I=2E=2E/target/ppc -I=2E=2E/dtc/libfdt -Iqapi -Itrace -Iui -Iui/shader =
-I/usr/include/pixman-1 -I/usr/include/glib-2=2E0 -I/usr/lib/glib-2=2E0/inc=
lude -I/usr/include/sysprof-4 -fdiagnostics-color=3Dauto -Wall -Winvalid-pc=
h -Werror -std=3Dgnu11 -O2 -g -isystem /builds/danielhb/qemu/linux-headers =
-isystem linux-headers -iquote =2E -iquote /builds/danielhb/qemu -iquote /b=
uilds/danielhb/qemu/include -iquote /builds/danielhb/qemu/tcg/i386 -pthread=
 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=
=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef -Ww=
rite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv =
-Wold-style-declaration -Wold-style-definition -Wtype-limits -Wformat-secur=
ity -Wformat-y2k -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-ext=
erns -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-=
missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fstack-protector=
-strong -fPIE -isystem=2E=2E/linux-headers -isystemlinux-headers -DNEED_CPU=
_H '-DCONFIG_TARGET=3D"ppc64-softmmu-config-target=2Eh"' '-DCONFIG_DEVICES=
=3D"ppc64-softmmu-config-devices=2Eh"' -MD -MQ libqemu-ppc64-softmmu=2Efa=
=2Ep/hw_ppc_e500=2Ec=2Eo -MF libqemu-ppc64-softmmu=2Efa=2Ep/hw_ppc_e500=2Ec=
=2Eo=2Ed -o libqemu-ppc64-softmmu=2Efa=2Ep/hw_ppc_e500=2Ec=2Eo -c =2E=2E/hw=
/ppc/e500=2Ec
>>> 3747=2E=2E/hw/ppc/e500=2Ec: In function 'ppce500_init':
>>> 3748=2E=2E/hw/ppc/e500=2Ec:1069:30: error: incompatible types when ini=
tializing type 'uint64_t' {aka 'long long unsigned int'} using type 'Int128=
'
>>> 3749 1069 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t m=
mio_size =3D pms->pbus_dev->mmio=2Esize;
>>> 3750=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~
>>> 3751[3207/5331] Compiling C object libqemu-ppc64-softmmu=2Efa=2Ep/hw_p=
pc_mpc8544_guts=2Ec=2Eo
>>>=20
>>>=20
>>> What I did to solve the problem is this:
>>>=20
>>>=20
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t mmio_size =
=3D int128_get64(pms->pbus_dev->mmio=2Esize); >
>>> This will get the lower 64 bits and return an uint64_t=2E
>>>=20
>>> Note that this function will assert if mmio=2Esize is bigger than UINT=
64_MAX, but
>>> since you're doing an error(1) on the "if size > mmio_size" conditiona=
l, this
>>> assert() is not introducing a new side effect=2E We'll just fail earli=
er with
>>> a different error message=2E
>>=20
>> Simply use:
>>=20
>>  =C2=A0 memory_region_size(pms->pbus_dev->mmio);
>
>Nice! I'll change it in-tree before re-sending the PR=2E

Thanks Daniel!

Bernhard
>
>
>Daniel
>
>>=20


