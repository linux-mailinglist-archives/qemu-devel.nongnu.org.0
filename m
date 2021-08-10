Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D02603E8170
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 20:01:26 +0200 (CEST)
Received: from localhost ([::1]:34732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDW45-0002Hd-ST
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 14:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDW2L-0000As-Dz
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:59:37 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDW2J-00018U-VB
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 13:59:37 -0400
Received: by mail-pl1-x62f.google.com with SMTP id e19so8756782pla.10
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 10:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2ppz3PfObmeOAzy2E7aBboDlG2DfDxO9tQMvb74vnpc=;
 b=uHMHg3wo1A0vqz1WBMNc9Z+ypO8MEpwAQbbz//jyHiJQBArm2lgO2uArzPbGx3FmbX
 IzIYDKmGWqgh5BTvaHLb6mRVSU7xkXpfN2CzTJMVrRyWAT6h+OqNyskmmsWoWvMTKF5h
 wErXTRjL0RN5vkTGNoOTa/893x+Cb1mbRTZ7SWa5YqDwp/+GTdK2ub0m/ypKnOTh18qf
 lqftuY0ua+0JRnb6RB6npR0Ds/dbDhOG16kQIBSuFelluH/W2jNQu5Pv2hmScDkFDwTH
 AfJNXLlsx31LRvThWhxXQIW2fmAe1v5DCpb3X4oPDpszynZ2RFKvYlsK4F9kgPpeL12t
 w4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2ppz3PfObmeOAzy2E7aBboDlG2DfDxO9tQMvb74vnpc=;
 b=ivH9VrPbPRSGm6uw8WOHCsQJwr9BKou3att5eQbLtMzwG/NcYA9QPKe6/XinVWPlxz
 z6xbZdPkIDsuF2xtns5irB4W5NKjaS0gPKIKFD3kABF8hGguToQvgKLWlIGtyFLMoXEs
 KWnUjP3OQS6xL4B3tc26vNfSCdeCzxEpHWSlpKZs2LvzTxExjf2UOm3c89DtCT8ZscB/
 KvFm35aSnlC47caHCwxndTY+hMRvfKpmVeaFIKx8J4nIG02G3S6kLLv0pfQFbyXCQQYZ
 XwQ8FbzLU0G05BGNXtIbm0UcoG6k1ESyhyXywb2ODxfI7egI0Qd0ovfPITytn/d64Qgh
 6cFQ==
X-Gm-Message-State: AOAM530bT7nBoUlRSZI1keER+07AYpIkBC0r/v9cJN+UBHPNB/N7/diS
 EdYlUMAPqz74GJmE5WbupM2WwNkdgwZdBA==
X-Google-Smtp-Source: ABdhPJyLJRv5qCugLA9PEUjEh/xPABbpHbS6r3C9GhJMSwJRYfw2Bpf2SC1RYWqGlAvi2lbLPduAww==
X-Received: by 2002:a17:90a:717:: with SMTP id
 l23mr3831100pjl.186.1628618374688; 
 Tue, 10 Aug 2021 10:59:34 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id mr18sm22567777pjb.39.2021.08.10.10.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 10:59:32 -0700 (PDT)
Subject: Re: [PATCH for 6.2 46/49] bsd-user: move qemu_log to later in the file
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-47-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <16605d66-630a-9ee3-eb32-4ab0b0fa71cf@linaro.org>
Date: Tue, 10 Aug 2021 07:59:27 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-47-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/main.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

