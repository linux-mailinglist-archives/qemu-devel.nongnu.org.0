Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9723048FC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 20:46:46 +0100 (CET)
Received: from localhost ([::1]:34202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4UIX-00072u-HF
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 14:46:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l4UGZ-00065w-Ox
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:44:45 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:41538
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l4UGV-0007o2-Dx
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 14:44:43 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id A9D32DA0112;
 Tue, 26 Jan 2021 20:44:33 +0100 (CET)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
 <20210125164746.GE3538803@redhat.com>
 <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
 <9f22d4b0-34ca-6798-3661-36057609c152@weilnetz.de>
 <30cc0c14-fbec-bb21-2b6b-8e295029bc1f@linaro.org>
 <8f1f2dc6-5ad2-7d48-c2f9-9afa1e4d4065@weilnetz.de>
 <81c810b4-1bd3-631d-4b5b-7e54a27a5b4c@linaro.org>
 <cd9265f7-4887-63bb-e36e-ace708d062c1@weilnetz.de>
 <875z3jy3tt.fsf@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v4 4/4] meson: Warn when TCI is selected but TCG backend
 is available
Message-ID: <89209f1b-29ad-e5df-6d45-b2480db4775e@weilnetz.de>
Date: Tue, 26 Jan 2021 20:44:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <875z3jy3tt.fsf@linaro.org>
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 26.01.21 um 18:24 schrieb Alex Benn=C3=A9e:
> I'm going to go out on a limb and guess you have commit:
>
>    23a77b2d18 (build-system: clean up TCG/TCI configury)
>
> which temporarily has the effect of disabling TCI. See
>
>    Subject: Re: [PATCH v4 1/4] configure: Fix --enable-tcg-interpreter
>    From: Paolo Bonzini <pbonzini@redhat.com>
>    Message-ID: <2b8b6291-b54c-b285-ae38-21f067a8497d@redhat.com>
>    Date: Mon, 25 Jan 2021 17:36:42 +0100
>
> with that fix fixed I see the same failures as Richard:
>
>    ./qemu-arm ./tests/tcg/arm-linux-user/fcvt > /dev/null
>    TODO ../../tcg/tci.c:614: tcg_qemu_tb_exec()
>    ../../tcg/tci.c:614: tcg fatal error
>    qemu: uncaught target signal 11 (Segmentation fault) - core dumped
>    fish: =E2=80=9C./qemu-arm ./tests/tcg/arm-linu=E2=80=A6=E2=80=9D ter=
minated by signal SIGSEGV (Address boundary error)
>
> which does raise the question before today when was the last time anyon=
e
> attempted to run check-tcg on this?


Yes, I tested with latest git master and did not notice that=20
--enable-tcg-interpreter was broken.

Paolo's patch fixed that.I could reproduce the fatal assertions which=20
were all caused by the same missing TCG opcode implementation.

I have sent a trivial patch which adds that implementation and fixes all =

segmentation faults.


>> Daniel, regarding your comment: TCI has 100 % test coverage for the
>> productive code lines.
> By what tests? The fact you don't hit asserts in your day to day testin=
g
> doesn't mean there are features missing that are easily tripped up or
> that TCI got it right.


I was not talking about the TODO assertions. When I wrote TCI, I only=20
enabled and included code which was triggered by my testing - that's why =

I said the productive code lines have 100 % test coverage. TODO=20
assertions are not productive code, but debug code which were made to=20
detect new test cases. They were successful, too, because they were=20
triggered by some tests in `make check-tcg`.


>> All code lines which were never tested raise an
>> assertion, so can easily be identified (and fixed as soon as there is =
a
>> test case which triggers such an assertion). The known deficits are
>> speed, missing TCG opcodes, unimplemented TCG opcodes because of missi=
ng
>> test cases and missing support for some host architectures.


As soon as I was aware of the new test cases, adding the missing TCG=20
opcode implementation was not difficult.


> Passing check-tcg would be a minimum for me.


It should pass now unless you get timeouts for some tests. Please tell=20
me if more TODO assertions are triggered by new tests.

Stefan




