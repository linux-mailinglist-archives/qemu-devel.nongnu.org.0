Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A711681FDA
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:46:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdqn-0005A6-3T; Mon, 30 Jan 2023 18:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdqQ-00053z-Qt
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:45:53 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdqO-0003Fc-FS
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:45:50 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso9406840wms.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VDWP+o9gNpTkJERqxdU5PDM+Js1/nlfXrfa8hfz+PEI=;
 b=H1oQO3QIAqKE3gikMEmNmfpFB+ltUoCrdF05pUJPw4Sn8xOjbzMMDdpaGy0WJXuGGM
 EWA8f7z5TpWgEfpvTd7UcmUYwFV3qZYbA3e/Ke0OQH83zpOAfISd/wfsYbBfXturwC8o
 ZZfCIAD1bC3ovOlleGjoSLQ3GgbFeNnHuwcdY3Hdzi4PW0JUT6FSMaTLYR9zN+uWFtvw
 TTfwNO0el4isEeRhQOeBrAT3u7LOIJBECzQP7GPbOo4hzbkwCgpMd7QmnFYOPwFAwJgc
 4yohQ4JDtgVR3uCArCK+aFxxqs3bf8NuW+UVPPakTLjDmHxUqR/6iJPXnDK2GPWIatMy
 fc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VDWP+o9gNpTkJERqxdU5PDM+Js1/nlfXrfa8hfz+PEI=;
 b=FCiweR9MJdICVo+aVGvkDWCBF7Q8RKuRaGyX+rB2NkhBlUz+KC16JRxhS6TX7uS36C
 CTK+8zUBkeWMYBhn+WJRVKkhfhGabN50AVCr3dEHy5pPnZclrCp95WaKPzihV3LvzQck
 7/XbFFSvtQz6WiaTHIEN7rXMWZUNCngb5GIgmKgO/sWiE6KlQfjZ8plZMP708zonkb+d
 UjbUMHfjg5GRMYsGOcgw+w1teKjwI0UvNlz0Pc7Ng/YQ20J4azJYvQd1lLMPwgdWdhZ2
 T6mygqLgPDnc42zFzed+bBqO6p9wxeAEn/+YfBmA32GwIJcJXKfR6/xaxDnhQLXFwvr3
 t6/g==
X-Gm-Message-State: AFqh2krZVkIARYJ7dAUoFQfVaDmdQdDc1+wg8olmudQRYEOjqVsm+qcV
 3je9zCNljy0mzXPRK47ygssiDw==
X-Google-Smtp-Source: AMrXdXuvkQfsYkYkg/QsZXT0sz8/QTa5JzgKHnw8RDK8OJHoBgK9thpY8VEa/YRHrprzN4DkF/M+EA==
X-Received: by 2002:a05:600c:11:b0:3db:162f:3551 with SMTP id
 g17-20020a05600c001100b003db162f3551mr48564979wmc.21.1675122346816; 
 Mon, 30 Jan 2023 15:45:46 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 az10-20020a05600c600a00b003a3442f1229sm1260610wmb.29.2023.01.30.15.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:45:46 -0800 (PST)
Message-ID: <19d75348-0f66-6ccd-7b82-ffb29dabeeba@linaro.org>
Date: Tue, 31 Jan 2023 00:45:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 26/27] tcg: Remove tcg_temp_local_new_*, tcg_const_local_*
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-28-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 30/1/23 21:59, Richard Henderson wrote:
> These symbols are now unused.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/tcg/tcg-op.h |  2 --
>   include/tcg/tcg.h    | 28 ----------------------------
>   tcg/tcg.c            | 16 ----------------
>   3 files changed, 46 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


