Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC08288BD7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 16:50:10 +0200 (CEST)
Received: from localhost ([::1]:52918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQtik-0001GL-04
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 10:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQtgf-0007x9-JT
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 10:48:01 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:34783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQtgd-0000Ts-QZ
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 10:48:01 -0400
Received: by mail-ej1-x62d.google.com with SMTP id u8so13485702ejg.1
 for <qemu-devel@nongnu.org>; Fri, 09 Oct 2020 07:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u8wMj9ibMiD/FOoQMtJ7Nkl9t2/9EGFEVfb5tzV0hzg=;
 b=LzUvLAGHD1GWtrt6Y6PjykJ1/SynEgunWe9Xfj9gQCqmj12m9ty1DY+mzZTJVnKLmz
 UIphideExK+muV8j8W9KnJtFS1h44aIsNMD5EQ6MpXi1Cjgs6eoJxvHGhrJwnydOE5pV
 r927xFWdGD8bdy7OTIX1hyGRhiSA21RLBfCbdJW6VFTAjaSgN60fyIVY7pJwGHX435rB
 6lJLJADPG3xqw0ugZd96XcnZdN+ADoZSBtMNqdM/IcUzWWWMEIhWKe0tdpdiaJDak1kf
 yzwglPrXfSyXjL1C2nJHGxcHUJ3uZ/VzdKNSAfMZGVMHvB8B26x9aSV02hQpQSh+eYzH
 059w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u8wMj9ibMiD/FOoQMtJ7Nkl9t2/9EGFEVfb5tzV0hzg=;
 b=KkRW947iFGdFhBd/NPqEGQPpAugps+JSCHzx1Uxo3KRp6gfk92hXGVKhq/8ZbWqtow
 hmcIXHk7/bZ1fCBpAC9YP2um/QIum9LpprS4D8xzwlC9asTUXCHjIobW6f3QqCuPHo4m
 byspBIdLoqvEL/gZ+ABWdmDrlVEt5ZmfR+dNwV5E8j6ClO2X8Pyuq8Am4t19oliIj7QQ
 K/5RFgV1c5qMEVyASxaWQpRQQzTOD15KMHwNYVdAwWhNTT9gBExMfFXD2uuFrZPIjIGm
 4X1mj81XEh0fn9DTzTEHLfPx5iykG5CnQrBFMhcCaYps21gr0gFERbU8h9uGJ5GaoBmN
 B5RA==
X-Gm-Message-State: AOAM532AvyrrVhzP4fjvMjfKRH40iQZqTvWqWpoRFWTCtarg84xV+it5
 eBHi7GetODEqLsWFt85FDm541+n+kPGtygG82tK8og==
X-Google-Smtp-Source: ABdhPJxO4xZS+Q4Hz+F7+oJxQxSlwRz5gEkUYBS6X+Kzfeej7nJepl/YJ5MxtWuJVNN/+8aA4puVwwcBV3UsV3M/200=
X-Received: by 2002:a17:906:ce21:: with SMTP id
 sd1mr15026086ejb.4.1602254878173; 
 Fri, 09 Oct 2020 07:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201009064858.323624-1-armbru@redhat.com>
In-Reply-To: <20201009064858.323624-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Oct 2020 15:47:46 +0100
Message-ID: <CAFEAcA-snMmt1XBeJymUHcj+dc4fySZyU05BQKxL-oXA-r-qTQ@mail.gmail.com>
Subject: Re: [PULL 0/2] Error reporting patches for 2020-10-09
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Oct 2020 at 07:49, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 497d415d76b9f59fcae27f22df1ca2c3fa4df64e:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20201008-1' into staging (2020-10-08 21:41:20 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-error-2020-10-09
>
> for you to fetch changes up to 805d44961b9015716cc13c1d3e49457af3970d82:
>
>   error: Use error_fatal to simplify obvious fatal errors (again) (2020-10-09 08:36:23 +0200)
>
> ----------------------------------------------------------------
> Error reporting patches for 2020-10-09
>
> ----------------------------------------------------------------
> Markus Armbruster (2):
>       error: Remove NULL checks on error_propagate() calls (again)
>       error: Use error_fatal to simplify obvious fatal errors (again)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

