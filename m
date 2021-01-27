Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DBA305BC9
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 13:43:38 +0100 (CET)
Received: from localhost ([::1]:40206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4kAb-0004xw-0X
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 07:43:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4k9P-0004Uc-20
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 07:42:23 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l4k9M-0002dk-Ry
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 07:42:22 -0500
Received: by mail-wr1-x42d.google.com with SMTP id p15so1737543wrq.8
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 04:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=tAbvpvlDzGI7ZfTwCqHrxOQ5DgoCMzcPoqPzKB65pdQ=;
 b=VoL5nEZX8xr+jnWpQAKweyrjLwjTsI4oQBDtifGRLpq7qRXQVYTRAx/72SrpYJF6nc
 XOjBXgeMohuGjT7KvaM4XMEHOQzyiwapYid7j7m7wFT/xg6tJPBQlcFx0ElbwgdL6jDe
 TaIc90qWTDBhnZl8PQPGcywxbk77rICb/T5TRgnkB+PzR71UZkTH0UIsKcrSLXkObheG
 Z178ND17NG+IiKRYRNXJ6zOQn+lolHZqU+4Ov9NpU4soIlNRtxe9aC0DML8BhtaaXnZ9
 Qg6tni0O0c6xniBly2pkJKwhLv1UDJXYLM0aFMYOMQGwF3oKDOTyAEZqC3d423PXnND2
 SriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=tAbvpvlDzGI7ZfTwCqHrxOQ5DgoCMzcPoqPzKB65pdQ=;
 b=bC0F0+lpQjYEUo2SWvSF1sNP8Qx/D9HPoqelFZYlA9C1JjW5TpKnY2LefKfNqAyaIr
 fqLDGdZUivwpdNeUxlJ9cZ/C/np7Jrrq7tn5vNghRMtZbCRvcYemfUkC+kHkXx0BC3TV
 t0qX9jcZ9xWhKIw3cuFdRj7TKPYucpOD4zncFRHa6tt5k670PMRejIfGLrIKLSrizjO0
 yfjGWw5K201FTUXlvJI7ajmF2JWyTu9b/aVtbhbw6e9RpkpyrhHJAmFNg5jpIYzpJjMZ
 5klKHVdLTQP+i9mD8kNfILvWGSpeNgtF5kMsEPqbHQetihgefIpl40BEci/OqSXMEFfE
 LqLg==
X-Gm-Message-State: AOAM532WeZDuWIMAeMKNIKtw2Xzho9p4Jy+06ks/NIwi/YlveuZ1XTT3
 wJp6l0Q9JORy4tgyETY3M92DtQ==
X-Google-Smtp-Source: ABdhPJzp0jx/V5XX2AzNz8Rp9qX3pY51BFKoCi1R9D0+aw/ad42eP2AicJQ0hCPhFlIgoCW/sShh8g==
X-Received: by 2002:adf:ffc4:: with SMTP id x4mr10780837wrs.67.1611751334791; 
 Wed, 27 Jan 2021 04:42:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i59sm2903853wri.3.2021.01.27.04.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 04:42:13 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A6C141FF7E;
 Wed, 27 Jan 2021 12:42:12 +0000 (GMT)
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
 <20210125164746.GE3538803@redhat.com>
 <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
 <9f22d4b0-34ca-6798-3661-36057609c152@weilnetz.de>
 <30cc0c14-fbec-bb21-2b6b-8e295029bc1f@linaro.org>
 <8f1f2dc6-5ad2-7d48-c2f9-9afa1e4d4065@weilnetz.de>
 <81c810b4-1bd3-631d-4b5b-7e54a27a5b4c@linaro.org>
 <cd9265f7-4887-63bb-e36e-ace708d062c1@weilnetz.de>
 <875z3jy3tt.fsf@linaro.org> <20210127100221.GD3653144@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 4/4] meson: Warn when TCI is selected but TCG backend
 is available
