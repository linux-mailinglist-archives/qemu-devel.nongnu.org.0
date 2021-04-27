Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D7936C97D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 18:32:33 +0200 (CEST)
Received: from localhost ([::1]:59320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbQdU-0006yK-RR
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 12:32:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dev.devaqemu@gmail.com>)
 id 1lbQbT-0005xr-C0
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:30:27 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:37840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dev.devaqemu@gmail.com>)
 id 1lbQbQ-0000M2-Lf
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 12:30:26 -0400
Received: by mail-io1-xd2f.google.com with SMTP id b10so2426505iot.4
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 09:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=2zQI2nCd5iRb5A4oS5Ml9guiLmo450XZu5d51bd3+ow=;
 b=JvqKnB7pWWC8yRq6Wmkcd27aREnk7B50NPIfhRavHk7e9C2ue67G4eD4Cd49xOtZqq
 zYHYC+qkizAQkokc8Pf8M3SX6JmILRH5IWv+/ORTW2l+nA6eiH8vb82F/NfAOkNgMg24
 o0ov39lZInjAI376H9sQqvVimBll+ObaiW43YjNmamLMxvkBY7GsSgynhrxcj5zoT3N2
 j4OdK/P91vhGfVpWEPdjMlhUsKVFs16KcWpUwWdxkRJHlwKWZujvnUgPODEXQDbf4/Ro
 EhiZhZ1c6z7Udm9Tfn4SkFN3Ce8Aijq/QG1EIqXDnlVtPrL2XYXt98fhR2s5yGtwWyL9
 9jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=2zQI2nCd5iRb5A4oS5Ml9guiLmo450XZu5d51bd3+ow=;
 b=hzwuUYnFwldnLmOqr+Y+b8n6PMhsocpKxrfbYtz5/7XsIBYUGZ5ZE6Q9tdchGHotG5
 Ng67DQW/ROFoshgfBS77HwNtfL8d1oYIaSGs2LmUuC0j7yDTMyprqmjri8/Md7QYecd6
 WnGxPBR/JuRd57GZqirZ/eKQZ5JucjwewmQaiKFNoWlI2iTcXUkVSl0mkd9Tu94iQ8jK
 PV1aa9gbgTSGpJnOGX3hdSbnPRoyHLFY9vZrbses9eN6OMsvaaP5C6uL9ggjmoFsuHKJ
 4iElmN4QcOIeYkbNrGX+XgaFikGYj4ORuWBMs0Ph1dUUBZsB7+PHsK5mOhEMNc3jowWI
 TVDQ==
X-Gm-Message-State: AOAM532bZFuq4FI06uaq1q7lVg9wq29DVYpES9MD5UqS2vucWXrp/E4J
 gDfsF2caIJpHafODWK2hz48Tzv6VbdSjw+hlTQM=
X-Google-Smtp-Source: ABdhPJxEBeZNOQ+w5t4NJRXGm6PMMWap5rKKhSatKAw1vSNt8jte9E6ZgRHEZWwnZajxv1yUPgi0JfxoHsWNVmZaNpE=
X-Received: by 2002:a6b:fa14:: with SMTP id p20mr19302332ioh.168.1619541023134; 
 Tue, 27 Apr 2021 09:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <CANsN3OTN5Q1DfhC01UGwh4nBEDXxb6=gLtWozh_oFUcc=Fd8DA@mail.gmail.com>
 <20210426152203.379dab00@redhat.com>
In-Reply-To: <20210426152203.379dab00@redhat.com>
From: Dev Audsin <dev.devaqemu@gmail.com>
Date: Tue, 27 Apr 2021 17:29:37 +0100
Message-ID: <CANsN3OQ4nr=CKXd_DFUAE7CeeOsgEkBBNb5n5vmNMM3P2+t-Cg@mail.gmail.com>
Subject: Re: [PATCH] make vfio and DAX cache work together
To: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 dgilbert@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=dev.devaqemu@gmail.com; helo=mail-io1-xd2f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex

Based on your comments and thinking a bit, wonder if it makes sense to
allow DMA map for the DAX cache but make unexpected mappings to be not
fatal. Please let me know your thoughts.

Dev

On Mon, Apr 26, 2021 at 10:22 PM Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> On Mon, 26 Apr 2021 21:50:38 +0100
> Dev Audsin <dev.devaqemu@gmail.com> wrote:
>
> > Hi Alex and David
> >
> > @Alex:
> >
> > Justification on why this region cannot be a DMA target for the device,
> >
> > virtio-fs with DAX is currently not compatible with NIC Pass through.
> > When a SR-IOV VF attaches to a qemu process, vfio will try to pin the
> > entire DAX Window but it is empty when the guest boots and will fail.
> > A method to make VFIO and DAX to work together is to make vfio skip
> > DAX cache.
> >
> > Currently DAX cache need to be set to 0, for the SR-IOV VF to be
> > attached to Kata containers. Enabling both SR-IOV VF and DAX work
> > together will potentially improve performance for workloads which are
> > I/O and network intensive.
>
> Sorry, there's no actual justification described here.  You're enabling
> a VM with both features, virtio-fs DAX and VFIO, but there's no
> evidence that they "work together" or that your use case is simply
> avoiding a scenario where the device might attempt to DMA into the area
> with this designation.  With this change, if the device were to attempt
> to DMA into this region, it would be blocked by the IOMMU, which might
> result in a data loss within the VM.  Justification of this change
> needs to prove that this region can never be a DMA target for the
> device, not simply that both features can be enabled and we hope that
> they don't interact.  Thanks,
>
> Alex
>

