Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F0932047B
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 09:44:00 +0100 (CET)
Received: from localhost ([::1]:50804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDNrq-00015N-Nc
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 03:43:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1lDNqe-00009I-9E; Sat, 20 Feb 2021 03:42:44 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:49258
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1lDNqb-00007t-Dj; Sat, 20 Feb 2021 03:42:43 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id EBEF2DA0153;
 Sat, 20 Feb 2021 09:42:36 +0100 (CET)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 nerus <fhuvu30@gmail.com>, Ottavio Caruso <ottavio2006-usenet2012@yahoo.com>
References: <05BD61C1-9771-4EF9-AD1B-8DAB8DFD127A@hxcore.ol>
 <CAFEAcA8Xuf3WfPiNPqSVLz+tMgvO+6OzKTRQpJ_9Z7MqeO6pCw@mail.gmail.com>
 <b0bb2b4e-4ebe-f4c4-d8ef-191c19c876bb@amsat.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: problema compilation
Message-ID: <1025252d-41cd-9d30-983f-1db6c770b063@weilnetz.de>
Date: Sat, 20 Feb 2021 09:42:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b0bb2b4e-4ebe-f4c4-d8ef-191c19c876bb@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-discuss <qemu-discuss@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.02.21 um 00:07 schrieb Philippe Mathieu-Daud=C3=A9:

> Cc'ing Stefan / Yonggang / Paolo.
>
> On 2/20/21 12:03 AM, Peter Maydell wrote:
>> On Fri, 19 Feb 2021 at 22:54, nerus <fhuvu30@gmail.com> wrote:
>>> Good evening, I turn to you because I have a problem that does not ap=
pear in the official documentation, nor in the different blogs or irc cha=
nnels.
>>>
>>> I need to do a cross compilation but it is impossible from version 5.=
2, when I use msys2 an error occurs indicating that symbolic links cannot=
 be created even though the windows user has permissions to create symbol=
ic links, I configured this through gpedit.msc.
>>>
>>> when I use cygwin with the mingw64-w64 tool chain an error occurs whe=
reby meson says that it cannot find any compiler even though the compiler=
 path is specified in the configuration script, mingw cannot be used from=
 linux either due to There are many missing components that cannot be com=
piled by hand because the proper versions are no longer available, how co=
uld you solve these problems without using already compiled binaries? Tha=
nk you


The only tested build settings for producing 5.2 and newer Windows=20
binaries use Mingw-w64 cross tools on Linux. Up to now I did not try=20
building 5.2 on Windows.

Depending on the Linux distribution there are more or less missing=20
components.

As far as I know Fedora provides a rather complete list of cross=20
packages which not only covers the cross tools but also the required=20
other components (libraries).

Debian based distributions only provide the cross tools (compiler,=20
linker, nsis). It should be possible to compile all required libraries=20
by hand, but of course that is a lot of work. I recently did that for=20
the braille library, and it took me about a day to get 32 and 64 bit=20
binaries. Therefore I use Debian with the Mingw-w64 library cross=20
packages from Cygwin. My GitHub repository includes a GitHub action=20
which runs the cross builds:=20
https://github.com/stweil/qemu/blob/master/.github/workflows/build.sh.=20
That should also work on Windows with the Windows Subsystem for Linux (WS=
L).

Recently (with bullseye and later) Debian changed the exception handling =

for the 64 bit C++ cross compiler. Therefore Debian bullseye and similar =

distributions can no longer be used with the Cygwin libraries. I still=20
have no solution for that.

Stefan


>> Cross compilation works in general -- our CI testing setup
>> includes various cross-compile configurations, including
>> building Windows executables from a Linux host
>> (eg https://gitlab.com/qemu-project/qemu/-/jobs/1042844159).
>>
>> You'll need to be more specific about exactly what you're
>> trying to do and failing (eg quoting exact commands,
>> setups, error messages).



