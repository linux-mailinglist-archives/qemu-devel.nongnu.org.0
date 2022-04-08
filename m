Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128314FA00A
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 01:18:15 +0200 (CEST)
Received: from localhost ([::1]:56250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncxrp-0002Jt-Ny
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 19:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncxqT-0001Pt-2J
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 19:16:49 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncxqR-0003nF-92
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 19:16:48 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 66so8970908pga.12
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 16:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oxym++O7pLgHe70ojKGc/3kTRF5N8tWM4yRaRCkKOwY=;
 b=i3CsCz05VJNFTO5YVgKn2sxTUVc0Sk2FdFk3hQZ/nfjULFJYDXXDwRoWJWcllkCuKM
 yhZ/Mo/i7hl/vUtv7hhMztTxusD52w4UMO5/635FJeUHTN420OST3AHPpSek71PZ9PU9
 yeTUkHFz2lkm7EUxvDeHNH+vMlzqOjTdzXQEPtmvZC11IbVEd2htEuhEk7TLYgKFg4VH
 fSQPItSe68Z8AycoVV1hNkhrOi5JbFvnGRBFZcXgxQAPLNVOu5dRsOAYxGhFsbes1p1I
 LLDHDchBJ0ogIOoO2abXiR+xUXbiyltx4babb06PXPzKNKRxRFw+2IOVbbIZRhzCiA5h
 3GAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oxym++O7pLgHe70ojKGc/3kTRF5N8tWM4yRaRCkKOwY=;
 b=eJ1FT0mgaZhphzycK28gV5kMPnV0jh0qNfT7VzLmkPrxlXt8Tnk6L6iih/64K35hS2
 8/tdSenp8TzXMBjo7oyZioEpCKooGNnpc0AF1+KHAtBx1GKD9mMqnweitrEnEz4rUs+c
 6cY0Aqti+XXGRPALMcQAJO46ZSYLzZ2QMILdpLsQDUxllnJ50ptPBOnLPHBlO9RnfuxT
 YC0c+WsafMe1ypLbNPb+1uG0e6lBrPknhdkMHrJ0kgoVUKn69FFweqHF2iKNziuJd4bX
 FYPvcr7mHNbMuNz9iFx4Tt00+lFygXYjSa7zJD3KQzZ+omMnrptHj8K4isovMxW+6hrv
 Y8vA==
X-Gm-Message-State: AOAM533RHJxzVfThX4ZrvRUt0bFrpYIhkIDHa+A0ciLp+BuUSTJa7R+d
 Wt+GsZJPzMZNR7b6hk8KrrXukA==
X-Google-Smtp-Source: ABdhPJz9xNw7eMu98qeBuni+prTfdTzKEEkAYw2yalgpBMc7n9jT4itda3NlHAqDbyzxeUkuSbOxHQ==
X-Received: by 2002:a63:ea0e:0:b0:37d:f227:ec57 with SMTP id
 c14-20020a63ea0e000000b0037df227ec57mr17033230pgi.441.1649459805513; 
 Fri, 08 Apr 2022 16:16:45 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a62be0f000000b005059cc9cc34sm126842pff.92.2022.04.08.16.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 16:16:45 -0700 (PDT)
Message-ID: <dba26a09-5fb0-8fa0-6d93-2800ceb35be1@linaro.org>
Date: Fri, 8 Apr 2022 16:16:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 01/41] hw/intc/arm_gicv3_its: Add missing blank line
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> In commit b6f96009acc we split do_process_its_cmd() from
> process_its_cmd(), but forgot the usual blank line between function
> definitions.  Add it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

