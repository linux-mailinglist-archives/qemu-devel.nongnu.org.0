Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D91D516043
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 22:08:28 +0200 (CEST)
Received: from localhost ([::1]:60234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nktOF-00065m-Il
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 16:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nktMt-0004hE-RU
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 16:07:03 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:41606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nktMs-0008Nh-1M
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 16:07:03 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so9947006pjf.0
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 13:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HPFzpwYk9DV06YZs2naFhZg8xrC3nccgYdclscp6meY=;
 b=MRlq0yrRNIOiKKCOxr1SyceF8xypWODK6aKFzwBGtg/WHmsjZq6vC8q/ftBJYE1/LA
 i/2SqXazuhgnPux+NTVKM1HGrFfwQvZ6G8LGxjkX5FiUWqXvegeqCYUwm8JDYAcnDhPP
 ICoMPIoMWHOMt3p9s4l+hKpxxylhUEEVkH4p7PyisxtR1Qmvm0jbYu4/uycrd5PrVooJ
 v4tJlx4Z3phCOsQRg+3CO5La3CfAjwUJHWq33gn9BM+v2JsTmSvdiGIsRA3qS3T3Qc88
 jp8sg/JoZnQyG7ZSC/CxtSVSINEC031uSCvKxv1+2mfGdSFi6lW9pwYIYYwsq761Xik9
 fwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HPFzpwYk9DV06YZs2naFhZg8xrC3nccgYdclscp6meY=;
 b=4Nnty8PbAovFYZ4Nci1L61KmqVahI54nitE0Y7kTdsalOYJtNVOYBpXa6ckm3DcqOi
 NnZxlSInvJhNUbQknHR9ZGgN0aBEYVASrxK3GRV+3Y0H68YM2yuDg8qKFRw5eqVwVMiK
 /Vc4+NPh8ptf2sVszqe15qZlyRsBW8UJIDjSEYGIbO9Uj0XWDHXHBt2Fvi0Pc+PIia8t
 yAkg8xZCmwqi7RAaLfZCqsRj1Z3hvcyzQd5rMKj4R7KJ20hhgoCOvIFiDioyX4L+y/EW
 P7zE74CUr7X9xyGC0eVZUoz+pUI0KoVqTi4ECMjGzwTnRPkzHvp8VfrzSjnl9/MjMj20
 DrTg==
X-Gm-Message-State: AOAM531aAPDYJiDj5Qj7mg+QcfVyxsVt+pUVT1I70XSnZ0Q48heytDhX
 paDZ/hbfZfQmy/kq+HY/30xJVA==
X-Google-Smtp-Source: ABdhPJyIxXswa9peQsHOnGnHcZPpfjmg5wRPFIhvJz1DBkOSNpyTEeop53ok/tnM1bF6WGdqSXYv/g==
X-Received: by 2002:a17:90a:4417:b0:1ca:a861:3fbf with SMTP id
 s23-20020a17090a441700b001caa8613fbfmr10444868pjg.80.1651349220506; 
 Sat, 30 Apr 2022 13:07:00 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a170902728800b0015e8d4eb1e0sm1863574pll.42.2022.04.30.13.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 13:07:00 -0700 (PDT)
Message-ID: <2237d20f-ae76-d683-cf8c-626624885e96@linaro.org>
Date: Sat, 30 Apr 2022 13:06:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 12/12] configure: enable cross compilation of vof
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220429141813.328975-1-pbonzini@redhat.com>
 <20220429141813.328975-13-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429141813.328975-13-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/22 07:18, Paolo Bonzini wrote:
> While container-based cross compilers are not supported, this already
> makes it possible to build vof on any machine that has an installation
> of GCC and binutils for 32- or 64-bit PowerPC.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure            | 10 ++++++++++
>   pc-bios/vof/Makefile | 17 +++++++++--------
>   2 files changed, 19 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

