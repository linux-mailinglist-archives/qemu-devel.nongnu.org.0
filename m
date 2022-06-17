Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A422154FF86
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 23:53:39 +0200 (CEST)
Received: from localhost ([::1]:45276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2JuM-0005hS-Bd
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 17:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1o2JsR-00051G-RH
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 17:51:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1o2JsN-0004jQ-Ll
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 17:51:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655502693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/tuWSlwt0oMU6XKidLh6JcKtipDuYEi2BKCOFeeGBk=;
 b=Sy9tL6NkGMwOZ/16NtNskvnQYQ6cVgDoBc34LtMSMCnoRg7H7KdJ4VnsAKFIGl84YNg8Du
 /uZc2rBNC+e7eJD110wDofU6YeulnDHpuRkCx1FgOD/+PAV+Dh9efG+st8+1W26/CY9SHJ
 /zwgLKnr3h5l6x65kdtVAT5wBbtC4Gw=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-TNl4iamFPh6ERafBn0j7gw-1; Fri, 17 Jun 2022 17:51:32 -0400
X-MC-Unique: TNl4iamFPh6ERafBn0j7gw-1
Received: by mail-io1-f71.google.com with SMTP id
 p3-20020a6b8d03000000b00669c6d6c089so3203388iod.1
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 14:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=j/tuWSlwt0oMU6XKidLh6JcKtipDuYEi2BKCOFeeGBk=;
 b=XSA0WdkzJJgTDgrUYi9y5VGUgFPx5i8ucAkvigqgLS0BAHEVmruGE0DZhPbqIt6ljI
 fZaSR2GxwqVCmp78y1EdJn3p4qhsI7XriosQLaPYC0L+qDdwI07z2eI2w05+OYD0oxMc
 jcnsKnZRBlkSyKkoGX/OJeUnVdXpIiRQcT1yiHCL9oQ8uAVYRjQuIWlTzl2uxS2CKm9B
 aMzmJkKQXulQh+/sNmYUxdo3kvP1LVp+e1tdoi9JUrNx6HTbK86or+n+eU8+X8ReiWtR
 uPJ7qiacfNjt6Lqp/Qu3X2dLb38pYq8MtK0bmTjYXAYNKwlRSicnyuoi0SY9hCorj1jW
 FgVw==
X-Gm-Message-State: AJIora8//cvWdinO8TRvZi483jruBTeS65XlHWW8xEfzY7Mm7eG3UUB5
 MasCHoM1WmwYy5Kf3KcTUTrlW6tMP70di2MYaxE9g5KjgN8L/+sTDpPUSj7OmJVrTLXeSOD3W+A
 JBMzQsvcPpLwcOSs=
X-Received: by 2002:a05:6602:27cc:b0:5f0:876e:126b with SMTP id
 l12-20020a05660227cc00b005f0876e126bmr6151087ios.129.1655502691586; 
 Fri, 17 Jun 2022 14:51:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sX/qVRfLw+HxR5X3m83lvuk6oiO+QWui7ZEO8Ow4zH7iy5aiWJ+UOnN7LDGrYrCIuUsz24dw==
X-Received: by 2002:a05:6602:27cc:b0:5f0:876e:126b with SMTP id
 l12-20020a05660227cc00b005f0876e126bmr6151068ios.129.1655502691254; 
 Fri, 17 Jun 2022 14:51:31 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 o33-20020a027421000000b00331a211407fsm2693748jac.93.2022.06.17.14.51.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 14:51:30 -0700 (PDT)
Date: Fri, 17 Jun 2022 15:51:29 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Mark Bloch
 <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v2 00/11] vfio/migration: Implement VFIO migration
 protocol v2
Message-ID: <20220617155129.206749cb.alex.williamson@redhat.com>
In-Reply-To: <4973fad7-5e71-aa4c-dfbe-24da254f3cfa@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
 <a3c0e7ca-4707-5154-d270-c1034881462a@nvidia.com>
 <20220607153239.386fbed4.alex.williamson@redhat.com>
 <4973fad7-5e71-aa4c-dfbe-24da254f3cfa@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, 13 Jun 2022 14:21:26 +0300
Avihai Horon <avihaih@nvidia.com> wrote:

> On 6/8/2022 12:32 AM, Alex Williamson wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On Tue, 7 Jun 2022 20:44:23 +0300
> > Avihai Horon <avihaih@nvidia.com> wrote:
> > =20
> >> On 5/30/2022 8:07 PM, Avihai Horon wrote: =20
> >>> Hello,
> >>>
> >>> Following VFIO migration protocol v2 acceptance in kernel, this series
> >>> implements VFIO migration according to the new v2 protocol and replac=
es
> >>> the now deprecated v1 implementation.
> >>>
> >>> The main differences between v1 and v2 migration protocols are:
> >>> 1. VFIO device state is represented as a finite state machine instead=
 of
> >>>      a bitmap.
> >>>
> >>> 2. The migration interface with kernel is done using VFIO_DEVICE_FEAT=
URE
> >>>      ioctl and normal read() and write() instead of the migration reg=
ion
> >>>      used in v1.
> >>>
> >>> 3. Migration protocol v2 currently doesn't support the pre-copy phase=
 of
