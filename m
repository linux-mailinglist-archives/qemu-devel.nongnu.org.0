Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F12C342F8F
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 21:42:47 +0100 (CET)
Received: from localhost ([::1]:55804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNiQn-0008On-Nn
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 16:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNiOs-0007jM-3Y
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 16:40:47 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:36615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNiOo-0005i7-A6
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 16:40:45 -0400
Received: by mail-ed1-x52c.google.com with SMTP id o19so14802022edc.3
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 13:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Hl1t8SZdRJAGRxBqows1Jd45ybb17/bEPf02hYVARA=;
 b=Z/ppwOqCU+R3SULy7S+t1CGxioTz0cPdiWPWhpJU82jn3GephgbELi8Vd2gqz1xRr8
 rCOOfKpQf6UlfKfCSKddImTycd5MNF4Fi3jN1Bz51Z+lmLY12M+9Syo9x1NpN677W72+
 NKGaFzFpfmYIxndc9QsOpYfeDG6Q27DXj5XgEZzh3I6PTifPAmGbS/rbqev85ZJkNJfk
 4ZfKypeHAaqMR+FUIRIUGCaaJVpHn2blEw7RuuPtejtfmHVl+pbs18tnH1is0sms7yYm
 eI4RdqOzmHwea5AG6fvGoIzFflXBKl4NbpICLEo5Pe3elnC0m8peINAXdbXiAzQuI/U7
 Bduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Hl1t8SZdRJAGRxBqows1Jd45ybb17/bEPf02hYVARA=;
 b=SQ6k/y0o82GGjwaui8kfT8Jk5ZfZ9+MzU27cYRJSNnLpPRiF477IEYrf9xQEnapJ5D
 Zw7BQvk7TsiwFugYmIRcfr/YjXSis9U5s00kIEOfb+GYcqmVeBpxRaVzED5OvD5+U5at
 krXlwANAgz4LMttGEZuM93jTr/cemDInnpHxSA34fF+eqBMOBgGH6XqpwsxqgrjYxJxb
 MM8WpBU9T6akenykKb0Q49lYxmr75AycE8kXiMLM2d5Q6oygQ88Pqcw5kizniJIde0k1
 zNLjGdfVq+plOt2UUtc+tbjp7A0aeK3KtpxW3ILXP6IaEYOYC7ekT7OKC0h2MomhwyJm
 Qstw==
X-Gm-Message-State: AOAM533cfDB0i2SD791RxB5mT/EAkQsIuXQ/n1CPi3rhDJplK7Q7sYa2
 avSmuY76/rgdOSSNAt83dMawKrjNM+Ftq0XNQ8d2uA==
X-Google-Smtp-Source: ABdhPJxIPCWuKKa+zUB+N3K3yWsWLKV9WjWpG4ttjHo6p5HDdIPti9II1RTiiWPwNQsKJyX7U2W7ebgwZ89wOiB7wiM=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr16998175edv.44.1616272839759; 
 Sat, 20 Mar 2021 13:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_M4zK1aLdO2QdOUgNROTLdHUwLHnCKoUT1BpTcF-cTMw@mail.gmail.com>
 <20210320144325-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210320144325-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 20 Mar 2021 20:40:13 +0000
Message-ID: <CAFEAcA-TWsG8wbc8jtEHvnKU5RFJrif77miWDb76y937tmMyGw@mail.gmail.com>
Subject: Re: QEMU PCI subsystem: what code is responsible for making accesses
 to non-mapped addresses read as -1?
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 20 Mar 2021 at 18:59, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Mar 19, 2021 at 12:35:31PM +0000, Peter Maydell wrote:
> > I'm looking at a bug reported against the QEMU arm virt board's pci-gpex
> > PCI controller: https://bugs.launchpad.net/qemu/+bug/1918917
> > where an attempt to write to an address within the PCI IO window
> > where the guest hasn't mapped a BAR causes a CPU exception rather than
> > (what I believe is) the PCI-required behaviour of writes-ignored, reads
> > return -1.
> >
> > What in the QEMU PCI code is responsible for giving the PCI-spec
> > behaviour for accesses to the PCI IO and memory windows where there
> > is no BAR? I was expecting the generic PCI code to map a background
> > memory region over the whole window to do this, but it looks like it
> > doesn't...

> As far as I know, at the PCI level what happens is Master Abort
> on PCI/PCI-X and Unsupported Request on Express.
> PCI spec says:
>         The host bus bridge, in PC compatible systems, must return all 1's on a read transaction and
>         discard data on a write transaction when terminated with Master-Abort.
>
> We thus implement this per host e.g. on pc compatible systems by
> calling pc_pci_as_mapping_init.

Isn't pc_pci_as_mapping_init() "put the PCI space into the system
address space", rather than "define the default behaviour for
accesses in PCI space" ? IIRC x86 has -1/discard for everywhere,
though, so maybe you get that without having to do anything special.

Q: if PCI device A does a bus-mastering DMA read to a PCI address
where no other device has been mapped, does the spec require
it to (a) get back a "transaction failed" response or (b) get
back read-data of -1 ? It sounds like the answer based on what
you write above is (a), device A gets a Master Abort.
(Put another way, is the -1/discard behaviour general to PCI
transactions or is it strictly something that happens at the host
bridge where the host bridge turns host CPU transactions into PCI
transactions ?)

If this is host-bridge specific then I guess our current
implementation of "leave it up to the host bridge code" makes
sense, but it also seems like a recipe for all our host bridges
forgetting this corner case, in the absence of support from
the common code for making it easy/the default...

Anyway, I think that for hw/pci-host/gpex.c we would need
to change the current
    memory_region_init(&s->io_mmio, OBJECT(s), "gpex_mmio", UINT64_MAX);
    [...]
    sysbus_init_mmio(sbd, &s->io_mmio);
    [...]
    pci->bus = pci_register_root_bus(dev, "pcie.0", gpex_set_irq,
                                     pci_swizzle_map_irq_fn, s, &s->io_mmio,
                                     &s->io_ioport, 0, 4, TYPE_PCIE_BUS);

to also create a container MR with a background set of io read/write
functions to give the -1/discard behaviour, map s->io_mmio into
that container, and return the container as the sysbus MMIO region.
(and same again for the IO window).

thanks
-- PMM

