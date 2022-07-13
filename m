Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D153573D97
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 22:09:56 +0200 (CEST)
Received: from localhost ([::1]:49908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBigF-0004th-J2
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 16:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBie5-0003IV-Jz; Wed, 13 Jul 2022 16:07:41 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:38621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oBidv-0003Tk-5A; Wed, 13 Jul 2022 16:07:41 -0400
Received: by mail-oi1-x235.google.com with SMTP id s204so15727792oif.5;
 Wed, 13 Jul 2022 13:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VpbqJ8EclG1blWLNhilQF7J03wL/qMCnoQ5RiH8413U=;
 b=APs3C3NGgbA+8fldRwcqRVTVv0RLXcsmlXZ3r4i+CE7dRrRKEaQCcfQD8sjT7pfuei
 Kf/4FeLyPZexUn7eXkA94/DUIhnKRjyR26uym6ew4D3AcWHgoeRqYISeLuFz2NlzSSLe
 iZICZdvEeT8NOIzAond91H9fM+uAhpKXvQ18hpI4Fz6cGyjy+N/Iy3UIh2V93NwJTF4J
 I9bKbXWU+waZUWl4WyVJ3RaUmxNVB7VdJsnCbFh8ro+NIm7IyT33SbvGAoefJC33tQ8E
 RtOg+8sUEYhL0VXH/vywvtS5OXtbReP8xikRQ83RqIo1huEZ9P1iXTG9WB5Gc1Q0/yKW
 4Rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VpbqJ8EclG1blWLNhilQF7J03wL/qMCnoQ5RiH8413U=;
 b=wU7fs/l8aETiG9WKZKB9c+42ACrpIxKK/0KLb9HsVRuIavmvd3tggJeuFGngrilDKy
 nLqFUivQhBB6kPpenxcGPXsABY5gCZeMqMeWHRbHvHo/Mow8RrUXVAQsDEPlSSPR9Owq
 Pb/9Dqhzzy9kCAUXlssYjsrUcIxO7VQEK0I2CyYDeZVjp+Eyo2QkGC1gqqqNhsn0j7D0
 Sv5uixdIuY5Qn7ZtlyF16ml0nKKAw/klgQBjaCn8eEMvA/Iy7KKzIXqhhhuXdWB8hZBS
 QBr8ik5lU2zls+uATM6XcJJaqpbsSAiYAkf9tU0T/zCO22PSFMJxiwtG8zX+H5L/U+G5
 GG2g==
X-Gm-Message-State: AJIora+KzoAttE/sIJxBdZjqX8Rfg0zqTjVbD2NG/J2kwiVlt5JcOJzi
 9HtFLljyshrwbQbSL5lJSR8=
X-Google-Smtp-Source: AGRyM1uHvbmJASpC8YcV7NyoOSq6UQsfybnxNVFFdt318UzImrC9yvbFbAkWIx+yEwb6CJDSoIyuGQ==
X-Received: by 2002:a05:6808:180d:b0:33a:3a7:1fd with SMTP id
 bh13-20020a056808180d00b0033a03a701fdmr2609946oib.169.1657742849695; 
 Wed, 13 Jul 2022 13:07:29 -0700 (PDT)
Received: from [192.168.10.102] (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 30-20020a9d0621000000b00618ca32d858sm5170274otn.25.2022.07.13.13.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 13:07:29 -0700 (PDT)
Message-ID: <cfd5142c-9f98-eff4-1d24-30a1dba45ed7@gmail.com>
Date: Wed, 13 Jul 2022 17:07:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/6] target/ppc: fix exception error code in
 helper_{load,store}_dcr
Content-Language: en-US
To: Matheus Ferst <matheus.ferst@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, david@gibson.dropbear.id.au, groug@kaod.org,
 farosas@linux.ibm.com, laurent@vivier.eu
References: <20220627141104.669152-1-matheus.ferst@eldorado.org.br>
 <20220627141104.669152-5-matheus.ferst@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220627141104.669152-5-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 6/27/22 11:11, Matheus Ferst wrote:
> POWERPC_EXCP_INVAL should only be or-ed with other constants prefixed
> with POWERPC_EXCP_INVAL_. Also, take the opportunity to move both
> helpers under #if !defined(CONFIG_USER_ONLY) as the instructions that
> use them are privileged.
> 
> No functional change is intended, the lower 4 bits of the error code are
> ignored by all powerpc_excp_* methods on POWERPC_EXCP_INVAL exceptions.
> 
> Reported-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h          | 2 +-
>   target/ppc/timebase_helper.c | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

> 
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index 6233e28d85..c6895f2f99 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -684,10 +684,10 @@ DEF_HELPER_2(book3s_msgclr, void, env, tl)
>   DEF_HELPER_4(dlmzb, tl, env, tl, tl, i32)
>   #if !defined(CONFIG_USER_ONLY)
>   DEF_HELPER_2(rac, tl, env, tl)
> -#endif
>   
>   DEF_HELPER_2(load_dcr, tl, env, tl)
>   DEF_HELPER_3(store_dcr, void, env, tl, tl)
> +#endif
>   
>   DEF_HELPER_2(load_dump_spr, void, env, i32)
>   DEF_HELPER_2(store_dump_spr, void, env, i32)
> diff --git a/target/ppc/timebase_helper.c b/target/ppc/timebase_helper.c
> index 86d01d6e4e..b80f56af7e 100644
> --- a/target/ppc/timebase_helper.c
> +++ b/target/ppc/timebase_helper.c
> @@ -143,7 +143,6 @@ void helper_store_booke_tsr(CPUPPCState *env, target_ulong val)
>   {
>       store_booke_tsr(env, val);
>   }
> -#endif
>   
>   /*****************************************************************************/
>   /* Embedded PowerPC specific helpers */
> @@ -169,7 +168,7 @@ target_ulong helper_load_dcr(CPUPPCState *env, target_ulong dcrn)
>                             (uint32_t)dcrn, (uint32_t)dcrn);
>               raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
>                                      POWERPC_EXCP_INVAL |
> -                                   POWERPC_EXCP_PRIV_REG, GETPC());
> +                                   POWERPC_EXCP_INVAL_INVAL, GETPC());
>           }
>       }
>       return val;
> @@ -192,7 +191,8 @@ void helper_store_dcr(CPUPPCState *env, target_ulong dcrn, target_ulong val)
>                             (uint32_t)dcrn, (uint32_t)dcrn);
>               raise_exception_err_ra(env, POWERPC_EXCP_PROGRAM,
>                                      POWERPC_EXCP_INVAL |
> -                                   POWERPC_EXCP_PRIV_REG, GETPC());
> +                                   POWERPC_EXCP_INVAL_INVAL, GETPC());
>           }
>       }
>   }
> +#endif

