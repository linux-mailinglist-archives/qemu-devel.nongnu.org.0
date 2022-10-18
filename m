Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 964DD60204B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 03:19:00 +0200 (CEST)
Received: from localhost ([::1]:40460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okbFz-0008Uq-4G
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 21:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okbBX-0006nr-GV
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 21:14:24 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:46766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1okbBT-0004KC-I5
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 21:14:21 -0400
Received: by mail-qk1-x732.google.com with SMTP id z30so7798139qkz.13
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 18:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qeXFMlpcasvNeWENIKB+U/B5ujrHLTnFjSIC0O7zCRc=;
 b=BYdFYXkWZkJ2QDnILSz2xw3iBBCCVcpBFCzEErfROqKfe1ADpPfsqT1WG8+KNxBFkT
 4UuB98uoYsrushtaJwiJCAoMUTY+P4IxTQsILc5ctE2FAMBPwsCa9Bnck4BrNWSCjIin
 sSSrU/NpR+Khg9f/cpH67Cm3sz1qsRBH78bMMQaNSdWzYmfD0yIp2byDVyLVZ3Fj+Q7q
 LpzooKu/nzYdSmZ+z3tf/i4V9DV0wA7ajEbslIFCLtKncQ9ZHB1fEJW2n/HcqScruQvS
 FaOcThnZJi2C0c9vefPb3kYnyKd/9FF5OsB5nP8yAE5V+qprgcgNu5XYdf2G7E8EOG+Y
 emoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qeXFMlpcasvNeWENIKB+U/B5ujrHLTnFjSIC0O7zCRc=;
 b=bHPioyR+Gu+AMTEQZWQj/3vG9O1uoBWYXcIsTW9A6vnL2iSuKiSCFLjbY5XrOOgzN8
 GIAiWnmL9epc6E39uKOKlTrkyOX7/CSDZd1KqzU9abdIYMn7Lg/Hwe6cmqyeIBUwECLY
 6pPmBIcJwwQB+Wt19B8kfZtnJo7k5Pj1JqLxku3120v8Ka6DYC8nKamwYIcUHea7OgAh
 3bJp1A6ZZaappFQGF/pNQUntMKV8RVr0Jh3TXQsDkW3sB4wcBIDFdJpdR1FRr0TXUqQW
 TPyVtfhoK6Jh4rtsgH+8eOSATF6RGSBPPn2Vk7N+ZQKlIigYuHtN3DNV5/ZdkNCPV2zT
 PADg==
X-Gm-Message-State: ACrzQf21ABkFetWBrwsd9I+c3rKP5qa4KodzyYjAmt5/MuTXNj2N2DU7
 JnGrXk7XKF6fFnIa23LnjhdY0xuYD2oviKSvqPc=
X-Google-Smtp-Source: AMsMyM6e7/v3XpijYPTRCVMvqbNtORVtH9Ao8srdTxllQF2bwgR7BPnCYXPZVVsj46tlWYOUZ5Md4N+8Gn/aKzCmxlc=
X-Received: by 2002:a05:620a:29cf:b0:6d3:2762:57e5 with SMTP id
 s15-20020a05620a29cf00b006d3276257e5mr273300qkp.389.1666055656167; Mon, 17
 Oct 2022 18:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221017182005.43015-1-philmd@linaro.org>
In-Reply-To: <20221017182005.43015-1-philmd@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 18 Oct 2022 09:14:05 +0800
Message-ID: <CAEUhbmV+EYfGk2EWKZqG9yZbd=W9+_=QRF5Y85zk+wbi2OEoMw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Replace my amsat.org email address
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <huth@tuxfamily.org>, Akihiko Odaki <akihiko.odaki@gmail.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Oct 18, 2022 at 4:15 AM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> The amsat.org domain is having issues with DMARC / SPF / DKIM:
> https://lore.kernel.org/qemu-devel/CAMVc7JUy5NeEN0q=3D4zfZvn_rppgqn9wicV1=
z=3DTsLuHKS3RY3Sw@mail.gmail.com/

Yeah, I noticed this before, and gmail marks the email as spam, and
patchwork simply drops the patch email silently ...

>
> Consolidate all of my MAINTAINERS entries on my work address.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  .mailmap    |  4 +++-
>  MAINTAINERS | 62 ++++++++++++++++++++++++++---------------------------
>  2 files changed, 34 insertions(+), 32 deletions(-)
>

Regards,
Bin