Date: Wed, 27 Jan 2021 12:34:48 +0000
In-reply-to: <20210127100221.GD3653144@redhat.com>
Message-ID: <87zh0uwnyz.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, Jan 26, 2021 at 05:24:10PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Stefan Weil <sw@weilnetz.de> writes:
>>=20
>> > Am 25.01.21 um 23:35 schrieb Richard Henderson:
>> >> On 1/25/21 11:02 AM, Stefan Weil wrote:
>> >>> Am 25.01.21 um 20:02 schrieb Richard Henderson:
>> >>>> On 1/25/21 8:58 AM, Stefan Weil wrote:
>> >>>>> I have no evidence that TCI is less reliable than TCG, so I would =
not write
>> >>>>> that.
>> >>>> It can't pass make check-tcg.
>> >>> Where does it fail? Maybe an expected timeout problem which can be s=
olved by
>> >>> increasing the timeouts for TCI?
>> >>>
>> >>> I have just run a local test of `make check-tcg` with native TCG and=
 with TCI
>> >>> and did not see a difference. But I noticed that in both cases many =
tests show
>> >>> "skipped".
>> >> You need to enable docker or podman for your development, so that you=
 get all
>> >> of the cross-compilers.
>> >>
>> >> Then:
>> >>
>> >>    TEST    fcvt on arm
>> >> TODO ../qemu/tcg/tci.c:614: tcg_qemu_tb_exec()
>> >> ../qemu/tcg/tci.c:614: tcg fatal error
>> >> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
>> >>
>> >>    TEST    float_convs on m68k
>> >> TODO ../qemu/tcg/tci.c:614: tcg_qemu_tb_exec()
>> >> ../qemu/tcg/tci.c:614: tcg fatal error
>> >> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
>> >>
>> >> which is of course one of the TODO assertions.
>> >> It's positively criminal those still exist in the code.
>> >
>> >
>> > I installed podman and repeated `make check-tcg`. The log file still=20
>> > shows 87 lines with "SKIPPED". There is also a gdb core dump, several=
=20
>> > warnings, but nothing related to TCI. Both tests cited above seem to=20
>> > work without a problem.
>>=20
>> I'm going to go out on a limb and guess you have commit:
>>=20
>>   23a77b2d18 (build-system: clean up TCG/TCI configury)
>>=20
>> which temporarily has the effect of disabling TCI. See
>>=20
>>   Subject: Re: [PATCH v4 1/4] configure: Fix --enable-tcg-interpreter
>>   From: Paolo Bonzini <pbonzini@redhat.com>
>>   Message-ID: <2b8b6291-b54c-b285-ae38-21f067a8497d@redhat.com>
>>   Date: Mon, 25 Jan 2021 17:36:42 +0100
>>=20
>> with that fix fixed I see the same failures as Richard:
>>=20
>>   ./qemu-arm ./tests/tcg/arm-linux-user/fcvt > /dev/null
>>   TODO ../../tcg/tci.c:614: tcg_qemu_tb_exec()
>>   ../../tcg/tci.c:614: tcg fatal error
>>   qemu: uncaught target signal 11 (Segmentation fault) - core dumped
>>   fish: =E2=80=9C./qemu-arm ./tests/tcg/arm-linu=E2=80=A6=E2=80=9D termi=
nated by signal SIGSEGV (Address boundary error)
>>=20
>> which does raise the question before today when was the last time anyone
>> attempted to run check-tcg on this?
>>=20
>> > The complete log file is available from=20
>> > https://qemu.weilnetz.de/test/check-tcg.txt.
>> >
>> > Daniel, regarding your comment: TCI has 100 % test coverage for the=20
>> > productive code lines.
>>=20
>> By what tests? The fact you don't hit asserts in your day to day testing
>> doesn't mean there are features missing that are easily tripped up or
>> that TCI got it right.
>>=20
>> > All code lines which were never tested raise an=20
>> > assertion, so can easily be identified (and fixed as soon as there is =
a=20
>> > test case which triggers such an assertion). The known deficits are=20
>> > speed, missing TCG opcodes, unimplemented TCG opcodes because of missi=
ng=20
>> > test cases and missing support for some host architectures.
>>=20
>> Passing check-tcg would be a minimum for me.
>
> Passing check-tcg *in gitlab CI* would be the minimum to consider
> it on a par with TCG.
>
> The lack of automated GitLab CI for TCI is a reason my proposed wording
> described TCI as less reliable than native TCG. We can't claim it has
> equivalent reliability unless we have equiv automated testing of TCI.

I should point out that check-tcg is hardly a comprehensive test suite.
Most of our instruction testing for example tends to be done with RISU.
Any program that attempts to use vector instructions is likely to come a
cropper with TCI. I guess we don't even attempt to run check-acceptance
due to speed issues but it would be interesting to see how far it gets.

>
> Regards,
> Daniel


--=20
Alex Benn=C3=A9e

