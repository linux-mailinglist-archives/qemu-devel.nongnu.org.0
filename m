Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6D7303BE1
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 12:43:00 +0100 (CET)
Received: from localhost ([::1]:41982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4MkN-0001f7-Ir
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 06:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l4Mi1-0008Uk-Ez
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:40:33 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:38696
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l4Mhx-0007gl-Ak
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 06:40:33 -0500
Received: from mobile-149-057.wlan.uni-mannheim.de
 (mobile-149-057.wlan.uni-mannheim.de [134.155.149.57])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 25858DA0042;
 Tue, 26 Jan 2021 12:40:27 +0100 (CET)
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210125144530.2837481-1-philmd@redhat.com>
 <20210125144530.2837481-5-philmd@redhat.com>
 <20210125164746.GE3538803@redhat.com>
 <992cbe66-dfae-7950-0d92-516b2f0c9717@redhat.com>
 <9f22d4b0-34ca-6798-3661-36057609c152@weilnetz.de>
 <30cc0c14-fbec-bb21-2b6b-8e295029bc1f@linaro.org>
 <8f1f2dc6-5ad2-7d48-c2f9-9afa1e4d4065@weilnetz.de>
 <81c810b4-1bd3-631d-4b5b-7e54a27a5b4c@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v4 4/4] meson: Warn when TCI is selected but TCG backend
 is available
Message-ID: <cd9265f7-4887-63bb-e36e-ace708d062c1@weilnetz.de>
Date: Tue, 26 Jan 2021 12:40:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <81c810b4-1bd3-631d-4b5b-7e54a27a5b4c@linaro.org>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Am 25.01.21 um 23:35 schrieb Richard Henderson:
> On 1/25/21 11:02 AM, Stefan Weil wrote:
>> Am 25.01.21 um 20:02 schrieb Richard Henderson:
>>> On 1/25/21 8:58 AM, Stefan Weil wrote:
>>>> I have no evidence that TCI is less reliable than TCG, so I would no=
t write
>>>> that.
>>> It can't pass make check-tcg.
>> Where does it fail? Maybe an expected timeout problem which can be sol=
ved by
>> increasing the timeouts for TCI?
>>
>> I have just run a local test of `make check-tcg` with native TCG and w=
ith TCI
>> and did not see a difference. But I noticed that in both cases many te=
sts show
>> "skipped".
> You need to enable docker or podman for your development, so that you g=
et all
> of the cross-compilers.
>
> Then:
>
>    TEST    fcvt on arm
> TODO ../qemu/tcg/tci.c:614: tcg_qemu_tb_exec()
> ../qemu/tcg/tci.c:614: tcg fatal error
> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
>
>    TEST    float_convs on m68k
> TODO ../qemu/tcg/tci.c:614: tcg_qemu_tb_exec()
> ../qemu/tcg/tci.c:614: tcg fatal error
> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
>
> which is of course one of the TODO assertions.
> It's positively criminal those still exist in the code.


I installed podman and repeated `make check-tcg`. The log file still=20
shows 87 lines with "SKIPPED". There is also a gdb core dump, several=20
warnings, but nothing related to TCI. Both tests cited above seem to=20
work without a problem.

The complete log file is available from=20
https://qemu.weilnetz.de/test/check-tcg.txt.

Daniel, regarding your comment: TCI has 100 % test coverage for the=20
productive code lines. All code lines which were never tested raise an=20
assertion, so can easily be identified (and fixed as soon as there is a=20
test case which triggers such an assertion). The known deficits are=20
speed, missing TCG opcodes, unimplemented TCG opcodes because of missing =

test cases and missing support for some host architectures.

Stefan




