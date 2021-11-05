Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF91C446717
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:34:41 +0100 (CET)
Received: from localhost ([::1]:44868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj2Ar-0005d4-41
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj283-0000H0-HP
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:31:49 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:37420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj282-0003Cq-5b
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:31:47 -0400
Received: by mail-qt1-x835.google.com with SMTP id o12so7655051qtv.4
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pKhL2t5ARGHkBAVrxJHEaYuOMSADFYjkKt9rCZqsnJo=;
 b=F0TDcabWfQziAawaCvsc9j35mZeDQdjFF2oYnf6kZZhb0XxR5lJV8QPeyDNv7bY3V7
 do2XCOzPl/4JtxKA5xmz90mDX7KnPhLjOUClcorP1m+zuTQk1f8pf8TF+r0v0xiGY0uO
 RKQVVSPQJKckxZdCZWxklSPPLTo7UXyz8D+irquwD2n3DgtuGvAjnDDPC5trkCG8Fn4Y
 WovrG1SEjGHZOq0TPhWDe59ELLT92dsy8OCFj8FMziApBuG15RxElCPvR8Trpr92cxmd
 TUxO9lU/wijxYfJd2SwvsDafU9/er/sup/gVL1axz4+d4bWO6iRVGhd+EcuPKFmoMy2n
 SJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pKhL2t5ARGHkBAVrxJHEaYuOMSADFYjkKt9rCZqsnJo=;
 b=BKc+FKsDGrrVolVP+oz4z6vGASVB1I2kgb2GdZPwtZPbszQ69tvC8c8QxiHnK7odPx
 Jgv5AayS/binmH6Qum1+djWyJazQUEoeviS2nH7jO0Mixo/oau4Y54GVYwK7GW/EtYeI
 QrKbavd3yCJ7UD3uuvgLlATeuSFS4rSGN3irBwu4qnDLNHx5oBrBVg+Vg8mZt533vMQc
 9pgKJjsMU8ye97COavK3iMKAuffX0yBkXCXNUZfmnzf8wEdC9f9ieQNj9+OEhB/vHx7l
 a/XXj3PxQ/Z6BkUhaxYgt2OBQa48UUR6dAmKZhxvCrilTCdvBuLlX8niNcMDncSzGCOH
 lHpQ==
X-Gm-Message-State: AOAM531zK+MsovWUiymyIxjx2dWvOHRNtahtDKckecRvotLgq5PHWCmj
 VUtCNvnCOd9nDEgo1H4XVHxxTg==
X-Google-Smtp-Source: ABdhPJw9hsKE0puNQjH/PdZVslH/OI704cd4zh8mE53hU8pKzxVdZaWBOFTaJ1ctwqEPzek+EWQpyQ==
X-Received: by 2002:ac8:7d04:: with SMTP id g4mr61707760qtb.183.1636129904581; 
 Fri, 05 Nov 2021 09:31:44 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id h11sm6042505qkp.46.2021.11.05.09.31.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:31:44 -0700 (PDT)
Subject: Re: [PATCH v4 30/36] bsd-user/arm/target_arch_signal.h: Define size
 of *context_t
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-31-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2965d6f3-c386-0105-5481-ec11caeebaba@linaro.org>
Date: Fri, 5 Nov 2021 12:31:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105031917.87837-31-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 11:19 PM, Warner Losh wrote:
> Define the native sizes of mcontext_t and ucontext_t so that the tests
> in target_os_ucontext.h ensure the size of arm's version of these
> structures is correct.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_signal.h | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

