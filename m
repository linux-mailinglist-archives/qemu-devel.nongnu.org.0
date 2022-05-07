Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C086651E6AB
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 13:38:49 +0200 (CEST)
Received: from localhost ([::1]:52448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnIls-0006Wg-Q9
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 07:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnIjc-0004ib-Dd
 for qemu-devel@nongnu.org; Sat, 07 May 2022 07:36:28 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnIjZ-000447-TL
 for qemu-devel@nongnu.org; Sat, 07 May 2022 07:36:28 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 7so8140655pga.12
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 04:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=u3S4xW4RiaX/z6dxnCaH3O6xG9ZTa+Z7HLRUl3/p0Og=;
 b=agsh3JPHZEdC+BHHFHE39Ae7+VNyzWtOPR+ZSPMENOuZH3vYFJgRzRSIfe9X/QjoBi
 lOPaxB12AMYFvi76sV4eQn4qnjc3R+wcV/JehYnzn/BpoRWultuZmb3LXTZYbisaK+eA
 ZzUqNJVmmkgcGaSE/nH1YG3W/mz7fIn3FkOJ6zY5f+q04iGbKV5aSXtpgNL40NqUL25a
 FSPOWjsABEuh2Lra3mlE0zdhlvtymGqmruERPTbW85dYnQzDRb00IkOX31KSSlJRwkmL
 CMYbNyzyciXjNcGS5ZVhAgpXFdIGuJXz5A+uLfsHshfnxgnK/Wn/SiS283FQeFNvXTLV
 wGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u3S4xW4RiaX/z6dxnCaH3O6xG9ZTa+Z7HLRUl3/p0Og=;
 b=BkewjacPQ+u1WjB1zV0ohKtnQIi4pNRqaeenOlh0L7C3IHFRQHLG41W47zmIuHKhaZ
 922lmd6BstVl1m3pBOi0cMaceDGaUfmeXeyR9wgyi+HpHdEtSVE3qpoB07Z0tDbBPwGe
 Jz9BXeazvH65HzOU99TEk8xG20iWnj4cT5ra0nEJ7SLA2fZoAvnQ4e0Iem2fqnSDujCN
 A9h7NdXz9AaN52k4XlpVDDKQwBeodmpff7RLIQP+cD6/OZLc4MI4llXVcWDdwvM1ZJB0
 Wb59wtWZLK6UgBPwnpB0j+zZqhj6OyFGa2au5pz/nmNU/eyWGnTdzyO3R364Q7W6uFsS
 v4IA==
X-Gm-Message-State: AOAM531OEYbosd1yYaR8ByKSV6wrqBE65nTu3J+VNKgAbDpYQ41mb1Oc
 CSCp8GDTDusblzNSx/fDYhzSeQ==
X-Google-Smtp-Source: ABdhPJyGD4xPxsoGEzJW+4er0FxKOYlejfzCgPCyTeraghuZDJInR/3aJ/Z1Q8QL4eBELHRxl+4TTQ==
X-Received: by 2002:a63:8ac1:0:b0:3ab:199:cbdf with SMTP id
 y184-20020a638ac1000000b003ab0199cbdfmr6225011pgd.466.1651923384608; 
 Sat, 07 May 2022 04:36:24 -0700 (PDT)
Received: from [192.168.138.233] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 bh5-20020a170902a98500b0015e8d4eb1d2sm3460781plb.28.2022.05.07.04.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 04:36:24 -0700 (PDT)
Message-ID: <a3f0ba45-456a-bf76-2472-9727e94b2ba0@linaro.org>
Date: Sat, 7 May 2022 06:36:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 5/5] hw/intc/arm_gicv3: Provide ich_num_aprs()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220506162129.2896966-1-peter.maydell@linaro.org>
 <20220506162129.2896966-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220506162129.2896966-6-peter.maydell@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/22 11:21, Peter Maydell wrote:
> @@ -145,11 +153,8 @@ static int ich_highest_active_virt_prio(GICv3CPUState *cs)
>        * in the ICH Active Priority Registers.
>        */
>       int i;
> -    int aprmax = 1 << (cs->vprebits - 5);
>   
> -    assert(aprmax <= ARRAY_SIZE(cs->ich_apr[0]));
> -
> -    for (i = 0; i < aprmax; i++) {
> +    for (i = 0; i < ich_num_aprs(cs); i++) {

Better to retain the local variable for the loop bound.


r~

