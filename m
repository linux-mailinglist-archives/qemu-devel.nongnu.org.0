Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B17251342F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 14:50:16 +0200 (CEST)
Received: from localhost ([::1]:60966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk3b3-0001kB-SF
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 08:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3Xn-0006uE-Sm
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:46:51 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:42347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk3Xk-0000IU-4T
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 08:46:49 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2ef5380669cso51464997b3.9
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 05:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j4lysgWIN5cr53U6wgVoyU/wRsi+yoa75XySkbHBjy4=;
 b=HTy+ZvtcocqErN6d7ydbDIxcuXiVeliRrd3UwOdv/fA/fz5zcrmqX6RfeQyfF9rPlq
 sOtVsctSdFZp6zYeL7DARQrvEnKjOjtA6HXHxxfsYbAqqMID4vV4Cok3YLE2de7/hVWV
 hWW6drCU+0jEJLuWi4lCYGDfAxZmtubWIKL/tWiNmvQzvwxfWbtcb9m6eLh0TTKWXEi9
 4uGNsZ90mFB2D4qtXcZxw/nvRKK5a1ET8wW12tbqVjrbaF4hFAKbS7Q4MEOFw+LBT2Dh
 6nRDnne8UUJjlkRWnjxVQORylHVc9dArEsbrCnWptHnwRJk+WTzMJbG2mYlZwEstVrg/
 c16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j4lysgWIN5cr53U6wgVoyU/wRsi+yoa75XySkbHBjy4=;
 b=3xatHCmiZpAWtEZ2lWWf1thGJpogmfA+qMQPM4iBCTOLbMgNXCkuIUxQSshf+MdK9x
 jY1T1fwqhURfx7dQyr3wafEnmJ32jb86Vx4F2UdanK8SyAkXUOUh2VW+s5+wIMCu4CZj
 Swm7dLM80p1x6UZRdERxBZ7owbsDWlEo5Ln8riwWhI6fA84K70W17A7Ak8CDO3MxCZCg
 cKViyXmTTS/2ZU1Pzku7Ri6gjA2CqiAqv4goX3muhm5CfpYgNTwcO1bIwiHDO8d332Ah
 BzS7J/q/gR/WGJLV4CgM1t6WYJCRTXr+GgR87iXvz3kDQ8XBZwyiiARLJxdu8NzXWHLU
 FY2Q==
X-Gm-Message-State: AOAM532y5KhT5bYT9FABGjKsNXowmr1AZFEkegTgJ97ueJAP++Ssv9Ip
 SMNJW0j0/+tYUUE+6aUonN0m1m8tF9trxc5FVM+pgg==
X-Google-Smtp-Source: ABdhPJwm207h3OKSZRZyVtTn/ztEfkGbJOQdacLhVSuTC71MOQrpw7g+pjJLpfwSZglKShhaCpdexof1dxS90LsPCbM=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr32772893ywf.347.1651150007090; Thu, 28
 Apr 2022 05:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220427181335.26613-1-quic_llindhol@quicinc.com>
In-Reply-To: <20220427181335.26613-1-quic_llindhol@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 13:46:36 +0100
Message-ID: <CAFEAcA_RRy+bR=hixmmmhSMsX6SRGPFK1z4H9EXZU9-h0FPEOg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS/.mailmap: update email for Leif Lindholm
To: Leif Lindholm <quic_llindhol@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
Cc: Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Apr 2022 at 19:13, Leif Lindholm <quic_llindhol@quicinc.com> wrote:
>
> NUVIA was acquired by Qualcomm in March 2021, but kept functioning on
> separate infrastructure for a transitional period. We've now switched
> over to contributing as Qualcomm Innocation Center (quicinc), so update
> my email address to reflect this.
>
> Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
> Cc: Leif Lindholm <leif@nuviainc.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>  .mailmap    | 1 +
>  MAINTAINERS | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/.mailmap b/.mailmap
> index 2976a675ea..6b28c98a90 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -63,6 +63,7 @@ Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
>  Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
>  James Hogan <jhogan@kernel.org> <james.hogan@imgtec.com>
>  Leif Lindholm <leif@nuviainc.com> <leif.lindholm@linaro.org>
> +Leif Lindholm <quic_llindhol@quicinc.com> <leif@nuviainc.com>

Do you also need to update the previous line ? I'm not sure
whether git will do multiple passes through the mailmap chasing
A -> B -> C remappings...

thanks
-- PMM

