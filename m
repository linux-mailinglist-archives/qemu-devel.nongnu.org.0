Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 417BE3EEDE4
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 15:58:02 +0200 (CEST)
Received: from localhost ([::1]:52460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFzbN-0001fb-9k
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 09:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mFzZZ-0000SQ-4q; Tue, 17 Aug 2021 09:56:09 -0400
Received: from [201.28.113.2] (port=26493 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mFzZV-0000kZ-Fg; Tue, 17 Aug 2021 09:56:08 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Tue, 17 Aug 2021 10:56:01 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id A0CD0800021;
 Tue, 17 Aug 2021 10:56:00 -0300 (-03)
Subject: Re: [PATCH for-6.2 1/2] include/qemu/int128.h: introduce bswap128s
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210816191316.1163622-1-matheus.ferst@eldorado.org.br>
 <20210816191316.1163622-2-matheus.ferst@eldorado.org.br>
 <b5b5ca02-aac5-4bc3-3898-b45c53c8b5a6@redhat.com>
 <a0b41585-27d1-aeaf-be03-f14935c1b8c9@eldorado.org.br>
 <CAFEAcA-eOerMaWW60hwq8-QRFND5SZDoC0PRoNy-zC-wdUwW_g@mail.gmail.com>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <ed7278a6-4fb2-a5b7-61b8-c7aaa3fdecc0@eldorado.org.br>
Date: Tue, 17 Aug 2021 10:55:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-eOerMaWW60hwq8-QRFND5SZDoC0PRoNy-zC-wdUwW_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 Aug 2021 13:56:01.0442 (UTC)
 FILETIME=[9CF12020:01D7936F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_05=-0.5, NICE_REPLY_A=-1.961,
 PDS_HP_HELO_NORDNS=0.825, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/08/2021 09:15, Peter Maydell wrote:
> [E-MAIL EXTERNO] Não clique em links ou abra anexos, a menos que você possa confirmar o remetente e saber que o conteúdo é seguro. Em caso de e-mail suspeito entre imediatamente em contato com o DTI.
> 
> On Tue, 17 Aug 2021 at 13:09, Matheus K. Ferst
> <matheus.ferst@eldorado.org.br> wrote:
>>
>> On 17/08/2021 06:27, Philippe Mathieu-Daudé wrote:
>>> On 8/16/21 9:13 PM, matheus.ferst@eldorado.org.br wrote:
>>>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>>> -static inline Int128 bswap128(Int128 a)
>>>> -{
>>>> -    return int128_make128(bswap64(int128_gethi(a)), bswap64(int128_getlo(a)));
>>>> -}
>>>
>>> Personally I'd move this one to the other #ifdef side,
>>> and implement here with __builtin_bswap128().
>>>
>>
>> I saw this builtin, but I couldn't test it on my system. It seems that
>> Clang doesn't implement it, and it's only available on GCC 11:
>> https://godbolt.org/z/T6vhd5a38 . I think we can use it, but I'd need to
>> figure how to add a test for it in the configure script.
> 
> You should be able to get away without a configure script test --
> #if __has_builtin(__builtin_bswap128)
> /* version with the builtin here */
> #else
> /* fallback */
> #endif
> 
> ought to work. (Any gcc new enough to have the builtin also has
> __has_builtin; clang has had __has_builtin for ages; our compiler.h
> defines a fallback "always 0" __has_builtin for older compilers.)
> 
> -- PMM
> 

Nice, I'll prepare a v2.

-- 
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software Júnior
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

