Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F454AAD27
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 01:24:07 +0100 (CET)
Received: from localhost ([::1]:45214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGVLa-0006pl-Lb
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 19:24:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVEo-0002vk-5S
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:17:09 -0500
Received: from [2607:f8b0:4864:20::42c] (port=42553
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVEm-00018O-K2
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:17:05 -0500
Received: by mail-pf1-x42c.google.com with SMTP id i65so8414993pfc.9
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 16:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z295obw+LzxsoeNc1dW0B/GLITMAdbM34Ga3ZYTmamg=;
 b=a6LvcfACBRVb4l+fWyVYBFn9sSBkYcr5RHIJztTaftAm71VnAoN01EOu5gM4nWnKfd
 eVYBYujYSQ7f13I9x1fRR/f00bJwe3Tjt3C3NmQd2QLgqKEqxw1NItAFI0dFzPjvywYi
 GAeSkuLGP4C6Mup0vNtMP/Uz1VMzyw6VJRxbtIcZeROjemsTupH3qMhqrpBIcCzKQK5n
 fqcUSYUUo1ekFCZfbEus5dI2g5GvFfdpYArTPMbcLI35xljyPia/OLdqIBsNh6XXJThZ
 J08yiFu3Pxu1eW7lbrmpPL0ky5KwXYFV+fMO3HnIbk+CiNFx3ld9CJgglJRzsfSV2sE5
 59qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z295obw+LzxsoeNc1dW0B/GLITMAdbM34Ga3ZYTmamg=;
 b=xcJ6FGRZ3WYOt1wCqcDVghWkNkvkkuZytHA/IMpYVUMkBxWma00UvjoW9SWuqOuOag
 4kMfLy7wRBAsY+UEiKwKp4NwRb8KhrGy2noPOBs4jo2dFeIZ+QEa3hLNEvKhaKQBzLZw
 y28qSbNL0ds8XS/9h5SFmLDicYzd5YFrSC1T7e1GSmf6sxNoSXrJC1Y2z849AJgCop3s
 DK06AN9GcZGbwUD2JupUVoGwhXEHy5TnUrCY4Gi/ok9lGn6yV3NmDvUgXDOksuEcibiJ
 Z5/sUJCbC84FvEcoiEaKkMCdCyZOnlgfLfI9CyG+bgs2hCmhYHtar+723HxH1vOXTXDu
 q0dA==
X-Gm-Message-State: AOAM530q5duYYMo8ZUCUbSX5WjI/ftU4TiKeJrohQ+XwhVX76cn00qpf
 P5XTfzKVfgTfGr3gojiHlmHeTw==
X-Google-Smtp-Source: ABdhPJy+n3zRvAxmFf6/VrpnYA+4q6VYCHWMu5SnsdiT9H7QWOlOhxx84T67TPSbLZOfQZ31nSFWhg==
X-Received: by 2002:aa7:9a45:: with SMTP id x5mr9732259pfj.57.1644106622800;
 Sat, 05 Feb 2022 16:17:02 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id z17sm4472486pgf.91.2022.02.05.16.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 16:17:02 -0800 (PST)
Message-ID: <8cb48f72-6509-23fd-2ac5-ae92d80317ae@linaro.org>
Date: Sun, 6 Feb 2022 11:16:57 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/6] target/arm: Make KVM -cpu max exactly like -cpu host
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
 <20220204165506.2846058-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220204165506.2846058-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/22 03:55, Peter Maydell wrote:
> Currently for KVM the intention is that '-cpu max' and '-cpu host'
> are the same thing, but because we did this with two separate
> pieces of code they have got a little bit out of sync. Specifically,
> 'max' has a 'sve-max-vq' property, and 'host' does not.
> 
> Bring the two together by having the initfn for 'max' actually
> call the initfn for 'host'. This will result in 'max' no longer
> exposing the 'sve-max-vq' property when using KVM.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu64.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

