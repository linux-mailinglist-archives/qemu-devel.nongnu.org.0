Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8826226FE
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 10:30:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oshPK-0006SC-3N; Wed, 09 Nov 2022 04:30:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oshPI-0006Rl-Fc
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 04:30:04 -0500
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oshPG-0004b5-DD
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 04:30:04 -0500
Received: by mail-qt1-x830.google.com with SMTP id z6so10057076qtv.5
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 01:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o0twLPKs0CS5SqfzL5F2kdOM9ALYZcxpzql6Ld1nj9U=;
 b=YuugSEnWslc5wg6Wjuh2OCDpi1r8LrkewkXObE91YT1+NXDwhf6gFC9FPLQIWtFDNE
 JnpCTktHiAh/dXhtE0BkxHr+tzjFkI2FUiMu01NpWzsbbF84H3EyIx0I3Zvk1BFl5sCj
 yDhwYizlsCFRfPFrY0F/+AxWH64QfBoJ3Diiu8MUqcuJ/FDSEUvEBKs0dcxw88c8Plyz
 V+qT4cMTivgvBmF0KSD9aG1QTo79DuvCkVBfNnF36K3iklk4D40yJcjjuCXy8PjwOaoU
 oPs0np64/mn5NoPfsXMHW3mq/m+1M5YSbPz5OVle+tWinvwFY6smadIkm24wkF5jTcrZ
 tPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o0twLPKs0CS5SqfzL5F2kdOM9ALYZcxpzql6Ld1nj9U=;
 b=MJSrGJ5u+Rv48DvVrXrLItwapzmWqtBORL+Q2dZUtu7zA/pLp/YQoInKwJYU3yDkN3
 Nwh17peR1/WeHrdLqlYxRBbmttXzoj5wS6rCN0sjBUuGmbYjN4naUQjCcTe3d5xKZ/l5
 ZrfbtUdlU+FPvPrSsdmbdEzAeKeBHWty4fyC59ilaBG/HG6pwHADuhvWgg9zu9QMbXhY
 +AxJ6Ahpk6XzEqMeG1cVQoo2tOUByNiaygofwPsRtrP9tnQ4KFgH9eGBJk6x+1fxR8AI
 bNBlzqSstOLkDbrDUnY7MjehtJnA57i/PLS/IDF5D734/xa+f+dJ9iP6dZdLIpthZOzj
 NrFg==
X-Gm-Message-State: ANoB5pn7G+GxoE8oQ8aLmfmk8td+u9sbRkvjKmUfkBBmYq4E7p4wHfzJ
 piusMutKHFw8sbpPQ+cRHjJPfzzm7Hc+WRgyhCo=
X-Google-Smtp-Source: AA0mqf71NFgxa+wbqgYZm7QDoAI8r02DcHVy8bC1IgKqNZg7VeezAIrHFeQXt24g85ZlKsSh64YGVMz7ipPlI9ixcFI=
X-Received: by 2002:a05:622a:4cf:b0:3a5:a2b7:3765 with SMTP id
 q15-20020a05622a04cf00b003a5a2b73765mr6844614qtx.334.1667986201185; Wed, 09
 Nov 2022 01:30:01 -0800 (PST)
MIME-Version: 1.0
References: <20221107103510.34588-1-mcascell@redhat.com>
 <CAA8xKjXrmS0fkr28AKvNNpyAtM0y0B+5FichpsrhD+mUgnuyKg@mail.gmail.com>
In-Reply-To: <CAA8xKjXrmS0fkr28AKvNNpyAtM0y0B+5FichpsrhD+mUgnuyKg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 9 Nov 2022 17:29:50 +0800
Message-ID: <CAEUhbmWjuKX06P1FAAujAh4uMeqaXTFi8SE-zujVYsKnpkmzAA@mail.gmail.com>
Subject: Re: [PATCH] hw/sd/sdhci: reset data count in
 sdhci_buff_access_is_sequential()
To: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, bin.meng@windriver.com, 
 XRivenDell@outlook.com, coc.cyqh@gmail.com, ningqiang1@huawei.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x830.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

On Mon, Nov 7, 2022 at 7:08 PM Mauro Matteo Cascella
<mcascell@redhat.com> wrote:
>
> On Mon, Nov 7, 2022 at 11:35 AM Mauro Matteo Cascella
> <mcascell@redhat.com> wrote:
> >
> > Make sure to reset data_count if it's equal to (or exceeds) block_size.
> > This prevents an off-by-one read / write when accessing s->fifo_buffer
> > in sdhci_read_dataport / sdhci_write_dataport, both called right after
> > sdhci_buff_access_is_sequential.
> >
> > Fixes: CVE-2022-3872
> > Reported-by: RivenDell <XRivenDell@outlook.com>
> > Reported-by: Siqi Chen <coc.cyqh@gmail.com>
> > Reported-by: ningqiang <ningqiang1@huawei.com>
> > Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
> > ---
> >  hw/sd/sdhci.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> > index 306070c872..aa2fd79df2 100644
> > --- a/hw/sd/sdhci.c
> > +++ b/hw/sd/sdhci.c
> > @@ -978,6 +978,10 @@ static bool sdhci_can_issue_command(SDHCIState *s)
> >  static inline bool
> >  sdhci_buff_access_is_sequential(SDHCIState *s, unsigned byte_num)
> >  {
> > +    if (s->data_count >= (s->blksize & BLOCK_SIZE_MASK)) {
> > +        s->data_count = 0;
> > +    }
> > +
> >      if ((s->data_count & 0x3) != byte_num) {
> >          trace_sdhci_error("Non-sequential access to Buffer Data Port register"
> >                            "is prohibited\n");
> > --
> > 2.38.1
> >
>
> Reproducer:
>
> cat << EOF | ./qemu-system-x86_64 -machine accel=qtest \
> -nodefaults -drive if=none,index=0,file=null-co://,format=raw,id=mydrive \
> -device sdhci-pci -device sd-card,drive=mydrive -nographic -qtest stdio
> outl 0xcf8 0x80001004
> outl 0xcfc 0x107
> outl 0xcf8 0x80001010
> outl 0xcfc 0xfebf1000
> writel 0xfebf102c 0x7
> writel 0xfebf1004 0x10200
> writel 0xfebf100c 0x200000
> writel 0xfebf1028 0x10000
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1020 0xdeadbeef
> writel 0xfebf1004 0x200
> writel 0xfebf100c 0x20
> writel 0xfebf1028 0x20000
> writel 0x00100000 0xfebf1021
> writel 0xfebf1058 0x00100000
> writel 0xfebf1028 0x8
> writel 0xfebf100c 0x200011
> writel 0xfebf1020 0xaabbccdd
> EOF
>

This reproducer does not crash my QEMU. Am I missing anything?

Regards,
Bin

