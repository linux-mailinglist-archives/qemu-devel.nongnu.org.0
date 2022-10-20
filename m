Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE36160558C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 04:39:16 +0200 (CEST)
Received: from localhost ([::1]:37756 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olLSl-0006TT-Oo
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 22:39:15 -0400
Received: from [::1] (port=33550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olLN7-0006vu-W0
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 22:33:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLLf-0006VU-TT
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 22:31:55 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:41479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olLLe-0007uj-CO
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 22:31:55 -0400
Received: by mail-pg1-x533.google.com with SMTP id q71so1096626pgq.8
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 19:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xqoHto5mgnLWsRko24NOX8dPxbah7bqloFdC8ZePCps=;
 b=Q/kwQIAU59194pOrohQftci/9dVJk1PjHD9dRk6Ne/zBXe1KKBGWgK3kpSleHK8+bI
 58zdkr/h1rjooBdeYnRn3Pjwg3oAvhk03FF79BG1v6HK20PZpc5VdNZfDULNRZmWHxk1
 TQW3sdAXZY2NMNm09QyjEwNwEbz1zWSh6Fz80o6QxKP6wezY9yVAk/EeVdm8ZA+7HUNA
 Sx3GRgJILVLtoj3EZg2Ft3MCmqgVzrq6VvvWHj+k7cAQf9NFXamwbDbfjk01H/xQkMbp
 q94Jz0tx8IzhQjn4XwgbOjeQ0o5jTkxbiHCXufIt8GnkTWX8bex4+B9g/aA90CRlg2/x
 Ez2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xqoHto5mgnLWsRko24NOX8dPxbah7bqloFdC8ZePCps=;
 b=uhNYV3FGJb4DcJTLZL3xskp2M/b4HQrG+gKnm+aAjMnkT5Fze4HmA83RtJCMkhvyWF
 1gLPPYFqzHuIvgT+0aYf673BmVYqRGZ9M/Ni6Q0EsoFwV1IS4y/QEpMwcTU7Esm1Kzvu
 ooXTNfpPTmQzk2JaeborKfvIZ2kNRXN4xc2Ar9yu5XTdgN03a9Q/FlejeYA1oNUO8I0G
 PLFqY0nvCFEBaMkgRulhxwE4aCy9fOz7tSYYqlLpbC30aQrCTvcJA1QBAB2Mu5Lf9v/a
 wsudWmyyXnuyETNFTU134j2FhppxDUJCjxCL8GvRDBK9cWy8d/Gz1g0VogHCuyOlSbEC
 0X9Q==
X-Gm-Message-State: ACrzQf1xHGZK/HMx0EBwkqsxW7YKIMoAM0+6NDMtwBEJWKoxkJSBBMVs
 HP+qUjqUj9J39V0gXWttyGrNcg==
X-Google-Smtp-Source: AMsMyM5q6YYvwXQP6SnvYQz9DSKce9gI0FWjufMTJYsbLr7nAbRo3Zu3tl2NbN0/Zpnp0zNXXVrntQ==
X-Received: by 2002:a05:6a00:a04:b0:534:d8a6:40ce with SMTP id
 p4-20020a056a000a0400b00534d8a640cemr11943930pfh.15.1666233112657; 
 Wed, 19 Oct 2022 19:31:52 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a170902e88a00b0015e8d4eb26esm11538088plg.184.2022.10.19.19.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 19:31:52 -0700 (PDT)
Message-ID: <f1d75712-c25c-fc6e-2ffb-d6e74c36394b@linaro.org>
Date: Thu, 20 Oct 2022 12:21:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/4] target/i386: decode-new: avoid out-of-bounds access
 to xmm_regs[-1]
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221019150616.929463-1-pbonzini@redhat.com>
 <20221019150616.929463-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221019150616.929463-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
> If the destination is a memory register, op->n is -1.  Going through
> tcg_gen_gvec_dup_imm path is both useless (the value has been stored
> by the gen_* function already) and wrong because of the out-of-bounds
> access.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   target/i386/tcg/emit.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


