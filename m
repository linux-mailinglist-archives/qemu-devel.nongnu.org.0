Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1C74F11FC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 11:28:21 +0200 (CEST)
Received: from localhost ([::1]:57076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbJ0V-0002HJ-W1
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 05:28:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbIxp-0000oB-1n
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 05:25:33 -0400
Received: from [2607:f8b0:4864:20::1133] (port=36466
 helo=mail-yw1-x1133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbIxl-0007io-9p
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 05:25:30 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2e64a6b20eeso92137417b3.3
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 02:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NNjU8kRqUUNIkay7TZNflzcdvxmWIzCFvpuULBVQfDE=;
 b=XGKEfEJgkruNANqnA9nyd4x5cuzHKhe786XoeLw1OOy6xrm6KH6JT+9g5Po0RkRlpq
 s9TohJuS7gdTxDUIAx/75nWOr25DaDXCocdtDn+yS039TO4lIwAdEMXYSYFqbFbdAK6X
 roFVc9GidKzPBcuxA6dNRBEYIBbZagQ8QusDuuNQgWKUVamOa7Zar6OxD8h6llXXwMzD
 PHMyl71D3PnOPjLO3GwVL5YUUq7iIkakHFFCEO3B6FIggQi4uOdbOdlyAsoI/ZnSD/cu
 wTWBdPdXVvCBWHpQzt5GyJW6kdnEf4BNuc6USVkQP5m2LbdmQC2NCn8x9x4u0fP6KCyg
 R4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NNjU8kRqUUNIkay7TZNflzcdvxmWIzCFvpuULBVQfDE=;
 b=iVYl0+3vk8jGzW9odb7pnX9fVN7cpcrdAbRrLi1MpdTM+PAcuNtRuxk22flzryifA+
 jvAzQQlJ1vaFj4Q1dnujgMYPlg0R5XJcDWn3bKZdn9wpSqsshUSa0bOU42NcI+L49Xhm
 9FX8d75udrYcBKdrUz7hrAn514BT/L4iScrUsVgN0f2J4ofZEV+45bKaZiv5FfVgoFqf
 PK12RK4UhkKqZg5xfFxXjdpuIRNl0/O/0/xZD7vXOditgH18UJndiqn51jwqucGJfASC
 kPwagZYfROgtkZRMnl4pG4JcO+hkebqvy+rIpnU0UiHehjzO3fU9/buVkgmXa2TZkB87
 +cuA==
X-Gm-Message-State: AOAM530fiKIjSlo3IoeffDtBpiSxeqSPM23vavvRkFzUmFwuJ4Lh8/wr
 rJ16iVo9i8cxvK3zwhp4onCUqR41BkObiu0CWNn+OA==
X-Google-Smtp-Source: ABdhPJxWOTRgzngQKKYO8CpnL+1DBA5w7epZZHZAHWQk5pzxGWFl+PTszc20vcWGuJDiLREaFlfClFoNvW2aHzBKC/I=
X-Received: by 2002:a0d:e684:0:b0:2ea:7c43:3081 with SMTP id
 p126-20020a0de684000000b002ea7c433081mr21347362ywe.64.1649064327666; Mon, 04
 Apr 2022 02:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220401191643.330393-1-richard.henderson@linaro.org>
 <6dcbc929-6d27-2520-0ee6-f416b2469ec4@kaod.org>
 <CAFEAcA9MNgR+hbw=Q5cyZBGPbL7q=FwNeu2Q_9HS+eLHixTsbg@mail.gmail.com>
 <a1c0c878-fc9f-e503-132a-ce53795b8308@kaod.org>
In-Reply-To: <a1c0c878-fc9f-e503-132a-ce53795b8308@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Apr 2022 10:25:15 +0100
Message-ID: <CAFEAcA_=d-ShZ4r1cmPn8jt5X1K=wodQOzv6_q1VOvHt681uFQ@mail.gmail.com>
Subject: Re: [PATCH] linux-user/ppc: Narrow type of ccr in save_user_regs
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 4 Apr 2022 at 10:09, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 4/4/22 10:41, Peter Maydell wrote:
> > On Mon, 4 Apr 2022 at 07:55, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> >>
> >> On 4/1/22 21:16, Richard Henderson wrote:
> >>> Coverity warns that we shift a 32-bit value by N, and then
> >>> accumulate it into a 64-bit type (target_ulong on ppc64).
> >>>
> >>> The ccr is always 8 * 4-bit fields, and thus is always a
> >>> 32-bit quantity; narrow the type to avoid the warning.
> >>>
> >>> Fixes: Coverity CID 1487223
> >>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >>> ---
> >>>    linux-user/ppc/signal.c | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> Queued for ppc-7.0
> >
> > NB that this is only suppressing a coverity warning, not
> > correcting any incorrect behaviour, so if you don't have
> > anything else you were planning to send for 7.0 it could
> > also wait til 7.1.
>
> I have a couple of small fixes in :
>
>    https://github.com/legoater/qemu/commits/ppc-for-upstream
>
>    linux-user/ppc: Narrow type of ccr in save_user_regs
>    ppc/pnv: Fix number of registers in the PCIe controller on POWER9
>    hw/ppc: free env->tb_env in spapr_unrealize_vcpu()
>
> Nothing critical indeed. So these can wait 7.1 ?

Up to you -- they're all small enough to be OK going into
7.0, and the other two are fixing real bugs.

thanks
-- PMM