> >>>      migration.
> >>>
> >>> Full description of the v2 protocol and the differences from v1 can be
> >>> found here [1].
> >>>
> >>> Patches 1-3 are prep patches fixing bugs and adding QEMUFile function
> >>> that will be used later.
> >>>
> >>> Patches 4-6 refactor v1 protocol code to make it easier to add v2
> >>> protocol.
> >>>
> >>> Patches 7-11 implement v2 protocol and remove v1 protocol.
> >>>
> >>> Thanks.
> >>>
> >>> [1]
> >>> https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.c=
om/
> >>>
> >>> Changes from v1: https://lore.kernel.org/all/20220512154320.19697-1-a=
vihaih@nvidia.com/
> >>> - Split the big patch that replaced v1 with v2 into several patches as
> >>>     suggested by Joao, to make review easier.
> >>> - Change warn_report to warn_report_once when container doesn't suppo=
rt
> >>>     dirty tracking.
> >>> - Add Reviewed-by tag.
> >>>
> >>> Avihai Horon (11):
> >>>     vfio/migration: Fix NULL pointer dereference bug
> >>>     vfio/migration: Skip pre-copy if dirty page tracking is not suppo=
rted
> >>>     migration/qemu-file: Add qemu_file_get_to_fd()
> >>>     vfio/common: Change vfio_devices_all_running_and_saving() logic to
> >>>       equivalent one
> >>>     vfio/migration: Move migration v1 logic to vfio_migration_init()
> >>>     vfio/migration: Rename functions/structs related to v1 protocol
> >>>     vfio/migration: Implement VFIO migration protocol v2
> >>>     vfio/migration: Remove VFIO migration protocol v1
> >>>     vfio/migration: Reset device if setting recover state fails
> >>>     vfio: Alphabetize migration section of VFIO trace-events file
> >>>     docs/devel: Align vfio-migration docs to VFIO migration v2
> >>>
> >>>    docs/devel/vfio-migration.rst |  77 ++--
> >>>    hw/vfio/common.c              |  21 +-
> >>>    hw/vfio/migration.c           | 640 ++++++++----------------------=
----
> >>>    hw/vfio/trace-events          |  25 +-
> >>>    include/hw/vfio/vfio-common.h |   8 +-
> >>>    migration/migration.c         |   5 +
> >>>    migration/migration.h         |   3 +
> >>>    migration/qemu-file.c         |  34 ++
> >>>    migration/qemu-file.h         |   1 +
> >>>    9 files changed, 252 insertions(+), 562 deletions(-)
> >>> =20
> >> Ping. =20
> > Based on the changelog, this seems like a mostly cosmetic spin and I
> > don't see that all of the discussion threads from v1 were resolved to
> > everyone's satisfaction.  I'm certainly still uncomfortable with the
> > pre-copy behavior and I thought there were still some action items to
> > figure out whether an SLA is present and vet the solution with
> > management tools.  Thanks, =20
>=20
> Yes.
> OK, so let's clear things up and reach an agreement before I prepare the=
=20
> v3 series.
>=20
> There are three topics that came up in previous discussion:
>=20
>  1. [PATCH v2 01/11] vfio/migration: Fix NULL pointer dereference bug.
>     Juan gave his Reviewed-by but he wasn't sure about qemu_file_* usage
>     outside migration thread.
>     This code existed before and I fixed a NULL pointer dereference that
>     I encountered.
>     I suggested that later we can refactor VMChangeStateHandler to
>     return error.
>     I prefer not to do this refactor right now because I am not sure
>     it's as straightforward change as it might seem - if some notifier
>     fails and we abort do_vm_stop/vm_prepare_start in the middle, can
>     this leave the VM in some unstable state?
>     We plan to leave it as is and not do the refactor as part of this
>     series.
>     Are you ok with this?

I'll defer to Juan here, it's not 100% clear to me from the last reply
if he's looking for that sooner than later.  Juan?
=20
>  2. [PATCH v2 02/11] vfio/migration: Skip pre-copy if dirty page
>     tracking is not supported.
>     As previously discussed, this patch doesn't consider the configured
>     downtime limit.
>     One way to fix it is to allow such migration only when "no SLA" (no
>     downtime limit) is set. AFAIK today there is no way that one can set
>     "no SLA".
>     If we go with this option, we change normal flow of migration
>     (skipping pre-copy) and might need to change management tools.
>=20
> Instead, what about letting QEMU VFIO code mark all pages dirty (instead=
=20
> of kernel)?
> This way we don=E2=80=99t skip pre-copy and we get the same behavior we h=
ave now=20
> of perpetual dirtying all RAM, which respects SLA.
> If we go with this option, do we need to block migration when IOMMU is=20
> sPAPR TCE?
> Until now migration would be blocked because sPAPR TCE doesn't report=20
> dirty_pages_supported cap, but going with this option we will allow=20
> migration even when dirty_pages_supported cap is not set (and let QEMU=20
> dirty all pages).

It's ok by me if QEMU vfio is the one that marks all mapped pages dirty
if the host interface provides no way to do so.  Would we toggle that
based on whether the device has bus-master enabled?

Regarding SPAPR, I'd tend to think that if we're dirtying in QEMU then
nothing prevents us from implementing the same there, but also I'm not
going to stand in the way of simply disabling migration for that IOMMU
backend unless someone speaks up that they think it deserves parity.
=20
>  3. [PATCH v2 03/11] migration/qemu-file: Add qemu_file_get_to_fd().
>     Juan expressed his concern about the amount of data that will go
>     through main migration thread.
>=20
> This is already the case in v1 protocol - VFIO devices send all their=20
> data in the main migration thread. Note that like in v1 protocol, here=20
> as well the data is sent in small sized chunks, each with a header.
> This patch just aims to eliminate an extra copy.
>=20
> We plan to leave it as is. Is this ok?

I don't think we should lean too heavily on this being a bump from v1 to
v2 protocol as v1 was only ever experimental and hasn't been widely
used in practice AFAIK.  Again, I'll defer to the migration folks for
this, it requires their buy-in.  Thanks,

Alex


