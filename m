Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AC651603B
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 22:05:27 +0200 (CEST)
Received: from localhost ([::1]:56588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nktLK-0003Yn-U6
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 16:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nktHx-0002lj-1x
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 16:01:59 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:37408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nktHn-0007gy-Ph
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 16:01:51 -0400
Received: by mail-pl1-x631.google.com with SMTP id k1so1140882pll.4
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 13:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gyh6xRvrkX8ENui+UJ4lXxrfDc0u8nvsw4iB2HIPTLg=;
 b=KCVGs5zks8o4DfVcw4c7FBaigxI8jnCI2aLfeKHExzKJux/zp6lD1UsJ5Yy7AFDXXi
 0ZGT2P9dM9V68aReDa1KQOyIEvu+QgqbirCDdfYUOKOiJ7N52Zo5UtVs6lrJwgYuhCB8
 enfRLVlnf8UPNOSjxgs4EWzjRZcedM/TUDHoZqiGGttmsZVE5aux9eiB4TNFERbJxNX5
 7uD5yo+RUvRA8xhLbFwNj4tYq/sH+qFWAx8xGMWU7ZHFzw2Ob9cBf1pIBDDJSSBWe4v6
 Y3+tt0f2unmkfKIDwRQ6N6evEp6dORwccS25Z+v7sAVf1sezLDbnA8I99HfojuPItWtW
 o1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gyh6xRvrkX8ENui+UJ4lXxrfDc0u8nvsw4iB2HIPTLg=;
 b=hQx05QM9Qu06nIz4l29VHXqXK6/juwdJQ7ote9PQD5dRdAzj72wSESsUcXN5dbglW1
 e6UIZX7TN4IFj3Ucz1VIY+UcpTaULmy/DD2/iNYDvGUDSCdypfvtYN+vkCwjgxhShItw
 xdI75FrZRzaBnBJSidgRO3O1rsl1pxn/Qp8kl3Iu1VqZlbXVpvRxAhhjkLmK7S1ancGc
 ec85mQvc4RaWnqmsp1ZkvzxdEM96MVylDLjZJ9smHIOCrJcAyq02rKO212Wn+sg+NAGh
 JsMiiwHkePVeooZdrQBjNX8OcS0eEsdhsyX0NeqHirmhMNIl25mymuS95OBQH/aPSwZC
 WqDQ==
X-Gm-Message-State: AOAM530JfsHTfdqfZgzHtMEsLplJQ127LTYK7HvAPeL88idLMGottQ39
 zXWoFYuEU/2Lu5TarewV2kGSkw==
X-Google-Smtp-Source: ABdhPJxfIzdoKYnL3Sp7O/lR8VdNFwfPSzKyW0XU2D0ILujmEKHvWIwC/KkCxxkOQRDdMdyFwJHyTA==
X-Received: by 2002:a17:90b:4b42:b0:1dc:15f8:821b with SMTP id
 mi2-20020a17090b4b4200b001dc15f8821bmr7992312pjb.131.1651348906392; 
 Sat, 30 Apr 2022 13:01:46 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a632504000000b003c14af5061fsm8926093pgl.55.2022.04.30.13.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 13:01:45 -0700 (PDT)
Message-ID: <18dfc200-7a10-459a-8a87-d447b34c2b70@linaro.org>
Date: Sat, 30 Apr 2022 13:01:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 11/12] configure: enable cross-compilation of optionrom
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220429141813.328975-1-pbonzini@redhat.com>
 <20220429141813.328975-12-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429141813.328975-12-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
> While container-based cross compilers are not supported, this already makes
> it possible to build x86 optionroms on any machine that has an installation
> of GCC and binutils for 32- or 64-bit x86.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure                  | 29 +++++++++++++++++++++--------
>   pc-bios/optionrom/Makefile |  4 +---
>   2 files changed, 22 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

