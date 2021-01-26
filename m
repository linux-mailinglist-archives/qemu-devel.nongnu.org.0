Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0178C304408
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 17:55:47 +0100 (CET)
Received: from localhost ([::1]:35930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Rd4-0002MA-3D
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 11:55:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4RXB-0008BW-Gr
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:49:41 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:52576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4RX6-0007oB-UZ
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 11:49:40 -0500
Received: by mail-wm1-x333.google.com with SMTP id m187so3036559wme.2
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 08:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=cuqeYqto7N+2ZzNrmYoo+lcbRXbKtZMBt48wWtbPkNQ=;
 b=yUI87dQ3IJ7XI7Z/FeYcpjs7xWuABZ63qFrl1ilwXbHzDateL75YwhJZh2HULBE2bo
 HWyHQX1I+H6YE9OhtqcLim5BOu6oCpJ1arwE/6h3eBmaPMflAkWVeYWoPq/iKx2KlhfH
 VpTPwYe8HMaNJwdnaATV34AqiTBZzFWQ2l6z+khk2BpXPwcsU1yVooRcGtr0atUIDv9r
 q9Bmsfk03BjDJA1ar2QOQX1RaqV6b++LxjFGsp0BjZ2kc1Z2dtRt5FMhPWO/tiMp6fDU
 1gr9Tuwrwo2KYpVg4CCUDoKwkPiRziaalGUqabkIKeizQcUz5USoZKeN0mKhVQ6WK+DB
 LR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=cuqeYqto7N+2ZzNrmYoo+lcbRXbKtZMBt48wWtbPkNQ=;
 b=WyLe2K/wKVJJnc8kbckkPGxH157dLn7TWRYOqeOjBk5BPWyg7pwNpgqjpj4P1FeS4S
 xC+7bwBAydKEtcv44mv8bESFLxAKm5/KtEFJFqehHqq8LicqkxplGCH8BmAxOcbaRIil
 ke3wqvZRe15fUqnQz1vOhBpkSkNr5JWhA4uE3WgdCVI5FThycvZE3H1n6Te840J6iBPj
 l4jTCWZKIZo8JZnqt/o4jcQ4mqsfzs5fqhFHoyBzR2jVBYg7I9kS6dLQt1N53hnQEE5s
 V6ZKgt5wQzYn0489gWTGpAsmKSa88PJlwAycpwMuZ8om8MQZO55GD0qtvyNMzKXCz5KZ
 7hEw==
X-Gm-Message-State: AOAM53173EDExDnLpzqZjtWzkvyYLQ+tGdv58RAaKcbg7l7JxUIPR+/u
 t7e13P9tlQgthDZawj8FWmp6Nw==
X-Google-Smtp-Source: ABdhPJxBIecSPvd1Ro2IaWmYu4LMW63EHDeqhjy5f1u6GTCUD74s5LtR5ml5OQNvrOiTcrRTh52FXQ==
X-Received: by 2002:a1c:3587:: with SMTP id c129mr572610wma.76.1611679774769; 
 Tue, 26 Jan 2021 08:49:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o13sm30276577wrh.88.2021.01.26.08.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 08:49:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 751191FF7E;
 Tue, 26 Jan 2021 16:49:32 +0000 (GMT)
References: <20210110162739.858087-1-f4bug@amsat.org>
 <20210110162739.858087-3-f4bug@amsat.org>
 <78a9718b-dec0-cc31-7ada-e815d9022e65@redhat.com>
 <20210121103250.GH3125227@redhat.com>
 <b1309c5e-69f2-0c4d-eefc-9023e906694d@amsat.org>
 <20210121112154.GJ3125227@redhat.com>
 <e46b9117-59ed-cfb8-303b-1a5a013c4cc8@amsat.org>
 <20210121120241.GK3125227@redhat.com>
 <97b12e1b-e570-bd4d-5484-376f3fe6f7dc@amsat.org>
 <ada021e4-b6e5-e720-bcfb-c078488c835c@wataash.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Wataru Ashihara <wataash@wataash.com>
Subject: Re: [RFC PATCH 2/2] gitlab-ci: Add a job building TCI with Clang
Date: Tue, 26 Jan 2021 16:42:44 +0000
In-reply-to: <ada021e4-b6e5-e720-bcfb-c078488c835c@wataash.com>
Message-ID: <87bldby76r.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?D?= =?utf-8?Q?aniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Wataru Ashihara <wataash@wataash.com> writes:

> On 2021/01/21 22:27, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 1/21/21 1:02 PM, Daniel P. Berrang=C3=A9 wrote:
>>> On Thu, Jan 21, 2021 at 12:48:21PM +0100, Philippe Mathieu-Daud=C3=A9 w=
rote:
>>>> On 1/21/21 12:21 PM, Daniel P. Berrang=C3=A9 wrote:
>>>>> On Thu, Jan 21, 2021 at 12:18:18PM +0100, Philippe Mathieu-Daud=C3=A9=
 wrote:
>>>>>> On 1/21/21 11:32 AM, Daniel P. Berrang=C3=A9 wrote:
>>>>>>> On Thu, Jan 21, 2021 at 11:08:29AM +0100, Thomas Huth wrote:
>>>>>>>> On 10/01/2021 17.27, Philippe Mathieu-Daud=C3=A9 wrote:
>>>>>>>>> Split the current GCC build-tci job in 2, and use Clang
>>>>>>>>> compiler in the new job.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>>>>>>> ---
>>>>>>>>> RFC in case someone have better idea to optimize can respin this =
patch.
>>>>>>>>>
>>>>>>>>>   .gitlab-ci.yml | 22 ++++++++++++++++++++--
>>>>>>>>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> I'm not quite sure whether we should go down this road ... if we w=
anted to
>>>>>>>> have full test coverage for clang, we'd need to duplicate *all* jo=
bs to run
>>>>>>>> them once with gcc and once with clang. And that would be just ove=
rkill.
>>>>>>>>
>>>>>>>> I think we already catch most clang-related problems with the clan=
g jobs
>>>>>>>> that we already have in our CI, so problems like the ones that you=
've tried
>>>>>>>> to address here should be very, very rare. So I'd rather vote for =
not
>>>>>>>> splitting the job here.
>>>>>>>
>>>>>>> We can't possibly cope with the fully expanded matrix of what are
>>>>>>> theoretically possible combinations. Thus I think we should be guid=
ed
>>>>>>> by what is expected real world usage by platforms we target.
>>>>>>>
>>>>>>> Essentially for any given distro we're testing on, our primary focus
>>>>>>> should be to use the toolchain that distro will build QEMU with.
>>>>>>>
>>>>>>> IOW, for Windows and Linux distros our primary focus should be GCC,
>>>>>>> while for macOS, and *BSD, our focus should be CLang.
>>>>>>
>>>>>> Sounds good.
>>>>>>
>>>>>> Do we need a TCI job on macOS then?
>>>>>
>>>>> TCI is only relevant if there is no native TCG host impl.
>>>>>
>>>>> macOS only targets aarch64 and x86_64, both of which have TCG, so the=
re
>>>>> is no reason to use TCI on macOS  AFAICT
>>>>
>>>> Yes, fine by me, but Wataru Ashihara reported the bug... =C2=AF\_(=E3=
=83=84)_/=C2=AF
>>>
>>> It doesn't look like they were using macOS - the message suggests
>>> Ubuntu host, and AFAIK, all Ubuntu architectures have support
>>> for TCG, so using TCI shouldn't have been required in the first
>>> place.
>>>
>>> I guess we could benefit from a TCI job of some kind that uses
>>> CLang on at least 1 platform, since none exists.
>>>
>>> This does yet again open up the question of whether we should be
>>> supporting TCI at all in this particular user's scenario though,
>>> since both KVM and TCG are available on Ubuntu x86 hosts already.
>>=20
>> I understand Stefan envisions other use cases for TCI, which is
>> why it is still maintained. See:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg461131.html
>>=20
>> I agree with your previous comment:
>>> we should be guided by what is expected real world usage by
>>> platforms we target. Essentially for any given distro we're
>>> testing on, our primary focus should be to use the toolchain
>>> that distro will build QEMU with.
>>=20
>> This rarely used config does not justify adding yet another CI job.
>>=20
>> Thanks,
>>=20
>> Phil.
>>=20
>>=20
>
> Actually I use TCI also on macOS. Like the use case quoted by Philippe,
> there're even other reasons to use TCI:
>
> 1. Learning TCG ops.

Except it's only a subset of ops. Really interesting newer ones using
the TCGv_vec types are entirely absent.

> 2. Debugging QEMU with gdb. e.g. diagnose codegen or stepping into
>    helper functions from tci.c:tcg_qemu_tb_exec().

I do this quite often with TCG so I'm curious as to what the difference
is here?

> 3. Guest instruction tracing. TCI is faster than TCG or KVM when tracing
>    the guest ops [1]. I guess qira is using TCI for this reason [2].

How are you doing instruction tracing with TCG? Using the plugin
interface?

I think there probably is a roll for a *guest* interpreter given the
amount of code that is translated only to be run once. However it would
be a fairly large undertaking.

> [1]: https://twitter.com/wata_ash/status/1352899988032942080
> [2]: https://github.com/geohot/qira/blob/v1.3/tracers/qemu_build.sh#L55


--=20
Alex Benn=C3=A9e

