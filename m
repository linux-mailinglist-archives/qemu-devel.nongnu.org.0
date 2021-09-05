Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A97400EF6
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 12:08:00 +0200 (CEST)
Received: from localhost ([::1]:32800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMp4B-0005BM-IE
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 06:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMp1t-0003Xp-S6
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:05:38 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMp1s-0005hp-8F
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:05:37 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso2637066wmr.1
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 03:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y1DCHcfH4Mpa+M3QPYs/8pSEtqGSHNYGszBeOMAeSJo=;
 b=VZ9ulC4MYSGxWCbkZtgXDxIV8gcXyVPDKcP+nY9bRTmFwtqYdZV1rW0p9AGiycJ291
 F/9cLj1u5xCkpHah4sxvA7MWkLNfo1EVrTkw6RA+6pkTILG480FjQR5MpQDaZ3y9JoNT
 mxWGHZ6na+0hDepUxaKaEkN8ZXbqI3c6FPm1AZ4eg9ZDGCxPJD0HcqtmVV1W5HQzgvYf
 2jehg7D9CzXcwjkLrvPs6D3vbr64SB52JZrNBV1QFNWzXI9zRHfmWo6NqWAB2b9hLZEO
 ccgzKxOoC6NwRUk6QMUaLkFtjwIR+XNgQ6DEZ70TAcdisd0unnybmDCETCUdVIjo4Kb7
 FLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y1DCHcfH4Mpa+M3QPYs/8pSEtqGSHNYGszBeOMAeSJo=;
 b=ssI3Can4jNbrXG1MBYPEQcS/0Pyj5O8IgLKxhJnRx/ERjeTsBUX6JgEJtRHxw6fblJ
 S5JK0KEQb6bAOq4O+SOe8oZIN6j++sIesUXK9mducpRGretePtUoI9dIInTjVF5bpyg4
 BchWmiyCxcsqaCxyaFFdgn+ayh3pFESdEfq/AtHroLGRQCLqJRU8NWQ3CdO7oYRpVBfs
 EFr3WasxgLXpsK5PMyxfDucgja1O5/w40jQ/jjZ3Xe0pr/fHCHh9qvgX5T1r3zNuhbIk
 NAxzFK3/jYLTC8PuMW/mHGcKJd5LLWBZskc2PJH6AKiipAUMNqrIB9cvJXrMBHc76XMv
 F64A==
X-Gm-Message-State: AOAM533mQ+N6QvfV6xUImtfeOh8UvexCM9ZPAPZkTFaGcHBGBo6NEgA9
 5hffxNq5XwKyu67NDIUjku5cag==
X-Google-Smtp-Source: ABdhPJxuTok/0Y1ROIE+WrRcaxPannORYqRRLUyO5UcGvRUrLcCbio2WmwgBgU2Aq0ESDolBtnO8VQ==
X-Received: by 2002:a05:600c:295:: with SMTP id
 21mr6460298wmk.37.1630836334657; 
 Sun, 05 Sep 2021 03:05:34 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id o7sm4048357wmq.36.2021.09.05.03.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 03:05:34 -0700 (PDT)
Subject: Re: [PATCH v4 19/21] target/loongarch: Add target build suport
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-20-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <41c2692b-21c4-075a-efe1-b309eda2a349@linaro.org>
Date: Sun, 5 Sep 2021 12:05:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-20-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 groug@kaod.org, maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 2:41 PM, Song Gao wrote:
> This patch add build loongarch-linux-user target support.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: XiaoJuan Yang<yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/meson.build | 18 ++++++++++++++++++
>   target/meson.build           |  1 +
>   2 files changed, 19 insertions(+)
>   create mode 100644 target/loongarch/meson.build

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

