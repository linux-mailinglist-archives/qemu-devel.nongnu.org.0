Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A684576520
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 18:09:55 +0200 (CEST)
Received: from localhost ([::1]:37636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCNt3-0005Pk-U5
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 12:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCNrp-00042F-SL
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 12:08:37 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:33724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCNro-0006T5-7k
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 12:08:37 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31c89111f23so51825127b3.0
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 09:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hfQSh8tRA4EkzoypZKRAjq67EYhRvC9IK8IIELKGUqM=;
 b=hn0JAF1ikgwQyOdY8T4CjE0LPA4CuC+rg/AfxsLJMXLVDMrS4ofmn3aShqGujVRHpB
 ALJoA9VQTzNdhFl+NoK0VZhc9WJxytCd7eHJgW7UIPvQWIkAGkficnp4WQDDWn2fNm/N
 f469i60W+MExe51pMVmMFK4ue2XUl3oJT2sgeMmpgLiemzgHDzhRDDkT5MGYlmkkve+O
 p0tcuTpW2hFcy0nRPG0PpIGaW2GI/GluOOkLHynyXRuDnRUIusnLhDAlYd0+8tudQRyu
 E644LUOs7TOwZF7eF4toBIBfbHeuxix9LmYlQs5Ixv+rl4zWVLcF0GBWc7isLZmznG5I
 eSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hfQSh8tRA4EkzoypZKRAjq67EYhRvC9IK8IIELKGUqM=;
 b=NnFUagFTZFtx9f126pkQdET4fBDAo+ybiTYcJ0F02ZrzkQkp+WvRImul9Km8dsfK9b
 4Pr/VJ8V8kao7+yk7zWoMk0KrQLlvkmeF+P3pobyvzytVeo50hMdGFtiHyvkyFStU1Mv
 IJTyW644MNzk0P3nP3GiURtaBzbAMIECvvYQBmtkTLon7BJGiSeAi7CPQ/b5AksrIFZl
 BPWrWHy3Yi7IE1UY4c1Y3JgAssYO8h5iN/ZYZhpoBZGOweIvrT1DV2LkW0Ycm+LpgSHG
 f7PRSa+OvyiFp9rhRaNx58hj5exDPlsdwlxc0WCNNhldd9elaIe3TQ1Cj4B0F/CEieyY
 007w==
X-Gm-Message-State: AJIora9H0unF6kZi1Ftgb4VZNMc53r7Y576OSIblvADm9DQbMqB2k2WO
 ZkpB9XGqCsaVCJNNS0b+FuHYRLmjOEFTaOkZ3rC6KuSGDOY=
X-Google-Smtp-Source: AGRyM1tFKvXO+KOe/8iZQ71PIlZ2Yonfwn8tpvtdhy1zIDOHzefjiq6p6LS7dUp9LyBiANXj720buGw9FlVTxXvS4tM=
X-Received: by 2002:a81:6a85:0:b0:31c:8624:b065 with SMTP id
 f127-20020a816a85000000b0031c8624b065mr16800837ywc.64.1657901314936; Fri, 15
 Jul 2022 09:08:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220711135750.765803-1-peter.maydell@linaro.org>
 <20220711135750.765803-21-peter.maydell@linaro.org>
In-Reply-To: <20220711135750.765803-21-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jul 2022 17:07:56 +0100
Message-ID: <CAFEAcA9vEk++s0Ly3Y1oyv6oOhDwJwda6j+OBgsWGTwbi=gk2A@mail.gmail.com>
Subject: Re: [PULL 20/45] target/arm: Implement SME LD1, ST1
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 11 Jul 2022 at 14:58, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> From: Richard Henderson <richard.henderson@linaro.org>
>
> We cannot reuse the SVE functions for LD[1-4] and ST[1-4],
> because those functions accept only a Zreg register number.
> For SME, we want to pass a pointer into ZA storage.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-id: 20220708151540.18136-21-richard.henderson@linaro.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper-sme.h    |  82 +++++
>  target/arm/sme.decode      |   9 +
>  target/arm/sme_helper.c    | 595 +++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sme.c |  70 +++++
>  4 files changed, 756 insertions(+)
>


> +DO_LD(q, _be, MO_128)
> +DO_LD(q, _le, MO_128)

Coverity complains that these uses of MO_128 result in an
array overrun for the pred_esz_masks[] array, because e.g.
sme_ld1() calls sve_cont_ldst_elements() calls which uses esz
as an index into pred_esz_masks[]. (Multiple coverity issues,
affects both loads and stores.)

Do we just need to add an extra entry to the array for
MO_128 (presumably 0x0001000100010001ull) ?

thanks
-- PMM

