Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08EE36D786
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 14:39:29 +0200 (CEST)
Received: from localhost ([::1]:50442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbjTU-0006GM-RO
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 08:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oohall@gmail.com>)
 id 1lbjOC-0002Yw-4k; Wed, 28 Apr 2021 08:34:00 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:42662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <oohall@gmail.com>)
 id 1lbjOA-0008KS-6O; Wed, 28 Apr 2021 08:33:59 -0400
Received: by mail-qt1-x833.google.com with SMTP id n22so6932106qtk.9;
 Wed, 28 Apr 2021 05:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2zMYQGQELpDExMz3LFuKz2ukZ9UxLb+1V5qdNV5EXZU=;
 b=bLA1fA6v/Gbe+rOqrKcibNQx/yByDlE/HhucXgeYmwwTcoJusiAQEk3MV6BQTQFaep
 BRBxlVkxwU9P5q/eujMXhQt/0ZsDkS0RNODgVjbvUrePbUEx5BhS3elMf2rPF7IkO547
 UqbvqnDKWhQ4nBH3DgrGegoMzq7pLA1IyFQICWxcL5cvQXfS5MZ7y83Su/41LrUqwwoA
 BkEqY7saFChe2Nr6tfbn63eDAZCjrvSTFvEJoWirNbmtBj1ieqvVqY0mXGVRUvTvAQaD
 GRxZxSZmgQBB54FLtW9oIBBBEN3pMwoTN5XaUZ78ohbhMZXRUIGxb1SQdKd3dO0AfXZ7
 jpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2zMYQGQELpDExMz3LFuKz2ukZ9UxLb+1V5qdNV5EXZU=;
 b=DX/CcM1lgTzhT97Oyl8UY64WGQ5ob+RseYs7JyENG1f8/F0kbf9h3qLB7qgYI94Hh8
 5ILT6Jsxer3LLxvy8cE2OjSEdCtc4dkd43XowoVlJY9C6SmfLtlBkCACvk1pe0++/y7c
 VwnvZhi8fiCaTzF4016CSs/l5ti8b96fFhV45wQelnrBDygRJkYg0boZK5wrTtGMfsOQ
 L9LT3fNJTuJgAIexUutECu3N4EIVBRSgy9s2gUp462ZIlBfIZZtTM2f201jivUZPbEMI
 Q6AdPCiOXm0UflJI99Bez8rINNZmBYoAWcZbJ+OP6mCpia1N59Y9M3dIt2b7+Rm6HZP8
 floA==
X-Gm-Message-State: AOAM530Hnm5+nDu8+MzfNz1lKox1oEhQf7T+Tbn2iFVUTHdke+Vh2El6
 oq7sai/pJWCeIcJuYev0hHkNZ26msjhHJ01M3fw=
X-Google-Smtp-Source: ABdhPJxqO1OrchI3TePyuil/iN2c1dD0LYKjC59fVIlBevmFSkmkFKc7UNdVls0xGD5BRBzyreplWSPvQe+fg/+9zVQ=
X-Received: by 2002:a05:622a:4d3:: with SMTP id
 q19mr26726321qtx.55.1619613236280; 
 Wed, 28 Apr 2021 05:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <161952458744.148285.11534763593153102355.stgit@jupiter>
In-Reply-To: <161952458744.148285.11534763593153102355.stgit@jupiter>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 28 Apr 2021 22:33:45 +1000
Message-ID: <CAOSf1CGGgxX4mGhjjsVGYA391XrABEOTh2xmiafW6V7cScyG4g@mail.gmail.com>
Subject: Re: [PATCH] spapr: Modify ibm, get-config-addr-info2 to set DEVNUM in
 PE config address.
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=oohall@gmail.com; helo=mail-qt1-x833.google.com
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Qemu-ppc <qemu-ppc@nongnu.org>, Qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 27, 2021 at 9:56 PM Mahesh Salgaonkar <mahesh@linux.ibm.com> wrote:
>
> With upstream kernel, especially after commit 98ba956f6a389
> ("powerpc/pseries/eeh: Rework device EEH PE determination") we see that KVM
> guest isn't able to enable EEH option for PCI pass-through devices anymore.

