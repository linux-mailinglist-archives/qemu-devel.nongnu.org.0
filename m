Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A3E3696B1
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 18:13:53 +0200 (CEST)
Received: from localhost ([::1]:45302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZyRD-00047k-QW
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 12:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZyPx-0003fk-Aa
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:12:33 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lZyPv-0007L1-IJ
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 12:12:32 -0400
Received: by mail-ej1-x635.google.com with SMTP id l4so74621812ejc.10
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 09:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XZdpzXOcTxqjFSwlRbFb4i3zdLm4WGWVwAD6TdcmzW8=;
 b=bx7T8M0rn8trP03/foASzOB4mP+e5xxRUdvMg0E+hdzdRoB4zYTBubOwBK9ynES7SD
 e+/otNGL08Oxp0r8wukrvw6ITCZ+WCbUOdrxn3+pg68kyWAyPXLn+WEnxoCnEHLIv38V
 3gmlVYY12yJk3p2+BognzZdonkAZf4+jRyxYO+NE/uumt+gONfmrdbXYzLntSAPA/ykv
 Q9+6s+pqVuexw7UTJRCAzx4ZvU+A1A5pxM1JfKkBrQsx/mM8BeTZ2m9GyT8NVtBG5PF6
 gu7ARrAPxqRVnAhmiFasiKk1QR8Jh0BUgftzdRAqHr5CME+U9LCWAot8Copotua9sS26
 Ji3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XZdpzXOcTxqjFSwlRbFb4i3zdLm4WGWVwAD6TdcmzW8=;
 b=mf24JHKPRhec+ytdJTH2q/dJ40lfcGIQW/CP8EpL0ZmjEyhE5KM/J3XNlbyJmuQFnj
 3FMtPTfd6CGVEOtl5VY9k1Mj8yw09p+nApZo08Iyw7BpExy9MC5O0yn9N9Udb4BWWp8q
 E8qkLcZY3+xRgKoZsXjOJOyHu61EkX7NZfb+UZkTUleDJluU4putdyOifEKaQ41gYzZS
 V5Sw0niPNxlHEsc0DV2lVtBvqXYL65sh4vaph1nNdpPrQRmXhOULumJ/xTRDOznDV38G
 6rUBPzU3hCYnsJvgXq/eRVzDFXR2h2Rtx+4P9PE8flOy2mcE6BUQaxgzn3IWTOw+K6pk
 xUkA==
X-Gm-Message-State: AOAM533QkJd4TTF5ALMWUq9PeF7q7Haku/eviToQk/I7mBJKi9sM1Ch+
 P9jv1pG1l8WAMP6Fw4XXktmtLlR9TH4m6fi4hziepw==
X-Google-Smtp-Source: ABdhPJyDSlSixAFbOnjHavccWW0qYS4OXblBD8TbXiLfXLQZPckG4f8UKyHPhXB8IOTpe4tAz6yWocPtCSCaUqcDZwQ=
X-Received: by 2002:a17:906:8303:: with SMTP id
 j3mr5061444ejx.85.1619194349293; 
 Fri, 23 Apr 2021 09:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210422222429.183108-1-mst@redhat.com>
 <20210422222429.183108-2-mst@redhat.com>
 <CAFEAcA9LLh7kkqujLpiXjRgRkua77kLAv=MbeG8yq3NP-w8uyg@mail.gmail.com>
 <YILNH1DDTTV6TcFO@myrica>
In-Reply-To: <YILNH1DDTTV6TcFO@myrica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Apr 2021 17:11:33 +0100
Message-ID: <CAFEAcA8ijMSO=fEtn3GUGaumMjncz0hDv4e2O7XFSmMXDSiTjQ@mail.gmail.com>
Subject: Re: [PULL 1/2] amd_iommu: Fix pte_override_page_mask()
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 23 Apr 2021 at 14:35, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> On Fri, Apr 23, 2021 at 02:01:19PM +0100, Peter Maydell wrote:
> > On Thu, 22 Apr 2021 at 23:24, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > >
> > > AMD IOMMU PTEs have a special mode allowing to specify an arbitrary page
> > > size. Quoting the AMD IOMMU specification: "When the Next Level bits [of
> > > a pte] are 7h, the size of the page is determined by the first zero bit
> > > in the page address, starting from bit 12."
> > >
> > > So if the lowest bits of the page address is 0, the page is 8kB. If the
> > > lowest bits are 011, the page is 32kB. Currently pte_override_page_mask()
> > > doesn't compute the right value for this page size and amdvi_translate()
> > > can return the wrong guest-physical address. With a Linux guest, DMA
> > > from SATA devices accesses the wrong memory and causes probe failure:
> > >
> > > qemu-system-x86_64 ... -device amd-iommu -drive id=hd1,file=foo.bin,if=none \
> > >                 -device ahci,id=ahci -device ide-hd,drive=hd1,bus=ahci.0
> > > [    6.613093] ata1.00: qc timeout (cmd 0xec)
> > > [    6.615062] ata1.00: failed to IDENTIFY (I/O error, err_mask=0x4)
> > >
> > > Fix the page mask.
> > >
> > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > Message-Id: <20210421084007.1190546-1-jean-philippe@linaro.org>
> > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > Jean-Philippe, do you know if this is a regression since 5.2?
>
> I don't think so, I can reproduce it with v5.2.0.

OK, thanks; I think I favour not putting this into rc5, then.

-- PMM

