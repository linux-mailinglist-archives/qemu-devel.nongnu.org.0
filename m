Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A49A66BC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 12:47:41 +0200 (CEST)
Received: from localhost ([::1]:43844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i56Lc-00024D-IH
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 06:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46341)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i56K5-0001IC-0v
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 06:46:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i56K1-0002vm-Cj
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 06:46:03 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:38109)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i56Jx-0002mM-Bs
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 06:45:58 -0400
Received: by mail-wr1-x444.google.com with SMTP id l11so8106579wrx.5
 for <qemu-devel@nongnu.org>; Tue, 03 Sep 2019 03:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=TxEK4d6CXPTC5utNHZ5o7KOuvZfi4VTgUaZ/QgrhkFE=;
 b=dOAKmbToHmuCDzCUNWrS0Ld1rsm68KNqwTtN5E7h51QogunCeorNO7xtJ+Q6Pf+/SB
 g0BCotvhcizsweVBOZ+lPxC+q/WGprOtSXQ1fIfHVbGxio39IOJ8PdbakdrQd2O4rGpS
 3SZ8FTj5IJrSJk47Fmc9igiakk7hnmD9l1oN/GeW18Divduk42/TJSwydtiLhdMc3eV2
 0tfckLA8rrWQ0yGhwFa3FKeYruRDHidOBNirE4JIKhgH2LryqRCIk8L46RxpT8ydEbtj
 M32sQma5XC+SoemxvvbT6xVV5sYYVJz5rBzm25TjiPf0hT+SZi4nilsA3nLtkMrwKj9Y
 CHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=TxEK4d6CXPTC5utNHZ5o7KOuvZfi4VTgUaZ/QgrhkFE=;
 b=JOBicDRxcPZ1zISECkTBzI83lqTQ1lTZGGxSX7aH4HSxAVesD9PV2/T/EdnWS/aX0L
 WRTpgloR3rD6s1v/XKNDHnO2e6rY1UFZZFdNUkkbWgigaq5WQUyQMGxsc1RxHQ/SH96a
 voQVuU7bYx7/Hbpplmw5dv+3+tMlHXaQvZ3ffc+3PjoYt6QAhl/NRP1YGom5VDS89FxX
 lnPQj2uXDvNw7+j5LwUfQTvOIPHXvHRUxbYMg3R5saCgUws5P48Adk6uRNVAHClMThHL
 tBKdK3GEmYl01jo5ylYtq+oxqZmreDx9QjKIdhttp//bRSN7WhYpwjDYGjZ4Ups41K3v
 9HDQ==
X-Gm-Message-State: APjAAAXZoQ/UMQBhFiHG9z51goDwGqIONvpWkK8dgMi8+DzqCF3xQ+QB
 AF+4srkDsS6+AjMLu8vRP99UZQ==
X-Google-Smtp-Source: APXvYqxuL/Dv3rWBrjloq3WondR8A/bHVwqgRYS41m3WNwlBrK/dzbSNVy6RXwmS3qobWx782iXJfg==
X-Received: by 2002:a5d:6ac8:: with SMTP id u8mr6057173wrw.104.1567507546043; 
 Tue, 03 Sep 2019 03:45:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b136sm30608605wme.18.2019.09.03.03.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 03:45:45 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B5EF51FF87;
 Tue,  3 Sep 2019 11:45:44 +0100 (BST)
References: <20190828165307.18321-1-alex.bennee@linaro.org>
 <CAFEAcA9zTL2Cn7dpibW9aVk7ev3XPPtF00YUL09uZbhm2X6-2g@mail.gmail.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
In-reply-to: <CAFEAcA9zTL2Cn7dpibW9aVk7ev3XPPtF00YUL09uZbhm2X6-2g@mail.gmail.com>
Date: Tue, 03 Sep 2019 11:45:44 +0100
Message-ID: <87h85t7j53.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: Re: [Qemu-devel] [PATCH v1 0/9] arm semih-hosting cleanups and
 other misc cleanups
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


Peter Maydell <peter.maydell@linaro.org> writes:

> On Wed, 28 Aug 2019 at 18:08, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Hi Peter,
>>
>> Here are the ARM semi-hosting cleanup patches and a small selection of
>> miscellaneous TCG clean-ups. If your happy taking them all through
>> your tree please do otherwise I'll poke Richard. I'm just trying to
>> reduce the delta for my next iteration of the plugin series.
>>
>> The following patches need review
>>    04 - target arm remove run time semihosting checks
>>    05 - includes remove stale smp max _cpus externs
>>
>> The first is the result of review comments, moving CONFIG_TCG ifdefs
>> around and the second is pretty trivial.
>>
>> Alex Benn=C3=A9e (7):
>>   target/arm: handle M-profile semihosting at translate time
>>   target/arm: handle A-profile T32 semihosting at translate time
>>   target/arm: handle A-profile A32 semihosting at translate time
>
> On closer testing, this patch breaks the semihosting test suite:
>
> $ /home/petmay01/linaro/qemu-from-laptop/qemu/build/arm-clang//arm-linux-=
user/qemu-arm
>  usertest-a32
> hello world via semi_write0
> qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> Segmentation fault (core dumped)

That must of broken on re-base, I'll re-spin and fix.

>
> so I'm unqueueing the first 4 patches (but have kept the
> misc unrelated other fixes).
>
> thanks
> -- PMM


--
Alex Benn=C3=A9e

