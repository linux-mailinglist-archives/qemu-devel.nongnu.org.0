Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C56518818
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 17:15:23 +0200 (CEST)
Received: from localhost ([::1]:48130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nluFG-0006Fc-5i
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 11:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nluC7-0002em-9B
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:12:08 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:39909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nluC5-00011h-Ld
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:12:07 -0400
Received: by mail-pl1-x635.google.com with SMTP id x18so4033210plg.6
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 08:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=KOpuE9VkyzPE7dEooqz6WEbj+SokxmZjPl7mIO8mAAk=;
 b=DMeo0TGSK1xoLvt2y0uXocEnmlu/tuSFhUshzm69jH3QP8rIGQOUZx/7AEl0LEFNnW
 lIoH0bfvIzL7lUyAQQytQA6cCJEMp2NmcTAZzvhVvgH17q79rxH1uC0pkmrweImESdnj
 2fzrciVPoXHDftSu9UJwDh81Ag9yqLaDNJePcbJNso/lMfzKUhruF+XXTKud2EdMm5kF
 Dfi1EoWaDfvnm8TaUTvD9QHgaU+WPGyw34ezkVfXqAYTdiH4B/rm0UaxrCV82aORKwW4
 kY+0aDO5X5i/5OnV1vJmUtfVu9sxWWZ7ayP+rkR9ClAVVweLNS5nYoF8JY4+qajFRn/u
 TrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KOpuE9VkyzPE7dEooqz6WEbj+SokxmZjPl7mIO8mAAk=;
 b=0KXQQGNFCSMOyz6pBqHVk51SuwYlAWIXolLopAGcQIFuu4Zq2wo3K7hFJMVoscxqs/
 Z2xfFMDdRcOWxDDNO2H8ZOE2Fzui2WbdJjkcNvvl313ocwhylH0oHSyf4wlFkPArNO3t
 q1BLQR1Zx3CJcH3wCkdZTmwiQ/1PNOZztB6t1odfALF0vhe8IkLBsjUdwuA1ORtlgWzv
 /cXIRkjEiiwbqhn6d7x5BQH08/L4KU7Lz8KvaZrIgrmLNahAGBc/OKjdM+gqPEQ7bBVA
 BIu/i8f4KhgdBtbH1yuSvpiq4XcvTlfyEL7PiRFFWjsiI6fIddfLHqyzmFkgSz9u1rOm
 T/JA==
X-Gm-Message-State: AOAM531BQJzKHWXhPiM3idk5ZE+ou0coe8rV5FR4ka2QMtx6qP9Kje0P
 8xuU/HB8MFdd4MwgJn2dt6QXxw==
X-Google-Smtp-Source: ABdhPJyIso3iAQWVFqSr7edfXVdprWVoq3JjUb2kMD+8VKvdZolWnSKFphGgeQIY+LZTompF7Od/2A==
X-Received: by 2002:a17:90b:17c9:b0:1da:4359:768b with SMTP id
 me9-20020a17090b17c900b001da4359768bmr5295093pjb.22.1651590724298; 
 Tue, 03 May 2022 08:12:04 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a1709027c8100b0015e8d4eb29bsm6490041pll.229.2022.05.03.08.12.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 08:12:03 -0700 (PDT)
Message-ID: <4863f69d-0713-6d05-9703-8882ecbb2bfc@linaro.org>
Date: Tue, 3 May 2022 08:12:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/4] target/mips: Fix df_extract_val() and df_extract_df()
 dfe lookup
Content-Language: en-US
To: nihui <shuizhuyuanluo@126.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220503130708.272850-1-shuizhuyuanluo@126.com>
 <20220503130708.272850-2-shuizhuyuanluo@126.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220503130708.272850-2-shuizhuyuanluo@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
> Actually look into dfe structure data so that df_extract_val() and
> df_extract_df() can return immediate and datafield other than BYTE.
> 
> Signed-off-by: Ni Hui <shuizhuyuanluo@126.com>
> ---
>   target/mips/tcg/msa_translate.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
> index 76307102f2..aa45bae0aa 100644
> --- a/target/mips/tcg/msa_translate.c
> +++ b/target/mips/tcg/msa_translate.c
> @@ -68,8 +68,8 @@ struct dfe {
>   static int df_extract_val(DisasContext *ctx, int x, const struct dfe *s)
>   {
>       for (unsigned i = 0; i < 4; i++) {
> -        if (extract32(x, s->start, s->length) == s->mask) {
> -            return extract32(x, 0, s->start);
> +        if (extract32(x, s[i].start, s[i].length) == s[i].mask) {
> +            return extract32(x, 0, s[i].start);
>           }
>       }
>       return -1;
> @@ -82,7 +82,7 @@ static int df_extract_val(DisasContext *ctx, int x, const struct dfe *s)
>   static int df_extract_df(DisasContext *ctx, int x, const struct dfe *s)
>   {
>       for (unsigned i = 0; i < 4; i++) {
> -        if (extract32(x, s->start, s->length) == s->mask) {
> +        if (extract32(x, s[i].start, s[i].length) == s[i].mask) {
>               return i;
>           }
>       }

Cc: phil
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

