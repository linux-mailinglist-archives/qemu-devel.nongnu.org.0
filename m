Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03E54DB167
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:27:15 +0100 (CET)
Received: from localhost ([::1]:51658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTgE-0008Lx-2O
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:27:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTQ1-0008Kp-E3
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:10:25 -0400
Received: from [2a00:1450:4864:20::333] (port=54127
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTPz-0001yB-Ox
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:10:25 -0400
Received: by mail-wm1-x333.google.com with SMTP id p26so135071wma.3
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=RWmMscgXtbg+wDAkEkZP1oOOijQA8Y2PHlictnLQD/4=;
 b=Z1r3CIz2YxVoe7TjgxBiUV5gb7VdZq0g/yYn5OcdZEUdUnKDoAc0Kt0bF/xDVxh2lp
 7OIzXp9ZmWQujZqq7Dj8uxzlH1JnbY+irjgcbXj7qVN+w3ymyhcOy0xn2B+Ds2/ED92I
 nqNMDLK6JNJ0lw3UfawZWsGG0hca5RUwwt8y61a/RmyV9oLI2bUM91jB2c06DrQnWK/q
 RP50nQish/0sJjJDLPMLV6hHy6owiF015pIKpNQ3MYF6BopZJe6IXw4EdYDkKY1U2o0t
 CncPJvpHEg7iDBlg2MBuh04t5ggOW/E6aD16wiohi2CGw218czm2stlYW733zkyFGs7b
 tm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RWmMscgXtbg+wDAkEkZP1oOOijQA8Y2PHlictnLQD/4=;
 b=ZgPsgr/mmC6xMTJ8Os0a0vNDckuG8kXYagW2WCZkO+1WGlWGyO8DjEqbJWJxI2WAiA
 CFfkWVXn1Cwkot661JN32kTUUNsBOFpb3TzkyqS3Kh3V/jOexQuAbaq9ogULlsyBU6lm
 CZJ+VE4dFNG0VyuN57z7maqcZVBdX7ArPyDSjQrNLgSlkBiRaenEkAMZqsVkIaW5jFgm
 IZsyfLLCoCxgKGXQLsstxwOTdc69i9pgeM7KLHh5OSwCbYZMX2frFp1ZkPfHyIBQMSmO
 4cs49KFh6vwNYMoojrsaA3aCeZFpcu9OUKePS0b+GIJOtsckBnYGlW/YVcYhQlHl9aKG
 tigA==
X-Gm-Message-State: AOAM533xupV3n477WdExJN3FerfCjYcOzlkZR9LXdR05EZKWj9calzcY
 LfoSEMJvOFGK8h5VLuuoEBc=
X-Google-Smtp-Source: ABdhPJzsjg0UyjffZHFbLiLdDsjJa4ZLUDUNR8/xT5aJa2DnCesfgOqD//kLEJYOfArSFV+7aoBCBA==
X-Received: by 2002:a05:600c:35ce:b0:389:eb43:95dd with SMTP id
 r14-20020a05600c35ce00b00389eb4395ddmr7645259wmq.112.1647436222473; 
 Wed, 16 Mar 2022 06:10:22 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a05600c410f00b00389d35f7624sm5590437wmi.0.2022.03.16.06.10.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:10:22 -0700 (PDT)
Message-ID: <350d40d7-33fc-5eca-b6ed-7480f8091ee8@gmail.com>
Date: Wed, 16 Mar 2022 14:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 11/27] osdep: poison HOST_WORDS_BIGENDIAN
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220316095315.2613667-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220316095315.2613667-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 16/3/22 10:53, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/osdep.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 322103aadbdc..7175ee53a217 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -34,6 +34,12 @@
>   #include "exec/poison.h"
>   #endif
>   
> +/*
> + * HOST_WORDS_BIGENDIAN was replaced with HOST_BIG_ENDIAN. Prevent it from
> + * creeping back in.
> + */
> +#pragma GCC poison HOST_WORDS_BIGENDIAN
> +
>   #include "qemu/compiler.h"
>   
>   /* Older versions of C++ don't get definitions of various macros from

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


