Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B2D518812
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 17:14:17 +0200 (CEST)
Received: from localhost ([::1]:45982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nluEC-0004o2-Q4
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 11:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nluCZ-00034r-Vw
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:12:36 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:40533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nluCX-00015E-Ky
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:12:34 -0400
Received: by mail-pl1-x629.google.com with SMTP id i1so9069493plg.7
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=uAwKGu1VN1PCVVXeSCI2y/w/tTvq0hhwQDsvb9v+mBU=;
 b=Sg3V2ZJ8Vnrm5wf04jRfw6nw7Ce93ah4qZ+DMIqKaZdkOq35qV1xg14SAXOA7UpMoX
 aiM1SXSwKcJT+XL+3U8p0qUCozF9Z9XFrjNduM5X/aD2quJDrgovLU/EFUpT1MV3Lpqb
 Nk8siR7iQb/hX9elojwgC4tsaiGanu2dF6DZ2QUYB8Kj/Db6yxHSDnYJThEv0bMdWWi4
 gM51OJH1ieAeqpNGXuct0M5DkBTG6ZpveIhB7+X0RtHYgR23Pa2JOYQ/+WTHows7hCLh
 TtaRQGHEIpVGayQYKcmzJjQLY93oMNeFN8JgnywbJ0SagcUV6CjyLALIT1fq21r+MV6/
 Aajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uAwKGu1VN1PCVVXeSCI2y/w/tTvq0hhwQDsvb9v+mBU=;
 b=3ObVR5CC0VgtDm+kzFcuZFnfHS3I/pxvX/ttXLU+E1AufouqywSRacTTNGXJm6BtIR
 YJTPbvBTCpywQOc47WE8QgGf0f0vdjBfupVKCH6BR/RTOzo/aoNnwqhcsh5bboOXrm/2
 hw/bE8aZQwlbfsl5xix7krtz1vZvAgvfzndU5C0JjNBYuNiIv/vxGxMt0Z90AW/W30Uo
 67qSZQA5i/hlbJ10Q+vXGcn+ywh+KZxqrpsJZb4yfsCxSXwicz5scefNZi6HGiMlRQeD
 8djFFRPpnH5JdgOd7/+r/7u2Rb7xGXSwQsq+XX+NcYoyHOzabQz5J3En/VsQmPIQtsdQ
 eJJw==
X-Gm-Message-State: AOAM532B+BtxRb/DR8jAE4BcAxoGNNR7Eec/mFP88nb8rIbVxactwkgw
 aaU490DiMO4eZppQ743f3ocWa4rB0uUdBQ==
X-Google-Smtp-Source: ABdhPJwCn+OeWeV/iO26O8nzNislHX7i4OBCcHceL1mToW9RDigkfNhGDOcVqFECf0aYJDNpB2jKTQ==
X-Received: by 2002:a17:902:7fc9:b0:15b:d408:5b19 with SMTP id
 t9-20020a1709027fc900b0015bd4085b19mr17202289plb.12.1651590752358; 
 Tue, 03 May 2022 08:12:32 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 k21-20020aa792d5000000b0050dc7628159sm6409998pfa.51.2022.05.03.08.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 08:12:31 -0700 (PDT)
Message-ID: <9724000f-6a78-36ad-5a39-1d2b2298a919@linaro.org>
Date: Tue, 3 May 2022 08:12:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 3/4] target/mips: Fix msa checking condition in
 trans_msa_elm_fn()
Content-Language: en-US
To: nihui <shuizhuyuanluo@126.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220503130708.272850-1-shuizhuyuanluo@126.com>
 <20220503130708.272850-3-shuizhuyuanluo@126.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220503130708.272850-3-shuizhuyuanluo@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 5/3/22 06:07, nihui wrote:
> From: Ni Hui <shuizhuyuanluo@126.com>
> 
> Fix issue that condition of check_msa_enabled(ctx) is reversed
> that causes segfault when msa elm_fn op encountered.
> 
> Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
> ---
>   target/mips/tcg/msa_translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
> index aa45bae0aa..92ccc6f921 100644
> --- a/target/mips/tcg/msa_translate.c
> +++ b/target/mips/tcg/msa_translate.c
> @@ -599,7 +599,7 @@ static bool trans_msa_elm_fn(DisasContext *ctx, arg_msa_elm_df *a,
>           return false;
>       }
>   
> -    if (check_msa_enabled(ctx)) {
> +    if (!check_msa_enabled(ctx)) {
>           return true;
>       }
>   

Cc: phil
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

