Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E4C363747
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 21:15:51 +0200 (CEST)
Received: from localhost ([::1]:53168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYCta-0007AS-Cs
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 15:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCrX-00064z-0J
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:13:43 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:33712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYCrV-0002x7-Dr
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 15:13:42 -0400
Received: by mail-qt1-x82f.google.com with SMTP id 1so24651957qtb.0
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 12:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AHURT2gf4PN9Zqp1tsMtMKDXdoev2FSqmP2G3Wf1jNc=;
 b=oDOkKwSGSpDPr3SenpYt1suo/v1P7fyBb76YR/IcthPyUmUUxD+JUUtRjzhUIh7Owo
 WC+QaQHbbPgy2Rr15CbfrTpoTF3QKK3hv0k/gtvsb/AD0wN8QHMd+FwZFo6QbEZQAUlX
 THHEgjhg12/GIsVTiUFsn5sQxDU9PJO0DJPi931y4ZCM9G9BbB8JUqrayygx2shfyK2i
 9Rvy0V2MkjDOUri5lrKNUwyYop2h+RAMnu0ryVUWyqMG1E+WNjzz0LaDT7ps3Pxer+Ec
 C+mIYkH92OPWVRKmvlUxyTSzIZaeDcIprTh3Ix9qBvvFmVG30q2QNy0tYK22yq9G+OAZ
 4tjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AHURT2gf4PN9Zqp1tsMtMKDXdoev2FSqmP2G3Wf1jNc=;
 b=gSeM2+28uDpFjY9RA/nX/RjJqCK4ztBT3ddDnrLmYjioP3TUYhNzBIRGybdsN6n+CL
 57B9ABr+d6JR1IGeRcGYtZStwBAZvJoEWdp11+U8tpHQZb1vyWheiXIgX81N6E9OKwVb
 es2u5UaxytTw1aP0Z7P7HjxDwrKa6rVWqZBD31oVb9V3vZpn3UJIR9b7mv36RjCWHtwt
 PT1Uq1vWDG+XGemcnIEa7VnSCcmRgpcY4kIsoutxq8IoQPyxuV5eQQkEpIgYpS6Cm2IY
 b8+pqlAnvXuaTuvLSlZTp3zANMdo9+4piIcvOnVrHMwafaZcJ/nF+Gea5VmaSnyGKsCA
 V/BA==
X-Gm-Message-State: AOAM5334LVwX+bHYIePyJg+zbK07f2qbXDMFNEjiFNTxfIYrqYcVwjVl
 v9Xzyic/njOergiCUdkSSqWzcpkZSZyN9Q==
X-Google-Smtp-Source: ABdhPJwhewmMny7FajUGdZJYwf5joE2X1c1MGuyuVVosKuKCtdoEqX13Vw0wNGogaD9szpsZlCx5Bw==
X-Received: by 2002:a05:622a:114:: with SMTP id
 u20mr8578080qtw.317.1618773220357; 
 Sun, 18 Apr 2021 12:13:40 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id j15sm8003685qtl.88.2021.04.18.12.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 12:13:40 -0700 (PDT)
Subject: Re: [PATCH 08/26] target/mips: Introduce tcg-internal.h for TCG
 specific declarations
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f84f141f-c49c-afd7-ffce-3de163feb726@linaro.org>
Date: Sun, 18 Apr 2021 12:13:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> We will gradually move TCG-specific declarations to a new local
> header: "tcg-internal.h". To keep review simple, first add this
> header with 2 TCG prototypes, which we are going to move in the
> next 2 commits.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/internal.h         |  7 +++----
>   target/mips/tcg/tcg-internal.h | 20 ++++++++++++++++++++
>   2 files changed, 23 insertions(+), 4 deletions(-)
>   create mode 100644 target/mips/tcg/tcg-internal.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

