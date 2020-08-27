Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B33E254A17
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 17:59:48 +0200 (CEST)
Received: from localhost ([::1]:48622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBKJX-0006K4-5e
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 11:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBKIq-0005oS-Gc
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 11:59:04 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:34792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBKIo-0003jo-PL
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 11:59:04 -0400
Received: by mail-ed1-x542.google.com with SMTP id q21so4173170edv.1
 for <qemu-devel@nongnu.org>; Thu, 27 Aug 2020 08:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7B6JO1/nVl/MSKzaEgtHj1Ftg8kCaTfzwn+gtAmIuEg=;
 b=G55LDTkLG6Yxihw43i78gyC1zRuofDVXD+Ygpn+ScYW5VjLjQ3WuO+KunnR4IRYyeo
 M08u2H/b7nj7tg7Cpw3enxXiZjZXbiP6y5T9JPw/RDTAfpZOINPrjYG+m0ptXyS74sa1
 rWM745j2kg9kMzdDTXeysDMYjh6dwQuNquEBDtp4GrLqNj5qQoAgbT1cBnSA4KExkQxn
 B32aSZ0LSFna5DJF5XraayPQmUIN87/xs0E7okVYTN0Ck1QqIosqgJ7fdR8/Te3zeVFY
 op8Fo/nTKlT2LIAOXSskDB/tBFh7pbOlo1PRD/M+tq9KZ3FoZ57g4MZgTwMFRUINp9Y7
 aGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7B6JO1/nVl/MSKzaEgtHj1Ftg8kCaTfzwn+gtAmIuEg=;
 b=Tpa8wP3XVfGoFnBzx933RSHQINBA7cA5BP53vb0JwLitgMb0t6Dix6ui/pw4dAS4zY
 KoOo3oRSX8zM4iC7bHWpHLf/upCVnTrn/+/i8LMDpkr/PZJwB0oxEi1DqX0BxatTVpoy
 WQPvPROZse+vZERRZRT7REktsForYV9NYgVIBMtPRRx8fywIL/yl1F/+NdyA7iSZTt/z
 DzDdlUKMoeGWOyzowhJMXluFy4WyjzvoMwJbRjoVf51PGqJCfULJw+7qAEN6ep8+AyrY
 iT6U/gq+rqX/NGHRKWkDnLV72XIRo+qwTSiLcR+6hVNC49WZfce/GpszTAQkoAoCf1No
 7rdA==
X-Gm-Message-State: AOAM530cr9m2c6SK+gVNUIY9X/E+sMorLHZboBH85Wo1SjxnMdccraNY
 nGRHfr6h5+qrq9/K+T/03WVV8maDYE+uWtaqIe20Fg==
X-Google-Smtp-Source: ABdhPJyZ/UadFupfQyA9Y3K34RmoIwtxZiAPPijGE7VEltvY6q2AOFCJtKYTb2yI3bWmBm7tSTpxKama3ie50mqF1Ec=
X-Received: by 2002:aa7:d596:: with SMTP id r22mr20884423edq.204.1598543940894; 
 Thu, 27 Aug 2020 08:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200827122057.232662-1-cohuck@redhat.com>
In-Reply-To: <20200827122057.232662-1-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2020 16:58:49 +0100
Message-ID: <CAFEAcA-+w4WjTVuXDnGjY4C_sakvgxyWkfXnuMH1gR0_me2q8g@mail.gmail.com>
Subject: Re: [PULL 0/3] s390x patches
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Aug 2020 at 13:21, Cornelia Huck <cohuck@redhat.com> wrote:
>
> The following changes since commit 8e49197ca5e76fdb8928833b2649ef13fc5aab2f:
>
>   Merge remote-tracking branch 'remotes/hdeller/tags/target-hppa-v3-pull-request' into staging (2020-08-26 22:23:53 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/cohuck/qemu tags/s390x-20200827
>
> for you to fetch changes up to 0216b18b79c432585b9cc49532c6223d766d552f:
>
>   hw/vfio/ap: Plug memleak in vfio_ap_get_group() (2020-08-27 12:37:03 +0200)
>
> ----------------------------------------------------------------
> - document s390x boot devices
> - bug fixes
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

