Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA965AD474
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 16:02:20 +0200 (CEST)
Received: from localhost ([::1]:34584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVCg5-0008SW-1C
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 10:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVCcx-0006j6-Ix; Mon, 05 Sep 2022 09:59:03 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:41508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oVCcs-0003z1-A0; Mon, 05 Sep 2022 09:59:03 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-12243fcaa67so21562998fac.8; 
 Mon, 05 Sep 2022 06:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Jyz2UXbLvl9SnGLZRIsncq7KCwgr5AAVi2qDZlG2YPQ=;
 b=Dum39nVzmqorZ9FW2Wg+4CCm0Nv3+JvZyYaaMP1FBbVdvM+neGeR+FqoREzYVd9enH
 XsajKn25uTWVgt3O9QnUVY7UYKElz7DzkBylYPFfEXstceU3dyPG2Qdpu4tBIMA12dJH
 WRCPBhsRLpLTtW4qSK/rc+2vMj9z/G0y7wwt9xfyg3cE410hJ8Qy/U/czwqYUTNLnBZ+
 1ZIHrYqolqLJhPL07EiFZmyC0VTKB6QV05wjb8HyxPvolg2fAm1HPiHtg1VdBxl3rmXd
 MtFLx8b/t/N/qSArWA4MQWWmV/5Vqajk7beTMhydlIqjVUc/9FjYsXbq9hFf0fkdM1u2
 8fYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Jyz2UXbLvl9SnGLZRIsncq7KCwgr5AAVi2qDZlG2YPQ=;
 b=i39OemvIVtkJ3hh/pnqrFe/iQQry73a+EIzp2oBaaTZTOP1vbJsy0e84CjEh2nfl5g
 Wh2yebnDn3J0cywX2Tf7q+wUl7G4gUgM9KuFD5UQYTrvILlUwm5HWmStoGQRwEO7nlVT
 K5YP1E8YAK4mUUnfmTzYTEGPLprILKltXH90aNzuPXBiVg8dee/XU66vTgMlZHbQPcEi
 TVto7NTzy/9IGygKWaOj9WshBni0KYNDDUM5xNqsmvpJjzd5dfy2cLA1qIt8r8ksHgqz
 b/wgYTUsnQUQJsHOGw87hG2CRJ+N+UdKRvTw5hMF4HK2vbeFxeSLijzpWI+1UUeZO5nk
 pisA==
X-Gm-Message-State: ACgBeo3SpDGL1sbQKPb2492Ca8X3QId1EbjRznUZT6EurP49oFxkGZSo
 iIyD/NnSSPLYT94Ihlqw5/Yx3pMhto8ycw==
X-Google-Smtp-Source: AA6agR5jkNDUe2SMFEGhLl+XyKuIsfamGyLpqprZtte0ZbIvBdiCobM31to3TB+QibRoTAf2IaSlTA==
X-Received: by 2002:aca:4189:0:b0:344:d96f:4635 with SMTP id
 o131-20020aca4189000000b00344d96f4635mr7308964oia.131.1662386336817; 
 Mon, 05 Sep 2022 06:58:56 -0700 (PDT)
Received: from [192.168.10.102] (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 v18-20020a056870b51200b0011f22e74d5fsm985926oap.20.2022.09.05.06.58.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 06:58:56 -0700 (PDT)
Message-ID: <e7cff6de-7d94-85bc-94a0-a9eb3e0eaa01@gmail.com>
Date: Mon, 5 Sep 2022 10:58:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 02/19] target/ppc: Remove unused xer_* macros
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 richard.henderson@linaro.org, matheus.ferst@eldorado.org.br,
 lucas.araujo@eldorado.org.br, leandro.lupori@eldorado.org.br,
 lucas.coutinho@eldorado.org.br
References: <20220901131756.26060-1-victor.colombo@eldorado.org.br>
 <20220901131756.26060-3-victor.colombo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220901131756.26060-3-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
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
> The macros xer_ov, xer_ca, xer_ov32, and xer_ca32 are both unused and
> hiding the usage of env. Remove them.
> 
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/cpu.h | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 985ff86f55..6481f48087 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1506,10 +1506,6 @@ void ppc_compat_add_property(Object *obj, const char *name,
>   #define XER_CMP  8
>   #define XER_BC   0
>   #define xer_so  (env->so)
> -#define xer_ov  (env->ov)
> -#define xer_ca  (env->ca)
> -#define xer_ov32  (env->ov)
> -#define xer_ca32  (env->ca)
>   #define xer_cmp ((env->xer >> XER_CMP) & 0xFF)
>   #define xer_bc  ((env->xer >> XER_BC)  & 0x7F)
>   

