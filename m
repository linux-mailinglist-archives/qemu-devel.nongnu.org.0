Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B5551602F
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 21:59:00 +0200 (CEST)
Received: from localhost ([::1]:51586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nktF5-0008Sm-A5
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 15:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nktCj-0006tk-Du
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:56:33 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:46715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nktCh-00074f-OT
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 15:56:32 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso4517992pjb.5
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 12:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ublz+pvZyrZwuFd1Rro3eWmABWwHFen7sUnHyRuUc4U=;
 b=B00SGgUpDRXpIvAKPFn0MR3JMQfNChCEuVVB5Pl4fQJZI9X3EXJCbKo6P7jnaiObBt
 PoOllcsXcyFuupRmgcRXObhh0/FDCBarFTqhOlOV+MyaV6rR8xsfJicHH4SaZvBOIauP
 bRnXrvp+Wp3grcH0vaaUfUnRtAK3i94wg7mabUVGEEyCk6i0MTwhnE4mTD6w0++E3HL8
 mbRicjdAY3HTdww5Nz8j5CtagUa06X9Q0mIU8Xsx8wbqppOOxdNKQNPxTjdfGxjBBX4z
 EIXpdFIw89xyTdheAYZgTSmDQr9odT/XH0inZGSjTOSndaSIg7XAt0Qzzh1CNi4zWhtb
 WTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ublz+pvZyrZwuFd1Rro3eWmABWwHFen7sUnHyRuUc4U=;
 b=yX5izZgjA41QikKXq0vaZpJNLLB0AmTBTnaQUhnMqWzhckdWQ5WGSGnK/3NbpdHv6m
 dqPzkqdEsfpiPQtmQOYCn474+8cjsdTa7mK+NaB8tqJiwHAZq2yj34vWlRnuZsEzoMcT
 LzrPnkpE3N06jDgaZW3WUkok6Rpyz6fAH87uJnGwNCrTtgqgqE5XG9Eoe3hWZNPb373Y
 zzCa66floED+mTt1WNrzm/VvzB1tBJofBc8J0yoNHBrE7/z1yNBg4QdeBRuW6I5HVJJ6
 F7pjNlCofx8NrDrBZ3X0OQbHcMfIHwSBq46Sp6kEHNtnL4cAWatUIvSGXCeERqkSbXNC
 NhoQ==
X-Gm-Message-State: AOAM532zPD5dbh7sgMUV5sBigBox7Lg6VNJkpOxppYgaxTn7zWhNZjiZ
 UPx07HeRl2/uQgAGHmF/p5aN4A==
X-Google-Smtp-Source: ABdhPJzG6izdVdvhdNS6mWulBdZquogNuFiooGL4wtypvN/GALXcFx0dncI3OnvS22LyVLDlSewv7Q==
X-Received: by 2002:a17:902:c641:b0:15d:36e:cfa9 with SMTP id
 s1-20020a170902c64100b0015d036ecfa9mr4833889pls.67.1651348590335; 
 Sat, 30 Apr 2022 12:56:30 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 r7-20020a62e407000000b0050dc7628183sm1951984pfh.93.2022.04.30.12.56.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 12:56:29 -0700 (PDT)
Message-ID: <b2fa4a7a-fb91-6865-a683-ae35e580c011@linaro.org>
Date: Sat, 30 Apr 2022 12:56:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 09/12] pc-bios/optionrom: detect -fno-pie
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220429141813.328975-1-pbonzini@redhat.com>
 <20220429141813.328975-10-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220429141813.328975-10-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/22 07:18, Paolo Bonzini wrote:
> Do not rely on the detection that was done in the configure script,
> since in the future we may want to cross-compile this file.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   configure                  | 1 -
>   pc-bios/optionrom/Makefile | 3 ++-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

