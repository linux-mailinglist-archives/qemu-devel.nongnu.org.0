Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323CD510F1F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 05:02:47 +0200 (CEST)
Received: from localhost ([::1]:40514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njXx0-0001za-B2
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 23:02:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njXuw-0000TH-NK
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 23:00:41 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:35838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njXuv-00025m-3d
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 23:00:38 -0400
Received: by mail-pf1-x429.google.com with SMTP id t13so474758pfg.2
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 20:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=v8vfH2+sSa7cYvs9NgXUXrNlEqqShF24xWfdW5jOHjw=;
 b=y84l8dK5wPxNzyNgX3rdUblsZyCzGGy9iSqiUMJXcnPLRs3tS4GQ9w8KQYq744KNj6
 d1YOiLaOqO+aFATb25wWuin8vQBOXzjDXkOtbCA7sbrY3CUcQKlZhAHABkBmbsrSJ3wY
 bn+gaU3X7eQBJbyz7NIvU8M/3AuT52N5SaEQFFrKWCVe59x+n6pTI8DcfndzXLZGO6jm
 DmzfbSTHuTBkFJR5L46X6aVr0DzvkenqjEC6nUUu1ukIJq8EsWhW75fS9Ngn1EM9XbzD
 dNK8nJKrUTp70Jjr8ai1lneOSpnLnSIvzKM/VbtFJTF0kL22nRdB/3KjfapvY03Otpk3
 eZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=v8vfH2+sSa7cYvs9NgXUXrNlEqqShF24xWfdW5jOHjw=;
 b=R31WKqVHK2CoZZi2jSM0lfOdZwe1ytQyV2WfolTnqhf+8P6UDBNDo1G5FkdDda0XoP
 +menIAjXUYIxi30sUvZWhQamGY0y1UBmnV5aaUZNaXX8znF0riXJL0nTw24g8TbJJj7l
 lF8YF/5JNb+cdWTPo4YcZ8qW8NOsnen40dgeNwPMKEeSHRwItLSSn7nO2uS+cLM5MPQ8
 OD3nam7DBcq3JcxGFWLF49wtms049zRJfYWSaAyVzSPhA7g+wvFm5YBavlQhANCfsOF+
 p/eqMjzMZiJ1mpLfV9vbU8v/0YWOkS8tM3bNTXbidirzCKBUqBWIbGWdptZnTDSHzzsX
 7kLA==
X-Gm-Message-State: AOAM5309hU+p+Du4CMOWxFhNp90TMQ7yIT3VHm44ra+Q4pdoXilYXKZt
 N/idM96HkWZwbcQnQaCbJ7Z+9WESC0Utug==
X-Google-Smtp-Source: ABdhPJxgvgJ9Ici/nlHq8TI1ecQs879HljZEw5gGYzLXkw8p3PI5g028H32Y30PtcfSZGhOhf7eIBg==
X-Received: by 2002:a05:6a00:22d4:b0:50a:8540:431f with SMTP id
 f20-20020a056a0022d400b0050a8540431fmr27877992pfj.54.1651028435169; 
 Tue, 26 Apr 2022 20:00:35 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a056a00224c00b0050d35bf35bfsm10199032pfu.101.2022.04.26.20.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 20:00:34 -0700 (PDT)
Message-ID: <d217b147-2390-63c8-faaf-993f7d7c68dc@linaro.org>
Date: Tue, 26 Apr 2022 20:00:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/s390x: Fix the accumulation of ccm in op_icm
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220401193659.332079-1-richard.henderson@linaro.org>
In-Reply-To: <20220401193659.332079-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: qemu-s390x@nongnu.org, cohuck@redhat.com, thuth@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/22 12:36, Richard Henderson wrote:
> Coverity rightly reports that 0xff << pos can overflow.
> This would affect the ICMH instruction.
> 
> Fixes: Coverity CID 1487161
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 5acfc0ff9b..ea7baf0832 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -2622,7 +2622,7 @@ static DisasJumpType op_icm(DisasContext *s, DisasOps *o)
>                   tcg_gen_qemu_ld8u(tmp, o->in2, get_mem_index(s));
>                   tcg_gen_addi_i64(o->in2, o->in2, 1);
>                   tcg_gen_deposit_i64(o->out, o->out, tmp, pos, 8);
> -                ccm |= 0xff << pos;
> +                ccm |= 0xffull << pos;
>               }
>               m3 = (m3 << 1) & 0xf;
>               pos -= 8;

Queuing to tcg-next.


r~

