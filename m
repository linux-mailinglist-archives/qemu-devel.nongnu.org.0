Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 716EA3A6E8A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:05:10 +0200 (CEST)
Received: from localhost ([::1]:51706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsrtV-0004mn-00
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsrlT-00052t-Er
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 14:56:51 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:42863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsrlR-0007lZ-Sk
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 14:56:51 -0400
Received: by mail-pf1-x42e.google.com with SMTP id s14so11246208pfd.9
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 11:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=z9rKFb3Ci/7uxLmsplEeFmejI6CWG+U9JoxYU3ENOzk=;
 b=Vbv7mSm4asHZGLy3LXNNYdl+DjvX5jR6wKk7KL2ZMuxpENHOtD6jp7cHC7QMhyPxbr
 ni2InNudf4naVyyZ8svTuL2i6PHm4mk5V/Ky4PQMZwzJt9DFSnXjEQfM+XVuErIY0dic
 AmSwYnl1fwTXAYzEZy+F14zyalDLLNeZfP3sOjIH/6CbUjpr1vNnetbiFTN59hdQUe3h
 oXeJwTo7GqxGXM+WDuJKhcYyPGHgJV8rQMzqjmzpq8Z53AMdRuS6GCl9/eyhWzYVSo5j
 0YjKumUttPqfOm6+CODcDDeqkS8TJedG9b/NqvO6SSv7ZcygAkZQ+3aPl1iygwhw0qtS
 n+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z9rKFb3Ci/7uxLmsplEeFmejI6CWG+U9JoxYU3ENOzk=;
 b=Y71P0BpTrDFW1ujKivPULwBJcMc0tFytmcKsuhf/FxKbj5ELePYT0K6pVnY4aU4xdN
 05aIsxeEpqNxgNw313Ibx8rQXJxMVqO45sOc0L4RUhJlBwu36aA7ZoDZN6uJwkg1YWUb
 4ZJ1PPWO0hvLMg5NcrpKJkHYe0kQ4A6uMrDIEWE/+mptQTczFtjGb/PVbsjCLVnI0f30
 TlleOVX1Qn13zIM+xHXtnEdfUe/4hDLj04tdL+21h3pGKuqGoN6TcWfPLiviWfMV7Xxv
 B5rkUfvhy9rM8+XFH0n4cu0vrdFTUmpwt/4ja8/j6iQDUKoe4WSeSSolOD4FBpX/T8BQ
 bpKw==
X-Gm-Message-State: AOAM530Jno8/DzoPjVcu6rAH/yxv7EpnkiTzRdbK/CNpNgjPCbmfOOcx
 aMu77q+ah1IMRAtFLTDG7iP/ib4MkeM3ew==
X-Google-Smtp-Source: ABdhPJwRpqC3fXY8woN4oIQwLaYQxxBT3MaJBIHCgXbwZ6Hrvv2i0LeYpZAMQiSM7ECBob3+lN+KyA==
X-Received: by 2002:aa7:8f3a:0:b029:2e9:c63a:312e with SMTP id
 y26-20020aa78f3a0000b02902e9c63a312emr573007pfr.73.1623697007453; 
 Mon, 14 Jun 2021 11:56:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k21sm13405798pgb.56.2021.06.14.11.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 11:56:47 -0700 (PDT)
Subject: Re: [PATCH] hw/intc/armv7m_nvic: Remove stale comment
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614161243.14211-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0711ccff-ee4b-ee0e-0ab9-fc789c283136@linaro.org>
Date: Mon, 14 Jun 2021 11:56:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614161243.14211-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 9:12 AM, Peter Maydell wrote:
> In commit da6d674e509f0939b we split the NVIC code out from the GIC.
> This allowed us to specify the NVIC's default value for the num-irq
> property (64) in the usual way in its property list, and we deleted
> the previous hack where we updated the value in the state struct in
> the instance init function.  Remove a stale comment about that hack
> which we forgot to delete at that time.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/armv7m_nvic.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

