Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA583ADA09
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 14:43:13 +0200 (CEST)
Received: from localhost ([::1]:44572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luaJd-0005o8-1W
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 08:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luaIB-00053E-4C
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 08:41:43 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luaI9-0003uv-Cr
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 08:41:42 -0400
Received: by mail-pj1-x102a.google.com with SMTP id g24so7252239pji.4
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 05:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V0jLFL2KIOesAxr8KQFsE4TB7FOqyzLyT0yKXsrihGU=;
 b=SpUJYhTVrqrNzL0dYYWx4HN6HL6L+t1rDp+v5T0p8UXAD509qCptotyZ9k23fYAFUo
 AjbjZtVctY5j2vtUAukLfmXdjDxITzbGjaFpCptEoyU4FdWp9s6wOqkYJYjvoGJepq5/
 YAhpJsxZSytgwatP5qi/J9GQuxZ5dTE33RXztDqHIgciGD+M41tKviyUaNNJquqtuWQi
 KWFKulSBhpOqCmMzs8JNOx7yca6htvNqYG4PGKHxBcCfyhgQ7lCiqSIT4S+Ei97Q8aeM
 85sGCyub6TYduswOYdr1a60vjdibjcdsl/lp4fs75xPQGRdyP+JDzbjPZthlE7+tXhLG
 iPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V0jLFL2KIOesAxr8KQFsE4TB7FOqyzLyT0yKXsrihGU=;
 b=reXUB3TpxJxaxJ2xvkORmkcvheCX4r7GJ3hXNr+V70QTpNkf8GK7PcAfdzb6hHAjFM
 72YQbjptaivm1hGyTGYwEXgWKRcQBYQr4xu4Rl3vTTtjkeUKx2lqPUkYivyjBFqBoB8V
 d3NDPk6hEuURxNE9y03UelTTCefW40Z2Bu8E8oXfM56iR5zW7rJEeV0z3pKrBQOa7oHh
 krvEez4LbW/RLe7WeDMwExwazUD/0+UzTU8iwMATuiE4u9n7IjM9Tv9F+01iXQoX9/r8
 MLFFisVIWxYMhq4dxZn6NYFx8xydOF67O47rPgp7k2lr5ladunk51XbPy1jhzG0LZLof
 JCOQ==
X-Gm-Message-State: AOAM531Xlh/qx6uy47UMsPpJm8axOYfzOYxlNcoa6+hBV/zrK7UWLX7l
 PqvY6RAMRXzLl4ur1CZGP4k/j0Iz5/FrXQ==
X-Google-Smtp-Source: ABdhPJzzuNvBqndwA1mrgwiVNeDz7o88aH1/99d7H3MFoW9RAhBVh2i7B+f88vdTWIb1nGNqp3HzdA==
X-Received: by 2002:a17:90a:4311:: with SMTP id
 q17mr26495338pjg.204.1624106499729; 
 Sat, 19 Jun 2021 05:41:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j3sm10825484pfe.98.2021.06.19.05.41.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 05:41:39 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/mips: Add declarations for generic TCG helpers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210617174907.2904067-1-f4bug@amsat.org>
 <20210617174907.2904067-2-f4bug@amsat.org>
 <a586a9e9-ea77-04da-f1f0-45d79d6eb626@linaro.org>
 <ea1ec188-d011-e8f2-7131-3946bfd6d963@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <79cfc24f-d271-fbf6-33bc-b8c2f1381b5a@linaro.org>
Date: Sat, 19 Jun 2021 05:41:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <ea1ec188-d011-e8f2-7131-3946bfd6d963@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/21 2:26 AM, Philippe Mathieu-Daudé wrote:
>>    It doesn't seem to match the next
>> two patches, which don't create new compilation units.
> 
> Indeed. In a yet-to-be-posted later series they get renamed to .c,
> becoming new units.

Ah, ok.

> What I can do is hold these patches and post them later with the
> yet-to-be-posted series, *but* that breaks the "extract nanomips
> from translate.c" which you already reviewed :/

I don't mind the ordering, just that there's a reason.

> It is hard to split this huge 25k+ spaghetti translate.c :(

I can well imagine.


r~

