Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1ED277803
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 19:49:55 +0200 (CEST)
Received: from localhost ([::1]:39334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLVNT-0002h5-0d
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 13:49:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kLVML-0002CH-Vc
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 13:48:45 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:39813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kLVMK-0001pf-1G
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 13:48:45 -0400
Received: by mail-ed1-x544.google.com with SMTP id e22so4252403edq.6
 for <qemu-devel@nongnu.org>; Thu, 24 Sep 2020 10:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=psza+Y3KxhE/irY2VaRtLZaKU7cQwHniVSfgWaSLivU=;
 b=bRBPTER2nyphBNOPGp1/Nx0JN0R5bsNdOnA3F9bzw7V9M2kZSRhF5quvUtDv7nfsQO
 wpA0DOYjgC7dkwughbOwBMx4iX5pVvArE+m16XtotMggL2TiL9PHBzbqEnnXTcjnTfCP
 rQGP0u3/1+JR0GC/fr7MneUG2MApcwcvJORBN077skTTU9hKMoFzwGDoK/nyfmuGOGvU
 xqfCeWJhgPlk007JVxnnNKZ79NecJ00+e6f/be1Op4XEtXRdrbkuSK34mq3Gat/pxZnK
 QJTcL4d6ZqgFfqmb30B1IpPvEVXRmgLpVCHqbbgJCeKt3fK+G1tW0DJxE+QV+mSvyPlc
 WOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=psza+Y3KxhE/irY2VaRtLZaKU7cQwHniVSfgWaSLivU=;
 b=hY2K3fj/8yKzAAgComifMdzjULM3VG6qQGUCEhvczphJ2RwpFGvDIQOu2/uvTNb+x3
 4FhHto1uAD1psOa3VgNCe8h4L1IMO2YbU1KFdXAPMpeHayTxo4MWZqAYT6e/PUoav0kY
 +nGZTCrsbnARwu2yIsL4BArLFzynbZ6TcB8A2Ugms804bAL7cUd9H8U4qtQpeJEX3WLW
 kiTxJaaDxlMjkFosvSUtAI7eK6z3fleclB258XIyjU/lKzJT4FyOlDBtIMPSF/Btv2dq
 0F0tccFyyKlkjgCmOmizUNPjElkeU8zsRomvzTZEMPGTvIW5K544mcn+ctQjxXpOYLXd
 S0Qw==
X-Gm-Message-State: AOAM532MzCJIFlfQuoGXAcrMXOCvgt6TSWrd2CRVUORqVcO1gcPoCTgM
 jOMGe6UWT+09nS8rm3ztrpZfmwxSAGMn7YUS0Ij0Hw==
X-Google-Smtp-Source: ABdhPJxF9HbBAtGdzknSn8M9X8qo7Rr3aX7d3UCHwuBNP79KHw1vzUdrqGePUUGisH33VMz0vsmAHMWffi9pKKrbJuw=
X-Received: by 2002:a05:6402:202a:: with SMTP id
 ay10mr1218137edb.36.1600969722591; 
 Thu, 24 Sep 2020 10:48:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200923091001.20814-1-kraxel@redhat.com>
In-Reply-To: <20200923091001.20814-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Sep 2020 18:48:31 +0100
Message-ID: <CAFEAcA8zN23ocCZkJG9mKT5y-qnYcGPiqCJv+kwDBnBU3g7M6A@mail.gmail.com>
Subject: Re: [PULL 0/9] Audio 20200923 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x544.google.com
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

On Wed, 23 Sep 2020 at 10:12, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 0fc0142828b5bc965790a1c5c6e241897d3387cb:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/input-20200921-pull-reque=
> st' into staging (2020-09-22 21:11:10 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/audio-20200923-pull-request
>
> for you to fetch changes up to 5e626fa7364bc2d7db5f6c8e59150dee1689b98a:
>
>   audio: build spiceaudio as module (2020-09-23 08:36:50 +0200)
>
> ----------------------------------------------------------------
> audio: various buffering fixes.
> audio: build spiceaudio as module.
>
> ----------------------------------------------------------------
>
> Gerd Hoffmann (2):
>   audio: remove qemu_spice_audio_init()
>   audio: build spiceaudio as module
>
> Volker R=C3=BCmelin (7):
>   audio: handle buf =3D=3D NULL in put_buffer_out()

UTF-8 damage in your workflow somewhere. Commits in the
actual pullreq seem OK, though.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

