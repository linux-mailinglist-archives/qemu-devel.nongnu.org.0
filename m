Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 633C13BC3A6
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 23:26:27 +0200 (CEST)
Received: from localhost ([::1]:37694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0W6k-0002Km-Fb
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 17:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0W5u-0001XX-3p
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:25:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m0W5o-0007ib-6u
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 17:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625520326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jaT5HMk3ZXlOlPp4fVPkasllMV3lC5j6WBO7D7CUaFU=;
 b=OUsnqTT0Ggozpnfqpib9/ddC0Np/35HyN2wH0MJ+MlwrKPbh+r05Nz9M7zZmM84o63Lu0e
 pH3dQUffL7siD3aCs6G4R2WcIKz4UIo2QXGn90Gd2N+cZ9ZDbUV6xDlmn/8O42OF5J/lUx
 scRDXwUwhJrUPddd2pHxroNHcqt6rVA=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-RTeNhQfvMj2pWabpPQ1xpA-1; Mon, 05 Jul 2021 17:25:24 -0400
X-MC-Unique: RTeNhQfvMj2pWabpPQ1xpA-1
Received: by mail-ua1-f69.google.com with SMTP id
 n7-20020a9f3ec70000b02902925038f790so6764054uaj.6
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 14:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jaT5HMk3ZXlOlPp4fVPkasllMV3lC5j6WBO7D7CUaFU=;
 b=SYa6NDYQ/dZLgY8wATEk2temwtTNBAR4Wj/XcF2y+NSRT6GKnHGUcKVDTcGXCUlKeK
 tVUAg0qXK4p0VaSLYRdViv6rQKWy2HDWINMqJriCAdpLbet+P65dJDpkFipIvT/6YPR5
 0Cbdfq+ag1U58R8ZMyj6fjmAxtPwYJyjd6lQlZyTTPtGSGYjMhrHLykgm0Gzi3F8YOvw
 HqT6iP5dW732sUKUArW0UABTlXqRvwRwFcL0CAjh8Mg6x7DCppH3WOpXbyke9SsCP8kh
 TzcHriBjCtZvAf5kPv80daZmcvx3Ww+qvdSxyFEcAD2DBfHFgkBm/ymXq3QXSbamUC4B
 1UCw==
X-Gm-Message-State: AOAM531hWvjk3QUFu2mtd4SJShk/ohwFLcZNi6SkLudtnXw+fMe5tGAU
 Dt1ZtHYr+TXuvS1tGO6UtSUJBWG8DIbsMOfBL0NNscLrbB7izJ19zp0H/Hq2Nmky4clD/b4UTJB
 RAekQdQMCKhnp1zTq5+f0sSCy1gOpduw=
X-Received: by 2002:ab0:3253:: with SMTP id r19mr11854473uan.5.1625520323437; 
 Mon, 05 Jul 2021 14:25:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2LEzlJ6fQED/zgX5xxUGbP0dSIlRNArRP9E+i5EwjsLm1eKy56MxIq/sbyz/Kzpdqme+gfns3q+XtyX5MyDw=
X-Received: by 2002:ab0:3253:: with SMTP id r19mr11854454uan.5.1625520323278; 
 Mon, 05 Jul 2021 14:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210629143621.907831-1-eric.auger@redhat.com>
 <e59e1cf9-d22e-e5f2-dfce-9997d2f61e03@redhat.com>
 <a63cae4d-365f-2f48-2de1-be50197f6f4d@redhat.com>
 <656d8d2a-9317-9a97-15c6-d385027e6eab@redhat.com>
 <CAKJDGDY3YGRM8fMF_5woePOXc9L889q7ezzs_4mVYWcHEHyt2w@mail.gmail.com>
 <118807da-16cd-e4c3-9b8b-e2e49ef686ca@redhat.com>
In-Reply-To: <118807da-16cd-e4c3-9b8b-e2e49ef686ca@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 5 Jul 2021 18:24:57 -0300
Message-ID: <CAKJDGDbUsMei3nBfFxVCLK1UQdiE1nJBNsfuoeGXiP7eTxH4zQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] avocado-qemu: New SMMUv3 and intel IOMMU tests
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Auger Eric <eric.auger@redhat.com>, Wainer Moschetta <wainersm@redhat.com>,
 Cleber Rosa Junior <crosa@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 5, 2021 at 6:20 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> On 7/5/21 11:10 PM, Willian Rampazzo wrote:
