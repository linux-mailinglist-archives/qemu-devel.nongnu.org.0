Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0EA4466E7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 17:21:35 +0100 (CET)
Received: from localhost ([::1]:40896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj1yA-0008IB-C7
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 12:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1sh-0001gF-7b
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:15:55 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:39583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mj1sf-0008PL-8s
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 12:15:54 -0400
Received: by mail-qt1-x82c.google.com with SMTP id x10so7184100qta.6
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 09:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hWkE0rYi91/OWOaMjGlK+BJG3miLMAuGrXc7foi2TpQ=;
 b=BLsICgIIseePeGzSwYXXcnsBRyMjwO1qXoJY/+/bPo6Y+hcpSlYjbYDl8MJGYBXGAe
 8uDiPl5elIstiGBn/AVIOg2yt6HcThaQauLrRh1fAo4oktSfo+ru1EFNrAuX5+A+0HXK
 N63Q/sKzevbZ8GRaLqH/eF0lrBuyV0XgwtO0AXAYsH5TqBoPHIagEjyZV7LZ1WUlyV2O
 VwaV0CJW9jK69fBbebXbyC3prLwg0Fk4DTkvZ3SK5LSmhNpKQDCO/ClT+ZKo7S8IlT7i
 1NjzaPqO24pJTFd9kKyW2FUuSkAW7Vj1APSp+4H0Kpu6/JNFLVwnUAXVYlG10ywMG4Lp
 60vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hWkE0rYi91/OWOaMjGlK+BJG3miLMAuGrXc7foi2TpQ=;
 b=zE5F+l3ve3N+kU/Y+tZLFoMOT7CJeAJDM6+B9XmwZbBwLkSqpgueLtz+2z5ZFKCr3A
 e1yoG5oyZjEtfALd5XAveQ79oFpJLoK/uAn2AwTAKQzRZqmscgDX0wE/T5B9oCXxWHHU
 wWKJ82zebixgCC/w/I3HKSXghGEATeCCpFVAhou6C1fPiyqrnO0eBAA0b1Yo3eCluR/2
 CMeznvSZTVF2H80q3KeaFCv3P6sP3ellWJLhx10i4UPGq5hQF5x4qxqiZ48zmvRDqBoh
 8AtUGceFIEBhbCT1w3CI1YNPJ8E/gi8fdQhkGTFKpMjj1ZSZ9Ui6RmPCF6t+FT+i9pad
 PKUA==
X-Gm-Message-State: AOAM530Dm6IAKPBFfSwndehzRNnPHs0SFSTbFC88wnUFgF/psVL74oMI
 AoB04lHTrEQYnP/SASe2+gJecw==
X-Google-Smtp-Source: ABdhPJxnVUyEJnmHaUM0T9q3r/o9zxSj8WpjJ9bnFCMXxiW8McuKo2LJyK0wlWK8sUvwtMUPkiUWnA==
X-Received: by 2002:ac8:46c8:: with SMTP id h8mr26185844qto.208.1636128952235; 
 Fri, 05 Nov 2021 09:15:52 -0700 (PDT)
Received: from [10.200.5.34] ([38.66.81.217])
 by smtp.gmail.com with ESMTPSA id k6sm6331651qtx.32.2021.11.05.09.15.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Nov 2021 09:15:51 -0700 (PDT)
Subject: Re: [PATCH v4 06/36] bsd-user/i386/target_arch_signal.h: Update
 mcontext_t to match FreeBSD
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211105031917.87837-1-imp@bsdimp.com>
 <20211105031917.87837-7-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4fa4db90-c456-904d-cbec-1f634c56fd9d@linaro.org>
Date: Fri, 5 Nov 2021 12:15:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211105031917.87837-7-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.093,
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/21 11:18 PM, Warner Losh wrote:
> Fill in target_mcontext_t to match the FreeBSD mcontex_t. Also tag the
> current size of mcontext and ucontext to enable size checking for i386.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/i386/target_arch_signal.h | 46 ++++++++++++++++++++++++++++++
>   1 file changed, 46 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

