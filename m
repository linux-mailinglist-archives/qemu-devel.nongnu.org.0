Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 907DAABE38
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 19:03:24 +0200 (CEST)
Received: from localhost ([::1]:58814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6Hdr-0006vH-MU
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 13:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37562)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1i6HcD-00064w-6w
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 13:01:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1i6HcC-0006BI-4U
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 13:01:40 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:36385)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1i6HcB-00068V-SI
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 13:01:40 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mi2Bb-1ibCa103V3-00e71U; Fri, 06 Sep 2019 19:01:36 +0200
To: Max Filippov <jcmvbkbc@gmail.com>
References: <20190826195806.15998-1-jcmvbkbc@gmail.com>
 <67f40cbf-39d3-d2d6-0e4b-219f549ae5d5@vivier.eu>
 <CAMo8BfK7vsOU1w1HceWGwJS8XF2D+KQmcqgOu0EvaWE6FLFewQ@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1ed5286f-fb3a-30b7-d8d1-bdec99f5a792@vivier.eu>
Date: Fri, 6 Sep 2019 19:01:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMo8BfK7vsOU1w1HceWGwJS8XF2D+KQmcqgOu0EvaWE6FLFewQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2BsOcC+RV7v/z9N556ZNdGOcsZA5fpWxH3qYAf21V+z1nEPCtJ4
 Ru2k1/pzCJht15asrxnL78Qo3t9NzpkG+zDNldJoLISDI0WagPaPVTL0LoQZMShE0Fv++8B
 +pPU0XpOZJjkEBMVo5VvQmp0Ymq96uJhgtbX9PfDdvNvPLTBWypjuSuG6cJiBTB7Pnx3vk5
 Efi3NH8HJPT9B5pj6iT0Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:in9b06nJlTY=:gTrv/YB/eef/Q/EIJXU+/B
 nRUZwnmJFVH056LBPgNEYyp0ROyLcjCQUJ7uqNLjxC6nl52X4YwbLIJc1SEl3OegsiYuuKk8I
 RR7zU/wscf++n5tioJ60Hj1ijHmOP+tN2XQANHCw4wflDLQTCKHMm5NPGwfuQWmuUbkaddrnQ
 hhW7gGTgieLNKY37DD69JOxwhVFEzC1ShTVUUDJ40qSl0t2LyRWJV2gQXHWjjp05lyUGZwERG
 QB0owYyzufL66/Mga6xf8uA4r83BQYZkPA9KY5CsSJGcBPM/areiJNJr4m6ubhVxRlfIGFh30
 te1BEXxSuWZX276EHaLyl26kCCffBq2OeBypPdCvsOc/wf0GUOcmcelray4Fj/G/W25DlbuuB
 YVuo7mi16YelpVg+rDjQmFNgjgTJxcDEgRJysVf0t5BPu0ehI7w1eCKdZfAORv5M9kCrmDz+W
 DgdOsl90xptgJOoLXzdpJ5BARv02e+Bxf062wRYlNAB4eIkIRTeF4SDRnqG6gGy/O+WRgJQWa
 GStMcHx78/Qbp8FgM1GDGNFpESPE5UoCu97F5//2whiMe8gRuixtNssvTJnUKROstGlQJC8An
 NyeHdIVXklnWWwSxlWPjFScEDysqeGQZ7jhnmuq7S1iq6sWp0CXzk2luOooMy6ystKalKNlmM
 /Bkoqkc7uKv45Kfoupro9zrDtOHrvT2Xsc/nnN13hmMe4YSWLhFEqXIP/OAFkqCUta+qQG6aY
 7PkulZrgZ5RKqhLE4hvcmuvKNWaagAqiqT5lm/WyCUgC+Hv6Re1u5y2JrqabO3MKHyHdwdiD4
 FuDqhN5gkk7GqxAcDbjiZYsSdX9RwReRMI3haPgwRlkz7zsgznj3M3QU8AYkrahs5a1TVE7sw
 ozl4SWLpTNc/KPDeTlGtDwim8+0mE4mpVByXuezVjz7w10X2B7UP4Tbb9lZg1KutsH2I+ThxE
 oAQoS6Kz895j4/ij7L+CCUiJdqzntVfz1lUmuX/aRjeahpwjmytfPufpMBYmNZaZ/7x85m6r6
 kLf9grR/n0nLS9guPHTl7hDR4nqEJaD3wF8rMydXlV7n79pmkdQGfF/RXQF/J8MUVg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-devel] [PATCH v3] target/xtensa: linux-user: add call0
 ABI support
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/09/2019 à 18:55, Max Filippov a écrit :
> On Fri, Sep 6, 2019 at 2:33 AM Laurent Vivier <laurent@vivier.eu> wrote:
>> Le 26/08/2019 à 21:58, Max Filippov a écrit :
>>> +#if defined(TARGET_XTENSA)
>>> +    if (getenv("QEMU_XTENSA_ABI_CALL0")) {
>>> +        xtensa_set_abi_call0();
>>> +    }
>>
>> Not needed, this is done by parse_args() that checks
>> getenv(arginfo->env) and calls arginfo->handle_opt()
>> (handle_arg_abi_call0()).
> 
> Thank you, I'll fix that. I got confused by the similar handling of
> QEMU_STRACE, I'll post a cleanup that removes that as well.

Good point.

It seems getenv("QEMU_STRACE") and getenv("QEMU_RAND_SEED") could be
removed.

Thanks,
Laurent


