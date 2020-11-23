Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 411F52C0E85
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 16:15:15 +0100 (CET)
Received: from localhost ([::1]:41308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khDYg-0001G2-22
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 10:15:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1khDWz-00007v-Oy
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:13:29 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:60330
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1khDWx-00045h-Ft
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 10:13:29 -0500
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 831CDDA3163;
 Mon, 23 Nov 2020 16:13:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id ax4G71-AhObb; Mon, 23 Nov 2020 16:12:46 +0100 (CET)
Received: from mobile-151-123.wlan.uni-mannheim.de
 (mobile-151-123.wlan.uni-mannheim.de [134.155.151.123])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 117CDDB1B01;
 Mon, 23 Nov 2020 15:40:51 +0100 (CET)
To: Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
References: <97b04446-ca94-cebd-2d8d-4c2013521208@weilnetz.de>
 <20201117175030.eqz5run2m7qmx5qt@steredhat>
 <a6c8de1a-da41-1a4a-8907-790c2467a0b0@redhat.com>
 <ee31c6f2-19dd-f3f6-d916-f04490909dd8@weilnetz.de>
 <d69b024e-9762-2b27-b558-0c60b3e96811@weilnetz.de>
 <53da03f4-f044-fb1d-9a1a-a793077cccc3@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: Regressions in build process introduced since August
Message-ID: <496e409e-533a-74fb-c4f7-8b394452d0be@weilnetz.de>
Date: Mon, 23 Nov 2020 15:40:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <53da03f4-f044-fb1d-9a1a-a793077cccc3@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.11.20 um 14:55 schrieb Paolo Bonzini:

> On 21/11/20 12:09, Stefan Weil wrote:
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -649,9 +649,8 @@ if get_option('vnc').enabled()
>> =C2=A0=C2=A0=C2=A0 vnc =3D declare_dependency() # dummy dependency
>> =C2=A0=C2=A0=C2=A0 png =3D dependency('libpng', required: get_option('=
vnc_png'),
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 method: 'pkg-config', st=
atic: enable_static)
>> -=C2=A0 jpeg =3D cc.find_library('jpeg', has_headers: ['jpeglib.h'],
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 required: get_option('vnc_jpeg'),
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 static: enable_static)
>
> Does it work if you just remove "static: enable_static"?=C2=A0 That ask=
s=20
> Meson to look explicitly for a ".a" file instead of just adding a=20
> "-ljpeg" flag.=C2=A0 However it is not what configure used to do so it =

> shouldn't be necessary.


No, that does not help. Neither header file nor library will be found in =

my cross environment without using the provided --extra-cflags and=20
--extra-ldflags, because all those files are installed below=20
/usr/i686-w64-mingw32/sys-root/mingw or=20
/usr/x86_64-w64-mingw32/sys-root/mingw which is not searched by the=20
default compiler settings. The Meson checks obviously don't use those fla=
gs.

pkg-config provides the right paths and works therefore.

Of course I can manually fix my cross environment and move or link all=20
header and library files to standard directories, so they will be found. =

But then I'd suggest to remove --extra-cflags and --extra-ldflags=20
because they promise something which they don't provide. I think that=20
full support for both configure options would be better.

Stefan




