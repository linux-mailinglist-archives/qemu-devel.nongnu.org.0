Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57B74FBD23
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 15:31:57 +0200 (CEST)
Received: from localhost ([::1]:50932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndu96-0007Cr-MO
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 09:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndu6X-0003FS-EQ
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 09:29:17 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:39435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndu6W-0000HK-1r
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 09:29:17 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id w28so5358478ybi.6
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 06:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w/0JHG7zJt0KLwfokgk8cNu4vbcHqLxDs223B2Lf098=;
 b=BjSaM8Tez3KeAPS0aT8ZyGxPsyFaSobVKW5AXZlgpqouogks7GND5Me+viUoKt3yaP
 cl/E0JBuEp/aqq5MuO7gyVqMQY+bkDtqa+4im1hI52vD84kPYbWo1bMZzQt0Rn35L1u6
 eiwtye2k5YmXaH/0//JCOFg2o6gj5v6QPU1u+z2fo9316P5UT0rEMgUS4pfEAUeaKp72
 8PcVzTBpvSV+GHAWGpgICFn/8cGu+lQctmSVUce0cktMTwaBEO768B1GE+frtemDUFXu
 QzUVTpGS3MVgLGKTN3MZ9eZrNdyBY9+SfYBTy6uvzajEi+1+qqDNbKuXSQp8WlWdTUDJ
 QpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w/0JHG7zJt0KLwfokgk8cNu4vbcHqLxDs223B2Lf098=;
 b=lalPZkYcdpT1EabNc+x5p27xpL3S+3720Nm748ggomIJo9dtdovMWGcHBPLxFoj9dS
 hCzyUwosGtiSfih81oSKY0pSUu4qqrq8Faam5UuTPmnAwUswGzabVfaCbWUPNuHAQbtu
 Rxv34JIlcSpYScIs4gn5TIYMyyzK8BiL5QW6batW8UCpaZDKqdUPz49s6fyuAtWHRLao
 LScaSoAvdmC4YLi15BPnav9RKJmAlANkkkbcghIuMo5bNNdgMEmkEY8uuCpoBK7Ib4KN
 qcBtUG5W05sMCdpay7Gb9eCfBzkH5caKEieTnR3X+lPDH6vf1GiOVLHYsuJdFJjC0ucP
 GraQ==
X-Gm-Message-State: AOAM5307mBTOlbYxW18TiujTFlUn5hZxAbLwoulv8e12YfBcM9812ib9
 8sQqJeiNSyIasNBlvwkwHjQB4329G9+ZaXJL9MWHntQfR9Y=
X-Google-Smtp-Source: ABdhPJzVuNbDJ//xKVCb8qrf3aWSYPiZZx7Zakx0yPdjqYC2Cz0ugsWXi04Ah8w08PPShky94Y2LLOQ5h5Onxd8ubH8=
X-Received: by 2002:a25:d4c5:0:b0:641:1569:17a8 with SMTP id
 m188-20020a25d4c5000000b00641156917a8mr9317304ybf.85.1649683754715; Mon, 11
 Apr 2022 06:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-11-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-11-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 14:29:03 +0100
Message-ID: <CAFEAcA84yWTfd2_81xad8MONQNjw=_fN=1++RLzR2qU3WE7KdA@mail.gmail.com>
Subject: Re: [PATCH 10/16] target/arm: Add isar_feature_{aa64,any}_ras
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 9 Apr 2022 at 01:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add the aa64 predicate for detecting RAS support from id registers.
> We already have the aa32 version from the M-profile work.
> Add the 'any' predicate for testing both aa64 and aa32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 10 ++++++++++

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

