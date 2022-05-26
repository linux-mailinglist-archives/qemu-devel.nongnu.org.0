Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9535353538B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 20:46:57 +0200 (CEST)
Received: from localhost ([::1]:55206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuIVc-0001zN-7w
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 14:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nuITN-00015H-Rb
 for qemu-devel@nongnu.org; Thu, 26 May 2022 14:44:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nuITL-0006C9-NJ
 for qemu-devel@nongnu.org; Thu, 26 May 2022 14:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653590674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CRHkmRTcvTPSWGv65FtwrjcErA+xpKN4ggKr7FDdxbI=;
 b=LXsuK6DRdhcYzEqYevzK9VyhvbPl40qItOkaCsH2VdPvZtalgvXfS+pes/MbQ9RfH9O2Sg
 lPX9VtVHEHthwKpOFhZJgVqn5UIJIVAohevlo2HbUhB/W9v5wvyEaZNlyt3mAIeJwqqNZF
 KiCbgC9n5J/m4m8V7RGuJXuyv00mKdY=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-Y8It5EfmMQWknunj6g3CtQ-1; Thu, 26 May 2022 14:44:30 -0400
X-MC-Unique: Y8It5EfmMQWknunj6g3CtQ-1
Received: by mail-io1-f71.google.com with SMTP id
 k17-20020a5d9d51000000b006653f2bc513so1494230iok.10
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 11:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=CRHkmRTcvTPSWGv65FtwrjcErA+xpKN4ggKr7FDdxbI=;
 b=s2/h6NFjkvT4991VBn88vOQn87vUvjea8b3DRa5JKq1i9rBcuY4unQ8PUwHZiNxyV+
 ptYmVh5iuDXIpUqY0LNBug4cH1EN6ZXbhAgqYc7SkLaSLyLpAl0WhSm3wtOol9AryJQb
 WJehEPHWWGxN8wWq7ZW6oSxZfRqMU58px6xkTxIupEoen9SIXwPIiHmdY1CynW98SYs2
 Bn4B+vUV4GKtM/nImSBuUNcBZq8V9oq871up+tdq9Fqg5Xcr98TQCZKqb3qAe/2HqZfb
 HkZY5SyHU9gYus8BS3M+XFRlk10OGwvQcmgWB3mWww3SjIFQI2iWTcAru9QeuuxGdgX0
 Rcow==
X-Gm-Message-State: AOAM533/WDdA4IuvnCrB/cTdfKrTQhDsQVzqA74oaKIPe8mws5OBZvJE
 CIQXKFW7pmsQc7YqK7CFAhBNp8mBEoEB6CZgHk12urUvuuFvtxTrHX/rVmMqz5xfqiidFIT4H1t
 OemVMJcm6ogFYfAk=
X-Received: by 2002:a05:6e02:1bce:b0:2d1:3fd2:645d with SMTP id
 x14-20020a056e021bce00b002d13fd2645dmr19225684ilv.299.1653590669523; 
 Thu, 26 May 2022 11:44:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuAwLgGTBn0DpSCQJoArJx94rU7AS5W4FESJgAI+I9Ow4z8VXfVVbQ5zQYmSnZ9R6NFZAm3Q==
X-Received: by 2002:a05:6e02:1bce:b0:2d1:3fd2:645d with SMTP id
 x14-20020a056e021bce00b002d13fd2645dmr19225659ilv.299.1653590668917; 
 Thu, 26 May 2022 11:44:28 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 y189-20020a6bc8c6000000b006657596977fsm601728iof.4.2022.05.26.11.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 11:44:28 -0700 (PDT)
Date: Thu, 26 May 2022 12:44:27 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Lei Rao <lei.rao@intel.com>
Cc: kevin.tian@intel.com, eddie.dong@intel.com, jason.zeng@intel.com,
 quintela@redhat.com, dgilbert@redhat.com, yadong.li@intel.com,
 yi.l.liu@intel.com, qemu-devel@nongnu.org
Subject: Re: [RFC PATCH 00/13] Add a plugin to support out-of-band live
 migration for VFIO pass-through device
Message-ID: <20220526124427.3f23708f.alex.williamson@redhat.com>
In-Reply-To: <20220524061848.1615706-1-lei.rao@intel.com>
References: <20220524061848.1615706-1-lei.rao@intel.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
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

On Tue, 24 May 2022 14:18:35 +0800
Lei Rao <lei.rao@intel.com> wrote:

> Migration of a VFIO passthrough device can be supported by using a device 
> specific kernel driver to save/restore the device state thru device specific 
> interfaces. But this approach doesn't work for devices that lack a state 
> migration interface, e.g. NVMe.
> 
> On the other hand, Infrastructure Process Unit (IPU) or Data Processing Unit 
> (DPU) vendors may choose to implement an out-of-band interface from the SoC to 
> help manage the state of such non-migratable devices e.g. via gRPC or JSON-RPC 
> protocols.
> 
> This RFC attempts to support such out-of-band migration interface by introducing
> the concept of migration backends in vfio. The existing logic around vfio 
> migration uAPI is now called the 'local' backend while a new 'out-of-band' 
> backend is further introduced allowing vfio to redirect VMState ops to an 
> external plugin.
> 
> Currently, the backend migration Ops is defined close to SaveVMHandlers. We also
> considered whether there is value of abstracting it in a lower level e.g. close 
> to vfio migration uAPI but no clear conclusion. Hence this is one part which 
> we'd like to hear suggestions.
> 
> This proposal adopts a plugin mechanism (an example can be found in [1]) given 
> that IPU/DPU vendors usually implement proprietary migration interfaces without
> a standard. But we are also open if an alternative option makes better sense,
> e.g. via loadable modules (with Qemu supporting gRPC or JSON-RPC support) or an
> IPC mechanism similar to vhost-user.

AFAIU, QEMU is not interested in supporting plugin modules, especially
proprietary ones.  I don't see that a case has really been made that
this cannot be done in-band, through a vfio-pci variant driver,
possibly making use of proprietary interfaces to a userspace agent if
necessary (though please don't ask such to be accepted in-tree for the
kernel either).  A vfio-user device server might also host such
proprietary, device specific agents while supporting the standard,
in-band migration interface.  Thanks,

Alex

> 
> The following graph describes the overall component relationship:
> 
>  +----------------------------------------------------+
>  | QEMU                                               |
>  | +------------------------------------------------+ |
>  | |        VFIO Live Migration Framework           | |
>  | |    +--------------------------------------+    | |
>  | |    |         VFIOMigrationOps             |    | |
>  | |    +-------^---------------------^--------+    | |
>  | |            |                     |             | |
>  | |    +-------v-------+     +-------v--------+    | |
>  | |    | LM Backend Via|     | LM Backend Via |    | |
>  | |    |   Device Fd   |     |    Plugins     |    | |
>  | |    +-------^-------+     |     +----------+    | |
>  | |            |             |     |Plugin Ops+----+-+------------+
>  | |            |             +-----+----------+    | |            |
>  | |            |                                   | |  +---------v----------+
>  | +------------+-----------------------------------+ |  |  Vendor Specific   |
>  |              |                                     |  |    Plugins(.so)    |
>  +--------------+-------------------------------------+  +----------+---------+
>   UserSpace     |                                                   |
> ----------------+---------------------------------------------      |
>   Kernel        |                                                   |
>                 |                                                   |
>      +----------v----------------------+                            |
>      |        Kernel VFIO Driver       |                            |
>      |    +-------------------------+  |                            |
>      |    |                         |  |                            | Network
>      |    | Vendor-Specific Driver  |  |                            |
>      |    |                         |  |                            |
>      |    +----------^--------------+  |                            |
>      |               |                 |                            |
>      +---------------+-----------------+                            |
>                      |                                              |
>                      |                                              |
> ---------------------+-----------------------------------------     |
>   Hardware           |                                              |
>                      |            +-----+-----+-----+----+-----+    |
>           +----------v------+     | VF0 | VF1 | VF2 | ...| VFn |    |
>           |   Traditional   |     +-----+-----+-----+----+-----+    |
>           |  PCIe Devices   |     |                            |    |
>           +-----------------+     |   +--------+------------+  |    |
>                                   |   |        |   Agent    |<-+----+
>                                   |   |        +------------+  |
>                                   |   |                     |  |
>                                   |   | SOC                 |  |
>                                   |   +---------------------+  |
>                                   | IPU                        |
>                                   +----------------------------+
> 
> Two command-line parameters (x-plugin-path and x-plugin-arg) are introduced to 
> enable the out-of-band backend. If specified, vfio will attempt to use the 
> out-of-band backend.
> 
> The following is an example of VFIO command-line parameters for OOB-Approach:
> 
>   -device vfio-pci,id=$ID,host=$bdf,x-enable-migration,x-plugin-path=$plugin_path,x-plugin-arg=$plugin_arg
> 
> [1] https://github.com/raolei-intel/vfio-lm-plugin-example.git
> 
> Lei Rao (13):
>   vfio/migration: put together checks of migration initialization
>     conditions
>   vfio/migration: move migration struct allocation out of
>     vfio_migration_init
>   vfio/migration: move vfio_get_dev_region_info out of
>     vfio_migration_probe
>   vfio/migration: Separated functions that relate to the In-Band
>     approach
>   vfio/migration: rename functions that relate to the In-Band approach
>   vfio/migration: introduce VFIOMigrationOps layer in VFIO live
>     migration framework
>   vfio/migration: move the statistics of bytes_transferred to generic
>     VFIO migration layer
>   vfio/migration: split migration handler registering from
>     vfio_migration_init
>   vfio/migration: move the functions of In-Band approach to a new file
>   vfio/pci: introduce command-line parameters to specify migration
>     method
>   vfio/migration: add a plugin layer to support out-of-band live
>     migration
>   vfio/migration: add some trace-events for vfio migration plugin
>   vfio/migration: make the region and plugin member of struct
>     VFIOMigration to be a union
> 
>  docs/devel/vfio-migration-plugin.rst    | 165 +++++++
>  hw/vfio/meson.build                     |   2 +
>  hw/vfio/migration-local.c               | 456 +++++++++++++++++++
>  hw/vfio/migration-plugin.c              | 266 +++++++++++
>  hw/vfio/migration.c                     | 577 ++++++------------------
>  hw/vfio/pci.c                           |   2 +
>  hw/vfio/trace-events                    |   9 +-
>  include/hw/vfio/vfio-common.h           |  37 +-
>  include/hw/vfio/vfio-migration-plugin.h |  21 +
>  9 files changed, 1096 insertions(+), 439 deletions(-)
>  create mode 100644 docs/devel/vfio-migration-plugin.rst
>  create mode 100644 hw/vfio/migration-local.c
>  create mode 100644 hw/vfio/migration-plugin.c
>  create mode 100644 include/hw/vfio/vfio-migration-plugin.h
> 


