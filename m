Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE681310D1F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:24:50 +0100 (CET)
Received: from localhost ([::1]:41540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82yX-0004m2-SE
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l82t5-0005gs-5H
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:19:11 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:43485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l82t1-0000s1-3p
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:19:10 -0500
Received: by mail-ej1-x631.google.com with SMTP id y9so12439554ejp.10
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gOxulKDi8kJCgjSz1Ig8JNgh22vDccrvOYs4SykpmU0=;
 b=cusOfrHpWWnJ9b5Oez1mtQXhpfwQo50qmty8nJHhe0wfSSo2X/x66A9uE5A4swZ/eK
 eYklqcLpH6VdOEkBQxhI6ulFTvjQq7N/Xtbl0IAKdy4xDAi+hWHb9w545Uf5rzNV44Od
 CFeh1bqAhQ94NytEbqMQB8juaYIrx9t+SQF3QMVPVAv+JINJARP3qzl3zhnYZTyvxUTw
 0IS7+czxjmG73EPYgd2oLxSgJqsu91xaVJNZVlrGPMOuSzA/1LkFa6Ry0TH2T1989lQ/
 TiFKV/dkJesXcBeVOabK1GfyrrKIWVS8w1Bybaq0Twx4G2/Z4xRq5Bh7EYfZ3qEemW+Y
 b2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gOxulKDi8kJCgjSz1Ig8JNgh22vDccrvOYs4SykpmU0=;
 b=NY/5rG9mlQ1+WC0doul+P/0+lNZy86hk/3xonpzayrW1uL7CTybXrSH+uCdcz3JkYS
 LHekHU14zQyUFakkQ2bJ0yC/j/rGbYYGRKuddvATCzzG8PADOB1gTMgiWsSUU661RzdF
 k3cpOeAk1DZbVos2pGfUiBf5c+sXim6AgqtuRf6HsK9A2mODSjn6lnd9069rEJ2OEeD+
 hKfrjS19hYAsUo5D3vNoLY24mpGyeoCtmgji7JFDvil2VycyZGj+IRZJLHCFaQSE6Jjb
 SF8NwazUBB+mPuvUPfRnxR9zuZO4mXnLOihmdZaiTz+1vi4eLGXmE/0GFveaB+gjwIsf
 7xzg==
X-Gm-Message-State: AOAM530/Q6Y9PrR1UdSNrX0oSEuPy8lzXxCyfETaP/Xsc/vMQUAD7dxl
 Wj0PiHOCvjMZUGU5uOTbbL74GOZXnwz6O3Ny8ti1gA==
X-Google-Smtp-Source: ABdhPJzUrJwOHbgGjmwr/hT9M2QE082sac+Vi+EjfNaXT4y1lj2sS9nAU0gh+clo35ik/gZGhsgEPKinmPOK7NMKNyQ=
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr4524525ejc.482.1612538345495; 
 Fri, 05 Feb 2021 07:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20210205111021.715240-1-vsementsov@virtuozzo.com>
 <c3c5a481-08f7-ddee-492c-0b9e637a416a@redhat.com>
In-Reply-To: <c3c5a481-08f7-ddee-492c-0b9e637a416a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 15:18:54 +0000
Message-ID: <CAFEAcA-4NwZYao_J79tRFu7U4J-doRurdEFBrZfk3u=J9m=8iw@mail.gmail.com>
Subject: Re: [PATCH] iotests: 30: drop from auto group (and effectively from
 make check)
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 14:48, Eric Blake <eblake@redhat.com> wrote:
>
> On 2/5/21 5:10 AM, Vladimir Sementsov-Ogievskiy wrote:
> > and trying to reproduce it on top of
> > "block: update graph permissions update" I had 634 successful
> > iterations
> > and then the following crash (which looks much better):
>
> This part of the commit message is odd - if we check it in to git as
> written, you're pointing to a future commit, while still stating that it
> is not a perfect commit.  But maybe by the time that commit gets in
> we'll have figured out this last crash and corrected it as well.
> Sticking to just the first two logs is fine by me.
>
>
> >
> > So it seems reasonable to drop test from auto group at least until we
> > merge "block: update graph permissions update"
> >
> > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > ---
> >
> > Note: be free to shorten commit message if needed :)
>
> Indeed.  But as to the patch itself, I agree, and may Peter wants to
> apply it directly to master instead of waiting for it to come through on
> of the block maintainers?
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks; I have applied this to master, after trimming the
part of the commit message that refers to as-yet-unapplied
patch series.

-- PMM

