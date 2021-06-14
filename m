Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B843A705A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:26:57 +0200 (CEST)
Received: from localhost ([::1]:58756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lstAe-00082G-RG
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:26:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lst9X-0007IZ-5l
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:25:47 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lst9S-0003wO-5Y
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:25:46 -0400
Received: by mail-wr1-x431.google.com with SMTP id r9so15849422wrz.10
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 13:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qc9VQL3+gZfW50xulqRNrExm7EQDb8YofLNpRHNSSg8=;
 b=kJ3kmEhrcsOUJiahuT9dAnW6mPVcS9QjlyqhKiB9TE0Jp6EzuLpGJR+u2q1Ihp5oDg
 MwicOAzWslsdRTuDHMTOM0OWpBh0vnsSiiOMJb7nx1XeCsz7HYJg2ZMyhDAUakK1u7uM
 GEZRKSUj3bzS4UQjiAiF0V9dBBQ3u38FWmvm2sHzaD/cGlTTeDJqqkqS2/1duJcxAFc7
 W02xHzHbKLc3MMNw8prk8racEYaDnPJwHTlk+oJWhjvpO5W6XGPRb11WP8uTGtYZW2mR
 J5qr6CK0Gdwm57Y1P6jh/I62YMkHJZl8JbtsxPAIRsAfVKvsN3OAoRZq3WvQctw8FVZh
 G9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qc9VQL3+gZfW50xulqRNrExm7EQDb8YofLNpRHNSSg8=;
 b=C8mChQvpiL1uJajfHFneyLVkVbRZyQeYSznJZ8027WpqN18rSkIpS21QqWd+kK4BFC
 XXh4BQDwN5pydrMC8Qbhrdz+Rp0VrcLXCNXEbWkXIaiznwQ+VfU5hXo34j/Zs//EWh/X
 6/rsctqUcw3YKagYrLoUta+YyxW1kg2rS8Crr9OLVFXf7a8LXCItS4lMfVn3cxFxAbVL
 28PEjAXnmOL9TmOrymPNrXzR0e1FfHDuGL+pipew1jviHOuPXr+k4LW6CyxuizwkX4q7
 BPtVLapqzdbm/9NTzEx3omNVUOnARuPxL4v9eW/eXmxuQJv5DflqE3sIrSZ0ICMGLAun
 3rZw==
X-Gm-Message-State: AOAM531loEWWrLghjCxm1R2KeCO05fGSoOBHzx4k0mhHLGPjKn9XQtBI
 ihxEej5siqM3T1+6Ff5SEvk=
X-Google-Smtp-Source: ABdhPJxK88GGn/Pnzqhtl98U88qurcgIaIL63iecXkD6oFnr48elApp1mFOlPW2f11q3S7oNs+ECVw==
X-Received: by 2002:adf:9dd1:: with SMTP id q17mr20533830wre.402.1623702339991; 
 Mon, 14 Jun 2021 13:25:39 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n7sm372812wmq.37.2021.06.14.13.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 13:25:39 -0700 (PDT)
Subject: Re: [RFC] GitLab issue tracker labeling process: arch/target, os, and
 accel labels
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <0a19af15-2f34-4934-c6c9-113e49f5f1f2@redhat.com>
 <d6be9a79-07af-4c46-8fc3-4bd5e01cb63a@amsat.org>
Message-ID: <800db762-b5fc-7009-d805-b36648030bae@amsat.org>
Date: Mon, 14 Jun 2021 22:25:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <d6be9a79-07af-4c46-8fc3-4bd5e01cb63a@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.489,
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
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 8:53 PM, Philippe Mathieu-Daudé wrote:
> On 6/14/21 7:32 PM, John Snow wrote:
>>
>> # OS
>>
>> Currently "os: XXX" for BSD, Linux, Windows, and macOS.
>>
>> https://gitlab.com/qemu-project/qemu/-/labels?subscribed=&search=os%3A
>>
>> Multiple OS labels can be applied to an issue.
>>
>> Originally, we kept this label somewhat vague and have been using it to
>> identify both the host AND guest involved with an issue.
>>
>> Stefan Weil has requested that we refactor this to separate the concerns
>> so that he can identify issues where Windows is the host without wading
>> through numerous reports where Windows is merely the guest. Reasonable
>> request.
>>
>> Shall we split it into "host: XXX" and "guest: XXX" for {BSD, Linux,
>> Windows, macOS}?
> 
> I'm missing the importance of the guest OS. Either it is in pair with
> the host accel, or it is accel:TCG and I see the guest irrelevant

Err I mentioned the nested case, but generally I tend to have the same
view, guest is not very relevant (except for qemu-guest-agent maybe).

> (do we want to list all firmwares?).
> 
> So I'll let other sort this out.

