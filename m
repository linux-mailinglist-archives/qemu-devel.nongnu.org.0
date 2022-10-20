Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D022660558A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 04:34:27 +0200 (CEST)
Received: from localhost ([::1]:44970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olLO6-0008V3-Kj
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 22:34:26 -0400
Received: from [::1] (port=57288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olLNT-0007Uc-By
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 22:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLLw-0006Xg-4C
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 22:32:12 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLLu-0007wh-K5
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 22:32:11 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 o17-20020a17090aac1100b0020d98b0c0f4so1977841pjq.4
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 19:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VVZNcdi8Ic58NmYJH2SSpJdqGpQhU7RTjcGm4F78T90=;
 b=U1J76cTwcrChr5OgG67V+Xcst0uKJtnzdA769AUQbqw1RM31XTQVQcIdrqlpjc99bi
 LZrgXqiud/dd52pXWvLjWEKS03q34OqCaQ4K484VF6paWb4uF40vmCRbji3POCWAdhQ+
 rTDWdaRKJtA1lFqr4kYQ9Ysy2wec53VlHezigOV1Tmz2ORLLrz3v195D8207v7P1fOyG
 hq00q9flhC12j27+J+1/nevt4V3vAKNbjbIhsCYHjqM+njwcgOZWZ9lC48ZyTtPF/8Zo
 lpEshA74bvyXurg9pWYTImKKNu9IRGbGkZAoK2XY5rdsDYf67N9pkm7weTmaM/5uXnSi
 FCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VVZNcdi8Ic58NmYJH2SSpJdqGpQhU7RTjcGm4F78T90=;
 b=q4TaZzXJOYsAqD1DxLjJ2MZ8BvDhPGFbY8YaB9os6A0xxnE0L6aXBlR/mvKPRCmh7r
 x5VVSaYYhhgrcHiqAtCCnYRzjSRcZGiTr5LPyCzjUJ/3AJIXVdspNHyAXtDCyN6c8Bz4
 +l3b8Z3lI2JZT5J0/jyDqmJp14hEKi2opHeMa5xRw0wPrhSixs8JWoJkNEN0KHP8nw6B
 Q9ZgUpg0BG1pEmqM6HI+IILA0+enCVf5wZSNtTX8QrKP3zfxTNLYzhIu5pkjzOmcAZoF
 EkXwEmWzo/DWqjhFG0qjBO4JOw3+boOvN6MUWZOPOkM4KxOO7cHBYTCPshcj29YkU1d3
 NzXA==
X-Gm-Message-State: ACrzQf3tb0+hsfqBkVdOm6v6BCLdZe3qhgOjaxyV/XDYF44cr2pyl4L+
 y7qjqGUkJtm+JWtYZtsEKR7p/A==
X-Google-Smtp-Source: AMsMyM5p49NsYf3aNZg42l5Np8050+iDnv7o0N4vdRu3BhzLic/vPz6q3WqM8rFhanQ6K5gj2sSHww==
X-Received: by 2002:a17:90b:4f4e:b0:20d:9f5b:abbf with SMTP id
 pj14-20020a17090b4f4e00b0020d9f5babbfmr13729849pjb.148.1666233128113; 
 Wed, 19 Oct 2022 19:32:08 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a62a203000000b0053e38ac0ff4sm11990613pff.115.2022.10.19.19.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 19:32:07 -0700 (PDT)
Message-ID: <417905fd-a2a4-25f8-31fe-fabaf3e809a3@linaro.org>
Date: Thu, 20 Oct 2022 12:31:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 3/4] target/i386: implement F16C instructions
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221019150616.929463-1-pbonzini@redhat.com>
 <20221019150616.929463-4-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221019150616.929463-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/22 01:06, Paolo Bonzini wrote:
> F16C only consists of two instructions, which are a bit peculiar
> nevertheless.
> 
> First, they access only the low half of an YMM or XMM register for the
> packed-half operand; the exact size still depends on the VEX.L flag.
> This is similar to the existing avx_movx flag, but not exactly because
> avx_movx is hardcoded to affect operand 2.  To this end I added a "ph"
> format name; it's possible to reuse this approach for the VPMOVSX and
> VPMOVZX instructions, though that would also require adding two more
> formats for the low-quarter and low-eighth of an operand.
> 
> Second, VCVTPS2PH is somewhat weird because it*stores*  the result of
> the instruction into memory rather than loading it.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/cpu.c                |  5 ++---
>   target/i386/cpu.h                |  3 +++
>   target/i386/ops_sse.h            | 29 +++++++++++++++++++++++++++++
>   target/i386/ops_sse_header.h     |  6 ++++++
>   target/i386/tcg/decode-new.c.inc |  8 ++++++++
>   target/i386/tcg/decode-new.h     |  2 ++
>   target/i386/tcg/emit.c.inc       | 17 ++++++++++++++++-
>   tests/tcg/i386/test-avx.c        | 17 +++++++++++++++++
>   tests/tcg/i386/test-avx.py       |  8 ++++++--
>   9 files changed, 89 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

