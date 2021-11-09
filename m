Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D223F44B235
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 18:51:48 +0100 (CET)
Received: from localhost ([::1]:45376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkVHf-0002Tt-O1
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 12:51:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1mkVFz-0000EM-9b
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:50:03 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:59146
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1mkVFx-0000ak-3h
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:50:02 -0500
Received: from macbook02.fritz.box (p57b42bf1.dip0.t-ipconnect.de
 [87.180.43.241])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 5CE1FDA0D1E;
 Tue,  9 Nov 2021 18:49:59 +0100 (CET)
To: Brad Smith <brad@comstyle.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210612080358.61176-1-sw@weilnetz.de>
 <202eedd1-eb24-5463-c17a-64e146b95421@comstyle.com>
 <c3f3e9af-c81e-078c-5200-e2532a468cf7@weilnetz.de>
 <ff5fc830-8df8-7bd6-32df-3e8627edd74b@amsat.org>
 <fa1b9eb9-e707-4dd1-78be-dce4c55c5004@comstyle.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] meson.build: Support ncurses on MacOS
Message-ID: <0b6d171d-4ceb-01a3-dbf6-2a7c964463db@weilnetz.de>
Date: Tue, 9 Nov 2021 18:49:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <fa1b9eb9-e707-4dd1-78be-dce4c55c5004@comstyle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.364,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.06.21 um 03:53 schrieb Brad Smith:

> On 6/14/2021 1:45 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 6/13/21 8:33 AM, Stefan Weil wrote:
>>> Am 13.06.21 um 03:40 schrieb Brad Smith:
>>>
>>>> This same problem also applies to OpenBSD as we have the same
>>>> version of ncurses with support for wide characters. I have a simila=
r
>>>> patch in our QEMU port.
>>>
>>> Then we should either extend the conditional statement to handle=20
>>> OpenBSD
>>> as well, or simply define both macros unconditionally:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 # Newer versions of curses use NCURSES_WIDEC=
HAR.
>>> =C2=A0=C2=A0=C2=A0=C2=A0 # Older versions (e. g. on MacOS, OpenBSD) s=
till require
>>> _XOPEN_SOURCE_EXTENDED.
>>> =C2=A0=C2=A0=C2=A0=C2=A0 curses_compile_args =3D ['-DNCURSES_WIDECHAR=
=3D1',
>>> '-D_XOPEN_SOURCE_EXTENDED=3D1']
>>>
>>> Defining only _XOPEN_SOURCE_EXTENDED would also work with old and new=

>>> versions, so that's another option.
>> It is simpler to ask Brad to upstream the OpenBSD patch :)
>
> That doesn't answer his question and that's the part that actually=20
> matters.


The question is still unanswered: which alternative is preferred?

- define only _XOPEN_SOURCE_EXTENDED=3D1 unconditionally

- define DNCURSES_WIDECHAR=3D1 and _XOPEN_SOURCE_EXTENDED=3D1 uncondition=
ally

- define DNCURSES_WIDECHAR=3D1 and _XOPEN_SOURCE_EXTENDED=3D1 for MacOS a=
nd BSD

All of them should work. We could also start and merge my commit which=20
does not fix the issue for BSD but at least fixes it for MacOS.

Peter, you added NCURSES_WIDECHAR in commit b01a4fd3bd7d. Which solution =

would you suggest?

Stefan






