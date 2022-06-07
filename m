Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F100E541F31
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:48:02 +0200 (CEST)
Received: from localhost ([::1]:41156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhzV-0005oN-VL
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nygoi-0002WC-NL
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:32:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nygoe-0008N1-NP
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 17:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654637563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X4gU3jlR795b9AqEDzjnoUscWiV86QTuBIPYPRG8oBQ=;
 b=Zic9WZJuL34Fq5Axs0qRHIpLqt6ZmbaVAr4zIbvqHxLkrw36JfdLrrvwzBhTUooVgnrBCI
 BOWm+wW1yFcBQIGkdHggfy+FBbOAQAUcKL5j5I8awwqHddXSwE26qSh2Ow9Lpci3u7rwzh
 zgajhf23dMDQil7cBkg+SQjxd8VYVdc=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-hav7MhX5OM2yzMaeoCpBjg-1; Tue, 07 Jun 2022 17:32:42 -0400
X-MC-Unique: hav7MhX5OM2yzMaeoCpBjg-1
Received: by mail-io1-f71.google.com with SMTP id
 g12-20020a5e8b0c000000b006694b912e2bso3909121iok.6
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 14:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=X4gU3jlR795b9AqEDzjnoUscWiV86QTuBIPYPRG8oBQ=;
 b=SUHfnS54ZHepDd/e4g4f5BjjhfeDMLYVrjkF0VByzpJk2tNBX9bg3m6B2gKT13b25V
 UfXUgY25S5knE+pR4GcBzLXtuPWOlQY2bYmdv1sv2vrMvmopeEPmM84pzVVGqiqLSsqj
 bm3da20EmYBa09qo4zYFSinRIX5a5n/Rux836NCBIngO1C+W4ePx1IgYS7TABluQVVVu
 HsEcWqde73RPLSlS0QfAjOl31k9P8KwE3XHfa+ciGVniKrdTmAcKv0aqTR+2jGXNSi2Z
 ZXhiLUCcx5Z1V9T2ZyT/Gy8SWwlVWbQc0vs1MARRviK3EmTSnVjctFYHlC2PxYz0VKVi
 SGIA==
X-Gm-Message-State: AOAM530PU/lggqJCtYrlITKhw0CzaeiHkGF+auerfGw3nBgaqrvbwJcs
 z/7xUa2Hz2sOG/tcmajimRI+2QPHg72L58AzHT2lqogqNjkQRNOOlYwnIpfzK1T0ge3X90fKGal
 4BAgV7S54DEcDz2o=
X-Received: by 2002:a02:cc32:0:b0:331:76a7:bf36 with SMTP id
 o18-20020a02cc32000000b0033176a7bf36mr13600873jap.15.1654637561299; 
 Tue, 07 Jun 2022 14:32:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO4cX5iRcAeXduYsUrY7oNuX/eiEb2EA7z7+dcNVPoBeXe4napZEv9GAn4cznq3NL6I4XwHg==
X-Received: by 2002:a02:cc32:0:b0:331:76a7:bf36 with SMTP id
 o18-20020a02cc32000000b0033176a7bf36mr13600858jap.15.1654637561042; 
 Tue, 07 Jun 2022 14:32:41 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 x14-20020a026f0e000000b0032dd4094580sm7018480jab.49.2022.06.07.14.32.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 14:32:40 -0700 (PDT)
Date: Tue, 7 Jun 2022 15:32:39 -0600
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
Message-ID: <20220607153239.386fbed4.alex.williamson@redhat.com>
In-Reply-To: <a3c0e7ca-4707-5154-d270-c1034881462a@nvidia.com>
References: <20220530170739.19072-1-avihaih@nvidia.com>
 <a3c0e7ca-4707-5154-d270-c1034881462a@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 7 Jun 2022 20:44:23 +0300
Avihai Horon <avihaih@nvidia.com> wrote:

> On 5/30/2022 8:07 PM, Avihai Horon wrote:
> > Hello,
> >
> > Following VFIO migration protocol v2 acceptance in kernel, this series
> > implements VFIO migration according to the new v2 protocol and replaces
> > the now deprecated v1 implementation.
> >
> > The main differences between v1 and v2 migration protocols are:
> > 1. VFIO device state is represented as a finite state machine instead of
> >     a bitmap.
> >
> > 2. The migration interface with kernel is done using VFIO_DEVICE_FEATURE
> >     ioctl and normal read() and write() instead of the migration region
> >     used in v1.
> >
> > 3. Migration protocol v2 currently doesn't support the pre-copy phase of
> >     migration.
> >
> > Full description of the v2 protocol and the differences from v1 can be
> > found here [1].
> >
> > Patches 1-3 are prep patches fixing bugs and adding QEMUFile function
> > that will be used later.
> >
> > Patches 4-6 refactor v1 protocol code to make it easier to add v2
> > protocol.
> >
> > Patches 7-11 implement v2 protocol and remove v1 protocol.
> >
> > Thanks.
> >
> > [1]
> > https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/
> >
> > Changes from v1: https://lore.kernel.org/all/20220512154320.19697-1-avihaih@nvidia.com/
> > - Split the big patch that replaced v1 with v2 into several patches as
> >    suggested by Joao, to make review easier.
> > - Change warn_report to warn_report_once when container doesn't support
> >    dirty tracking.
> > - Add Reviewed-by tag.
> >
> > Avihai Horon (11):
> >    vfio/migration: Fix NULL pointer dereference bug
> >    vfio/migration: Skip pre-copy if dirty page tracking is not supported
> >    migration/qemu-file: Add qemu_file_get_to_fd()
> >    vfio/common: Change vfio_devices_all_running_and_saving() logic to
> >      equivalent one
> >    vfio/migration: Move migration v1 logic to vfio_migration_init()
> >    vfio/migration: Rename functions/structs related to v1 protocol
> >    vfio/migration: Implement VFIO migration protocol v2
> >    vfio/migration: Remove VFIO migration protocol v1
> >    vfio/migration: Reset device if setting recover state fails
> >    vfio: Alphabetize migration section of VFIO trace-events file
> >    docs/devel: Align vfio-migration docs to VFIO migration v2
> >
> >   docs/devel/vfio-migration.rst |  77 ++--
> >   hw/vfio/common.c              |  21 +-
> >   hw/vfio/migration.c           | 640 ++++++++--------------------------
> >   hw/vfio/trace-events          |  25 +-
> >   include/hw/vfio/vfio-common.h |   8 +-
> >   migration/migration.c         |   5 +
> >   migration/migration.h         |   3 +
> >   migration/qemu-file.c         |  34 ++
> >   migration/qemu-file.h         |   1 +
> >   9 files changed, 252 insertions(+), 562 deletions(-)
> >  
> Ping.

Based on the changelog, this seems like a mostly cosmetic spin and I
don't see that all of the discussion threads from v1 were resolved to
everyone's satisfaction.  I'm certainly still uncomfortable with the
pre-copy behavior and I thought there were still some action items to
figure out whether an SLA is present and vet the solution with
management tools.  Thanks,

Alex


