Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9531A36379F
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 23:00:14 +0200 (CEST)
Received: from localhost ([::1]:35946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYEWb-0001yt-Ls
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 17:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYEUv-0000ur-J7
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:58:29 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:39461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYEUt-00070s-59
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:58:29 -0400
Received: by mail-qv1-xf36.google.com with SMTP id er3so7490652qvb.6
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 13:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jhqUozIDvDehLM+B8cLPQOkkrC3HkT7tiUqrzLjMVw4=;
 b=zQS1ByWevXhcji21uePCoGzV50+o8PHlG2s+vj6pYpBaoONzBxXUG5OODD5VPkZJYM
 OmwN+FJ4NQC5VJ/r4V8kwCw087T+UJF1/BLi5/GziDORJvfSEf5SGciE+rkqlNkcya1j
 5f8bwZbfam7c4V3pqvnSun1ToW7HMiH+Mijeo/bD4d3dBa9j/uyxi8WASwYeSGDaOYGy
 a0gbSQ18jHywg/99N681EVggSjZVJrqYSerAI1QZjr7iqxFQHB9gOm+ZKv7nVXr+qVfr
 De9D90T75ZuzNed59IRhNwF550pIaKLZvOGz/lwSvnjuFv7wFkdVF9SmSIJZGwcgDdN4
 kTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jhqUozIDvDehLM+B8cLPQOkkrC3HkT7tiUqrzLjMVw4=;
 b=PQjCQkP4fszOBs84J43QPkjmguWbnXGUDEPGYWyiWqEmXNSM+tcrHRCwQb0vE0JkW4
 smUH6iaJBBsTIKJDpfIfXPZobPVC01caUvHHqZdf7qADZu6g/cVgtPMzJRShz6an/Ayp
 H8FVZa2P0CRsZRt82RADHVq3fjdxdKH0cWCeFXRiojMwC3AS2+CH04M0W4LfgaeeOiUS
 Mf9rUI9cNo2golfxBmFXHJjBNuvFyFM1gyVMUT1TuhfCGB2wIIl2Eddyhl/SukO40RNl
 HwhDBiUua8UvNxQbyWzs3IaXQaKhCohylGz5SPLz9NhL07r8HzDFwnmrFdW1MXf1wAze
 bxkw==
X-Gm-Message-State: AOAM533/CE2UMw4lvYzMJdS2fYaAL9AY7d+sP63DvLxNpEMyRp31vtps
 eKzFhIPxej/M4kc45I0txuRkWw==
X-Google-Smtp-Source: ABdhPJyZXqLBxCi9RzmlEQbeHcHgdgVafhXiaTnPaYTMMPu6lxgkTrcOg3An9KR+HISrqU6YrXNe0Q==
X-Received: by 2002:a05:6214:a8d:: with SMTP id
 ev13mr18251827qvb.28.1618779506055; 
 Sun, 18 Apr 2021 13:58:26 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id n16sm8228213qtl.48.2021.04.18.13.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 13:58:25 -0700 (PDT)
Subject: Re: [PATCH v4 02/12] target/hexagon: update MAINTAINERS for
 idef-parser
To: Alessandro Di Federico <ale.qemu@rev.ng>, qemu-devel@nongnu.org
References: <20210415163455.3839169-1-ale.qemu@rev.ng>
 <20210415163455.3839169-3-ale.qemu@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8b281352-ce62-e583-00df-3aff6c0ac41f@linaro.org>
Date: Sun, 18 Apr 2021 13:58:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415163455.3839169-3-ale.qemu@rev.ng>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf36.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>, bcain@quicinc.com, babush@rev.ng,
 tsimpson@quicinc.com, nizzo@rev.ng, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 9:34 AM, Alessandro Di Federico wrote:
> From: Alessandro Di Federico<ale@rev.ng>
> 
> Signed-off-by: Alessandro Di Federico<ale@rev.ng>
> ---
>   MAINTAINERS | 8 ++++++++
>   1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

