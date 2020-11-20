Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FF02B9F1B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 01:14:43 +0100 (CET)
Received: from localhost ([::1]:42518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfu4Y-0003wV-PR
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 19:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfu1c-0001gu-5P
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 19:11:40 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:46701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kfu1a-0008Ko-8V
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 19:11:39 -0500
Received: by mail-pf1-x441.google.com with SMTP id v12so6099580pfm.13
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 16:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vFuPDtE4aWtYF1ehfXzhkSwpn2FZR9gP4MnrXVUAl3M=;
 b=MvkCaOKZpB0mKLq2lm7XR8nUiFlpklnzTE5oC4C8xMMJdvwIaxsyuOFIZoTYe6Uuvz
 U12qXdaZJpA4x0YBgl3eQKmqcOo4m+EshjgqSbXzUNEb9V/oHsQoeNLTZd3W6KCeWhs7
 sLkg8WFMb3L1ZAXKPh1/8obo2Ne8yCWQy/9MXLMn/Yssl0G5+PlHJlj9I0NHMf6GjMFh
 BCngbHu7skMRK0rkLWVUp2oLIXvUEARo9Fu7MrmfT782f+pGzSK3Onxv3sWvmU58Dg8T
 VA3cHTJZd6PD2/ash3Pqay0qn+5Zlcx+nZ2sgCCIkHLZ+rcAbK9RiUFE6q8r+CYvhMkE
 TS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vFuPDtE4aWtYF1ehfXzhkSwpn2FZR9gP4MnrXVUAl3M=;
 b=TwlP1gQjxliJAnxO2wx4YZ/2MJUlQ6Ql0EZRmSknk+IL7VxUx/p+cpiyefu9cm561f
 KkFWAJjPA7E7NmAWaACONnt9HhT1pMmBGKxErdH353YQcw1z39IribUODOFzL2OXiZ5I
 qr63xikR37kQCnCaORrMZpVIzF6cPEB4vYlSFxKnUBTvge/18l4dTCXddcNKtP443iPl
 t1cqySY6lheZkbOepQUMNUMwrhj+hh0E79VNLGLoI/E8H0/syMhSLeTf/SnV336chVmm
 ZShSYpYfywIJX75VygVn6BbvWwRBrBzdskDHU+ztR9yN/XIQ9pdQ/MGD7GMIMcJGtNTa
 IzGA==
X-Gm-Message-State: AOAM5335nkPkkmvMw2lig6Tudo365lT8kWHmlBiv+HPVIkkiaFTz13SI
 UmYh5c3seKgXuxQE5Nrbta2zNw==
X-Google-Smtp-Source: ABdhPJyzBHJaacNIkGC63LfKrwfO2PrSqTdnzqppkO1YWHxbMuSVYljoKTjxoTNVh9qXIeGDn32rNw==
X-Received: by 2002:a17:90a:178b:: with SMTP id
 q11mr6768124pja.132.1605831096770; 
 Thu, 19 Nov 2020 16:11:36 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t7sm970816pji.27.2020.11.19.16.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 16:11:36 -0800 (PST)
Subject: Re: [PATCH 5/6] configure / meson: Move check for sys/signal.h to
 meson.build
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20201118171052.308191-1-thuth@redhat.com>
 <20201118171052.308191-6-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b75853ad-425b-b282-ca38-d89923d422f9@linaro.org>
Date: Thu, 19 Nov 2020 16:11:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201118171052.308191-6-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/18/20 9:10 AM, Thomas Huth wrote:
> This check can be done in a much shorter way in meson.build. And while
> we're at it, rename the #define to HAVE_SYS_KCOV_H to match the other
> HAVE_someheader_H symbols that we already have.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure            | 9 ---------
>  linux-user/ioctls.h  | 2 +-
>  linux-user/syscall.c | 2 +-
>  meson.build          | 1 +
>  4 files changed, 3 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

