Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21D53A594B
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Jun 2021 17:16:18 +0200 (CEST)
Received: from localhost ([::1]:35844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsRqT-0006rT-IJ
	for lists+qemu-devel@lfdr.de; Sun, 13 Jun 2021 11:16:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsRop-0006CO-K1
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 11:14:35 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:36765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsRom-0006yd-W8
 for qemu-devel@nongnu.org; Sun, 13 Jun 2021 11:14:35 -0400
Received: by mail-ej1-x62b.google.com with SMTP id nd37so4510994ejc.3
 for <qemu-devel@nongnu.org>; Sun, 13 Jun 2021 08:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TbsT16iiMSfITc9QY5clJ0TURAtaAKsLuqKg1ks3cEc=;
 b=e1dIgWKILCGfZd6Sv4veinZSC6ItvNrj2TuCLZT9K/Vd3miRnMSJ0bGRzi0Gewu85S
 JF9IWeUB8X885J8zCaW+sZbOQtv8JXfwCyuC36i45b8ZDh4SybI3wWfXG/3hF8qHCpve
 qbf6Trmnywbj9MvG/PCqvszFh3NvrVHXd7m+ZCO/b5IhJfY0KKNoKuCF/sWRdtYqd0PF
 FzxcRPmcY985blmvdMrBVB7gCu8alfTU+AudkAGVBAmj/Nvik20RTehflGfnitsPR84b
 Ujb9WpTulxhuGl+yVXv+PsDIcI8PEpFvXUze6as5buSg0pH33BjWyvtFntQtPET7Oeon
 jk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TbsT16iiMSfITc9QY5clJ0TURAtaAKsLuqKg1ks3cEc=;
 b=HToH+uTN70v3XJCAxopbT3x3tYuxhOJt6ZCD+Qbf5MSLKBvjJ7SjaTzrUpy1fy2MiL
 JJrWOhu+wIMQYIn9mVvRFqZmzcYtokiow6KmZzKuYsxCP5aw5A2afxnAXxm0a7WZ45Iw
 ngy5E5EnqS17LD+IXg1Vp0yFezx7LnKD2RX9eM/AJfjmJ5Ck6hLMNv9ThDAASQQW78au
 qBHTXaAB3PoP3Pslx7RMIxoj66ta96ywhJxqbcVsqCHSw2YD4FBweCUWENZ8GCE4+OWn
 ngOVsy0LhrOz67s9A+GtraO5kwTS0biwuYGy1Z+mib78732fL8Pu1RnpplF5Wrvz6oNs
 zkRg==
X-Gm-Message-State: AOAM530cIObxjTtd8J4ZTAY+5HsZRdUf0R163lm7aMBvLpfBHFj79xEY
 OAIDUjyj+DnG+41EVySy3OTDAGSCZSj7vK9g77v7+w==
X-Google-Smtp-Source: ABdhPJxIgCbsIvF14wy5SDUypHEYwzlTTdnfUMP3Pc1GPiYk+YHeNDOJsucdS46lxCXwYYx/pdWulb9yZk3lU6IxHqs=
X-Received: by 2002:a17:907:9047:: with SMTP id
 az7mr11470121ejc.4.1623597271072; 
 Sun, 13 Jun 2021 08:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210611234144.653682-1-richard.henderson@linaro.org>
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 13 Jun 2021 16:13:56 +0100
Message-ID: <CAFEAcA_k9B0-+jrKOCdtKpFjvym0Ng3POH2nRLfuoAikTJ8B0g@mail.gmail.com>
Subject: Re: [PULL 00/34] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 12 Jun 2021 at 00:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is mostly my code_gen_buffer cleanup, plus a few other random
> changes thrown in.  Including a fix for a recent float32_exp2 bug.
>
>
> r~
>
>
> The following changes since commit 894fc4fd670aaf04a67dc7507739f914ff4bacf2:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' into staging (2021-06-11 09:21:48 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210611
>
> for you to fetch changes up to 60afaddc208d34f6dc86dd974f6e02724fba6eb6:
>
>   docs/devel: Explain in more detail the TB chaining mechanisms (2021-06-11 09:41:25 -0700)
>
> ----------------------------------------------------------------
> Clean up code_gen_buffer allocation.
> Add tcg_remove_ops_after.
> Fix tcg_constant_* documentation.
> Improve TB chaining documentation.
> Fix float32_exp2.

Compile failure on OSX:

../../tcg/region.c:706:12: error: incompatible pointer to integer
conversion assigning to 'mach_vm_address_t' (aka 'unsigned long long')
from 'void *' [-Werror,-Wint-conversion]
    buf_rw = region.start_aligned;
           ^ ~~~~~~~~~~~~~~~~~~~~
1 error generated.

thanks
-- PMM

