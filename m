Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB17644C0BD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:06:00 +0100 (CET)
Received: from localhost ([::1]:34184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkmMZ-0006kA-L1
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:05:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkmL6-0005Bu-Qp
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:04:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkmL4-0003cy-H5
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 07:04:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636545865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9AdTALm8Md5s5+vRA1SHctOAQLfLo9rNyPAQFlujxa0=;
 b=VXadKJwRCCK52Rg06b+DO4pbMGdSHNZ2GvizIiiV9CLA7Y8MUdUzD6tP24VWO18gaCOGD3
 NM13/rwqlgV82Fbu8xYbhD4XaOZGzMYHTFHQ+5lTfCO4OlOfNEiwdfykeI44AOtcLULswe
 ad9dWemNoCMMVJR3jw5S6ckojw81KR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-qxdAclgtP6WyW1-r69QFdw-1; Wed, 10 Nov 2021 07:04:24 -0500
X-MC-Unique: qxdAclgtP6WyW1-r69QFdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B863E802C8F;
 Wed, 10 Nov 2021 12:04:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4632256A86;
 Wed, 10 Nov 2021 12:03:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C566E11380A7; Wed, 10 Nov 2021 13:03:01 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v9 3/8] qmp: add QMP command x-query-virtio
References: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
 <1636539792-20967-4-git-send-email-jonah.palmer@oracle.com>
Date: Wed, 10 Nov 2021 13:03:01 +0100
In-Reply-To: <1636539792-20967-4-git-send-email-jonah.palmer@oracle.com>
 (Jonah Palmer's message of "Wed, 10 Nov 2021 05:23:07 -0500")
Message-ID: <87sfw4xloq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com, armbru@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jonah Palmer <jonah.palmer@oracle.com> writes:

> From: Laurent Vivier <lvivier@redhat.com>
>
> This new command lists all the instances of VirtIODevice with
> their QOM paths and virtio type/name.
>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>

[...]

> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index 4912b97..1512ada 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -93,3 +93,4 @@
>  { 'include': 'audio.json' }
>  { 'include': 'acpi.json' }
>  { 'include': 'pci.json' }
> +{ 'include': 'virtio.json' }
> diff --git a/qapi/virtio.json b/qapi/virtio.json
> new file mode 100644
> index 0000000..324ba8c
> --- /dev/null
> +++ b/qapi/virtio.json
> @@ -0,0 +1,55 @@
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
> +# Basic information about a given VirtIODevice
> +#
> +# @path: the device's canonical QOM path
> +#
> +# @type: VirtIO device name
> +#
> +# Since: 6.3

I expect the next release to be numbered 7.0.

> +#
> +##
> +{ 'struct': 'VirtioInfo',
> +  'data': { 'path': 'str',
> +            'type': 'str' } }
> +
> +##
> +# @x-query-virtio:
> +#
> +# Returns a list of all realized VirtIO devices
> +#
> +# Features:
> +# @unstable: This command is meant for debugging.
> +#
> +# Returns: list of gathered @VirtioInfo devices
> +#
> +# Since: 6.3
> +#
> +# Example:
> +#
> +# -> { "execute": "x-query-virtio" }
> +# <- { "return": [ { "path": "/machine/peripheral-anon/device[4]/virtio-backend",
> +#                    "type": "virtio-input" },
> +#                  { "path": "/machine/peripheral/crypto0/virtio-backend",
> +#                    "type": "virtio-crypto" },
> +#                  { "path": "/machine/peripheral-anon/device[2]/virtio-backend",
> +#                    "type": "virtio-scsi" },
> +#                  { "path": "/machine/peripheral-anon/device[1]/virtio-backend",
> +#                    "type": "virtio-net" },
> +#                  { "path": "/machine/peripheral-anon/device[0]/virtio-backend",
> +#                    "type": "virtio-serial" }
> +#                ] }

Any particular reason for reformatting the example?  For what it's
worth, I'd prefer the previous version.

Aside: consistent formatting of examples would be nice.  Not in this
series.

> +#
> +##
> +
> +{ 'command': 'x-query-virtio', 'returns': ['VirtioInfo'],
> +  'features': [ 'unstable' ] }
> diff --git a/tests/qtest/qmp-cmd-test.c b/tests/qtest/qmp-cmd-test.c
> index 7f103ea..fd00ee2 100644
> --- a/tests/qtest/qmp-cmd-test.c
> +++ b/tests/qtest/qmp-cmd-test.c
> @@ -103,6 +103,7 @@ static bool query_is_ignored(const char *cmd)
>          "query-gic-capabilities", /* arm */
>          /* Success depends on target-specific build configuration: */
>          "query-pci",              /* CONFIG_PCI */
> +        "x-query-virtio",         /* CONFIG_VIRTIO */
>          /* Success depends on launching SEV guest */
>          "query-sev-launch-measure",
>          /* Success depends on Host or Hypervisor SEV support */


