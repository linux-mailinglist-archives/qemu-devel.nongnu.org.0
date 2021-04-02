Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E21535271F
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 09:55:11 +0200 (CEST)
Received: from localhost ([::1]:35958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSEe6-00077l-3j
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 03:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1lSEd2-0006hf-Ah
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 03:54:04 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1lSEd0-0006nr-40
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 03:54:04 -0400
Received: by mail-ej1-x62c.google.com with SMTP id ce10so6365785ejb.6
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 00:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZYKtzedpbpsJpYoLCKpQlvNbXL5SYyWrt8yi+AvRQ5o=;
 b=YMDLCFQ9WwpGh26x/5eVF4zt8y+nM6O/7an7vUBkrhMq/WTPt4B3y3FycZSBGQLZ48
 c4ubaROfkR+Tpd2vYa5k3VNeG4IkDhhX6nLFvPLSfOmlw2lKGAgwGYpbm9OMKT93FAIm
 +pB8373GJSN3EDT1c8R4D5Ltma+XjY6CpmrYFBge6XhIuJyyBRTV8VkjjRgy2Ykz2jdD
 zrdjUP3zYsnXv7pbo14KGuFVEsx3TfXTGGLPCJs06QHZFgYBikYd4YesVg6smEfnw/Hr
 ej10js7F4zzxN4lvSh8345tlS6jjurOz/qwvhK6mxkKSSvuhUlM3UlS57if70ic5kLIq
 GDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZYKtzedpbpsJpYoLCKpQlvNbXL5SYyWrt8yi+AvRQ5o=;
 b=mV7P89amuxBSxlZoDnPtRAVZ4QtESrhbL73Smd5+bSM17vnYGUEqBDH9Fav9ZRMFxM
 RnV/0oW7XwSXaxYZh4xEHxxGfwykNUiKuRbNRSva3pwdDSonazGnq05JCeGluwuBBeiW
 6sj2jmsFYgKk0PtItxcwprQ/9pdckOGabSD9d2SCTnnTiRVypyVhTFydPX6zbVP5keKe
 3EmVOQCyDM8Lss9Zl45K9hdqxlkZZBTjGPxLckLlh2SMlks73z7sluko4KYedKJhPlTm
 R/1ZRxCyuxaVaWMyKydD5v/mR0ru6dLud9EqtHBmSlfWXyx+ku50lTwmUcJnJf1sPH8q
 IxPQ==
X-Gm-Message-State: AOAM533JHLE6S99VCfelOrU430OSCSgf9fjCHKcLnhl2ZJp87/yfbeqX
 CTzigQMI/2IldW4o+G2+4OA8rW9oF4hDmVHcOw5xRA==
X-Google-Smtp-Source: ABdhPJwNcDCkpRByf3qqohbllZtbYKEdOv/3WxagL/EPJELudzmvDnk/y+VSQY4cGyQZjtHvbilvGjk1VGyIHlZfkRg=
X-Received: by 2002:a17:907:3e21:: with SMTP id
 hp33mr12680005ejc.313.1617350040342; 
 Fri, 02 Apr 2021 00:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAARzgwyS6Lhcqx6nPqtbdwzZuhz+roKCiVLDPzftpsxN2T+H2Q@mail.gmail.com>
 <20210401095259-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210401095259-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 2 Apr 2021 13:23:49 +0530
Message-ID: <CAARzgwy4ceeXLNfTJYJFTR95yOg3oeBd60UNh-KEyx2yXToc2g@mail.gmail.com>
Subject: Re: virtio-pci reset option
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::62c;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Thu, Apr 1, 2021 at 7:23 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Apr 01, 2021 at 05:09:23PM +0530, Ani Sinha wrote:
> > Hi MST:
> >
> > ref: https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-bus-pci
> >
> > What: /sys/bus/pci/devices/.../reset
> > Date: July 2009
> > Contact: Michael S. Tsirkin <mst@redhat.com>
> > Description:
> > Some devices allow an individual function to be reset
> > without affecting other functions in the same device.
> > For devices that have this support, a file named reset
> > will be present in sysfs.  Writing 1 to this file
> > will perform reset.
> >
> >
> > Can you please tell me which change in the kernel virtio-pci driver
> > enabled this option to be available in sysfs? The kernel we are
> > running does not seem to have this option for virtio-pci devices. I
> > cannot seem to pin-point the exact change that is needed to get this.
> >
> >
> > thanks
> >
> > ani
>
> Likely this one:
>
> commit eb1556c493d8abc5bfc8685561bcea934700e200
> Author: Julia Suvorova <jusual@redhat.com>
> Date:   Tue Aug 20 18:30:05 2019 +0200
>
>     virtio-pci: Add Function Level Reset support

Hmm. Ok. I was actually looking in the kernel virtio-driver code
because I saw, under the same hypervisor, qemu 4.2.1, my centos 7.9 VM
was NOT showing that file in sysfs whereas my centos 8.0 did provide
that option. I was thinking, maybe the newer driver code is
responsible. Now I realize that FLR is pcie specific feature and that
my centos 8 VM is actually q35 based whereas my centos 7 VM is i440fx.
Hence, the difference.

Maybe you can consider updating that kernel documentation to mention
that this sysfs specific option is only available in PCIE and in case
of qemu based VMs, for q35 machine types.


>
>
>
> --
> MST
>

