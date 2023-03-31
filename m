Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2939D6D246F
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 17:54:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piH3R-0000yd-1h; Fri, 31 Mar 2023 11:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piH3O-0000yB-TD
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 11:52:38 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piH3N-0005GO-ET
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 11:52:38 -0400
Received: by mail-pl1-x62c.google.com with SMTP id z19so21636979plo.2
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 08:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680277956;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bfdeVul6vDAmWGjkkF5VpPQlN0RUWNKkqs2Q9bedPQk=;
 b=QFP+1nO1u+MZYCJEK3KQr7aOPVYmFM6mg4OJCibeor1QVCnxOVEh7xBh5jrKu5TO5x
 IH/r4PMPJK2g9i1u3DpjYzgKrsAVZ/G+uwyR3K/F5CJdBrlAIxWIkdhbKuINWw20Nfj7
 YmbSIfgmYHHUERnXtpbQMGEf02Fuyw5RGsINvv0jISOqE2GNNEpsByn3UcH8UaeBIZ8p
 AeXWpDcmMaNVJLG1teeGjbbtzhQ59t5lBiymPTSKXgbruHzU9grDUjyVADYJN0QowEz7
 ZAI0P9Ek+3JDiq/xP8Mta4gSALR7HYaIO4pHkPFXnmr6NljBcrdkUQzkqto/jTLR26Lq
 7eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680277956;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bfdeVul6vDAmWGjkkF5VpPQlN0RUWNKkqs2Q9bedPQk=;
 b=Ca3CLmQq+JfNuiBWo6C3EmNWzJUffHAQ+hbnjrVKP4rG100hFrTWTKvpeQAgvkFm5G
 /nhbbLMdrIP4YEkoFo9ciZB+adsNe5dwI733ispR/oe+24GTiZKelrKFTv5XqCb5qJFm
 IsRCD/gT2W38JMsSTsIiaKlw/3dp4BtbsL/N1wlzqflCK/yR//ZZ/PY3DwaR2d8cu771
 dSMgjrIMGInF/MDanfdcln/Qw2iheClJQPbwV4jGny08ZsSm+JafONavbRn13fgS0yVc
 HfoRjiYcHSSYUcRtLJkH5ArRQ1WUQ/x/m9eitaXqrYD8PwGagLzcWC00d3zQLAkcg+W3
 9pHA==
X-Gm-Message-State: AAQBX9c24ouCDK1cxufxNQHaIBBiBDWhLXSSmXxYN5aT4jUn9ZCy6vIU
 7udbA/oa+5Ja85teqIvN/zxNyQ==
X-Google-Smtp-Source: AKy350YBNnOIVruq1DtAZLl+xovj7oTd+rospA9T2NVBoIAuDcrEJ7i7KBZ69tc5GssgEEOwWZzB8w==
X-Received: by 2002:a17:902:e54d:b0:1a1:a90f:6766 with SMTP id
 n13-20020a170902e54d00b001a1a90f6766mr33792641plf.52.1680277955832; 
 Fri, 31 Mar 2023 08:52:35 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a631403000000b004fb5f4bf585sm1756108pgl.78.2023.03.31.08.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 08:52:35 -0700 (PDT)
Message-ID: <37117d92-1670-5274-cf3e-d542e8c530e7@linaro.org>
Date: Fri, 31 Mar 2023 08:52:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/3] target/arm: Don't set ISV when reporting stage 1
 faults in ESR_EL2
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230331145045.2584941-1-peter.maydell@linaro.org>
 <20230331145045.2584941-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230331145045.2584941-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 3/31/23 07:50, Peter Maydell wrote:
> The syndrome value reported to ESR_EL2 should only contain the
> detailed instruction syndrome information when the fault has been
> caused by a stage 2 abort, not when the fault was a stage 1 abort
> (i.e.  caused by execution at EL2).  We were getting this wrong and
> reporting the detailed ISV information all the time.
> 
> Fix the bug by checking fi->stage2.  Add a TODO comment noting the
> cases where we'll have to come back and revisit this when we
> implement FEAT_LS64 and friends.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/tlb_helper.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

