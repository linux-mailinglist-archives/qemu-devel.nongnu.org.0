Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E304328C2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 23:08:18 +0200 (CEST)
Received: from localhost ([::1]:58116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcZrl-0004yf-5k
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 17:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcZpz-0003aH-1B
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 17:06:27 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcZpw-00089b-V6
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 17:06:26 -0400
Received: by mail-pg1-x52a.google.com with SMTP id f5so17365424pgc.12
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 14:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AmTE6dPuvvLkzSbBAX0gy+wR5SL2ZjkztKSsvz1vWL8=;
 b=Qo/DTvLTHViB7qsFqUAHkZWUKSH44B7UpsMZqLCGb4+ZajE3OrGtu7wlnZKyOpI2+q
 tj4YWNpTT1sXBP/T4NgfcHi+IRp42MyGnLQ/poBwHUJi0b3CAwTXPUgzmzRZYJzNbgt0
 n38JKM1nqYla8PwaeTJ88tyG7eh7W0YdkmNIKUC3ujsAYF3vNOfIIcOx2F+lrH6cngHm
 GGeY3Si6fHNTrMi18k3SLEbo06k0+osdLjGFIA1GUwiD7A4sIEXY+0UQt4zSOEh2yDFn
 2qY3Lxu7yzd/LH6IdZfZ58DjQecoYdjPr7H6p/0/rUXSUmlqiplFh2L3VXV2pRewhudR
 KYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AmTE6dPuvvLkzSbBAX0gy+wR5SL2ZjkztKSsvz1vWL8=;
 b=AHJzNqrhj7AHMdu9cO+d6BuOzlnh6jpDWZi5HTs7304SDGXUb7cBO3VR5zUCIwBgtE
 lZpIifHI2uPbxZ0TtY0O4kvzPxd08IElItbS4P9/MLRr/6/gwg0KARBXa+6idZckUYjf
 h2rpRZpAepNwxlbkTkjJGcOLOFbhvSKv27tRe+FJUne+iZFeH9s+EMGg/hTElHp5usKf
 Wfg8fsPsBVkpLii1cQbCkeDiGJJ29SFSfdyjYxo50bIg+YLwNrtkCzcXFHkxiKdP7hBK
 OZSz4ZUhfcuA3QB5Mbyc7HHkJk849d7zxxnYRh8rTc4ByYntgmH4qu9fhKjqngaTBqdi
 sJSw==
X-Gm-Message-State: AOAM533XrATGmGuXBiWRTZL8tJ5RZqR4+SZzSlVJ6T3etgVNIASbeKms
 9H9552H5pjPnV7ITQtJP79rftw==
X-Google-Smtp-Source: ABdhPJzF9lfYFqqSF2MpoAinPXAaOnkfAasGC/ZbHVt2THCmCBv5txJb3RLXaZH2K35PxT0dVw/diA==
X-Received: by 2002:a05:6a00:1592:b0:44d:25e9:759e with SMTP id
 u18-20020a056a00159200b0044d25e9759emr30530029pfk.19.1634591183415; 
 Mon, 18 Oct 2021 14:06:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 184sm14215714pfw.49.2021.10.18.14.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 14:06:22 -0700 (PDT)
Subject: Re: [PULL v2 00/23] Pull bsd user 20211018 patches
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20211018190115.5365-1-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <896210bb-e8d8-7ba0-6cd7-15022db55df3@linaro.org>
Date: Mon, 18 Oct 2021 14:06:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 12:00 PM, Warner Losh wrote:
> The following changes since commit c148a0572130ff485cd2249fbdd1a3260d5e10a4:
> 
>    Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20211016' into staging (2021-10-16 11:16:28 -0700)
> 
> are available in the Git repository at:
> 
>    git@gitlab.com:bsdimp/qemu.git  tags/pull-bsd-user-20211018-pull-request
> 
> for you to fetch changes up to 5abfac277d25feb5f12332422c03ea1cb21c6aa1:
> 
>    bsd-user/signal: Create a dummy signal queueing function (2021-10-18 12:51:39 -0600)

Applied, thanks.

r~

