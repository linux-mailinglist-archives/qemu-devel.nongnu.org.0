Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F76839C489
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 02:39:21 +0200 (CEST)
Received: from localhost ([::1]:48836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpKLQ-0007n9-LN
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 20:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpKID-0002aw-4t
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 20:36:01 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:36500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpKIB-0001YB-Fh
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 20:36:00 -0400
Received: by mail-pf1-x432.google.com with SMTP id c12so8645193pfl.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 17:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SqPhAJBRJ6ATK59JwkbRw9lZ89UVO+JgBVjp92QtGMs=;
 b=cAy25sD5b4hUXBEKmrB+s9xGMJ8gocdNUWKTaExhkhNmegReiFpEWFPG+D/+Sq8H3t
 KrSObsnXvmC3yg789/dF9HlvTLlLwb/hdnh1VaSCx3P56RXceP5uPYtcgnSIjp95j6fM
 7yCa4NkOhSi/+P9sewtDPbtbArEg+O1gOvs2KJaO60BzpBkETLHCI/VWCZbBqdAWUu7E
 9tJUFnLVFwRy3azWIEivVYC+9/LJ38tDZM++xepl3nj+ezueknpG2fS2tWp+IXP6fQmf
 WirsicaGLf60AUeGWOkdTui0fy1o/9KQf/qC84VIyA7saZAEbMdMKtY954DP4qHS61dG
 9Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SqPhAJBRJ6ATK59JwkbRw9lZ89UVO+JgBVjp92QtGMs=;
 b=OyKGYiIhsUrZP8/4LczFW/L5A67Z2g/2d0H+Gi270u3ww13ECnXsmv2HLtxgv5KIIy
 rn0c+YFhFE/Gj2npvVaEPI24uIKMWWWbmVHOcLnNjodZkARxwS+obfmDlhpK9Lb81f9S
 X6PBrEBwK+hdc7ls9VIdo8bLef/NO1t/ZSxxe0t+4TuS690IntGyZxQNf0NRVU0ujQj6
 jUnF0fR5Zzb4BHb8TnfGehaMiB/VyGf8Wh++4On65InM/3F0H3LPnI+IVPAuHpmt/mE/
 rZv4dx4TjHmAu5OQJrldfBugUybUAjPGkDioDXlWu7qUbyQ6wuA+X5bne8OzLy6bbfjp
 8Wcw==
X-Gm-Message-State: AOAM532yzhZrz0j8pffGzknsyr5n3osl8dtQyVdKnhzH5XO0uD5GsCDN
 mODtq5E0uOhjjKObnyP0UsX2eA==
X-Google-Smtp-Source: ABdhPJzCpDBNHdsbBsWbKFqpufpic+6j22aIAbwwof67mU7A+V9fqio7BDmwiOafsPAUHMLf5HAljg==
X-Received: by 2002:a62:92c7:0:b029:2de:61c9:fc2 with SMTP id
 o190-20020a6292c70000b02902de61c90fc2mr7346455pfd.70.1622853358043; 
 Fri, 04 Jun 2021 17:35:58 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 22sm1888742pfo.80.2021.06.04.17.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 17:35:57 -0700 (PDT)
Subject: Re: [PATCH v16 48/99] target/arm: remove now useless ifndef from
 fp_exception_el
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-49-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <490a4032-2dcb-2bec-3eb9-93d6d4bcea2b@linaro.org>
Date: Fri, 4 Jun 2021 17:35:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-49-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> after moving the code of fp_exception_el to a sysemu-only module,
> we can remove the #ifndef CONFIG_USER_ONLY.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/cpu-sysemu.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
> index 128616d90d..0d80a0161c 100644
> --- a/target/arm/cpu-sysemu.c
> +++ b/target/arm/cpu-sysemu.c
> @@ -417,7 +417,6 @@ int sve_exception_el(CPUARMState *env, int el)
>    */
>   int fp_exception_el(CPUARMState *env, int cur_el)
>   {
> -#ifndef CONFIG_USER_ONLY
>       /*
>        * CPACR and the CPTR registers don't exist before v6, so FP is
>        * always accessible
> @@ -507,6 +506,5 @@ int fp_exception_el(CPUARMState *env, int cur_el)
>           /* Trap all FP ops to EL3 */
>           return 3;
>       }
> -#endif
>       return 0;
>   }

Ah, squash with previous.  Just like was done in patch 45 with sve_exception_el 
while moving.


r~

