Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38CC49F1DA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 04:28:44 +0100 (CET)
Received: from localhost ([::1]:38356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDHwJ-000625-US
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 22:28:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHv4-00059Z-AW
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:27:26 -0500
Received: from [2607:f8b0:4864:20::62b] (port=44827
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHv2-0000N7-Pw
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:27:25 -0500
Received: by mail-pl1-x62b.google.com with SMTP id c9so4629053plg.11
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 19:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=C/C17HGr4K28H6mayuh6WUg3uZ69lu3PJY9/bRzGYug=;
 b=rOjHXKHoeqNRIcgeBt1AIaBooHm+FyWftp3aL3g1tXQXwQPW2VF3eKrbt/yHKI74wP
 hNdutqCn3nOAR8tM1MxjVsmlSWBQvzzg56N8nN8VFZh0KSnfkjzVHlf7VC/NyFF4VumO
 UYLyRr1NQ4ybH4RT1EQ7ph6fhH2qXwrnbXx9crFGgiCcRDD5I9xGq7zYnq1fUuW8ZRF+
 4IaSvv8Pz2VIve9oNQYOz810xPjAJyiVMbEEoBYsYqfnuBHDUTNEw7skkGrfVfmT4Yop
 GJc7KDIPijyAaqMuLkQG2zLMx+g1mhz4pFUd0EPr8KNRBcsXFo+R5txolWYfteSRtd/n
 B6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C/C17HGr4K28H6mayuh6WUg3uZ69lu3PJY9/bRzGYug=;
 b=LrW3Tb4DBTpCcMIGy0ZNCcxhe0ywWDNzBB++KjHpxj/p9BJZi5Yce1Ut68EaFFZvrj
 rHDS/+Rqnl6jVAAFFORhMqEmpLo1fmb/SJPiLeNyslFaVUqp7p7CZAVnlA65rU4ZjNm6
 2kE+byP1BKLme40+jh8S0Gw1uaiWVn6MOF9OU1t6MzIEnM6jG9d0kdHVzZXm1h50cqDf
 DDJvlgT06teQB7gjjFX9qcr54BPokYFBegHfUYaCl/nsuw9h40DkmImTBiM+jyqtgEN5
 eB7HCCgjj31oQ+dK7GlA4l0055eSmqaOFZJXQqOQri6SjKaOle3C6Vj23X4PoJGyF6J/
 vNrg==
X-Gm-Message-State: AOAM532GGaH94n//qlBVMbHQUPD+a3+d+1aLiiGrNNuWcfqOjhR+ZS4j
 WF95J6LOJnt1pEpuJbyVuSpxwg==
X-Google-Smtp-Source: ABdhPJxa9iWpYZfQEljeVwrU5tvTxvXgH9e9gO0uVLuPaQ9SFpmk5U0W26K+37N45b9K33XAk/vHSA==
X-Received: by 2002:a17:902:8648:: with SMTP id
 y8mr6233861plt.115.1643340443383; 
 Thu, 27 Jan 2022 19:27:23 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id l10sm6801805pff.44.2022.01.27.19.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 19:27:23 -0800 (PST)
Message-ID: <32f1d628-f550-63ad-c6ab-3d8788253e52@linaro.org>
Date: Fri, 28 Jan 2022 14:27:18 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/14] hw/intc/arm_gicv3_its: Provide read accessor for
 translation_ops
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/22 05:24, Peter Maydell wrote:
> The MemoryRegionOps gicv3_its_translation_ops currently provides only
> a .write_with_attrs function, because the only register in this
> region is the write-only GITS_TRANSLATER.  However, if you don't
> provide a read function and the guest tries reading from this memory
> region, QEMU will crash because
> memory_region_read_with_attrs_accessor() calls a NULL pointer.
> 
> Add a read function which always returns 0, to cover both bogus
> attempts to read GITS_TRANSLATER and also reads from the rest of the
> region, which is documented to be reserved, RES0.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

