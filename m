Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43018314F99
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 13:59:14 +0100 (CET)
Received: from localhost ([::1]:37074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Sbp-0004rB-B2
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 07:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9SZN-0002y0-PQ
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 07:56:41 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:54078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9SZL-0006Us-As
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 07:56:41 -0500
Received: by mail-wm1-x333.google.com with SMTP id j11so3010106wmi.3
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 04:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=r0W2Y/uDXSGO5ikdHmAoWYwEPDCLJnhFHf6L3oFbLTw=;
 b=luATaAJQkRTYgCNiSfXPyfcbzs+QPCmHyytRYBh2VahZd7HFCh4qZLDbU+irjY6NN0
 Z5/791vNf0IZvLNDnv1Cur2syrD4wvefbh0zVB1Fq6dnXSWfXSX/OV/ZbPSRzZzm4Ye1
 G+qvmCu+1WfFgcTvxELNGTVaTktOvqYw1NJ07oXW524JTAFaB40OFXeLAUGd2ldo+6n0
 oV/EmKFQCsi/B16Y4qoRwdwQJKCYxcKC0zfd6l90LnFU+jJwYLSMUgMEUR3HsSJDZP+6
 WTRbe7dKmSNdPawie+WVlpcbMM42GS9h6pJmcaFsXa3kW3woY/x4uxGHI0hJpFvXrPx/
 Yetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=r0W2Y/uDXSGO5ikdHmAoWYwEPDCLJnhFHf6L3oFbLTw=;
 b=U6gm2lL5nJ+j7oVwg/VIswMx2pu15KzyNS0ujL+ZeGVMHvOc4iH7zPZxosHIBui7Vc
 9iXaj0GeGG8n0SKlh6GFLIn4NfqkFNAawa6OKiciX9pXv3q/mSlUXb5w/n6ONunaM6iN
 THlFZ2d6oRMJYLMGkjxnwWYOYbsMfiyfY3CrQeGnLxKX9LIZxFMJZ0pRb7iZOxA7MK9T
 Vm0jy5VFFr1kJoVooWJi9tYSfFxQXa0GCD+kI39b/i1loFEVsxSQLlnAKYB11EWTaJe5
 FX7q/0rNZe12DelOUJoF+pq6+0yehyMuYpTuG/ZLeJyXHxaC61ZYcxz4a9F0wT4cKym7
 YUMQ==
X-Gm-Message-State: AOAM5317B65kiZevPZmhXKbXbZsr8Z3yMBL09JbiB+Ssm2A6ZwINFEBl
 eaMOt+UhVKuQBkqX86OYbrqeSw==
X-Google-Smtp-Source: ABdhPJzhJP/0rNtbvq+V7Je2Q4aRx/bVwCTElKvj3VFHKspmBC1lf6COUA54alfbSudYE4TJybxm+Q==
X-Received: by 2002:a1c:b6c5:: with SMTP id g188mr3335782wmf.27.1612875397643; 
 Tue, 09 Feb 2021 04:56:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n11sm8187777wrt.34.2021.02.09.04.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 04:56:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 969A51FF7E;
 Tue,  9 Feb 2021 12:56:35 +0000 (GMT)
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-8-crosa@redhat.com> <8735ycq80u.fsf@linaro.org>
 <2c1a58b2-e023-4aca-16c7-c850f6069657@redhat.com>
 <87k0rha2mu.fsf@linaro.org>
 <2bacef90-7533-d439-cf7d-8fba51e64c1a@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 07/22] tests/acceptance/virtiofs_submounts.py: evaluate
 string not length
Date: Tue, 09 Feb 2021 12:52:21 +0000
In-reply-to: <2bacef90-7533-d439-cf7d-8fba51e64c1a@redhat.com>
Message-ID: <87h7ml9z7g.fsf@linaro.org>
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

