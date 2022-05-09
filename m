Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D165205ED
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 22:31:10 +0200 (CEST)
Received: from localhost ([::1]:40292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noA28-0006Mh-V4
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 16:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noA0x-0005g1-40
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:29:55 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noA0v-0000l6-Hh
 for qemu-devel@nongnu.org; Mon, 09 May 2022 16:29:54 -0400
Received: by mail-pf1-x42d.google.com with SMTP id p12so13221838pfn.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 13:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zHTqs2H4AEjfH2kTe0HcWv/wRK8n4KyZ2PpGHak8WYA=;
 b=FNpSZh2wQqPSZ5YkEAwCErL/oPA/7MjVnvgxXYWRohl7n6H2jcN5lrDpIsHaxMiNYR
 Q2MhY3a0jpLSCvwHaRT3qwJSsggFgu6mcBtksqLc/q5of46njdgKMzHA7LDgtlHBaqlh
 jfSGvGY0GejMQKfHZyZ/uu15WWyBOZ22RuId1RXhM26fb307gg8epB5r4P6ex+mj4hGq
 KhpQlTWIPf8qNZhjnEEr2GQEczFNZnURShQMLjZwSvitTiZob5MJer/J2YQ/kcpv7yrc
 gE3dM9IeAXi6vUl90XvcE+bAa5TEzf0+CLWGWNpUwPZdIldLOWMo7PedYj5NXPojSmHl
 8unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zHTqs2H4AEjfH2kTe0HcWv/wRK8n4KyZ2PpGHak8WYA=;
 b=AmZuCUzaHmqdgiqqN6F91sTTQTwzA6RT5nff+TTHENR0iyP4oGN2t9H7MpDZNisb7f
 NPzBktLkWV3AM8GCBaazLneU86R5oTjdUGuWBCRHu2RoIuSVlrIJlJe6SpJsF+Z310g6
 I2ZMhuBVdXDwb4aYzytroXuUT/RA95YqFjOX5dhbq9MWhmVugt3mE69GQaw3TU+M2frO
 ipfMS3NU7o1mzXfVx7JDt9FnpLUgfRJfbJWxA4KSH1rUTwzb3Mv85uNi+E9cCtfdZirN
 kOJqQ2mQh/o+AW7mFQJmG65brJYiot0v1j2zYMpy/nnjaaNcjOrC6xmm0k6Ak3l3XThG
 oVMQ==
X-Gm-Message-State: AOAM532PJ0wM+CKk26zlZUNO4T6FQU26NClDiE5bnMTIAAQC1ETnhAFJ
 Uia9u2Yu/NdSLcUg/Yj8iedQ+g==
X-Google-Smtp-Source: ABdhPJyZmS7x/0yDVekvV9zyKkxlzbyx3jxPmFUfahen9pMLHvgPeAUvFgFfr9uqyu0nVwo4CRdL4w==
X-Received: by 2002:a63:86c6:0:b0:3ab:2c2c:42e9 with SMTP id
 x189-20020a6386c6000000b003ab2c2c42e9mr14125834pgd.230.1652128191600; 
 Mon, 09 May 2022 13:29:51 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a1709026a8a00b0015e8d4eb1e2sm313279plk.44.2022.05.09.13.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 13:29:50 -0700 (PDT)
Message-ID: <683ba7cb-ec3e-4af4-8be9-98f119ef981b@linaro.org>
Date: Mon, 9 May 2022 13:29:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 02/43] target/loongarch: Add core definition
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, mark.cave-ayland@ilande.co.uk,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
 <20220429100729.1572481-3-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429100729.1572481-3-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/22 05:06, Xiaojuan Yang wrote:
> +    DEFINE_LOONGARCH_CPU_TYPE("Loongson-3A5000", loongarch_3a5000_initfn),

Follow up on the comments against patch 34, and reading the 3A5000 manual, I see

# On-chip integration of four 64-bit quad-launch superscalar GS464v processor cores.

Therefore it would seem that the cpu core here in target/loongarch/ should be named 
"gs464v", and the 3A5000 name should be reserved for the cpu package over in hw/loongarch/.


r~

