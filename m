Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF6851EB4E
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 05:49:50 +0200 (CEST)
Received: from localhost ([::1]:40816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnXvZ-0005sO-0g
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 23:49:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXuj-00054D-PK
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:48:57 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:41802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXui-0003vg-CP
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:48:57 -0400
Received: by mail-pl1-x632.google.com with SMTP id s14so11026526plk.8
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 20:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GCawZAdg5+psxApC7bbJbFFH/tI9reyZT/CjlgGIG8c=;
 b=b6/eVjixYniz38N81CfuW0e0k0ulKNLhI4Al2uei0nroDlVNDkQhAaNYOtSe8V2/5J
 gYRRcehD3Nkw5AwDJ1KvIlnE13uGbvc+eo1h/vI05VLx4lQ5YhLP8UFHUoqqAK1BgqWJ
 K+v8X/Bm08rfgjKkyXLEZCwDfrqt4Uuj9FRO+k4DHHEMNVm5JO+65v8tUeROce6sNg69
 js+MWYM2+wCWqMrPV01WczAH4uLtH9JaOB17dHQ5DcvkBvp2+KIaiwiRrROClWly3R2U
 E4ERhTDD5Qgx0YSa+eq4SNn+YhAac4MkYv1pLF01xtXMQEnGcnY4XQYQXtBZM9Z8Mv8v
 inLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GCawZAdg5+psxApC7bbJbFFH/tI9reyZT/CjlgGIG8c=;
 b=s341BhsbsQhe0IKvNRmv/zv5pihDPq+AILKSZbUtgOlUAckj8i28iYUcFYwgigg9LL
 SdbGSpnRXkXEkxyr+L/T/OClJFcLlY2W/SYHxjPPqeDj4rpxSKcJ0UDYgv7tPXG4DKcA
 3D66totIBmJ+9/C65+K3eYRx9EVkosWSWPAlMpwWB6gs46CewkO7C1joxEnpGLBT0iQU
 yvqplP5vrQM/bWomRsiP0LJzi/DSDEGoZZ1wtfrqqYxFVUmiUAgoRvRhUo8yZklS/3hc
 Rjb+yq2345b/lwjKjBXqT1txG9pPtxKov6WWSRMPpm7FKSCm/4cGbppjBT9Cfn12YrJb
 U1Gg==
X-Gm-Message-State: AOAM53334LSKr6TlhH6ScZSex1P3PYolyMNIA2bltOrwnbOolgB0cHGK
 weQJ0KcmeeSFTsmy3RR7dQVyeA==
X-Google-Smtp-Source: ABdhPJzBTcVTwb/lrSwnJl7Pm4eYU4aXFxoaErGLyCs1p5Kirdk0YMGnqvqaufbcgGAG5F7nx3Y0jw==
X-Received: by 2002:a17:903:410b:b0:15c:fd57:aa34 with SMTP id
 r11-20020a170903410b00b0015cfd57aa34mr10298436pld.82.1651981734859; 
 Sat, 07 May 2022 20:48:54 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 a6-20020a170902900600b0015ed3a112c9sm4300066plp.280.2022.05.07.20.48.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 20:48:54 -0700 (PDT)
Message-ID: <49260ca5-169d-3f9a-bfc5-7cce27a85543@linaro.org>
Date: Sat, 7 May 2022 22:48:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 3/7] target/ppc: Implemented pmxvi*ger* instructions
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220506121844.18969-1-lucas.araujo@eldorado.org.br>
 <20220506121844.18969-4-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220506121844.18969-4-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/22 07:18, Lucas Mateus Castro(alqotel) wrote:
>       return true;
> +
> +}
> +static bool do_ger_XX3(DisasContext *ctx, arg_XX3 *a,

Watch the whitespace.

> +{
> +    arg_MMIRR_XX3 m;
> +    m.xa = a->xa;
> +    m.xb = a->xb;
> +    m.xt = a->xt;
> +    m.pmsk = 0xFF;
> +    m.ymsk = 0xF;
> +    m.xmsk = 0xF;
> +    return do_ger_MMIRR_XX3(ctx, &m, helper);
>   }

Is XX3 going to be used for anything else?  Is it worthwhile to move these into the 
decoder as explicit assignments?

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

