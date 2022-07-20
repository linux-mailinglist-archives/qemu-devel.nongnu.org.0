Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F53257BFAA
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 23:35:20 +0200 (CEST)
Received: from localhost ([::1]:39114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEHLi-000814-VM
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 17:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEHK6-0006dn-9s
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 17:33:38 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:37819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oEHK4-0000rH-7A
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 17:33:37 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-31e623a4ff4so55083177b3.4
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sLeTKjz7JP9algvK/gdu8b/A/JuuOUmh08gOi74ZvPc=;
 b=CXT+XK1j36GeA2m09yMdRVx2GIyQ7YOAASMnZc+B3VgkDav2mjc5oQlwuV+3giHBFN
 e0VzAmPtRVQtnaqqAfydpcbFAY9jImoRSiKXR2DQ1cesTssGwzG7p6hixQbJvffAVKyE
 faihe7LHStuMkb6VFrPFjcDXChaWym1g38+wBWNz5Q4jJcXgkbZmigjDpkbDwxQKdfRd
 8jKg7yTXEO+6rUlZsMHZjMP6iHvWiTYSGQKGIs439U85v5Q5L3xMHlzhzNsP3H8HAuGw
 xJx9jJvJ0zd7Q/NUGlZb1+QutpZVdSffcbhYbJMpvptX0+/uYwsDbDcJDQObfO3mMWDY
 YNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sLeTKjz7JP9algvK/gdu8b/A/JuuOUmh08gOi74ZvPc=;
 b=SClEk4fWhdz+BnLI4cDgV1MvUf/5mJqNuAQVw4Bua9Hhh7H121stS6/Ob9i7oC8VBP
 zdcjRAjxkMh1Hl+mJC/LILSKjidF2xYZIY/PfXbjgHzwp2AmJOV94ZoeDHBJX3ZBveLr
 BeJJugqwvREXXxjVaCRConKjxkx1/Va4cmq8RY6IAVK18hXDghfwMDCgRQ0TxWMEkA1H
 bZmxyuf+tEa9bQex/QZPATrUuXa/LQx4wJ9pUylVtGrRkOGdo1/WixFHTJBkPz3/0mD5
 n4DfCsfEZJa2kyN22trBzL8CDR2j37Ie/yCOXMQwgVSBScA5CwDOvlh4qruHE3wXzkhr
 c4fQ==
X-Gm-Message-State: AJIora+NZ/O8VY+T3znLrxUtfRiQm1EdNT4Yl24WKg6UplEoy+BydQ1V
 h49S6y811kq7y+WlLEEj+wuu568svSMj5gvhnJLDmQ==
X-Google-Smtp-Source: AGRyM1u3NVYiqAj/hGC32Fls1SLHY3b3g5QF5amAViFkFnv7Rfs3ZZBZwEiSUIBd/ZZqCbbyHbh12jYnqbz01z0u9Og=
X-Received: by 2002:a81:1116:0:b0:31e:7a03:5ea with SMTP id
 22-20020a811116000000b0031e7a0305eamr1330098ywr.455.1658352814943; Wed, 20
 Jul 2022 14:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220720090313.55169-1-jasowang@redhat.com>
In-Reply-To: <20220720090313.55169-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jul 2022 22:32:55 +0100
Message-ID: <CAFEAcA-yOsE=AZGOTi8ZCs1bUtRV=qj_=_Q6vyLiYnmxJF+=DA@mail.gmail.com>
Subject: Re: [PULL V2 00/25] Net patches
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jul 2022 at 10:03, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit d48125de38f48a61d6423ef6a01156d6dff9ee2c:
>
>   Merge tag 'kraxel-20220719-pull-request' of https://gitlab.com/kraxel/qemu into staging (2022-07-19 17:40:36 +0100)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 8bdab83b34efb0b598be4e5b98e4f466ca5f2f80:
>
>   net/colo.c: fix segmentation fault when packet is not parsed correctly (2022-07-20 16:58:08 +0800)
>
> ----------------------------------------------------------------
>
> Changes since V1:
> - Fix build erros of vhost-vdpa when virtio-net is not set
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
for any user-visible changes.

-- PMM

