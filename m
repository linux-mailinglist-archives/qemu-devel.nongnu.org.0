Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B6F2F5FE9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 12:31:01 +0100 (CET)
Received: from localhost ([::1]:54972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l00qC-0007Ub-Bj
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 06:31:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l00kV-0004Jb-PA
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:25:07 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:39029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l00kK-0005dn-TB
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 06:25:05 -0500
Received: by mail-pj1-x102d.google.com with SMTP id u4so3020782pjn.4
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 03:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FB/a3IGlr2mNnBlsMB0LqU5ZoTWWDZ0tGkAmh0w7jB0=;
 b=n0B32szN6HO9QDzs8+Evr59u69+wPH8TbgEnzBAypFtRPmp2Cv44Iz1EtTfCFnJS8x
 wbaRSa5YvG2lZ89eOZ6inMukwuGoS3Mt05IwVppU7TEmZrQzg1sDP5yiyJRVlqBe8Voe
 xBxDeMotTz8DW+Yyc1VWZNRFYWFgOf8n2GyEpx/dyUca41xuPrHybR91wycqY7+cN0If
 oz8T7MmLQjhf91bd22aua8djTzg6I7mnY98h2Sg2aD2D9iLF3XyQlENAkud++Bvl8+++
 tDwHlklbvnqZwjujRwj3nYUAPWqU4idGpgXhpt+6xDpbG1CHli/BSj7IhDBKI7zTPGa1
 kAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FB/a3IGlr2mNnBlsMB0LqU5ZoTWWDZ0tGkAmh0w7jB0=;
 b=r9p9ckf9Ak4vnTKAMr80bpZILwlvnOuVYeovxJ3l+FkcGadrCmy8dOYs4856xNuDNG
 jPsjAnm8tD0oNNhrpcy9de3Baz0Hcmqn63YIOw0KM/MYRFboTd4PITulX02gPvDnnyib
 OydkNzPqzZc4+PF5zX8LzX02DN9lb1FZhGMhwampEGKZUAjyvWpXrj+tl170Wyemm2ll
 SoBEuwN+ZPAutQSZjUPnGKWkRD0bhj228PYgcfx+YSFSzNWfHehLsg4ehBqufsGXXETi
 sET93oABGIl8Ul0PuEIXvUYtimAd7Qg1KhaTfxZffgpY8ZkLnMeL1LuyIfCfgKJpGiSe
 LKnQ==
X-Gm-Message-State: AOAM533v67oRwqrThbL1eB1t3xfXcBEyKIItpMEvNn+paQCsKiiy7uF3
 WvHZr0fiVeAF+3wwkcPlnd/3Mgq7lhBsuGXFTKK5WA==
X-Google-Smtp-Source: ABdhPJzOEy7fbRtbEdWVarYHqKmR1tOSbTWEITXIIEItkKfockhRbKiqFmxDLJR6Mefop1OoXiw55Z6JSl5vwlMKzgQ=
X-Received: by 2002:a17:90a:ba88:: with SMTP id
 t8mr4489161pjr.229.1610623493993; 
 Thu, 14 Jan 2021 03:24:53 -0800 (PST)
MIME-Version: 1.0
References: <20210112143058.12159-1-maxim.uvarov@linaro.org>
 <20210112143058.12159-3-maxim.uvarov@linaro.org>
 <20210112153542.oqahdubzeoipyvun@kamzik.brq.redhat.com>
 <CAFEAcA9O2kHpcvoofo0v3ahXNOQtw8cxaVC2hn+AjpH6A9RciA@mail.gmail.com>
 <20210112162526.ob7eroamrdlowfyr@kamzik.brq.redhat.com>
 <20210112162847.wik3h24isg4cmgyq@kamzik.brq.redhat.com>
 <CAD8XO3Y3sgZ3VXh7FhfcvvTckE2EUebivQ1nUnqTud2ApGUh=Q@mail.gmail.com>
 <20210114000445.mg3xq2nq7kccbvjy@kamzik.brq.redhat.com>
 <CAFEAcA96=ZjZyhMcpTSDvrHKXZY-uOUoQSi-jTbOLpFZdnkMuQ@mail.gmail.com>
 <CAD8XO3Yxp6rcNgNRJ3+d8zEsYyS0myYs=rSNKtw849fEmdT+RQ@mail.gmail.com>
In-Reply-To: <CAD8XO3Yxp6rcNgNRJ3+d8zEsYyS0myYs=rSNKtw849fEmdT+RQ@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Thu, 14 Jan 2021 14:24:43 +0300
Message-ID: <CAD8XO3YCJjTZBZaP1MOwUzcMQ9t+tbjOAwMT4STqYmp=Lmvdmw@mail.gmail.com>
Subject: Re: [PATCHv4 2/2] arm-virt: add secure pl061 for reset/power down
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jan 2021 at 14:22, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> On Thu, 14 Jan 2021 at 12:50, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Thu, 14 Jan 2021 at 00:04, Andrew Jones <drjones@redhat.com> wrote:
> > >
> > > On Wed, Jan 13, 2021 at 10:30:47AM +0300, Maxim Uvarov wrote:
> > > > - the same size for secure and non secure gpio. Arm doc says that
> > > > secure memory is also split on 4k pages. So one page here has to be
> > > > ok.
> > >
> > > To be clear, does that means 4k pages must be used? I'm not concerned
> > > with the size, but the alignment. If it's possible to use larger page
> > > sizes with secure memory, then we need to align to the maximum page
> > > size that may be used.
> >
> > I think we should just align on 64K, to be more future-proof.
> > Even if secure software today uses 4K pages, it doesn't hurt
> > to align the device such that some hypothetical future 64K
> > page using secure software can use it.
> >
> > thanks
> > -- PMM
>
> Does that mean that in that case you need all regions to be 64k
> aligned? I mean secure and non-secure.
> Has anybody tested 64k pages under qemu?
>     [VIRT_GIC_V2M] =            { 0x08020000, 0x00001000 }
>     [VIRT_UART] =               { 0x09000000, 0x00001000 },
>     [VIRT_RTC] =                { 0x09010000, 0x00001000 },
>     [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>     [VIRT_SECURE_GPIO] =        { 0x09031000, 0x00001000 },
>     [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>    [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>
> Maxim.

I.e. I see comment:
 * Note that devices should generally be placed at multiples of 0x10000,
 * to accommodate guests using 64K pages.
 */

but it's not clear why UART, RTC and GPIO is not aligned to 64k.

