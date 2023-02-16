Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D1D6999DC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:22:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSh1g-0001zt-NL; Thu, 16 Feb 2023 11:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSh1f-0001xs-Bb
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:22:27 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSh1c-0006yA-ME
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:22:27 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 kk7-20020a17090b4a0700b00234463de251so6343272pjb.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B165yzoaoQ4pNicAlRZpJSozM0YC8BhzYoYDe1uoDBI=;
 b=xfWVY79zZuteURWVs9e86mfCSjXvu4t34HTnh9TBtdCC16tpndhHicL8UbG2X6ea2u
 j/2ZckzKrb8WsRt+gAIMReNtScDfoLI7KzgJvCSNCCiX49AziOUKvBVYnQwjuRaiYLdw
 /gIJyajXY8TE6tVhlVm/1Kco4eNczhjPCKzJmg7kFeECe669cn3mWg84AwXeMXjqGp1A
 mxmOYCMK+2OYWM/9MJosXDrLNwijSaY5WHCLOaHNf1IUwGHh99E2EehQC2dJ/FhsR/Sg
 kC+tl56MQ/jIwD7T81MS3BFfzkFCxD3+UTFZw9uxBucOq4szm3PsGiNO8KT18MWdu+9L
 ggyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B165yzoaoQ4pNicAlRZpJSozM0YC8BhzYoYDe1uoDBI=;
 b=LBzBHIWgTRov2t0nqG+oG5smjkN/w/IpdP00uO9e1oe1xAiTlSk8AF6MJrgH7FSpV7
 N5vZtgB5cX7Qqo/gnKRwxXetdU5T3w0MWl6YHdt/bzDTlMI7AiSF1YZP2zRhL+wNaz2i
 tcmxG1qqxKfo8qLmC8OOZQ5G38jByW4yEN8q050wmytunSvIjXelqnQc20kxSHDHMRkM
 j3vWlcSUMC83zz/Bb7vpBbRi4adIE8UQDfxCFKJqD8vCh083l5M2FqSubnc/2jlP3El0
 b1wlHoVQawZR4LVu0HXDZs+Rkta8c+unbhQQaD2816I8Ti8tSEN4KBSreL8ImDEJr1FX
 Z3dQ==
X-Gm-Message-State: AO0yUKUQcAq5Mfm/zwiAOBlLyLiM9eWuAf+GHhcpNtPZmMrKHqizBtXZ
 3KmimpkM5PudYxNAyPe9qEe8WfRYER4CJFR72co6TA==
X-Google-Smtp-Source: AK7set/i7tDNf3b/prKKyZcYfixSmBCcTnSAW2MrM5NCGX8XxjucnyjmgDvBtpRT6iIh+6xr14UddH9y0dHhup/18s0=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr758545pjb.92.1676564542795; Thu, 16 Feb
 2023 08:22:22 -0800 (PST)
MIME-Version: 1.0
References: <20230213202927.28992-1-farosas@suse.de>
 <20230213202927.28992-8-farosas@suse.de>
In-Reply-To: <20230213202927.28992-8-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 16:22:11 +0000
Message-ID: <CAFEAcA8CDr110xtvThtoC3+Rhr1hDLjShxBCxca1oC0mdNvYiQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v5 07/28] target/arm: Move define_debug_regs() to
 cpregs.c
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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

On Mon, 13 Feb 2023 at 20:31, Fabiano Rosas <farosas@suse.de> wrote:
>
> The debug_helper.c file will move into a tcg-specific directory, so
> take the cpregs code out of it. That code needs to be present in KVM
> builds as well.
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/arm/cpregs.c       | 473 ++++++++++++++++++++++++++++++++++++++
>  target/arm/debug_helper.c | 459 ------------------------------------
>  target/arm/internals.h    |   9 -
>  3 files changed, 473 insertions(+), 468 deletions(-)

I definitely think this is not an improvement. Currently we
have a file debug_helper.c with a reasonably well defined
purpose (debug related cpregs and code). This patch moves
half of that into the already massively too large cpregs.c,
thus undoing the cleanup we did by separating out the debug
register code from the huge pile of code in helper.c.

thanks
-- PMM