How are you passing the devices through to the guest?

> [root@atest-guest ~]# dmesg | grep EEH
> [    0.032337] EEH: pSeries platform initialized
> [    0.298207] EEH: No capable adapters found: recovery disabled.
> [root@atest-guest ~]#
>
> So far the linux kernel was assuming pe_config_addr equal to device's
> config_addr and using it to enable EEH on the PE through ibm,set-eeh-option
> RTAS call. Which wasn't the correct way as per PAPR. The linux kernel
> commit 98ba956f6a389 fixed this flow. With that fixed, linux now gets the
> PE config address first using the ibm,get-config-addr-info2 RTAS call, and
> then uses the found address as argument to ibm,set-eeh-option RTAS call to
> enable EEH on the PCI device.

That's not really correct. EEH being enabled or disabled is a per-PE
setting rather than a per-device setting. The fact there's not a 1-1
correspondence between devices and PEs is a large part of why the
get-config-addr-info2 RTAS call exists in the first place.
Unfortunately, the initial implementation of EEH support in linux
conflated the two because in the past there was typically a single
device within a PE. However, that assumption was never really correct
and it has long outlived its usefulness.

> This works on PowerVM lpar but fails in qemu
> KVM guests. This is because ibm,set-eeh-option RTAS call in qemu expects PE
> config address bits 16:20 be populated with device number (DEVNUM).
>
> The rtas call ibm,get-config-addr-info2 in qemu always returns the PE
> config address in form of "00BB0001" (i.e.  <00><BUS><DEVFN><REG>) where
> "BB" represents the bus number of PE's primary bus and with device number
> information always set to zero. However until commit 98ba956f6a389 this
> return value wasn't used to enable EEH on the PCI device.
>
> Now in qemu guest with recent kernel the ibm,set-eeh-option RTAS call fails
> with -3 return value indicating that there is no PCI device exist for the
> specified pe config address. The rtas_ibm_set_eeh_option call uses
> pci_find_device() to get the PC device that matches specific bus and devfn
> extracted from PE config address passed as argument. Since the DEVFN part
> of PE config always contains zero, pci_find_device() fails to find the
> specific PCI device and hence fails to enable the EEH capability.
>
> hw/ppc/spapr_pci_vfio.c: spapr_phb_vfio_eeh_set_option()
>    case RTAS_EEH_ENABLE: {
>         PCIHostState *phb;
>         PCIDevice *pdev;
>
>         /*
>          * The EEH functionality is enabled on basis of PCI device,
>          * instead of PE. We need check the validity of the PCI
>          * device address.
>          */
>         phb = PCI_HOST_BRIDGE(sphb);
>         pdev = pci_find_device(phb->bus,
>                                (addr >> 16) & 0xFF, (addr >> 8) & 0xFF);
>         if (!pdev || !object_dynamic_cast(OBJECT(pdev), "vfio-pci")) {
>             return RTAS_OUT_PARAM_ERROR;
>         }
>
> This patch fixes this issue by populating DEVNUM field (bits 16:20) of PE
> config address with device number.

I don't think this is a good idea and I'm fairly sure you're
introducing some subtle breakage here. As an example, say that on the
host side you have two devices on the same bus:

0000:00:00.0 - card 1
0000:00:01.0 - card 2

On PowerNV (i.e. the hypervisor) these would be placed into the same
hardware PE since they're on the same bus. Now, if I take both devices
and pass them through to the guest on the same PHB and bus (use
0005:ff) we'll have:

0005:ff:00.0 - card 1
0005:ff:01.0 - card 2

With this patch applied get-config-addr-info2 returns 00BBD001, so the
PE we get for each device will be:

card 1 - 00ff0001
card 2 - 00ff1001

Which implies the two are in different PEs. As a result, if the guest
requests a reset of card 1's PE then the guest will see an unexpected
reset of card 2 as well. From the hypervisor's point of view the two
are in the same PE so this is a legitimate thing to do, but due to
this patch the guest doesn't know that.

As far as I can remember this is why you're supposed to pass each EEH
capable devices to the guest on a seperate spapr-phb (which matches
what PHYP does). Alexy can probably tell you more.

Oliver

