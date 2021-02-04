Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2088B31011E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 00:54:14 +0100 (CET)
Received: from localhost ([::1]:57016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7oRw-0003jd-OE
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 18:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7oQs-0003DS-8S
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 18:53:07 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7oQp-0001Ky-T7
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 18:53:05 -0500
Received: by mail-pg1-x536.google.com with SMTP id o21so1847736pgn.12
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 15:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R5PTQV1aZC1v/XBy0kIyjslHLfjOxocgPBHDFciNUw8=;
 b=W3T5GfAHNMv3gF2m3k/ojaY696RqPCy8T1mthrll9sXmJG8UQrrHN6gEnSt+ODlP4M
 N4Gz25jo6lfU54a0ANQMWTyAA8VmdM4LDK+K3sR5xtuZgop36dGPs5t2IIgkgtXQgH88
 +3hL7GMDPQCpRxGaMCsD7cDtb4sMr3bacx5stP5hpa5ubNo0m+vjxa8I0Ce2L9FfmyBQ
 CDvHfNhZkWqANGkQMIbrcJvl3fiQLUViYdaoalLSttEUEC6ZFZlBFjp2JY7jRp+uRtfO
 EegUOWVpUiCRz5OLkr6huizOxBiXfbb8f9LxjXMxd5ptO0mpRTWP7n+6F2jsgjkY7v/N
 hEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R5PTQV1aZC1v/XBy0kIyjslHLfjOxocgPBHDFciNUw8=;
 b=kLaf97r0S1aHJUjBYBPU1Zbz/J1Bz6MdYkaXogyiqd++g9QinSBLjHxMEdW+DtBCzY
 0H+SOwU8ZO4Hn7/HkyIqf/F1XTgDCjj/ONW+RzeqjGHmtQOwzmrMPoHnI0v4M1aIWBAP
 axwQJgv+SnxKO3ajkokmt8/eFPpB7ezedKQ6LVPMX8M6ufrVZYxxJmkz0lEzQkdLaSqI
 e392HooCwZkIe6Y2SkDOWn1z1J9htiJBppQzdzwsEeTTPABhGzhKCO37Z0zco7+GNAR+
 JOWPxxPs1OzSH7WDbqgMUy2bLmORr8e+lzfDlWmTzOCY9ZhQWgAk4FWQ1rWOr9V61k9l
 +2/Q==
X-Gm-Message-State: AOAM531SfzKGbogTfCChMl810pzwl9OIJhdaITAeYUQLEKU4rKOOG6TM
 mi+JMIyQcrt7FYzVn+M23fKnmyGiCz26cn5s
X-Google-Smtp-Source: ABdhPJzomB+og0TyxTjhHPEcwetFjRTxhqfnTu1qnHmhG85n73h4+3pTC3qzbci4A6OcjmbMvxGUcg==
X-Received: by 2002:a63:9811:: with SMTP id q17mr1458645pgd.238.1612482782244; 
 Thu, 04 Feb 2021 15:53:02 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m4sm115566pfd.130.2021.02.04.15.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 15:53:01 -0800 (PST)
Subject: Re: [PATCH v2 00/93] TCI fixes and cleanups
To: Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <CAFEAcA8yiVXSLwP4kzsE4MSfhVKTn9H3VtnXgXRmnHZmxUrfhw@mail.gmail.com>
 <6923a507-4d10-49c5-c9b6-b275bcb520dd@weilnetz.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <62c24463-5998-d79a-ce07-8c6f01a78b3d@linaro.org>
Date: Thu, 4 Feb 2021 13:52:58 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6923a507-4d10-49c5-c9b6-b275bcb520dd@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.182,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 10:02 AM, Stefan Weil wrote:
> Am 04.02.21 um 10:58 schrieb Peter Maydell:
>> Not listed, but also a problem:
>>   * it's a configure-time choice, not a runtime choice
> 
> That's the feature which I also desire most.

Well... that depends on how you see tci being most used.

If, like John Glaubitz, you want to use tci for odd systems that don't have a
native backend, then a configure-time choice is appropriate.

If you're trying to use tci as a cross-check to the native tcg backend, then a
command-line choice could be appropriate.  With the bits done below, it could
be just two extra files compiled, which I suppose is light-weight enough.

If you're trying to use tci as a true interpreter for a single-use TB... then
nothing about tci in its current form is appropriate.  Of course, I also
believe that our single-use TBs should not be single-use -- because of mttcg,
we can no longer reuse the memory from them, and therefore we might as well
just keep them around, properly hashed.


> Technically it was not possible to
> have native and interpreted TCG in the same code some years ago when I tried to
> implement this, but that might have changed as TCG has evolved a lot.

It is still not possible.

However.  There are a number of things that I would like to change about tcg
that would make that more practical.

In particular, and most importantly, tcg should be sufficiently partitioned
from any target that it should be built once.

  * There are a number of constants that tcg gets from
    target/foo/cpu.h as defines.  We could just as easily
    receive those constants via some structure.  The code
    that is generated in the end should be the same.

    This is a prerequisite to having multiple guest cpus
    at the same time.  The canonical example of course are
    the Xilinx boards that have both Arm and MicroBlaze cpus.

  * There are a number of constants that target/ gets from
    tcg, but shouldn't.  These are mistakenly used by arm
    and tricore (probably by my hand), and represent premature
    optimization in the front end in both cases, IMO.
    (Even though I'm probably guilty of all instances.)

    We'll know we've got all of these fixed when
      touch tcg/i386/tcg-target.h
    rebuilds no files outside of tcg/.

    Having these constants in some structure is a
    prerequisite to having a native tcg backend live
    along side any kind of tci, including the pure
    interpreter form.

> I disagree on the #ifdefs which can help to understand TCG better in my
> opinion, so for me they have a useful side effect of being also documentation.

Surely not.  Documentation is documentation; ifdefs are clutter, to be used
only when there is no alternative.

I think what you actually want is the structure described above, where all of
the TCG_TARGET_HAS_* knobs are data, and you can change them ad hoc -- even
from within gdb.


r~

