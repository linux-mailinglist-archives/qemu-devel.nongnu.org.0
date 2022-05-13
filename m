Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D437B5265C5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 17:14:45 +0200 (CEST)
Received: from localhost ([::1]:33164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npX08-00014i-Ne
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 11:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npWyq-0007Cz-F7
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:13:24 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1npWyo-00038q-JB
 for qemu-devel@nongnu.org; Fri, 13 May 2022 11:13:23 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 j10-20020a17090a94ca00b001dd2131159aso11130101pjw.0
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=L5QtYLHEZBXt+/iP6MIrqtT+84zvAC0dFpBvzZOGREE=;
 b=aQdlvAx05UBta2S0eAjzJlKWxXLLsq89rySM5Q+YnjMcPgI5beqGNKFpeu5rlGHmdI
 M4y8bYEgPKXGp9w3s3YipnHB0LnVUKy1doJYjBC2iO058vZ5tGwdPuikjjqhnqfa5xVr
 WXgarV7aPdJFPoeA3ctgnd0IM3XUslf37VYbMlKx0fVWtvvzjMugU12qoPijbUDmQBPI
 FnJo/IbFT/HH93/PDQ7zJGkRchCP41WQeEDNjM3OHo0xPY7m4MAmOQrfJyUg7gUDJyXd
 eWxiGvR0JNuUYd6c3PzxUJaofxzFsXYxxPyiSC4PNgqx731DXUP7Re4FgWJzCwxakMcG
 ARew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L5QtYLHEZBXt+/iP6MIrqtT+84zvAC0dFpBvzZOGREE=;
 b=wZAXaw4rYbUFON4qPJYjJ7tByP9Rro2mFdMhViGteFEaIqMdooOswr9A1ANTCAsZ3+
 GKutap+reqb9/ErTcmF31N5vjeYoivxsybtGP3OkCbGCFD+P+dSUd6zIbqsSSaMsG3L4
 HQWn5wi3C/mYYjuuMSz8leWkAxF1Qdq2fmLms7WYQu5bAeuVoi5EpbDSsPBxGW1hKN9c
 YC2G9EuM8zTzlYdm9adKYD8fTZrjSBThZv8KWzPGe7ojlcIX/ZnnQ5exg20qx47lVLJ4
 BDwSA8dl3typzjjCU3OqCo4YSCrNcNvIe+bQ5Mzf0/RMDUFOokw+RwO8ecCqgJ3nkYF+
 QeJQ==
X-Gm-Message-State: AOAM530THyKIrLbrjHK/jwmOJOj7iJaAl53W0afeOwwMts+rhtmYLNc9
 gw5pk9i8WKpmm2YR7hj1qDTAmQ==
X-Google-Smtp-Source: ABdhPJxeuew0jS0SySza0XuG020zSk99M4igIeMn5aGq2ZwckLCqoowR6XbSaO/Zadre+M7/YYdceA==
X-Received: by 2002:a17:90a:5515:b0:1dc:c1f1:59bd with SMTP id
 b21-20020a17090a551500b001dcc1f159bdmr16584845pji.81.1652454801072; 
 Fri, 13 May 2022 08:13:21 -0700 (PDT)
Received: from [192.168.66.8] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178]) by smtp.gmail.com with ESMTPSA id
 im2-20020a170902bb0200b0015e8d4eb1bdsm2055505plb.7.2022.05.13.08.13.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 08:13:20 -0700 (PDT)
Message-ID: <f07ef0d8-d02a-c1c0-7b26-a619fefae1ee@linaro.org>
Date: Fri, 13 May 2022 08:13:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/arm/helper.c: Delete stray obsolete comment
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220513131801.4082712-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220513131801.4082712-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/13/22 06:18, Peter Maydell wrote:
> In commit 88ce6c6ee85d we switched from directly fishing the number
> of breakpoints and watchpoints out of the ID register fields to
> abstracting out functions to do this job, but we forgot to delete the
> now-obsolete comment in define_debug_regs() about the relation
> between the ID field value and the actual number of breakpoints and
> watchpoints.  Delete the obsolete comment.
> 
> Reported-by: CHRIS HOWARD<cvz185@web.de>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

