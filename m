Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A1D4C1510
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 15:05:02 +0100 (CET)
Received: from localhost ([::1]:41432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMsGK-0003TT-Ji
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 09:05:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMsC9-0000R3-Jr; Wed, 23 Feb 2022 09:00:44 -0500
Received: from [2607:f8b0:4864:20::102d] (port=53014
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMsC1-0007H3-OF; Wed, 23 Feb 2022 09:00:36 -0500
Received: by mail-pj1-x102d.google.com with SMTP id v4so2728689pjh.2;
 Wed, 23 Feb 2022 06:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=T+y+xA9qj6MT32+TrngYhekIAhT/7dydOHxB+0xIjuk=;
 b=FkpRnf2Up7Q+vWgLfvUFo/IKiMKt30ESfTJBJrW5ECcrbHE9/dB/vCGxWdCFQOZu8/
 Z267wm9nmu/hG4fNHzFkvzBTXMpZzMJIuOsdsCGJfskZiRnBxvOoBq4sd31Oqfm/hD2/
 xnCufaiGVP+Xs+aYVYJjkIIVxuEvtBU1aGgczjwL4sGOJ4SnFeyS+QmN3QmLwbwIovuL
 XTaNLID8PM8yNLCtCJQECv3NLujNS7ici+9Hw3IiQ77skPrmQ+YGqOhODwgWKcu4VXMY
 3G5ZFHBP06XxPNG9BkoR7A0oJpGTJhePIi3HP53IyBkc9FR5Z5JhUuwGba3CNog8W047
 WM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T+y+xA9qj6MT32+TrngYhekIAhT/7dydOHxB+0xIjuk=;
 b=JyE+j+X72Pf7Uz8uxG/mD2kpkfeQOpJGoLU+Cf5xTVAMYH4Mv4eEXGFtZAqD8dha2/
 Nnl8bbVPHyvx4yy8MOvt+NMkOZNmt2K845QU5QzhyV7DWSPNaQRr9A6P3PYUqnxFJxI9
 aMfveX1LSDQYN9M6VgmowqGicmp39Kv/10bpYnPFntNXpZsJ5JkyAdlP/HWDU4e8mYrd
 b32HNk/mycaeYIuabldOg2Ks70uSnf/xmnDXOMN7qPwwoXjdUyoMsLDxlkO0/OpBixJ9
 yddYotVIjmV00toBWipgY/6iES1O0Z9EnHf7wvJmmgzWKoGpg7UGfoTO/5e3YFE1zGog
 SnDA==
X-Gm-Message-State: AOAM530sxc9bpYy1D6ixkV7gjsrBlejQddWL7UwXBIrIkP+/JlwonCy2
 XiLHDWLcBCa6pm6Lgct2aWY=
X-Google-Smtp-Source: ABdhPJwFML46R6l0kPC9idX1KXzHO3cMwSgYMZYbxtHZrRuBDswWyFAQEBf0pXB9YvJvqMGL6Ak40Q==
X-Received: by 2002:a17:90b:618:b0:1bc:2e76:6385 with SMTP id
 gb24-20020a17090b061800b001bc2e766385mr9344329pjb.1.1645624831121; 
 Wed, 23 Feb 2022 06:00:31 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id c15sm20221929pfv.6.2022.02.23.06.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 06:00:30 -0800 (PST)
Message-ID: <35c33bc0-54ac-b40d-6f81-f75ba59b163a@gmail.com>
Date: Wed, 23 Feb 2022 15:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <YhYVVnVSL8K1S4MC@redhat.com>
 <e9f70381-03f2-9582-8ad6-e9252d3195ab@gmail.com>
 <YhY56KLLPrqGWtBM@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <YhY56KLLPrqGWtBM@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cleber Rosa <cleber@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Oleg Vasilev <me@svin.in>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Idan Horowitz <idan.horowitz@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/2/22 14:43, Daniel P. Berrangé wrote:
> On Wed, Feb 23, 2022 at 02:34:23PM +0100, Philippe Mathieu-Daudé wrote:
>> On 23/2/22 12:07, Daniel P. Berrangé wrote:
>>> On Tue, Feb 22, 2022 at 06:33:41PM +0100, Philippe Mathieu-Daudé wrote:
>>>> +Igor/MST for UEFI tests.
>>>>
>>>> On 22/2/22 17:38, Daniel P. Berrangé wrote:
>>>>> On Tue, Feb 22, 2022 at 04:17:23PM +0000, Alex Bennée wrote:
>>>>>>
>>>>>> Alex Bennée <alex.bennee@linaro.org> writes:
>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> TL;DR:
>>>>>>>
>>>>>>>      - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug
>>>>>>
>>>>>> Laszlo,
>>>>>>
>>>>>> Would it be possible to do a less debug enabled version of EDK2 on the
>>>>>> next update to pc-bios/edk2-*?
>>>>>
>>>>> NB, Laszlo is no longer  maintaining EDK2 in QEMU, it was handed
>>>>> over to Philippe.  I'm CC'ing Gerd too since he's a reviewer and
>>>>> an EDK2 contributor taking over from Lazslo in EDK2 community
>>>>
>>>> We need the DEBUG profile to ensure the bios-tables-tests work.
>>>
>>> Can you elaborate on what bios-tables-tests needs this for, and
>>> what coverage we would loose by disabling DEBUG.
>>
>> Maybe it was only required when the tests were developed...
>> I'll defer that question to Igor.
>>
>>> It may well be a better tradeoff to sacrifice part of bios-tables-tests
>>> in favour of shipping more broadly usable images without DEBUG.
>>
>> Why not, if users are aware/happy to use a unsafe image with various
>> unfixed CVEs.
> 
> Note there's nothing special about EDK2 in regard of CVE fixes (or lack
> thereof). The same applies to every other firmware we ship, as well as
> QEMU code itself.

OK, we are good then, thanks.

Phil.

