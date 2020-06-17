Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BB31FD45E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 20:23:49 +0200 (CEST)
Received: from localhost ([::1]:36912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlcix-00050t-LX
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 14:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1jlchh-0004Ef-Mb
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 14:22:29 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:36524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1jlchg-0005GL-4k
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 14:22:29 -0400
Received: by mail-lj1-x242.google.com with SMTP id i3so4104608ljg.3
 for <qemu-devel@nongnu.org>; Wed, 17 Jun 2020 11:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aPAPDJJCEEH/Z3JyFhmypFcYi07JTj5aaA6jdU/0yRM=;
 b=rJtQ8nuLgjLy3oUt20nESKnc/FI/ginY4cHlddhb/iSAW4LO5SeWYxmgDugMkc/ilO
 SoRBlg/gIfIhe1TWRgn+CbRIPzmFtgRGdu17mt8DS8h1dNvB1bGoH2IMfcI5xTtPszyX
 OzNx2ewZpZ6lCKcB7gtP8B5VWNXO5Ogqg8IMCsd5wesFGmQxxrGfSvlgIqbwwnLqtP+o
 q/oCUmsuI0nnUemZNsOVyHbNVJwXei9Mjn7ZqkQtR9PsuANWwAK0lSqVjQgN5/kIwqZS
 T/n0P8syQpxh56jF3LPHDJMuyLD0VwX3SQGgKU3fXWn4xnTZw6sQLqgaXxpqbJyScYJR
 WRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aPAPDJJCEEH/Z3JyFhmypFcYi07JTj5aaA6jdU/0yRM=;
 b=sL9AkLJ3FidEaA6wpEuqeATZ0brX0zce8WB+bEirj0LQp8TvK3RaZTeQB/h9yoAiBd
 EDR3e/baIeRqxW1+YU3dVt743q8bQ8Um9ivT4XGVtWLojit95bjg/FpAeu3PoGVkUCsJ
 j0RX19MTIXYYvgs7aVRNiBORW0vm1H5PlQB9ENht+fLnu9wKp9pHaL1rGrSEiFxydiIy
 VGwu7zVYfIJJhUQm95nA8y2o5RCh6KUXVM4jWxmMmdUfg3PxOBcPo3t2HurlKEsV+e2c
 HegvExBy0rFqWdoBHWYFnuqwItqCB+3xDxieNZtNQQ7BHJEAqsl0xvXQfq0+T1cctPic
 J+mg==
X-Gm-Message-State: AOAM530/3vEvDPS1mP/35fjxos16w6+pwD2AfsxMBSUrL0NhnGAUeus9
 6UtDyobcdqbp4HoRECo+ZN3w/OaAHr+CVs++Scg=
X-Google-Smtp-Source: ABdhPJxCFIMnIutTgewIuZFlKGRdRa4IgX+ot83fuHmS84IxPf4Q1HNq1boZSJDb7Q3xf/YYaGKKB/NTxDbyajJ2OHw=
X-Received: by 2002:a2e:9ad6:: with SMTP id p22mr278251ljj.3.1592418146323;
 Wed, 17 Jun 2020 11:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200616231204.8850-1-ahmedkhaledkaraman@gmail.com>
 <20200616231204.8850-4-ahmedkhaledkaraman@gmail.com>
 <871rmdyjbh.fsf@linaro.org>
 <CALTWKrVovkoQvNFxYac2eOV7Cf+K_RA+1-Gn=3AnL8dJLemTyQ@mail.gmail.com>
 <877dw5wq7r.fsf@linaro.org>
In-Reply-To: <877dw5wq7r.fsf@linaro.org>
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
Date: Wed, 17 Jun 2020 20:21:50 +0200
Message-ID: <CALTWKrXmYVtxeAjMjD0UYKzYeuBUXxNeMYVVNLfbL-iKknAN4Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] scripts/performance: Add perf_top_25.py script
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::242;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-lj1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>, ehabkost@redhat.com,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, crosa@redhat.com,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 17, 2020 at 7:35 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> Right - which I do as a developer. It would be rude to sudo things if
> you don't need to because then you end up running your potentially
> un-trusted application with root privileges.
>
> Could we either probe for the requirement or require an explicit sudo
> flag which we can prompt for if it fails?
>
To make sure I got it right. You mean I should specify in the script
comment on the top that the user should modify the
kernel.perf_event_paranoid setting in order to run the script, otherwise,
they should add a --sudo flag when running the Python script to invoke
perf as sudo?

> >
> >> Also redirecting just stderr? why?
> >
> > Perf, as well as Valgrind, print their output on stderr not stdout.
>
> Right so I think a bit of splitting apart and use of subprocess can make
> this cleaner and not involve quite so much being done with shell
> redirection in one invocation.
>

Noted!

