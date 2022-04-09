Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1C74FA0CB
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 02:49:25 +0200 (CEST)
Received: from localhost ([::1]:37146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nczI4-0003Vh-82
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 20:49:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nczG7-0001vE-8c
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:47:23 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:38738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nczG4-0001Gz-Tk
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:47:23 -0400
Received: by mail-pg1-x531.google.com with SMTP id s137so6424587pgs.5
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=a6z3gboc5asLYoB0lZPq4dxjjGk9sKhawWqFxRzxiFk=;
 b=U52Fz9EYU/zn3LPbz494iVkhwv6N8FAN65Cd8F2ZTjl/yEKstC0qb1rXz6XIj/oMkk
 AzPw7KbNJgSM73gcexBp2aozmuFSEAHP/HEM9nKzprgGHUcOhlyXOH2bqL2hmKSiEoSv
 bdrCVDpr13D3ZETTEQRnToxkIsHdxGhE3dv/GsGIB2NaJNrc73fEBb3Kfp/y/nCizraG
 PsEU4W7F0zGguGTUzIq3oNXiXt2ahQgT/8LSBpbryI5WFTkfIgzqHhu2jyC4G/1T5dgB
 YeThjKBZxo+VBRkOXKzB/K8/iXRHljr1afqRdjKR854M8DA60wa703nL7vTDyNrl1OxT
 joBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a6z3gboc5asLYoB0lZPq4dxjjGk9sKhawWqFxRzxiFk=;
 b=2TTpfkgX4FwwgDoqjWPykO/w1zpcv5ZA/EdppyBMQTXzsqEli8t7jMgyNFpcg1H1dw
 mgGtUH161aAZyRjxWVQ5FVXmiW7FtEjM9InUuxIaski0uL8/ICh2X+7NNiRqjHih7ieK
 BB8XY7k0BXITed/70lfPtVKeTmAF65T/ZXBiJs9L1zpSPmGWGJ08bPAdADpe+lJy64y9
 ykhW4zHQWd/G8eCw4Tl1u0VlRKs3Rf6a6cRmfjigzYrA9X1zjCJ7VTqxmD6/7KF5vPgE
 s83lRzIwY88SULeDc9qC5UyDuhvuBJSH8Dx6k1U7qr6imMIWeHyeSH/3Hv/I/JjltAqJ
 EJkw==
X-Gm-Message-State: AOAM530VVowWz8+U4YTqNo87SXqqkFhdr3/3V1WCour9Z7ibztTzR87q
 gKFqSRZ1Ipox5g4tR7Zk9Zc6wQ==
X-Google-Smtp-Source: ABdhPJxkfX6I+lIse0lsBVuCFzmBCMiAIQmjf0A4GGzRgO6Ndn4IHxoSFDWDQuiAVgxomUR6bdk6BA==
X-Received: by 2002:a65:63d9:0:b0:374:6b38:c6b3 with SMTP id
 n25-20020a6563d9000000b003746b38c6b3mr17855973pgv.195.1649465239368; 
 Fri, 08 Apr 2022 17:47:19 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a150200b001c9f1a7aafesm13055942pja.29.2022.04.08.17.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 17:47:18 -0700 (PDT)
Message-ID: <f1500122-80dc-e85a-d2e2-a3b397215bd7@linaro.org>
Date: Fri, 8 Apr 2022 17:47:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 12/41] hw/intc/arm_gicv3_its: Factor out CTE lookup
 sequence
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> Factor out the sequence of looking up a CTE from an ICID including
> the validity and error checks.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I think process_movi() in particular is now a lot cleaner
> to read with all the error-checking factored out.
> ---
>   hw/intc/arm_gicv3_its.c | 109 ++++++++++++++--------------------------
>   1 file changed, 39 insertions(+), 70 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

