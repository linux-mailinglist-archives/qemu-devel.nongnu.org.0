Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D504B1D03
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 04:42:53 +0100 (CET)
Received: from localhost ([::1]:36576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIMpg-0006ch-Hc
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 22:42:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIMoK-00057l-AC
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 22:41:28 -0500
Received: from [2607:f8b0:4864:20::632] (port=35626
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIMoI-0002uO-Hu
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 22:41:28 -0500
Received: by mail-pl1-x632.google.com with SMTP id y7so3629742plp.2
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 19:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6yxVVQwRaxPG0htdm64W7X46JQvDP9bkHkUHM+cd59I=;
 b=hESSoc6Exmta1gugmgzNfpbeWMDcMk1X5f3QPHqNNKl0VfvlkbQ/CHgpru9QgsvGcr
 54ONnL7z6kRgdJgwmedwEoYUAq2oeCVlym7zgj0zF0jYHxSQEP8JEgeJsaZXP7UTtsCv
 p+/aip2wwlqljycPMCcueqiceWSRWJDyyO7siMa37pjM9pi0A57Cp74ww0mC0xVo/TSn
 QAyrIKdSkG0FC9zANXCX0BOYKarVowV2ycAyY6VYhtQT2+wSgupzt+RRpbjtsRztOxjw
 KKoSenQ1SNvPEuoiWiO+Z5IykYTP28eYhIV9foUhX57mT+FuRtbaJsxEiWYgJbmBnQDG
 SKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6yxVVQwRaxPG0htdm64W7X46JQvDP9bkHkUHM+cd59I=;
 b=SNMZTxc+AqFk3uUdV8ZlfdTz3GnxtqI/9tn8IhVrH3DMgkPWA0DdLYq+bLqMIerytb
 8iyWSDIGyPby4N7t6mgDOmP8SHNyLHijWj+PuZBdaUUJkmkw5XU9D8jwtHA2NjmWN8NB
 syppryeHn3GPn2qaEd9omk3RLkf8S+LfS+H7zrJ6SGU83CKoJhMyjQpwage6RBHuCxeF
 FQdEgMi8q+1pLfX9taSKfmYAIrgAX8hD0SneUI3fcYArpvB/TrwEsPURr+FSFYKWzJyQ
 fhJpi16mUNvgT6PP54ALV9fL1EEtZCf/+ame+rCZ93qC6ciPOzT4FfKfk9XgyARf4HD7
 lSYQ==
X-Gm-Message-State: AOAM532NKykQtxggJ2WsxilO2T4OlfuJHsnU3OKODnHQ8eFt7aqB94P9
 QS0AVmADFOCJ1t/t5SkD25eZww==
X-Google-Smtp-Source: ABdhPJzWPsvhWCKPz80BQ4/Vpv1e/pCb177b3t8kKj9jIsv6/r6B+6Rg/xa+RZpIpauCUGZIBVMCJw==
X-Received: by 2002:a17:90b:4d82:: with SMTP id
 oj2mr644993pjb.79.1644550885210; 
 Thu, 10 Feb 2022 19:41:25 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id d15sm24484709pfu.127.2022.02.10.19.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 19:41:24 -0800 (PST)
Message-ID: <7695d8fb-466e-f9e0-2770-6a6234551a95@linaro.org>
Date: Fri, 11 Feb 2022 14:41:18 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 03/37] target/ppc: Moved vector multiply high and low
 to decodetree
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220210123447.3933301-1-matheus.ferst@eldorado.org.br>
 <20220210123447.3933301-4-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220210123447.3933301-4-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: "Lucas Mateus Castro \(alqotel\)" <lucas.castro@eldorado.org.br>,
 danielhb413@gmail.com, groug@kaod.org,
 Lucas Mateus Castro <lucas.araujo@eldorado.org.br>, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 23:34, matheus.ferst@eldorado.org.br wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.castro@eldorado.org.br>
> 
> Moved instructions vmulld, vmulhuw, vmulhsw, vmulhud and vmulhsd to
> decodetree
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/helper.h                 |  8 ++++----
>   target/ppc/insn32.decode            |  6 ++++++
>   target/ppc/int_helper.c             |  8 ++++----
>   target/ppc/translate/vmx-impl.c.inc | 21 ++++++++++++++++-----
>   target/ppc/translate/vmx-ops.c.inc  |  5 -----
>   5 files changed, 30 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

