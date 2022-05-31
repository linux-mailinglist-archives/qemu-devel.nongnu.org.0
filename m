Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12EA53904B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:07:51 +0200 (CEST)
Received: from localhost ([::1]:48686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw0f8-0004mq-9k
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0av-0002wU-33
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:03:29 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:41545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0at-0001b0-76
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:03:28 -0400
Received: by mail-pf1-x431.google.com with SMTP id p8so12984189pfh.8
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6J/QaCCnPNnkoC5s5/lsaV1xAHyOU6JElZI8xeg+4Ro=;
 b=UpqCrZOLS4YRElqOD8VVVCpJr3TykyOxgtW1gz9V4rrVWB97HOV6H5Ppkw701nsA43
 kk8Njm873H4SFJ7+F/s9BzXt2chjFnae6+XRDOM+EklGsVKFdczCxdeZQfFiLG0q5wn5
 RIzwGB/I76mOjHX7HXEaE2k4Eji62HalS66dskik23ZPEumPExtuuReiRtOIEjBbNdvL
 lZEnRABuTez24X+faanc6mZOD0Ptuk8N/QHTssj8j7g8HFRPw69bMhLB+yp+hkVn/R+Z
 4pkRc1PH1bH88Lz84/KDva0b/4/cykBrycOiiWTOLq85xyNQ4fhb78wuWme/UmwUd3NN
 0vNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6J/QaCCnPNnkoC5s5/lsaV1xAHyOU6JElZI8xeg+4Ro=;
 b=Pn7O2+S6i+3HsRfg9s0Hwz/c18W69vnnWrxtOkC19iIWBczwsnKJLhVJeQJGqYbgSH
 9ha3QvrIkVRBBDGF/dWlAvij2eVVPJK+vW4z+xFhMqFqQRvd4YisC+4fnsBU+YtnCnOE
 tJeYOKo/r1r67VmD1WDDJxf4Xs6G6EvAqp4yo0HnLD9p67bWTCCkN93JPB/M0jmuiRmS
 AZBflWqDLZlr/D3pSBXmdqquQ6nyIxjr8IOV+SIjDNYXR5glc9sKCye/HC8tY/y6jhIx
 6MMIfrx9Xngah7B2Ko6DOEnQFkgB8+4DhNlSU5Ltmh4HEXrWpOBkC6TZ3znZS2bSse/0
 Ay7g==
X-Gm-Message-State: AOAM5321EbudG+JYr5C/CKj5OgAf+ARcb0cMNjPZb5g3fa5qWSVE/Lxd
 f+cStiEkjJcXrFBlvDrCf+aD8dwR5O2QFVWHi784fw==
X-Google-Smtp-Source: ABdhPJzl/Z8Bde02Q6sqU0PT5Bdal1rvAiFBYFlJW43zNuyR14uEHWjGCK9VOQHpf+jTtCUvKosqEHu3+BP2qTydOIg=
X-Received: by 2002:a65:6250:0:b0:3c6:8a09:249 with SMTP id
 q16-20020a656250000000b003c68a090249mr52821973pgv.389.1653998605630; Tue, 31
 May 2022 05:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-6-richard.henderson@linaro.org>
In-Reply-To: <20220523204742.740932-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:03:14 +0100
Message-ID: <CAFEAcA_orD7ZUrWThNHCvvWxgRPJN1UrqP+xuhevncxmRsmQ9g@mail.gmail.com>
Subject: Re: [PATCH 05/18] target/arm: Move arm_singlestep_active out of line
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x431.google.com
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

On Mon, 23 May 2022 at 21:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the function to debug_helper.c, and the
> declaration to internals.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

