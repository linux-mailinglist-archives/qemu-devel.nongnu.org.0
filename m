Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809A6605E95
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 13:15:30 +0200 (CEST)
Received: from localhost ([::1]:57752 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTWJ-00072v-7m
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:15:29 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTNy-0002yt-81
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olSo2-0003Ks-9v
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:29:46 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:43808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1olSnz-0000PT-Uh
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:29:41 -0400
Received: by mail-pg1-x52d.google.com with SMTP id h185so18801418pgc.10
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 03:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VAF7/mjmRpZ4cPucRoBbILILRUzjFD4l4pIihinsl3I=;
 b=T611UuEtZm/Y6C09aUSGvv0iIShUYWdxbQ11b0U1PKW5HzWTpqV2VV3Kef43X8+vXJ
 5lGNhVKeYwz//k35StwvMnS8uTSouNMhKVYdOm9dJRf1af+RAG4t87WhkYw6CmrCIJCw
 MMT3wJGrEl4BdB0k/cMIT4CK2qUcItamFs72hMsGr0Ay+B+2w6ppcmCcFPiF51tj2lEW
 19rAnNIuKOVwMPw4SBPuQgBYIBhFoEh+ib4qkq2f4N7SC0q3t1YDSbPcfCf0JxYaBkpd
 2hQ9dYoA2q6ZLyHyi8IjUEgncp60i5sG9znvO8hV8QZv3ZKOp7hDu8v8yvVTbqtNvDCi
 vNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VAF7/mjmRpZ4cPucRoBbILILRUzjFD4l4pIihinsl3I=;
 b=o7IcdbgNli9vFBijDKUoBPodMpNcrYgS9QQS9B1FU3bhvuudw0QPorJviAYc95GrpU
 e+3++4ap3c7cthUK9aAP82QDHl+mCm44BJwyNI6hGx26mlXl8MIxcv29dA3Xsk4Xgsin
 oLK9oZDEL2E46LEvj9j23hTsZr4O9Tyk6W5QlzCCgB6XjG4LZ9/wkmFtOoJX73TANh1T
 pjKow3zYLkv+7Itl8cJvB8cunS9HrBi/tAjl+/vk2nsDF4dx5vGE2wYLB2lqNnwLK8ON
 +i2IBFnZJzJkSvsb0FvqvR1/xqIMJyf7v1scXUVNfaFpa2j0kvGIJadh8lJgAIrYJ7WD
 6B+w==
X-Gm-Message-State: ACrzQf3fpc/OG4zFgia0d5ia43TCx/FnLAVA98mlJwaTbn1wzplcKiZU
 /Qn/VGs8tVEhBN8cesX7M4wqlToOlHbXw23UiDVc4w==
X-Google-Smtp-Source: AMsMyM4gCgEvh6BMMWvG1/JrVLC889q07zRh9uV5HFEdBOsLWA1GWhi7lUXDE1BN2hkKYWb2h4Stg2clpau6pVfvQuw=
X-Received: by 2002:a05:6a00:1595:b0:563:8fb6:ae53 with SMTP id
 u21-20020a056a00159500b005638fb6ae53mr13296196pfk.51.1666261776986; Thu, 20
 Oct 2022 03:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221020030641.2066807-1-richard.henderson@linaro.org>
In-Reply-To: <20221020030641.2066807-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Oct 2022 11:29:25 +0100
Message-ID: <CAFEAcA_imgBaVqd-7CP7K6mwTQVrStdgKsagbDHq-RcOEHGs4g@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] target/arm: pc-relative translation blocks
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 20 Oct 2022 at 04:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the Arm specific changes required to reduce the
> amount of translation for address space randomization.
>
> Changes for v8:
>   * Add a comment to both gen_goto_tb concerning the ordering
>     of the pc update vs the goto_tb opcode.

Applied to target-arm.next, thanks.

-- PMM

