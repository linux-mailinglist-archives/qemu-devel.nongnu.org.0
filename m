Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D976B102A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 18:26:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZxXv-00023F-4g; Wed, 08 Mar 2023 12:25:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZxXt-00022j-09
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 12:25:45 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZxXr-000394-FJ
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 12:25:44 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so1838405wmb.3
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 09:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678296342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PF2YCsQCmeKGuXjs46/8QOADvm1NubSQ8ahqkqgQx2Q=;
 b=xsjnuiqatVXAFtH6fPOE9HsXg+9/5HaeD4gWy0YLU3d4EvKUiXwfx1L8IDF7nmuSQd
 zDaNuR1cvjC+zrSQM6zoY2CRiOk1EQ1PkMhVf9iWI5J19DqcS0yZ8MQV8rd2XnSO3/vu
 kjFum6VQKAxpRS6xWkT4+5bNWGUDQRbqpwcSV6JLFSovzzoow5WFk8oi76YsqrMg7u0V
 3xGOnbinhnNhBOwDBbhJTuLkrbmpih4+FeGahX+O5CZ1sIKoI7stI+9OELK4EMljE3dW
 SbBSoSP2DpajOdNu3IkOXai5Fq7FkDfBkHqFcojh75+YBWOBOKUTlRAsdl8UH2gK4qgM
 zLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678296342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PF2YCsQCmeKGuXjs46/8QOADvm1NubSQ8ahqkqgQx2Q=;
 b=FiNcQRoq/MF60aE3gHAUtM+YDA0hmrDXUoLrHzqhes4eD/76gkJ/k6ZWzM20OPORzG
 pv5RGXTtTXtRKFDi3EJ1fVBzOILvQqPFgzHaxYhRTBEZ0axdHoumxAFGP0Jq9jYA+6Rf
 qAzGN2WbS44xbQifufBgOjaVFMfP72iiBX+1qD1/+OnOnsIAv8EMO13Pk0SsksNKYejB
 UNpOR7NrBY+2f5IDEN6IZsnPgbyj85fKmAfuoQRO9gIHhGQh6H/eAvVRI/Cnt64o9mhn
 d93Ct5DFkjnu3h8pNBwD782nyqGbBBaj3ndHteVA8GaLIIk+EXTdvSl5gs21x04zcHUs
 w96Q==
X-Gm-Message-State: AO0yUKXZqNbz3O5RROvtEDEWCQf4NEEaCovVmZKmNBOk7E0cS//huP9T
 +K7vo++xey0Z22hRVXhENUAR6A==
X-Google-Smtp-Source: AK7set+6M1U6/EVeSjik4IbYZv8hkTlbsrgnYSzDn7D1MM6zYbMjEipIUwbqI9xvgkyhNpiH+ycZZw==
X-Received: by 2002:a05:600c:3c95:b0:3eb:a4e:a2b2 with SMTP id
 bg21-20020a05600c3c9500b003eb0a4ea2b2mr17014052wmb.4.1678296341796; 
 Wed, 08 Mar 2023 09:25:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e17-20020a5d4e91000000b002c559626a50sm15918815wru.13.2023.03.08.09.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Mar 2023 09:25:41 -0800 (PST)
Message-ID: <fb389228-c429-1c41-aa62-e266058c86d4@linaro.org>
Date: Wed, 8 Mar 2023 18:25:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 02/25] target/arm: Handle FPROUNDING_ODD in
 arm_rmode_to_sf
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307183503.2512684-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

On 7/3/23 19:34, Richard Henderson wrote:
> While this enumerator has been present since the first commit,
> it isn't ever used.  The first actual use of round-to-odd came
> with SVE, which currently uses float_round_to_odd instead of
> the arm-specific enumerator.
> 
> Amusingly, the comment about unhandled TIEAWAY has been
> out of date since the initial commit of translate-a64.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: qemu-arm@nongnu.org
> ---
>   target/arm/vfp_helper.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


