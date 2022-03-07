Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DE34D0842
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 21:23:19 +0100 (CET)
Received: from localhost ([::1]:41396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJt1-0004bq-1O
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 15:23:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRJrK-0003Et-DG
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:21:36 -0500
Received: from [2607:f8b0:4864:20::1136] (port=38374
 helo=mail-yw1-x1136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRJrI-0008KI-Gz
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 15:21:33 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2dbc48104beso178426527b3.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 12:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BTQ/utWAFYxXsy3F1wvvLF7VfAeHAAn62FoS3Q7VmaM=;
 b=WzT2NlRJJDb7WULwwmUWXNAx478efS+E3j8vkB2UXvPKTpqQ2LXrQbMTHDNcFnCdr+
 L/tQHjT+1NR6q7rYmfM+QOuUSqUeu330Nk/oQg82Qk56BU4Apu4j0UJE/NoTcGoolSdq
 VBXla5E8m0dExy6FEX8ESVgzGnU/N/9Uth5vfg4zMFsO2EUusx7RgNFZPEyXJgOXpv9+
 JyzVOKKmyp4M3CYJ+xIdJmK0JAyK5QLw/xKY8SBmUFN29KOWfRPUPtEJH+Tfubd+REnG
 dTwkb05L47AweymUmcus6hGN1Wc6A3sz0q2uJxyV6urn+Q3XrsT/sz/wu6HgMjCuo6q5
 Pl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BTQ/utWAFYxXsy3F1wvvLF7VfAeHAAn62FoS3Q7VmaM=;
 b=06LS7tAkntUYa9i5GrMjgLgrfLijy5jGo9i7RbBoPFw0Ha8uJJ4zp20BBNn0N4/GEK
 9gL7UQqC173EJm83PBD4SYWHnjk0mRsPu0RUZ4NtLGKvD5iWWQ0zluzKKWruTeP+PEZJ
 BNXlyBkrwfC/y9/1lsco6OVAskBnu1IH1u0xfxorBPYlZh7qNTfHfBBH2xBENFWr3I9c
 wSBcAomAI7t+jTr0pUbqa3tuic0ja+RkbjMPYS3ci/HGYTx4Nla/Xg/PjSYU6KGwhOMP
 dH+OvxBU61oGlc4sPZHb3GS6rpg8jKcWa7n13P8/g8cIPchboeo1m6yLbZLv3dUYfPpM
 TL0w==
X-Gm-Message-State: AOAM533oHSmGJ67guMGHF0cs8JAp+thU5/wGifm2Ya4qXeBAndmFLN0i
 nTTQHr0jQq2ynfCQPDg8urBz1efMnm7woMmCM8Ij6Q==
X-Google-Smtp-Source: ABdhPJyhwYWC57LEQURiVkYi9GjERik+hrPaD35IVcJqy0vb/FX4UKuBMjfh/5PXC6b0wAA1wBanqiyvDiM5HyeZLmw=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr10564415ywb.257.1646684483796; Mon, 07
 Mar 2022 12:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20220307191553.429236-1-danielhb413@gmail.com>
In-Reply-To: <20220307191553.429236-1-danielhb413@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Mar 2022 20:21:12 +0000
Message-ID: <CAFEAcA-=--vfvh9ZddyRKfcXqoW7fnjLVcqZpyP2tM8b8vhO=A@mail.gmail.com>
Subject: Re: [PATCH 0/9] add LOG_UNSUPP log type + mark hcalls as unsupp
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1136
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
Cc: david@gibson.dropbear.id.au, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 7 Mar 2022 at 19:19, Daniel Henrique Barboza
<danielhb413@gmail.com> wrote:
>
> Hi,
>
> I got a lot of noise trying to debug an AIX guest in a pseries machine when running with
> '-d unimp'. The reason is that there is no distinction between features
> (in my case, hypercalls) that are unimplemented because we never considered,
> versus features that we made a design choice not to implement.
>
> This series adds a new log type, LOG_UNSUPP, as a way to filter the
> second case. After changing the log level of existing unsupported
> pseries hypercalls, -d unimp was reporting just the ones that I need to
> worry about and decide whether we should implement it or mark as
> unsupported in our model. After this series there's still one hypercall
> thgat is being thrown by AIX. We'll deal with that another day.

So the intention of the distinction is:
  LOG_UNIMP: we don't implement this, but we should
  LOG_UNSUPP: we don't implement this, and that's OK because it's optional

?

I think I'd be happier about adding a new log category if we had
some examples of where we should be using it other than just in
the spapr hcall code, to indicate that it's a bit more broadly
useful. If this is a distinction that only makes sense for that
narrow use case, then as Philippe says a tracepoint might be a
better choice.

thanks
-- PMM

