Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C706461FC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 21:01:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p30aM-0007P3-Mt; Wed, 07 Dec 2022 15:00:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1p30aK-0007Ou-2H
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 15:00:04 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1p30aH-00054u-Ck
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 15:00:03 -0500
Received: from [192.168.178.59] (pd9ec324f.dip0.t-ipconnect.de [217.236.50.79])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 7FCC3DA0791;
 Wed,  7 Dec 2022 20:59:58 +0100 (CET)
Message-ID: <2b231ff6-8f06-15be-cac1-d6b82a02ce14@weilnetz.de>
Date: Wed, 7 Dec 2022 20:59:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
To: eric.auger@redhat.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
Cc: eric.auger.pro@gmail.com, Stefan Hajnoczi <stefanha@gmail.com>,
 pbonzini@redhat.com, richard.henderson@linaro.org, paul@nowt.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20221207132439.635402-1-eric.auger@redhat.com>
 <f8a36758-cff2-3df3-3e30-083175e47131@redhat.com>
 <CAJSP0QXo0p5E_G9rqLO0wqC=NDQzMhoJOJDb0ShV+7OetFMMbg@mail.gmail.com>
 <6a39520b-5445-bda4-951f-998675d6e045@redhat.com>
 <0828040a-c297-46b0-68b7-4761583f1ceb@linaro.org>
 <3aab489e-9d90-c1ad-0b6b-b2b5d80db723@redhat.com>
 <b0afb1f7-1156-9b4a-a87b-f56c72f753c0@weilnetz.de>
Subject: Compiler warnings with maximum warning level (was: Re: [PATCH for
 7.2?] target/i386: Remove compilation errors when
 -Werror=maybe-uninitialized)
In-Reply-To: <b0afb1f7-1156-9b4a-a87b-f56c72f753c0@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 07.12.22 um 20:11 schrieb Stefan Weil:
>>>>>> On 12/7/22 14:24, Eric Auger wrote:
>>>>>>> Initialize r0-3 to avoid compilation errors when
>>>>>>> -Werror=maybe-uninitialized is used
>>>>>>>
>>>>>>> ../target/i386/ops_sse.h: In function ‘helper_vpermdq_ymm’:
>>>>>>> ../target/i386/ops_sse.h:2495:13: error: ‘r3’ may be used
>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>    2495 |     d->Q(3) = r3;
>>>>>>>         |     ~~~~~~~~^~~~
>>>>>>> ../target/i386/ops_sse.h:2494:13: error: ‘r2’ may be used
>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>    2494 |     d->Q(2) = r2;
>>>>>>>         |     ~~~~~~~~^~~~
>>>>>>> ../target/i386/ops_sse.h:2493:13: error: ‘r1’ may be used
>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>    2493 |     d->Q(1) = r1;
>>>>>>>         |     ~~~~~~~~^~~~
>>>>>>> ../target/i386/ops_sse.h:2492:13: error: ‘r0’ may be used
>>>>>>> uninitialized in this function [-Werror=maybe-uninitialized]
>>>>>>>    2492 |     d->Q(0) = r0;
>>>>>>>         |     ~~~~~~~~^~~~
>>>>>>>
>>>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>>>>> Fixes: 790684776861 ("target/i386: reimplement 0x0f 0x3a, add AVX")
>>>>>>>
>>>>>>> ---
>>>>>>>
>>>>>>> Am I the only one getting this? Or anything wrong in my setup.
> 
> Hi Eric,
> 
> no, you are not the only one. I regularly build with higher warning 
> levels, for example with -Weverything on macOS, and get a much longer 
> list which includes the mentioned warnings (see below).

The latest QEMU code produces 6780505 compiler warnings and a build log 
file with 2.7 GB (!) with compiler option `-Weverything` on macOS.

Many warnings occur more than once, but there remain 193313 unique 
warnings for the QEMU code (see 
https://qemu.weilnetz.de/test/warnings-20221207.txt). Here is a list of 
all kinds of warnings sorted by frequency:

    1 -Wkeyword-macro
    1 -Wundeclared-selector
    1 -Wunreachable-code-loop-increment
    1 -Wunused-but-set-parameter
    2 -Wgnu-union-cast
    2 -Woverlength-strings
    3 -Walloca
    5 -Wflexible-array-extensions
    5 -Wstrict-selector-match
    5 -Wstring-conversion
    5 -Wtautological-value-range-compare
    6 -Wcstring-format-directive
    8 -Wstatic-in-inline
   13 -Wobjc-messaging-id
   13 -Wvla
   14 -Wobjc-interface-ivars
   16 -Wimplicit-float-conversion
   17 -Wformat-nonliteral
   24 -Wredundant-parens
   39 -Wfloat-equal
   44 -Wc++-compat
   47 -Wzero-length-array
   53 -Wdouble-promotion
   53 -Wvariadic-macros
   65 -Wpacked
   74 -Wcomma
   82 -Wunreachable-code-return
   90 -Wformat-pedantic
   90 -Wmissing-noreturn
   94 -Wgnu-flexible-array-initializer
  120 -Wcovered-switch-default
  132 -Wdirect-ivar-access
  136 -Wconditional-uninitialized
  144 -Wgnu-designator
  147 -Wdisabled-macro-expansion
  150 -Wgnu-conditional-omitted-operand
  161 -Wunreachable-code-break
  184 -Wcompound-token-split-by-space
  228 -Wfloat-conversion
  248 -Wunreachable-code
  348 -Wgnu-binary-literal
  443 -Wshadow
  534 -Wmissing-variable-declarations
  563 -Wshift-sign-overflow
  613 -Wembedded-directive
  620 -Wgnu-zero-variadic-macro-arguments
  742 -Wswitch-enum
  843 -Wdocumentation
  897 -Wgnu-case-range
1292 -Wassign-enum
1621 -Wgnu-empty-struct
1700 -Wextra-semi
1779 -Wpointer-arith
1847 -Wbad-function-cast
2176 -Wdocumentation-unknown-command
2221 -Wmissing-field-initializers
3101 -Wsign-compare
3238 -Wunused-macros
3559 -Wcast-align
4528 -Wcast-qual
7066 -Wgnu-statement-expression
7651 -Wnull-pointer-subtraction
7995 -Wimplicit-int-conversion
8854 -Wpadded
9737 -Wshorten-64-to-32
10596 -Wgnu-empty-initializer
13274 -Wlanguage-extension-token
13899 -Wunused-parameter
15642 -Wused-but-marked-unused
18669 -Wpedantic
44737 -Wsign-conversion

