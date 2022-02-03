Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AC64A7EAC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 05:28:19 +0100 (CET)
Received: from localhost ([::1]:44970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFTjG-0003cc-J9
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 23:28:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFTgx-0000nn-2d
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 23:25:55 -0500
Received: from [2607:f8b0:4864:20::102b] (port=45599
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFTgr-0002Il-F4
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 23:25:54 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 g15-20020a17090a67cf00b001b7d5b6bedaso1660647pjm.4
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 20:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ob3c1nMnYia3yR9+nQFKOrstQ812bzQe8rceE0ZQykc=;
 b=Vua0ym/E34RqXXPTETJA5EzZ84okQIG5dnLgo4lzOUf6P8pvlPBncxpFmodI9tePKS
 ty3z2kPiOHE8TR6xic9EsSUm4Wvmbejw5KW7BQj5kF9OZWJ9fWmGUBXd85CKrYdArFEt
 X5tRnw4Wegsk9TJGzRYGgW4S4ENgnPrgJ5SAGXuQLFSKMwqG7aHymQkWEV+QnP5alPKP
 rqY5mcR3Pkd7AlTjHSglK/BU4fwIqkF3bbuYpdYK1HcOTqXEn3mAMiKLnAkRpAePhgj5
 ZuO6gPU1b1CddFYeubuNvN0UF0filg7sx90F9cvG8pU8SDibBfraVadyjzKrz9N9SMRQ
 EA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ob3c1nMnYia3yR9+nQFKOrstQ812bzQe8rceE0ZQykc=;
 b=VBQ6MQfB+DVX+xaQqqVw6rSn3/nSlzdv4aWmIVqnjwrNGE5eCGiq0bDBxw4x1Gba7u
 a3nw8nUjziavyKANy2uu6RjzWLnmmq8FmdUxcZrHjCIVfUQFCm4g2l4D/vnH2jcb8GYe
 TY73izSuYC5S4RBOmbNb267KujM8HEqtQ085FIUHToeRuPizMe9dLwmw/o+bhrflyfBe
 IsnFaGypvrminN6gLk7REii+2auwGXtq1bk9/iTlVd87A0RY0gK2ew/QiLDobXRMXcAt
 vosiyTO3FW4khxJKtUl8zW/bFJO/ntgWiMlOcOOnwFfuHsYUaHTAon5FVSFaXl4S+PuZ
 LVDg==
X-Gm-Message-State: AOAM532T9V+fwYdABOpH0jcdE9YESzpW7tfypsgSBtjEpcAvgYfkTwU5
 TnEXXe10VbYGvmx1SjlRCD4XRQ==
X-Google-Smtp-Source: ABdhPJx2ZJVK28nRLeYsxFamNktn580WD7oynKI5luq/3S5njWu9hSwqPwQLXgpvVLqN5PolIrClTQ==
X-Received: by 2002:a17:90b:4b4a:: with SMTP id
 mi10mr11556844pjb.103.1643862347627; 
 Wed, 02 Feb 2022 20:25:47 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca?
 ([2001:8003:3a49:fd00:801:72a7:386c:deca])
 by smtp.gmail.com with ESMTPSA id kk17sm8996190pjb.21.2022.02.02.20.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 20:25:47 -0800 (PST)
Message-ID: <28b4e3ab-c1a3-ae03-5ddd-cf3ae8fcf49c@linaro.org>
Date: Thu, 3 Feb 2022 15:25:42 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 12/13] hw/intc/arm_gicv3_its: Don't allow intid 1023 in
 MAPI/MAPTI
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/22 06:32, Peter Maydell wrote:
> When handling MAPI/MAPTI, we allow the supplied interrupt ID to be
> either 1023 or something in the valid LPI range.  This is a mistake:
> only a real valid LPI is allowed.  (The general behaviour of the ITS
> is that most interrupt ID fields require a value in the LPI range;
> the exception is that fields specifying a doorbell value, which are
> all in GICv4 commands, allow also 1023 to mean "no doorbell".)
> Remove the condition that incorrectly allows 1023 here.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This one's my fault -- Shashi's original code did the right thing,
> IIRC. The spec text and pseudocode disagree here, and in code review
> I backed the wrong horse. Sorry.
> ---
>   hw/intc/arm_gicv3_its.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