> > Hi Eric,
> >
> > On Mon, Jul 5, 2021 at 4:55 AM Eric Auger <eric.auger@redhat.com> wrote=
:
> >>
> >> Hi Wainer,
> >>
> >> On 7/1/21 1:22 AM, Wainer dos Santos Moschetta wrote:
> >>> Hi,
> >>>
> >>> On 6/29/21 5:17 PM, Eric Auger wrote:
> >>>> Hi Cleber, all,
> >>>>
> >>>> On 6/29/21 4:36 PM, Eric Auger wrote:
> >>>>> This series adds ARM SMMU and Intel IOMMU functional
> >>>>> tests using Fedora cloud-init images.
> >>>>>
> >>>>> ARM SMMU tests feature guests with and without RIL
> >>>>> (range invalidation support) using respectively fedora 33
> >>>>> and 31.  For each, we test the protection of virtio-net-pci
> >>>>> and virtio-block-pci devices. Also strict=3Dno and passthrough
> >>>>> modes are tested. So there is a total of 6 tests.
> >>>>>
> >>>>> The series applies on top of Cleber's series:
> >>>>> - [PATCH 0/3] Acceptance Tests: support choosing specific
> >>>>>
> >>>>> Note:
> >>>>> - SMMU tests 2, 3, 5, 6 (resp. test_smmu_noril_passthrough and
> >>>>> test_smmu_noril_nostrict) pass but the log reports:
> >>>>> "WARN: Test passed but there were warnings during execution."
> >>>>> This seems due to the lack of hash when fetching the kernel and
> >>>>> initrd through fetch_asset():
> >>>>> WARNI| No hash provided. Cannot check the asset file integrity.
> >>>> I wanted to emphasize that point and wondered how we could fix that
> >>>> issue. Looks a pity the tests get tagged as WARN due to a lack of sh=
a1.
> >>>> Any advice?
> >>>
> >>> As Willian mentioned somewhere, to supress the WARN you can pass the
> >>> kernel and initrd checksums (sha1) to the fetch_asset() method.
> >>>
> >>> Below is an draft implementation. It would need to fill out the
> >>> remaining checksums and adjust the `smmu.py` tests.
> >>>
> >>> - Wainer
> >>>
> >>> ----
> >>>
> >>> diff --git a/tests/acceptance/avocado_qemu/__init__.py
> >>> b/tests/acceptance/avocado_qemu/__init__.py
> >>> index 00eb0bfcc8..83637e2654 100644
> >>> --- a/tests/acceptance/avocado_qemu/__init__.py
> >>> +++ b/tests/acceptance/avocado_qemu/__init__.py
> >>> @@ -312,6 +312,8 @@ class LinuxDistro:
> >>>                  {'checksum':
> >>> 'e3c1b309d9203604922d6e255c2c5d098a309c2d46215d8fc026954f3c5c27a0',
> >>>                  'pxeboot_url':
> >>> "https://archives.fedoraproject.org/pub/archive/fedora/"
> >>> "linux/releases/31/Everything/x86_64/os/images/pxeboot/",
> >>> +                'pxeboot_initrd_chksum':
> >>> 'dd0340a1b39bd28f88532babd4581c67649ec5b1',
> >>> +                'pxeboot_vmlinuz_chksum':
> >>> '5b6f6876e1b5bda314f93893271da0d5777b1f3c',
> >> where did you get the checksum? I don't see any at the URL? Did you
> >> generate it yourself?
> >
> > It is possible to use the hash you generate from the downloaded file.
> >
> > While I was reviewing this series, I thought it makes more sense to
> > have Wainer's path applied first and then have your changes. I did
> > this here, with the addition of myu suggestions in the series:
> > https://gitlab.com/willianrampazzo/qemu/-/commits/test_eric_auger_v5.
>
> Off-list review is a bit unhandy (in particular when asked on the list).
>
> Why don't you post your improvements as v5? I don't think Eric will be
> offended: this is the opposite, you are helping him to get his patches
> merged ;)

Oh, I did review each of his patches in the list and also already made
the changes to speed up the process :)

He mentioned today to me that his series is still depending on one
from Cleber that was not merged yet, so we need to wait for that.

>
> > Feel free to pick it and resend a new version.
> >
> > Wainer, check if you agree with the changes to your patch and ack it.
> >
> > Regards,
>


