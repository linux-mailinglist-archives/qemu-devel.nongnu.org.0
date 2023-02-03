Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 830B86898FB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 13:44:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNvPL-0004kv-PO; Fri, 03 Feb 2023 07:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNvPE-0004cl-10
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 07:43:04 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNvPB-0004Pw-J7
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 07:43:03 -0500
Received: by mail-pg1-x534.google.com with SMTP id a23so3512568pga.13
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 04:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QJXn0M2WCYcF420ZUVmBTcqtm3OTQb4hdMMzUjoayaM=;
 b=WGA3oEBiIrWwc8Lgjmawv4FDXX89CBx27DhmvMI8A0CG7c0+YLzcotqoAukg10HLeH
 yRPqAu4tsqW5VWDCbrlJRp2hzyzapkvxO9cLbqwQ1/+HS/1hUnaHz0iS92D3/FX0jnVq
 tLuyJbGg/VKQtHxlWgSZpzmrCOcVFRL25y0vxhTmuL323v9i1lKdASPEFMbfQm902tnM
 701qo1xAqrZNKdCtJiFgi5X81zi3EHTeHSTW4MKN9+/gZIx217OXs7hkON4/77JBOvj5
 J05EVk3rOS5Vq5c1trMIFOXnMgyuMTy4Q1ENMr73rkd5jaXxbr7YZJ3hK5bKiiUc+/9T
 KVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QJXn0M2WCYcF420ZUVmBTcqtm3OTQb4hdMMzUjoayaM=;
 b=5gxnmezPHhfDmoek2UenVDgtuA+g1aGKdRrMc71f+jeimFGQEt33Oi7JLrGoFg5PmC
 9qKU4Ps3ldVIGnQyyPxvTikpBfrxMh/4hpy8GCMUiM1L/mVZokvQA5g6GEDpCKW8V4g3
 Cvnyvr7BaZvyDF4dD5gAIJJOpQdxEGgKSELqezsVPPmN0N4ActVBwUDoKYA3GvzSfUSD
 ndTYXDTxB4DSuVyuxbDmsyB/pSkli9EyDIuWLjvMMQrwtYunubxNeataKN3MUbNP+Xum
 V/x97zO9kfX0CAlK4kLgiMaVri0vcmccVjgeUATOIhb4Gw/rtedQmG9dXJyfsOsGHowe
 Irkw==
X-Gm-Message-State: AO0yUKUMdqwCgj2Kup0+SvZybUt7wvv8FA+qaPnPT+PTc3yrxWL7EmzL
 vW40mreXojl4JNoLjp3nskjipDOS6zSDQELFnhyiGw==
X-Google-Smtp-Source: AK7set9Vwv0q0UZMWXVLKhRaxgqq0LFRUC9ItjMNAAzhhUOcMX0CksBdxfvmqwTx0ctwaODOfIxfvNgqyAv6tOdcPac=
X-Received: by 2002:a63:ce03:0:b0:4cf:5317:8401 with SMTP id
 y3-20020a63ce03000000b004cf53178401mr1602508pgf.120.1675428179877; Fri, 03
 Feb 2023 04:42:59 -0800 (PST)
MIME-Version: 1.0
References: <20230124020507.3732200-1-richard.henderson@linaro.org>
In-Reply-To: <20230124020507.3732200-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2023 12:42:48 +0000
Message-ID: <CAFEAcA9i-05G7_L3TZ0_=z_Q-SLdFv1Bf3nFm=2kRW90WQhAfg@mail.gmail.com>
Subject: Re: [PULL v2 00/15] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
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

On Tue, 24 Jan 2023 at 02:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Second try's the charm today, right?
>
>
> r~
>
>
> The following changes since commit 00b1faea41d283e931256aa78aa975a369ec3ae6:
>
>   Merge tag 'pull-target-arm-20230123' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-01-23 13:40:28 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230123
>
> for you to fetch changes up to 709bcd7da3f6b4655d910634a0d520fa1439df38:
>
>   tcg/loongarch64: Reorg goto_tb implementation (2023-01-23 16:00:13 -1000)
>
> ----------------------------------------------------------------
> common-user: Re-enable ppc32 host
> tcg: Avoid recursion in tcg_gen_mulu2_i32
> tcg: Mark tcg helpers noinline to avoid an issue with LTO
> tcg/arm: Use register pair allocation for qemu_{ld,st}_i64
> disas: Enable loongarch disassembler, and fixes
> tcg/loongarch64: Improve move immediate
> tcg/loongarch64: Improve add immediate
> tcg/loongarch64: Improve setcond
> tcg/loongarch64: Implement movcond
> tcg/loongarch64: Use tcg_pcrel_diff in tcg_out_ldst
> tcg/loongarch64: Reorg goto_tb implementation
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

