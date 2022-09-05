Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 753275AD91D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 20:36:48 +0200 (CEST)
Received: from localhost ([::1]:37050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVGxh-00084Q-UM
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 14:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGnz-0006VT-Fn; Mon, 05 Sep 2022 14:26:43 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30]:41936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVGnu-0002gR-Jb; Mon, 05 Sep 2022 14:26:43 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 t15-20020a4a96cf000000b0044e0142ec24so1591973ooi.8; 
 Mon, 05 Sep 2022 11:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=jbsp+Mhctknq04JyBAQ3iUltyVzatftXQ9uDl0yZSCc=;
 b=WwGvvX3Yhdw5/OZx9u7DGpUMWkOSVDIcUrXhA0LJsz9Sz4v2vZ6hC9hgVwp1eDvQBd
 P2CLT7plxMCbiWufMC7uM9gfcTdh3e9Z57iYDaTESNJf2C3hXSXUxa8mY/KbVQAvpZQf
 44rvXiwFo+uND5PDlODl9reBVB05MiI2C2lvmS4Jq4tDhNkg4hkLFZwFBOaY4k3gJByA
 8m5aaREBF/dIr05ak4WtN8QRHuxfEx3p8QN4t/uxrt1V3S0dzfUV7XzecIl15IWiZc0V
 YFbX0uEqfgWXOoa++HB95xIhIH8Ujm9aY01cQRDdHOyiQsn2OyephfHMZ0Jg0Ev4gIOd
 P4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=jbsp+Mhctknq04JyBAQ3iUltyVzatftXQ9uDl0yZSCc=;
 b=IjxGrbAxp5iNDh9W9v2mtRXLvOoiyaz1uC2YyleNBqdFFiPU5izvZbKjCGqQI1Z/O0
 OgdG/SXQrmOW3/3mpljnpIPWvCX5Me2KSidPYZO/fjRh+VaCihC+5fcakR7JfkjTYg72
 d3Dt9oJzBX6KFkvSEfSOvCx8PwomGmqC0HPfiDwRJ45xmUPDKPyQMyIEdJs2AdovWtIX
 tkLZ+j4fQyXPBB61930cQmqy9bXK29Fd8LoXfMkOT8mPepuhxq0B6PwBp55KIAY3TVvq
 dCBn5BBVJhp+fabA6lyLN6bp8vlBnB4t2XH1tTYlKbliyUAbyXA6w62DI9RMUtsqzmoL
 tj4A==
X-Gm-Message-State: ACgBeo1YiJWC1sdmj0hAp6M3Rmy3E/dFpNxIIy1FoRL6M2YnuEClA//J
 cBHnyoscK7lbaan3zcIdezE=
X-Google-Smtp-Source: AA6agR6qXxrGYYnLLOdbwfpQ07lMA/I71X+n1p7MyBtWgi4KG8g/I0DseCNI64VYoiiiI5J0K3WX7w==
X-Received: by 2002:a4a:bb19:0:b0:44a:9cda:56a1 with SMTP id
 f25-20020a4abb19000000b0044a9cda56a1mr17125515oop.14.1662402396842; 
 Mon, 05 Sep 2022 11:26:36 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 21-20020aca1215000000b00349c97de861sm3900362ois.49.2022.09.05.11.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 11:26:36 -0700 (PDT)
Message-ID: <2b7196a4-15a5-95da-2542-28cfe0e8eb27@gmail.com>
Date: Mon, 5 Sep 2022 15:26:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 07/19] target/ppc: Zero second doubleword of VSR registers
 for FPR insns
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
References: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
 <20220901131756.26060-8-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901131756.26060-8-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc30.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.716,
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



On 9/1/22 10:17, Víctor Colombo wrote:
> FPR register are mapped to the first doubleword of the VSR registers.
> Since PowerISA v3.1, the second doubleword of the target register
> must be zeroed for FP instructions.
> 
> This patch does it by writting 0 to the second dw everytime the
> first dw is being written using set_fpr.
> 
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/translate.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> index 388337f81b..a0fa419a1f 100644
> --- a/target/ppc/translate.c
> +++ b/target/ppc/translate.c
> @@ -6443,6 +6443,14 @@ static inline void get_fpr(TCGv_i64 dst, int regno)
>   static inline void set_fpr(int regno, TCGv_i64 src)
>   {
>       tcg_gen_st_i64(src, cpu_env, fpr_offset(regno));
> +    /*
> +     * Before PowerISA v3.1 the result of doubleword 1 of the VSR
> +     * corresponding to the target FPR was undefined. However,
> +     * most (if not all) real hardware were setting the result to 0.
> +     * Starting at ISA v3.1, the result for doubleword 1 is now defined
> +     * to be 0.
> +     */
> +    tcg_gen_st_i64(tcg_constant_i64(0), cpu_env, vsr64_offset(regno, false));
>   }
>   
>   static inline void get_avr64(TCGv_i64 dst, int regno, bool high)

