Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B58B336A28E
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:23:44 +0200 (CEST)
Received: from localhost ([::1]:50504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMwR-0007uo-QY
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMro-0004iZ-Sv
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:18:58 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMrj-0003hm-W8
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:18:56 -0400
Received: by mail-pl1-x634.google.com with SMTP id p17so906590plf.12
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0ny2T3pB+L18hYFhpK3MZ1pMCzWhlecVo+tpISz9CEQ=;
 b=IIuvnhhRIukHkOMOmMAbYzlVUkxglBt2eW2sdU6TnZe1gIqYo2mY3/wjmDf4v1gxBV
 bTY225ug3ldXZceQwl91ZuKZXypYMlRwMwJmLfN/Q7I9DyxPbFOshIzU6j2E6lKp38V3
 Kj64i9mOJGaN5snMSk8fZMjwtvdr9FSW9JpmGvwK3//YJTn7ceYV/7wiLf6QII5B0WN+
 wjwZS3ag9IQ2YVmvOySjFNd6SsgqVOqm3BRmtb2otQYKw7xIjOhYX6rkEdIoiFDLoaVC
 hPDBlC4iwdQpojl1KLkp0HtxFPVE/SKlInxnsJvUJ/tZ3AEJ3czEhyx6NofZxbpyc/W2
 +pPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ny2T3pB+L18hYFhpK3MZ1pMCzWhlecVo+tpISz9CEQ=;
 b=KUho/2fqoNFUZb4mKlSnKVmP2vR6tfs2Ikf+C8RQWm8wzYwjC9H+Ec6fk1SLTyI56f
 iadJ5ur7C03zz+9She7q0d/dIohy3CR9CZim3tJb1YrDtiBvEuWV86fwmj56UfRNuGpO
 tV6zBrmc3rzwIQn260SYJOOH8siMxh5FLlh6R9NWoN594r9KTnHCx2JDq5wX8ygc4lGR
 D88ukVk3g5VwAhc6WUqvnREKr1/ArRKlY+xk5FT5Y9WMwnxLBul3QR+NUloEvlcBS5e4
 oi4zrTyK9MPu/MkC07pkocDkuEFoQi/2AKQWwXUypZIEkwg2RBFWBzOUhBqdSTBADnDh
 ySjg==
X-Gm-Message-State: AOAM530TlaKWr5wNJs1MRTylbQVZzGhBj2qU97wSzjMmyLGdvHL6olQs
 0J6cpbJaFnB/EMRr0LYh4mmueRSSrz83hw==
X-Google-Smtp-Source: ABdhPJy9/WcGqLrgh9jbHcHQ533fNGsta84xBhxJrGnYnUXNL7bFwvQcBAoxsHrhZhgdBwUiAegZYA==
X-Received: by 2002:a17:90a:aa15:: with SMTP id
 k21mr11248250pjq.115.1619288330313; 
 Sat, 24 Apr 2021 11:18:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id p126sm7827857pga.86.2021.04.24.11.18.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:18:50 -0700 (PDT)
Subject: Re: [PATCH v2 43/48] bsd-user: style tweak: fold long lines
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-44-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <93f33c58-e3dd-af5e-7e63-c3a30e5adf37@linaro.org>
Date: Sat, 24 Apr 2021 11:18:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-44-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 9:00 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/syscall.c | 40 +++++++++++++++++++++++++---------------
>   1 file changed, 25 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


