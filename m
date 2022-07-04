Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD855651B2
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 12:06:44 +0200 (CEST)
Received: from localhost ([::1]:42320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8IyZ-0007Q6-Qm
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 06:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Iwt-0005yK-Ao
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:04:59 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:35626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Iwr-0001HG-Sn
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:04:59 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so2858074pjn.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Y2UdUSLsrWZRupU3Wg8brz+hYQL1lV6lQs/rPmy49Yc=;
 b=rRUmS78cGBqe2OprnH7Legf3kUSa2LkbMa3RXYJlDSLj1AGI5xCRn5DDqWyb6NR2Fz
 q4idxeRFcE+BSdDIA5hpqYz+yaTHJT8CWUH9OM3eOe2rowUGhWWT523d8drsJCeBG/tc
 Rh4e1ZWnUTM5j8keGNCjqEwyDLMD6pyiHqsu8RT404TNtr5bo2G8yUVNSrMYRd3uK0Po
 THpca3aantqWfd3NS/H3F0jYSReAX5wRjCc46BDcU0Zcn+oZrffp3IW8+RcnJ08LZ7W/
 WFV5dnk8zmelrlUMpPtSD8BWmp+34EU/OOPMk1bxMp+aMIRUqJUtsEIa0X83zXl+dYbz
 jQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y2UdUSLsrWZRupU3Wg8brz+hYQL1lV6lQs/rPmy49Yc=;
 b=CKxoxGDxlgiMcIMCupnngMWxDqu6SJMnb58eZ+ubFo9jYMcZy8e/LAQAKWiF17vMUA
 AeTtCStMWxZZtq57PC2u0KxB4NdIWHlFypFD1mjpYD4ir0UVMdZPBGNuRlFIgmH+rity
 00Nttqh//sWZ6oPsH1qcPC+XVqeMqQqV8dWUoDKHtENufo2prR/2ZQKe/mSMRpUigvuI
 Ann1pvS7MOmiav4jdi7VEeMYIIplk4tsCl5RCONWKHocHxsk5YkNq/yeF4zaH8cQKzwZ
 S+txQKVrg+uSJY2zA/s88WAe8/3k0eRL8m0LFtCF4CgoEwU0dKE1CQtDCwr7fwHy4iw/
 E8Eg==
X-Gm-Message-State: AJIora9h2VwXos7ZSbiVCmH27zNWWf+OPWhpcFad6citsQgT81m2gO5J
 UiEvUwDq8Hd3uXrhpHx03lg7q421s7eEob9W
X-Google-Smtp-Source: AGRyM1ueMpQnDlOZuFGfNvjlMipzfsSyp0NnDoXHepwjv8r3jtIl7Ltnhvmw1wd4FL+fdOVEToHUjA==
X-Received: by 2002:a17:90b:4ac6:b0:1ed:1811:5009 with SMTP id
 mh6-20020a17090b4ac600b001ed18115009mr35821354pjb.47.1656929096570; 
 Mon, 04 Jul 2022 03:04:56 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 w17-20020aa78591000000b0051b9ac5a377sm20618763pfn.213.2022.07.04.03.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 03:04:56 -0700 (PDT)
Message-ID: <4bfc20ec-962b-2017-f2ba-26cd65bd3d9f@linaro.org>
Date: Mon, 4 Jul 2022 15:34:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 07/11] target/openrisc: Add interrupted CPU to log
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-8-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220703212823.10067-8-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 7/4/22 02:58, Stafford Horne wrote:
> When we are tracing it's helpful to know which CPU's are getting
> interrupted, att that detail to the log line.

"at".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> 
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
>   target/openrisc/interrupt.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
> index e5724f5371..c31c6f12c4 100644
> --- a/target/openrisc/interrupt.c
> +++ b/target/openrisc/interrupt.c
> @@ -83,7 +83,9 @@ void openrisc_cpu_do_interrupt(CPUState *cs)
>               [EXCP_TRAP]     = "TRAP",
>           };
>   
> -        qemu_log_mask(CPU_LOG_INT, "INT: %s\n", int_name[exception]);
> +        qemu_log_mask(CPU_LOG_INT, "CPU: %d INT: %s\n",
> +                      cs->cpu_index,
> +                      int_name[exception]);
>   
>           hwaddr vect_pc = exception << 8;
>           if (env->cpucfgr & CPUCFGR_EVBARP) {


