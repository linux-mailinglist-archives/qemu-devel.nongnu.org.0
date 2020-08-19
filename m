Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692A524A683
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 21:06:07 +0200 (CEST)
Received: from localhost ([::1]:60576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8TPS-00047h-Ff
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 15:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k8TOU-0003bJ-UR
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 15:05:06 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:41621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k8TOT-0006TP-8i
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 15:05:06 -0400
Received: by mail-ej1-x631.google.com with SMTP id t10so27579784ejs.8
 for <qemu-devel@nongnu.org>; Wed, 19 Aug 2020 12:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vZhgF7vVqAgyXIQ6H19aExJi/hSMQWgzc90Tl7PHwUA=;
 b=mCNT0M1ZIA6KlSHSfzPMWs/A4pZu0Kptg1Z0XElPrB1KR9gsBsaz2em/Uci+dKJ012
 zwLv6AOj3e0vaQbkfwCZLJiS/NXvcJY8z57LE0HfXZ/LOhrLj+eZSCNh6fwmMGzjd5Bu
 qGGtcer4eHo5jbKaCkawJkzeyk3oLq2pPHCRFG/KwBHZWm+l8zmo8uMulW1v1a8y6odc
 QX78UlZEJ5apWpFPzO7PrJ+IuW0Phg4hVkGerKTC4JS5b3WWZ7SAfZRjQcOmE7A08QHT
 YG1V0MFuWTtx0TkIS5E7KHftGXzTz/qGbP/XtO26CbU3i+leRG7ZZyrC0sYJ0GvuiCqq
 41RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vZhgF7vVqAgyXIQ6H19aExJi/hSMQWgzc90Tl7PHwUA=;
 b=KI6VRLBytGCq+ExmPjqFDzH93g5bwKmxB88C6RtxsknC+9jz9RpCasVqybAbIXc3/I
 ZBXmBPEnNm56EUVtkN4fO0qLoa4MXPw2YBoYcZe6pzCAQN3WOLnlezrJXB3c1jifiYLn
 Htg44Onho40L+jinAu3Xxj4pmqroOsUsqbe5lXDcUj3i0IJnmpwYPwEENRj8pOv6bWuR
 qWtfYil2YGOCpzPYRsNrCyq4N6UD+OvSXMS75jj4aVZJgIXznjLyNj7SKaHppcSpwsTc
 jiy06AaZUH8nvOJFE8a56ZLzRki1rcB+B7g3wBp9gArvk2Orf5j0lD8u1R53FFtUoiEc
 oL1w==
X-Gm-Message-State: AOAM530B79902L4SEGMvUql9BWSowmr+3n1ffHmPulU5v5vqrQE3989m
 LxpR2+JjMCtBL3Tvy2CXfsBM7CIKKl7Mi7ON3YW56w==
X-Google-Smtp-Source: ABdhPJzgsiVYtyMNjDaWoxovTRmpFv9nXBerwrlWzVbx3h6sm33pmV+OrAfvM2671lz6VPTWJ1OLwlp/3SPyaOG/0Hc=
X-Received: by 2002:a17:906:3911:: with SMTP id
 f17mr27789616eje.56.1597863903736; 
 Wed, 19 Aug 2020 12:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200819143525.2175-1-pbonzini@redhat.com>
 <CAFEAcA_8VJecDyK8FR0ty=pknmo+Hc5s0OFj+-Y1Ah-OJ01FDQ@mail.gmail.com>
 <5d247082-4928-b47c-76c4-c366a9421e1a@msgid.tls.msk.ru>
In-Reply-To: <5d247082-4928-b47c-76c4-c366a9421e1a@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Aug 2020 20:04:51 +0100
Message-ID: <CAFEAcA_YU8QY_VRNdXmBV=YKuBFaX=scT0Pnk1F8JBWrrbsbJA@mail.gmail.com>
Subject: Re: [PULL v6 000/150] Meson-based build system
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 Aug 2020 at 19:57, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> 19.08.2020 21:12, Peter Maydell wrote:
> ...
> > Also one of my random "just test linux-user" setups fails
> > because the build doesn't seem to have put the final binaries
> > in the right place:
> ...
> > I can live with the .o files moving around (though I would have
> > preferred it if they did not), but the final binaries should be
> > being built into the same places we always have. Otherwise we're
> > going to break a lot of "just run from the build tree" setups
> > and instructions.
>
> is it really that important? We've changed single target build
> rules already (from subdir-x86_64-softmmu to x86_64-softmmu/all
> for one), which broke quite some mostly automatic build
> systems which needed some fixing. Moving executables isn't a
> big deal after that, methinks..

It breaks my setups and also my muscle memory for where
executables live. So this is the limit of how much I'm
willing to allow Meson to mess us around, I think.

thanks
-- PMM

