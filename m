Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FE4545318
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 19:37:15 +0200 (CEST)
Received: from localhost ([::1]:51810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzM5q-0005Qj-9b
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 13:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzLev-0007Pf-UU
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:09:25 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:37637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzLep-0001TE-SB
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 13:09:22 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so24042375pjm.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 10:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ko9kX/YJcoXF0GsOJtjw+I6RRBlLZGD7PSOv0XgLhR4=;
 b=pXPvrbKcouoA3fRMGniEFvdbODHZusaIDHVInZB7o0GG5wp0RmIML85yyxCyXJW+5j
 uNqI8dsCI4BBBLf66FG2exwXZTFfuf4bw5qOWYroxx1IpdaYWsJnrLXlR6IaZtqHSXmC
 SPmZwAoTA8DFtaz2SA4lfHaBq0Xx+nz0jiRx9IVLCCEVr2bMVu3OjqUHyHwE9h778HCM
 Ppb2imcp1RgtevYudolBGhuG13awbWbrKNoK0btk19Kab1vV26oGQnlOIiAhk3bRueFA
 IcDANC67Jsveyh665uHWXn+LfcxguszRYG/8wh2gXcR+PUwTE+9hRnHeUethvry04jp2
 q0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ko9kX/YJcoXF0GsOJtjw+I6RRBlLZGD7PSOv0XgLhR4=;
 b=b21AhYADuqZJUpJl/QO9B9L6M48Zyu/QDs1WFixKuVrg277zgrGG4q7615WOSeq4pT
 EGtOO5eLgwLYf7XahVXcHgN+l3qwnmQVHU5QCDmt8zqcYr5WUTJAFW7BRiD95OMRl5Sg
 KucFFJzf0CCEdMIBp84MZTgEq4zs6gbWHrxmXBcBlzwAyYmy3KX4CyyDnKIBrq2IScIk
 Jz0gy3eSXyAqs+VkER1srBWsezJeLiJWQ09wrruTbezBLxjCmxZoN0SLF0zNHSbEFWZL
 Q6M5zY5Gxmz87zSlgaRR21GAEU9hcenOfMB6K8/rUERWH9JsnbZy49h4J2DSc5+qVuHz
 FEJw==
X-Gm-Message-State: AOAM53182f12pY1VtPSr+5j9Y5TW4Zm1dLuCn3C4PZQZbb6ZwgRtupPL
 +LudSbCsbMMf/TdbWtKe96AmqQ==
X-Google-Smtp-Source: ABdhPJxZDu+vGYH0M2QnKSRCS/r47f76CA1YrSxfZaAGEFx0ptWHA0bwkSVTE8PgSnJrpNeOT1yWYA==
X-Received: by 2002:a17:903:186:b0:167:6d8c:68ce with SMTP id
 z6-20020a170903018600b001676d8c68cemr26075955plg.153.1654794555632; 
 Thu, 09 Jun 2022 10:09:15 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79911000000b0050dc7628179sm17721107pff.83.2022.06.09.10.09.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 10:09:15 -0700 (PDT)
Message-ID: <94ea5095-12a8-7f22-a6d6-9b072e3bb9e9@linaro.org>
Date: Thu, 9 Jun 2022 10:09:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 03/25] target/arm: Move fp access syndrome adjust out
 of raise_exception
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-4-richard.henderson@linaro.org>
 <CAFEAcA-02v3Mcz7Ozubeekanmus2GOj8bNVH7MfVQ78YfN1_tw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-02v3Mcz7Ozubeekanmus2GOj8bNVH7MfVQ78YfN1_tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/22 08:59, Peter Maydell wrote:
> On Tue, 7 Jun 2022 at 03:50, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Create helper_exception_advsimdfp_access to handle both
>> the routing and the syndrome contents, depending on the
>> eventual target EL and mode.
> 
> Bit awkward to have "TGE means go to EL2, not EL1" in two places
> now, but I'm going to assume that either (a) this gets cleaned up
> later in the series or (b) that it's the least-worst option, so

Hmm, well.  I had planned for it to go away from within raise_exception later in the 
series, but it didn't work out, so I could drop this.


r~

