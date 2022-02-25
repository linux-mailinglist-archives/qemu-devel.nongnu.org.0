Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D974C43E6
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 12:49:03 +0100 (CET)
Received: from localhost ([::1]:53618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNZ5q-0001Dw-5N
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 06:49:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNYyw-0004OO-OV
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:41:56 -0500
Received: from [2607:f8b0:4864:20::112f] (port=33487
 helo=mail-yw1-x112f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNYys-0007sO-J0
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 06:41:52 -0500
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2d66f95f1d1so30748607b3.0
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 03:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=edb6kE8IcvuiTF6gkNzE8ZK0rlIlKstd0gtrjm30nWw=;
 b=Z7j/h1M9j1ldVwew3KX8suzA6Gcma7x10Ux6QbMTEsG4Nx6wnWcA26/zBVjUqMX3/m
 KN6DdrHw1z/7ktW45gDZnVt9rzrG3SmAvrffV+mr+gl3Wgw5oa/u8e4eWV9Qodod6qGX
 eQig6+qWbd6hE4cUHBXwMYQmUSjgSJmYXh/RuCUNQ3WoRsG1MmGwBIgYLcZH54GA4Nek
 CPQuyPUTEr6xdB0y+cxeXdtE9NdKiRFF8BFPBNTsLnpjhleoUojvNklINZLAxFMR/IkN
 64JlzqsVzIfyT/5ed6Qy7BDHNdOWP2mU98S7ASIsLdx5rIWghewbRZo63o/9eiiV4pVr
 8rcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=edb6kE8IcvuiTF6gkNzE8ZK0rlIlKstd0gtrjm30nWw=;
 b=4zaIuo9ZEz1Erj9uCIw0KtNeyC482Sf2diNCOSRmAgli+DSdB6SwjK9Nygg6+ivG1o
 aHIShlgOXwNce8RcMahw3uaekyIhcvqo2zVHPuZUJbsuvoWl5RSMaTrV/3gFE70yH1qr
 J7IL7s5w1ldQHT2EslUsa+5CB2NzMWO8ACBfFaG3xybjXENi1C6UXbqGvnh7/LxGvuNr
 cExyWz9+/ncdKkRugxYPQUxbHnWeFMfgZN0ChnLmmUBoGVKHTyO0GG7ADzKfT5M/07cR
 MxpqGwTdnxrw+CduxCk9YI0PpyVuDugwTpHwPKZxh2HnpXXhghuG4yAlech7vognBdQR
 /CpA==
X-Gm-Message-State: AOAM530YD/TgNkP5gAp7oDVbytZSDoSQmLqqLGMz8hbuyPvsmNtcXSWT
 LYVMbCvooD9zEYlGj//aRSwQBoAl/p5xDGLb4X8XtA==
X-Google-Smtp-Source: ABdhPJxVTrRZUkYDUeYyqHH17HqpQqwkeowf1CvVZYoaDmHtF7mt2YVn6aHgO0qV3a32q0xTiRIySBJk9bDOotzHc1k=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr7333660ywb.257.1645789307753; Fri, 25 Feb
 2022 03:41:47 -0800 (PST)
MIME-Version: 1.0
References: <5ec4ffe1.25b2.17f27005362.Coremail.wliang@stu.xidian.edu.cn>
 <3c7903dd-fc50-3b05-8419-0f5011c5e82c@linaro.org>
 <5cca42a6.b21.17f2f0e6d26.Coremail.wliang@stu.xidian.edu.cn>
In-Reply-To: <5cca42a6.b21.17f2f0e6d26.Coremail.wliang@stu.xidian.edu.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Feb 2022 11:41:36 +0000
Message-ID: <CAFEAcA8KLkYzDPebVhVBLbjWVCJR4KB=P5jC=5Xpf_EpRiEuKA@mail.gmail.com>
Subject: Re: Re: Fix a potential Use-after-free bug in
 handle_simd_shift_fpint_conv() (v6.2.0).
To: wliang@stu.xidian.edu.cn
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Feb 2022 at 04:05, <wliang@stu.xidian.edu.cn> wrote:
>
>
> >
> > The fix is correct.  We just need the submission formatted properly, with your
> > Signed-off-by tag.  When re-formatting, you can add my
> >
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >
>
> > r~
>
> Hi guys,
>
> Thank you for waiting for me.
>
> Here is a new patch with Signed-off-by tags.

Thanks; I've applied this patch to target-arm.next (with some cleanup
of the commit message).

PS: the subject line suggests you're creating patches against the 6.2.0
release. For submitting patches to us, please always make them against
the current head-of-git, not against an old release version. (As it
happens, this patch is fine anyway, as the code in question hadn't
changed.)

thanks
-- PMM

