Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D529A5006D6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 09:24:43 +0200 (CEST)
Received: from localhost ([::1]:33264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1netqM-00040T-Gy
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 03:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1netp4-0003CJ-Kj
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 03:23:22 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:16181
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1netp2-0004WW-Vp
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 03:23:22 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4Kf9sr4ncTz8PbN;
 Thu, 14 Apr 2022 03:23:12 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=OxPziE5wT
 V6ulT0Y8puVwsAyXks=; b=pk5Df4xAYKDVI/n2nvxRgWjvNVBzmL8n/takAjKEg
 savngt1Qc9aBbzLHVaSnT5I9WYaOy+LWK1ao7G0Yq/vsDq/9U1S/cG8EcQEkTmq+
 uo9iobWVy/TZAZXsv9xEHfku+9bXudsX6/XEiQaoExdqVbb7z5NSyIyhTP6b+01B
 2k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=XtZ
 s3k0mwZlkyUrf5bmbqteG1IAqj/qXjw6CXv2H/G3nPnnPfsLswCUmn6rfB5MLe/a
 6hq6G+G6AjFna8YbMLczqB010jGtzcykq73ZHOtIDAFhHyKerY5ttqks1UlKzYcq
 iEHJsnDh+DLNWP2AHT75MZrTv7PLefhNjLlUwzpA=
Received: from [IPV6:2001:470:b050:6:1458:bf44:bad9:af63] (unknown
 [IPv6:2001:470:b050:6:1458:bf44:bad9:af63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4Kf9sr1NBBz8PbK;
 Thu, 14 Apr 2022 03:23:12 -0400 (EDT)
Message-ID: <dee8dc17-ea0a-2650-5bf4-3f5c233a6bca@comstyle.com>
Date: Thu, 14 Apr 2022 03:23:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [RFC PATCH for-7.1] Remove the slirp submodule (and only compile
 with an external libslirp)
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20220408164749.534758-1-thuth@redhat.com>
 <72fe734a-8bf6-adc6-474a-47f2006c2f6d@comstyle.com>
 <CAFEAcA-NdeN8S0JXqfrpTiDoUmfZHBXUtdAuRAdDRooTpnYipA@mail.gmail.com>
 <b701aa9f-4dff-4a67-92a5-529fd07a7f1d@comstyle.com>
 <07a2ce65-41b9-7313-d7cc-51c2edb8cfd3@redhat.com>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <07a2ce65-41b9-7313-d7cc-51c2edb8cfd3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/11/2022 2:55 AM, Thomas Huth wrote:
> On 11/04/2022 01.50, Brad Smith wrote:
>> On 4/10/2022 5:06 AM, Peter Maydell wrote:
>>> On Sun, 10 Apr 2022 at 05:51, Brad Smith <brad@comstyle.com> wrote:
>>>> On 4/8/2022 12:47 PM, Thomas Huth wrote:
>>>>> QEMU 7.1 won't support Ubuntu 18.04 anymore, so the last big=20
>>>>> important
>>>>> distro that did not have a pre-packaged libslirp has been dismissed=
.
>>>>> All other major distros seem to have a libslirp package in their
>>>>> distribution already - according to repology.org:
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Fedora 34: 4.4.0
>>>>> =C2=A0=C2=A0=C2=A0 CentOS 8 (RHEL-8): 4.4.0
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Debian Buster: 4.3.1 (in=
 buster-backports)
>>>>> =C2=A0=C2=A0 OpenSUSE Leap 15.3: 4.3.1
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Ubuntu LTS 20.04: 4.1.0
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FreeBSD Ports: 4.6.1
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NetBSD pkgsrc: 4.3.1
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Homebrew: 4.6.1
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MSYS2 mingw:=
 4.6.1
>>>>>
>>>>> The only one that still seems to be missing a libslirp package is
>>>>> OpenBSD - but I assume that they can add it to their ports system
>>>>> quickly if required.
>>>> I wish I had seen this earlier as our 7.1 release was just tagged.
>>>>
>>>> I have whipped up a port of 4.6.1 for OpenBSD as it was pretty=20
>>>> simple. I
>>>> will
>>>> see about submitting it in a number of days when the tree opens.
>>> How awkward would it be for an end-user who's on OpenBSD 7.1 to
>>> build a QEMU that doesn't have libslirp? (That is, is it easy
>>> and common for an end user to pull in a port of libslirp that only
>>> came along in a later OpenBSD, or would they instead have to
>>> manually compile libslirp themselves from the upstream sources?)
>>>
>>> (I'm asking here because if it's painful, then we should perhaps
>>> defer dropping our submodule copy of libslirp a little longer.)
>>>
>>> thanks
>>> -- PMM
>>
>> They would have to pull down a -current ports tree and build it. No=20
>> package
>> would exist for the release. It is possible, but not "supported". I=20
>> have not looked
>> at the CI bits to see how difficult that would be.
>>
>> Our release cycles are 6 months and the next release will be in the=20
>> middle
>> of October.
>
> OK, thanks for the update, Brad ... so I guess we should defer this=20
> patch to QEMU 7.2 (to be released in december) instead?
> (which would be fine for me - I just wanted to get the discussion=20
> started, that's also why I've marked this patch as RFC)
>

I would prefer that. My libslirp port will be going in in the next=20
couple days and
packages for -current snaps will be built. Our 7.2 release should be out=20
well before the
next QEMU release.

