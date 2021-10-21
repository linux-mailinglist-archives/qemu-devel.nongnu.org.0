Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BBE436E3E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 01:23:42 +0200 (CEST)
Received: from localhost ([::1]:42428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdhPR-0004nc-9G
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 19:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdhNh-0003yE-Hr
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 19:21:53 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:33306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdhNf-0006ch-HL
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 19:21:53 -0400
Received: by mail-pl1-x62c.google.com with SMTP id y4so1513921plb.0
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 16:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q0b1JdeQ33x41iiniT0Tm2v39Lf+hpRl7sLpw46vD/A=;
 b=NaWSod4GXcKaXQX4qzgUfC3UMLNPlErWLFDOs+bkv0vDsnsiN+YqiAF7TFCePu8s1L
 0Lv1O408ipzqRIlFIwOxbNqM0sbNp5pB/11vv8TytQrdoZlZzm3wu1qqn7JtUJuNPWc6
 Sc3lOutXAEdsCy+6TvIEoImv/vnARBfQaydsuYZ8iRztvl1VcbhkUZQKaIdDGg+LM8Br
 3U402bLsdBMdRrHrG3/t+OzHFqeAb8PFOdCUn/rAtFBW+xJpL8FM3URjdbrQQB/v/+/s
 vTwnafWh4hsttB5YVfdXJ5YTzAPbd+8Of6cNCqgJlFQuZ12IN0yclKO5G/sID8IuLEuP
 qkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q0b1JdeQ33x41iiniT0Tm2v39Lf+hpRl7sLpw46vD/A=;
 b=KuwNuRHeRdXTf8VT7pJgg967iMHaPvI/ukwL6IRr6PBDwIhVXGwhq+Xz/+uFwPV6c8
 neAlMcz5oT9vEeaP2qEnf8fKqDtSbtYhZUGTjj5iq8rhrzwp6Ao9t2C/1fyuqmJqzNZc
 XZ4n3BtfE23YXyVmA2Zp7HexHLDKJPI+D4DgVCz+aAS4YuNlVyEK6P87Qx0MWDoQvWDi
 njXjVfH1qa0o3WB7sayXboKOM2GhViPcT6/mxzzYbyYwdQuw4N7tTa4AQFHZqYIlsaQ8
 EtyDdYBBTIQe0wu7V46TiYpVQfEPY1ljY5qZ8NnYddRro9E3mmfkfZfHrWvyGVZZO8po
 6/Jw==
X-Gm-Message-State: AOAM533ygs4p7MN89rkW38u4+R4jbLgioXpzShdjQ15shfneSIH4gfGQ
 s3BXAbK7uYepNtT8P+Do8XiDTA==
X-Google-Smtp-Source: ABdhPJym/Ip0jdS0GJxBdKRXw0TeZFlLt71VoN0SkEEgRedpS4Z5Gg29be6CL3IRI/ns861OFLpKVg==
X-Received: by 2002:a17:90b:224e:: with SMTP id
 hk14mr10139958pjb.224.1634858509811; 
 Thu, 21 Oct 2021 16:21:49 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id mp16sm7337758pjb.1.2021.10.21.16.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 16:21:49 -0700 (PDT)
Subject: Re: [PATCH v3 22/22] target/ppc: Move
 ddedpd[q],denbcd[q],dscli[q],dscri[q] to decodetree
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210910112624.72748-1-luis.pires@eldorado.org.br>
 <20210910112624.72748-23-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9485522b-f285-119d-b6ba-d1f186c49f21@linaro.org>
Date: Thu, 21 Oct 2021 16:21:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910112624.72748-23-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 4:26 AM, Luis Pires wrote:
> -#define GEN_DFP_T_FPR_I32_Rc(name, fprfld, i32fld) \
> -static void gen_##name(DisasContext *ctx)          \
> -{                                                  \
> -    TCGv_ptr rt, rs;                               \
> -    TCGv_i32 i32;                                  \
> -    if (unlikely(!ctx->fpu_enabled)) {             \
> -        gen_exception(ctx, POWERPC_EXCP_FPU);      \
> -        return;                                    \
> -    }                                              \
> -    gen_update_nip(ctx, ctx->base.pc_next - 4);    \

And finally, nip.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

