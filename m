Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859523BC38F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 23:11:53 +0200 (CEST)
Received: from localhost ([::1]:54166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Vse-0002GH-K1
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 17:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0Vrs-0001bL-Iq
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:11:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0Vrq-0006vq-Jc
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:11:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625519461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0zW1ysoJ23EjRil5sNr4Uiyh5+rQlVSR6pLE88Wt2uc=;
 b=Qz7fEw5DF5VKKwdu1QSZP92IEhiNSAnnevXJ6sXNktAPr4Lkgn9vu32TQ7naxNv9Nn0IxH
 fUS0tqTcnJQLdorSBOboxPWcyFPEEVlrJEBjwpqPzMvE3G1uZloluuJd8cSepcvMAkgdcP
 v1in2jEOaHVdMIfkfXb+2eusuIGgX7Y=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-G1f_yXwBMYGgepPcVZoJmA-1; Mon, 05 Jul 2021 17:10:59 -0400
X-MC-Unique: G1f_yXwBMYGgepPcVZoJmA-1
Received: by mail-ua1-f69.google.com with SMTP id
 v20-20020ab076940000b029020b0b4ada34so6759711uaq.4
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 14:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0zW1ysoJ23EjRil5sNr4Uiyh5+rQlVSR6pLE88Wt2uc=;
 b=s3cGIJWajzQ0wLcr8ld+UPhcPyjp3pXOTAsDgROPLjBG4hn6UF6sG9O5SHAeu/Tc2R
 Z+pH5r3DPsVU9UJIwzrqJZ5Dj1VCcMcWK7pNzzBXEzbtGYIvlVE2Vd5arIv2ErYzZPsQ
 awu0lp2Hr1B5kitJ7VG0qk20UoeS32Y4bfaoGPGcq1NuL7+qcYu60cvclFGUPMJgacyS
 90qiVa2LiIKrHbLPGi6bu+yDBL02gpkgNLb9AdfG3WdZYHCaRdNn3C3Rm7fkuz/D/gp6
 ITaKn3ORqtP4vZmRJxHyUnFrsChnKxxn89r/Q/32+oUrLix6M/AeV8FTb9xXryFRKsmq
 jl4w==
X-Gm-Message-State: AOAM533beMUrGLc/xbU0k8cf2k15pSZ8/jI8Ss1Bayu7X5s9tWLOs+SH
 pGzppOjR59R0DVhu6UEEHMSAfOweCLeNTxLkpsu6QIrVQb5MmZkDRXCESxlRa7sUS+QVsoopM4S
 fRAH/KpNc/rUWzzYh1DBZHmRIm01+wM4=
X-Received: by 2002:a1f:e3c2:: with SMTP id a185mr10120189vkh.7.1625519458521; 
 Mon, 05 Jul 2021 14:10:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuqidEoiax2ziSAKeIX/GhlstpjkZHF/je219Zo9cU+waznTt6wZi1qP9K15EHWYDDqdoP5x7Jc//c0ZG9EDk=
X-Received: by 2002:a1f:e3c2:: with SMTP id a185mr10120162vkh.7.1625519458329; 
 Mon, 05 Jul 2021 14:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210629143621.907831-1-eric.auger@redhat.com>
 <e59e1cf9-d22e-e5f2-dfce-9997d2f61e03@redhat.com>
 <a63cae4d-365f-2f48-2de1-be50197f6f4d@redhat.com>
 <656d8d2a-9317-9a97-15c6-d385027e6eab@redhat.com>
In-Reply-To: <656d8d2a-9317-9a97-15c6-d385027e6eab@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 5 Jul 2021 18:10:32 -0300
Message-ID: <CAKJDGDY3YGRM8fMF_5woePOXc9L889q7ezzs_4mVYWcHEHyt2w@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] avocado-qemu: New SMMUv3 and intel IOMMU tests
To: Auger Eric <eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On Mon, Jul 5, 2021 at 4:55 AM Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Wainer,
>
> On 7/1/21 1:22 AM, Wainer dos Santos Moschetta wrote:
> > Hi,
> >
> > On 6/29/21 5:17 PM, Eric Auger wrote:
> >> Hi Cleber, all,
> >>
> >> On 6/29/21 4:36 PM, Eric Auger wrote:
> >>> This series adds ARM SMMU and Intel IOMMU functional
> >>> tests using Fedora cloud-init images.
> >>>
> >>> ARM SMMU tests feature guests with and without RIL
> >>> (range invalidation support) using respectively fedora 33
> >>> and 31.  For each, we test the protection of virtio-net-pci
> >>> and virtio-block-pci devices. Also strict=no and passthrough
> >>> modes are tested. So there is a total of 6 tests.
> >>>
> >>> The series applies on top of Cleber's series:
> >>> - [PATCH 0/3] Acceptance Tests: support choosing specific
> >>>
> >>> Note:
> >>> - SMMU tests 2, 3, 5, 6 (resp. test_smmu_noril_passthrough and
> >>> test_smmu_noril_nostrict) pass but the log reports:
> >>> "WARN: Test passed but there were warnings during execution."
> >>> This seems due to the lack of hash when fetching the kernel and
> >>> initrd through fetch_asset():
> >>> WARNI| No hash provided. Cannot check the asset file integrity.
> >> I wanted to emphasize that point and wondered how we could fix that
> >> issue. Looks a pity the tests get tagged as WARN due to a lack of sha1.
> >> Any advice?
> >
> > As Willian mentioned somewhere, to supress the WARN you can pass the
> > kernel and initrd checksums (sha1) to the fetch_asset() method.
> >
> > Below is an draft implementation. It would need to fill out the
> > remaining checksums and adjust the `smmu.py` tests.
> >
> > - Wainer
> >
> > ----
> >
> > diff --git a/tests/acceptance/avocado_qemu/__init__.py
> > b/tests/acceptance/avocado_qemu/__init__.py
> > index 00eb0bfcc8..83637e2654 100644
> > --- a/tests/acceptance/avocado_qemu/__init__.py
> > +++ b/tests/acceptance/avocado_qemu/__init__.py
> > @@ -312,6 +312,8 @@ class LinuxDistro:
> >                  {'checksum':
> > 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0',
> >                  'pxeboot_url':
> > "https://archives.fedoraproject.org/pub/archive/fedora/"
> > "linux/releases/31/Everything/x86_64/os/images/pxeboot/",
> > +                'pxeboot_initrd_chksum':
> > 'dd0340a1b39bd28f88532babd4581c67649ec5b1',
> > +                'pxeboot_vmlinuz_chksum':
> > '5b6f6876e1b5bda314f93893271da0d5777b1f3c',
> where did you get the checksum? I don't see any at the URL? Did you
> generate it yourself?

It is possible to use the hash you generate from the downloaded file.

While I was reviewing this series, I thought it makes more sense to
have Wainer's path applied first and then have your changes. I did
this here, with the addition of myu suggestions in the series:
https://gitlab.com/willianrampazzo/qemu/-/commits/test_eric_auger_v5.

Feel free to pick it and resend a new version.

Wainer, check if you agree with the changes to your patch and ack it.

Regards,

>
> Thanks
>
> Eric
> >                  'kernel_params':
> > "root=UUID=b1438b9b-2cab-4065-a99a-08a96687f73c ro "
> >                                "no_timer_check net.ifnames=0 "
> >                                "console=tty1 console=ttyS0,115200n8"},
> > @@ -371,6 +373,16 @@ def pxeboot_url(self):
> >          """Gets the repository url where pxeboot files can be found"""
> >          return self._info.get('pxeboot_url', None)
> >
> > +    @property
> > +    def pxeboot_initrd_chksum(self):
> > +        """Gets the pxeboot initrd file checksum"""
> > +        return self._info.get('pxeboot_initrd_chksum', None)
> > +
> > +    @property
> > +    def pxeboot_vmlinuz_chksum(self):
> > +        """Gets the pxeboot vmlinuz file checksum"""
> > +        return self._info.get('pxeboot_vmlinuz_chksum', None)
> > +
> >      @property
> >      def checksum(self):
> >          """Gets the cloud-image file checksum"""
> > diff --git a/tests/acceptance/intel_iommu.py
> > b/tests/acceptance/intel_iommu.py
> > index bf8dea6e4f..a2f38ee2e9 100644
> > --- a/tests/acceptance/intel_iommu.py
> > +++ b/tests/acceptance/intel_iommu.py
> > @@ -55,8 +55,10 @@ def common_vm_setup(self, custom_kernel=None):
> >
> >          kernel_url = self.distro.pxeboot_url + 'vmlinuz'
> >          initrd_url = self.distro.pxeboot_url + 'initrd.img'
> > -        self.kernel_path = self.fetch_asset(kernel_url)
> > -        self.initrd_path = self.fetch_asset(initrd_url)
> > +        self.kernel_path = self.fetch_asset(kernel_url,
> > + asset_hash=self.distro.pxeboot_vmlinuz_chksum)
> > +        self.initrd_path = self.fetch_asset(initrd_url,
> > + asset_hash=self.distro.pxeboot_initrd_chksum)
> >
> >      def run_and_check(self):
> >          if self.kernel_path:
> >
> >>
> >> Best Regards
> >>
> >> Eric
> >>> History:
> >>> v3 -> v4:
> >>> - I added Wainer's refactoring of KNOWN_DISTROS
> >>> into a class (last patch) and took into account his comments.
> >>>
> >>> v2 -> v3:
> >>> - Added Intel IOMMU tests were added. Different
> >>> operating modes are tested such as strict, caching mode, pt.
> >>>
> >>> Best Regards
> >>>
> >>> Eric
> >>>
> >>> The series and its dependencies can be found at:
> >>> https://github.com/eauger/qemu/tree/avocado-qemu-v4
> >>>
> >>> Eric Auger (3):
> >>>    Acceptance Tests: Add default kernel params and pxeboot url to the
> >>>      KNOWN_DISTROS collection
> >>>    avocado_qemu: Add SMMUv3 tests
> >>>    avocado_qemu: Add Intel iommu tests
> >>>
> >>> Wainer dos Santos Moschetta (1):
> >>>    avocado_qemu: Fix KNOWN_DISTROS map into the LinuxDistro class
> >>>
> >>>   tests/acceptance/avocado_qemu/__init__.py | 118 +++++++++++++------
> >>>   tests/acceptance/intel_iommu.py           | 115 +++++++++++++++++++
> >>>   tests/acceptance/smmu.py                  | 132
> >>> ++++++++++++++++++++++
> >>>   3 files changed, 332 insertions(+), 33 deletions(-)
> >>>   create mode 100644 tests/acceptance/intel_iommu.py
> >>>   create mode 100644 tests/acceptance/smmu.py
> >>>
> >
>


