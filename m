Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B1C2F4D3B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:38:35 +0100 (CET)
Received: from localhost ([::1]:40506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhI8-0004Jz-MX
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:38:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1kzh4J-0002Yw-4K
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:24:18 -0500
Received: from mout.gmx.net ([212.227.15.19]:57115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1kzh4F-0002oL-5s
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:24:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1610547815;
 bh=/hNCXOLmNzhOpDmVUMxdmNkmQHEzagwlWqorhgqRlKM=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=CAMOHlZq4QxSHrarkfP73iKH6JgZYj0xkFY6v6wzhorB7E3yHGN4uq9IcluNY+l2K
 Xo62OSN6LZOu04+Tv3PwFcscML+e7K8W1GV3T6Cmok8yCDI5PMkXCeHGlrKAPfIrVL
 r0PVuFiIiV8pFIhQyY4xzEG/IGwv0FLjdjtWj6qU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.130.10]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4JqV-1kzQ4k0LJJ-000Lk7; Wed, 13
 Jan 2021 15:23:35 +0100
Subject: Re: [PATCH 1/8] build-system: clean up TCG/TCI configury
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-2-pbonzini@redhat.com>
 <CAFEAcA9yyUUmd+hj6kgAV8KWtCC41Q55JRfE0q1zTaDaOofgOQ@mail.gmail.com>
 <a5cd4c43-2f12-2dbf-8db7-21acc7abc73d@redhat.com>
 <20210107160653.GD1029501@redhat.com>
 <d1b5a493-0658-3bba-b1b4-0116f337031d@amsat.org>
 <46e79fb0-2ce1-35a8-3ce8-44699508a1d1@gmx.de>
 <20210113135705.GC1568240@redhat.com>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <4d81fdad-6b76-d7b7-ba44-e3d7cf545dba@gmx.de>
Date: Wed, 13 Jan 2021 15:23:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20210113135705.GC1568240@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vKl9vF7bATtZPFq1TqK0Jmds3j6Ojkf8RVtxnPrBXtXMNV9mF+M
 CdabfnSsKz0r8/mzTOAviRwR/eoKQov9cS3jg5SV6aUamfIjnb12oUi+Z0uhAqqYzDaTkOh
 71V3UcnjXV7FV+8nEBSzo4mI3Y5q69hca23nxRt0T5MGNx2HTAM+alCRE/tzS9GXRnsUbgC
 1W+KW87cN1aAYznALTw8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1Jayv3lB+xM=:pxRgms43/SV6hsnY3aq7Ed
 1JsA8A0WtFKgYJDz5GSE2rGT5bfHgzErrMpetkgHvqcwQgzNK27wJEck8turyCJL4nY3TyhK8
 s4QpqcR9Hw68CEwYtj251KB+urrUBxIu5K2zF0ZUiL/2UYBu0CLISvzehb+z9KBzNIVQkdw32
 /P0GQJ1grw3h/RIltEbJdqf+SsH3pfwV6cEVcWqpEvrWaUiWNOpbkvQ/mswM/Ao+q0rv29Ovc
 8dpYeNK6d/bvpN0SRDNV0c9M608mCkQXehqF0jjguPuwczS79FodgRdEoXYSK/corFJ58VMYf
 7sezsJjnGL8dFI97VqAeyqTlH4Yyq1jy37pTlwUeT6rKeMDeZz6t8Q1EOIb0AmLNkwzY88cCm
 eHRxt+VIzb9neGS4gi9VKXcs0W3hpdepFj6vk1eNexbAU0T0uetFwEk8pgKZk+JPefaScrcBd
 BzC5mmXjFrXIDzXqM4V5mslZaZUlTXoTP5o1rEPFAEVq7bS7Ntc0bpKDZzZS+/qvVKw+eMWtT
 mFQ7ZGsLEkjwSLBqfJgxNhwBzoANOj2xSArfdFOr2oPy4u4vkPbvcVlrKq5uQBhb9eVFFa0Uy
 crxI/sy1KBQPfh8/W80sVCboL/+U6E/vPOIScZGfRNZJH2tmU0JA0lMfj71hMPMYHWWjHZUc3
 +lyB0+rd4FKnWOiXfI/i4W8G5iQ/fD41I0+k6vOweHEysG41iEg5s79OkoLBUofDpVxNItCXx
 9fBBS+MXWAELoenugZ8Ed1NTPiN+AVUWi9uJNpLdYpAUedMWMujO5nr2jpFOZI643OaisDkiW
 9RZlWZAa5/q5pzE9XbEMPAmCXaBBzgv+Tk1bpzrObITF6EBII19e24LSk6RFOTRlN1QFTFfeI
 pj0oT4tWn8uYfdg9Rb/g==
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, debian-superh@lists.debian.org,
 Stefan Hajnoczi <stefanha@redhat.com>, debian-hppa@lists.debian.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 2:57 PM, Daniel P. Berrang=C3=A9 wrote:
> On Wed, Jan 13, 2021 at 02:42:51PM +0100, Helge Deller wrote:
>> On 1/13/21 2:09 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>>> Cc'ing TCI, SH4 and PA contacts FWIW.
>>>
>>> On 1/7/21 5:06 PM, Daniel P. Berrang=C3=A9 wrote:
>>>> On Thu, Jan 07, 2021 at 04:50:36PM +0100, Paolo Bonzini wrote:
>>>>> On 07/01/21 16:01, Peter Maydell wrote:
>>>>>> On Thu, 7 Jan 2021 at 14:03, Paolo Bonzini <pbonzini@redhat.com> wr=
ote:
>>>>>>>
>>>>>>> Make CONFIG_TCG_INTERPRETER a Meson option, and enable TCI (though=
 with
>>>>>>> a warning) if the host CPU is unsupported, making it more similar =
to
>>>>>>> other --enable-* options.
>>>>>>
>>>>>> The current behaviour is kind of deliberate. Using the TCG
>>>>>> interpreter is a terrible idea and think it's better if we
>>>>>> don't let users end up using it without realising that they have.
>>>>>> (Personally I would vote to deprecate-and-delete TCI, and also
>>>>>> to just have configure error out on unknown host CPU architectures.=
)
>>>>>
>>>>> Fair enough, I can change this back of course.  The missing targets =
are
>>>>> parisc, ia64 and sh4 I guess.
>>>>
>>>> ia64 is a dead host architecture and doesn't exist in any OS distro t=
hat
>>>> we target anymore, so I don't think we need to consider it.
>>
>> I have no opinion about ia64.
>>
>>>> Likewise parisc/hppa doesn't seem exist in Debian since Squeeze, so I
>>>> think we can rule that out too.
>>
>> Can we please keep parisc/hppa.
>> It's not an official platform any longer, but quite active in the
>> "unstable" debian-ports repository:
>> https://buildd.debian.org/status/architecture.php?a=3Dhppa&suite=3Dsid
>>
>>>> Only sh4 still seems to be supported in Debian. I expect the primary
>>>> need there is for sh4 guest support rather than sh4 host support.
>>
>> Same as for hppa/parisc, sh4 is in debian-ports too.
>
> So that at least shows that we need *guest target* support hppa/sha4.

Yes.

> The question still remains whether anyone is actually likely to be
> running/using QEMU on a sh4/hppa *host*, to emulate a different
> guest arch ?

Agreed, it's not very useful because of speed and amount of possible
users, but ....(please read below)

> This is what that TCG interpreter provides for. eg would anyone
> really want to emulate aarch64 guest when runing on a hppa host ?
In debian many packages directly and indirectly depend on the qemu
source package, because it provides - beside the emulator - various
userspace tools which are necessary natively, like e.g. qemu-img.
In the past building those tools failed on hppa because the configure scri=
pt
detected that neither native TCG nor TCG interpreter support was possible.
As such the configuration aborted and no tools were built.
So, the change should still make it possible to enable building the usersp=
ace
tools.

On the other side, sometimes even a slow TCG-interpreter enabled qemu
for other arches can be useful. It's not about speed, but about the
*possibility* to emulate small pieces of different code, e.g.
cross-compilers, bios-tools and such. It's not used often, but it
can be handy.
That said, if it doesn't hurt I think we should not disable something
which can be useful (this applies to all architectures).

Helge

