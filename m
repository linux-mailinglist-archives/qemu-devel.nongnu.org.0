Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAB86AC33B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:29:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBqH-0001Sp-5k; Mon, 06 Mar 2023 09:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBqD-0001SV-Fv
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:29:30 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBqB-0004HU-Qu
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:29:29 -0500
Received: by mail-wr1-x435.google.com with SMTP id j2so8999507wrh.9
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 06:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678112961;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+7n02+RiJuaRrHex3UL5+IdjqGKfpotIDVhbhTo8+P8=;
 b=hUdAq29mBchPraSLErUKwt1Oey+/Q6nzPn7PaHDrOWzSq91wGynQaZERx/Q/F6g0Fl
 SY2bjc0LteLto3joK8ptMsaZh0n2s5cCA+UiojPX7jrEhbX0vpW0QpPaMXOKWKh5rwFC
 A73KAQ17ZJqYE0JpqNxU6rHMIv0/5rUFW1qA5V1OubJmWJ6iYG7kGqgNtIqqYb8GBH93
 Cioag24B9nEI7WXxC8VjdZ6+aYry9pzP1iNhotqqIcN5bsQsCoPVhmdkn86ZNIhihWAi
 JSvkOE1Wq+9uVn6ZJV48kXsR2YIwQZVDPLULOfSzRWg18HOThEtNVX0KBjlZlCvAja1y
 6d8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678112961;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+7n02+RiJuaRrHex3UL5+IdjqGKfpotIDVhbhTo8+P8=;
 b=oOJvLQX8XJvIo8DW1IANe29qrpB3eFmtP/WoyIBDdxBC7/j4RCGVrrKu0Gm3GMcjlA
 UVbB3/I8rp/SvvTqJmhrFYrE4KO68JTEfe6pVW5Eflf+5XGyKVQAmITvK0w0b8mv6Qlb
 bU2PSzUTT510s/mmMA//6WS4iCLj+Hp4I8vvpduql1qhHkvcelvTS8txrRU9XUlYRIKO
 p/H2BbLOcHLpgpJUQ/yjK2mtskR07SYxwBbRxrsrSMXZYR6G2+/vMFjZu2tbbmU57Obe
 w7dsGpwpmHjtIZkxjK/7x/EANCVfTnQ/g0HZWWqHu44eUmbWUa6tNSM6+fyYNir1kIAP
 gjDQ==
X-Gm-Message-State: AO0yUKXX6wX1sKDFjV3iyU8Dc3RfcampMc9nttInpAdbM9/bHlLmLZYV
 SNOj9+xZDK2KQhA/VAYK2PyRZ34gksWbNJ6eT6k=
X-Google-Smtp-Source: AK7set8AWRWq4EJlSlpVXXyAv91LHIOHqw9pXaKrZZsw3LH0FKdxre2til6Rb/wM1RKxZ4u4HZBRJw==
X-Received: by 2002:a5d:6a88:0:b0:2c9:a342:28ff with SMTP id
 s8-20020a5d6a88000000b002c9a34228ffmr6771404wru.42.1678112961548; 
 Mon, 06 Mar 2023 06:29:21 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e18-20020adffc52000000b002ca864b807csm10004262wrs.0.2023.03.06.06.29.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:29:21 -0800 (PST)
Message-ID: <4b5c9662-c609-8b52-ebd0-cbc461c751f7@linaro.org>
Date: Mon, 6 Mar 2023 15:29:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 13/23] target/loongarch: Update README
Content-Language: en-US
To: qemu-devel@nongnu.org, Song Gao <gaosong@loongson.cn>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
References: <20220704093357.983255-1-richard.henderson@linaro.org>
 <20220704093357.983255-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20220704093357.983255-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Gao,

On 4/7/22 11:33, Richard Henderson wrote:
> From: Song Gao <gaosong@loongson.cn>
> 
> Add linux-user emulation introduction
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220624031049.1716097-14-gaosong@loongson.cn>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/loongarch/README | 39 +++++++++++++++++++++++++++++++++++++--
>   1 file changed, 37 insertions(+), 2 deletions(-)


> +- Linux-user emulation
> +
> +  We already support Linux user emulation. We can use LoongArch cross-tools to build LoongArch executables on X86 machines,
> +  and We can also use qemu-loongarch64 to run LoongArch executables.
> +
> +  1. Config cross-tools env.
> +
> +     see System emulation.
> +
> +  2. Test tests/tcg/multiarch.
> +
> +     ./configure  --static  --prefix=/usr  --disable-werror --target-list="loongarch64-linux-user" --enable-debug

Why are we recommending to build this particular target with
--disable-werror, what is the problem?

> +
> +     cd build
> +
> +     make && make check-tcg

