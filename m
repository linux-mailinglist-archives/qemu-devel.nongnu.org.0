Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BD7FF889
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Nov 2019 09:47:06 +0100 (CET)
Received: from localhost ([::1]:52590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWGCx-0000Sq-Ua
	for lists+qemu-devel@lfdr.de; Sun, 17 Nov 2019 03:47:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53756)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iWGBY-0008Up-5w
 for qemu-devel@nongnu.org; Sun, 17 Nov 2019 03:45:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iWGBW-0006r0-6Y
 for qemu-devel@nongnu.org; Sun, 17 Nov 2019 03:45:31 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40000)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iWGBS-0006jh-J1
 for qemu-devel@nongnu.org; Sun, 17 Nov 2019 03:45:28 -0500
Received: by mail-wr1-x429.google.com with SMTP id q15so3079204wrw.7
 for <qemu-devel@nongnu.org>; Sun, 17 Nov 2019 00:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y6syjCoOdgMktrYsIQGHL/2dX75rjAIcACNuCTtXC/E=;
 b=RhtGBc71iuQL9eQCc7BDCGiKmQ22Q+ssK5OBKR+xs0OXIlniOTe3v6TlWfWqm9czWb
 p7e+Kp358Ul6ixPjpCis+QYLx8JO1ZUOQtP3NEF32Nak5atLej5gFCDikMh1jLh03T3y
 cZdBeK4LDh/zU0g1i2tO9R/fwO0GqzPMt41mYmkmz8sApvOvBPDH67bWx5IPEIQBswwo
 03GJKYhdDglAhSSqs2W9cyhHUQSSazHn1qWP6k/DbtHG1mE9FXOVfUcDLdltwAYJ8D/n
 uMtWOvVAcSoOphQ+YTMm2EdI/BQp59BU9kmT4yvnuX3GNNeJAvgDwXSKE6hQWA71KH2/
 v0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y6syjCoOdgMktrYsIQGHL/2dX75rjAIcACNuCTtXC/E=;
 b=riQ2gftuCRSd2G41Pn4PQcX8AqXKF8pccf+i1RK/O3zK7zyLaL8IxrsjL5VWfhK5Nw
 H3YIzSnKiMt8BWFA6KmM37u/bzT/L/oZtjEuT+Z4JeOD4XmnUFw+qslEX9OuvcIdbEUT
 5EChbCr865TpRHWDZ18d0nVKffGs/L4psDco/mV35JrN52WmLEE7CV+63hAWTgpZI8ux
 EKRwYUxsmWGIoE4zznPkxT02AT91//9bfX4cSISmC/F2alnAX4W/hbmMH5lcASLcVCGC
 1ZxQAxAZccmPaEXrYbxDHuBat4tTLR0laSZtPBdv9j6CRDDTTBFicz4a6+5QwSyqCapX
 kF3Q==
X-Gm-Message-State: APjAAAXtnyCnWF5+I5vT70ArUTrMlKK9LtRVpv1WMqypO++x9eY8bt0/
 gyt3ApKqqE0rQNFLK6Uus+i9og12KTiRcA==
X-Google-Smtp-Source: APXvYqzte6JB61TQ7FZRp6PbaF8cqKNxoZpoSrt66cY8x7rB4xJXTr/fcJ+4+eLAQGmHtb+cBsOHNQ==
X-Received: by 2002:a5d:5742:: with SMTP id q2mr13942301wrw.311.1573980321699; 
 Sun, 17 Nov 2019 00:45:21 -0800 (PST)
Received: from [192.168.8.102] (180.red-80-27-55.dynamicip.rima-tde.net.
 [80.27.55.180])
 by smtp.gmail.com with ESMTPSA id q17sm15767356wmj.12.2019.11.17.00.45.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 17 Nov 2019 00:45:20 -0800 (PST)
Subject: Re: Invalid ARM instruction for clang-compiled Android code
To: Peter Maydell <peter.maydell@linaro.org>,
 Michael Goffioul <michael.goffioul@gmail.com>
References: <CAB-99Lv3LySps4MOoKEj7Sp0CBouv-KgZp2osbiokSq_Gdfj5Q@mail.gmail.com>
 <CAFEAcA-RXurz2OB24i1wypumCDWf5s__mC33mFzBA3SCsm4_VA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <95b4533e-2cf2-c76e-38af-3757498ed9ef@linaro.org>
Date: Sun, 17 Nov 2019 09:45:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-RXurz2OB24i1wypumCDWf5s__mC33mFzBA3SCsm4_VA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::429
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/15/19 12:03 PM, Peter Maydell wrote:
> On Fri, 15 Nov 2019 at 05:03, Michael Goffioul
> <michael.goffioul@gmail.com> wrote:
>> When running QEMU user mode on some code compiled by clang (dynamic linker from AOSP-10), the emulator chokes on this instruction:
>>
>>    9aa92:       e8c0 2277       strexd  r7, r2, r2, [r0]
> 
> I think that ought to be a valid insn...
> 
>> From debugging, I determined that op_strex() calls unallocated_encoding(), which I think leads to the SIGILL signal generated.
>>
>> I run the emulator without specifying the ARM cpu type, I think it then defaults to "any", which should support all instructions, if I'm not mistaken.
>>
>> Is this instruction really invalid? Or am I doing something wrong?
> 
> Which version of QEMU are you using? (Looking at the code I
> suspect we still have this bug in master, but it's always
> useful to specify what version you're using in a bug report.)
> 
> Richard, I think we're tripping over the check you added
> in commit af2882289951e. Specifically:
> 
> +    /* We UNDEF for these UNPREDICTABLE cases.  */
> +    if (a->rd == 15 || a->rn == 15 || a->rt == 15
> +        || a->rd == a->rn || a->rd == a->rt
> +        || (s->thumb && (a->rd == 13 || a->rt == 13))
> +        || (mop == MO_64
> +            && (a->rt2 == 15
> +                || a->rd == a->rt2 || a->rt == a->rt2
> +                || (s->thumb && a->rt2 == 13)))) {
> +        unallocated_encoding(s);
> +        return true;
> +    }
> 
> in the mop == MO_64 subclause we check for
>  a->rt == a->rt2
> so we will UNDEF for rt == rt2, as in this example. But the
> pseudocode in the spec doesn't say that rt == rt2 is
> an UNPREDICTABLE case. (It is an UNDPREDICTABLE
> case for LDREXD, but STREXD lets you write the same
> register twice if you want to.) Or am I misreading this?

You're right.  Too much cut-and-paste between strexd and ldrexd.


r~

