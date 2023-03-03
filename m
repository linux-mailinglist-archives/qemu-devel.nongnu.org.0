Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F6B6A9F8E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:50:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYATc-0000K9-Qh; Fri, 03 Mar 2023 13:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYATQ-0008RM-PF
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:49:48 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYATO-0001x2-Cs
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:49:44 -0500
Received: by mail-pl1-x62f.google.com with SMTP id ky4so3728006plb.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677869381;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JMXMQWpbHwQR/8T8b/ZkNg7ZuKGeta3yefHrf8HK2kY=;
 b=Zi3oonlcqyi/jQysMJN93ra5NWvnw1kL4A/cYavudQir/EFE+nIUQEqB1aCu8KutRJ
 l5+bNEnuqZnAIFPKP4qYflLkTI/0abZriAQyQbHI+YiALOzgcHBvDBP9lD118ZDFE37f
 ZkCyYxtCYlTKCzKG+5C/+ubShoI3AJwG7MFjxTzmR124gbrkQGCDpO/Y57v4KlljgaxW
 ZiZCC53bzShOwJnvov5WVSmYCHpEKk3/yLtuZYIVFpuGUBm8Wp5yh/DdCSpBU6IQwUgN
 /Cl9CRIP6rV9r2AcSNQFuktF7T5ShqlU6QL9lCkXHLBW2G4dmuxNmGjMFGqVfwECrqQw
 OM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677869381;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JMXMQWpbHwQR/8T8b/ZkNg7ZuKGeta3yefHrf8HK2kY=;
 b=L5KhEpv4vKuf/+c5Zh7WAfYm2JbxMCA1lTxX1c6fbs9BL8qHXBBGA1GnDDVdD/8W8S
 Qpx9Fc7p+rrSqCKO/RhlWf53AnBzTIrjBHtYecSmh5roHKB6jRA0cfbyyzqg96tYftn5
 koopA7/QOZNbgqmWcRXviNXeKSXYNs1dCxGAENvSci04Q5s4VLUeFYY/LC2pz4kzZQJY
 lu1GPWwu4K+gMQesjGZ9j3s0tno6bPtg+rsuacq6Rab2YaZ+tzTYIwU0JlNgd1ByfNQG
 zTFIoO/tsrXxnYJhM9WDnl8+a+gzoJkK1oUSu45HhlKiPzbjNIulFLj8f2SnT2ECl84H
 6DNA==
X-Gm-Message-State: AO0yUKXnpCasabZdGUZHjUZpPEBZc3zmf/lV+K/nrG+xOqwXBTFAQx+h
 NLMlE5ZDMHGpn8n93gf2F1hYAi80S6cLAg1eMbcVHw==
X-Google-Smtp-Source: AK7set+KTXrqyqDjgII56ckuWDX6s7lruGQdHdtbcmKSCEwvSpmurnoBiuKLtEVDtR0Nq30roMnzqUdo84IH9ZWyUy8=
X-Received: by 2002:a17:90b:241:b0:237:ea76:41ed with SMTP id
 fz1-20020a17090b024100b00237ea7641edmr1009984pjb.0.1677869380983; Fri, 03 Mar
 2023 10:49:40 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-49-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-49-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:49:29 +0000
Message-ID: <CAFEAcA9dfv-HXvO8u8xNd06AkFOXosjPuzmuGiQyzTWQmE5B2g@mail.gmail.com>
Subject: Re: [PATCH v2 48/76] target/nios2: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 27 Feb 2023 at 05:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/translate.c | 15 ---------------
>  1 file changed, 15 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

