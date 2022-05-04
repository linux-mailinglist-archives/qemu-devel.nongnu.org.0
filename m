Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2D251955E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 04:12:46 +0200 (CEST)
Received: from localhost ([::1]:53268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm4VR-0007A1-SX
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 22:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nm4Rs-0003dN-8N
 for qemu-devel@nongnu.org; Tue, 03 May 2022 22:09:04 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:39504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nm4Rq-0004Fd-Oz
 for qemu-devel@nongnu.org; Tue, 03 May 2022 22:09:03 -0400
Received: by mail-pl1-x62d.google.com with SMTP id x18so192103plg.6
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 19:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jKbxtLmdV/Tgy6fBB9VupwUWn6GZCsiTaKUNNBmazrk=;
 b=lXniOerL9mg/fijK4AvhGuWZ0ULtajFa9Nh4pmlaDwCacHA15UIe8guYR+25yF89TO
 W5vFwDMjPlxS3gF10wldQPa2MgNNmtuc/bh8T7aYMaIytiWNhwjx59Y8gnlsS9PbyGJ1
 AcGtKE4no1miQosqdeTTVwOIRnJlpp8yR141b3Ymh3oD+bjQYyHGkPLJOR0Vpl5jJMIm
 9fOSCMm/37f2/cKBDmyaVW6kgl+2e4exEgsYFP2HfrDMOHZJZ6CksIdyMvzQH/ssc44C
 hLsSJQKTigIZJEJkL89IUob7vr684UQRi/BglNKP0wCwghySE9R/d2iLdECtAUVqSMiT
 KaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jKbxtLmdV/Tgy6fBB9VupwUWn6GZCsiTaKUNNBmazrk=;
 b=g3H+2nZY3HHLGI8kMxWQa1Y0LibkoVOgMG7bn9kkUE4iBvhd5HzDmSHxK3KpZ4xlpN
 10nAkhXJ6EWuTjZtfL3604dpQM82WzLSmYEc5b8yAKoyGQDqSiM67a/QW3GIo9SHkzzZ
 V8+ThZaoj2xMIkOaRzhFseS+cqa43PabFFQkjuXfPqUxDDG349qIcGRVw6rMDl81Hw8e
 xBTrim8wTOa+o6gj8LOzzrodmDHyPPAr29Lj+wmlSvjB+SeYuGk+wuvrs6QPuTYkvTGI
 buYenFRC5ZCo285d+t+we3iNEOtdkREarq8BJ7CaOEkMOf1bLgf8glQZ4Wb2Rh5qAKEn
 oOwA==
X-Gm-Message-State: AOAM533dle+vyIjViNVE1GJ6IhvUIsj1aWTo8Hm/00zbXg2sPvfIVH2O
 9SHonyO2fsrgflE02HVPfhbapg==
X-Google-Smtp-Source: ABdhPJxL2tDJ86/Wq5STkyrLk0kk7QEuYG17JkVXkQDd6T7ASfWcEhChtiHxmIucPREGB8np98X8Tg==
X-Received: by 2002:a17:903:2c7:b0:158:2f26:6016 with SMTP id
 s7-20020a17090302c700b001582f266016mr19422113plk.154.1651630141469; 
 Tue, 03 May 2022 19:09:01 -0700 (PDT)
Received: from [192.168.4.112] (50-206-49-78-static.hfc.comcastbusiness.net.
 [50.206.49.78]) by smtp.gmail.com with ESMTPSA id
 n25-20020a62e519000000b0050dc7628182sm7169718pff.92.2022.05.03.19.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 19:09:01 -0700 (PDT)
Message-ID: <2ecf8336-a0c5-737e-6db2-d7c263826749@linaro.org>
Date: Tue, 3 May 2022 19:08:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 17/21] target/ppc: Remove msr_fe0 and msr_fe1 macros
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
 <20220503202441.129549-18-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220503202441.129549-18-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 5/3/22 13:24, Víctor Colombo wrote:
> msr_fe0 and msr_fe1 macros hide the usage of env->msr, which is a bad
> behavior. Substitute it with FIELD_EX64 calls that explicitly use
> env->msr as a parameter.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> ---
> 
> v3: Added a combined macro for FE0 and FE1. Use it to simplify
>      conditionals. Removed Richard's R-b because of this change.
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> ---
>   target/ppc/cpu.h         | 11 +++++++++--
>   target/ppc/excp_helper.c | 18 ++++++------------
>   2 files changed, 15 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

