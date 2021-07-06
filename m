Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE0F3BC7D2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 10:26:38 +0200 (CEST)
Received: from localhost ([::1]:41624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0gPd-00066H-8t
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 04:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0gO1-0004IU-Kp; Tue, 06 Jul 2021 04:24:57 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0gNz-0008V0-T4; Tue, 06 Jul 2021 04:24:57 -0400
Received: by mail-wr1-x430.google.com with SMTP id a13so24977906wrf.10;
 Tue, 06 Jul 2021 01:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0ySQRSZ8jjmhlVxquqYSKh7mC06W+9D7QTTMmCG1iho=;
 b=LXy6k+Kxo7PpAZBm3+fh9s5EAgMsWstXOGW0cXQ1od5W4yJhrQNg4RAQp/AyLQ0ZWk
 80RVkGJvvfFbGsIC+S/whXwtLAT3SpJqAFYjtBI2AxECEEjRiStqTrBpsjrYmqWHJosO
 RheGbP66p2FuEbTEU0I1wfJTfMlon2siBPo4W29pyfn6lBOrNNIRNMDXNtdL+I3GaJ1Z
 5GB3yMK/g/BDk9vKojwTe16tSiZj4Xcn9507l6+ujsPO4FAP3jQWs70E5433xZnGCm7f
 wtlZUJQAXBpCM2pcPYUxRLFxGN/e7Xzk691PFLu1owyIM1EDq6fFDCJFjw/h92QlSbP9
 jTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ySQRSZ8jjmhlVxquqYSKh7mC06W+9D7QTTMmCG1iho=;
 b=H7VfpmwlylwGDcRCcvlrcfYf2aPe7vromzej9fxt97zBDB329uzK+hv5IE4Hud/Ymu
 RiXqfc/LL2hLqwwu4EkQC+5mBpvxso8167y9SWA6xCZJD6GDRksuiGwVE6C3h/9VFWG7
 n10qUVUalzEhZJRDsgkvwYu3bJoKhEzsywOfzZwv+wpNfpGZguX9nEB2iH1xDHYrIHCd
 kxv0vtqXLjVRH2Iqy74S1aTfFcj0AuxHcGR4AFK53+UDwGRdgS7ir/MFctuaoMnh95Mi
 Z6+NFaawwO9zF6Cx3xsNikyM2i1iog9zS9gVKBiNLlY0e++E13Fsg0hAlQtPvFEh0MeW
 Cfcg==
X-Gm-Message-State: AOAM533fSTmgQFMFFihFBI76+AAfxNpHwTpbfaFHUqW7j/ovPt8TbtKS
 EjKrr/RX7M6T7q+dWFLOsGE=
X-Google-Smtp-Source: ABdhPJzUQtQyA8rIqlaxLQLZSasS1vsyosz/kR5wiRi3xetMA5jLVI3kzopPGQ7NkDQDp7X8o0RnNQ==
X-Received: by 2002:a5d:6786:: with SMTP id v6mr14645553wru.290.1625559892980; 
 Tue, 06 Jul 2021 01:24:52 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m29sm1949867wms.13.2021.07.06.01.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 01:24:52 -0700 (PDT)
Subject: Re: [PATCH] target/xtensa/xtensa-semi: Fix compilation problem on
 Haiku
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20210706081822.1316551-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <dca82fe8-0cc1-d141-eafa-d3bc0934ceaa@amsat.org>
Date: Tue, 6 Jul 2021 10:24:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706081822.1316551-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Richard Zak <richard.j.zak@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/21 10:18 AM, Thomas Huth wrote:
> The errno numbers are very large on Haiku, so the linking currently
> fails there with a "final link failed: memory exhausted" error
> message. We should not use the errno number as array indexes here,
> thus convert the code to a switch-case statement instead. A clever
> compiler should be able to optimize this code in a similar way
> anway.
> 
> Reported-by: Richard Zak <richard.j.zak@gmail.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/xtensa/xtensa-semi.c | 84 +++++++++++++++++--------------------
>  1 file changed, 39 insertions(+), 45 deletions(-)
> 
> diff --git a/target/xtensa/xtensa-semi.c b/target/xtensa/xtensa-semi.c
> index 79f2b043f2..fa21b7e11f 100644
> --- a/target/xtensa/xtensa-semi.c
> +++ b/target/xtensa/xtensa-semi.c
> @@ -95,59 +95,53 @@ enum {
>  
>  static uint32_t errno_h2g(int host_errno)
>  {

> -        [EFBIG]         = TARGET_EFBIG,
> -        [ENOSPC]        = TARGET_ENOSPC,
> -        [ESPIPE]        = TARGET_ESPIPE,
> -        [EROFS]         = TARGET_EROFS,
> -        [EMLINK]        = TARGET_EMLINK,
> -        [EPIPE]         = TARGET_EPIPE,
> -        [EDOM]          = TARGET_EDOM,
> -        [ERANGE]        = TARGET_ERANGE,
> -        [ENOSYS]        = TARGET_ENOSYS,
> +    case EFBIG:     return TARGET_EFBIG;
> +    case ENOSPC:    return TARGET_ENOSPC;
> +    case ESPIPE:    return TARGET_ESPIPE;
> +    case EROFS:     return TARGET_EROFS;
> +    case EMLINK:    return TARGET_EMLINK;
> +    case EPIPE:     return TARGET_EPIPE;
> +    case EDOM:      return TARGET_EDOM;
> +    case ERANGE:    return TARGET_ERANGE;
> +    case ENOSYS:    return TARGET_ENOSYS;
>  #ifdef ELOOP
> -        [ELOOP]         = TARGET_ELOOP,
> +    case ELOOP:     return TARGET_ELOOP;
>  #endif
>      };
>  
> -    if (host_errno == 0) {
> -        return 0;
> -    } else if (host_errno > 0 && host_errno < ARRAY_SIZE(guest_errno) &&
> -            guest_errno[host_errno]) {
> -        return guest_errno[host_errno];
> -    } else {
> -        return TARGET_EINVAL;
> -    }
> +    return TARGET_EINVAL;

Matter of aesthetic taste, I'd have use a 'default' case here ;)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  }

