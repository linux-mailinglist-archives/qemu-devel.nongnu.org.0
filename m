Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35296203BA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:26:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osBRv-0007Rt-J9; Mon, 07 Nov 2022 18:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osBRs-0007Ld-Dj
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:22:36 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osBRq-00044l-Hh
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:22:35 -0500
Received: by mail-wr1-x42c.google.com with SMTP id j15so18434574wrq.3
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HYQgmPZbdO8PGa4dwHhNjaQMORxJ4x8u9dRg457yaoo=;
 b=Qf3Uc3ZqblBslMhvgsH+lEXisdpc14Wy2T16hsrnX6RNR5Ii4P4MgPZ0uBGF10MQol
 XrHn/KzwexiSmQNSqDuyjagTBjM81K44ZzCysjs10D5q+vN6N7pS7sdZVqStje12t3JB
 Ql7+4FamKfCacYGCeodJg+jU+I9//riDbMSGK3gTJJOqvSkHDDqqnk5C6YfSxF5LctqB
 6cCPs24i/FaDfd8MT6RP3z3nxB/9GgRjQz7Zw5YGm41mYhwV8HyklfXrERHDSUXi+iNV
 R07YQA+I+OH43Mhy3GhUlN6xC0Vq3CMdHxtZ8pUFS8dNZcQ4AXH1hB6Kd5ANQn5dgD5z
 y/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HYQgmPZbdO8PGa4dwHhNjaQMORxJ4x8u9dRg457yaoo=;
 b=0i9yW5RWmVxK0FqiIev8sjOD87naoahvXC0d1DELFPPk21DmZ1MgFuIUp88wSndig9
 wLjJJFpuNZ2Z/oyiG82bl2jb1usfJp7wNTLtKff+peWcUZ0foqLi0N3NZkRqtl4G0FXN
 /YUMOEo3O1lw5yuwndeAxnAP5IxpaDnmMw/uHYh5keoSKl1EIhgDS1Ud6g41Inumb9qy
 46CrZDOKhugkQue6Nnuc7UiMSeOBP/FIkX+jeP47eh4OvSWxQnrsFj+K53iesL5bRPf+
 1j7EmtKkd+iFl4dfQV8IsxmKMxRviiQFqEeaOma2uRJaPIrPpzx8wHH6Fbrm1lkXExf7
 7mdA==
X-Gm-Message-State: ACrzQf3f42dIjqCdvNJeKw0QPEMXzrhsPXxGMxxFWLJV4u8fyoPQ3TYc
 3hIj9KJQ6AVw0XTZLaHwBSzraCsfAipwbA==
X-Google-Smtp-Source: AMsMyM64VKxeENNgqMpyh64ZxOZKxK0X0mQvDKDNVlqn46gvGciiMtDltaw6YBfV1YCRUtviTgh7MQ==
X-Received: by 2002:adf:d089:0:b0:236:558b:abc8 with SMTP id
 y9-20020adfd089000000b00236558babc8mr32724927wrh.231.1667863351108; 
 Mon, 07 Nov 2022 15:22:31 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a5d69cd000000b0023659925b2asm8395456wrw.51.2022.11.07.15.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 15:22:30 -0800 (PST)
Message-ID: <0a70bbe0-adb4-d81f-d758-b4fc0de8e490@linaro.org>
Date: Tue, 8 Nov 2022 00:22:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 1/2] target/mips: Don't check COP1X for 64 bit FP mode
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: f4bug@amsat.org
References: <20221102165719.190378-1-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102165719.190378-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

On 2/11/22 17:57, Jiaxun Yang wrote:
> Some implementations (i.e. Loongson-2F) may decide to implement a 64 bit
> FPU without implmenting COP1X instructions.
> 
> As the eligibility of 64 bit FP instructions is already determined by
> CP0St_FR, there is no need to check for COP1X again.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   target/mips/tcg/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Queued to mips-fixes, thanks.

