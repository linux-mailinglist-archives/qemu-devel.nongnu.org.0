Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B7441F204
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 18:18:34 +0200 (CEST)
Received: from localhost ([::1]:57266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWLF3-000331-CI
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 12:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWLBn-00014Q-8N
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 12:15:11 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:34403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWLBl-0007mQ-1z
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 12:15:10 -0400
Received: by mail-qt1-x831.google.com with SMTP id m26so9465408qtn.1
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 09:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Oc2TQftVARBTuNj8QEScT3QNMoITuHPxUgxI+y5lUqg=;
 b=DyWowoiBozLR9A7Ipzb1nEAD7a8B08nBOzCZsojIKzlcsWvfmUZ07gM4TCjT3c4fZM
 +eM01GeFol9r+41BdyHiz4FPNLvldroJTcjP7G33SKsajoh7+QPMnY0x3936utKLEE7S
 WdHZ6loTPyLbMZTYeHAmmBflbBvqmUe/leT3d662T6JSQr+6PmX/7M1qhz3ik0rzn7tN
 KBpFygaaMSN7LSWuyhV5yHdiSz5AyjNeo4fvhW7ytVj6qj+9CNvjTOVHxC7ouMy9fF+K
 xnPLrYJIyLL6XQKdhbKko2DntjIOmCKHXP/zQq41BiVOxBPEGTmcdPtAgAs2qjDhlY5t
 mrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Oc2TQftVARBTuNj8QEScT3QNMoITuHPxUgxI+y5lUqg=;
 b=iHeqe2ql4X0Zd2e700XYXIdJJVK51H3W/QJ4DsgQ/VjTHsXE81ia6RA1YLPZrhXiHv
 8RTPrWUNSRn0qW2nD4OsLfBePnqSX486hQPoHevBaJMazICXtjbPayZsI9SKt2ptBFtI
 VSbrUMm8QA9+BajzKUPKZLi5FjaS+Ut08CiP6/errdGSwtw3yR0Gf1diUtIbVxD5cLPm
 +0TRdHQr+VIGNaHNvxQhuPD52SZBV+jvBTUlwONyMC46SFDlz0VvnOXaoCj7cqUusRST
 QxbMdwevrJf346wondp3KU5xBtW6nQUowoQeUXHbOdcHtzU1kZFJogHly7KqnXwqCmhI
 f8Ag==
X-Gm-Message-State: AOAM533WbiCmUbOVsEnp3OmWFcJbH0Yo43HcnGN6xB00R44my+0bOnmx
 hRcl+ht2QYR2vOcFgM0/7UL28xGFQoGPGg==
X-Google-Smtp-Source: ABdhPJzQ66TZD3oRu6NXscufa4lOZIfB1UPRfHg2bNQnpsVfbI4gU3H86yGUFb/NBRcyjkNF7fWUOA==
X-Received: by 2002:a05:622a:4d4:: with SMTP id
 q20mr14206909qtx.57.1633104906653; 
 Fri, 01 Oct 2021 09:15:06 -0700 (PDT)
Received: from [192.168.3.43] (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id m68sm3261123qkb.105.2021.10.01.09.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 09:15:06 -0700 (PDT)
Subject: Re: [PATCH v2] configure: Loosen GCC requirement from 7.5.0 to 7.4.0
To: nia <nia@NetBSD.org>, qemu-devel@nongnu.org
References: <YVcpe79I0rly1HJh@homeworld.netbsd.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1ad2a2e3-89ec-f0d9-ac41-a24391dde01e@linaro.org>
Date: Fri, 1 Oct 2021 12:15:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVcpe79I0rly1HJh@homeworld.netbsd.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.127,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 11:30 AM, nia wrote:
> As discussed in issue 614, we're shipping GCC 7.4.0 as the
> system compiler in NetBSD 9, the most recent stable branch,
> and are still actively interested in QEMU on this platform.
> 
> The differences between GCC 7.5.0 and 7.4.0 are trivial.
> 
> Signed-off-by: Nia Alarie<nia@NetBSD.org>
> ---
>   configure | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

