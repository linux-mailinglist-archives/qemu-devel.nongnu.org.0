Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C47F2EA0E1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 00:33:45 +0100 (CET)
Received: from localhost ([::1]:49828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwZM8-0005AF-Fd
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 18:33:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwZDm-0007N9-D2
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 18:25:06 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwZDk-0008U2-MI
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 18:25:06 -0500
Received: by mail-pg1-x536.google.com with SMTP id 15so20072466pgx.7
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 15:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f3hsPlWlVDYvjVOA7KQn4KDSzzw3f7YbtWd9y4Iul2o=;
 b=dM0Bnvdp1S0Buoo/CekUCHcyqy3yxbIM8iHEtn8oCxF00NNBGL3FVarHC6SwRFqktq
 zQp4iQajejMV/nv0DYB6+9J7hlBBLj5NitwqlWs1XhQs7n/UHmXRQ9aKXQQCwLKuP1Pu
 p/rqK+JOg1vukfl1QNosACscTTwO6mb8Ney9jkwsFk9d8MgE0fy/htLkkK3u2UFBbY6u
 95S5Ehi/F5OJilqHlUHK65vePvQTJfss9Dh2CN5MBZ1cllmR89oGSVQZFCjS4AY7yUq7
 lri0LTol0kYPW0ynzAg+A9cJzgApfjhU/g6aNnI5TIcX5UZdCjGJJ67PPTAfjBPW6UMw
 JJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f3hsPlWlVDYvjVOA7KQn4KDSzzw3f7YbtWd9y4Iul2o=;
 b=MCyOjHMr3usjLkdZ2z4SI85OnMq8TlFaNOJNA6QeFcs76xYCAk8qOaHRG2jxMwcc0g
 XUJGoK/30ov9plSAtalWp6OgT54ufWo28+7Gaklad2+cWLYcS8JIffR+oRaYeild+TwX
 sfRAkkKOYsLuScEdEZiaEu+Vv6TkBdQjzqpTJ6ok/zbGA4T8G6/iNPVeb9yzrFPDOo3z
 NLdql0ZCwJS9P6OT2IlR90pwdeIYuE53/acisi10i7H4QFWvxIrgLo4FbGSeXBzqPALs
 M3VdmbQOgVYtpdDg22UZ0r2lpVHU/aRiGkwkAaupfrtgFKvporv2c3+LiK0soyuTH1X0
 sN5g==
X-Gm-Message-State: AOAM532+MY0cXf6m2OUwHsf91i7JUmYUP0181E/9UIUKyEkcLb5M/azS
 /LfgOLqHO0e2vHH/LzSqkxnyLA==
X-Google-Smtp-Source: ABdhPJxWJMz2YLH74LsDSAzKOiMNbwBoSc48z+Nf2lWIVefkoxUL526MW1U8s3QR0mL+QUWgjPF6rg==
X-Received: by 2002:a65:648e:: with SMTP id e14mr18242750pgv.453.1609802700873; 
 Mon, 04 Jan 2021 15:25:00 -0800 (PST)
Received: from [10.25.18.35] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id dw16sm411509pjb.35.2021.01.04.15.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 15:25:00 -0800 (PST)
Subject: Re: [PATCH v3 01/15] target/mips/mips-defs: Remove
 USE_HOST_FLOAT_REGS comment
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210104221154.3127610-1-f4bug@amsat.org>
 <20210104221154.3127610-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6995556-1873-2ff7-899f-7f77ad0a0007@linaro.org>
Date: Mon, 4 Jan 2021 13:24:56 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210104221154.3127610-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/21 12:11 PM, Philippe Mathieu-Daudé wrote:
> Remove a comment added 12 years ago but never used (commit
> b6d96beda3a: "Use temporary registers for the MIPS FPU emulation").
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/mips-defs.h | 6 ------
>  1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

