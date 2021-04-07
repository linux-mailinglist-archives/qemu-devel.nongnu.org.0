Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A1D356BDE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 14:15:16 +0200 (CEST)
Received: from localhost ([::1]:56756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU75W-0006Ua-Lr
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 08:15:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lU74Q-0005vd-Uw; Wed, 07 Apr 2021 08:14:08 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:40875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lU74M-0001p9-BB; Wed, 07 Apr 2021 08:14:06 -0400
Received: by mail-yb1-xb35.google.com with SMTP id 82so9283599yby.7;
 Wed, 07 Apr 2021 05:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DgOzSJc2Deh7khhf5ekqHRxj62tX7qQhU5j+XRynfPM=;
 b=dMoPBs2oOhc+MSUnBOOfgUmo500QNEgt/XkShkpM2YjOA2RWhDHRzqtz0KXaQVky6S
 k3A5KgvG9fEcWQM5Da36z1cWO+/5IcJiorJBgg1M1xdzF0YmTprHbo4mzFP9YLN1h306
 So5HiabZ0u2cdMrFJjkpIWVTTvYKGaujC0GgKeqpv+/hfWdkpnymj3J6FNWs20yTaQ2W
 n1gyxhuZAg4MdcxWONxjYh51EJxvhKda2syYcGsWoWZa1fZIdkEoPRAZmAZFcAtNXDjW
 fVTVBsC1EdV5JT0bnU98COSg2+apWnlg6Jzgs9Viz2EThu6RMW3WwIKKbL8xdJFVrN4Z
 QpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DgOzSJc2Deh7khhf5ekqHRxj62tX7qQhU5j+XRynfPM=;
 b=M0SLSzg8sCwE+kXmEdugIk0q9iXf0SerUj+J5NJmuVHCwmrJvWsspQwBYWVqI71onu
 RExQ9/yJE2cCWaKGXMyappcT9GxtTqWrPSyAGW6KcaVhx4oDf/GkoK9+W6zqq/rZPOZu
 a1daFt9cM/DQNuocKvh8ATTwmUwlv7hxDCp/s3KrvqD53CT+Xx7eqHKjnsPkMBbhUmaQ
 nTcU9MbI/lRG76/RMrcH/tNcU5sJE44+lWvRy/Rdm4We7fx0o8YdZKHTWgVBg20Obfi3
 c+UDU+09uUf42/B20+NepnVQZdXvSAai87bYoEfnBIhNOWAKgLvVi1dGazeyo01NgOY5
 guRA==
X-Gm-Message-State: AOAM5337LknH69jZR9GcyeVg/fHBUAa217zBWUbnuqccwYtJ5PdUj5kt
 Mn/oDbWGSA+X9ooi5FF8sWk7Ibyz0V1ImzSKHN0=
X-Google-Smtp-Source: ABdhPJyxIiYNzn5fA+Xs1LElRb2p1E49UT6UYWBZ59aR3sLYig7HOkFKt4IIgIP/kKTu1z7n87fc+/1/HKUYvaPRLIQ=
X-Received: by 2002:a25:4154:: with SMTP id o81mr4200085yba.239.1617797640298; 
 Wed, 07 Apr 2021 05:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210326062140.367861-1-bmeng.cn@gmail.com>
 <CAEUhbmW-RaG-yy_YmL_cFQ-vUS=9_Mw3CmvBCTrkTAiKi8Y2TA@mail.gmail.com>
 <ce9214bb-d68b-defe-8af1-84373727b396@weilnetz.de>
 <cc5220ec-f694-3302-92c4-0107fd5af500@vivier.eu>
In-Reply-To: <cc5220ec-f694-3302-92c4-0107fd5af500@vivier.eu>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 7 Apr 2021 20:13:49 +0800
Message-ID: <CAEUhbmX9+=6+J1a0vyzTCWXfrQqjf205W0S=+UZCaxVz+URXRA@mail.gmail.com>
Subject: Re: [PATCH] nsis: Install *.elf images
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Stefan,

On Wed, Apr 7, 2021 at 8:06 PM Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 06/04/2021 =C3=A0 11:28, Stefan Weil a =C3=A9crit :
> > Am 06.04.21 um 11:04 schrieb Bin Meng:
> >
> >> On Fri, Mar 26, 2021 at 2:22 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>> As of today, the QEMU Windows installer does not include the
> >>> following two RISC-V BIOS images:
> >>>
> >>> - opensbi-riscv64-generic-fw_dynamic.elf
> >>> - opensbi-riscv32-generic-fw_dynamic.elf
> >>>
> >>> Update the installer script to include them.
> >>>
> >>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >>>
> >>> ---
> >>> Based on:
> >>> https://repo.or.cz/qemu/ar7.git/commit/657a6a90b69da971afdc71501c3027=
5ba307ff6c
> >>>
> >>> The above commit does not land on QEMU master. I am not sure what
> >>> the process is, sending it here for comments.
> >>>
> >>>   qemu.nsi | 2 ++
> >>>   1 file changed, 2 insertions(+)
> >> Ping?
> >
> >
> > Reviewed-by: Stefan Weil <sw@weilnetz.de>
> >
> > This is a small uncritical fix which can be merged via QEMU trivial.
>
> If it is merged via QEMU trivial, it will be after the 6.0 release.
> If it's needed for 6.0 it's better to go via the maintainer tree (W32,W64=
) [1]

I think this should go in 6.0.

But as I mentioned that the patch is based on
https://repo.or.cz/qemu/ar7.git/commit/657a6a90b69da971afdc71501c30275ba307=
ff6c

which is not in the QEMU mainline yet.

Is QEMU Windows installer fork (https://repo.or.cz/qemu/ar7.git/) not
supposed to merge back to QEMU mainline?

Regards,
Bin

