Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8CB3153AA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 17:19:04 +0100 (CET)
Received: from localhost ([::1]:48790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9VjD-0005aG-AL
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 11:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Vfy-0003oQ-Ur
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:15:47 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:39561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9Vfs-0008J7-0h
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 11:15:42 -0500
Received: by mail-wr1-x42e.google.com with SMTP id h12so6375735wrw.6
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 08:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=JW0yaUQoV0uDcnFvaVoWk6MqYmc44EV5OuP7ils7kMA=;
 b=CW8LPIV78pcBXc/IDzotzDyehkahwtVh73gr/Z2ynsvf6k/1YdY5GrUePxnoGNmIjQ
 87gWKDqXlGbktcGhtLzL4ZajDxTGCQFzFzlWtnW+NT05H/wgpNOoohlnuOgfY1MMfUmX
 ACKA/joioJdiBagt39Jtgduwahiy28BwrJxa5jX+l+xz+onrijTDpGXqm9fJdVMiBMmj
 UhNOgI+87ypTm4t8SG1GNc28jfrEujxp9xDN0nlJ/r5ZSkRUI9w4WJzQFD9uJyxhuSld
 xwvh0LPk0o6hAihAGcg+K4yi0jQTOZCAFnQP6pqDhJqY5dVVFWMtYkQXW70LxVRU8HwY
 097A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=JW0yaUQoV0uDcnFvaVoWk6MqYmc44EV5OuP7ils7kMA=;
 b=gam8pR8NZ4HZpEl6QVW+CYr9fsNz3hcefvbucWPZrNGy0FXJL69CWUHdejo1DZZ2LB
 eA9t528cHgIx3aD9TG+JhEFA1bfV/Wdc3mODIZAgGqy3A3BW9l4TpnvgY1UetL7/q62P
 0zFOg5QegK+LDtZfXBNHp050HdplGY40T8cQ9HP/iyrijjtLSNe0BuvPan+hpwHN8oK+
 jhZzQpjAvbZ/9/n1GEUW6/lhX03EbVysb2Zb1VYtkgDuVlrIYX/pvp1Pe1xf3JrNImrL
 W0wgpxV1PZ7r9xE6JDduiPx8CFGWxjJqaxpgjm006Z1kQtB826AY+RNIz/HuY48j4evR
 dnlw==
X-Gm-Message-State: AOAM530gtB/tPxgFPNe4xnjbsVrizN10NFlHtH4+4OGM364jn6S0Hikm
 p6BmwpR+Dbq5e0zZO4r+auszeg==
X-Google-Smtp-Source: ABdhPJyWTRa2l4gfzWX/Whbht84+RkXwu+rj1sslMcpSEa9JWTna9jWh1O5q3glzQgJe9A0URwcTBg==
X-Received: by 2002:a5d:6b47:: with SMTP id x7mr26936312wrw.170.1612887330634; 
 Tue, 09 Feb 2021 08:15:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o12sm36719455wrx.82.2021.02.09.08.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 08:15:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 924631FF7E;
 Tue,  9 Feb 2021 16:15:28 +0000 (GMT)
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-8-crosa@redhat.com> <8735ycq80u.fsf@linaro.org>
 <2c1a58b2-e023-4aca-16c7-c850f6069657@redhat.com>
 <87k0rha2mu.fsf@linaro.org>
 <2bacef90-7533-d439-cf7d-8fba51e64c1a@redhat.com>
 <87h7ml9z7g.fsf@linaro.org>
 <158ab9b4-9d1c-b2b7-48d1-2cc10b54f55f@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 07/22] tests/acceptance/virtiofs_submounts.py: evaluate
 string not length
Date: Tue, 09 Feb 2021 16:15:12 +0000
In-reply-to: <158ab9b4-9d1c-b2b7-48d1-2cc10b54f55f@redhat.com>
Message-ID: <87eehp9pzz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Eric Auger <eauger@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Max Reitz <mreitz@redhat.com> writes:

