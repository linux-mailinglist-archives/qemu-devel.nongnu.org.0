Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F086504844
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 18:08:11 +0200 (CEST)
Received: from localhost ([::1]:43648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng7Ra-0002uo-6g
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 12:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng7M7-0005GW-6e
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:02:31 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng7M5-0005ba-JB
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 12:02:30 -0400
Received: by mail-pg1-x533.google.com with SMTP id r66so14746848pgr.3
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 09:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OP33rEbON860K6v+eAsELzjWb4fcE3CrwYdguaxxrR8=;
 b=xPmdMZ2t5sqHHftlCJC209Ot4mWnYY/B+40ZILGdrSq2FyfW5H+onWK0MphQxwSpSW
 0lY7wFcpevl6CaPnQijaY05EhCnQHXRimhWb/uKbL/Nqb4k3NygGSas7U14o/2kQFKtX
 gYEvTDqwy6I48cqpsw8VWXJ8zeW0inCFXTQv7J/HxjRnvmgfyY4tfyNwFDEsHbPgssnc
 lv47FvWqI7GYhY16E9VTRFQZU6Nr6/8KLOmLytBVmdDNi5qB0ThHwpAFVvgV41Yp43+l
 6XweFspa5ZRVRutRLTnyF1s5rmRJFfgwZpSMp5DMsh6M9G0K5XbJiJFBwGrrzIbt+V0c
 ACCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OP33rEbON860K6v+eAsELzjWb4fcE3CrwYdguaxxrR8=;
 b=ZAa0yD2CueKQ4Woz8SiVhQr+ADnstcTP5Jjo1Q8nP6W96MaGlLR8jE4kS0qJ6oorI/
 24YqDYqwPr/6xIZ3Y6GeCrmLJBuhFLOU2qWN0MRmDDByS3fBjUonDB6RN9fRkWSJE72S
 +N3tzvONTUsmehZZkM3mhYHqhM3CbGMDONjwR7bIqUtKCUOrIMgJgLpuBmxOsAeuqGfB
 v7coha3exSDRG0atyAzj2S0WG77TVDXJoyLqAnBiz8lTQikUO7S6cLGh/5Ym+uNBXRQK
 NluB2VBdY0IF45AtXODeJbuJWLPYCHVcsXdkTE1sBXbnySTL8WbfdombvisFlbxoAWpQ
 aJfA==
X-Gm-Message-State: AOAM5327EwG5S3K0rIwXV8VuMEITeLOZftspZh46c1LW+d1Ma5jnOUQB
 khq9gKxUFAcRVWALp1NuwkRksQ==
X-Google-Smtp-Source: ABdhPJwDQ4V0nlvNy88g8g5ffMqQGQV8VD4jL8+qsOJ641F6i/uCAIOxiWN1J5xoZrhPMRFKGxsUtw==
X-Received: by 2002:a05:6a00:1505:b0:50a:641f:c688 with SMTP id
 q5-20020a056a00150500b0050a641fc688mr3878031pfu.86.1650211348293; 
 Sun, 17 Apr 2022 09:02:28 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 81-20020a621754000000b005082073f62dsm9592511pfx.12.2022.04.17.09.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 09:02:27 -0700 (PDT)
Message-ID: <12215971-fe78-85af-1972-88c28c8a3c29@linaro.org>
Date: Sun, 17 Apr 2022 09:02:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/rx: set PSW.I when executing wait instruction
Content-Language: en-US
To: Tomoaki Kawada <i@yvt.jp>, qemu-devel@nongnu.org
References: <20220417045937.2128699-1-i@yvt.jp>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220417045937.2128699-1-i@yvt.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

On 4/16/22 21:59, Tomoaki Kawada wrote:
> This patch fixes the implementation of the wait instruction to
> implicitly update PSW.I as required by the ISA specification.
> 
> Signed-off-by: Tomoaki Kawada <i@yvt.jp>
> ---
>   target/rx/op_helper.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
> index 11f952d340..81645adde3 100644
> --- a/target/rx/op_helper.c
> +++ b/target/rx/op_helper.c
> @@ -448,6 +448,7 @@ void QEMU_NORETURN helper_wait(CPURXState *env)
>   
>       cs->halted = 1;
>       env->in_sleep = 1;
> +    env->psw_i = 1;
>       raise_exception(env, EXCP_HLT, 0);
>   }
>   

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

