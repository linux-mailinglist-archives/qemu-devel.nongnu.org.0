Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A623B0030
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 11:28:25 +0200 (CEST)
Received: from localhost ([::1]:39134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvchk-00070W-Bv
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 05:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1lvcgq-0006JT-MY
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:27:28 -0400
Received: from redisdead.crans.org ([185.230.79.39]:41816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1lvcgo-00077p-CJ
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 05:27:28 -0400
Received: from [IPv6:2a02:8428:4db:b001:fc01:7e3f:bfe5:ef8d]
 (2a02-8428-04db-b001-fc01-7e3f-bfe5-ef8d.rev.sfr.net
 [IPv6:2a02:8428:4db:b001:fc01:7e3f:bfe5:ef8d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id 7EB16386;
 Tue, 22 Jun 2021 11:27:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1624354043; bh=wBzRDBDHbaX+EA0f/xHu1mtOTdpjnlH6z95zy7kvPVo=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=ZzDQBnEsWD2Mdd2ED4iWKMD/EQr3BpC4AWqrAnu4PVDf4k+s0RaGUWOZ87kyuY7tA
 TGSac4hEnYCaxVfUZGqGF6EYRA9qtv6V2q/qzWGqNrJk45+Mlja340jNpqa+N1eCbK
 poGyBRdX2qZHsk4cbUL4O7ZBPwcNjrymTXSeidSkuE4B1FSBVwfuTPwQQWUk1rUrkd
 wDO3FoPWQVHXsz8XpvGALQJjl81yVhN6ZRz6RThPVYl2jSWlQRCYY0VoakG6cA6nWv
 qHznQi6WXiRuYFkaw1wPAsxEO0NYtC/xgg3WMwlAyvzIU+kZ/DhuqvQliLtaCZiZi3
 bhC2UqxbHq4Q9tgf2NrfYEu3Qvjd5wdnUUnmYVWT7kb9hCGnKxNsrE74qlk08CmUbR
 8yxFkxWBhUBV/Xrb23/67cJ/+Vds/jW4XPhEeQXmIj/PKFOHyutlPH5loBDlIpfnSg
 JF4lBOTdUUNG/sOUpNbp4Wk0Z+Dx7FmHsI65rI0pQd1Poj0ciugd+XDYOoILlED1Io
 tcsf5Bj0fxXzdBdctmGXcC+HmjXkFTk4dgJcIAtb/UjBrvau/MgBp7hjvbPzjmt1H7
 Z84ckBlyNMKc7b54zqqa335NrjEsdlWIhjjWxp9P1FyXdXSa12pgVFoxvZ1kXrMGJP
 L4yb36OXFnOsMJ0hWMZz+Iew=
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210618091101.2802534-1-erdnaxe@crans.org>
 <20210618091101.2802534-3-erdnaxe@crans.org> <87y2b2s2gw.fsf@linaro.org>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Subject: Re: [PATCH v2 2/2] docs/devel: tvg-plugins: add execlog plugin
 description
Message-ID: <49027cc2-f89e-cbd6-cfc0-e59ce7dd4b17@crans.org>
Date: Tue, 22 Jun 2021 11:27:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <87y2b2s2gw.fsf@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9C91H4GwRnrhag1WM7xzCTdwwRaC0z7SX"
Received-SPF: pass client-ip=185.230.79.39; envelope-from=erdnaxe@crans.org;
 helo=redisdead.crans.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9C91H4GwRnrhag1WM7xzCTdwwRaC0z7SX
Content-Type: multipart/mixed; boundary="Q9FSJ2pHtJ1ud2Iqj8lzyNpPSbah5n6i0";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: "open list : All patches CC here" <qemu-devel@nongnu.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Message-ID: <49027cc2-f89e-cbd6-cfc0-e59ce7dd4b17@crans.org>
Subject: Re: [PATCH v2 2/2] docs/devel: tvg-plugins: add execlog plugin
 description
References: <20210618091101.2802534-1-erdnaxe@crans.org>
 <20210618091101.2802534-3-erdnaxe@crans.org> <87y2b2s2gw.fsf@linaro.org>
In-Reply-To: <87y2b2s2gw.fsf@linaro.org>

--Q9FSJ2pHtJ1ud2Iqj8lzyNpPSbah5n6i0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/22/21 10:48 AM, Alex Benn=C3=A9e wrote:
> Alexandre Iooss<erdnaxe@crans.org>  writes:
>> [...]
>> +
>> +The execlog tool traces executed instructions with memory access. It =
can be used
>> +for debugging and security analysis purposes.
> We should probably mention that this will generate a lot of output.
> Running the admittedly memory heavy softmmu memory test:
>=20
>    ./aarch64-softmmu/qemu-system-aarch64 -D test.out -d plugin \
>      -plugin contrib/plugins/libexeclog.so  \
>      -cpu max -serial mon:stdio -M virt \
>      -display none -semihosting-config chardev=3Dserial0 \
>      -kernel ./tests/tcg/aarch64-softmmu/memory
>=20
> generates a 8.6Gb text file. I suspect once this is merged you might
> want to look at options to target the instrumentation at areas of
> specific interest or abbreviate information.

Yes! In my downstream version I am triggering the beginning and the end=20
of trace acquisition by matching two virtual addresses of GPIO device=20
access. This works in my case because I'm also using the same GPIO for=20
triggering an oscilloscope, but maybe we would like to upstream=20
something more generic.

I'm still thinking about this (maybe for a later patch) but I believe it =

would be nice to have the following:
  - If no argument is given to the plugin, log everything.
  - Allow the user to specify either a memory address, an instruction=20
virtual address or an opcode that would start the acquisition.
  - Same to stop the acquisition.

This would look like this to start/stop acquisition using GPIO PA8 on=20
STM32VLDISCOVERY:

   ./arm-softmmu/qemu-system-arm -M stm32vldiscovery \
     -kernel ./firmware.elf -d plugin \
     -plugin libexeclog.so,arg=3Dmem:1073809424,arg=3Dmem:1073809424

I would like to hear other users opinion on this, because I fear I might =

implement something too specific.

Thanks,
-- Alexandre


--Q9FSJ2pHtJ1ud2Iqj8lzyNpPSbah5n6i0--

--9C91H4GwRnrhag1WM7xzCTdwwRaC0z7SX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmDRrPoFAwAAAAAACgkQbHknjz/NzAJo
kw/+L+2L8sT3uStvJXKauhe4aFbt4cgv3xlonc9j0ndnvitTuz2gP9bE88TS8MP6kIxoJNOqAAx1
rAelFXIOkCEvltklZBEYXYF7nDGV5MbGTThXk8toSUpxL759y5Xw3vfFtkCY+s5SreygL0zQF2v8
H9nyxzMLF+oaxRzxzhGNZ4MjU0HjvauFLQ80DlLxMl3aWS2oxOX+u17R/gSHRlA/5SShj3TZ70ZA
NjCxW92opdJnPDgjdjgdDMWHikVjmhw0Noo96l4TpEWvaoOv1ouPcyp2JpivbubgPr7bRPrn4TRq
VBmPI8yofTF9U8G0Me1AofpyLW16DqMd3DM9wov58c+awiZRtoQmHv2UNV8OBTBNdukblNaXsMmJ
8VIPOAQq0VaDpzoWYudQWvSnwZmOe5SDb+kdpZIxeE3X1Pere+ckfvEg+bJC0r8ax/WPwmQ2vbT2
8wsP2hFV37ZDainch59FRKyRJwrA+5GtbW7M7uk+MuNmjRI74+IHUSlpApbEwTr5SSeKIeDId+sk
woxsL480D9lz0mC05mGYGquN0iSDUNseh4LtqPVyoFnPeCF0JZsWdj8xd5BfGk8499drtHfNJJQx
v5cycy1PvkXWrZBmcLosbWIde0W4tXS76397mSj5fCovjdlB+EhXpYppNJuNnZUnYOjD5aKKyTf5
WzU=
=cx2V
-----END PGP SIGNATURE-----

--9C91H4GwRnrhag1WM7xzCTdwwRaC0z7SX--

