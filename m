Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF42A36F3DA
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:55:06 +0200 (CEST)
Received: from localhost ([::1]:33262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcIMz-0004xa-Pd
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oohall@gmail.com>)
 id 1lcILd-0004RB-Qm; Thu, 29 Apr 2021 21:53:42 -0400
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:42767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <oohall@gmail.com>)
 id 1lcILZ-0003GZ-M9; Thu, 29 Apr 2021 21:53:41 -0400
Received: by mail-qv1-xf36.google.com with SMTP id b14so8100508qvf.9;
 Thu, 29 Apr 2021 18:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/WeHNQM4YeIxm6H6MmkPHOSXNgZ6OSgnXlcWAmZzkiQ=;
 b=sO0Za5d7oIzdjVHNDt6j4r7MD22lHPBAX24+JbUVU79euOxseaJay7U2goV3pZE9P/
 lzr6hqNnZ/v2VEs5GIqSbjVT0fMChLCR2Zsea/qBijaW6a40fkakHPayGwAmUi8F9t6J
 6+naI51287iPUdjwhsj2lqmOoeMgxYatzJ9Ggm7vy2fqhogicTkJHdzYVk16IEzgy6I7
 wQwiQd+/qzz/idoeZkxnFrV+qQwPB92EGHFuTdZ/XJhKRCdKIA4Jdu07MnfKGtNlLcIP
 +LtJfgE4XYfdQsrzbXhG+NqbR/vYIWzZjJ0h1Cj5R9VoaiMhe2c6f4+82i/a1Qjnu29p
 CD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/WeHNQM4YeIxm6H6MmkPHOSXNgZ6OSgnXlcWAmZzkiQ=;
 b=WCJTEQ0SWo7M/TuTO8mccVdGVEVBaSEUwSUvVAE2gw31fgjq3gHOBB0HRhJg7Lusyn
 RuEvA8Yr6I/1HRoVPgnIeYNjmOXS+ae2dDUjwJT050shgG6Vn6SmGuH2Yvs8RC9tFdAB
 jvDmLO2gItKxuaI8G10tHVDC9YOjSvVCA8JhXyoTR/PXnDfYpJ91w0ZmwLINCPKc5+Ek
 i1Lx3E+4/XJgY2g2wjVeti3bKG0MPqwCVEd/YhcAF22jwWvk1BRe/2zS5NbGDxXLAm43
 w9ZsPeBdGIrTJgYk45mKN55v9AxiUp5pDMbvthq2W+Xm0TuxsbhrDWDsJKR/CoVqNKkS
 OEIQ==
X-Gm-Message-State: AOAM533T5fAX307hj/LNfziqqGAH6o/DeIJ/LnZjGcJ+FH/oVfxyfNGQ
 J28mIGmsQ8LoR6kc9nODXMtk7D/ZrTjlIcUH5YA=
X-Google-Smtp-Source: ABdhPJwMyp+D/mgtFyF/psD2hgPjc2K3bgLOAs16HqDPji16Gab5E28anJ34bxBjT/7wWf1eJBjxTptVQGZJRbH+zAg=
X-Received: by 2002:a0c:ff06:: with SMTP id w6mr3137817qvt.51.1619747615810;
 Thu, 29 Apr 2021 18:53:35 -0700 (PDT)
MIME-Version: 1.0
References: <161952458744.148285.11534763593153102355.stgit@jupiter>
 <CAOSf1CGGgxX4mGhjjsVGYA391XrABEOTh2xmiafW6V7cScyG4g@mail.gmail.com>
 <20210429090223.ywdscwrhfxam66j6@in.ibm.com>
In-Reply-To: <20210429090223.ywdscwrhfxam66j6@in.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 30 Apr 2021 11:53:24 +1000
Message-ID: <CAOSf1CG21nZOzAXt8SohHxPq4KW1BrwCje_qEYyPvfF59q4=kg@mail.gmail.com>
Subject: Re: [PATCH] spapr: Modify ibm, get-config-addr-info2 to set DEVNUM in
 PE config address.
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=oohall@gmail.com; helo=mail-qv1-xf36.google.com
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

On Thu, Apr 29, 2021 at 7:02 PM Mahesh J Salgaonkar
<mahesh@linux.ibm.com> wrote:
>
> On 2021-04-28 22:33:45 Wed, Oliver O'Halloran wrote:
> > On Tue, Apr 27, 2021 at 9:56 PM Mahesh Salgaonkar <mahesh@linux.ibm.com> wrote:
> > >
> > > With upstream kernel, especially after commit 98ba956f6a389
> > > ("powerpc/pseries/eeh: Rework device EEH PE determination") we see that KVM
> > > guest isn't able to enable EEH option for PCI pass-through devices anymore.
> >
> > How are you passing the devices through to the guest?
>
> I am using libvirt with below xml section to add pass-through:
>
>     <hostdev mode='subsystem' type='pci' managed='yes'>
>       <driver name='vfio'/>
>       <source>
>         <address domain='0x0033' bus='0x01' slot='0x00' function='0x0'/>
>       </source>
>       <address type='pci' domain='0x0000' bus='0x01' slot='0x01' function='0x0' multifunction='on'/>
>     </hostdev>
>     <hostdev mode='subsystem' type='pci' managed='yes'>
>       <driver name='vfio'/>
>       <source>
>         <address domain='0x0033' bus='0x01' slot='0x00' function='0x1'/>
>       </source>
>       <address type='pci' domain='0x0000' bus='0x01' slot='0x01' function='0x1' multifunction='on'/>
>     </hostdev>
>
> Looks like libvirt does not allow pass through device in slot zero, and
> throws following error.
>
> error: XML error: Invalid PCI address 0000:01:00.0. slot must be >= 1
> Failed. Try again? [y,n,i,f,?]:

That's pretty odd and I have no idea why that's happening. I seem to
remember being able to use slot 0 for vfio devices when doing the
passthru manually with the qemu command line so this might be a
libvirt quirk.

> *snip*
>
> Agree. I realize my fix is not correctly handling this. The current code
> under ibm,set-eeh-option is checking for individual PCI device presence.
> Better fix should be to check if there is any PCI device (vfio-pci)
> present under specified bus and enable the EEH if found. And no change
> in return value of get-config-addr-info2. What do you say ?

That sounds reasonable. You would however need to verify that all the
devices on that bus are within the same PE on the hypervisor side.

