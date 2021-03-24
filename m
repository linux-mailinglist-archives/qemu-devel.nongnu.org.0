Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32853477A0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 12:46:50 +0100 (CET)
Received: from localhost ([::1]:37284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP1yL-0002Ko-OL
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 07:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP1wd-0001d9-8s
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:45:03 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP1wb-0001Yh-7M
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 07:45:02 -0400
Received: by mail-wr1-x431.google.com with SMTP id j7so24129992wrd.1
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 04:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=xxV02hDGRUX2WdJjtHPiyhN/qL69M6lHLjCn2CZmhH4=;
 b=yIea+ItNRUSGkOHEfTnBrnzRVkRvZ8o/IQrzALauq4p4kdxdo/qkGedHbQw8uJ6T1X
 lRI3W/MwrP+xiOzmWWYENpld83Z4Bju8Lbd40EYAuupImvkh2jd/plzwS2iujV3kSN/y
 Bv+qnvNWiDTpG6m7V1WFLLRCkXIlQA1Fv3OnPOfh58mU1a1p1qSU0k5HY0ucHu8lEdg3
 fqyXFB4+lETCSc7010x6KmtqyhHhUnaplG8WgGjdjr5Yfp/PSZWoljXDoy9igs7F+Wq0
 ptJjOfbDTysEMzib1KO9RdoJM7O1Du1uHUNOgTjxlY/PGfMITA0b4FOK+1dSO8eCM071
 b8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=xxV02hDGRUX2WdJjtHPiyhN/qL69M6lHLjCn2CZmhH4=;
 b=MDPUY/LbUVMGIG8GRpN9vLXctP+E2Xh7qu+N/6yI0LN6ZOSCHSOsMAmQ5hMk9zw/Vu
 V3l4S62ZW7zgqbfbttac/PAQwhvrMJX5uA86DIhTQRzEZOTI0bj8NvRDSDIZCtojD8M/
 3+ag16tx97jy0IFjeeVhvQQn0ypyH36JmQOTmgJYKyvrGUPJjjYMW2GexR7SVBEZ75Z6
 C9qhV+sqEWT5kN+QPRYgy3KUlT9HMuAveD+fmhHEGIHMuO3pN23uRn0dL0FDS+tYU0JC
 d5lGjQEu1Q/IRdvkbMYbLUmSnZW8clrTLX5sr0ARyCOwzu5tXitC2vIvbsVdm3x664SV
 pdXw==
X-Gm-Message-State: AOAM532TMoojcFU0Odkwix2macnS+YAYG9rF7eJ4+XioD5rbmjDchM+8
 cug0r4kLMnjE9gCmYSfaYdfqoA==
X-Google-Smtp-Source: ABdhPJwce8bQADYYQO7zhRnL5vFFoMJVT3F9H1qp8E5lmDIod073vbEf082QcbylOlgOn9DjiEUtNg==
X-Received: by 2002:a5d:518c:: with SMTP id k12mr3033115wrv.15.1616586297450; 
 Wed, 24 Mar 2021 04:44:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j14sm2646557wrw.69.2021.03.24.04.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 04:44:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A98681FF7E;
 Wed, 24 Mar 2021 11:44:55 +0000 (GMT)
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-23-cfontana@suse.de> <87eeg5iivn.fsf@linaro.org>
 <1ba15970-749a-27c5-ef72-6468b5501f46@suse.de>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC v11 30/55] target/arm: wrap call to aarch64_sve_change_el
 in tcg_enabled()
Date: Wed, 24 Mar 2021 11:41:32 +0000
In-reply-to: <1ba15970-749a-27c5-ef72-6468b5501f46@suse.de>
Message-ID: <87blb8ixmw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-D?= =?utf-8?Q?aud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 3/23/21 11:50 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Claudio Fontana <cfontana@suse.de> writes:
>>=20
>>> After this patch it is possible to build only kvm:
>>>
>>> ./configure --disable-tcg --enable-kvm
>
>
> It's possible to build, but tests will fail until all the test-related
> patches are applied.

So I think there has to be a change in ordering in the series so we
don't have differing failure modes as we enable. I'm not sure if that
means all tests need to be fixed before the first "--disable-tcg builds"
patch but I would expect at least a basic:

  qemu-system-aarch64 -M virt,gic=3Dhost -cpu host -accel kvm -m 2048 -net =
none -nographic -kernel ~/lsrc/linux.git/builds/arm64.virt/arch/arm64/boot/=
Image -append "panic=3D-1"
--no-reboot

works - so at least we can track if any of the additional changes cause
regressions.

>>=20
>> FWIW at this point we get a different failure than later on:
>>=20
>>   21:10:25 [alex@aarch64-new:~/l/q/b/disable.tcg] (94e2abe0=E2=80=A6)|=
=E2=80=A6 + make check-qtest
>>     GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berke=
ley-softfloat-3 meson dtc capstone slirp
>>   [1/19] Generating qemu-version.h with a meson_exe.py custom command
>>   Running test qtest-aarch64/qom-test
>>   qemu-system-aarch64: missing interface 'idau-interface' for object 'ma=
chine'
>
> This one is broken by a recent commit in QEMU mainline, by removing the i=
dau interface from KVM cpus.
>
> This is fixed by: Revert "target/arm: Restrict v8M IDAU to TCG" in the
> series.

The proper fix is probably to move the mps2tz machine type that brings
this in to TCG only.

Moving up the build chain to the revert I now get:

  ./qemu-system-aarch64 -M virt,gic=3Dhost -cpu host -accel kvm -m 2048 -ne=
t none -nographic -kernel ~/lsrc/linux.git/builds/arm64.virt/arch/arm64/boo=
t/Image -append "panic=3D-1"
  --no-reboot
  qemu-system-aarch64: Property 'virt-6.0-machine.gic' not found

>
>>   socket_accept failed: Resource temporarily unavailable
>>   **
>>   ERROR:../../tests/qtest/libqtest.c:319:qtest_init_without_qmp_handshak=
e: assertion failed: (s->fd >=3D 0 && s->qmp_fd >=3D 0)
>>   ERROR qtest-aarch64/qom-test - Bail out! ERROR:../../tests/qtest/libqt=
est.c:319:qtest_init_without_qmp_handshake: assertion failed: (s->fd >=3D 0=
 && s->qmp_fd >=3D 0)
>>   make: *** [Makefile.mtest:24: run-test-1] Error 1
>>=20
>>=20
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> ---
>>>  target/arm/cpu-sysemu.c | 12 +++++++-----
>>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
>>> index eb928832a9..05d6e79ad9 100644
>>> --- a/target/arm/cpu-sysemu.c
>>> +++ b/target/arm/cpu-sysemu.c
>>> @@ -820,11 +820,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState=
 *cs)
>>>      unsigned int cur_el =3D arm_current_el(env);
>>>      int rt;
>>>=20=20
>>> -    /*
>>> -     * Note that new_el can never be 0.  If cur_el is 0, then
>>> -     * el0_a64 is is_a64(), else el0_a64 is ignored.
>>> -     */
>>> -    aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
>>> +    if (tcg_enabled()) {
>>> +        /*
>>> +         * Note that new_el can never be 0.  If cur_el is 0, then
>>> +         * el0_a64 is is_a64(), else el0_a64 is ignored.
>>> +         */
>>> +        aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
>>> +    }
>>>=20=20
>>>      if (cur_el < new_el) {
>>>          /* Entry vector offset depends on whether the implemented EL
>>=20
>>=20


--=20
Alex Benn=C3=A9e

