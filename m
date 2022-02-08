Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 594024AD5CC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:49:56 +0100 (CET)
Received: from localhost ([::1]:34802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHO4I-0008Ao-UF
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:49:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHNuJ-0006iZ-40
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:39:35 -0500
Received: from [2607:f8b0:4864:20::436] (port=37460
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHNuH-0008Dc-Es
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:39:34 -0500
Received: by mail-pf1-x436.google.com with SMTP id y5so17208246pfe.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 02:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d6dNpQgRFDKcmZ5pDxPsYzUdyXomieWAGDKDbXblyXA=;
 b=BRrQggzwPJ+VWSXBoiW0573RP4a6Mwl3AaTXR1JoarnFnlpheNCLHmmm9rmgGWYvWF
 +PYuzYI3BiUFxK9zKah7jiP4pQfB+m0I86taDXBwo6PW+1/B6KnCFw/W4MCBbAB6Ns7V
 TzJnuVIfdoqVd4O4qmfuDONl5QFD+LmMyd9BJZjCDJpWBi4nHaRguRKxWopvYyYy0PYH
 nHKZCIFs8sYrAPMlyckH2s6ej9tIIrhuyhTwKD7J6UJVYz3rgkpjJ5bYiFZJofXLHZQv
 1fzBfEexBVbNNmpEoBgrHaueBXoS11IUx0ggFwtNVbQR+Op0iJDthIwhYXEuQZjIqbrs
 5lkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d6dNpQgRFDKcmZ5pDxPsYzUdyXomieWAGDKDbXblyXA=;
 b=Wl9WNBMppwwTVIVnqp2QMqyhwrk02QZt7Uj8eVuL1xhsxTVsUR0qhfZ14Btvaxg6np
 bQ1WGrMyoSw36YTxXUKe3X6jOl6O+XCbGQiOMbCKEpqjKNckdUFp16nIeVYxk6q7Y0L2
 p20prE++siDNVaCD/VBGgb/YSt54ttQSY6njhFBre1WoI1qJdpXD0oj4OkfAd1AmBS/F
 txIExRAzLii7vhVYdDkm6X1EXMdq/O+5kTBUYUTJspA9an6M51IE6ujalSKHNTQfPQ8S
 GF4GsJwwLePS3SXGyT/auexO6wWxq9tD+sX9OYzbynnRFBhErpWN714IdLfWSpMRLpUI
 HdiQ==
X-Gm-Message-State: AOAM532CYozDFBNdhBiD1POZvn8drnATcLJ5/lw3a2p6zjPhPHAIh9zP
 U0kzqI8/oVl7WF7CR6ATN/w=
X-Google-Smtp-Source: ABdhPJxK+5bKhuTnyYc2IY4R/4aabpfh43NQllvMlxDLfjFov+MeZz++Q+sdTjpaFkTY85NFoVch6Q==
X-Received: by 2002:aa7:8081:: with SMTP id v1mr3794207pff.74.1644316771804;
 Tue, 08 Feb 2022 02:39:31 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id x53sm1884654pfu.190.2022.02.08.02.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 02:39:31 -0800 (PST)
Message-ID: <abd08118-dfde-2507-6a66-779dee34077a@amsat.org>
Date: Tue, 8 Feb 2022 11:39:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 2/5] linux-user: Introduce host_signal_mask
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20220208071237.319844-1-richard.henderson@linaro.org>
 <20220208071237.319844-3-richard.henderson@linaro.org>
In-Reply-To: <20220208071237.319844-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/2/22 08:12, Richard Henderson wrote:
> Do not directly access the uc_sigmask member.
> This is preparation for a sparc64 fix.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/include/host/aarch64/host-signal.h  |  5 +++++
>   linux-user/include/host/alpha/host-signal.h    |  5 +++++
>   linux-user/include/host/arm/host-signal.h      |  5 +++++
>   linux-user/include/host/i386/host-signal.h     |  5 +++++
>   .../include/host/loongarch64/host-signal.h     |  5 +++++
>   linux-user/include/host/mips/host-signal.h     |  5 +++++
>   linux-user/include/host/ppc/host-signal.h      |  5 +++++
>   linux-user/include/host/riscv/host-signal.h    |  5 +++++
>   linux-user/include/host/s390/host-signal.h     |  5 +++++
>   linux-user/include/host/sparc/host-signal.h    |  5 +++++
>   linux-user/include/host/x86_64/host-signal.h   |  5 +++++
>   linux-user/signal.c                            | 18 ++++++++----------
>   12 files changed, 63 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

