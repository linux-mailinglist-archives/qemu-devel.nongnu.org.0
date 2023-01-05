Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04D365F64C
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 22:57:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYF3-00008B-7P; Thu, 05 Jan 2023 16:57:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYF0-0008Vl-Iu
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:57:38 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYEy-0002xh-Tt
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:57:38 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h16so37403867wrz.12
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 13:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yZq2xpnoFTyg9uw9OKVeH6rkGaj9fq2SmimorBQqC4E=;
 b=VKwUZCPtPvEHGsJIVinh30T+KLYsmyU3rS/ahwmTDzlnu80BpvPyqh/wqNnqoHr/jN
 z8iv3YKW4Y5mmWDluWBZ7njYePE9l/8iAsPvZ7P5/c0YdE3AdYcVkKrx44wiOBNNoy+f
 /JHs5469VnA4kXpXxYG3g7oXOXWKiPXy1KgYPA11tbo9Z77wxE3NqcKWZ7mLpWDoLDdB
 PK7cpgkLA3BBIRx/81kpFnQY/ekNAPm0OC+G2ELj34nmjkVIJisRxMnhEeqyJ6THPkZF
 BTw1M+PA+/a4Ig9jqcurK+TmGlPbnQnULLzUD7gEY94nOOaWOtSyRyl3H15WHGOq9sRd
 FE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yZq2xpnoFTyg9uw9OKVeH6rkGaj9fq2SmimorBQqC4E=;
 b=Gaf44sN8C63ZBFtT/9yvw5X4YVHB+mVG/8PnMt8b6wnWgGUkGDHpBL5ryFxt+tYdsH
 xSgbprkhMtMrNOZpEEOAB+sClja7cLpe0W/dXUIiwVCsX6kcNvdeC6VFi/esyXbtJtI0
 1qwvE7Sxdyow+meqMmCT0MFwzQkxh/0bC/zRu/Xsqog3dJ3d0lPmSlbuwqzKfsE/y6hy
 TMOepvkjmfSCsJ1Pgjsk8BDqph74fA64NS20tNDaophs0nEbsENXiw6SotwsUwW5hcDD
 VFBz/H1LgjNy4j9Kdr8QVHtiAHxZjayWxHqF/W22Tq38ZpD+l5U6pIA4gxNpsa2skKe2
 9Bzg==
X-Gm-Message-State: AFqh2kqH7eWfgpgkBjy0BJBGhalH2TrIxOK/IA2CKK9ivWPvIahCmRoO
 ghg9DxrHXEeUa9Zsu8tKHMN9nw==
X-Google-Smtp-Source: AMrXdXs/7ekgwT9ltjrixWZxlLwUi8e+lFKWGMpBQY97PAQkW9QcsIDv0ssg35FIKQB1jhR6OFstww==
X-Received: by 2002:adf:e19d:0:b0:28f:29b3:1a7f with SMTP id
 az29-20020adfe19d000000b0028f29b31a7fmr17037012wrb.36.1672955850827; 
 Thu, 05 Jan 2023 13:57:30 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e11-20020adf9bcb000000b00242442c8ebdsm38291019wrc.111.2023.01.05.13.57.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 13:57:30 -0800 (PST)
Message-ID: <7e74c8aa-8220-1c22-63a9-e577f8dfa974@linaro.org>
Date: Thu, 5 Jan 2023 22:57:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 05/40] target/arm: Create arm_cpu_register_parent
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 3/1/23 19:16, Richard Henderson wrote:
> Create an arm cpu class with a specific abstract parent class.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu-qom.h | 7 ++++++-
>   target/arm/cpu.c     | 4 ++--
>   2 files changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


