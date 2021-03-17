Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BFD33F3ED
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:19:33 +0100 (CET)
Received: from localhost ([::1]:54880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXxM-0007j7-87
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMXf0-00061k-Ea
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:00:34 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:43836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMXep-0003Yx-VJ
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:00:32 -0400
Received: by mail-ed1-x52b.google.com with SMTP id e7so2635388edu.10
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MhC9aiynPKbhzUX2TnjX+P5X2OcYCYWRgkR3kyI29lc=;
 b=vVlgq19LgCMOxJlRASIONHIOx91mWCHowrpzjZyZyv+NZY/qxm0GuV4Ue2SWWdwA2U
 OrQdJ2AxzUjq0aDoFuDfKMOhaWFcpTi2svpMQHC+prtbLeKw5emYBM8+TQ22nHwGnqAD
 NFdnsKaHWpB60dtpP0Ho23zL4x5joPhIbyKtD4UVa5JI6WYfkJH284/WNHuDX2BRsymv
 GDUutnOVO+GpNGRUqwazHDT5ac6ySlFeWNglQtNV//xcX6dMpLzr+mlfXpZb4nrZg4R0
 fhmpSkiPmETMIipQlKzWzDDhg9Dxo1iGPfG8MFx9/JJaLpG9k0f+6uArP15qcJSwA0US
 hF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MhC9aiynPKbhzUX2TnjX+P5X2OcYCYWRgkR3kyI29lc=;
 b=BuCdUGVGwSVdFs9IA6qOy0U+kFA7TUX0xeq86lGc4+TYazRJ1piWdTV0237i6p379+
 BUI+gR6RMyCjX4mnxOVjixsW/3GIPfRNolqWQOHUzQUPWbYtjISkoRa7iY7TsFOpUSRs
 aN6Foxw2g4mjdCQw6m1nkMGJT6CukOqzhGgq0ICpQ40CSPu1HFZi9eWDqx3sBZAhH1Oe
 IHGslpFBsHQrA5PiuYebngsKibsMSHL0vxXzs0c615T8rYHKG+BTVRxRtcMnfFxiI2U8
 QGCSMDEKIuJ4/ucAMo1PbD3+IInDg+j7IgG9nwINkFFSjDPryF+zkryIkh2nfopkdSg+
 fbtA==
X-Gm-Message-State: AOAM53318iDa62W0LtGeC+B7q18iAlAc+MZB5dBVbBcmdNP3gyOS/403
 5ig0qjCUQbh4kAYR0QdQEhbmYQ9zXJb3A9sFuZmSvw==
X-Google-Smtp-Source: ABdhPJz5jjqJsbCSMaAIKQxeQ7w3Z6qZI3dwZJ6jvLDtA6YPgicZ9v05OH3aEgcQIRr1LbJ1jUyov15odCB7CMBDh0E=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr42230623edt.36.1615993217162; 
 Wed, 17 Mar 2021 08:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210316053813.1719442-1-kraxel@redhat.com>
In-Reply-To: <20210316053813.1719442-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 14:59:54 +0000
Message-ID: <CAFEAcA9XAjzKgNay-e_Y5i6CcYO+Urjm4CJoBxC-=1t=rmct3Q@mail.gmail.com>
Subject: Re: [PULL 00/11] Ui 20210316 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: Libvirt <libvir-list@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Mar 2021 at 05:38, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 6157b0e19721aadb4c7fdcfe57b2924af6144b14:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.0-pull-=
> request' into staging (2021-03-14 17:47:49 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/ui-20210316-pull-request
>
> for you to fetch changes up to ad7f2f8ee9fbded410fbf77158b0065f8e2f08e3:
>
>   ui/cocoa: Comment about modifier key input quirks (2021-03-16 06:36:45 +010=
> 0)
>
> ----------------------------------------------------------------
> vnc+spice: password-secret option.
> bugfixes for cocoa, vnc, opengl.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

