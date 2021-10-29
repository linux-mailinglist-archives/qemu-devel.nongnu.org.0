Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A1444012D
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:22:12 +0200 (CEST)
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVZz-0000yL-CF
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:22:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgV3G-0003Iq-P2
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:48:23 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:37787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgV3E-0005Iq-Jv
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:48:22 -0400
Received: by mail-pf1-x434.google.com with SMTP id v193so9764856pfc.4
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 09:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=R5xIXLSpxx0QQ7GFqsOUQDm+O/z0e1oGGXo3nEOFCm0=;
 b=n05KAMZTvaDKoPqmOR+hlOViS7hBnx0aZbCsrMxAr64u/p6QAAHd49CwL0FiORXNXW
 BZZ+hzOfrbHhZX+s8nAQ3ZP3ZznR6Bv5ooBh1BP1pDt81c/QzRZCy1VhsHJE3RCZyvY/
 nwXYS+uuSj2we1PLSVme4PhlUkQ4LmWldD8s96Xh/nFvWQ3qajhiowBGQrcCLEjY9muG
 v/2DqHyrQH5E83IcrnqYgAP7PsNn+VWHiyeQ8Y+n6L/WtlnUD/aydNlIvzS1tHi7jQbJ
 gCfdpEIsAZmE0BtHVNI6vL4209U3PO7VzDqKkFKk4Ng60NmLoh6gbQiqo4XTa851PlhY
 g+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R5xIXLSpxx0QQ7GFqsOUQDm+O/z0e1oGGXo3nEOFCm0=;
 b=lBilJmqpseXFxim3sWu3xXNgHic01JDtBFzXDlt7cawGI6mMSeEZZcZX89QkjacKXy
 AcEdD+xD48BztWWMFOsXW/ExYDZ4xSunxbHCoTb5s+zXzSRR8V/upQeeH2doPALowSWu
 3TlmXrLFiiNMrjXemqqnLwkUdfvWoDd8PC1+V2NCxeezDzUo0PGtgBpxMWsU5SPLdFkP
 p0e/fOiAup1oVXMqbm0VYbTC5qsOn6kiC01jHrpP+wvmxicjM5o42Ckoy0uXbpNm8WmM
 SYFtxC40hlUGkwExf0x5wukqf1CMLNHafLLDxfPadhl93ydXNRx19fSuElBpGAaN72DB
 Nnhw==
X-Gm-Message-State: AOAM531hpKJPrweX5ycKex+b5DD2ADOXfeIZFPHjhKuBbgRWAmAnHeAB
 YCUc4pUjQR1TFAt/Lv9HlK7zJg==
X-Google-Smtp-Source: ABdhPJyGH3lxwJ4jatyJIm54mipLcjLLeLkre2t2lUglNuDEKY6WUH4I0k47uMy8EMRPN+pyRwAhsg==
X-Received: by 2002:a63:6e4d:: with SMTP id j74mr9026224pgc.257.1635526098893; 
 Fri, 29 Oct 2021 09:48:18 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id d11sm7808929pfl.173.2021.10.29.09.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 09:48:18 -0700 (PDT)
Subject: Re: [PATCH 1/4] configure: Remove the check for the __thread keyword
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20211028185910.1729744-1-thuth@redhat.com>
 <20211028185910.1729744-2-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1db9ea51-2813-2720-3ab8-fff88ffff134@linaro.org>
Date: Fri, 29 Oct 2021 09:48:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028185910.1729744-2-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.512,
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

On 10/28/21 11:59 AM, Thomas Huth wrote:
> We recently bumped our minimum required version of GCC to 7.4
> and Clang to 6.0, and those compiler versions should support
> the __thread keyword already.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   configure | 11 -----------
>   1 file changed, 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

