Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16803B168F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:14:28 +0200 (CEST)
Received: from localhost ([::1]:36682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvyxn-00013k-SI
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lvywG-0006jf-9H; Wed, 23 Jun 2021 05:12:52 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:45913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lvywE-0000RZ-LP; Wed, 23 Jun 2021 05:12:51 -0400
Received: by mail-qk1-x72d.google.com with SMTP id y29so1819027qky.12;
 Wed, 23 Jun 2021 02:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BugBu3W9uTYj3c6I7aNiw93qbp3NRHW6wE80smk0xQ0=;
 b=W5mAXigHLpoLrEDphncZeCsxdtvu6q/Zvxsj2sPGCKhFdsnolA6hBdj5iuE6H8QcV8
 DW6RT8f388SE668WrtRLUUIIJrd8qrfaQdII51n7gLQcp4UDwKYWk7Sfpcw1kGQ4r/E2
 6h6npoiUNGSj1F0cBHqnqRzwhVEV4og2TC4i0LxBmQBT2kLTx4V3ii4rEFbidJ0K9jmC
 ddtdQhjjMolrNt/SDoPF/HAA957jcSHsWrTnKTpXB77GhMwxDY/QiPHfImbbnUI88fKi
 uuqyI4PmAT6/kILNm8fTs6p22SyDfVeDdgR3ccn7jLCBZhb6Bl5PzX0uNDyr6xAnUgRK
 TKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BugBu3W9uTYj3c6I7aNiw93qbp3NRHW6wE80smk0xQ0=;
 b=PHAXW3cNThjfhODPPBd4EJyvqLI9+N3egmVfTWgL56/FNRQELCeOF2zd1ME2kw9pwT
 k9UmtrkY30Rbumq+hDrHYgnmkjTaPdx+mxqQrNh318giyQFs3foFmgdmvxrpL7sq0x4B
 udCHnpU4uR/YAWAs26VAaQRIwuitPXmS5AXEu8ucFO3HR4lLz5Mr3QfoZsdLrOSOAyzO
 JBsoF8MMTKYsDEjpazJ5pLdHCLUYIkycBCUTLjfqlL1fbRpoXXIoVBb/qXvc4ymNWa0K
 WVSW/NlDs/DGRWz4KYV0HuGOXtMqKv4Wm/KIxH6YkNaIN5/QVoPZY6IYnht5LSqrmCrJ
 Wj4w==
X-Gm-Message-State: AOAM531Bw2MhWd7398MLLFe17DIeFz0tkfOs0P2U3iRWFX0XIu1ME+sV
 dR34jkbTcMxWpf2WRU4rD6X867B/bLeVRF7cJPc=
X-Google-Smtp-Source: ABdhPJzF03qHIYCc4rLfOr5vwK5tGbdcJslAa6GjgC9RpwS1clSd+zDM1TBkgI3/DCEXVdv7dQhnnedyUBiVWzDiLCU=
X-Received: by 2002:a25:b222:: with SMTP id i34mr967159ybj.152.1624439569335; 
 Wed, 23 Jun 2021 02:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210623083004.245894-1-clg@kaod.org>
 <CAEUhbmXMKphSdgE0xMJT2Tzu5okf00SJcskPfK742PwZv-X1RQ@mail.gmail.com>
 <1d9dcb0c-e2f3-455f-fb35-1ea6b7db1d50@kaod.org>
In-Reply-To: <1d9dcb0c-e2f3-455f-fb35-1ea6b7db1d50@kaod.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 23 Jun 2021 17:12:37 +0800
Message-ID: <CAEUhbmXNRZLQxsy_AgSg2Lr2TMXw+W2tMyV80q0yBwdTB2ArHw@mail.gmail.com>
Subject: Re: [PATCH] sd: mmc: Fix SET_BLOCK_COUNT command argument
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72d.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 4:55 PM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 6/23/21 10:39 AM, Bin Meng wrote:
> > On Wed, Jun 23, 2021 at 4:30 PM C=C3=A9dric Le Goater <clg@kaod.org> wr=
ote:
> >>
> >> The number of blocks is defined in the lower bits [15:0]
> >
> > I checked the physical spec v8.00 and it says bits [31:0] for CMD23 arg=
ument.
>
> May be that's an eMMC thing. That's what I read from the specs :
>
>  [31] Reliable Write Request
>  [30:16] set to 0
>  [15:0] number of blocks

I don't think we ever claimed eMMC support in QEMU. Did we?

Regards,
Bin

