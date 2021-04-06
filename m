Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761D13550EA
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 12:31:58 +0200 (CEST)
Received: from localhost ([::1]:52684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTj01-0006SD-2G
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 06:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lTixn-0005n0-Cl
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 06:29:40 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:44736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lTixl-00086b-NM
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 06:29:39 -0400
Received: by mail-ed1-x52f.google.com with SMTP id f8so11894895edd.11
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 03:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I9tCGBuVti0ivWDcfaJbd6rrkbdLDLBWgmYFlL0kg8g=;
 b=tuR3B7B21HrdWoXp4LTOoLWAdBLNKhZhnuoGM9W9sZeHZvhcQdAnx6Ie3VfYH6islF
 fqsVSv+vi+sXah5ZuQFqPzOAfCNapHIB7Uy47Mmv6h0AFwIS5U9Ydas0lQc1KUrVxj33
 j/n9F5Mpzb2xsOugLQwHe0YeB2b6/kD+YHg/0cdUeW6vLJVoZLkBn9KTnR293+cMy6JS
 x36GKi0AuFAp0w05JuRS6DjMdHGMg7JVKr9ipO0aYIJWEkT+VJz9VZx7UYtQfAaccF4h
 03YGFg6yuaDassGoaXcCbbfwnzmNeHJVMy62JxICVXXjCfBUJSntA4VIAqhOO+ixt/xj
 xEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I9tCGBuVti0ivWDcfaJbd6rrkbdLDLBWgmYFlL0kg8g=;
 b=k4fOPZYO9vctgFxHvKkBOYUgEgfQotnW4Bgbp4gk6x3PICYfLhBqFBC9Y/WU8altU6
 4ofsCz01l8z3CEEd0UWg7wtPAZIT3EI7XidfElwSwY1BUv7cEfVasDdRY+UH/aWUJRsu
 qwTFbTFhnRMj9BdpXdj3Ehkomms8+AaFfn8wIbvkD1O586SIHMpAolDv0Ja9HQ4uh9+P
 FrzsFO7fPX7Fw92LetrJAaltBZ+hESSwQl6pRcCPpoe1p7e3GuTf0IboO1yF4KKzIQXe
 ZmTQaAco4QvgwU4yDb31aPm6g0ShUYHl4BAYLVBpaP7otNHmf/hWofYktIfQESjaMcQj
 xJTA==
X-Gm-Message-State: AOAM533T2ik67k/VekXdFFZ3yg0g+pkf1duKZnM2jea29NOlEmwFzuhs
 IAK7y0DvKRFCOBwNB2+W2Uc=
X-Google-Smtp-Source: ABdhPJyoptiik1CZ/TVhfWwfJZIjdqa12/ifUIMrEqOOTsuudS0Z8VSMV3pW+h4wcKwJzOK7wzo68Q==
X-Received: by 2002:a50:cdd1:: with SMTP id h17mr36894154edj.178.1617704975884; 
 Tue, 06 Apr 2021 03:29:35 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y7sm5180926edq.88.2021.04.06.03.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 03:29:35 -0700 (PDT)
Subject: Re: [PATCH v2 01/11] tests/tcg: update the defaults for x86 compilers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210401102530.12030-1-alex.bennee@linaro.org>
 <20210401102530.12030-2-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <53e1b231-bc8e-0073-fba5-a61d8f15040b@amsat.org>
Date: Tue, 6 Apr 2021 12:29:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210401102530.12030-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 12:25 PM, Alex Bennée wrote:
> You don't usually notice this is broken on developer system on x86 as
> we use the normal host compiler. However on other systems the -pc was
> extraneous. Also for 32 bit only i686 packages exist now so we should
> use those when available.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/configure.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

