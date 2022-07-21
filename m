Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA81057C6D2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 10:51:20 +0200 (CEST)
Received: from localhost ([::1]:36972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oERtt-00035H-SD
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 04:51:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oERrc-0008HK-F0
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:48:59 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:46032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oERra-0000vE-4G
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:48:56 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id 64so1637116ybt.12
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 01:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R4U8X3cilbmqAmDFs7m5Qxff4A1s1Z4ao1nkKeBqNqY=;
 b=PKRnXppMhkd4Ws97MqEN72AsUFdabV5NF/hsrnbonO69m184elo1rW+O779T652Gb6
 zZVdXNwNgAZwhxyIjpJftxRqWfHFzWaMG3CfY+/iVRvzSEbHwgiD7XjCguRyPkfRyoTz
 9bCwvCZRktERVcxujhn/zgk6YRc4ydFAyFKFMaxgsdo7gOvHy18Hs8hn7JMXemM7GL9v
 RDry1Uo9pYS98OBJxORnlcTojS3VxBrcW4OyzkvpRyMfB3oelWj42QKMvBNHbk+9ymLs
 pAowPLMiHFtWyaBHwSdA4XWORxb4CudzuaiUHMQuYbRnNzUTf2sQASSaYPP4WKRGAvY7
 DLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R4U8X3cilbmqAmDFs7m5Qxff4A1s1Z4ao1nkKeBqNqY=;
 b=p/yAOwQ1ReSNcc72GQq/XuQ4nbmH2BnNw8yl5524FZEt5BG+VYNI6Ooxs0EBZWzqzs
 uz3KC2Mv9uOimEv9n6q7IRJWvmFpxTXROE162laMXtB+W0kEOHePmTO18WYTHVOockZN
 blJmgt4/NymRKnfrZY+RZPM9lOoXb0V7P6v5g92Bmx6hcSwS8/3oAN3dQD/PWtHmXiMH
 StdVSuVey+Lwp3KT1Qv4svj2As+Yy0MBNcvI43mXGiwFE//OSUlgfRURyYOuub2PjCeB
 4Y/3zc0XR2F7pIVT9M3U9zXNoR+6MZMmYBoUz0h5kRBcRbu1VHcifevq3gJ5g9hT/mBy
 mq9A==
X-Gm-Message-State: AJIora/3Kv1aqpO+NwxEMjXRYZJ/Bs8HVeQwXuM6B//FFMQw3Zc0mwPF
 a1OWP+LjnPJ0tBfMuuH/cgFpZr89+lN/xaiotWjNtA==
X-Google-Smtp-Source: AGRyM1vq5ep3PfIpz4rlhbQqs2tot0MjPFAAwKpBAbSPVijYooFmkS9TLVqc3E7SOFC8HJLwSDeAmK5k+F0iXf80olk=
X-Received: by 2002:a25:d307:0:b0:670:80fd:85c4 with SMTP id
 e7-20020a25d307000000b0067080fd85c4mr10719795ybf.67.1658393332971; Thu, 21
 Jul 2022 01:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220719075930.315237-1-aik@ozlabs.ru>
 <99d48009-8403-c868-9f04-c14ca8311369@gmail.com>
 <c76cf69e-8f6f-333f-e3fb-72c5f1649705@ozlabs.ru>
In-Reply-To: <c76cf69e-8f6f-333f-e3fb-72c5f1649705@ozlabs.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jul 2022 09:48:13 +0100
Message-ID: <CAFEAcA8Kma2vGYwS_AwvqvDRiNoeLoS43x2GHtHkAV3QiUJvJQ@mail.gmail.com>
Subject: Re: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, 21 Jul 2022 at 09:19, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> On 21/07/2022 02:08, Daniel Henrique Barboza wrote:
> > Hey,
> >
> > On 7/19/22 04:59, Alexey Kardashevskiy wrote:
> >> Alexey Kardashevskiy (1):
> >>        pseries: Update SLOF firmware image
> >>
> >>   docs/system/ppc/pseries.rst |   2 +-
> >>   pc-bios/README              |   2 +-
> >>   pc-bios/slof.bin            | Bin 992384 -> 995176 bytes
> >>   roms/SLOF                   |   2 +-
> >>   4 files changed, 3 insertions(+), 3 deletions(-)
> >>
> >>
> >> *** Note: this is not for master, this is for pseries
> >> *** Note2: this has not sync'd to git.qemu.org but softfreeze is
> >> too soon so I am posting it anyway.
> >
> > I forgot to send a reply yesterday, sorry.
> >
> > Don't worry about rushing this SLOF pull. Given that this build doesn't
> > have bug fixes we can wait to pull it in 7.2. You'll have the time to
> > sync it up with git.qemu.org and so on.
>
>
> Well, the git.qemu.org is still not updated, and I have no control over
> this process anyway, who manages it?

Syncing of those git repos is supposed to be automatic, but
occasionally something falls over. Stefan, who looks after
the sync process ?

Alexey, which specific repo is not syncing ?

thanks
-- PMM