> On 09.02.21 13:52, Alex Benn=C3=A9e wrote:
>>=20
>> Max Reitz <mreitz@redhat.com> writes:
>>=20
>>> On 09.02.21 12:24, Alex Benn=C3=A9e wrote:
>>>>
>>>> Max Reitz <mreitz@redhat.com> writes:
>>>>
>>>>> On 04.02.21 14:23, Alex Benn=C3=A9e wrote:
>>>>>>
>>>>>> Cleber Rosa <crosa@redhat.com> writes:
>>>>>>
>>>>>>> If the vmlinuz variable is set to anything that evaluates to True,
>>>>>>> then the respective arguments should be set.  If the variable conta=
ins
>>>>>>> an empty string, than it will evaluate to False, and the extra
>>>>>>> arguments will not be set.
>>>>>>>
>>>>>>> This keeps the same logic, but improves readability a bit.
>>>>>>>
>>>>>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>>>>>> ---
>>>>>>>     tests/acceptance/virtiofs_submounts.py | 2 +-
>>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/accepta=
nce/virtiofs_submounts.py
>>>>>>> index f1b49f03bb..f25a386a19 100644
>>>>>>> --- a/tests/acceptance/virtiofs_submounts.py
>>>>>>> +++ b/tests/acceptance/virtiofs_submounts.py
>>>>>>> @@ -241,7 +241,7 @@ class VirtiofsSubmountsTest(BootLinux):
>>>>>>>=20=20=20=20=20
>>>>>>>             super(VirtiofsSubmountsTest, self).setUp(pubkey)
>>>>>>>=20=20=20=20=20
>>>>>>> -        if len(vmlinuz) > 0:
>>>>>>> +        if vmlinuz:
>>>>>>>                 self.vm.add_args('-kernel', vmlinuz,
>>>>>>>                                  '-append', 'console=3DttyS0 root=
=3D/dev/sda1')
>>>>>>
>>>>>> And this is were I gave up because I can't see how to run the test:
>>>>>>
>>>>>>      ./tests/venv/bin/avocado run ./tests/acceptance/virtiofs_submou=
nts.py
>>>>>>      JOB ID     : b3d9bfcfcd603189a471bec7d770fca3b50a81ee
>>>>>>      JOB LOG    : /home/alex/avocado/job-results/job-2021-02-04T13.2=
1-b3d9bfc/job.log
>>>>>>       (1/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmoun=
tsTest.test_pre_virtiofsd_set_up: CANCEL: vmlinuz parameter not set; you mu=
st point it to a Linux kernel binary to test (to run this test with the on-=
image kernel, set it to an empty string) (0.00 s)
>>>>>>       (2/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmoun=
tsTest.test_pre_launch_set_up: CANCEL: vmlinuz parameter not set; you must =
point it to a Linux kernel binary to test (to run this test with the on-ima=
ge kernel, set it to an empty string) (0.00 s)
>>>>>>       (3/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmoun=
tsTest.test_post_launch_set_up: CANCEL: vmlinuz parameter not set; you must=
 point it to a Linux kernel binary
>>>>>>      to test (to run this test with the on-image kernel, set it to a=
n empty string) (0.00 s)
>>>>>>       (4/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmoun=
tsTest.test_post_mount_set_up: CANCEL: vmlinuz parameter not set; you must =
point it to a Linux kernel binary to test (to run this test with the on-ima=
ge kernel, set it to an empty string) (0.00 s)
>>>>>>       (5/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmoun=
tsTest.test_two_runs: CANCEL: vmlinuz parameter not set; you must point it =
to a Linux kernel binary to test (to run this test with the on-image kernel=
, set it to an empty string) (0.00 s)
>>>>>>      RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTE=
RRUPT 0 | CANCEL 5
>>>>>>      JOB TIME   : 0.56 s
>>>>>>
>>>>>> Given the test seems to make assumptions about an environment being
>>>>>> setup for it I think we need some documentation somewhere about what
>>>>>> those pre-requisites are.
>>>>>
>>>>> I find the cancel message pretty clear, but then again it was me who
>>>>> wrote it...
>>>>>
>>>>> Either you point the vmlinuz parameter to some Linux kernel you built
>>>>> yourself, or you set it to the empty string to just use the kernel
>>>>> that=E2=80=99s part of the image.  Setting Avocado parameters is done=
 via -p,
>>>>> i.e. =E2=80=9C-p key=3Dvalue=E2=80=9D.  So in this case
>>>>> =E2=80=9C-p vmlinuz=3D/path/to/linux/build/arch/x86/boot/bzImage=E2=
=80=9D, or
>>>>> =E2=80=9C-p vmlinuz=3D''=E2=80=9D.
>>>>>
>>>>> Ideally, vmlinuz=3D'' would be the default, but there=E2=80=99s a pro=
blem with
>>>>> that: I submitted this test along with the patches that added the
>>>>> required feature to the Linux kernel, so at that point that feature w=
as
>>>>> not part of Linux.  That=E2=80=99s why you generally have to point it=
 to a Linux
>>>>> kernel binary you built yourself that has this feature (5.10 does).
>>>>
>>>> This is where it deviates from the rest of the check-acceptance tests.
>>>> Generally I don't have to worry about finding the right image myself.
>>>
>>> Yes, but there=E2=80=99s nothing I can do apart from just not having th=
e test as
>>> part of qemu, which I don=E2=80=99t find better than to just cancel it =
when not
>>> run with the necessary parameters.
>>=20
>> No I agree having the tests is useful.
>>=20
>>>
>>> Or, well, I could let the test download and compile the Linux sources,
>>> but I don=E2=80=99t think that=E2=80=99s a viable alternative.
>>=20
>> There has been discussion before but I agree it's not viable given the
>> compile times for such things.
>>=20
>>>> At the least it would be worth pointing to a part of our docs on how
>>>> to build such an image.
>>>
>>> Well, I could perhaps come up with a comprehensive kernel configuration
>>> that works, but I really don=E2=80=99t think that=E2=80=99s valuable fo=
r people who just
>>> want to run the acceptance tests and don=E2=80=99t care about this test=
 in
>>> particular.  I just don=E2=80=99t think they=E2=80=99re actually going =
to build a Linux
>>> kernel just for it.
>>=20
>> Sure - but I was trying to review the series and as part of my review I
>> generally like to run the things I review. Hence why I stopped as I
>> couldn't get things running.
>>=20
>>> (Alternatively, I could just build a Linux kernel here on my machine,
>>> upload the binary and point to it somewhere, e.g. in the cancel message.
>>>    That would be OK for me, and perhaps something I could imagine someo=
ne
>>> might actually use.)
>>=20
>> I've actually done this with some Xen patches I'm working on at the
>> moment. I'll probably decorate the test with:
>>=20
>>    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted cod=
e')
>>=20
>> with a comment explaining what's waiting to be upstreamed. Once there
>> are upstream binaries I plan on transitioning the test to those.
>
> Oh, so you=E2=80=99d be fine with an in-code comment that explains why th=
e=20
> parameter is required right now, but will be optional in the future?  If=
=20
> so, sounds good to me.

Yes that would be great ;-)

--=20
Alex Benn=C3=A9e

