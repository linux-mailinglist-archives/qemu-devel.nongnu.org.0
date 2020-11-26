Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD942C51D6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 11:13:02 +0100 (CET)
Received: from localhost ([::1]:47274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiEGs-000666-0j
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 05:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiEEH-00051g-CB
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 05:10:21 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:39964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiEEE-0002uL-Dg
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 05:10:21 -0500
Received: by mail-ed1-x52c.google.com with SMTP id d18so1648422edt.7
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 02:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZD2GhZ7ciBFg0gpRHqMQgLtXFpl1oBr0xntuRORsfr8=;
 b=JWgNhG9RomFa/tEnXZ6y+tdwl1wAT3RN5P14lyvgzIy1c+nmC75ASWqp4r6TQYO/cH
 T4QdSHGCTMIGt/N5pFXj6ZO9zqRZUZSIAgGdKOiYyXY0NBzk4umwjMf9QGHRJq5yL6/r
 TiyzP+oLomwYOJnl6RO3hWo4C4OkTXZ/BrjO7Hs+czC+X3ZasHB9KFge4mixfrkz+xIJ
 mpc7qKne+dtkeZ+WoSf8GSOlGkKRWQJzwyjkf/tuRWSwOEBOvigOLivWG4ppKPizfU2N
 2c1mtei27ds5dw5faBVwKo+X6oWJxXizszeyWjuv2DmudysEibuUHX8C5pE+gctWW8bQ
 s74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZD2GhZ7ciBFg0gpRHqMQgLtXFpl1oBr0xntuRORsfr8=;
 b=In2jft22Jnxps4HOIFn7qqzo5lcXhRYSVQ5zun2LejihVmLjqNEWKpg89GfgWsfOo6
 EPsTDJO56UD3VfZ+fHMJXD82TwL8UkXWtTnZyVS4H8+qOEf1I8rSkQ3yVsR0dMDCz9w0
 GPIH7sqHlMvlguW4dvQTb6AdqKHfz2Q1T37Rc9IhWI5fXqQsQ8KlgjZAuaYIb81iFGuL
 bP7WK0BNXgetlARP0oMi0qrpSAYwvyNOXIVYjahcggFl6tk5C0kn3rhFtRqqHBW++ro1
 woPovQ0uo8PIH2PhEsV1xKfdpd1uwBTnff4R58IPvSWkc9wg/zHQ94UYIkOJuYZEq8HD
 H1FQ==
X-Gm-Message-State: AOAM530vL9Op4hFKPFwsCB0t/KDxrmas4ceTI8SuEb4y5Psz9e9srD7B
 citj7OBwkhJmIZZACEd/KD+McZsuB0Rw+G4yL7PlXA==
X-Google-Smtp-Source: ABdhPJy6p2lscfY87zDasHpV5bBWrxx1Qo7NN5K8bDvHYpzQOh0hSRasrdRkxRbHgGGjnzhAMo5AUxdZ7uYIAFgT/iM=
X-Received: by 2002:a50:fe88:: with SMTP id d8mr1767522edt.36.1606385416401;
 Thu, 26 Nov 2020 02:10:16 -0800 (PST)
MIME-Version: 1.0
References: <20201126075921.3116321-1-pbonzini@redhat.com>
In-Reply-To: <20201126075921.3116321-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 10:10:05 +0000
Message-ID: <CAFEAcA8YP0-=RUVdW1f6M7NizMvNXwLoBpvqUqyPQNCJ6d238g@mail.gmail.com>
Subject: Re: [PULL 0/5] Final (?) batch of misc patches for QEMU 5.2
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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

On Thu, 26 Nov 2020 at 08:02, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 8cc30eb1400fc01f2b139cdd3dc524f8b84dbe07:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20201122' into staging (2020-11-22 15:02:52 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to dae3916d846cd88aff038a56b82fa687fd6d02a3:
>
>   nsis: Fix build for 64 bit installer (2020-11-25 17:39:12 -0500)
>
> ----------------------------------------------------------------
> Bug fixes + removing the setuptools dependency

Hi. We've passed rc3 now, so the only things going in should
be absolutely release-critical bugs that oblige us to put
out an rc4. That means pull requests need to have more
explanation and justification of why these are release-critical
issues; just "bug fixes" isn't enough detail...

thanks
-- PMM

