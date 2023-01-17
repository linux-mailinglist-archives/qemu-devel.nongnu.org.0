Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B6C66E0CF
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 15:34:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHn2M-00011f-7o; Tue, 17 Jan 2023 09:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHn2K-0000zl-17
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:34:04 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHn2I-0003tw-7E
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:34:03 -0500
Received: by mail-wm1-x335.google.com with SMTP id l8so5269710wms.3
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 06:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QsLcKWLYXJdYqa0NgVBgaSgoMJw429vWTcgj9Yw5hnY=;
 b=qNIaff5lPWLwuhm7H1e4UnBXMzCoBuVX5YLmd6wFsIbwcW33t9JX89t+nG1z9KpJ6A
 RGmw46HQ0rUXStnR7gMHIo1GY5mCBXLsVrg8OhBkcBWoZ+kEZE9PVRNmBkCHY+Dhi/qG
 m1sSIL5dPusiLNSVAfQ+/gvli5YBluWbjvQVA+H23oi6AAVz4Pz/4ftZt0o8PKkORQQn
 htrvapR3evw29Z38tNLtEsIyFw/A3GjphAy1itnAz2v7Rj6UuZHRmCfGGQbhEY3fzJyW
 0l1lkgE3zMIJuovT6MUGYYWJp4i8Ie2oYrYavDeK6ie5XXOOW7cQak6d/HvJyZiG3h8x
 bm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QsLcKWLYXJdYqa0NgVBgaSgoMJw429vWTcgj9Yw5hnY=;
 b=IrPsEDWzhLQMYtfrTMjgQLcXhmcMB5/9PUyFcqBU55s/XpX2SYPvHHhE3SeQJTwRFs
 kWDZ5n9Nq8Hv/JJ6kXEFScUR6l8KYVi0uN/FISe+EHeA8pA7GFJ1kRf+aLC6hmY6l9OJ
 NhKtcuiIRWta4oXm+Nd27BRB6eJkEzl/kQb1rs7hGYba6d7NXRQIx+wrFoZNuhaQjEWn
 Tm2qDansz1AGP1rnf7jtCkpMbfl36qKamUDE8y+tkHDPKzhMvA+5pZyyXM8IYifSIdZA
 As1jswWxElAmewzS3m9xwi7LGI3CHnQ8F7dKrPjM05/ChNp2Bbo9XvDw6u2AX4mqtFOA
 dFoA==
X-Gm-Message-State: AFqh2kpaqnFxqTuXsebJaKFEdJjEP3D+400zDBnN2Sqtwz2JgAXLPpfg
 HOy/MO3YJlOpMtOibluJkjUJyg==
X-Google-Smtp-Source: AMrXdXv2MOud4w0BmHMXyqg/vQ1B1RHvFSVmmX3uMhWzl1mmdfopdY+j5vzBX09Z2Eer0JQU8hn2og==
X-Received: by 2002:a05:600c:1c01:b0:3da:fc07:5e80 with SMTP id
 j1-20020a05600c1c0100b003dafc075e80mr6736329wms.12.1673966040326; 
 Tue, 17 Jan 2023 06:34:00 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v12-20020a05600c12cc00b003db0bb81b6asm1308106wmd.1.2023.01.17.06.33.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 06:33:59 -0800 (PST)
Message-ID: <48125c54-b421-6ed6-5af9-b05b8b249fd1@linaro.org>
Date: Tue, 17 Jan 2023 15:33:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] util/qemu-thread-posix: use TSA_NO_TSA to suppress
 clang TSA warnings
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230117135203.3049709-1-eesposit@redhat.com>
 <20230117135203.3049709-2-eesposit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230117135203.3049709-2-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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

On 17/1/23 14:52, Emanuele Giuseppe Esposito wrote:
> QEMU does not compile when enabling clang's thread safety analysis
> (TSA),
> because some functions create wrappers for pthread mutexes but do
> not use any TSA macro. Therefore the compiler fails.
> 
> In order to make the compiler happy and avoid adding all the
> necessary macros to all callers (lock functions should use
> TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to all
> users of pthread_mutex_lock/pthread_mutex_unlock),
> simply use TSA_NO_TSA to supppress such warnings.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   include/qemu/thread.h    | 14 +++++++++-----
>   util/qemu-thread-posix.c |  2 +-
>   2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/include/qemu/thread.h b/include/qemu/thread.h
> index 7c6703bce3..81ec9fc144 100644
> --- a/include/qemu/thread.h
> +++ b/include/qemu/thread.h
> @@ -3,6 +3,7 @@
>   
>   #include "qemu/processor.h"
>   #include "qemu/atomic.h"
> +#include "qemu/clang-tsa.h"

Missing file?     ^^^^^^^^^^

