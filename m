Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965DE4C0A1B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 04:18:10 +0100 (CET)
Received: from localhost ([::1]:53274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMiAL-0004WN-OX
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 22:18:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMi8k-0003r2-VG
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 22:16:31 -0500
Received: from [2607:f8b0:4864:20::436] (port=47041
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMi8j-0005gb-EP
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 22:16:30 -0500
Received: by mail-pf1-x436.google.com with SMTP id i21so14031229pfd.13
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 19:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JxSDnqdHeT1JvG8LBVuAk16SjyhwmboD5coPbiJAd+M=;
 b=zw+bYCO00x0PT6gZeA80pRmflrAGOQcTAuEECdlsUcaLXjzy6e3rQ70H9rT1ksg4XS
 t+iSw13qIL4ScD9gEpONfuC6kZcc1+350Fys8eiw+g3Hk/7nEZdzcdy5/il51jxUf0zN
 K75IrrLNgs7ED6/fE82fxx7ZgvtdnUX8a155RmhPSS14lJwk270dRRQtJhgA31AIN2mO
 BzfV9qAwlXAfAxnyLwY9G2SgWiRJDR8wcC8k+csJwuczVOV/uOz33xmkZ87cjv6JwD7W
 4Dtf1e6wDmu/9RrJ/YdR2K8BPDF4ayAXWs9UMtjFAo7p6y6PhmSQSNEjSoStJbrQThlp
 6Wgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JxSDnqdHeT1JvG8LBVuAk16SjyhwmboD5coPbiJAd+M=;
 b=4Ni9s4ITgcV/WWwKRp4qeRUWnjgENPCqEDx7jw2vjxrmDVp4oMHYKj9IMv6XLJj6m9
 TgqHCJIOPyYHjruXxC/okhrzQ9s9fsHNht6tmq4S2KcmyBDzV1wi+mAW1sVPvDmoAXB1
 Ma+MQCwNjMZUc2lut69YiBo5eblPw5JhcEYkTuVXF4XggClX/grvSp8ZI/TiCiPEklOm
 +dTMBu5pJZJOrKDJXFfnXUKIMteRpeI8sqtFmvlkwhyUqnTCVcI3eYvdQDAjM4cK9q/R
 Gu8Y4iCAlSnrhveRPH+1NdsIcnqMCjTdHARwQPzXXHV01LgOYIg+D94jHDh0iiTgX7tW
 I9cA==
X-Gm-Message-State: AOAM533QyHdWS58rE+ksmWaFo0obnQBNH74I/nQmtdORQZzj2iV9M4pc
 amfotqBfImhrv1RYqYFVicqJ7g==
X-Google-Smtp-Source: ABdhPJzV+SrpP6R7oa9+X8ikuumtzhX5I7ah6ABFtb/bCZUYLzNDLNazFifou8qHs3Yi1q8yZygl6g==
X-Received: by 2002:a63:100d:0:b0:372:f8de:f273 with SMTP id
 f13-20020a63100d000000b00372f8def273mr22192709pgl.588.1645586188158; 
 Tue, 22 Feb 2022 19:16:28 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id me14sm1067481pjb.41.2022.02.22.19.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 19:16:27 -0800 (PST)
Message-ID: <88334ad0-7740-b368-be87-96f8a30c0cde@linaro.org>
Date: Tue, 22 Feb 2022 17:16:23 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 46/47] target/ppc: implement plxssp/pstxssp
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-47-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-47-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: groug@kaod.org, danielhb413@gmail.com,
 Leandro Lupori <leandro.lupori@eldorado.org.br>, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Leandro Lupori<leandro.lupori@eldorado.org.br>
> 
> Implement instructions plxssp/pstxssp and port lxssp/stxssp to
> decode tree.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/insn32.decode            |  2 +
>   target/ppc/insn64.decode            |  6 ++
>   target/ppc/translate.c              | 29 +++------
>   target/ppc/translate/vsx-impl.c.inc | 93 +++++++++++++++--------------
>   4 files changed, 62 insertions(+), 68 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

