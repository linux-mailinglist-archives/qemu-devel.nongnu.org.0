Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EA92E9C37
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 18:42:18 +0100 (CET)
Received: from localhost ([::1]:60144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwTs1-0001Sm-F1
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 12:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwTpq-0008SH-SO
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:40:02 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:42428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwTpn-0006nC-Cy
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 12:40:00 -0500
Received: by mail-wr1-x42f.google.com with SMTP id m5so32969217wrx.9
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 09:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CHIrG2Y4Wk6kf4rG1Pzxpns/cY4r5tBOfZv8eyAsXqE=;
 b=oW6jjhDAazFtlvsCJHbsRVmLbMUEvRZ6++qR91EQ35a2oeRb9yZB2bu06+Gbjegk1y
 4TcxxjOFZV8fHhu/xgj0T20yI+WiyL0sHxtGwYGpyjSNy561ZeRVtc0tvia/s3pXPxAY
 s0GnWmy3tGuHCJrqVxctiRtMgN65jVTwHjRnlPBzEQJq5ZJ55oE29jyLVHGODTrh0v5J
 3vhPAtdS11gbmNaPK2nBzcooRmpkrl0paez0/VhUqSj3ERQqj73my3XlfEZePRPMwb96
 jQ0P1fnQrnUkI9xeRu87c8IswB6j1bov6iixDOvsrktX18hNzT2RnJRuA1Fz6tU5vx1M
 +e9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CHIrG2Y4Wk6kf4rG1Pzxpns/cY4r5tBOfZv8eyAsXqE=;
 b=Wo7JRoUOfef1YT++whIqX3wSpF6otTlIXd5GmgQutzKJwuxvKA/pOTuMvA2zaqRasn
 UZTCBseJzJOzYfW4VVROPEyA9f90rwuKbY4BO1FNkWnUDEX164XKhLYliiM0T8HKAsBz
 KiIgPeECPQ5cbkJ7EQN/qb4ujaU0vHSAoxiDiD6naaQG49q4ZaUn2bpWQSonHJXUmAnE
 3KVGgTAXMHjLBsRb4eZqrKIFGjA9umv/StLBxL8jbIV0APY5nI0nrzKYrtoCWFJIuLX9
 QJ/Tv57uRzf1O2T29tthkbLNoesxjkTZ8CrLnGxcT/hoaKM4v0tNe0Bxx9ZQYCm9USJK
 owRw==
X-Gm-Message-State: AOAM532HiUWtIJLyLhqz3ocgVBikY1F2GWoObGm7uFacFqcIknyfMiCl
 f5xpVnWYrM3XCk4MqyVUTbw=
X-Google-Smtp-Source: ABdhPJyDO7Jf0Qz2jHm5jrtRDU0sR6qKbm40L1Q/Wk3/nQmw+0PZRh//XTbP+nVPY4Dki2e8yVkTSQ==
X-Received: by 2002:a5d:5387:: with SMTP id d7mr79445089wrv.417.1609781997764; 
 Mon, 04 Jan 2021 09:39:57 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id m17sm99738583wrn.0.2021.01.04.09.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 09:39:56 -0800 (PST)
Subject: Re: [PULL 00/35] MIPS patches for 2021-01-03
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
 <CAFEAcA--dkcqBJr=b1LcNpLtctYJewuT8Yvx9Uo47YC6JGgR-Q@mail.gmail.com>
 <CAFEAcA-HXHrXwGywi0MkxFhCCW3fk91Xr4yHA1--tiSqN2_HWQ@mail.gmail.com>
 <790b031a-2be6-82d0-565d-f7595e95c077@amsat.org>
 <CAAdtpL53Ngj3zc0ZtxEvHed0hAxYN0RZ7G2eiL_izuTSWBMM2A@mail.gmail.com>
 <CAFEAcA-mTCyahsvVaD3PsOA4P8erDXmbLJCDtWaUFFoFiR4r=Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <47b22eb2-8600-b34f-371f-517804b9cb49@amsat.org>
Date: Mon, 4 Jan 2021 18:39:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-mTCyahsvVaD3PsOA4P8erDXmbLJCDtWaUFFoFiR4r=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/21 4:01 PM, Peter Maydell wrote:
> On Mon, 4 Jan 2021 at 13:59, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> I don't have access to OSX host. I'll see to install an aarch32 chroot and
>> keep testing (not sure what can differ from an i386 guest).
>> If I can't find anything I'll resend the same series without the Loongson-3
>> machine, which is the single part adding QOM objects.
> 
> You might also try using valgrind/address-sanitizer/etc, which can
> sometimes flag up this kind of bug on x86-64 even if by default
> it happens to work.

On 32-bit I hit https://github.com/google/sanitizers/issues/954:

$ qemu-system-mips64el
AddressSanitizer:DEADLYSIGNAL
=================================================================
==18063==ERROR: AddressSanitizer: SEGV on unknown address 0xb7f20e40 (pc
0xb7f20e54 bp 0xbf86556c sp 0xbf86552c T16777215)
==18063==The signal is caused by a WRITE memory access.
    #0 0xb7f20e53  (/lib/ld-linux.so.2+0x11e53)
    #1 0xeb9b59  (/tmp/build/qemu-system-mips64el+0xa86b59)
    #2 0xe9c1c2  (/tmp/build/qemu-system-mips64el+0xa691c2)
    #3 0xb7f1e8ea  (/lib/ld-linux.so.2+0xf8ea)
    #4 0xb7f0fcb9  (/lib/ld-linux.so.2+0xcb9)

AddressSanitizer can not provide additional info.
SUMMARY: AddressSanitizer: SEGV (/lib/ld-linux.so.2+0x11e53)
==18063==ABORTING

What is funny is Aurelien is mentioned in the GCC BZ =)
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=84761

What libc do you use?

I'll try to downgrade or reinstall an old distrib...

