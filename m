Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D040A38F24A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 19:32:36 +0200 (CEST)
Received: from localhost ([::1]:35376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llERP-0004Ob-89
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 13:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llEJ4-0007af-FX
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:24:01 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:34600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llEJ2-0004DI-J1
 for qemu-devel@nongnu.org; Mon, 24 May 2021 13:23:58 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso296351pjx.1
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 10:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xYNto123shrI6MBfBi6sw6BwSomKGWr9ASfLgaAaU20=;
 b=ddlNb0uhjDx1SRBPM+hZWE4VuchQhiNT93LH9+ybQ8tdgVELjnD7gPsiJ2JtQEKCwY
 SmvrrTJ0oB7NIgnAKIxSy+TUILc8t/b26aDpjNFPEQXsLdFSzo+qVjByzShSTl7e0woW
 ecTfsFciac2XdyHYlCVYZkF9hSd8DPZctP2yr/1Wjz9VPyzUEtVGrwofZe82n9NKrfs4
 p33cOn9SohV5L+naasXxrzYIRse/xHUiETZc7G00+F+WPfUHPRi9kvNQoGZ05+P6X43W
 uWvh4cQph8TluTfDeBc+Woe+Un0vd8DcGP5efGJuVwVoYeOvcBKbW3qPoZs6Jg8ewwyf
 A0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xYNto123shrI6MBfBi6sw6BwSomKGWr9ASfLgaAaU20=;
 b=han2odCWWpLo8Ig75fIH+LWWriKfaZldsHsV3j92Q5OVlhOl7T3fZ2AChPQQko7Goj
 wmWplbX1WJNg97LcwVvqVuqXw4qMdcPrYNt8rAA1+b1jh9fqwp7eOCuJ7b2/l2lwPYrf
 k1dIF2014d0MR4qaQV2gL+97yVOtK53NTzimXQh8erafhqRAIL408ejNqix7JlaAb8CC
 paaTxEFC02E1+rld/QYrp7I/l7yRJKidDkjVdRwMqh5gBa5OlW+Wf1DBmEFjefmnIwEf
 brc4LUIsCt3ZCmBucjrqGXITQhjSm2cgtrhb64bn/+Diluf8HvJ+3IqWwoHZlbVLXoDs
 hj2g==
X-Gm-Message-State: AOAM532YwAbvmvXYc0o50sYNGaFyucBz3/QBkZm5hnOBQ+E2Vuta3VL1
 AFLC+p5JnXoc0sWxQ1FXx7W/2w==
X-Google-Smtp-Source: ABdhPJzSaixahj7yh9UEPldAcOMAHcW3qofD0Ks7LHETGW4xNYRKXjSFUY5Qh+rZNT4Pa/aR9bI2xw==
X-Received: by 2002:a17:90b:23ca:: with SMTP id
 md10mr236418pjb.122.1621877034884; 
 Mon, 24 May 2021 10:23:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 w125sm11441617pfw.214.2021.05.24.10.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 10:23:54 -0700 (PDT)
Subject: Re: [PATCH 0/2] accel/tcg: Reduce headers inclusion
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210524170453.3791436-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <98019938-c58d-578a-b6fd-52aac3a15202@linaro.org>
Date: Mon, 24 May 2021 10:23:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210524170453.3791436-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/21 10:04 AM, Philippe Mathieu-Daudé wrote:
> Trivial series, restricting accel/tcg/ specific headers to TCG.
> 
> Philippe Mathieu-Daudé (2):
>    accel/tcg: Reduce 'exec/tb-context.h' inclusion
>    accel/tcg: Keep TranslationBlock headers local to TCG
> 
>   {include/exec => accel/tcg}/tb-context.h | 0
>   {include/exec => accel/tcg}/tb-hash.h    | 0
>   {include/exec => accel/tcg}/tb-lookup.h  | 2 +-
>   include/exec/exec-all.h                  | 1 -
>   include/tcg/tcg.h                        | 1 -
>   accel/tcg/cpu-exec.c                     | 5 +++--
>   accel/tcg/cputlb.c                       | 2 +-
>   accel/tcg/tcg-runtime.c                  | 2 +-
>   accel/tcg/translate-all.c                | 3 ++-
>   MAINTAINERS                              | 1 -
>   10 files changed, 8 insertions(+), 9 deletions(-)
>   rename {include/exec => accel/tcg}/tb-context.h (100%)
>   rename {include/exec => accel/tcg}/tb-hash.h (100%)
>   rename {include/exec => accel/tcg}/tb-lookup.h (98%)

Thanks, queued to tcg-next.

r~


