Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E20A4407E86
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 18:17:31 +0200 (CEST)
Received: from localhost ([::1]:55606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPSAc-00076O-VU
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 12:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPS9K-0005YC-Pb
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:16:10 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:43763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPS9I-0007Hs-2f
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 12:16:09 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so4797937pji.2
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 09:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uhMejD6Su2XYi349A8t94rp2GNDSbY+E2J14oA/en5o=;
 b=XziTx5rYvGZtazWktkIiGviziOaj2A1Dmo36iM+M+xJbTJZQrv/1SYSAQcp2zoGILI
 LsM6Bmrx+q8ZqmriYqbABak9TvZv01vBaq10Yu9TxL0++LazNuh/BIFrYbOGsM54EozE
 kZPeakYOSCKB/6dsd0WgqT13N4SlE7L68Kvru2aTTCG8mSk9WDnHtgrI2iI/lZ6Fnm/v
 /+TgG0UfZF6xbyNdSXDVNV4/E9lX4ZjFcpPTmYZ39nTZR0oehf3UNeClEyY4z6lw/xL8
 mvknsYawY7KpgMZKLZX2LcP/mV2NldQUE4KSOpivkUN+yUjVF13udwDVw16PXSQzG/Bd
 hJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uhMejD6Su2XYi349A8t94rp2GNDSbY+E2J14oA/en5o=;
 b=Ih64MQGvTYeFlbJ9dV1I6CgC6vqwH1eRV3L0hR3fZkzRFStvBLops/jOtcK+Tgl5/B
 G/0Dua+q7YdwQDkHnfOd1dThyetTCs1T8fig2LymhM+749d+ULuBNMeLcP6oEst6/ioq
 b80+OXyg/vI1KvFx2ivnKIYQqtDNDkSSDEh0c+iwALCHaPYREYeSTixCtEa/Q70QSJCJ
 JgiQiV+25VQtEpAfFTWWf2GapTnJPUI+ERqPA2a2PeojNWKyhOQFEab722JkIaWRGeIs
 oEc4O3DrJK3F41gSY0Y0iXYwvlXBFANEFQoO3+rul4LK/cPfRRog3rnNOYi9JZsh26D6
 IKOw==
X-Gm-Message-State: AOAM533kPm2kmTw9PZKSlpLGjnDdsqG5SJSNyzrvcdhpBQX0yz/a84gq
 GNxsva7XwWfTmTvBUssD8dI1tg==
X-Google-Smtp-Source: ABdhPJz0rBT2tWP+NeeIJ63u5H2QV2ftlpGnLXK9yJgPCbTEy1Ek14lrXTQ0jC58YCAbUOkvoMNxog==
X-Received: by 2002:a17:90b:4d08:: with SMTP id
 mw8mr8216071pjb.205.1631463365976; 
 Sun, 12 Sep 2021 09:16:05 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s192sm5297714pgc.23.2021.09.12.09.16.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 09:16:05 -0700 (PDT)
Subject: Re: [PATCH v2 2/9] linux-user: Split strace prototypes into strace.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210908154405.15417-1-peter.maydell@linaro.org>
 <20210908154405.15417-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee9bcbfb-9a8f-7c5a-b345-d911aaa4bee7@linaro.org>
Date: Sun, 12 Sep 2021 09:16:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210908154405.15417-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 8:43 AM, Peter Maydell wrote:
> The functions implemented in strace.c are only used in a few files in
> linux-user; split them out of qemu.h and into a new strace.h header
> which we include in the places that need it.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/qemu.h    | 18 ------------------
>   linux-user/strace.h  | 38 ++++++++++++++++++++++++++++++++++++++
>   linux-user/signal.c  |  1 +
>   linux-user/strace.c  |  2 ++
>   linux-user/syscall.c |  1 +
>   5 files changed, 42 insertions(+), 18 deletions(-)
>   create mode 100644 linux-user/strace.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

