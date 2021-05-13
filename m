Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833D837F64B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 13:04:00 +0200 (CEST)
Received: from localhost ([::1]:54062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh98J-0001aK-If
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 07:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lh95p-0007LX-5B
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:01:25 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:38794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lh95n-0002XK-KI
 for qemu-devel@nongnu.org; Thu, 13 May 2021 07:01:24 -0400
Received: by mail-qk1-x731.google.com with SMTP id q10so20868775qkc.5
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 04:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DLiMNuUtHCCdbqoGWn8He5hUuoScUef3oiTiohIFmGU=;
 b=kg8YrmrKc+6yXX7FWCXV0j8dk7LVBkYpILfaa2RQ2XAiOUQuSD/BAYx8iPuVjA9pbW
 D8fgsP0JVsYuhxuAbQ5FyEc88EQkkvQ3rBo7XwVsOdcCALMOoXHx3IFpwegg3y5qiXMu
 E/mQ3BQqyME3uYWXJ6RI+EobTOO1SLG5R6p6YZYYB+80jLVQPMOOlwhsuLSYOxo20tEN
 zA10eXYw8xhfqjB6G3iBfwMsqM1kRY7bo9QDv0L+tRR8/WRNPN5WNE6ItPAPWGuCShfT
 vksPVHZZOzbDqEM7Bgy+kvL04EzbfekOvsK8g10qefX8j6+BGO8SACht6wWrPesOztlg
 Kb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DLiMNuUtHCCdbqoGWn8He5hUuoScUef3oiTiohIFmGU=;
 b=fuA1U89OeRKfw8Nf0vd0O9rXAjzJDiSWFcDfIwrtwUJR0/T+njgnPqkT8VoaLWtUIj
 zkjfcjW/cfAIQ77OzYNgz8PiUwXU+C7AStPgxuDHTx99kSnNzXzIKxYTQcAiz17QIzxm
 g6vmEuyNosHlswNmtIRMU7mp0PcSrsdKg22XgXeFtF2iRKzbarDuATgLpe8SqC6NVban
 cnm4Xs3q6XvoI9d7hYMMhHpj5sQHmKuM8lErMM9I6zOUgMWlVn/BcycNbWwaxkBfd3Sj
 fh+TXKEpM7jzqyYKAVLvM9o8OmfpOuQuz0euZN6HjnGGicbmqVAETP17HFkVU+HgcmlW
 us8Q==
X-Gm-Message-State: AOAM533DS81vTGEP69nAhbkS5qqk9h+LDc/wU0NBD0OoWzELuuggqfrB
 UaZiqXRQTdcU/EWtKTn6NN39uQ==
X-Google-Smtp-Source: ABdhPJx47oJU8ME9TJTftKOMwjGJdJZeSn5PBQAiA5BMGgtRlNSi0AJzRBacHEifRXN918j+WfctNg==
X-Received: by 2002:a05:620a:13a8:: with SMTP id
 m8mr27541498qki.213.1620903682480; 
 Thu, 13 May 2021 04:01:22 -0700 (PDT)
Received: from [192.168.183.155] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id x13sm1993241qtj.12.2021.05.13.04.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 04:01:22 -0700 (PDT)
Subject: Re: [PATCH v4 28/31] target/ppc: Implement setbc/setbcr/stnbc/setnbcr
 instructions
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20210512185441.3619828-1-matheus.ferst@eldorado.org.br>
 <20210512185441.3619828-29-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cdee71b3-12fc-cdc2-f9ac-a132789b698a@linaro.org>
Date: Thu, 13 May 2021 06:01:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512185441.3619828-29-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 luis.pires@eldorado.org.br, f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 1:54 PM, matheus.ferst@eldorado.org.br wrote:
> +static bool do_set_bool_cond(DisasContext *ctx, arg_X_bi *a, bool neg, bool rev)
> +{
> +    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
> +    uint32_t mask = 0x08 >> (a->bi & 0x03);
> +    TCGv temp = tcg_temp_new();
> +
> +    tcg_gen_extu_i32_tl(temp, cpu_crf[a->bi >> 2]);
> +    tcg_gen_andi_tl(temp, temp, mask);
> +    tcg_gen_movcond_tl(a->r?TCG_COND_EQ:TCG_COND_NE, cpu_gpr[a->rt], temp,
> +                       tcg_constant_tl(0), tcg_constant_tl(a->n?-1:1),
> +                       tcg_constant_tl(0));

Mind the spacing around ?:.

Did you forget to update a->r and a->n to "neg" and "rev"?
It sure looks like this doesn't compile...

I guess this is fine with movcond, but perhaps slightly better with

   tcg_gen_setcondi_tl(cond, rt, temp, 0);
   if (neg) {
     tcg_gen_neg_tl(rt, rt);
   }

TCG isn't the most optimizing of compilers...


r~

