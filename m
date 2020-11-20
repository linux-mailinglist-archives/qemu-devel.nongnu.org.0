Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368CB2BB0CF
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:43:10 +0100 (CET)
Received: from localhost ([::1]:42878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9V7-00013R-9r
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9RB-0004mv-8V
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:39:06 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:35871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kg9R2-0000TC-Kg
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:39:05 -0500
Received: by mail-ej1-x644.google.com with SMTP id o21so13731364ejb.3
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 08:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9lRlHFFKCdWP0KQA4oVpERWDC2UU98p0VwmPKgcL1oc=;
 b=wqmeCYRlAYKAnSeUI2avsaEEgbISS7JZ6ckyJzgaVWdKP8+8GyystuTLgV/QJBLofo
 /UOKui5Lsyk3WOQy2nThJAYvRRmlH1yZgSgDRHrrUram9Ojxzkga2lcbFNc0hsAv7aCm
 dqEpdJ5sUTbuzxBr+/BSYSTEDIcWXnc8zlGAUoUMNs57iavQUTk5BFOCHQGe5G2zecZR
 mpPikfEPpK1kLydgnV2XD6UlB+9BMtABrEIjbPnC7Lzbz2FCI5K8I5sxwqiK/2MPwKQc
 oG+CW6/f7gcuV96OaqFpDSepj0WYfHmyevqNEqCqprkinmqkSrZUY+7qiuAxQRE5ECAK
 xZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9lRlHFFKCdWP0KQA4oVpERWDC2UU98p0VwmPKgcL1oc=;
 b=n5eBgsmbwYeFV0jNNOEdyrjnkA4JCyz+6D7qxtIcOpEGP7YBY7uU6soHu2d7Wl1w8u
 bHmxqlq7n8Rqr5h4WcqQs+cnSCmQlO+wwYP2Km31jqkWecCHpKzrmzjkk93Osk0Pr4Uq
 3OsjAmVOVBEM8lymrB5njvuzPSrSjxER+gp15LiesJcRXjkANkj//fM5YdjNDL1+VDle
 gKb0Hhj+u2sCwLdKSBWsMBHuBP1s18elVHz0P10Et4Ly+g6qAkgklDgXI0wpd4TBYfwF
 bWrffqSwg0xMoV6u7WN7zdBTmLp8OWwk8Ao49YWcTGnmuLChU+t8HiCKbmli2gZDT+XX
 xtCg==
X-Gm-Message-State: AOAM532VXFS/SU9WjwV7F/On26V2VtyZj+uqNqo066a9CJVmJze/P462
 ODWP5iKePeMl0AB6ZFQgzgEL3IkVouOYyYpmWietXg==
X-Google-Smtp-Source: ABdhPJy9/4Frqh+Wczyyf2VvKNjKbLqC3izDMFIoYfDvVDxIOQt+PFS5/yPj2p20yVTkEgshiumDb3nd5Vb38FCPvB0=
X-Received: by 2002:a17:906:b53:: with SMTP id
 v19mr1775586ejg.250.1605890333697; 
 Fri, 20 Nov 2020 08:38:53 -0800 (PST)
MIME-Version: 1.0
References: <20201118150414.18360-1-remi@remlab.net>
 <dcebc069-43b7-0a82-809c-55d6b090fff9@linaro.org>
In-Reply-To: <dcebc069-43b7-0a82-809c-55d6b090fff9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Nov 2020 16:38:42 +0000
Message-ID: <CAFEAcA8gbMnWAT000Dsbk3=dh1+izXFhX-0VxFo6hCCNN0Og6w@mail.gmail.com>
Subject: Re: [PATCH for-5.2?] target/arm: fix stage 2 page-walks in 32-bit
 emulation
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Nov 2020 at 22:37, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 11/18/20 7:04 AM, R=C3=A9mi Denis-Courmont wrote:
> > From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >
> > Using a target unsigned long would limit the Input Address to a LPAE
> > page-walk to 32 bits on AArch32 and 64 bits on AArch64. This is okay
> > for stage 1 or on AArch64, but it is insufficient for stage 2 on
> > AArch32. In that later case, the Input Address can have up to 40 bits.
> >
> > Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com=
>
> > ---
> >  target/arm/helper.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Peter, bug fix for 5.2 or postpone?

Looks pretty safe so it seems reasonable to have in 5.2.
Interesting that it's taken so long for anybody to notice...

-- PMM

