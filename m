Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7202AEFF8
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 12:50:17 +0100 (CET)
Received: from localhost ([::1]:56150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcodk-00021V-JS
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 06:50:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kcocp-0001bC-7o
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:49:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kcocn-0008IJ-Bl
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 06:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605095356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YUU+CgOw8tfNjmRM7N/rnXb07RNYGYo0pmUFOW+dKX8=;
 b=CMJYSU7KEEFnHiHg9MOFwAos0VSMXuHu4dDiwblQl5oPNqthO+N9hFLdkEDD7X35q7yAja
 GJCbIrIuAW/NDor6gT/twnh9jItDsWoUo9hjnEx0v+a6VNa6ERMRQJy4JtZ58f+2f8Jbvk
 Yj3t02AWPyWB4KQ94uamFXN6N5GR2gc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-T4Q-vVxoMxCvsmxE5UDPzA-1; Wed, 11 Nov 2020 06:49:15 -0500
X-MC-Unique: T4Q-vVxoMxCvsmxE5UDPzA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6291C8015AD;
 Wed, 11 Nov 2020 11:49:13 +0000 (UTC)
Received: from gondolin (ovpn-113-72.ams2.redhat.com [10.36.113.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 223E16115F;
 Wed, 11 Nov 2020 11:48:55 +0000 (UTC)
Date: Wed, 11 Nov 2020 12:48:53 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201111124853.5a7fa359.cohuck@redhat.com>
In-Reply-To: <20201110131404.2c0f0d9d@w520.home>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <20201110131404.2c0f0d9d@w520.home>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
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
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>, "Zeng, Xin" <xin.zeng@intel.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christophe de Dinechin <dinechin@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10 Nov 2020 13:14:04 -0700
Alex Williamson <alex.williamson@redhat.com> wrote:

> On Tue, 10 Nov 2020 09:53:49 +0000
> Stefan Hajnoczi <stefanha@redhat.com> wrote:

> > Device models supported by an mdev driver and their details can be read from
> > the migration_info.json attr. Each mdev type supports one device model. If a
> > parent device supports multiple device models then each device model has an
> > mdev type. There may be multiple mdev types for a single device model when they
> > offer different migration parameters such as resource capacity or feature
> > availability.
> > 
> > For example, a graphics card that supports 4 GB and 8 GB device instances would
> > provide gfx-4GB and gfx-8GB mdev types with memory=4096 and memory=8192
> > migration parameters, respectively.  
> 
> 
> I think this example could be expanded for clarity.  I think this is
> suggesting we have mdev_types of gfx-4GB and gfx-8GB, which each
> implement some common device model, ie. com.gfx/GPU, where the
> migration parameter 'memory' for each defaults to a value matching the
> type name.  But it seems like this can also lead to some combinatorial
> challenges for management tools if these parameters are writable.  For
> example, should a management tool create a gfx-4GB device and change to
> memory parameter to 8192 or a gfx-8GB device with the default parameter?

I would expect that the mdev types need to match in the first place.
What role would the memory= parameter play, then? Allowing gfx-4GB to
have memory=8192 feels wrong to me.

(...)

> > An open mdev device typically does not allow migration parameters to be changed
> > at runtime. However, certain migration/params attrs may allow writes at
> > runtime. Usually these migration parameters only affect the device state
> > representation and not the hardware interface. This makes it possible to
> > upgrade or downgrade the device state representation at runtime so that
> > migration is possible to newer or older device implementations.  

This refers to generation of device implementations, but not to dynamic
configuration changes. Maybe I'm just confused by this sentence, but
how are we supposed to get changes while the mdev is live across?

> 
> 
> Which begs the question of how we'd determine which can be modified
> runtime...  Thanks,
> 
> Alex
> 
> 
And this as well. Do we need different categories?


