Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2960C2F7E33
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:31:24 +0100 (CET)
Received: from localhost ([::1]:33670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Q8I-0003Jp-VK
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:31:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0PZu-0003tR-Kq
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:55:52 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:37780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0PZo-0000hQ-Sr
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:55:50 -0500
Received: by mail-ej1-x634.google.com with SMTP id ga15so13426472ejb.4
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y9zopX6k8a4z5Yd+uQHPT4S7FSw5CWBKfpVtF9rvWSE=;
 b=gGmeSTkdK2esfTs/U1PYcXgp0YI6vn64o5zdS23eDQqqdCeT52HB9QkYU2Ik2WlDav
 IcBNztpIFMSk/1A+MPy9nJ8G4MVZdpUMutqFBu9TWZAhS/FW6NHzd34Wk8E3Xrzr86O+
 icNnrcd1i2ItA+Dsjzo1I1QRlybIkZlVbD7NMtDm9uIgAKQPi63o5lqJeHEfyIZqnK1H
 j9d8UYVdpttyWlTj1Yu7bdS7FDonJnlhvlmfiK0EJvUGrJXp5RZT36LGP+ty1zigH1z1
 y8jFVpKaPk4sVF6JZAp/gFSlSIoO6vAIhYi4GH7wUfnErOI233hKQDvP2eGaLJOXcZI8
 1wFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y9zopX6k8a4z5Yd+uQHPT4S7FSw5CWBKfpVtF9rvWSE=;
 b=qXMogLobqQp/l6JjHKU5UvtOZwbvby8QvtBzAB1tG0qFWQ/T+KazNbYv6NXBV0QH7e
 nWtidOBi4+7ll3k7qFHtBJemHBNMoSbw+jIta2sU6TDBZnZVIBvcTWriz/vYL3qpx7O1
 ZLzouO3VP2m3iG3Ii/MmV+jxmcgfGPyT3WNLsEoKv+u3DfmfSUFQJj3KSD51N29YKAXo
 uAICUOewBAVX2vz2lJZtPOTeOc4aZ/pucj9vdx+TJE8nBF4AKPPydgfaFYoGoEccywbv
 WtuFWBTXkCb3XgyUyuYNUvwmmZkHcztQfi9inVTXH2+Lf/wArUIHVgP4dpza11gDuwL2
 dQkQ==
X-Gm-Message-State: AOAM5325dhajxJ+XslJZOBCi4ttxrCr5gNRYxzWDu2eKZixoYVmin6eu
 Qnrh0nMQF6oTOlmvZUG/BTRyyW77Slb0nLss8hGb6A==
X-Google-Smtp-Source: ABdhPJyWTySFjGpGobglOi3HBSdnMUXIS5fmGd0ae8KSAE+R0WYEJjqQo/Xs6MuWNWolz+LjTbQdUXzyhdcZ2sgFRZw=
X-Received: by 2002:a17:906:494c:: with SMTP id
 f12mr5623435ejt.56.1610718942957; 
 Fri, 15 Jan 2021 05:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20201104092900.21214-1-green.wan@sifive.com>
 <CAFEAcA_EykbnmTQuz4RT3qGMt-Atf=EAdaHd-QqBvJCPvwemqA@mail.gmail.com>
 <CAEUhbmULDEgfs0zkt6k1DWo+AD4T701xDp5TCyjQHFypmr037g@mail.gmail.com>
In-Reply-To: <CAEUhbmULDEgfs0zkt6k1DWo+AD4T701xDp5TCyjQHFypmr037g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2021 13:55:31 +0000
Message-ID: <CAFEAcA9QrTA6bEiK608HfB9vfN66SGBPJw6pEDDk2YH3v4M8SQ@mail.gmail.com>
Subject: Re: [PATCH] hw/misc/sifive_u_otp: handling the fails of blk_pread and
 blk_pwrite
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Alistair Francis <alistair23@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Green Wan <green.wan@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 13:33, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Fri, Jan 15, 2021 at 7:50 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > Ping! This patch was trying to fix a Coverity issue (CID 1435959,
> > 1435960, 1435961) -- is anybody planning to review it?
> >
> > (I'm not entirely sure 'guest error' is the right warning category,
> > but I don't know the specifics of this device.)
> >
>
> I think we should just use 'printf' instead of log a "guest error"
> because the guest does nothing wrong.

printf is definitely the wrong thing... you need to either report
the error back to the guest if the interface the guest is using
has a facility for reporting read/write failures, or log or report
it to the user using one of our APIs for that.

thanks
-- PMM

