Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48665F0B5A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 14:09:46 +0200 (CEST)
Received: from localhost ([::1]:52036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeEpt-0004fs-AT
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 08:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeEjD-00018l-9j
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 08:02:51 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:45631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeEjB-0006SQ-BK
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 08:02:50 -0400
Received: by mail-ed1-x52e.google.com with SMTP id m3so5660298eda.12
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 05:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=VvFUal7USceGgmmUaNEQtoUAzWn/9vlr13TQQSMIhsA=;
 b=zEPEmxhXxL2zChD1QQr5/SIw6D4fO/VgyvOm58BDVQE/g4E4MJlCQ1Oi2OQnTIqTJE
 sA3HzPe2T3ZXZozem2lw3pCJkDl9loUU+CW6mmpQq+/QvRg1G9nCCbxGipN/pw+E7rWB
 4jfqZzicqw2YDRb6GNeTiAZdMzKs//m+ynM/88cHxi1ZBPiVq0NCp5FoBFGyxafs5S4y
 yGM9bG7gyzpmx1/vtDm/VcsNbBhkYr2Wd4K02z9xxiH2GQDuPspE5tPnlq3Q/4iyPfPC
 NWjY7vMxVZQ3ehIAMh3NzEIn+7/g1c6S8/uUPF1PYb+/j6pVvMnbv5yekW5yUUVdK8z8
 1i6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=VvFUal7USceGgmmUaNEQtoUAzWn/9vlr13TQQSMIhsA=;
 b=hVZ8SAs4W1gZy59MjAe+/R/1gOGetkVMvK5N1C5+OsDOyur3tAMkLGJeMkuBKc1kJ2
 W5dwXG+Xk74mA1QsssiURl73mE3P5f7f061xnIsqJ11BaLci0in1b451aa1dzNexrpY7
 cjQ6qDeUjEfz+JAva17kYTNg7DGKwedV1h/7qUp3Zn/8uMKtahM+OJ1QcJgv3RIObnX5
 fzYZHfJKcUumdpItylRM/Eg0d8TWcb/JrBQN0Bs2+P1zcVnqjZaiJS/P9TmseZCIRHwZ
 mfyIxmRG9iaS5Iwe6pthRqLE1I8p+6iBtqjNxDPMDOSFJAGHHrWguAEDYIMDkoRLBdfq
 EaBg==
X-Gm-Message-State: ACrzQf1Vhe2rHGLRqeXdE1mEtWCb8HrIELn2vxHpvUxRPHmECqmVpnQu
 mSnaBDMzC8u7HhizZXM8wsJnVSUvkt1PxxyYdE1m8SkUYwM=
X-Google-Smtp-Source: AMsMyM5w0J1NV3OhCjCodxkr/v37La6p0BgH1mE2vjpn0TI2Jw0fhsI9WR+MhYEmvRi5BT0O4qXwD7VoFGk4Tuz0h6U=
X-Received: by 2002:a05:6402:350b:b0:452:2b68:90db with SMTP id
 b11-20020a056402350b00b004522b6890dbmr7607783edd.255.1664539367192; Fri, 30
 Sep 2022 05:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220925105124.82033-1-richard.henderson@linaro.org>
 <20220925105124.82033-17-richard.henderson@linaro.org>
In-Reply-To: <20220925105124.82033-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Sep 2022 13:02:35 +0100
Message-ID: <CAFEAcA-WzwA6zzDFezBqUz8U7ZT6q9bCP0Jj1iXfHydDe1nvZQ@mail.gmail.com>
Subject: Re: [PATCH v5 16/17] accel/tcg: Introduce TARGET_TB_PCREL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 25 Sept 2022 at 12:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Prepare for targets to be able to produce TBs that can
> run in more than one virtual context.

> -/* Similarly, but for logs. */
> +/*
> + * Similarly, but for logs. In this case, when the virtual pc
> + * is not available, use the physical address.
> + */
>  static inline target_ulong tb_pc_log(const TranslationBlock *tb)
>  {
> +#if TARGET_TB_PCREL
> +    return tb->page_addr[0];
> +#else
>      return tb->pc;
> +#endif
>  }

This is going to break previously working setups involving
the "filter logging to a particular address range" and also
anybody post-processing logfiles and expecting to see
the virtual address in -d exec logging, I think.

For the exec logging, we surely must know the actual
virtual PC at the point of TB execution -- we were
previously just using tb->pc as a convenient architecture
independent place to get that from, but should now do
something else.

For places where logging a virtual PC becomes meaningless,
we should at least indicate whether we're logging a
physaddr or a vaddr, because now depending on the config
we might do either.

For the range-filter stuff, I'm not sure what to do.
Alex, any ideas?

(I see the -dfilter option documentation doesn't say
whether it's intending to work on physical or virtual
addresses...)

thanks
-- PMM

