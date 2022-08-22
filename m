Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1941259BC21
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 11:00:00 +0200 (CEST)
Received: from localhost ([::1]:60328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQ3Hq-0001Rx-RM
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 04:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ3FG-0006hN-9H
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 04:57:19 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:40758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oQ3FE-0005OC-J8
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 04:57:17 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-324ec5a9e97so273966177b3.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 01:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=yIlFkqoZEYRQvCewvBv8lODkzfajzQEoizF4+M0fvmA=;
 b=b0DyEcyx59h0QLOSeIaTz0eqUPbhgU8LYAFrVL4d229RLPY5bpPeQLSfjbyLHcGu8q
 tDTtbuHOMYts+llBSPOV80Ha4DdQk+qqfrK5jmBtjuCkp097/p/UW3dKQWB4KqWheusg
 jyGSVHZg7Sofsx5XmCPP4X8hmMxLDypVfRx1iWRrkmFIxzRK/AuYQiuNpjAuJkBDx27T
 eJXI3PlIjRHbYwFjW3oFK1aKKgyl/blh1hGRr1ZQfunR6gxhaQya1zTp98/JipXth5Ej
 qBtYb/ps32b5/wLNG2wrORxTljkUdHs0qgLFMPZ5MHXLTsY+U5jR7aiy20E4ZXQol3N9
 S2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=yIlFkqoZEYRQvCewvBv8lODkzfajzQEoizF4+M0fvmA=;
 b=WI/+oEKz41OmS55nToaqQW2Em6Fw7+R3aMI1qwZ1jWXT+sY5ur3cU0R8cTwN2vl14v
 dclmboSrWsH8yu4Lq4qvX8kdUtakwRNooRGds0F5YLr3wP1zfJvh0l53fOPDX+Vf/C4g
 8MmyfrpyTnXB1n+US44sGX1yyn1Qhe2EDagXP9uy8ZK1EkPec2zfVLrO5AAS8pnvP3Vo
 z92KmxzxICWNWysuBjSekiaR6OeYvOtNkJ/zyS1vdpHEtOsYJsQxWr8KK52zHfQPSuv7
 3LdaGOGF0jaRs22xEvHMJfdAa5hCe1fLmUyhOwSbyska/T6hV3RqYyOwyVx3At5nzg6p
 /W0g==
X-Gm-Message-State: ACgBeo1YLGv65pwARccygrmsicLOUISkggoYMoSaLao9smoIzXxGuQUT
 R6HVCRAo3O7WDcnxMvU/kQn+ZrY58xx21SjqWpqsABgmwo7s6Q==
X-Google-Smtp-Source: AA6agR5ybIUQLf9AThQe8pIpO/WYU99GCC/XYzE+oAhUcSM8RT00/8dj/YRhRsrOoM41osp59SgXRkdOzueG1GpljVo=
X-Received: by 2002:a25:4288:0:b0:692:8c1e:2e7e with SMTP id
 p130-20020a254288000000b006928c1e2e7emr19027963yba.479.1661158634374; Mon, 22
 Aug 2022 01:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-9-peter.maydell@linaro.org>
 <949fb9c0-8e7f-d0bd-dbfa-e76067b867d8@linaro.org>
In-Reply-To: <949fb9c0-8e7f-d0bd-dbfa-e76067b867d8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Aug 2022 09:56:32 +0100
Message-ID: <CAFEAcA9LeJuTbB7gSNajea_2w5FLZ+2YnMOA_Qg6cuL8t4hZYA@mail.gmail.com>
Subject: Re: [PATCH 08/10] target/arm: Implement FEAT_PMUv3p5 cycle counter
 disable bits
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 20 Aug 2022 at 18:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/11/22 10:16, Peter Maydell wrote:
> > FEAT_PMUv3p5 introduces new bits MDCR_EL2.HCCD and MDCR_EL3.SCCD,
> > which disable the cycle counter from counting at EL2 and EL3.
> > Add the code to support these bits.
>
> While HCCD is v3p5, it seems MCCD (typo above) is v3p7.

DDI0487H.a page D13-6158 says
# SCCD, bit [23]
#    When FEAT_PMUv3p5 is implemented:
#    [...]

MDCR_EL3.MCCD is a different bit, bit 34, which is indeed v3p7.

It looks like I've got confused between the two and implemented
the wrong thing.

MDCR_EL3.SCCD: bit 23: v3p5: don't count in Secure state
MDCR_EL3.MCCD: bit 34: v3p7: don't count in EL3

and for completeness
MDCR_EL2.HCCD: bit 23: v3p5: don't count in EL2

I'll redo the patch to implement HCCD and SCCD. (We can leave
MCCD until we get to the PMUv3p7 feature.)

thanks
-- PMM