> On 09.02.21 12:24, Alex Benn=C3=A9e wrote:
>>=20
>> Max Reitz <mreitz@redhat.com> writes:
>>=20
>>> On 04.02.21 14:23, Alex Benn=C3=A9e wrote:
>>>>
>>>> Cleber Rosa <crosa@redhat.com> writes:
>>>>
>>>>> If the vmlinuz variable is set to anything that evaluates to True,
>>>>> then the respective arguments should be set.  If the variable contains
>>>>> an empty string, than it will evaluate to False, and the extra
>>>>> arguments will not be set.
>>>>>
>>>>> This keeps the same logic, but improves readability a bit.
>>>>>
>>>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>>>> ---
>>>>>    tests/acceptance/virtiofs_submounts.py | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptanc=
e/virtiofs_submounts.py
>>>>> index f1b49f03bb..f25a386a19 100644
>>>>> --- a/tests/acceptance/virtiofs_submounts.py
>>>>> +++ b/tests/acceptance/virtiofs_submounts.py
>>>>> @@ -241,7 +241,7 @@ class VirtiofsSubmountsTest(BootLinux):
>>>>>=20=20=20=20
>>>>>            super(VirtiofsSubmountsTest, self).setUp(pubkey)
>>>>>=20=20=20=20
>>>>> -        if len(vmlinuz) > 0:
>>>>> +        if vmlinuz:
>>>>>                self.vm.add_args('-kernel', vmlinuz,
>>>>>                                 '-append', 'console=3DttyS0 root=3D/d=
ev/sda1')
>>>>
>>>> And this is were I gave up because I can't see how to run the test:
>>>>
>>>>     ./tests/venv/bin/avocado run ./tests/acceptance/virtiofs_submounts=
.py
>>>>     JOB ID     : b3d9bfcfcd603189a471bec7d770fca3b50a81ee
>>>>     JOB LOG    : /home/alex/avocado/job-results/job-2021-02-04T13.21-b=
3d9bfc/job.log
>>>>      (1/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsT=
est.test_pre_virtiofsd_set_up: CANCEL: vmlinuz parameter not set; you must =
point it to a Linux kernel binary to test (to run this test with the on-ima=
ge kernel, set it to an empty string) (0.00 s)
>>>>      (2/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsT=
est.test_pre_launch_set_up: CANCEL: vmlinuz parameter not set; you must poi=
nt it to a Linux kernel binary to test (to run this test with the on-image =
kernel, set it to an empty string) (0.00 s)
>>>>      (3/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsT=
est.test_post_launch_set_up: CANCEL: vmlinuz parameter not set; you must po=
int it to a Linux kernel binary
>>>>     to test (to run this test with the on-image kernel, set it to an e=
mpty string) (0.00 s)
>>>>      (4/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsT=
est.test_post_mount_set_up: CANCEL: vmlinuz parameter not set; you must poi=
nt it to a Linux kernel binary to test (to run this test with the on-image =
kernel, set it to an empty string) (0.00 s)
>>>>      (5/5) ./tests/acceptance/virtiofs_submounts.py:VirtiofsSubmountsT=
est.test_two_runs: CANCEL: vmlinuz parameter not set; you must point it to =
a Linux kernel binary to test (to run this test with the on-image kernel, s=
et it to an empty string) (0.00 s)
>>>>     RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRU=
PT 0 | CANCEL 5
>>>>     JOB TIME   : 0.56 s
>>>>
>>>> Given the test seems to make assumptions about an environment being
>>>> setup for it I think we need some documentation somewhere about what
>>>> those pre-requisites are.
>>>
>>> I find the cancel message pretty clear, but then again it was me who
>>> wrote it...
>>>
>>> Either you point the vmlinuz parameter to some Linux kernel you built
>>> yourself, or you set it to the empty string to just use the kernel
>>> that=E2=80=99s part of the image.  Setting Avocado parameters is done v=
ia -p,
>>> i.e. =E2=80=9C-p key=3Dvalue=E2=80=9D.  So in this case
>>> =E2=80=9C-p vmlinuz=3D/path/to/linux/build/arch/x86/boot/bzImage=E2=80=
=9D, or
>>> =E2=80=9C-p vmlinuz=3D''=E2=80=9D.
>>>
>>> Ideally, vmlinuz=3D'' would be the default, but there=E2=80=99s a probl=
em with
>>> that: I submitted this test along with the patches that added the
>>> required feature to the Linux kernel, so at that point that feature was
>>> not part of Linux.  That=E2=80=99s why you generally have to point it t=
o a Linux
>>> kernel binary you built yourself that has this feature (5.10 does).
>>=20
>> This is where it deviates from the rest of the check-acceptance tests.
>> Generally I don't have to worry about finding the right image myself.
>
> Yes, but there=E2=80=99s nothing I can do apart from just not having the =
test as=20
> part of qemu, which I don=E2=80=99t find better than to just cancel it wh=
en not=20
> run with the necessary parameters.

No I agree having the tests is useful.

>
> Or, well, I could let the test download and compile the Linux sources,=20
> but I don=E2=80=99t think that=E2=80=99s a viable alternative.

There has been discussion before but I agree it's not viable given the
compile times for such things.

>> At the least it would be worth pointing to a part of our docs on how
>> to build such an image.
>
> Well, I could perhaps come up with a comprehensive kernel configuration=20
> that works, but I really don=E2=80=99t think that=E2=80=99s valuable for =
people who just=20
> want to run the acceptance tests and don=E2=80=99t care about this test i=
n=20
> particular.  I just don=E2=80=99t think they=E2=80=99re actually going to=
 build a Linux=20
> kernel just for it.

Sure - but I was trying to review the series and as part of my review I
generally like to run the things I review. Hence why I stopped as I
couldn't get things running.

> (Alternatively, I could just build a Linux kernel here on my machine,=20
> upload the binary and point to it somewhere, e.g. in the cancel message.=
=20
>   That would be OK for me, and perhaps something I could imagine someone=
=20
> might actually use.)

I've actually done this with some Xen patches I'm working on at the
moment. I'll probably decorate the test with:

  @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')

with a comment explaining what's waiting to be upstreamed. Once there
are upstream binaries I plan on transitioning the test to those.

> I=E2=80=99d rather just wait until the test image contains a kernel that=
=E2=80=99s=20
> sufficiently new (should be the case once Fedora 34 is out), so we can=20
> make -p vmlinuz=3D'' the default.  Until then I personally find it=20
> completely reasonable to have this test just be cancelled.
>
> Max


--=20
Alex Benn=C3=A9e

