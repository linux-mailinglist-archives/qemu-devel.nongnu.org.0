Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438FF68DD87
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 17:03:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPQPY-0002NI-US; Tue, 07 Feb 2023 11:01:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPQOz-0002LB-OS
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:01:04 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPQOy-0001wb-AF
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 11:01:01 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 v18-20020a17090ae99200b00230f079dcd9so1369645pjy.1
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 08:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fKEA1h9BQhuGfYQ+kwubdTa7YvZekBbXd3t+/9/vabk=;
 b=SMwLyPFJHWwWQ+y77+/PFP6jALdmcMZbNmCiVTOgKVcALeGasLGzjyu+esQPJvaFv1
 gcGyyEtxZhwdhAiCEiRHiaqOhpFRtiIc3mx3gaTeof6aOZqsqmTqIWDrx3L9B/LaSgTs
 ZU0/4VHI0TC8jtASm6IFRxddo+eugHzhO2B+IAEwDdAPq+XftQxIEnTXxvSr96fl5Yhy
 1+fyILXQJrVhSjQqb5NgxqePQXHoYKB3rcC1WUzXITa4kyklJbCmwUfFkMOXfq8vHg6F
 sa3DO+z5qO1ZIlXLV9pFtc+oTjZG8l2VD1aHWKUeOVtVihOfurB3oRs97V/jVux6ixYH
 0Hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fKEA1h9BQhuGfYQ+kwubdTa7YvZekBbXd3t+/9/vabk=;
 b=D4xJmMHLFcLylEgyk6ASQEJywZAu0RXyYR5F1TBoeY27eQ2AWv/uYDoBg1jOOMeLXu
 3gOlwV/QyDBzhtkmzUUdmTC13VGA53JFhgiPypwzM8KyiHnYDHFyk0kJeepELy/cD6+N
 PlQGsdmjYpFx9uBgWTzHE2kTb2ZLvAalQG/M2VHez0YkxwIksB/EvasEl/e1FLK3cNSY
 ceFIBiVGssje7qOLvZEqfGM0nuawJwc4m0a1M4jOryUJpFvYpDgUH05O+yH4ede5jy9o
 7zT7xz47N1YElbUktgDznpYeSN1kXNGd/C8BdSOH7rdoTY4ziQ9v7iSFkucTXkRBjd4l
 80yQ==
X-Gm-Message-State: AO0yUKUjDSTlZJnhhhInPP+BtfJWiH96MpTtxvc2/RtKyCf9n0lE+vIA
 ayQzmo8wcCRRJlNq2rrzsy/cx12ipDgNHZHQLW9XqQ==
X-Google-Smtp-Source: AK7set/R9zUqX4TOe/Ai4Dkw9jVA7M08gl8OHiewsGsvTjFJsvUEosgSTxNyslgkAEJK97R5AZHCSmmDAtej/RGP/aw=
X-Received: by 2002:a17:90b:3906:b0:230:eadf:4a2e with SMTP id
 ob6-20020a17090b390600b00230eadf4a2emr761859pjb.137.1675785658730; Tue, 07
 Feb 2023 08:00:58 -0800 (PST)
MIME-Version: 1.0
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-3-richard.henderson@linaro.org>
In-Reply-To: <20230124000027.3565716-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 16:00:47 +0000
Message-ID: <CAFEAcA9+BLL3m+SO6ht8hZktSHN=AKpmK9vzJwoWoZeGHC=hYQ@mail.gmail.com>
Subject: Re: [PATCH 02/22] target/arm: Rewrite check_s2_mmu_setup
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com, 
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 24 Jan 2023 at 00:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Integrate neighboring code from get_phys_addr_lpae which computed
> starting level, as it is easier to validate when doing both at the
> same time.  Mirror the checks at the start of AArch{64,32}.S2Walk,
> especially S2InvalidESL and S2InconsistentSL.
>
> This reverts 49ba115bb74, which was incorrect -- there is nothing
> in the ARM pseudocode that depends on TxSZ, i.e. outputsize; the
> pseudocode is consistent in referencing PAMax.

I'm having difficulty reviewing this one:
 * the latest version of the Arm ARM doesn't have the pseudocode
   functions you refer to, so it's difficult to cross-refer against
   the spec
 * the changes are too large for it to be easy to confirm what's
   just been refactored into the other function and what (if any)
   the behavioural changes are

thanks
-- PMM

