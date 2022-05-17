Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F1452ABE2
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 21:27:36 +0200 (CEST)
Received: from localhost ([::1]:60118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr2qu-0006Vi-TB
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 15:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr2mM-0004pJ-6b
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:22:49 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nr2mJ-0004sL-6p
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:22:45 -0400
Received: by mail-pf1-x430.google.com with SMTP id w200so1866144pfc.10
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=58ZdVabKzXTSK2zb5Ni3zSpvUEij4M3l5A8YIwss5ug=;
 b=BWuXBOJRkcfQOClPCSWPdCmmHiBgscyko2+oyWjZG5kFKcwvt3aBThpJa1suBwRKrv
 kaQIRXts8m3u3D1tM20aBEsEiMhNMQH8R+jMbAvZCZYOJlbseAdE5Cjhr4V05oDdm2rH
 y8BOsIQqNhHzg2koq8hNUIHcK9vRx7qPWijZUV+qVgh3JRsA7s6RKuyUl5GBeCuj/mn5
 iI6xlD5J0Zl93cFVW+DMWhkiQIMxG36TivgZaK9ZvfoLJc3R+i+ltUmpA+bs75rWtY4u
 IXQQEeNfxErVSHZFIlGsh9rhpBgPWlVnSWGXwqcA11FjapA/TGvC2XqJhpb6q8K5JuZX
 EV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=58ZdVabKzXTSK2zb5Ni3zSpvUEij4M3l5A8YIwss5ug=;
 b=CAMt/6x600XqKDZ046YYpZB9kQitvVkBNoZbFwchHxi5LuENUbM4wzl9DIhdP7RxJp
 fmpliYhJ4MAVPPfwltcgPRxxpH0SMeswwxrbXmnyBI4eC8MsJHJX0j91R9aw++EyOvnp
 uymPHrxh2Igv27RrJ7IWEC9kghH8F1uAqYcHxMATiLUWxLc5L1p9w6fx7L/4ftK6VMTg
 mC9UOcXylULE/J0gL1Qy4w+0IkIPqVCOggFBtD/lC1x8/7wtl22uG6i04BVQX8Znd9Iu
 kP1A7W9utPoSW5erCM5xq0wJqEvi0wv2NyFuC8hwC0vvi0HIJ6NVB0TGZMhDZw7PhhvQ
 fV2w==
X-Gm-Message-State: AOAM530yhIQVBHa8ztnK8HiGTNpc0lza5DNhq8dXLiup2Pd6pRH/S3Bq
 q71hqaWZzW+9NjMybZB3BLWL8g==
X-Google-Smtp-Source: ABdhPJxoQ1WJ4efZ6XN1wW14xjhoiKqTfyzh6p3Xtqgff8lQ+4uZX+gAr1TTR1Cv9K7MdbXN8Uf9Hw==
X-Received: by 2002:a63:155f:0:b0:3db:4419:3b99 with SMTP id
 31-20020a63155f000000b003db44193b99mr20334674pgv.177.1652815358879; 
 Tue, 17 May 2022 12:22:38 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 cp15-20020a170902e78f00b0015e8d4eb283sm9360528plb.205.2022.05.17.12.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 12:22:38 -0700 (PDT)
Message-ID: <85b2269b-39dc-537d-40c1-dd67eebcba98@linaro.org>
Date: Tue, 17 May 2022 12:22:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 4/8] target/ppc: Implemented xvf*ger*
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220517183735.110342-1-lucas.araujo@eldorado.org.br>
 <20220517183735.110342-5-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220517183735.110342-5-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/17/22 11:37, Lucas Mateus Castro(alqotel) wrote:
> +            if ((xmsk_bit & xmsk) && (ymsk_bit & ymsk)) {
> +                if (acc) {
> +                    muladd(at, a, b, i, j, op_flags, excp_ptr);
> +                } else {
> +                    mul(at, a, b, i, j, op_flags, excp_ptr);
> +                }
> +            } else {
> +                    zero(at, i, j);

Mind the indentation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

