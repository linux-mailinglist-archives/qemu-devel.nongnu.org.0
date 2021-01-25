Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D323E3020CF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 04:22:52 +0100 (CET)
Received: from localhost ([::1]:44862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3sSp-0002vR-Du
	for lists+qemu-devel@lfdr.de; Sun, 24 Jan 2021 22:22:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3sRi-0002Qu-O1; Sun, 24 Jan 2021 22:21:42 -0500
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:42763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l3sRe-00087z-LU; Sun, 24 Jan 2021 22:21:41 -0500
Received: by mail-yb1-xb34.google.com with SMTP id b11so11954972ybj.9;
 Sun, 24 Jan 2021 19:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/tmLxqIYFWBreD5TjAq9ZgOtYITHngOiHF8turJwZ+k=;
 b=KQbyt4Ne1FWZolX1jFvRrywq5dLxtfqXYJhARcynQuoQHOE+DS39sREdu8Jn2xSEQL
 gFybTDFLrvPGPOavS8iugOx6g1D28MjLGM4/n4I7qhqindM+tqi3sccoVghwCQ+IoWwB
 Jf10ERMOLaQ3NvXcEjBkadtbvyBZVzLnbrZ39o7ven3BQ3xB2iK/c5GJoFpGdNPRUFaB
 4poUEk6Om2sCfvgFRBYj7LQBX4l556XmFrDrnaETGYQecf53Lyd4b/nfJr1Ndjwvdfgm
 1g5H9c+Zhb/n49NupkDNCUZ2M4jw2zM56KRqmhbeVQUjbhcg5l0PrSr5YStSBb0q4Zxq
 Ii3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/tmLxqIYFWBreD5TjAq9ZgOtYITHngOiHF8turJwZ+k=;
 b=a4RwwvMV8PbHA2bC0X6yGcULkGFFXr7EqDcmtU2T73QxKDKZBr5FejZT5SNuRQXVCe
 OPiLX3cXpXnDRdreYKXI+pTbCmd7bbQGau/Od7h5S78/R2/lbWEDX/wOuVTFdSMNqzls
 iwfsJAWI+bcH5EELHXAeg+fLWqH22gk0F9CzjvEHH9gbKgSuOjLXaZ6uE9ivYL5w3iit
 jwJk8Hw2vKn8QtIPRXvzSkOetTbU95Md/lHqLo3rgucq/DcnJe89gFcCHzaN2pIcjJm+
 65sNxil7EjDRWnkvBc538yl8wS+MA2e013jtrax/6zDlcKt6maARiMymINGbGSVFmtLz
 Lztg==
X-Gm-Message-State: AOAM530ZFR4tgNa338AIhusjitvJv7nHqYjhXs1bgm1R9cZstZZzzWik
 llrFIIcQHMDMzQahqZHORESuoxy79vGGth7ASpc=
X-Google-Smtp-Source: ABdhPJwyZGEphJL+95NEx75D3w5BbJaijHn2FDpkhXuA/ZrjsGmHVT+pJlw6ntk5PQF0wPm9OCNlcZxRVFMF8cawjjs=
X-Received: by 2002:a25:e013:: with SMTP id x19mr21784457ybg.122.1611544896551; 
 Sun, 24 Jan 2021 19:21:36 -0800 (PST)
MIME-Version: 1.0
References: <20210124202817.2624557-1-f4bug@amsat.org>
In-Reply-To: <20210124202817.2624557-1-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 25 Jan 2021 11:21:25 +0800
Message-ID: <CAEUhbmXzGJGhCC62N+QwbDvxPmFoTkbwM0bKM15ZENwPwMAzwg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] hw/sd: Support block write in SPI mode
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
Cc: Pragnesh Patel <pragnesh.patel@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 25, 2021 at 4:28 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> These are Bin's SD patches from his v2, rebased on sd-next.

Looks good to me. Thanks!

>
> v2:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg775712.html
>
> Based-on: <20210124201106.2602238-1-f4bug@amsat.org>
>
> Bin Meng (6):
>   hw/sd: ssi-sd: Support multiple block read
>   hw/sd: sd: Remove duplicated codes in single/multiple block read/write
>   hw/sd: sd: Allow single/multiple block write for SPI mode
>   hw/sd: Introduce receive_ready() callback
>   hw/sd: ssi-sd: Support single block write
>   hw/sd: ssi-sd: Support multiple block write
>
>  include/hw/sd/sd.h |   2 +
>  hw/sd/core.c       |  13 +++++
>  hw/sd/sd.c         |  56 +++-------------------
>  hw/sd/ssi-sd.c     | 117 ++++++++++++++++++++++++++++++++++++++++-----
>  4 files changed, 125 insertions(+), 63 deletions(-)
>

Regards,
Bin

