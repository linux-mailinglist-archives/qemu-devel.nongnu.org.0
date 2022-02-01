Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4298F4A6A52
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 03:51:10 +0100 (CET)
Received: from localhost ([::1]:40922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF5jg-0001vE-Py
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 21:51:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0s6-0005LQ-8T
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:39:30 -0500
Received: from [2607:f8b0:4864:20::1036] (port=45748
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0s4-0004rc-PO
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:39:29 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 g15-20020a17090a67cf00b001b7d5b6bedaso3985135pjm.4
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 13:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8uvdicvAKt52S73zjmQ3Ej9c8FAYKPqCm6zV1ull15o=;
 b=JKC8lmR19foBDK774wyOnH77ZePgRzHBH6Fqq3dv5ImwbZmK4Y9kMhA+bcmgJo2rkO
 XDuhS6c6yqgnjnAoFihVmY/ydTEJjzvXZFDQXSm67g73uxPUZWjbHCNPqUj6JE/sjx7w
 LlvIGcEcF0rNaEEBMpgykUwbOhpbfuAkFozRJlA8ioQUTf89QuvG14FPZ+Alayv4nv3v
 uVg2Wwjj7RXKkr5wtQvlj48dQvpZIOzvBkVbuR6uVSEBNa8o/MBaq4/dVV3z18/KcBt9
 GFshl01fWmX8GnD5RJB5GuO8basxTgyfPdLX0FjOVg/GMRE34Ryj/DwarbP02EzcCbYm
 BZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8uvdicvAKt52S73zjmQ3Ej9c8FAYKPqCm6zV1ull15o=;
 b=ZGJz4068eJdXQG29uLVeTrbBONMBe1J8j7CFEY6gSf5avqnj6PJ7wKtYCju4HJrUqx
 HPP97cSMm6u5nh43ztudqGxYAvZS8I1FqfaB6BRO2AzsTIrUb0UiYX3tlpM1s2IXknwm
 QC3r3GwwcbDBtNkLC1szZyh8tH2k+r1f45MjRVk/R/OFoDEu7VeiogDKU+ssPYjlKE8b
 HEMxpREuuIrEQToBUcz5AKQciqho3rNf+RVHTgtFySK9HiYt7aPQK6/P51vpGyQtaPKU
 LwETPbW0UiOyzW0FZyH+KvE7p6to6UbuX3HjXzjdk9zgw/Tzn7cS/5jKnu77MzcHCTqb
 9uPA==
X-Gm-Message-State: AOAM530j7lWMRfDuwNjjOMmEuI6vASpZ5oy1+j5EnSeQEQboMh58ATCB
 mNVEzEcorvnJvycQl06A7bB9Tw==
X-Google-Smtp-Source: ABdhPJwTfV1kcEl2LzFiaa6QoT3ZhlgD44+NtQv275VZb1tTL6KRpvwaG8P0Z3vjDtRVIDJdnexvig==
X-Received: by 2002:a17:902:f54b:: with SMTP id
 h11mr28520329plf.58.1643751567320; 
 Tue, 01 Feb 2022 13:39:27 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:4f14:faaf:dae:66e4?
 ([2001:8003:3a49:fd00:4f14:faaf:dae:66e4])
 by smtp.gmail.com with ESMTPSA id lp17sm4183686pjb.25.2022.02.01.13.39.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:39:26 -0800 (PST)
Message-ID: <fc3b5ffe-ec90-a736-56ce-2bfc46ec159c@linaro.org>
Date: Wed, 2 Feb 2022 08:39:20 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 22/22] bsd-user/freebsd/os-syscall.c: Implement exit
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-23-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-23-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 arrowd@FreeBSD.org, Kyle Evans <kevans@freebsd.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:14, Warner Losh wrote:
> Implement the exit system call. Bring in bsd-proc.h to contain all the
> process system call implementation and helper routines.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsd-proc.h           | 43 +++++++++++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c |  7 ++++++
>   2 files changed, 50 insertions(+)
>   create mode 100644 bsd-user/bsd-proc.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

