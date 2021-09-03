Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C1C400608
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:44:42 +0200 (CEST)
Received: from localhost ([::1]:39456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMF7B-00017d-UZ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEqP-0005om-Lo
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:27:21 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:42656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEqM-00083j-2Z
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:27:21 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso229431wmr.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AvOkOfxkdjDhX5Hr5pmdj5uo1fcSJm4IVvX1hwx97Ao=;
 b=bg+OFO0jqAgHpuoaC0WJbFBZIOk5qGYibVH29fChJgML2kxJWhKF5Jxc7LLSTQPRTg
 26syI9O8VN3Fm59ICWq35/9jBjTtYzjL6cI62D3J0UREhARdJdIFlLS+P2CxzspRuf1h
 JLUrMaFBOh5TAsSu3T8T/zJZ070GAAQ0N6l+g4N681MpHCf+7Ci5Zyn7sENEEF9FCoCY
 biL7rLxIoYJJkISAQ7Fj0YlWWWULMzJMQ0HmocJN1ywsf771paJ6Pgk8nJyRea2+3LTl
 woAih8woFSfHcKgqmE+pI2wqoGmbWaASbrGCZS16i8YkXZR+AMxemau4GbNlT53rJ1AF
 hAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AvOkOfxkdjDhX5Hr5pmdj5uo1fcSJm4IVvX1hwx97Ao=;
 b=rsNRfoRqcnyXKHx85gmGFsI3AqKQQbJtQK8N34Tu86CDygZ2woP4tid32s3RKqL36F
 2HeWlm+faj5tjcbetSXY12F+Ygiw83ya5RddZO+0JeMxYtQAmXGtKr//G6u+o2is8C5T
 QiZt5UsZN6wywfH+qjJA9LRL2giXKeV2LC0ohhY+osoKJXEpoyK7DPnEkCqymYNZYKBJ
 GeFH69qwUnKlz/6x3Dkq2WFJmas/PK5bhHZ6PQz9lQ9HY6GBJOoCMzhXeL2BCynXDYO8
 RfI09sWVnXovD9mJ9DgoP4dEanuIr0KdobVhW4VREr0T9erf9l6QzWVLJJBfMLxC+j9D
 jvdQ==
X-Gm-Message-State: AOAM5330c7crQ8yWIE1Qxcz1+Hla31OMnFizUwji75t80vsb6FO2UCYM
 s7xU6Ecm5s4WCzKklb/y6Vvuqw==
X-Google-Smtp-Source: ABdhPJwDvInXskp2g95n6Qou57qQhZ4Z+Ha1JnhpK+wRIDNvLNkuA6PQ31KSuCxfJ2bn/4YnN2TTIA==
X-Received: by 2002:a1c:7dd0:: with SMTP id y199mr333732wmc.23.1630697236443; 
 Fri, 03 Sep 2021 12:27:16 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id s13sm248122wmc.47.2021.09.03.12.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:27:16 -0700 (PDT)
Subject: Re: [PATCH 24/24] user: Remove cpu_get_pic_interrupt() stubs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-25-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc9cedf2-cc77-bb8a-3097-0c16b6912042@linaro.org>
Date: Fri, 3 Sep 2021 21:27:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-25-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> cpu_get_pic_interrupt() is now unreachable from user-mode,
> delete the unnecessary stubs.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/i386/cpu.h | 2 +-
>   bsd-user/main.c   | 7 -------
>   linux-user/main.c | 7 -------
>   3 files changed, 1 insertion(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

