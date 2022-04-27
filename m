Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673BE510DB8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 03:07:33 +0200 (CEST)
Received: from localhost ([::1]:50566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njW9U-0002g2-9m
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 21:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njW8K-0001dw-GZ
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:06:20 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njW8I-0001hD-TO
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:06:20 -0400
Received: by mail-pj1-x102c.google.com with SMTP id e24so143562pjt.2
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 18:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ziARmiHeQh1yOLPgesTP5YanZ5sFhocxvMf4YKtaFG8=;
 b=X+cloZHw4dQashsS74ySwP9PX3zZVbJdngdzKxcdh2yGn/8zbKLz9u4rQID/E+7CQV
 QBFOMydxrLAOq+I5CefAAjFNie9bl27GQBoJfQmepZFZmnSPrQa1MvJZrc8vYWWGh3Mj
 Em/5CTdTnjRj1DMCqIeuOR1FZY2ZBDT2yap5ZJh3ZbfzPrd1O8TPlQVZcD0DwmAbi+E+
 ++Q3rHulooDW80hZC6CFJ2jJ2n2RzvFIoEf7L1Qb7L8CblZrCZ/Bg5E/VlPPCuKSlQ9t
 8/8o7H7ywnRL+AAQuj9RvOaMmvG7tq+uj6oTaHnAVGKyfxfKwDqsWzptG8fLJ70x32TU
 U4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ziARmiHeQh1yOLPgesTP5YanZ5sFhocxvMf4YKtaFG8=;
 b=csuVqaRZiRmO+/hVtzHh6roSr445KaS7CRvwmKydIlRoyZ1tmOtqY3XJWTnBaJ2lBM
 OaPn43yQ/p5ss995l0BK3dFXBKC2awjSKHsC/4g9GasGzq5f2OMTJCcbVJhzeBEkpiTW
 yddHWBK+/RaE5X6/1PvzDHNYUqYMIuFXFH6LghLM0Q0is0Ap3xTwJS3H8V+PPqUibexU
 +3akCHMufI5Mflp/P8+0hqa1Z8zoPT4yd/7DtoB1iq5YyrY+j/nLL8hWAk2nLWhMotg9
 6BFS/0mf83NUFCE51SG5TScuSN7kh+QLuPyQkL87fjizW8YcyoxDaf648ap6y6565Y++
 w5vQ==
X-Gm-Message-State: AOAM532vLzsaAYcci5nJC5ELrtPitTaOFt8LMoKRHTjBsOS+525bO85N
 z4VLRqyE2etSpWIinLgNi30lCA==
X-Google-Smtp-Source: ABdhPJxpBx7IHva+Oi5pHWmYUPVTBX26bPgDCH2zltRKuc8fpEBCOVBJASs3Ix0+lvhNkuLpKuwebw==
X-Received: by 2002:a17:902:bf4c:b0:15c:3d1b:8a47 with SMTP id
 u12-20020a170902bf4c00b0015c3d1b8a47mr24703424pls.118.1651021576877; 
 Tue, 26 Apr 2022 18:06:16 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a62f94c000000b0050b7a347e4csm16709213pfm.96.2022.04.26.18.06.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 18:06:16 -0700 (PDT)
Message-ID: <b424b603-7de9-b480-ad31-19b5839ba2fb@linaro.org>
Date: Tue, 26 Apr 2022 18:06:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 10/26] Replace qemu_pipe() with g_unix_open_pipe()
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
 <20220426092715.3931705-11-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426092715.3931705-11-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 02:26, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau<marcandre.lureau@redhat.com>
> 
> GLib g_unix_open_pipe() is essentially like qemu_pipe(), available since
> 2.30.
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   include/qemu/osdep.h        |  4 ----
>   qemu-nbd.c                  |  5 +++--
>   util/event_notifier-posix.c |  2 +-
>   util/oslib-posix.c          | 22 ----------------------
>   4 files changed, 4 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

