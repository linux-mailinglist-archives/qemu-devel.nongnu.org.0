Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255F4352DDB
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 18:42:30 +0200 (CEST)
Received: from localhost ([::1]:52644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSMsP-00016l-85
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 12:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMrH-0000CS-7r
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 12:41:19 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMrE-0008Sr-6B
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 12:41:18 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so4843392pjh.1
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 09:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kF+2n82M+2ysf197zUQWTPXBwzAsUm/B5bc92ciWheE=;
 b=NFz6X7ojtn942AghJg8cn+KHXLIZufTtVRoaHps8+gBbVS8i10s2QlW5yhZ2xabSYq
 M8CvSelx5a1buVYgUC6j+/drM+hCeNwtcV/j/i6mJourqnSx6dbkKdDwpwxY+qcO+x/t
 sDxiynWgbuOgoq8LXrW9bZD99eAOSTXZvan4SZkHI+tLbnPfsuNNjqWwGYzHxaHZpnyg
 X00qPZyK+YcErENQ6i7zEzNZz4D/P25WyR5zOkqm0uK6+SE3KtNiwSf0/57IenorpoD4
 fgGr8rINJxMP6HTLt0AVa6X7Vsedxs4f3QgNMsEopPKt3L4b7H6XHAE9AfWzqQRDn2dL
 88cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kF+2n82M+2ysf197zUQWTPXBwzAsUm/B5bc92ciWheE=;
 b=oK5TW5UMPpIzF6nhwPoTOVeR3hTF+tkN0wGjcLMO7mIvhwGmrSIVchK6ESiRS86qlq
 naNyzXT41+g+wM98Z9xeTLOGzLh9sb5rcvLUOeVvqoUBI/JWmJu3/4Cz3i33jxC8f8lH
 DPjxo/hsOhwIJaCu/lMMJuE+VxwxpC0Wf57ymonkU9i8S7jVfhYu45gM69G8BbFP7865
 F1WT9k+1erdtf8k7Y83gu4Yr/aUhiWH6QEI2ZSkQCs77AecLdlG8H/mjVGSKwWB0QYBO
 y0jgSL5R83GOfiuMHlXPm5gX0Vh2CcmzDOleLqT70oFDb0wiRaAEhdC6l7am662tw6jd
 AN/g==
X-Gm-Message-State: AOAM533iC9M0QBMAhfy91799drSd8E4VYAu0nDB2Tf/1HphcZv9nlrYv
 nJC03oUv1FOh2GgwBggm0hpvAg==
X-Google-Smtp-Source: ABdhPJxL/PCnWZZHH1c37+SYV2Nkv0wc3Ou9C+mqjle8X2SBjPDAa5rV22DVg129QJYx1MMqJgwK2g==
X-Received: by 2002:a17:90b:1216:: with SMTP id
 gl22mr14655934pjb.99.1617381674497; 
 Fri, 02 Apr 2021 09:41:14 -0700 (PDT)
Received: from [192.168.81.184]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id b19sm8312120pfo.7.2021.04.02.09.41.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 09:41:13 -0700 (PDT)
Subject: Re: [PATCH v2 07/11] tests/tcg: relax the next step precision of the
 gdb sha1 test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210401102530.12030-1-alex.bennee@linaro.org>
 <20210401102530.12030-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de4fa9a0-8951-14fa-d2c4-fa0df2fbf8f8@linaro.org>
Date: Fri, 2 Apr 2021 09:41:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210401102530.12030-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 3:25 AM, Alex Bennée wrote:
>       check_break("SHA1Init")
>   
> -    # check step and inspect values
> +    # Check step and inspect values. We do a double next after the
> +    # breakpoint as depending on the version of gdb we may step the
> +    # preamble and not the first actual line of source.
> +    gdb.execute("next")
>       gdb.execute("next")
>       val_ctx = gdb.parse_and_eval("context->state[0]")
>       exp_ctx = 0x67452301

This double next seems just as fragile.  Why don't you just set the breakpoint 
where you want, which appears to be sha1.c:138?


r~

