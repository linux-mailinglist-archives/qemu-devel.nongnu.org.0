Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7E54DE838
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 14:51:11 +0100 (CET)
Received: from localhost ([::1]:55548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVZU5-0005IL-SW
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 09:51:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVZST-0004YK-Jd; Sat, 19 Mar 2022 09:49:31 -0400
Received: from [2a00:1450:4864:20::432] (port=40882
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVZSR-0004Zd-SD; Sat, 19 Mar 2022 09:49:29 -0400
Received: by mail-wr1-x432.google.com with SMTP id d7so15116054wrb.7;
 Sat, 19 Mar 2022 06:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7TeQ1AufWGJ+z0yzP8hFrMlZDsx7qvUHyS9c2S0IFYI=;
 b=ON+ZMaasvHWoNJEp5Y/D1I/gVmfqzz/UXbp1olCnzVjnelItmjXI7d1gJQ0D4W3yqV
 Ztb3ZPgB61Zbr+Iv/3EcAiEckjDc/suLeSHJ4KGa7N2X/0BIwiP56jxjz/uwIqWgxWEU
 fhBPrj510WRTQYA/Kh+mMWDBLcs264KUc59pFbNH1WjOEvkfVDZa9/DDimpT/zAwmmaV
 a8tClrRETsaGWGN/b2+k5YdwZ73Z5eNox1p9dAgr+KE5taTAjnXwkCaCOKEzGXwgTpRM
 9HqQDljlAZtn28s9591I4qh6xt9joB40xU/H1M5fBv4XAdzPHYBFGIrPFbnTmdiTlHpQ
 sccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7TeQ1AufWGJ+z0yzP8hFrMlZDsx7qvUHyS9c2S0IFYI=;
 b=GmD+0/QOogYwsJ4k7U08IWjjR1xbV2Caqhz9roHZl9KbzGmyGLudDfWiUI1C8x0SAy
 xeHDdzuMMlmItziQZVDBL/p7IdOSaka99G9J0J3fpu2A4YiHSjjzPDFXtGRCM7eUwxxt
 1pEw3Ck5D/dTWnT930HUwAQz6SPd2yFmkpSbzprIhqRUAy/toyhus3GZo2fghjRUlDk2
 2ClrHfLzUmhXyaE2RTT3lqVgpeCvk0zjN6qPEdUsSNKh/tyHrQQKPXuhjL0Z2z02Jeug
 jHkh7LFKNpU1IAM3AEKHDdFRv6JWgcuintl35g8oSKCMI6GkNodi4rCWkTYsczsvJF0w
 f8cA==
X-Gm-Message-State: AOAM530Fm0gGE82XHfCigKzyf2F0I2t0/D6rKhfxgdqfnr/8LJ6rx0mZ
 2NYHN/wnM6ZoJePV5OrF4Hw=
X-Google-Smtp-Source: ABdhPJx8Lf+2RgDqrxNUdb3ByA2ku6ZMfTW+VqymiW53rRU2wUtka/yi6zjWHyhBYS+DeCLWj9rpNA==
X-Received: by 2002:adf:e885:0:b0:203:f46f:e19f with SMTP id
 d5-20020adfe885000000b00203f46fe19fmr7402934wrm.449.1647697765914; 
 Sat, 19 Mar 2022 06:49:25 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h16-20020a05600c351000b0038c763e0478sm7279682wmq.3.2022.03.19.06.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Mar 2022 06:49:25 -0700 (PDT)
Message-ID: <42c1f3fa-0cc9-51ff-299e-5ebe1a5f5d32@gmail.com>
Date: Sat, 19 Mar 2022 14:49:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] gitattributes: Cover Objective-C source files
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220317130326.39188-1-philippe.mathieu.daude@gmail.com>
 <62dbdfcf-771e-7c84-ab8b-b02a61112f86@gmail.com>
 <69c6db77-273e-dbeb-e695-e20772d003e2@gmail.com>
 <2ab1e5f9-6a34-6b82-8f43-b7dcf58bc8b1@gmail.com>
 <a37d98d4-5fdf-8a57-af64-eab4daacf49d@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <a37d98d4-5fdf-8a57-af64-eab4daacf49d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/3/22 04:25, Akihiko Odaki wrote:
> On 2022/03/19 1:14, Philippe Mathieu-Daudé wrote:
>>> Commit 29cf16db23 says:
>>>> Since commits 0979ed017f0 ("meson: rename .inc.h files to .h.inc")
>>>> and 139c1837db7 ("meson: rename included C source files to .c.inc")
>>>> 'git-diff --function-context' stopped displaying C function context
>>>> correctly.
>>>
>>> So I suspect Git has some knowledge of common file extensions like 
>>> .c, .h and .m although I couldn't find in the source code of Git.
>>
>> 'git-diff --function-context' doesn't work for me without this change.
> 
> With some debugging, I found Apple's Git distribution actually carries a 
> default gitattributes file which annotates *.m.
> https://github.com/apple-opensource/Git/blob/master/gitattributes

I see, I'm using the Homebrew git. Anyway this change helps non-native
Darwin users to review these .m files.

> However, it does not annotate *.c or *.h. Apparently there is no "c" 
> diff pattern and they are handled with the "default" diff pattern which 
> is actually designed for C. In fact, "c" diff pattern is not present in 
> the documentation:
> https://git-scm.com/docs/gitattributes#_defining_an_external_diff_driver

'cpp' is listed. Maybe 'c' is aliased to it?

> In conclusion, *.m should be listed in gitattributes but *.c.inc and 
> *.h.inc should not be if my understanding is correct.

But then how git-tools can detect .inc are C files? I remember it was
not working (on Linux hosts) without this change.

> Paolo Bonzini, I found you are the author of commit 29cf16db23. Can you 
> test the above conclusion?
> 
> Regards,
> Akihiko Odaki


