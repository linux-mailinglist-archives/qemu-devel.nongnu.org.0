Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A962AE092
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 21:16:45 +0100 (CET)
Received: from localhost ([::1]:39322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kca4K-0003xj-F5
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 15:16:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kca29-0002MD-1k
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:14:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1kca24-0005sE-BE
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:14:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605039261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gidIgEU2gggxeu7BAUBcAK9OfhZVKpbClbdKvib9qb0=;
 b=D0ZOfVvLcbk2W19K5iIqE96qyVwvqVm1mwVMktEipTiQb0CXQAv58NUCd6V36a2NvnBvFd
 7PdVs6oEmFJyqaudKKa+LMeaafEeDTbDbAVyumEZFMVMPz0YifzxMZw2e/SPtdqkRzcaq0
 dakgXl4DG8Lj/MmgudhiivEJ4LEnkYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-oVZ5e3HoM_C5LoeZT45Prg-1; Tue, 10 Nov 2020 15:14:16 -0500
X-MC-Unique: oVZ5e3HoM_C5LoeZT45Prg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC7A41882FA0;
 Tue, 10 Nov 2020 20:14:14 +0000 (UTC)
Received: from w520.home (ovpn-112-213.phx2.redhat.com [10.3.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0720D5D9D2;
 Tue, 10 Nov 2020 20:14:04 +0000 (UTC)
Date: Tue, 10 Nov 2020 13:14:04 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201110131404.2c0f0d9d@w520.home>
In-Reply-To: <20201110095349.GA1082456@stefanha-x1.localdomain>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, quintela@redhat.com,
 Jason Wang <jasowang@redhat.com>, "Zeng, 
 Xin" <xin.zeng@intel.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 09:53:49 +0000
Stefan Hajnoczi <stefanha@redhat.com> wrote:
> VFIO mdev Drivers
> -----------------
> The following mdev type sysfs attrs are available for managing device
> instances::
> 
>   /sys/.../<parent-device>/mdev_supported_types/<type-id>/
>     create - writing a UUID to this file instantiates a device
>     migration_info.json - read-only migration information JSON
> 
> TODO The JSON can be represented as a file system hierarchy but sysfs seems
> limited to <kobject>/<group>/<attr> and <kobject>/<attr> so it is not possible
> to express deeper attr groups like <kobject>/migration/params/<param>/<attr>?


Complex structured formats have been proposed in other threads related
to migration compatibility and generally been dismissed as not adhering
to the standards of sysfs per:

Documentation/filesystems/sysfs.rst:
---
Attributes
~~~~~~~~~~

Attributes can be exported for kobjects in the form of regular files in
the filesystem. Sysfs forwards file I/O operations to methods defined
for the attributes, providing a means to read and write kernel
attributes.

Attributes should be ASCII text files, preferably with only one value
per file. It is noted that it may not be efficient to contain only one
value per file, so it is socially acceptable to express an array of
values of the same type.

Mixing types, expressing multiple lines of data, and doing fancy
formatting of data is heavily frowned upon. Doing these things may get
you publicly humiliated and your code rewritten without notice.
---

We'd either need to address your TODO and create a hierarchical
representation or find another means to exchange this format.


> Device models supported by an mdev driver and their details can be read from
> the migration_info.json attr. Each mdev type supports one device model. If a
> parent device supports multiple device models then each device model has an
> mdev type. There may be multiple mdev types for a single device model when they
> offer different migration parameters such as resource capacity or feature
> availability.
> 
> For example, a graphics card that supports 4 GB and 8 GB device instances would
> provide gfx-4GB and gfx-8GB mdev types with memory=4096 and memory=8192
> migration parameters, respectively.


I think this example could be expanded for clarity.  I think this is
suggesting we have mdev_types of gfx-4GB and gfx-8GB, which each
implement some common device model, ie. com.gfx/GPU, where the
migration parameter 'memory' for each defaults to a value matching the
type name.  But it seems like this can also lead to some combinatorial
challenges for management tools if these parameters are writable.  For
example, should a management tool create a gfx-4GB device and change to
memory parameter to 8192 or a gfx-8GB device with the default parameter?


> The following mdev device sysfs attrs relate to a specific device instance::
> 
>   /sys/.../<parent-device>/<uuid>/
>     mdev_type/ - symlink to mdev type sysfs attrs, e.g. to fetch migration/model


We need a mechanism that translates to non-mdev vfio devices as well,
the device "model" creates a clean separation from an mdev-type, we
shouldn't reintroduce that dependency here.


>     migration/ - migration related files
>       <param> - read/write migration parameter "param"
>       ...
> 
> When the device is created all migration/<param> attrs take their
> migration_info.json "init_value".
> 
> When preparing for migration on the source, each migration parameter from
> migration/<param> is read and added to the migration parameter list if its
> value differs from "off_value" in migration_info.json. If a migration parameter
> in the list is not available on the destination, then migration is not
> possible. If a migration parameter value is not in the destination
> "allowed_values" migration_info.json then migration is not possible.
> 
> In order to prepare an mdev device instance for an incoming migration on the
> destination, the "off_value" from migration_info.json is written to each
> migration parameter in migration/<param>. Then the migration parameter list
> from the source is written to migration/<param> one migration parameter at a
> time. If an error occurs while writing a migration parameter on the destination
> then migration is not possible. Once the migration parameter list has been
> written the mdev can be opened and migration can proceed.


What's the logic behind setting the value twice?  If we have a
preconfigured pool of devices where the off_value might use less
resources, we risk that resources might be consumed elsewhere if we
release them and try to get them back.  It also seems rather
inefficient.

 
> An open mdev device typically does not allow migration parameters to be changed
> at runtime. However, certain migration/params attrs may allow writes at
> runtime. Usually these migration parameters only affect the device state
> representation and not the hardware interface. This makes it possible to
> upgrade or downgrade the device state representation at runtime so that
> migration is possible to newer or older device implementations.


Which begs the question of how we'd determine which can be modified
runtime...  Thanks,

Alex


