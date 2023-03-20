Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5975A6C239E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 22:25:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peMzD-0005ho-Fj; Mon, 20 Mar 2023 17:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peMzB-0005fu-OL
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:24:09 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peMz9-0006Xa-V8
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 17:24:09 -0400
Received: by mail-ed1-x52a.google.com with SMTP id y4so52332312edo.2
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 14:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679347446;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IR9OnkqgnchVMwpa13nZoDBAqts2wB6MQfZMLqeXw3E=;
 b=Xgz1xvxO/63UC3dKMDjbYTOkCjk1hRsvDZaum0dNnlvKToEIqR07SrdKKbY1wiANdm
 kK6Tk+nhl1/gZMcMDTTkdDac6tED0dthFlifE3OmzfdmfQ3VfplRje76x8qcI8aAfa0g
 ss2PiGVF6DZwy3Z1aOUJnoqN8HMYZLXa5V78OZ9QVVL2pYQUBBbll1s264tMYXzph7HS
 l8oCTZCoSNYrdvrwoG/FlmSmuUhSjN0ihkAw2o8zaHucf7tG2g2rfhgBXMkfXK0qUdAw
 o5H/CrH/kyIZ+cbFBK40xva+5tPMusOWW8ifOJaqBym9yu4dZBH87Jze/gNZkV1ss2AG
 TxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679347446;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IR9OnkqgnchVMwpa13nZoDBAqts2wB6MQfZMLqeXw3E=;
 b=7WyrTLCYF5jGMTnb2eY0cVwEVYNcsaG0Ylw37Ub2o3hItREi4qHzF/lTTZKRBUVD+r
 wYYKTKIoraA7xjMWWFQCJfDbtB/vUAKU+qDRNG1UgwE98K0VAIa0OAIrC53rw685ZeJ6
 YgxLUpQKr4DastRZQBiWKRKnCIYyVyfyxaDpsJWQ4quxJ5W4gitGPjwooN1vOQqKHCti
 zHOT6HrmMb6Okh9Kv4SbNEjfGixJJ/o6vDSU00QGqQy8n8TsajVP0MaFb6+MAFaFriRf
 xf42hRtcCgGH1F2zmoXfpiAzRIf5myfLY1ro4u0bZWQ6q49xrTvSBe72NIKwNin6+YeF
 GZxA==
X-Gm-Message-State: AO0yUKWyNkYv2jDjB9RuIMpEQ2oDMOmwJJUidrCsM2DnbMniGC0j4zuN
 xEH50mU/+5/wYoOZxcmHW41yxw==
X-Google-Smtp-Source: AK7set/PmXP+tpq7MtR+dS0wqKa8XnbSyAo3JMsG/N/gRamWIpbn3VBX9j1w4bH+9mZ/SlU76FfBbA==
X-Received: by 2002:aa7:da0a:0:b0:501:cced:9c6c with SMTP id
 r10-20020aa7da0a000000b00501cced9c6cmr979685eds.7.1679347446292; 
 Mon, 20 Mar 2023 14:24:06 -0700 (PDT)
Received: from [192.168.69.115] (did75-h03-176-184-22-219.dsl.sta.abo.bbox.fr.
 [176.184.22.219]) by smtp.gmail.com with ESMTPSA id
 u5-20020a50d505000000b004c09f0ba24dsm5400779edi.48.2023.03.20.14.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 14:24:05 -0700 (PDT)
Message-ID: <4e496c07-4783-bec1-de21-e22f89d38287@linaro.org>
Date: Mon, 20 Mar 2023 22:24:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/9] linux-user: Diagnose misaligned -R size
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Laurent Vivier <laurent@vivier.eu>
References: <20230317155455.341843-1-richard.henderson@linaro.org>
 <20230317155455.341843-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230317155455.341843-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 17/3/23 16:54, Richard Henderson wrote:
> We have been enforcing host page alignment for the non-R
> fallback of MAX_RESERVED_VA, but failing to enforce for -R.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/main.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 4b18461969..39d9bd4d7a 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -793,6 +793,12 @@ int main(int argc, char **argv, char **envp)
>        */
>       max_reserved_va = MAX_RESERVED_VA(cpu);
>       if (reserved_va != 0) {
> +        if (reserved_va % qemu_host_page_size) {
> +            char *s = size_to_str(qemu_host_page_size);
> +            fprintf(stderr, "Reserved virtual address not aligned mod %s\n", s);
> +            g_free(s);
> +            exit(EXIT_FAILURE);
> +        }
>           if (max_reserved_va && reserved_va > max_reserved_va) {
>               fprintf(stderr, "Reserved virtual address too big\n");
>               exit(EXIT_FAILURE);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


