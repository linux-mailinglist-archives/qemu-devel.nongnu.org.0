Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABDB393507
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 19:42:54 +0200 (CEST)
Received: from localhost ([::1]:39798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmK21-0003nx-Ce
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 13:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmJzi-0002I1-MS
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:40:30 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:43923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmJzh-0000t0-0C
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:40:30 -0400
Received: by mail-pf1-x42a.google.com with SMTP id d78so1124467pfd.10
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 10:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8/1yVqoJQ1NwuB/UoljmYNwUPixxIzu0U+5qaRvBqt8=;
 b=kSwo/ZhR7bvmBHDX10OJR9xs1RfD4PlfTqPaPyW2lcOQzjY8Inn9+MAje+xH5q8AYM
 +oAPwNSEjMY5T5OpFsntzBlItEb7VNKt4zWQJ+H4iz5c+qoL2+MJxUW3/FNyU8IRLeft
 INcbe/qVJmUHFoSOpb9MeGn0Xjia6Boeci09D9tZ1EJRUqle1JtMvYL1OX7xhzOq3c1V
 I77eT5wY35vexwkiXYC4tsBRxSgsEIl2iuajMCQwCuo/dBGtrOFKaGRCQakE+UIYX/0x
 qUf67ez1YE+zM4WFWlda7nnp3p7O4oV2iQRRuXO/Rw1eFNcS2oIzhusmzQhKKO7+/6l+
 wr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8/1yVqoJQ1NwuB/UoljmYNwUPixxIzu0U+5qaRvBqt8=;
 b=avHAgN0lUpae/Ld2EVTw9OWrWIPg99geLbA9wL0gZxPBFxatI+E+gWmG6CtLsv74Se
 PE19d22Q1cHBbLDYNbBJ+P6VJzQc+YtzJaG65eW70susZ41WfAQut6H0SclLHYTij8/9
 TpNqOIcBB1v0LMJSgGMIrPO02CzzWdt4rC7lwPSAPjlGm8WPV4Io4Ja6E3gAVZZ4Xcgq
 Fo4sPUAkGMGZ0R/3fXZrBTuO8EmdtBQUr4DxQatLWbb8lZTIgRahVdpG0FIRMmy6ZOmx
 7fOKdjq5zzWsb8wORBHWF/a4mK0hi4Ey2LhYL/F1qrZ9n42VVbqgMCD4doa7E47cFHfs
 HgVQ==
X-Gm-Message-State: AOAM531gn7J8FK7sPHNs2IZ8pDVzJkgK6USK3qjQ/z9sBlWuSUZC49Nt
 SHxuurtcxEQ8zeQot37KYgjhQw==
X-Google-Smtp-Source: ABdhPJwxJuR0TJDcZF3tfxF47e5xUg3Ytn4rHCTkS/oZruitSu3cUvxS831/1a9Zy7tmLKHsHfB6SQ==
X-Received: by 2002:a63:5456:: with SMTP id e22mr4697734pgm.15.1622137227524; 
 Thu, 27 May 2021 10:40:27 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 c7sm2361990pga.4.2021.05.27.10.40.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 10:40:27 -0700 (PDT)
Subject: Re: [PATCH v1 5/6] tests/acceptance: tweak the tcg/kvm tests for virt
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210527160319.19834-1-alex.bennee@linaro.org>
 <20210527160319.19834-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <542e23ff-0345-a310-d5da-5f66367ed9b0@linaro.org>
Date: Thu, 27 May 2021 10:40:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527160319.19834-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 9:03 AM, Alex Bennée wrote:
> Really it's only TCG that can select which GIC model you want, KVM
> guests should always be using the "host" version of the GIC for which
> QEMU already provides a handy shortcut. Make the KVM test use this and
> split the TCG test into it's two versions.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   tests/acceptance/boot_linux.py | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

