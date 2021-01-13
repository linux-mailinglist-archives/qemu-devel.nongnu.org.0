Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7875A2F4C68
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 14:45:16 +0100 (CET)
Received: from localhost ([::1]:45164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzgSZ-0002Kl-IQ
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 08:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1kzgQs-0001RO-PP
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:43:32 -0500
Received: from mout.gmx.net ([212.227.15.18]:33967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1kzgQq-0002FA-7M
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 08:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1610545372;
 bh=ro9R6P4zc3vkJvevV2Y0NsLzw1xEkKQrwUld1QGnSwU=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=H0icfuPsQHk/VKkrXyvT6gdkhg6U0J+1kmuWRxiz0J38kp7z4hEXC1QlDu06k+p6X
 t627JdFJiCU9PJcVmT+AQc8wR/Jydz5nAXO9coWyNeV3mGykLTwwvijzAzGMXHSuu3
 HuMJ+/KeRSS+ZNwZF+UDqG+NGN9ORGSjm6gP5HS4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.130.10]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mkpf3-1kDwDD09tv-00mNIC; Wed, 13
 Jan 2021 14:42:52 +0100
Subject: Re: [PATCH 1/8] build-system: clean up TCG/TCI configury
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Stefan Weil <sw@weilnetz.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 debian-hppa@lists.debian.org, debian-superh@lists.debian.org
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-2-pbonzini@redhat.com>
 <CAFEAcA9yyUUmd+hj6kgAV8KWtCC41Q55JRfE0q1zTaDaOofgOQ@mail.gmail.com>
 <a5cd4c43-2f12-2dbf-8db7-21acc7abc73d@redhat.com>
 <20210107160653.GD1029501@redhat.com>
 <d1b5a493-0658-3bba-b1b4-0116f337031d@amsat.org>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
 c2TFWAS8k6RLkk41ZUU8ENX8+qZx/Q==
Message-ID: <46e79fb0-2ce1-35a8-3ce8-44699508a1d1@gmx.de>
Date: Wed, 13 Jan 2021 14:42:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d1b5a493-0658-3bba-b1b4-0116f337031d@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8qfY0rNYq6do0T2XFhFYytiSY5NZfxsh8JKfIPnu9+/mW53CNVd
 5mmPjo2VYCTRGNDyTLbT9VSHhgVFpP0734BlcmKADbtiwO4yTHEaytQ5j4iZs6h8J1Jd1gd
 hsI7nCwSWN+sutugqYnZngYOSKUxJYoOpvpZk9/8EYaiZsns+wYwbmG1B1xc0CuVr8okUeJ
 XYZtTSBrop6oNGcsPHnHA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GMTUnC2jVsg=:LYeBYQE9JlKpkuSoSE17YF
 yuSKm8gCzkF1WOeMnMvk5QOmeJTtOpczl+cjIzkEWP0Npj0eza8HQXAo4KAhvIeHrhYOZsJOB
 /MzXbiGVMsZJqPR91+3KQsj4SqdLgtiKgp6LM1Ac/7F2BmeQqN6QqKicbCpP52pobJVYmkXuQ
 R70Ts2lU8s8T0iS74S4M5tCNxz/QIOj4PoT3SfNs2s83z+eZcqiOrt8BjTljes1KxtziX4isN
 wxRTzPotyFwHv8F/uWhcxyzaIE1h6WpE2ZwtUMJaWdZmxWU1X31uhZhTFiVIaVIFJ2CTpfulU
 ZbFPkirZA+4tdkJy+hxXLADagCqxPVx/CcZrIsxlyxbbGna4JIDIdoVa/AxEXt/i5XBwPDadC
 GZLOq3jSOgNFvYqak4RMC6NBMcyCPpzGWfe8IQsVcPobk+WFZTJI999+f4enF8aNrv3O+vKLR
 MDrubel25uLQootWvDjpLHGiaMHrh7mRHZwFwFAvo6XOrSCqayoWtUCDKnC3fCV0rEX5/DZrK
 mZIYSWoQlPY4D/SKDDXgzzxNKgn+0FJLBjN5IWzgcjU8fzwMEeLbVhYh6bhsCK+jMjK2X4D1t
 vBMyrAe5NyXkYUFSBBG6H6xtrEUhvraoFSjgQhXCXOlnazzr/a95dK2Vkuog/xfKW6Rdv/Pt1
 ddF5hjhrJgIU4tThBeaQIBnjw54MR8fuZPdk79WYVs8KZHPxk//iHXP0l080a9cCm7ba9GwgS
 d0hjHHX2PRftWUgbh9bfrMTM65M1RQr4eFzyTkosYL8rKdBdOmoltCLtZKIWZV9z9AF888HQn
 PDUzn23xAdbMYsG11R5UqvYIApbNH9w+HCsXdv9xzvyZIyuMeM8f3RESahD10k7ZDbHr3TVo6
 W66s73UKxBoRKaQLCrYg==
Received-SPF: pass client-ip=212.227.15.18; envelope-from=deller@gmx.de;
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
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/13/21 2:09 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Cc'ing TCI, SH4 and PA contacts FWIW.
>
> On 1/7/21 5:06 PM, Daniel P. Berrang=C3=A9 wrote:
>> On Thu, Jan 07, 2021 at 04:50:36PM +0100, Paolo Bonzini wrote:
>>> On 07/01/21 16:01, Peter Maydell wrote:
>>>> On Thu, 7 Jan 2021 at 14:03, Paolo Bonzini <pbonzini@redhat.com> wrot=
e:
>>>>>
>>>>> Make CONFIG_TCG_INTERPRETER a Meson option, and enable TCI (though w=
ith
>>>>> a warning) if the host CPU is unsupported, making it more similar to
>>>>> other --enable-* options.
>>>>
>>>> The current behaviour is kind of deliberate. Using the TCG
>>>> interpreter is a terrible idea and think it's better if we
>>>> don't let users end up using it without realising that they have.
>>>> (Personally I would vote to deprecate-and-delete TCI, and also
>>>> to just have configure error out on unknown host CPU architectures.)
>>>
>>> Fair enough, I can change this back of course.  The missing targets ar=
e
>>> parisc, ia64 and sh4 I guess.
>>
>> ia64 is a dead host architecture and doesn't exist in any OS distro tha=
t
>> we target anymore, so I don't think we need to consider it.

I have no opinion about ia64.

>> Likewise parisc/hppa doesn't seem exist in Debian since Squeeze, so I
>> think we can rule that out too.

Can we please keep parisc/hppa.
It's not an official platform any longer, but quite active in the
"unstable" debian-ports repository:
https://buildd.debian.org/status/architecture.php?a=3Dhppa&suite=3Dsid

>> Only sh4 still seems to be supported in Debian. I expect the primary
>> need there is for sh4 guest support rather than sh4 host support.

Same as for hppa/parisc, sh4 is in debian-ports too.

Helge

