Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D6D4A92D8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 04:49:58 +0100 (CET)
Received: from localhost ([::1]:59078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFpbh-0006qr-1Z
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 22:49:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFpZd-00069N-Kn
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 22:47:51 -0500
Received: from [2607:f8b0:4864:20::52d] (port=44953
 helo=mail-pg1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFpZb-0002vL-27
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 22:47:49 -0500
Received: by mail-pg1-x52d.google.com with SMTP id h23so3984316pgk.11
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 19:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=R5px3FrMaR8BFQCrjAIiSnTaXlzDVbB67TTERhCLSJ8=;
 b=SIMfZo2emEvqiD5xiFSp2+GA/M3QnO2Xh7WXL6tIgY1L2hjxLTEYcXFsknptQgpE3c
 gl6oPrilooW62kSRl6R1RAKrLXjQo8ZzxMQxOCpJKxJmVl/kLYyvI+MY4aCtxWp52+fA
 uJB9t+1UUochE8ksdvaIASowYyuhq4CQpE6J2f39D3oJmfmFWPuGzT7aIs+cyUNcnB83
 ck7f2S38Gro1eu/I7+09wrQG4hlZVDpUAITO0H4pJI7EeNGuuU2sLojsdMawzVbUiVG6
 1zPaIXmSluHhJwgjOAGGAaTaS3cR4O+JAg3xzZWgMY/lktaluXKdH+uXtu2Z+wtSlplq
 Qx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=R5px3FrMaR8BFQCrjAIiSnTaXlzDVbB67TTERhCLSJ8=;
 b=73M+R9FpRioVVZ8YgUO6y3z5bebt1Gbyo2Qx2OkBSv1QSIFQ4Azm8n45pVCbJMrpXf
 wUGJQFIoF8sh0t1iR/Fs4ZEcpd40KgBXtZIhkegj9Tv9WXobRt+NlOENAxlpR8FRg5Gl
 mHgUbZDrcRFGdHxnoSMKquZUiuGOEzoWJQVjvmP9yQDR94Sf7GRUCi1MKWuyLoI6JRvJ
 A9nQsq3f552bRbDQc7ihSX+Ssf8m9NTZLg53Sn+X3yLS63AoyDAjaSEoovJAQ77B4H7j
 QtE1NpZDhus8snwAhj7W6xPPyBelgO4zKitNpzeIenGsGCI7BXbfdk7P+BjMTTCd9MJG
 yI3Q==
X-Gm-Message-State: AOAM531zWuhywzrTj+xDp21ttoigCSbnx2Jqkl35CXNe20qLjgkhWbox
 KGf8a1/EEyUev/o8y3ohbNg8Jg==
X-Google-Smtp-Source: ABdhPJwfD6MPwbkPoE19dxqPlFG0KECZufIhO86AehMpGO+HUVI013gA1pRvWJ+LRD7B7c8WrcQhnw==
X-Received: by 2002:a63:fd14:: with SMTP id d20mr927561pgh.369.1643946465139; 
 Thu, 03 Feb 2022 19:47:45 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:40f3:c91a:302f:9154?
 ([2001:8003:3a49:fd00:40f3:c91a:302f:9154])
 by smtp.gmail.com with ESMTPSA id nl12sm13606946pjb.1.2022.02.03.19.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 19:47:44 -0800 (PST)
Message-ID: <a6c2a36b-1aba-ea0f-a389-4a52a6007ba8@linaro.org>
Date: Fri, 4 Feb 2022 14:47:38 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/27] meson: use .allowed() method for features
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220203173359.292068-1-pbonzini@redhat.com>
 <20220203173359.292068-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203173359.292068-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 04:33, Paolo Bonzini wrote:
> The method is now in 0.59, using it simplifies some boolean conditions.
> The other new methods .require() and .disable_auto_if() can be used too,
> but introducing them is not just a matter of search-and-replace.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   meson.build       | 42 +++++++++++++++++++++---------------------
>   tests/meson.build |  2 +-
>   2 files changed, 22 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

