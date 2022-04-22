Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6168550B7FD
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:12:21 +0200 (CEST)
Received: from localhost ([::1]:55954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nht5A-0007sU-G9
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhspa-0006JY-Ct
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:56:14 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:42987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhspY-0001q5-Pb
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:56:14 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ef5380669cso84230347b3.9
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 05:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hlz8QGfda34O8FMMg4Zl0tYrIb8nzldHk7KmS7mQ6Ko=;
 b=ybGbeiBWejb5TMQlDUboRyZCWGMArJzQUUIzjRJ74F6kRyRufRMk9Mvv64d39i13O+
 u6XrpPn8+WG5+JlhuoGbzX+j58XACw3scpdqA/ZQ81Z5VMIj/O1qiUdzbgfjhtDQjgFZ
 dl0b8b43mTcVqTj1N5f1tl23K5Lbm94tbfEBgqMcHvPwaxHIHhlEVNkylokzlkDHRaDZ
 78xBoC49EW+eAWEovSJbomMGppB2OjkGU0GMKbK5uKET38xtstU5TSqgzOLOgR9dYw5i
 h5pwqRO1/OknC0Cw3oB3/nAY37j62E9wEVeVZWJ9tUi/tU019NJsjJadTw7gXxOWXh4O
 gPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hlz8QGfda34O8FMMg4Zl0tYrIb8nzldHk7KmS7mQ6Ko=;
 b=mEiBJLqpf8M0Zzw7exLHhkaiil1WKPvsmhuG2u5w8gd9KOQ30IrfxDYrGw9byxfo50
 mj1htProxrgyG3gm51BwQSrIeyjt8hrEau2pfCKUQgCmkDgdNCnVCR8/uccC/axQajx7
 V5QmWYFaUcyhRxlE/5XJ/sxlS/k0kpicMoYt8gj8Ag3y4dGvohyR5EJ0M/l1ffb5jAj3
 X2t5+H+zB28zWa+/y0iYA71AGPj0eXQfh2tpzN2BCWDVQ5rhWxfT7Ho61bJZIRWSbPn3
 XOeDgusWdRfujZ1opqzPSxcdDt5A+nzUJtb4923ggr8eU67emVN8r8vwErCrzHuJCPmR
 xJ9g==
X-Gm-Message-State: AOAM532e+x+Y5bksEVRaVuIDhxb3ZQtcSBq9PvarX0YUrRyzdIu082EQ
 wm4H1hVBDvn7EDtcPKFH1l+qm+jyN23EzYzumJpz1n7nSmk=
X-Google-Smtp-Source: ABdhPJwJ27Tm08oNxG/Be7OBVS+gAKVtN4rZzKQZxbz3tl0QDyOBJGEAnf7WoYOYdkK6bGx9fcotcT4cFUXk+avNDaM=
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr4677038ywt.10.1650632171948; Fri, 22
 Apr 2022 05:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220421151735.31996-1-richard.henderson@linaro.org>
 <20220421151735.31996-35-richard.henderson@linaro.org>
In-Reply-To: <20220421151735.31996-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 13:56:01 +0100
Message-ID: <CAFEAcA8QNiSY-=ifZwVpDy7NWUcE3qAbQ3YTL4zcX1xCs_2P9Q@mail.gmail.com>
Subject: Re: [PATCH v7 34/64] target/nios2: Handle EXCP_UNALIGN and
 EXCP_UALIGND
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 at 17:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While some of the plumbing for misaligned data is present, in the form
> of nios2_cpu_do_unaligned_access, the hook will not be called because
> TARGET_ALIGNED_ONLY is not set in configs/targets/nios2-softmmu.mak.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/nios2/helper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Typo in subject (missing N in "EXCP_UNALIGND"), otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

