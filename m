Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EF8539867
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 23:06:44 +0200 (CEST)
Received: from localhost ([::1]:35152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw94d-0000Fr-Ed
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 17:06:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nw91a-0007PR-Q9
 for qemu-devel@nongnu.org; Tue, 31 May 2022 17:03:34 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:41435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1nw91T-0005Fw-Vq
 for qemu-devel@nongnu.org; Tue, 31 May 2022 17:03:30 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-f33f0f5b1dso36440fac.8
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 14:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=45IJ6b3w/g/LPQ7i0uQb5k2aI1IGkb2JirU07MWWxBM=;
 b=b99u5VUZk8ys0X4+q+Ao4Ird2M/J/h+HWKF0OrBPqELr+sPHDv7pIVhBq25ByTXAtw
 Q/Pesf6CN7uxk4JLPwvaRe+9qsVSMVUjsAMT6gHijk+7YXec2WIRMX9ZdTJ4u2SuKWmM
 eG2Fry/l8ZbEV7ma/2hiwMj7HB7pg4W779MpQZOy3NtW5NbD+mHIE7TQnHmC6ADwypTE
 6zc4hk/lkADnws2Rr3L0/Rx4UO2hcDo/kWUUCGuzhNkrAaNEzEKYPFtpQxRGViJRHpVd
 vg7uVVflijluKTDCg4wZxdLhJyMRXTCzykOjpMcPMqYEwEWwQYDtB2x/xv7qxAoWnAYb
 6uLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=45IJ6b3w/g/LPQ7i0uQb5k2aI1IGkb2JirU07MWWxBM=;
 b=pX4ZxbM/mXlbXS4XhN7vkkVGLxBdgcjv7L6Z6Y48iowflc9OuRYJ3lEAQdDgQQbUrO
 dnLoE673S9/FqMYn7i7zWU+7Zl64qvFwqVWlDbNr3rtqw46ndgRi0k7h0t520+n9CSU8
 meh8awFtyjiM50L1zEYm8vkPxgCXqem+6VihqzAVu76PADgljPiLMmvduvoWOS7N8e0f
 quLF8SRdiB1bKtnJMtOTS4CUaiY9rJOnYjpvzD+d9Hv3RYRIlSNHykbwvtrYiUNMLYgJ
 2+aGqQADJpb9/dI+oGkE8P5AUZwzsVYLb8eTTUvr9Wb5o41TvnZWKinPd03bv5W/ehee
 jAaw==
X-Gm-Message-State: AOAM533dQihyQItAbzLW1ByWkz+M9GtUWIzsPgK1vRhAwknLJ4chOgjo
 E2uGJP+1Un4uatWo1sEmMU/aOEWqM/V2HsYZrgM=
X-Google-Smtp-Source: ABdhPJz/BTPNyhZfGR6FsGMdoozfc3rFF4r1s+tYG8WOwpzSpP5/bjPKI0LD8C1g043O5S9K4juGYv08v9ZRU5y41L0=
X-Received: by 2002:a05:6870:e30e:b0:de:ab76:eed7 with SMTP id
 z14-20020a056870e30e00b000deab76eed7mr14550263oad.101.1654031006243; Tue, 31
 May 2022 14:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1653404595.git.jag.raman@oracle.com>
 <2a492c16e0464f70f7be1fd9c04172f4f18d14ca.1653404595.git.jag.raman@oracle.com>
 <Yo5DBb8i5SMbDKnq@stefanha-x1.localdomain>
 <E6AB9FA3-6580-44C6-93FA-AFC19477C296@oracle.com>
 <20220531141046.04b448e5.alex.williamson@redhat.com>
In-Reply-To: <20220531141046.04b448e5.alex.williamson@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 31 May 2022 22:03:14 +0100
Message-ID: <CAJSP0QU13=fLTVEjE1JbkOef5im4Dwb8x3xhpYYd7KPRJjav_Q@mail.gmail.com>
Subject: Re: [PATCH v10 13/14] vfio-user: handle device interrupts
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Jag Raman <jag.raman@oracle.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, 
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>, 
 "bleal@redhat.com" <bleal@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "eduardo@habkost.net" <eduardo@habkost.net>, 
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, 
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>, 
 "peterx@redhat.com" <peterx@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>, 
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, 
 John Johnson <john.g.johnson@oracle.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=stefanha@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 May 2022 at 21:11, Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> On Tue, 31 May 2022 15:01:57 +0000
> Jag Raman <jag.raman@oracle.com> wrote:
>
> > > On May 25, 2022, at 10:53 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >
> > > On Tue, May 24, 2022 at 11:30:32AM -0400, Jagannathan Raman wrote:
> > >> Forward remote device's interrupts to the guest
> > >>
> > >> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > >> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > >> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > >> ---
> > >> include/hw/pci/pci.h              |  13 ++++
> > >> include/hw/remote/vfio-user-obj.h |   6 ++
> > >> hw/pci/msi.c                      |  16 ++--
> > >> hw/pci/msix.c                     |  10 ++-
> > >> hw/pci/pci.c                      |  13 ++++
> > >> hw/remote/machine.c               |  14 +++-
> > >> hw/remote/vfio-user-obj.c         | 123 ++++++++++++++++++++++++++++++
> > >> stubs/vfio-user-obj.c             |   6 ++
> > >> MAINTAINERS                       |   1 +
> > >> hw/remote/trace-events            |   1 +
> > >> stubs/meson.build                 |   1 +
> > >> 11 files changed, 193 insertions(+), 11 deletions(-)
> > >> create mode 100644 include/hw/remote/vfio-user-obj.h
> > >> create mode 100644 stubs/vfio-user-obj.c
> > >
> > > It would be great if Michael Tsirkin and Alex Williamson would review
> > > this.
> >
> > Hi Michael and Alex,
> >
> > Do you have any thoughts on this patch?
>
> Ultimately this is just how to insert callbacks to replace the default
> MSI/X triggers so you can send a vector# over the wire for a remote
> machine, right?  I'll let the code owners, Michael and Marcel, comment
> if they have grand vision how to architect this differently.  Thanks,

An earlier version of the patch intercepted MSI-X at the msix_notify()
level, replacing the entire function. This patch replaces
msix_get_message() and msi_send_message(), leaving the masking logic
in place.

I haven't seen the latest vfio-user client implementation for QEMU,
but if the idea is to allow the guest to directly control the
vfio-user device's MSI-X table's mask bits, then I think this is a
different design from VFIO kernel where masking is emulated by QEMU
and not passed through to the PCI device.

It's been a while since I looked at how this works in QEMU's hw/vfio/
code, so I may not be explaining it correctly, but I think there is a
design difference here between VFIO kernel and vfio-user that's worth
evaluating.

Stefan

