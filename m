Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220CA3B7979
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 22:39:55 +0200 (CEST)
Received: from localhost ([::1]:55780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyKWP-0002YK-Pm
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 16:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyKVU-0001U2-BH
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 16:38:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyKVP-0003kT-M3
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 16:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624999128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=md8mfAh4Mlyho6sp5bQv+gVg0BQkAcFoLqc0+ciRWG4=;
 b=i0zMJKcbBEMzYua0QqJjcTvc6Qi/geYSsE6jZqNXfvLsLeOCZexwLq/OxMI4Mug6eaYGPK
 uXnnaHxKKmG/z0FlXaNHr8kNMOlhsS6nUiHI2+KNQaxbri74yi8iwcHwkNhEdZWoKL9N+W
 mJWaGV+VppU9SvsuldX+vwudYMVqfZ0=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-2Qoejh2DPKeTg4a5Q_6Gpg-1; Tue, 29 Jun 2021 16:38:45 -0400
X-MC-Unique: 2Qoejh2DPKeTg4a5Q_6Gpg-1
Received: by mail-ua1-f71.google.com with SMTP id
 w22-20020a9f2c960000b02902939e0aaf4fso18804uaj.8
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 13:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=md8mfAh4Mlyho6sp5bQv+gVg0BQkAcFoLqc0+ciRWG4=;
 b=IWGfT7/Yds9B4o+Y8d5ggZOfXzI2PpOv43ztIRFoOx/u/cXrrGAwars/uGJuRseB7e
 M+snrPNh+a3G3IjHcIDPjCPrqo9Wpb63u61/KqsuS/ufmLyDwGxYz6QBBSXkV8pKfI4X
 T72VSPxKv7VMvGw7jHl707L/pr4imxrVwEnMx1dzTjXjGkv9F7JFQDaY5h2gEzr9zpRy
 oFypWv/VdpPn2RAGDCWi6Oer6lSL4TUdeLfFOItv135SwWiChl2Vq16rP77HXFGhJ8n9
 fhtSWlOwRrmf2ogXU+ryR0n7FqbDUNGp4CsEMAFgYdY6gCE5DG5vSEBnyhXH9B/kx0xm
 plZw==
X-Gm-Message-State: AOAM5309/2QeVuy8YJSltpR9pQsneao62ebefQUqOokSKGUkBbKV2yeS
 XNZJSi9YDMbTSl+bFELIUW+GM1TAlM3NicIXdHpqc+pOTJRAbW/aEmhhC9hayO3pzqx6u5NFeu4
 YXSAKZm3hLwL2LCQoxWxNn2M/wyqPwbw=
X-Received: by 2002:a05:6102:214e:: with SMTP id
 h14mr3852531vsg.1.1624999124989; 
 Tue, 29 Jun 2021 13:38:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRGPfZ3LuEAAbNRGopWWThxB1HFt6UMiblo+yM2M9ItIRyP7YeKPZ7ytl0xfsKsfjPGBZBhHrXBTgwgGS+YwI=
X-Received: by 2002:a05:6102:214e:: with SMTP id
 h14mr3852519vsg.1.1624999124786; 
 Tue, 29 Jun 2021 13:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210629143621.907831-1-eric.auger@redhat.com>
 <e59e1cf9-d22e-e5f2-dfce-9997d2f61e03@redhat.com>
In-Reply-To: <e59e1cf9-d22e-e5f2-dfce-9997d2f61e03@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 29 Jun 2021 17:38:18 -0300
Message-ID: <CAKJDGDbSqhuqdHBm1hA9bttAQakj81RHxjiTtQ6YhXsjxjNtMA@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] avocado-qemu: New SMMUv3 and intel IOMMU tests
To: Auger Eric <eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, peterx@redhat.com,
 Wainer Moschetta <wainersm@redhat.com>, Cleber Rosa Junior <crosa@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 5:17 PM Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Cleber, all,
>
> On 6/29/21 4:36 PM, Eric Auger wrote:
> > This series adds ARM SMMU and Intel IOMMU functional
> > tests using Fedora cloud-init images.
> >
> > ARM SMMU tests feature guests with and without RIL
> > (range invalidation support) using respectively fedora 33
> > and 31.  For each, we test the protection of virtio-net-pci
> > and virtio-block-pci devices. Also strict=no and passthrough
> > modes are tested. So there is a total of 6 tests.
> >
> > The series applies on top of Cleber's series:
> > - [PATCH 0/3] Acceptance Tests: support choosing specific
> >
> > Note:
> > - SMMU tests 2, 3, 5, 6 (resp. test_smmu_noril_passthrough and
> > test_smmu_noril_nostrict) pass but the log reports:
> > "WARN: Test passed but there were warnings during execution."
> > This seems due to the lack of hash when fetching the kernel and
> > initrd through fetch_asset():
> > WARNI| No hash provided. Cannot check the asset file integrity.
> I wanted to emphasize that point and wondered how we could fix that
> issue. Looks a pity the tests get tagged as WARN due to a lack of sha1.
> Any advice?

Hi Eric,

We had that discussion some weeks ago regarding the WARN status of a
test when the file hash is not provided for the fetch call. We agreed
that a WARN is not a harmful status, and it would be okay.

When we got the request to add the message regarding a missing hash of
a downloaded file, we concluded that it would not make sense to set it
like a normal message in the logs because no one would open the logs
and see the message if the test succeed.

If you think a WARN may be considered a harmful status, let us know,
and we can try to adjust it so that users see the message when a hash
is not provided without setting the test status as WARN.

On the other hand, you can always add the hash if you have access to it.

I hope it helps somehow,

Willian

>
> Best Regards
>
> Eric
> >
> > History:
> > v3 -> v4:
> > - I added Wainer's refactoring of KNOWN_DISTROS
> > into a class (last patch) and took into account his comments.
> >
> > v2 -> v3:
> > - Added Intel IOMMU tests were added. Different
> > operating modes are tested such as strict, caching mode, pt.
> >
> > Best Regards
> >
> > Eric
> >
> > The series and its dependencies can be found at:
> > https://github.com/eauger/qemu/tree/avocado-qemu-v4
> >
> > Eric Auger (3):
> >   Acceptance Tests: Add default kernel params and pxeboot url to the
> >     KNOWN_DISTROS collection
> >   avocado_qemu: Add SMMUv3 tests
> >   avocado_qemu: Add Intel iommu tests
> >
> > Wainer dos Santos Moschetta (1):
> >   avocado_qemu: Fix KNOWN_DISTROS map into the LinuxDistro class
> >
> >  tests/acceptance/avocado_qemu/__init__.py | 118 +++++++++++++------
> >  tests/acceptance/intel_iommu.py           | 115 +++++++++++++++++++
> >  tests/acceptance/smmu.py                  | 132 ++++++++++++++++++++++
> >  3 files changed, 332 insertions(+), 33 deletions(-)
> >  create mode 100644 tests/acceptance/intel_iommu.py
> >  create mode 100644 tests/acceptance/smmu.py
> >
>


