Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED5743D864
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 03:08:39 +0200 (CEST)
Received: from localhost ([::1]:35072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mftuJ-0000cK-42
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 21:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftsE-00086V-U2
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 21:06:31 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mftsC-00024l-IN
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 21:06:30 -0400
Received: by mail-pl1-x633.google.com with SMTP id i5so3257326pla.5
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 18:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GG0FjW3MtKlY1zhT6IT2SFHFHvh+VM0Cj5zRo1CvFbI=;
 b=YijtiV+AE7Ib/UCUL94Md8PfekL//mh+7sz5z9B3HLAaBJMx2FVZQynbiOPbED51xT
 Je1oinZB/zCjmCzzLuv88chHvC6P9geu7BVi362t7OYxEc62moL3pelyLkmIJkczaB8N
 9wJcQtOzaaBxeGHmeAyTbtAeiCOnenhdoXqWVM0UAVDpjlzwvU72hNsB8t9OQTEah+pZ
 6QoRSVXpW+qG7pVwWKi7/jCNy9ElitHjnaezsuKThYz6vhmc2A7xUSs6Ia8Vbn2jRtFb
 sxFnkp6ZxJVd3fxHtX0UNYJGcLrSJZ0WKCwd6SWvo4Pg68ot+NKBh6G1uUYmHIKC/5I4
 yLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GG0FjW3MtKlY1zhT6IT2SFHFHvh+VM0Cj5zRo1CvFbI=;
 b=hpPo5GJdLcaksuG3b1o8HBlsXj59w0qhdmteeC2X6QJtnL/sA1AQs5YaG9ysWu5jVW
 cFGQfketFtgvZQX9t82A3o7ZF6+4QVC3KI6IW2jjfJzG10l3qLjZQmag5rHYXiK7nnb8
 ZmVyEivVv38QKe/D0kPoJA3MOq4tRWICgQONkB9d8+PPbEeygPPb1i+pDu1AAKxNyfAE
 qTN0YF/V12MZtt0wDdDsMz/mCZA7IeKstCQPou3uEvpBw6T9MVytgQ0/s82W2uGgcPvp
 XPs7tnHqK9IIRTp84z4eI/U+BlYZa9/I5RhnG9bbiqVnixOnoDf6ejBMMseTcgXCXHhH
 cgoQ==
X-Gm-Message-State: AOAM533TiZDUDIJoGd+Nk6zwrmOBxxBppxjBhnUYgT+yNnPNtqHdES1a
 RACRb0FEnVUGhq0AWdzOMHRmyQ==
X-Google-Smtp-Source: ABdhPJy5rkf3nZutmi09SyVY0ZQX2dVnY6J1vnRPDJkXBQ2SvRwzTvilZQ0n0owHhYllMCUzJrZqxA==
X-Received: by 2002:a17:902:ce90:b0:140:5de3:9cb3 with SMTP id
 f16-20020a170902ce9000b001405de39cb3mr904092plg.7.1635383186811; 
 Wed, 27 Oct 2021 18:06:26 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id f9sm1129206pfj.190.2021.10.27.18.06.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 18:06:26 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] MAINTAINERS: Add MIPS general architecture support
 entry
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027041416.1237433-1-f4bug@amsat.org>
 <20211027041416.1237433-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <73ef5ce1-3d17-6e1c-b225-e9a77514b5a6@linaro.org>
Date: Wed, 27 Oct 2021 18:06:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027041416.1237433-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: libvir-list@redhat.com, Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 9:14 PM, Philippe Mathieu-Daudé wrote:
> The architecture is covered in TCG (frontend and backend)
> and hardware models. Add a generic section matching the
> 'mips' word in patch subjects.
> 
> Reviewed-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Message-Id:<20211004092515.3819836-2-f4bug@amsat.org>
> ---
>   MAINTAINERS | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

