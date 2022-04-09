Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7502A4FA0AE
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 02:29:49 +0200 (CEST)
Received: from localhost ([::1]:50326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncyz6-0000bL-Hc
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 20:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncymw-00083K-JX
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:17:16 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:38419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncymv-0004wt-3B
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 20:17:14 -0400
Received: by mail-pf1-x436.google.com with SMTP id b15so9802715pfm.5
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 17:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BuWpH8rgjblEHze3wJrhSPqdrqFkhN9R04a7GqOtU8k=;
 b=AiGdODlOnB3r273MWyhRnI12yVfI9nZamw3J4s+ajVxc1S8pYPqq+8hk+ptZ8I0bd6
 2xxZ82r3AIZnXHNASUNZHBn4Ooz+Hduj86kbT47woeF5S7Q3pM8bFYuso/qMTvuKfLpJ
 hZmPeq9UbLTjc05m/IgAqoYDGNe0gcC2vHYbjpzNusBZ19gxbPnRAeG/4DEDFetlYggh
 Iivk4mC5wNNWXj5DA8PPprpP1Gh0Vut/WH4wK380i4D1aUgDtImEjHkPBOwwcY4XMC+f
 7BUM9o7VoUWCs9aGrLlnPv7o4nE0vnm/ZJ2ecq/ttqgdBq7jxVpAm2VlgTm9XIy4Edii
 /EKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BuWpH8rgjblEHze3wJrhSPqdrqFkhN9R04a7GqOtU8k=;
 b=onqtSuGFbYfb4Xsab+Z0/TlOW1ZwkdohxEvefMKIHwONkiLh8G8zF5RB6ZRCbuQLd6
 RrnLeOIdS0JhzglA7yie09JZ5oZEzF6BTVrBa/oxCwRdGzgb9hxWrAbvTCTcwkC+Xa0G
 6uc0vQ63BhjIQR+9TJTwi69r5rfuDpmoBTGKqV4DXkpRRSrixGCzCAZYebQ9FdV6DRLx
 KgldUcrphGmgQZelln3s+6fCQSRaEogxZQJchmPl3QioXzDuqV70Cu22j+zU82oz/2Hq
 7cnABurElJVmhCkYqzEqbi3olRyWwgSjXn0B17llWpmLAHKByPS757fJKCfz9W/kIur/
 TTXA==
X-Gm-Message-State: AOAM531aC7HPJq/tEapfXWM0vSlGLKYvDMaIPq/L1Lr+In8Y8Pj1zqku
 F9bHpfqopuuoh8y7CGigu/Zn+g==
X-Google-Smtp-Source: ABdhPJwfGMk0CJZG4+5dnm8pp43hFBz1ABVSA90VQWq5+itkPx8QqNjFRN4OiI2yYSCxgSFRImAgqg==
X-Received: by 2002:a65:6a13:0:b0:373:14f6:5d33 with SMTP id
 m19-20020a656a13000000b0037314f65d33mr18241834pgu.62.1649463431558; 
 Fri, 08 Apr 2022 17:17:11 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a056a00190300b004fa2411bb92sm28704592pfi.93.2022.04.08.17.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 17:17:10 -0700 (PDT)
Message-ID: <6004f6aa-f71d-8473-afa7-a41833f6372d@linaro.org>
Date: Fri, 8 Apr 2022 17:17:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 08/41] hw/intc/arm_gicv3_its: Implement VMAPI and VMAPTI
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
> +                      "%s: Doorbell 0x%x not 1023 and not a valid LPI\n",

A little confusing for hex not decimal.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

