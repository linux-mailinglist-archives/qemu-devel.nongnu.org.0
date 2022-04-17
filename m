Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25CC504845
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 18:09:24 +0200 (CEST)
Received: from localhost ([::1]:48302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng7Sl-00061m-Uc
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 12:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng7Pr-0001LG-Rf
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:06:23 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:43829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng7Pp-00067R-KO
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:06:23 -0400
Received: by mail-pg1-x52b.google.com with SMTP id u2so14734598pgq.10
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 09:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MOMeh72lHCHph1q4m5NNFvmJMGtTDsZHH3QUcf5diWg=;
 b=fJ4WiguNP6RA4jH/oU4aBDoFalWIciwnvsAXjAvqY4kf+jUVYkXCmWJGy8Bq6yzVCi
 0ElUZBZpaVBOpsQV+Ts92FuTNrWKALGpQLc3jbwACfAJ6BGjf7dfU4psLt+JQUJ0PROg
 WVA66J53+o4RzGymbOQEfMmnNthpP8I2Amw5aikmLukFGpug+l9hIwSFrUAqYh3n4F7e
 GVw36UxlWok1Lak6U4gwg9EVrgm5NFhuUSgEeCFZ4JcjE+7qIOj+yDLpYtYUlDFn+Gs6
 gl9QNplrnVh7G0W1Npp+/AqTFVO5bmUULt4QVubM7UDd3fZn51CYahZy6eG5Pq6cywDQ
 76uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MOMeh72lHCHph1q4m5NNFvmJMGtTDsZHH3QUcf5diWg=;
 b=cRmQXPyT17smxg7UzUrKp+iQ84+xylw1lvUzaK0av6sZ/EmFeNt0CykBcw0igKAneb
 KrTFi9NmkvHg7v4lxaEcpupGZpelbXhRIts/zk3D1PGW/4Oj0h/8Sa4/ekYbZib1gqbQ
 FtDx1ViqQ4O5Xp3yUry6LdFChdFDPBJ+Xj+QGFoDFi1ATf3ymb1yu7Y4fLVtBMQfuR/b
 t4g6M6ShbFj/4AgF6zUpUkS3wgT38nidhycy1wNgxSKSnxx6LgRYFFDRWK1c3hlS9idO
 oEeO+1rAS9CYpH2a9n2XaBZugCPOAe7gVebwTm35GOaaCAipdljzSFKpQf8dNxyYiTlX
 Kz7g==
X-Gm-Message-State: AOAM530ou5fRv0ZVUCZleECqkGbuGlO4TLFTfNbGAae/LETN1kfL+ltc
 mklHe3oyhVwSJCFp4W1K6PnnRleyGl7G+A==
X-Google-Smtp-Source: ABdhPJyYuCvhMacnXpm4M2+I3SLJ74PTncYrz68B5Wo2LWpKC4+xO8s4aB5HHVHmLuN/0lKQ3VRCiw==
X-Received: by 2002:a63:64c5:0:b0:3a8:99ec:e027 with SMTP id
 y188-20020a6364c5000000b003a899ece027mr4056469pgb.34.1650211580446; 
 Sun, 17 Apr 2022 09:06:20 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 p8-20020aa78608000000b005082c3cbfd2sm9040542pfn.218.2022.04.17.09.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 09:06:19 -0700 (PDT)
Message-ID: <09609f99-dce7-5acc-062a-a55b161c0412@linaro.org>
Date: Sun, 17 Apr 2022 09:06:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/rx: update PC correctly in wait instruction
Content-Language: en-US
To: Tomoaki Kawada <i@yvt.jp>, qemu-devel@nongnu.org
References: <20220417060224.2131788-1-i@yvt.jp>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220417060224.2131788-1-i@yvt.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/22 23:02, Tomoaki Kawada wrote:
> `cpu_pc` at this point does not necessary point to the current
> instruction (i.e., the wait instruction being translated), so it's
> incorrect to calculate the new value of `cpu_pc` based on this. It must
> be updated with `ctx->base.pc_next`, which contains the correct address
> of the next instruction.
> 
> This change fixes the wait instruction skipping the subsequent branch
> when used in an idle loop like this:
> 
>      0:  wait
>          bra.b 0b
>          brk   // should be unreachable
> 
> Signed-off-by: Tomoaki Kawada <i@yvt.jp>
> ---
>   target/rx/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/rx/translate.c b/target/rx/translate.c
> index 5db8f79a82..f8812e7a6c 100644
> --- a/target/rx/translate.c
> +++ b/target/rx/translate.c
> @@ -2281,7 +2281,7 @@ static bool trans_INT(DisasContext *ctx, arg_INT *a)
>   static bool trans_WAIT(DisasContext *ctx, arg_WAIT *a)
>   {
>       if (is_privileged(ctx, 1)) {
> -        tcg_gen_addi_i32(cpu_pc, cpu_pc, 2);
> +        tcg_gen_movi_i32(cpu_pc, ctx->base.pc_next);
>           gen_helper_wait(cpu_env);
>       }
>       return true;

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

