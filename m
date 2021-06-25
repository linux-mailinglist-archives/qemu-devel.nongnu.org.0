Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148553B3D63
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 09:30:30 +0200 (CEST)
Received: from localhost ([::1]:33274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwgIH-0003CD-3u
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 03:30:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwgFj-000161-9H; Fri, 25 Jun 2021 03:27:51 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:44767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwgFh-0002Oa-JA; Fri, 25 Jun 2021 03:27:50 -0400
Received: by mail-yb1-xb34.google.com with SMTP id p133so3230802yba.11;
 Fri, 25 Jun 2021 00:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=E0xoGwezfGgWLPAImTv1P+lANGvvrm8bET+6s6UP04c=;
 b=iLU6u8TxyGvtxnknv2JrS0Zh12yh67HBY0ykcV68lCIyWfdRShuRfTXGhEfuDh6Y8s
 RrbGUDlPCKiORaRWlFuOtybP6sNeA4UdytwkjAeDNgby5HfWRCtY7DzxfT6Gjl3mnjdM
 t5w5ezh4rFl3q/GD3q2dD/10DPRTtUJNY6bID9kEcfUHWm/e7BX2PzAqiMX5pEgMfY2P
 FUUviEWnlSx5pCBU6NFDXPy1rvZYBoVkppfaCwzCUfUDY43Iij+lmDlisM7t94Dm7r3P
 3244EUpABPF7UIz4F22t0y4n05ZrWNGpebnuk7woj+HP7DWmSGuI+rLp9dkti7FbzV5H
 1PIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E0xoGwezfGgWLPAImTv1P+lANGvvrm8bET+6s6UP04c=;
 b=Bk+uvsrRXbYroiCPhkV1uhDGCJlqkD2TW758v0eMbS0GKKjS8RbdNS1iZcfiUhEwnv
 vkM43e9HbDyrNMvFLzXqzAFX2fkMLfspZrnkr40zL4D6Brj61dlbnfMLxKnqmeCXy6Vp
 MwYTmyvxwTGoZzLUjYYj96qwjsrK1LWb5BZZJYxgs0ZrvoSg7JLvxjsgYC8teLn7zuLa
 Y08ZBbrkwMuW7+5LvqRmgmHGnpBBOYF2FsY/I4Mvy7m1Z5jq0oMbpzVsiJkUM5ZUS/g3
 J/eaTdisi7sEFaYovoejAEL4LXGoPF/Ds+LIS8IrT8M5g4C+6OOdTsUGLboXJgAxC2zF
 8qLg==
X-Gm-Message-State: AOAM532Bjuz2+3+wudVZGpYyujkaQuKT9/SVjpCQZOPMlTklwsuDvYMk
 xLHiujEb9rHzzCPOGP/F+5H2Ot05Onko5Bzk0yU=
X-Google-Smtp-Source: ABdhPJydVrsfi+HeRvL/9DxqyEHtCm7jWx4ET9lXekSXG5EbNS1Gwcn73nld784C/4rtm83EuhEv4q4M1wy43lokDCY=
X-Received: by 2002:a25:b222:: with SMTP id i34mr10182398ybj.152.1624606067388; 
 Fri, 25 Jun 2021 00:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210624142209.1193073-1-f4bug@amsat.org>
 <20210624142209.1193073-4-f4bug@amsat.org>
In-Reply-To: <20210624142209.1193073-4-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 25 Jun 2021 15:27:36 +0800
Message-ID: <CAEUhbmXh2CGV6YQBsjx3WAU=g+g_Vs36QXpSR8q6KymP1DmgVA@mail.gmail.com>
Subject: Re: [RFC PATCH 03/10] hw/sd: Move proto_name to SDProto structure
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
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
Cc: Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 24, 2021 at 10:24 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Introduce a new structure to hold the bus protocol specific
> fields: SDProto. The first field is the protocol name.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 28 ++++++++++++++++++++--------
>  1 file changed, 20 insertions(+), 8 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

