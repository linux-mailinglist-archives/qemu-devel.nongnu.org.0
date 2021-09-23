Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746424171F6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 14:35:59 +0200 (CEST)
Received: from localhost ([::1]:47654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTkQn-0000xM-W2
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 08:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsU-00070K-Uv
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:30 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:39510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTjsR-0003IS-1L
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 08:00:30 -0400
Received: by mail-qt1-x82c.google.com with SMTP id j13so9137090qtq.6
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 05:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JE/Nt1L5Emdrqq9XEAvck3yBpb96zTA0rhWrOF/s+8Q=;
 b=fwf/RM0/HfM6VlDcKdG640EcyJorYN8344GuuKrjaDw2ACQwsswcbwNt1cBzyN2gBY
 12lKxVkXZzSCLCl4j3q1RtodA+Ud7enVYp59GW3EXiA8X9MZlIhd69DPIbsbiF9OMOy6
 jN9YV/f/a9DVDrlIlvj0OzbSgWW2fzsdIHTHp9s/seXVV6nZc5wIuuN8/ZXqEI8H/klb
 wq7tCBfIIJJuIP5Tt4xaC/A/EdYeDreNMYWFvP1OMIUJUCFhkoKo6risoPUhBMrz3VLA
 tKQtxw1K5TDo/stNK06+RIUUV+HtveBRNEeymozwrsIGrn3vm2UmpnpEpTu2bd8/KUDY
 zlig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JE/Nt1L5Emdrqq9XEAvck3yBpb96zTA0rhWrOF/s+8Q=;
 b=hXOaaP38MDE/ZuIFMbA/ureqGO+ped9PedxEJ+cYaGZMtaCX6zSJarbltXaLjvNeRU
 y/8VBUq88J0qMmCsmSzC0TQ1pGd+DsI6Q/jswfkQKyVQx5e/LC6R0I8oW9sSjN+3OgcL
 e/3UCgKl60y9EKDZJgGyOpP/o0ie0OdsGWKH/h+Gro7S1ZIDyzyiDQbH2ql3+kSys/Zu
 s7eS6ZTS6UBHR2a9b+1qA0py26xGbKqf/37yN4ETzugI1+kEt9BVyhuRXrc11qIhJed8
 Lji8NGOdeJKWr3ho+F2aK/E+GeHlliU3AsEEuyI3CwbLKdzuwtpSWCMzLuT8tTf3xAoS
 d7QQ==
X-Gm-Message-State: AOAM5312yHrvdy1NuCmlDiKaMrTDm+Yqup0hGYgm1NX4vBGboteEtmuF
 pe5s3pPCJzkF/2VPxOEXyqVJAg==
X-Google-Smtp-Source: ABdhPJxiJ9T3V0tSPgY82rWKH7GggYs4wFjlubfWzOZWOuxUqj+doFgLW5FxvC6s04raHUUvW/tRKA==
X-Received: by 2002:ac8:4084:: with SMTP id p4mr3696028qtl.255.1632484824948; 
 Fri, 24 Sep 2021 05:00:24 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id x10sm287526qtq.45.2021.09.24.05.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 05:00:24 -0700 (PDT)
Subject: Re: [PATCH 09/14] bsd-user: Remove used from TaskState
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210922061438.27645-1-imp@bsdimp.com>
 <20210922061438.27645-10-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <55832708-ecf6-f5cd-dc37-fd22ff5e1bc9@linaro.org>
Date: Thu, 23 Sep 2021 11:02:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210922061438.27645-10-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/21 11:14 PM, Warner Losh wrote:
> The used field of TaskState is write only. Eliminate it.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c | 1 -
>   bsd-user/qemu.h | 1 -
>   2 files changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

