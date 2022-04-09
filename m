Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 912CC4FA0B1
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 02:32:22 +0200 (CEST)
Received: from localhost ([::1]:52978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncz1Z-0002Ya-EP
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 20:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncysn-0000YN-Bu
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:23:17 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:37456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncysl-0005sI-OD
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:23:16 -0400
Received: by mail-pl1-x62b.google.com with SMTP id n9so9274325plc.4
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NOhuDfVvBAicfakL5kWe7UFW7CxJ0Qap4Lf340Yh4HM=;
 b=q3t2krsW5LQRocO8hyLZYTU1q5BCPLRTrR+CXsW4zpx0RSSS16uISxvDFO4FwUyyP5
 UARpvoqq/KDi3yazrGs3f9qDDKUSSf+Zs06dRLIEjSuq8yQtJgWzofHizgWgzprRoUOH
 tCqxFfuDkJph38kbFQClpZpVvsGsRhR2mipOQim8DGAyMd3y+ehwxNaabh8XWjI5D023
 l27IPK9JjvNVy4ekROrAWWKNX6tAmquwI2TA9IasDaS7ztuKwiXBcI+JaTZvrhxRezgC
 LfNhAX0PUp3th+trC419TDQ3WGUowxkVPJJt6yL+e4aw7bRRutlPOffYXOkc/MwHL6Mw
 NAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NOhuDfVvBAicfakL5kWe7UFW7CxJ0Qap4Lf340Yh4HM=;
 b=1NNVZvDvJ4OtUzxdefk1PemeJnr332OvlEyaD2XUZ7Yi3tFIHg/AXs49ZDiK+aSkOY
 hIiXyql/ulp/B1hd9gCcmxaxN6bCO7A+kyyxBu/EGFUOb00fF9EVe3rH1wTHW1mIseoK
 q3EuoFAX69BH+nBf7lmcmbx1A+Sud2uH8kawZP+sqiXQ54OcXYcKJOyb9tpbG7yNN8qr
 cWZ2+ZdUVPArI2meYi/ShKDn7GqtAN9XE2CKCcMrCeN4Z4pT9zyrThpxTHi2sbl1NjtC
 c3W4xYZI3tRHlNbK5foswfqXb1/16Ey5N24Mn2I39qzd676RwhN0N8QRb9BQI/LeKAmb
 FJ6g==
X-Gm-Message-State: AOAM533Nh1YO7ZHpMuUDAqdnAkzn0h4W6V7TDG/bCah/BLVPcfakysX8
 C8Gu2YBgHouoI4s86XxalgiBFA==
X-Google-Smtp-Source: ABdhPJyQ7dAYKsNSAs/13y4GggpOIK4rz9N9hGFYYKLCEnksp/KUMn8rcQm2Je+046GKoE8fXXJHVw==
X-Received: by 2002:a17:903:28f:b0:158:1ff3:74ce with SMTP id
 j15-20020a170903028f00b001581ff374cemr5357186plr.132.1649463794184; 
 Fri, 08 Apr 2022 17:23:14 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a056a001a5500b004fb71896e49sm26416275pfv.25.2022.04.08.17.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 17:23:13 -0700 (PDT)
Message-ID: <abc307f1-b639-4698-242c-bf95f5ec6d10@linaro.org>
Date: Fri, 8 Apr 2022 17:23:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 10/41] hw/intc/arm_gicv3_its: Distinguish success and
 error cases of CMD_CONTINUE
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
> In the ItsCmdResult enum, we currently distinguish only CMD_STALL
> (failure, stall processing of the command queue) and CMD_CONTINUE
> (keep processing the queue), and we use the latter both for "there
> was a parameter error, go on to the next command" and "the command
> succeeded, go on to the next command".  Sometimes we would like to
> distinguish those two cases, so add CMD_CONTINUE_OK to the enum to
> represent the success situation, and use it in the relevant places.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 29 ++++++++++++++++-------------
>   1 file changed, 16 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

