Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C77868A030
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 18:22:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNzkc-0000i6-VT; Fri, 03 Feb 2023 12:21:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNzka-0000hC-Nr
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:21:24 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNzkZ-0004Om-4Z
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:21:24 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h16so5247651wrz.12
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 09:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KVyKIx2Z5u6mOmoyMY+bdfJeBmc2m8hc5Y+vcnT1LuE=;
 b=RrZ9h6+kdWKjnXEH6kpQql/lzF8B/PeD5ZNeVs7lLCzgGrUUH5UDGtMvrWsJTH44HR
 dIZIT5M7dvjjTjfkNO6ynWDOjuJfgfvpBNs2+SH6upAoWglG9nvckjMiqtGI3DWK0FmK
 VtIM3PRSrZE3W0IA/vgR51g2iEch/PzyEvIxo7oHl/Bb/fBNy+u3wwgneijKKPBKYr12
 lN6EzYLKsLqJNy3nkEEpzbfo65dNie5HuLQSaI6YFvP26BKRPdZSk1X7bvSc3SJDnuPf
 x9ndTnt0N1TtpDneVbEhEapmIpGij57mssMeMEFW1QFXvVyGc/eoTyS4Pcj72XmenGCZ
 3AbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KVyKIx2Z5u6mOmoyMY+bdfJeBmc2m8hc5Y+vcnT1LuE=;
 b=3O/bvKir+S7ATR0VDwwkC6V7FtqRwL5r2OJlN4m8KoPySPf3LoE6M6LoOHXkoXqiFq
 X4j2zVdsTW5iZ8Uaq1uadB/b6PioRUkM3gnHQcuOaiwOehCiLT00IjKQQ7BzzNGr6CcK
 HH8khcTE/+13BtTa+/I+QKa64D/rhIZi3iwPZdD5prluTy32xOowRfa/KjmJg517miNj
 G44jxF/vnXNWubu8kyIy79gUcLwiMiJ4n/VM+QvH0OWkc1m9YUkyD0k4cyLmH7CePIEV
 4OkdWQfjsrZaBLkl3ozzRa9AkIZBGNc2eNR1ipo7+xoXwkNVvw/Ik5uuvrkKKO0/waKS
 r+Wg==
X-Gm-Message-State: AO0yUKXCopUp7DYkn4JEBMB+7SNI+48nGaiEExM/zTKqpqUMVQdWb9FC
 kRReRKzNgYAyYjk0JgFM+JcO2w==
X-Google-Smtp-Source: AK7set/NNCbhjYZHvtumg2me5DLxy/VdvlTkR/fW2euiV1Epz4lmT/VlxY1tv4A9yUOp5bhYnDx/Lw==
X-Received: by 2002:a5d:6f1c:0:b0:2bf:e95c:9919 with SMTP id
 ay28-20020a5d6f1c000000b002bfe95c9919mr10264919wrb.55.1675444873188; 
 Fri, 03 Feb 2023 09:21:13 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m10-20020a5d624a000000b002c3ce97ec38sm2215875wrv.115.2023.02.03.09.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 09:21:12 -0800 (PST)
Message-ID: <c7f8a9b3-fa05-10e7-bc1f-ad7cbefdc431@linaro.org>
Date: Fri, 3 Feb 2023 18:21:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] accel/tcg: test CPUJumpCache in tb_jmp_cache_clear_page()
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org, pbonzini@redhat.com,
 qemu-devel@nongnu.org
Cc: iii@linux.ibm.com
References: <20230203171510.2867451-1-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230203171510.2867451-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 3/2/23 18:15, Eric Auger wrote:
> After commit 4e4fa6c12d ("accel/tcg: Complete cpu initialization
> before registration"), it looks the CPUJumpCache handle can be NULL.
> This causes a SIGSEV when running debug-wp-migration kvm unit test.

Do you mean commit a976a99a29 ("include/hw/core: Create struct
CPUJumpCache") instead?

> At the first place it should be clarified why this TCG code is called
> with KVM acceleration. This may hide another bug.
> 
> Fixes: 4e4fa6c12d ("accel/tcg: Complete cpu initialization before registration")
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   accel/tcg/cputlb.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 4e040a1cb9..ac0245ee6c 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -103,6 +103,10 @@ static void tb_jmp_cache_clear_page(CPUState *cpu, target_ulong page_addr)
>       int i, i0 = tb_jmp_cache_hash_page(page_addr);
>       CPUJumpCache *jc = cpu->tb_jmp_cache;
>   
> +    if (!jc) {

unlikely()?

> +        return;
> +    }
> +
>       for (i = 0; i < TB_JMP_PAGE_SIZE; i++) {
>           qatomic_set(&jc->array[i0 + i].tb, NULL);
>       }


