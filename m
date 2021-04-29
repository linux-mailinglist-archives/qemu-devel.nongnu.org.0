Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FFB36EE04
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 18:19:44 +0200 (CEST)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc9OB-0002he-Hc
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 12:19:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lc9Lc-0001aa-AO
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 12:17:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lc9LS-0001SJ-5w
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 12:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619713013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HapZKEZiNvlEuawnIMUGvLRfG2i94hyNhLPFF9EFYrg=;
 b=exNoXNXOorSmUs6RwvXIt1J9CcgtGFcHDLd27id+xSk8tyilLQeDHyjb5aJSni+SMwLtYj
 eQOhfGcJWPlVNgkZGs9SQHcPX8p9V2VCGFAGyKiJ82oIykEN5KNMDpe1NCHSTcYQ+F5+6f
 zBJp21QfH2yqY/W851nZUaeq5H1qEEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-IfCfhGhtN3aHo7NuoywkHA-1; Thu, 29 Apr 2021 12:16:51 -0400
X-MC-Unique: IfCfhGhtN3aHo7NuoywkHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB8EEFC8D;
 Thu, 29 Apr 2021 16:16:34 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE6166E6F8;
 Thu, 29 Apr 2021 16:16:31 +0000 (UTC)
Date: Thu, 29 Apr 2021 18:16:28 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtio-blk: drop deprecated scsi=on|off property
Message-ID: <YIrb3IboF11GJ2nm@angien.pipo.sk>
References: <20210429155221.1226561-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210429155221.1226561-1-stefanha@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Christoph Hellwig <hch@lst.de>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 16:52:21 +0100, Stefan Hajnoczi wrote:
> The scsi=on|off property was deprecated in QEMU 5.0 and can be removed
> completely at this point.
> 
> Drop the scsi=on|off option. It was only available on Legacy virtio-blk
> devices. Linux v5.6 already dropped support for it.
> 
> Remove the hw_compat_2_4[] property assignment since scsi=on|off no
> longer exists. Old guests with Legacy virtio-blk devices no longer see
> the SCSI host features bit.

Does this mean that qemu rejects it if it's explicitly enabled on the
commandline? 

> Live migrating old guests from an old QEMU with the SCSI feature bit
> enabled will fail with "Features 0x... unsupported. Allowed features:
> 0x...". We've followed the QEMU deprecation policy so users have been
> warned...
> 
> I have tested that libvirt still works when the property is absent. It
> no longer adds scsi=on|off to the command-line.

Yup, we deliberately don't format it unless the user requested it since:

https://gitlab.com/libvirt/libvirt/-/commit/ec69f0190be731d12faeac08dbf63325836509a9

Depending on your answer above I might need to dig through the code
again to see whether we do the correct thing if it's no longer
available.

> 
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Peter Krempa <pkrempa@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/specs/tpm.rst           |   2 +-
>  docs/system/deprecated.rst   |  13 ---
>  docs/pci_expander_bridge.txt |   2 +-
>  hw/block/virtio-blk.c        | 192 +----------------------------------
>  hw/core/machine.c            |   2 -
>  5 files changed, 3 insertions(+), 208 deletions(-)


