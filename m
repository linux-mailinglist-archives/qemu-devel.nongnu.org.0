Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F10618539
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:49:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqdOx-0004b0-DU; Thu, 03 Nov 2022 12:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oqdOu-0004Rf-El
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:49:08 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oqdOs-0004zV-UM
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 12:49:08 -0400
Received: by mail-io1-xd2e.google.com with SMTP id e189so1850756iof.1
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 09:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mFidC94FphFLroluTYKiif/ifj3k7XCv0hyfo6j43+s=;
 b=td70erkM7itMDc+etrxW+ImghSrcikf0AhnNhyA14VjCjsfYEJvw3T1kWTDRQ/8pN5
 rNtvhBybpqPYEGhVmA2a+StCqDliosG87DHqpfC6qEa1Dhvgw4hVZ/U3DClElISyJidm
 t/czlRaDemdSPIFUW5HT1sFK0OeO3Vp0X2J1QPlYl1wmDsEJdvcnlHuy+F1qwJS87JpD
 s+FgVgFZ9W8hl0R6l1BQq2gdKvaN/qafnilhgFX7QHsIklJpzi4s10TNKhtjDzdnSgsU
 2n6X07RvNVOz3j4dvWhmw6+yjCpUPZGIcphv6u2vSXmlQrVCvJnigIxEtDmhv0AofUF/
 u0Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mFidC94FphFLroluTYKiif/ifj3k7XCv0hyfo6j43+s=;
 b=eOnO8NSuxhNSX3BOFtVvqjVuQoPlcTdcyQsNT/6yVlmxqYf/2MDs619FYkio0g9mxE
 CLbHAm59L/bLK0RElPPB0wjpJNhjI2/SStie8ATA/2pKUkRXksH9e6DiDoiH+vi0lVjK
 c545Ut9h1SeeVZ4wkix1685LvNOXuOIzv+jwik5kukEE//MXy3Zzu/gHZQfLtqI20/hR
 a8aUGszLINsFG+zRuP2tsg/H8WTdOZH5g3XbHx2QrK/ajwb/CU0RF2Q4yQ7ZR4XU72wH
 Zy12iKIsaJ6t/CdZS4H16pi0ZrNLvmNCVQRjXjKIyal+RYlcLUl+0j38dNEYWJRQz2RQ
 5Ukg==
X-Gm-Message-State: ACrzQf3uKm9sSUOagigYn3vPX5sqao++N36pGNE54SNckzaw9/s1Bhy3
 koYvtK8OtMasMUyj/bjuAGYlG2dpBkkHhfpqGU6sXg==
X-Google-Smtp-Source: AMsMyM4orUY1Fd1WKIsVVK6ZZqO200BfrGo63fwrxFtrQwgHOuuiy9oqWwNEZS3NEk5LAERu51vKJylE/skGr3GO7pg=
X-Received: by 2002:a05:6638:25ca:b0:363:e467:3d7d with SMTP id
 u10-20020a05663825ca00b00363e4673d7dmr19883028jat.174.1667494145210; Thu, 03
 Nov 2022 09:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
 <20221103154208.91501-1-ani@anisinha.ca>
 <CAARzgwzc66yTTSiKT6Q4-hGZ2m1jcuy8d9D_NjacVpCMut=3tw@mail.gmail.com>
In-Reply-To: <CAARzgwzc66yTTSiKT6Q4-hGZ2m1jcuy8d9D_NjacVpCMut=3tw@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 3 Nov 2022 22:18:54 +0530
Message-ID: <CAARzgwxTpKmAqb7K7MzKG8MF6q3U8=z4nbxGoK-0b-rxPSvz+Q@mail.gmail.com>
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
To: philmd@linaro.org
Cc: mst@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org, 
 stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 3, 2022 at 10:17 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Thu, Nov 3, 2022 at 9:12 PM Ani Sinha <ani@anisinha.ca> wrote:
> >
> > > To pull this image:
> >
> > > $ docker pull registry.gitlab.com/qemu-project/qemu/fedora:latest
> >
> > Actually the URL is:
> >
> > $ docker pull registry.gitlab.com/qemu-project/qemu/qemu/fedora:latest
> >
> > > (or to be sure to pull the very same:)
> >
> > > $ docker pull
> > > registry.gitlab.com/qemu-project/qemu/fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d26
> >
> > Same here,
> >
> > registry.gitlab.com/qemu-project/qemu/qemu/fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d26
>
> I pulled this container, used the configure line Stefan mentioned
> earlier in the thread and re-ran make check-qtest and still could not
> repro the crash. All tests pass.
>

[root@6089e5581e63 build]# git status
On branch master
Your branch is ahead of 'origin/master' by 82 commits.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
[root@6089e5581e63 build]# git log --oneline -1
77dd1e2b09 (HEAD -> master, tag: for_upstream, tag: for_autotest_next,
tag: for_autotest, mst/pci, mst/next) intel-iommu: PASID support
[root@6089e5581e63 build]# git log --oneline -5
77dd1e2b09 (HEAD -> master, tag: for_upstream, tag: for_autotest_next,
tag: for_autotest, mst/pci, mst/next) intel-iommu: PASID support
a0f831c879 intel-iommu: convert VTD_PE_GET_FPD_ERR() to be a function
840d70c49b intel-iommu: drop VTDBus
c89dbf5551 intel-iommu: don't warn guest errors when getting rid2pasid entry
d8ebe4ce22 vfio: move implement of vfio_get_xlat_addr() to memory.c
[root@6089e5581e63 build]#

