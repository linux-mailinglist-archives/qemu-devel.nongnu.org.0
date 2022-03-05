Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0274CE1BD
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 01:51:15 +0100 (CET)
Received: from localhost ([::1]:36266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQIde-0007Dx-1d
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 19:51:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQIbZ-00066L-Q0; Fri, 04 Mar 2022 19:49:05 -0500
Received: from [2607:f8b0:4864:20::1036] (port=40638
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQIbX-0008Ux-Jb; Fri, 04 Mar 2022 19:49:04 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 mv5-20020a17090b198500b001bf2a039831so2579323pjb.5; 
 Fri, 04 Mar 2022 16:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=g2NEExCeK5GU8hez5cuCyGGVOd/BrQp9pumsNVQYpZc=;
 b=BIAQtc54oxrH6Wo3FoDw2ln9oRnx0yUMyFFfFVrgRFYoSkitocKf0gTY01U8Sb9Gew
 bqhv35qfPPPX8s9ghwlB/XKYdwVC4i11H3mT4zV0gnqCN8JmJdeYGctesGOgOcqlNu0d
 YVMzOX6h1xe+P+7mBJUCmswp8+WZSZhHEUqDHpy9rC+U5t9Na4b3fDOjKy7cP2NID3h+
 1N0Vje+KYkFxgU+8gyunxUuN3mC2eDhyTMc2JY+xFhrQpFxCYdsX643ligZhV0W3nLQL
 HPwpQe8bXn6xpkc0t+L1rg5+fRBK6INUCO8ugaa7RpR/13/yEs4p+ujIkL5+k7R+Kn/J
 auNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g2NEExCeK5GU8hez5cuCyGGVOd/BrQp9pumsNVQYpZc=;
 b=mNLJ0jFRlCC5oRQrd7lBvWtphZjbQBNUd/DssUpRQ0DT84+daHKCsAlq4fx5MrzjYb
 kLdckrYuLaEKHecJLHHPt1bZ7HIfiNBUEZMFHhvadlowJgkHbpQgRaKb9W+BwCIRrm5o
 uplpuXHjZq5MY1ilg0+EIjuv7v/B94B4UEqpR+Z3xCgPjkPaK0aEFTwvQaMey77eYDVp
 GbTYPILNZm4opu9+OQWaSIje/WnTF8ZPzUG9Q0c/7g9simp+05EZaPKA8PTDII4/0eTR
 4lpKPQo6FLpdPLZHmMYK0/RZQB6C+M+WB0iKY9fU2XnyLDJkGwf3od9oPQN82P5sRwHm
 T84Q==
X-Gm-Message-State: AOAM531jlx4MVeHJ1lktbWIBDc7UFTt0AELsvDyaec0ca0C6hqQKExbq
 Dko5S+VqqYjs94WCtypuZnk=
X-Google-Smtp-Source: ABdhPJzuBkDcy8e1iSExTZKWlESrZmgPc33ZGG+JmihZWHXfmEikuQfqmmyRpUDXbznELZAcZIJr+A==
X-Received: by 2002:a17:902:bc89:b0:151:accf:afad with SMTP id
 bb9-20020a170902bc8900b00151accfafadmr1051259plb.169.1646441341633; 
 Fri, 04 Mar 2022 16:49:01 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm7232251pfj.43.2022.03.04.16.48.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 16:49:01 -0800 (PST)
Message-ID: <921b5f06-75f3-2500-68cb-f091761eeb72@gmail.com>
Date: Sat, 5 Mar 2022 01:48:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 5/9] meson.build: Don't misdetect posix_memalign() on
 Windows
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220304112126.2261039-1-peter.maydell@linaro.org>
 <20220304112126.2261039-6-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220304112126.2261039-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/3/22 12:21, Peter Maydell wrote:
> Currently we incorrectly think that posix_memalign() exists on
> Windows.  This is because of a combination of:
> 
>   * the msys2/mingw toolchain/libc claim to have a
>     __builtin_posix_memalign when there isn't a builtin of that name
>   * meson will assume that if you have a __builtin_foo that
>     counts for has_function('foo')
> 
> Specifying a specific include file via prefix: causes meson to not
> treat builtins as sufficient and actually look for the function
> itself; see this meson pull request which added that as the official
> way to get the right answer:
>    https://github.com/mesonbuild/meson/pull/1150

Interesting, TIL.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Currently this misdectection doesn't cause problems because we only
> use CONFIG_POSIX_MEMALIGN in oslib-posix.c; however that will change
> in a following commit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-id: 20220226180723.1706285-6-peter.maydell@linaro.org
> ---
>   meson.build | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

