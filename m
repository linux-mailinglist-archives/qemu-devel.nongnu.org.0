Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767214E5747
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:18:45 +0100 (CET)
Received: from localhost ([::1]:49666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX4dA-0001us-Gj
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:18:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX4Yq-0005Be-Ta
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:14:16 -0400
Received: from [2607:f8b0:4864:20::636] (port=38549
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX4Yo-0002IT-RN
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:14:16 -0400
Received: by mail-pl1-x636.google.com with SMTP id n18so2144974plg.5
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=gF4kB+l9A29pL3ggoBOkHXOcplSGoAc4IkqIO6ki7GU=;
 b=V8bvW1lpSTirmPjSICSdRL1t156A4M6JbfixAZyph652SW7qTHn27zYN3UsgtCcPnn
 JEQOqJCsuoLMofz/1HW1ySQcttYgyJly95LaoSNPbuYIIbbsaDerwkFrAYfzJwJR/ecc
 fJ2lYPusNm5n4+gZl0JZd8F1WeLcoUoCziIlvOWAq3fx4xGidDkAYl5xvgLyvLdWRhuL
 GgRg52iuPtu7SVyWn0liYd70P/FdjcnZ7ABBRwwuquThIqKt3bMbgbUNgob1lKgKdBga
 A/ai1x1R7w/zs5nKIo7HPElT/tqoS6nGH62Pd3CaMpkTUhj3UrEFOQQsrrdpnD5SV1wX
 jrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gF4kB+l9A29pL3ggoBOkHXOcplSGoAc4IkqIO6ki7GU=;
 b=PVJD4zrMZI6VZSjVgkzPOTGl4S+DkR9MJxEit+8pgHOvL6ifxmK4JD9XExtjnzHKz6
 /4tFdE3fBs9bdWz71DupEy+Jjs9D1gRZqe3FcUIZqZJbFcO8xjGGp/NktBLfX1dtrsSX
 GsOqsbcUPt7Y5tPBLqqzG04GT+2jO5WHKQfqeq5lfyMtiX1iBqgoQZ1+lzJO6+kN8+Vk
 1qSUXSyjonWyyLuySxCgW34nzyTI6HfZJLOR4BEs70RIPZzZt3XgwHLiPGoUBR/Vj5Uy
 yNTkQwV6y6wOHAP+uEJdeDXSo3+e9k2OR92nOD7HV9ioe+vQ+Z0wArNgJMONwZ6R79lt
 eM9g==
X-Gm-Message-State: AOAM531r60eil5U9LVhYIH/bUvGkDFPUgHv3ftXTEoMjCZxzpepGJnwo
 Wd1LFNmUSvW0Q/bNPIdSF/qPyQ==
X-Google-Smtp-Source: ABdhPJwwihL8rHIxa2m7m3ICU8FiA+kP2ltU8fk+Wf34jaPzZ/QATSgOGizpvz20YgaU6x//jy9ukw==
X-Received: by 2002:a17:903:11cc:b0:151:71e4:dadc with SMTP id
 q12-20020a17090311cc00b0015171e4dadcmr1017927plh.78.1648055653373; 
 Wed, 23 Mar 2022 10:14:13 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a056a00174e00b004f66ce6367bsm517988pfc.147.2022.03.23.10.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 10:14:12 -0700 (PDT)
Message-ID: <5f6b7dcb-7eb7-cbe6-0a9d-e1e112d0b0e3@linaro.org>
Date: Wed, 23 Mar 2022 10:14:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/32] osdep: poison {HOST,TARGET}_WORDS_BIGENDIAN
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-9-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323155743.1585078-9-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 3/23/22 08:57, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/qemu/osdep.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 9f06bf536fb1..95a14914d13b 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -34,6 +34,18 @@
>   #include "exec/poison.h"
>   #endif
>   
> +/*
> + * HOST_WORDS_BIGENDIAN was replaced with HOST_BIG_ENDIAN. Prevent it from
> + * creeping back in.
> + */
> +#pragma GCC poison HOST_WORDS_BIGENDIAN
> +
> +/*
> + * TARGET_WORDS_BIGENDIAN was replaced with TARGET_BIG_ENDIAN. Prevent it from
> + * creeping back in.
> + */
> +#pragma GCC poison TARGET_WORDS_BIGENDIAN

Oh, I see.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

