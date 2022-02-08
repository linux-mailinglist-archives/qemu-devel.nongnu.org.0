Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D11414AE351
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 23:21:54 +0100 (CET)
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHYrx-0007Xc-SB
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 17:21:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHYn5-0004bW-E8
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:16:51 -0500
Received: from [2607:f8b0:4864:20::102e] (port=46690
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHYmz-0001gc-Md
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:16:51 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso355481pjh.5
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 14:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cSt+l8hciDHSFqdXKRv5WUZxQCoPt1gMgiSbTPtsZGE=;
 b=x9GV4t9gf4cY33F9sUfGCt7j1yvVA8EGe+yqrdqV4xlwkwT5pe8S2Z1dCSosE5naC5
 uZaIE9IDPF/rtMpDSOvy1nX/vvuFVuz8JihtFim0zaLCSbj8M8ZISqSB29ZhokjFUWEa
 XUxnXMlCYVL+au65ux01lxauVwPRQil67moH9E8ri3fFVPp4BAOuvhyE3VyyKiqoKoMT
 mY9qzLd1k+q9DuCh3Y6hKN5Um93t7Rwf3jmaMlEXmHFiFFiw6thuQgtE/qO6+iGV3rqE
 ozninghHnBLLh6Q6aweOvsVe2xJ/zEs0GY8bu4j+PH4t13xcS9jQUneQ9k/EHPckyNRC
 YeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cSt+l8hciDHSFqdXKRv5WUZxQCoPt1gMgiSbTPtsZGE=;
 b=Xb7lHS/qJ5LHtZ7SKuIzl2cGd10rcXa6nRUUWsDKadXfrQ78h6BlVLlYkIS8s8IgyS
 qdwaAoMZyCMgUObZzNowi9Sm3RswIPoKNq7rI98KRGnjWzpbVu7VvYZbeMRpiZdlbqF3
 IyABeiSM/DF5jb12E0aVgEbcqPQP2kFAVA0bMbAHQSqUn53Xu4NdcGpVaGsyZgLcgOYg
 TJwxVZRycchBqp2doh1FE2DsDhXaL79Au/56cs7n0bst8MQ2cSPFvvYX8Q4tDRgueIMJ
 lni9xI/cM4dABfXrbA6Xm7xtVvGTTWsnfA0gwIlkx9CeckxFmm5ZKXS5FD+z8t0Qz7SY
 G0Ug==
X-Gm-Message-State: AOAM5329KjMNQDxm0I7hWkGPobEkkXDKShBVP8fziClMQbOjKZprseFJ
 sWJgybUzHigpb0t6ItRSu9J6jrMVKfNNzA==
X-Google-Smtp-Source: ABdhPJwZuAk2SoO1f9eYpzhDm23LKt5q0uzlu1NxW1SO5G+y5tZ0GjBh04POT5p9KhjC/swJcSQ73Q==
X-Received: by 2002:a17:902:8645:: with SMTP id y5mr6615327plt.3.1644358604372; 
 Tue, 08 Feb 2022 14:16:44 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id m23sm16089023pff.201.2022.02.08.14.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 14:16:43 -0800 (PST)
Message-ID: <e0aef40b-2fc4-ba3d-b61d-eb32df268607@linaro.org>
Date: Wed, 9 Feb 2022 09:16:39 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/13] target/i386/cpu: Ensure accelerators set CPU
 addressble physical bits
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220208152243.16452-1-f4bug@amsat.org>
 <20220208152243.16452-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208152243.16452-5-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 02:22, Philippe Mathieu-Daudé wrote:
> The only accelerator allowed to use zero as default value is TCG.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/i386/cpu.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

