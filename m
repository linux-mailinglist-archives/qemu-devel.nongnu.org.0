Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658FE2AD1F7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 10:01:57 +0100 (CET)
Received: from localhost ([::1]:43232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcPXH-00081w-Vl
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 04:01:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1kcPVa-0007Qu-0F
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:00:10 -0500
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:44834
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1kcPVV-00008E-Oi
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 04:00:08 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4CVhgD3dngz8PbN;
 Tue, 10 Nov 2020 04:01:28 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=from
 :subject:to:cc:references:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=default;
 bh=O+Aj0tU+vXmBy8JwFUQ38dMwsMY=; b=VQ0NyCEgInnSs9LJAOg9v65PmMKi
 BhyPt7XFL5kw77WVSyk/8qyMn6voJoE535ATTGtxD3Rs763L1OHh8RQVd2WUfcBd
 fdviuh8MtwCRCE5ylWfFCBpRNrE6gb1ip42drSaipPTkXVtfLyNtgE7JCh5t358R
 J5lBDFTaciNRF5c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=from:subject
 :to:cc:references:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=Xbc
 K/M3fJwLQmnzyfsu/gLpHmavMiebQ69P/9dYaB+Uz3nAokIdJJrURqnS4DbMgcT/
 MzFb6Ye6bi6yQdmQwnIDvnAgEzvQ/boWJtKBgUfu3Rd1qqIOT1OvdavUOZJ2sLZC
 xbdoHii65y+GLR62lThijhzqR1+Efd7qoBI5xSmY=
Received: from [192.168.6.30]
 (bras-base-toroon2719w-grc-36-142-114-120-158.dsl.bell.ca [142.114.120.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4CVhgD37Ygz8PbK;
 Tue, 10 Nov 2020 04:01:28 -0500 (EST)
From: Brad Smith <brad@comstyle.com>
Subject: Re: [PATCH] tests/vm: update openbsd to release 6.8
To: Thomas Huth <thuth@redhat.com>, Philippe Mathieu-Daud?? <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
References: <20201027053048.GB64546@humpty.home.comstyle.com>
 <cbae54c3-fa97-19e6-512c-7ac570f56b12@redhat.com>
 <20201027102245.GC64546@humpty.home.comstyle.com>
 <2f27fba1-d5e6-6734-e608-36406e6fe00a@comstyle.com>
 <db2e674b-7d8b-850c-1b55-880529ee601f@redhat.com>
Message-ID: <8bf6e472-d4b4-139f-f3e8-768918e8fae7@comstyle.com>
Date: Tue, 10 Nov 2020 03:59:56 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101
 Thunderbird/83.0
MIME-Version: 1.0
In-Reply-To: <db2e674b-7d8b-850c-1b55-880529ee601f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/9/2020 3:13 AM, Thomas Huth wrote:
> On 07/11/2020 07.07, Brad Smith wrote:
>> ping.
> It's not directly my turf, but I can add it to my next testing-related =
pull
> request if nobody else picks this patch up before.
Please, if you could. Thank you.
>   Thomas
>
>> On 10/27/2020 6:22 AM, Brad Smith wrote:
>>> On Tue, Oct 27, 2020 at 11:05:20AM +0100, Philippe Mathieu-Daud?? wro=
te:
>>>> On 10/27/20 6:30 AM, Brad Smith wrote:
>>>>> tests/vm: update openbsd to release 6.8
>>>>>
>>>>> A double dash at the end of a package name removes ambiguity
>>>>> when the intent is to install a non-FLAVORed package.
>>>>>
>>>>> Signed-off-by: Brad Smith<brad@comstyle.com>
>>>>> Reviewed-by: Gerd Hoffmann<kraxel@redhat.com>
>>>>> Tested-by: Gerd Hoffmann<kraxel@redhat.com>
>>>>> Reviewed-by: Philippe Mathieu-Daud??<philmd@redhat.com>
>>>> I confirm Brad sent us this patch off-list, and
>>>> - our review comments are addressed,
>>>> - the tags are correct.
>>>>
>>>> The patch format itself seems broken... Like a copy/paste
>>>> into an email client...
>>> Well, git diff vs a format-patch.
>>>
>>>
>>> Subject: [PATCH] tests/vm: update openbsd to release 6.8
>>>
>>> A double dash at the end of a package name removes ambiguity
>>> when the intent is to install a non-FLAVORed package.
>>>
>>> Signed-off-by: Brad Smith<brad@comstyle.com>
>>> Reviewed-by: Gerd Hoffmann<kraxel@redhat.com>
>>> Tested-by: Gerd Hoffmann<kraxel@redhat.com>
>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9<philmd@redhat.com>
>>> ---
>>>  =C2=A0 tests/vm/openbsd | 8 ++++----
>>>  =C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
>>> index 8356646f21..5ffa4f1b37 100755
>>> --- a/tests/vm/openbsd
>>> +++ b/tests/vm/openbsd
>>> @@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name =3D "openbsd"
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arch =3D "x86_64"
>>>  =C2=A0 -=C2=A0=C2=A0=C2=A0 link =3D"https://cdn.openbsd.org/pub/Open=
BSD/6.6/amd64/install66.iso"
>>> -=C2=A0=C2=A0=C2=A0 csum =3D
>>> "b22e63df56e6266de6bbeed8e9be0fbe9ee2291551c5bc03f3cc2e4ab9436ee3"
>>> +=C2=A0=C2=A0=C2=A0 link =3D"https://cdn.openbsd.org/pub/OpenBSD/6.8/=
amd64/install68.iso"
>>> +=C2=A0=C2=A0=C2=A0 csum =3D
>>> "47e291fcc2d0c1a8ae0b66329f040b33af755b6adbd21739e20bb5ad56f62b6c"
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size =3D "20G"
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgs =3D [
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # tools
>>> @@ -36,10 +36,10 @@ class OpenBSDVM(basevm.BaseVM):
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "bash",
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "gmake",
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "gsed",
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "gettext",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "gettext-tools",
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # libs=
: usb
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "libusb1",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "libusb1--",
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # libs=
: crypto
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "gnutls",

