Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E6325C008
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 13:19:32 +0200 (CEST)
Received: from localhost ([::1]:46206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDnH9-0000lF-GW
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 07:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kDn9p-0006Nn-8B
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 07:11:57 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kDn9n-0006Mc-ES
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 07:11:56 -0400
Received: by mail-ot1-x341.google.com with SMTP id c10so2277812otm.13
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 04:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=25i2bGBt6UrKwE1TXuh8XZu5mFMYpdkhRSNYLgGSyGo=;
 b=KE9jOPb9x7zyUS9Uen1vDeld0dzitaw62kSn+8kYZ35b5bo6TPQ3m/xeVKdNuLA1h1
 Vv3+kU0lOPgLi9WFbpD8TBQBtQcxRNMmhbDBvV6XvvpfXWM2Tfi+4JhNjX2S3UnoN3wv
 TIXKg22qyB1n9sJogEwfDVUObhCK9AKfCr01m6/N0sBADhy5p19Pn1ZXvsiCRGOcTsvS
 pd1eF0drCeO2kUtB9TaiHNpMvy9F6at6kzJQ/2Q1hb98DlWC0lzOBidZxBkZHcY3NlJM
 eobSnqacKj//GR6y37CZW8MAgSc9n4/YsB+ybuAZE3+tuPujNKWSEL20ZsfjBduPZsUM
 FRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=25i2bGBt6UrKwE1TXuh8XZu5mFMYpdkhRSNYLgGSyGo=;
 b=RmS7BqLf9IHCFg/FmimCiclmNz3IwJbzUKhSrZgH/OpQLLFV3IL+JLx14yxkpMKxMY
 ZrFJHmPqlEaye557zRlNjaeYbnhDu8a+QS1jrNwoNlUxuKmHDvtgc+RCJO0Y8gwVi9t0
 fBWjYjRNH/EuwD2A+5bUQfSK4BcVPEA9xB9hG+6/6L2T9lLHWBRVaMGoLoHynFeKWpCk
 QXGRC7x4qGiBo7g3EdXvzSpxQjCSjQB1hrd0f9631RklL/Fkx35G5h4mJyfZ0fu6IKrO
 f1QLTpY2AYlhDCL385eIhsLXu7ILk9VCbclNVolyfIeoI/C3MnAWDTsE+dNM1gNDHVoc
 pk+A==
X-Gm-Message-State: AOAM530EMoY8Z5I6ASyNRee2nD3T6moG4WKMwIt62amkJrf+k4Azcuhv
 9iekjrTpELblQyPJk5SURxYsHjrS+jALfwoyMsA=
X-Google-Smtp-Source: ABdhPJzd1JRCtFeoR5WXi/XrGxuHsO+dCkyQGx0JfP2xU9PAiiEHsQYPniP6z1J44wL5EkjsHGuEsZxX+D/aNxs3paU=
X-Received: by 2002:a05:6830:2302:: with SMTP id
 u2mr1124916ote.181.1599131513907; 
 Thu, 03 Sep 2020 04:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200902162206.101872-1-liq3ea@163.com>
 <b840aab8-542d-af43-43e5-0a07f442b5d5@redhat.com>
 <CAFEAcA9mvMaR5MJJ74Vv63TG6frWnMeSZA19Zxv8TUceudPUTQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9mvMaR5MJJ74Vv63TG6frWnMeSZA19Zxv8TUceudPUTQ@mail.gmail.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 3 Sep 2020 19:11:18 +0800
Message-ID: <CAKXe6SLYgkiTAYa81nppHUMEzoeGy3988OmrzZyw8-VY8ajE3w@mail.gmail.com>
Subject: Re: [RFC 0/3] try to solve the DMA to MMIO issue
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@163.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2020=E5=B9=B49=E6=9C=883=
=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:53=E5=86=99=E9=81=93=EF=BC=
=9A
>
> On Thu, 3 Sep 2020 at 04:55, Jason Wang <jasowang@redhat.com> wrote:
> > I think we still need to seek a way to address this issue completely.
> >
> > How about adding a flag in MemoryRegionOps and detect the reentrancy
> > through that flag?
>
> This won't catch everything. Consider this situation:
>   Device A makes DMA access to device B
>   Device B's write-handling causes it to raise an
>    outbound qemu_irq signal
>   The qemu_irq signal is connected to device A

Here mean device A is an interrupt controller?
This is special case I think.

>   Now we have reentered into device A's code
>
> That is to say, the problem is general to "device A does
> something that affects device B" links of all kinds, which

As the P2P is a normal behavior, we can't just prevent this.

Thanks,
Li Qiang
> can form loops. Self-DMA is just an easy way to find one
> category of these with the fuzzer.
>
> thanks
> -- PMM

