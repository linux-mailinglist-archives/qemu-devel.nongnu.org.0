Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14092FE219
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 06:56:06 +0100 (CET)
Received: from localhost ([::1]:45436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Swv-0004wA-Bw
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 00:56:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2Svb-0004UP-Pp
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 00:54:43 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:34500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l2Sva-0005QQ-5m
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 00:54:43 -0500
Received: by mail-pf1-x42b.google.com with SMTP id m6so880163pfk.1
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 21:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WTGKUa9Ir3XUY2m2iaiWW1RFWFTQMiIIXYdGRTp0w70=;
 b=j3l3ap2gzEY6Zg5x9yK6M4Qsbn5TCbFPZvYC7WebrwnmJvXanA6Wei0u0MtfGl7glu
 YVYe8/UQT5rpRR2xLlp9ynqj/8ZuvcDC18Ser9qAIga22AAtD5/uEKnkpfHE+/rDu9bu
 xNg+EObBJedlGdr0ik8sfC6yUd+Ub/+HeGUlWrM9vVpTB0/5bVHo2WW1iW4BWNmTUbuY
 GRYV6ndBt+EDoQEuzfpZ947benbnHwrWN/Vx1NKPpLq7Rao8tPL/ODabjvsHRLkpPp8S
 oVHpCVQqBgUhIkqp+ly34UyKpECA+H1svR7tD6Kj6PNxs9vl+zpWZddGNkFwYp0OFX6q
 z2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WTGKUa9Ir3XUY2m2iaiWW1RFWFTQMiIIXYdGRTp0w70=;
 b=WWSDanOKirTJ60n5nnk9f12kuDIcgRrkHb6qZtZ5+vJTzC6+4v1RKPKImkbRu5Vk2g
 a1TO4t/dI7orW+3jmmA2MWZuoXZHaOAA2uUO9VCASvTLfoQoN0m1HA6y49KdAwbCzUO+
 QdASvNBs5EAG0GjsNPPlcdEsWkUhKVu1iduRukiveDs81nvT270eHABd1LY3N2cz2t42
 xHTv56o90wsIXnPAkZBSm3bOXvlz+yGEqLzc3BNYQX+3oxrI3SeNEQijsFr2slOvk2Mb
 qOsxTSbVAX1ylfNxhYQGDTVV0ib/lGp75chGLxpe4PgrkJEIed/wTKKAn76fzNdsSuhf
 RhOA==
X-Gm-Message-State: AOAM530EFkmHyu1l4dBZkm60Q4K2JjqBdjKT2GZaX2wmox2KKOebxhQJ
 5kyj899gtxbZMN72MIZ7/GfV+Q==
X-Google-Smtp-Source: ABdhPJz+81gCcg6Tsnwic+AWl3Xmsp9tMrRmOExIJZ6NhiA2CIav3Pc1y1hA3+lSnKc/FQL1LKMifA==
X-Received: by 2002:a62:6202:0:b029:1bb:a811:da59 with SMTP id
 w2-20020a6262020000b02901bba811da59mr3562843pfb.27.1611208480573; 
 Wed, 20 Jan 2021 21:54:40 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id k31sm397581pgi.5.2021.01.20.21.54.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 21:54:39 -0800 (PST)
Subject: Re: [PATCH 1/6] accel/tcg: Make cpu_gen_init() static
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210117164813.4101761-1-f4bug@amsat.org>
 <20210117164813.4101761-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9595174b-423e-2fcf-4cd6-06a8b2f74870@linaro.org>
Date: Wed, 20 Jan 2021 19:54:35 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210117164813.4101761-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/21 6:48 AM, Philippe Mathieu-Daudé wrote:
> cpu_gen_init() is TCG specific, only used in tcg/translate-all.c.
> No need to export it to other accelerators, declare it statically.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> We could also inline the 1-line call..
> ---
>  include/exec/exec-all.h   | 2 --
>  accel/tcg/translate-all.c | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)

Applied to tcg-next.

r~


