Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723AA4232DA
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 23:29:01 +0200 (CEST)
Received: from localhost ([::1]:52754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXrzf-0000Rz-Sr
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 17:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mXrvQ-0004Hx-OS
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 17:24:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mXrvM-0004EP-Up
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 17:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633469071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3hWsI971ClUeJo6r2GNKB9LxKWOsnXrFxNCDjJm874c=;
 b=K6V/EBFtCCRk/YM6hYxyzQkBWg2j6Z1jlErInHoKZanwvZtOj9aAoRWOg0zwxktqixyjXE
 t8iBvd7CA1fHLd3NxNojRgqhGNQbZhYiG8AkI+nf67bzKXLYcHcLAQlKggPp6/N4G+opcg
 RaFz5uQJtj/Ke1APzGLv0b4D0uQdaus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-egjq3VDoPI22MkZ4A16eYw-1; Tue, 05 Oct 2021 17:24:27 -0400
X-MC-Unique: egjq3VDoPI22MkZ4A16eYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 161E11842161;
 Tue,  5 Oct 2021 21:24:25 +0000 (UTC)
Received: from redhat.com (ovpn-113-79.phx2.redhat.com [10.3.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F1B810013D7;
 Tue,  5 Oct 2021 21:24:23 +0000 (UTC)
Date: Tue, 5 Oct 2021 16:24:21 -0500
From: Eric Blake <eblake@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v7 3/8] qmp: add QMP command x-debug-query-virtio
Message-ID: <20211005212421.yfn6jrciih22l5ce@redhat.com>
References: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
 <1633452353-7169-4-git-send-email-jonah.palmer@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1633452353-7169-4-git-send-email-jonah.palmer@oracle.com>
User-Agent: NeoMutt/20210205-814-5cca94
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, mreitz@redhat.com,
 qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, amit@kernel.org,
 michael.roth@amd.com, dgilbert@redhat.com, eric.auger@redhat.com,
 dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 boris.ostrovsky@oracle.com, kwolf@redhat.com, berrange@redhat.com,
 laurent@vivier.eu, raphael.norwitz@nutanix.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 12:45:48PM -0400, Jonah Palmer wrote:
> From: Laurent Vivier <lvivier@redhat.com>
> 
> This new command lists all the instances of VirtIODevice with
> their QOM paths and virtio type/name.
> 
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> ---
>  hw/virtio/meson.build      |  2 ++
>  hw/virtio/virtio-stub.c    | 14 ++++++++++
>  hw/virtio/virtio.c         | 27 +++++++++++++++++++
>  include/hw/virtio/virtio.h |  1 +
>  qapi/meson.build           |  1 +
>  qapi/qapi-schema.json      |  1 +
>  qapi/virtio.json           | 66 ++++++++++++++++++++++++++++++++++++++++++++++
>  tests/qtest/qmp-cmd-test.c |  1 +
>  8 files changed, 113 insertions(+)
>  create mode 100644 hw/virtio/virtio-stub.c
>  create mode 100644 qapi/virtio.json
> 
>  [Jonah: VirtioInfo member 'type' is now of type string and no longer
>   relies on defining a QAPI list of virtio device type enumerations
>   to match the VirtIODevice name with qapi_enum_parse().]

Hmm; depending on how much information you want to cram in strings, we
may want to rebase this series on top of Dan's work to add the
HumanReadableText QAPI type:
https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg07717.html

> +++ b/qapi/virtio.json
> @@ -0,0 +1,66 @@
> +# -*- Mode: Python -*-
> +# vim: filetype=python
> +#
> +
> +##
> +# = Virtio devices
> +##
> +
> +##
> +# @VirtioInfo:
> +#
> +# Information about a given VirtIODevice
> +#
> +# @path: VirtIO device canonical QOM path.
> +#
> +# @type: VirtIO device name.
> +#
> +# Since: 6.2
> +#
> +##
> +{ 'struct': 'VirtioInfo',
> +    'data': {
> +        'path': 'str',
> +        'type': 'str'
> +    }
> +}
> +
> +##
> +# @x-debug-query-virtio:
> +#
> +# Return a list of all initalized VirtIO devices
> +#
> +# Returns: list of gathered @VirtioInfo devices
> +#
> +# Since: 6.2
> +#
> +# Example:
> +#
> +# -> { "execute": "x-debug-query-virtio" }
> +# <- { "return": [
> +#        {
> +#            "path": "/machine/peripheral-anon/device[4]/virtio-backend",
> +#            "type": "virtio-input"
> +#        },
> +#        {
> +#            "path": "/machine/peripheral/crypto0/virtio-backend",
> +#            "type": "virtio-crypto"
> +#        },
> +#        {
> +#            "path": "/machine/peripheral-anon/device[2]/virtio-backend",
> +#            "type": "virtio-scsi"
> +#        },
> +#        {
> +#            "path": "/machine/peripheral-anon/device[1]/virtio-backend",
> +#            "type": "virtio-net"
> +#        },
> +#        {
> +#            "path": "/machine/peripheral-anon/device[0]/virtio-backend",
> +#            "type": "virtio-serial"
> +#        }
> +#      ]
> +#    }
> +#
> +##
> +
> +{ 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }

But for now, it looks like 'str' is the correct type.


-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


