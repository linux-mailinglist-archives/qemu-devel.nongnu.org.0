Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 069722BC1C2
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 20:48:36 +0100 (CET)
Received: from localhost ([::1]:56282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgYs7-0007di-0X
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 14:48:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYpO-0006H1-3a
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:45:47 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:35269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgYpL-0005Gz-Q2
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 14:45:45 -0500
Received: by mail-pg1-x543.google.com with SMTP id v21so10472291pgi.2
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 11:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RtSkZMsqAIp9iAPvxIHK++oKJKS41n5/M0eSaRlYVDo=;
 b=Y9Q/2TO+908kl7Rc9/d6tRkzw88D6oD4kqaEz3GoQdhBkLPyshQwD0QaMRyyO39ITJ
 OpM0ruklcjaOuKF9oDDqUyQiF6sbPSpEeUg9Ux+/Xz1CxZs5+PdihKl3ZpIZkjuwA9SW
 ptyBMZbJg0DXX8uTUkz/KVhEZoUsyuwe66F4rbm25LwVugpt4TsQs2eqaOnz2rUiS8iq
 +ofWQDRWXuImf/bycj9Qii+J+XTIfzeXJ5aoDoA3Dc2jya/HHaP8JTdQInNTT6kZoyjY
 wPzoC/kL13jRlWzS5dnZtP3pM/xCMRs6VT8VsjQmtcsQFF+cIa2I4ue4JbEQlYM2R97A
 CXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RtSkZMsqAIp9iAPvxIHK++oKJKS41n5/M0eSaRlYVDo=;
 b=bTz/m713mVRzxRsiwkdSLzcwcuj4SY5Gp6DfEOyQGLwN0U8NkXg+G5r9i+P4e8zIEc
 6G72JbFxkW7ZfluiST2Xt3KD8GYX0LJqgx0fVcoFu4ahYbhhI6pz3H7hdsUGLf4oGLsN
 kpcGORmyyhskfHM74qbKnhAaSU/swMgcnS6nwIdtdJPMO5ZkeBn4rWrcOGKErMp2D5av
 uw6m1PpOKxjo9lWZbVb73Jrqlpkshrd4gA4ZdxZQZwthvkYNHo6ZG2eRzj9cUUgxG17m
 XwEjIj4iQhWJ6FPmEdfDUy6Wie84tLJABowfihGjH7GmvWP6jOBYEiXl9dWPP5erXZpY
 icEA==
X-Gm-Message-State: AOAM530PL5rmELi12IENQ4mnrx8VuJZkAjjHr06csqf/2jXDvmd8EMmY
 8n5ckB4hF8vzG+n6hkgDOEWSWg==
X-Google-Smtp-Source: ABdhPJw+GnjVwqGPl6whd1+fUrLTwhXaL4Lf5Nr0B9erU3cA1DzerIXj4KfoplZSZ0eMP1JqLGYh2Q==
X-Received: by 2002:a65:4349:: with SMTP id k9mr21784018pgq.169.1605987941408; 
 Sat, 21 Nov 2020 11:45:41 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id i11sm8804517pjl.53.2020.11.21.11.45.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 11:45:40 -0800 (PST)
Subject: Re: [PATCH 03/26] target/mips: Extract MSA helper definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <219a5925-fbb2-af86-2728-9de45fc96b82@linaro.org>
Date: Sat, 21 Nov 2020 11:45:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> Keep all MSA-related code altogether.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/helper.h                  | 437 +------------------------
>  target/mips/mod-mips-msa_helper.h.inc | 443 ++++++++++++++++++++++++++
>  2 files changed, 446 insertions(+), 434 deletions(-)
>  create mode 100644 target/mips/mod-mips-msa_helper.h.inc

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

