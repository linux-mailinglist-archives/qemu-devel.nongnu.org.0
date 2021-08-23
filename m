Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9FC3F4EFD
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:07:43 +0200 (CEST)
Received: from localhost ([::1]:34828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDQ4-0002R1-91
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDNd-0007eJ-2L
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:05:01 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:44818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mIDNY-0004Lf-Kl
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 13:05:00 -0400
Received: by mail-pf1-x42f.google.com with SMTP id v123so1212251pfb.11
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 10:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YHSsmsYQyf+ucYa2TOTYZ2vYZt9ZT6LWFOIMO9fDwKQ=;
 b=UM50+lpweodBxJn1QWrzAVNWQfUTsx0DnhM1mHCowpl3NDHcMU72SzRYsdjtbtnTFd
 v9W7YiSas9HedREcRWV0SD8P0G2PRPAfDtWht0AkF24vI3s1M3K1BnEcU9UXnTZpMeP8
 YfMiXRM63Og8Ut1E5kknuo6hPCdf2vSkGTXAPknxotkVF9vEC6vrUBXLYM3WFY7vC1Kj
 ROuoFl6QKht3oQGjzT7MhLgvZoGUSvTBhd5k2+aJN6vnea1NhvVmKBjZkt4oEHwnmtoR
 1+gMyEM0OL53X44mchZG+dgBEyz3LowG0q5a9GcM1Ghoi8najWppLf1aN09Yfs7KdaNN
 JI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YHSsmsYQyf+ucYa2TOTYZ2vYZt9ZT6LWFOIMO9fDwKQ=;
 b=VlwzM7dsLZdNpRcZjpb+2GANVALBJtT/jf/mC/WH5YQYtudMZI012ZWXWAYIjncNgH
 OYUknI3hT4AEQiQSYJ+ltfemDAIfSdHjWUaEi6599kVrM3Xx4LEaQiK+CFldc1r3X7BC
 Yl/T/ppjwoVNdwa4OUahB+XbplrTQF5g/RcXsxFyLrF63WLkIA//Qyyk8MpNZ9c6qiyz
 XIn24+y5kcuPkU/oJubkLuhOYK+b1o0arxxxahF5PsFHPxteRSKTCsItwDdBBfd1mvQs
 Kvsalc3GXDZxzDn4HlR3wI7o94RRwuf2g6Be/RzAZ4rdIJoay760dUQmOYUtad+Qk4V1
 cV4w==
X-Gm-Message-State: AOAM530R4iltL3VcPS8YB6qdUTlPSE9T0mpLZTAd2R+n805Ztwixv1Lc
 VaQhmsjRm+eDfXFKrF4C9MPKFQ==
X-Google-Smtp-Source: ABdhPJxqXyCQNEHVRJTFC2GFM6eCaXLBGPGIKy9JTdxg2NlVQalSPe5tf/osPyBN7ZJqXqnHdA7a5Q==
X-Received: by 2002:a63:58d:: with SMTP id 135mr33173530pgf.441.1629738295219; 
 Mon, 23 Aug 2021 10:04:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s2sm16412585pfw.193.2021.08.23.10.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 10:04:54 -0700 (PDT)
Subject: Re: [PATCH v3 05/15] target/riscv: Remove shift-one instructions
 (proposed Zbo in pre-0.93 draft-B)
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20210823164038.2195113-1-philipp.tomsich@vrull.eu>
 <20210823164038.2195113-6-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <92cece3e-43e3-b213-9034-dcf3e01d796f@linaro.org>
Date: Mon, 23 Aug 2021 10:04:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164038.2195113-6-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.023,
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
Cc: Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/21 9:40 AM, Philipp Tomsich wrote:
> The Zb[abcs] ratification package does not include the proposed
> shift-one instructions. There currently is no clear plan to whether
> these (or variants of them) will be ratified as Zbo (or a different
> extension) or what the timeframe for such a decision could be.
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> ---
> 
> Changes in v3:
> - Remove shift-one instructions in a separate commit.
> 
>   target/riscv/insn32.decode              |  8 ----
>   target/riscv/insn_trans/trans_rvb.c.inc | 52 -------------------------
>   target/riscv/translate.c                | 14 -------
>   3 files changed, 74 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

