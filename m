Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D5A185FEC
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Mar 2020 22:11:37 +0100 (CET)
Received: from localhost ([::1]:58878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDaXo-0006ZX-D2
	for lists+qemu-devel@lfdr.de; Sun, 15 Mar 2020 17:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45924)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDaA2-0007Mx-HX
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 16:47:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDaA1-0002VJ-Bb
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 16:47:02 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:46010)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDaA0-0002Nb-Cm
 for qemu-devel@nongnu.org; Sun, 15 Mar 2020 16:47:00 -0400
Received: by mail-pl1-x641.google.com with SMTP id b22so6955925pls.12
 for <qemu-devel@nongnu.org>; Sun, 15 Mar 2020 13:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6Khs/0XZvB9pqQYMEDwzvpGeETU8JRzc3/6wT/zCEJk=;
 b=F8LLSDYokjrvKwG2NQoQYGcetH+fik9pnmkrqUH61GX0Ecp+Gb5MuTDhYkZ161ebLp
 BPuoefzHvR+F0GAnsWcTsEjXYI9SHQ7bbjqKzOWWvsh+m0jDCjXFAqNdg/6sRvxbc9I7
 IEK8ArLybbuVCbeqwIf1e999QdNRDKkzlXKTxhxMmWJjw3jI15NgFZInTA2mDJl2w2vi
 V24ulgs1pjsnUeB6yvfFuczE4ynR5tufpqj1g3NIi2Mi7/PEhW131Oc8O2s/uOwY2bO1
 roi17YX0kEfLTW3hBWopcWI8Vz5kqfQWEXq/nsD12VXWfzqt8ILK6Rh4OX2rvMGFbLfw
 NP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Khs/0XZvB9pqQYMEDwzvpGeETU8JRzc3/6wT/zCEJk=;
 b=tWCiE53GQGerJUTBU8Bb/O6SuQSjllyRDjSldQnqz6hKPJuziDYzXWP2dxFwb7e0ef
 yjxfQBIEuNzSqm/6DprSC30wMHKci9rnqY33hU+9lb0tnV02hpMjwvhHCkMP2FyewfM3
 gVbAHIGrLf2w70TuyGN3Ol8gMqQh9RYMwNm9puxIQswLRW4TJzOzqWjKXIkpOlzyYhtq
 McUynMvrbCbu+eFs5muL7H1PtoVzNOhhHCWyw8nv7HwFKOLTMl1GbB+jpIIQX3Z6/z65
 rXT/1Hm2kkRvnTidw93d31V6RA9V36LJ0iZfBvxeMuv8RUChbZIXKxqf5BH5nIwyflUl
 qg6g==
X-Gm-Message-State: ANhLgQ0FGY5p8SYpFUfllqN8YN/HFSShCC0g2FOr4S/0OmAI68nn/cNf
 JQaw9Xptx1QyXVMc0DlpLktE4g==
X-Google-Smtp-Source: ADFU+vuJfz8Bo0sTahw3ewMurLHkMeVZW8PiA9ut4lbIj02rxUkZbRcyZ1v29XaQvf4kU30AvZePRQ==
X-Received: by 2002:a17:90b:288:: with SMTP id
 az8mr19863626pjb.25.1584305217951; 
 Sun, 15 Mar 2020 13:46:57 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 b189sm8661705pfa.209.2020.03.15.13.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Mar 2020 13:46:57 -0700 (PDT)
Subject: Re: [PATCH 13/14] target/s390x: Restrict CpuClass::get_crash_info()
 to system-mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-14-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <71ef67f7-3b14-8769-868c-ae339b84e364@linaro.org>
Date: Sun, 15 Mar 2020 13:46:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-14-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/s390x/cpu.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


