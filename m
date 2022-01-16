Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D04D848FAA7
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 05:33:01 +0100 (CET)
Received: from localhost ([::1]:34806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8xDw-00034S-W6
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 23:33:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1n8xDA-0002PX-KY
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 23:32:12 -0500
Received: from [2607:f938:3000:8::2] (port=16868 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1n8xD8-0002Hk-GG
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 23:32:12 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4Jc2Dx0XtCz8PbN;
 Sat, 15 Jan 2022 23:32:01 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=QCsGKJHX6
 JBcI85/KfeanJptf1E=; b=M6f5aR7ysWhRdxOTkLqrwdxIOmm22W0sBOifckwtK
 CFg+CjHQ9Y7NM2TiVWOGy7eVhn/R6T+xPXGDYmDoENCDJIhmnQrmygETpppPYhGh
 Py3cVXiVMtKPGDucXefJoEcft+LNfzk7Du3BTX9MrCWJ2PxSoNS9rPBkapDpV6++
 Tk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=RK2
 LhMde6a6cTTtJ+jrPsUEKoPPSW8hWU+MeOfWpuStFfkOxdz5vUFUqSvk3cWu9f6Q
 c5CF1ao5q5Jkloxf6mkfbHjkVKUVcUpel2GjT7GDNR49au7pwp6MV5y+pGxUN/WH
 6ubmi8/WcLWMtWdCwlp5pxJ7UTFh0Y1gw3Bgup3E=
Received: from [192.168.6.68]
 (bras-base-toroon2719w-grc-53-142-114-5-252.dsl.bell.ca [142.114.5.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4Jc2Dw6h6Fz8PbK;
 Sat, 15 Jan 2022 23:32:00 -0500 (EST)
Message-ID: <ce2e40ad-e7cd-1da6-c2be-5d87775e2693@comstyle.com>
Date: Sat, 15 Jan 2022 23:32:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:97.0) Gecko/20100101
 Thunderbird/97.0
Subject: Re: [PATCH v2] audio: Add sndio backend
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Alexandre Ratchov <alex@caoua.org>, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org
References: <YbxamMLKHp3IbtlW@moule.localdomain>
 <8564d506-069e-b26f-b1e5-39e56e915951@t-online.de>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <8564d506-069e-b26f-b1e5-39e56e915951@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f938:3000:8::2
 (failed)
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/19/2021 4:07 PM, Volker R=C3=BCmelin wrote:

> Hi Alexandre,
>
>> sndio is the native API used by OpenBSD, although it has been ported t=
o
>> other *BSD's and Linux (packages for Ubuntu, Debian, Void, Arch, etc.)=
.
>>
>> Signed-off-by: Brad Smith<brad@comstyle.com>
>> Signed-off-by: Alexandre Ratchov<alex@caoua.org>
>> ---
>>
>> Thank you for the reviews and all the comments. Here's a second diff
>> with all the suggested changes:
>>
>> - Replace ISC license by SPDX-License-Identifier header
>> - Fix units (milli- vs micro-) in comment about SNDIO_LATENCY_US
>> - Drop outdated comment about the "size" argument of=20
>> sndio_get_buffer_out()
>> - Fix AUDIO_FORMAT_U32 handling (missing "break" statement)
>> - Set {read,write] methods to audio_generic_{read,write} (fixes crache=
s)
>> - Check if backend is enabled in sndio_poll_event()
>> - Usehttps://sndio.org=C2=A0 in description
>> - Mark options as available after 7.0 release (instead of 6.2)
>> - Describe sndio-specific options (dev, latency) in qemu-options.hx
>> - Add myself as reviewer to MAINTAINERS
>> - Style fixes: no space after function names, use 4-space indent
>> - Don't use "return foo()" if foo() returns void
>> - Include backend to audio_drivers_priority[]
>>
>> Tested on OpenBSD, works as expected!
>>
>> =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +
>> =C2=A0 audio/audio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 1 +
>> =C2=A0 audio/audio_template.h |=C2=A0=C2=A0 2 +
>> =C2=A0 audio/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1=
 +
>> =C2=A0 audio/sndioaudio.c=C2=A0=C2=A0=C2=A0=C2=A0 | 555 ++++++++++++++=
+++++++++++++++++++++++++++
>> =C2=A0 meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
>> =C2=A0 meson_options.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4=
 +-
>
> I just noticed you changed meson_options.txt but you forgot to=20
> regenerate scripts/meson-buildoptions.sh with make update-buildoptions=20
> in your build directory. See docs/devel/build-system.rst.

My bad. That was me. We were discussing the diff before Alexandre posted=20
it. I was not sure
if the auto-generated file should be touched.

>
> And I'm still convinced you should CC all maintainers of the files=20
> this patch changes.
>
> With best regards,
> Volker
>
>> =C2=A0 qapi/audio.json=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 25 +-
>> =C2=A0 qemu-options.hx=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 16 ++
>> =C2=A0 tests/vm/freebsd=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 3 +
>> =C2=A0 10 files changed, 618 insertions(+), 3 deletions(-)
>>
>

