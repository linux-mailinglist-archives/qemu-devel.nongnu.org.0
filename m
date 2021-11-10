Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF6144C22B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 14:35:23 +0100 (CET)
Received: from localhost ([::1]:42214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mknl4-00032V-Vt
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 08:35:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkngS-0000BN-T9
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:30:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkngQ-0001vs-EA
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 08:30:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636551029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uV8+7G56fOjZDtB37ZzXyDjEknK6Yte60E35SnXUquE=;
 b=fW2of18omVz9W7fBSpkYpYz/nmLbC6xkkGj0BRAFdluY8i9MqfMQZoNoU12uhVRODgDdOq
 i9EThgqqTrixWBIyU7k3OGK9xBazRFRcqdk8fAcIJYeNSTdPY3w4OYGqPwWsSdaU+pS70l
 WQUnoLfvGXwTrz6yazXZichimDiJtt4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-t1zbMLYOO0ah8J_2SPrhCA-1; Wed, 10 Nov 2021 08:30:26 -0500
X-MC-Unique: t1zbMLYOO0ah8J_2SPrhCA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA9748799EC;
 Wed, 10 Nov 2021 13:30:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62BCD5C3DF;
 Wed, 10 Nov 2021 13:30:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E42BE11380A7; Wed, 10 Nov 2021 14:30:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v9 8/8] hmp: add virtio commands
References: <1636539792-20967-1-git-send-email-jonah.palmer@oracle.com>
 <1636539792-20967-9-git-send-email-jonah.palmer@oracle.com>
Date: Wed, 10 Nov 2021 14:30:22 +0100
In-Reply-To: <1636539792-20967-9-git-send-email-jonah.palmer@oracle.com>
 (Jonah Palmer's message of "Wed, 10 Nov 2021 05:23:12 -0500")
Message-ID: <87y25ww32p.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com,
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
> This patch implements the HMP versions of the virtio QMP commands.
>
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> ---
>  hmp-commands-info.hx  | 218 ++++++++++++++++++++++++++++++
>  include/monitor/hmp.h |   5 +
>  monitor/hmp-cmds.c    | 358 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 581 insertions(+)
>
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 407a1da..6bf7359 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -877,3 +877,221 @@ SRST
>    ``info sgx``
>      Show intel SGX information.
>  ERST
> +
> +    {
> +        .name      = "virtio",
> +        .args_type = "",
> +        .params    = "",
> +        .help      = "List all available virtio devices",
> +        .cmd       = hmp_virtio_query,
> +        .flags     = "p",
> +    },
> +
> +SRST
> +  ``info virtio``
> +    List all available virtio devices
> +
> +    Example:
> +
> +    List all available virtio devices in the machine::
> +
> +    (qemu) info virtio
> +    /machine/peripheral/vsock0/virtio-backend [vhost-vsock]

I get

    docs/../hmp-commands-info.hx:899:Inconsistent literal block quoting.

This is from Sphinx.  I can't see what's wrong.

> +    /machine/peripheral/crypto0/virtio-backend [virtio-crypto]
> +    /machine/peripheral-anon/device[2]/virtio-backend [virtio-scsi]
> +    /machine/peripheral-anon/device[1]/virtio-backend [virtio-net]
> +    /machine/peripheral-anon/device[0]/virtio-backend [virtio-serial]
> +
> +ERST

[...]


