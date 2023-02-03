Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860DD68A657
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 23:53:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO4v8-0007bp-D8; Fri, 03 Feb 2023 17:52:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pO4uy-0007as-Lu
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 17:52:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pO4uu-0004f1-TG
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 17:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675464741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QBSLtz1nQqtIjRNx3wKOUxnduVgKqOme27OwZho6/1Y=;
 b=MDwqgtgkrHYgdQ4k7GZ8ET61j0nsB+J9WYeAW1ErrAp+Ke5z/PsB0LcR7EjvHk8LXJZZdq
 YAPk5MYVunveL+qEZ36uw5GWDlB99bosyziGXNNw9hJ3j3WVXqtD9f3NLzMj5fWX3BlI3q
 ICmC9YbfAKsfmdT5Bstu/5Kvn4TIP+8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-33-NaI6MG9tMFqfyZ21rcAlBQ-1; Fri, 03 Feb 2023 17:52:19 -0500
X-MC-Unique: NaI6MG9tMFqfyZ21rcAlBQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2185285A5A3;
 Fri,  3 Feb 2023 22:52:19 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC832404CD80;
 Fri,  3 Feb 2023 22:52:17 +0000 (UTC)
Date: Fri, 3 Feb 2023 16:52:16 -0600
From: Eric Blake <eblake@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, mjt@tls.msk.ru
Subject: Re: [PATCH 1/5] docs: expand introduction to disk images
Message-ID: <20230203225216.kqo3kaz6m2w6wdhh@redhat.com>
References: <20230201211234.301918-1-stefanha@redhat.com>
 <20230201211234.301918-2-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201211234.301918-2-stefanha@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 01, 2023 at 04:12:30PM -0500, Stefan Hajnoczi wrote:
> Explain --blockdev, the graph, protocols, formats, and filters. Also
> mention the relationship between --blockdev and --drive, since new users
> are likely to hit both syntaxes.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/system/images.rst | 35 ++++++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/system/images.rst b/docs/system/images.rst
> index d000bd6b6f..dc73acf8c9 100644
> --- a/docs/system/images.rst
> +++ b/docs/system/images.rst
> @@ -3,9 +3,38 @@
>  Disk Images
>  -----------
>  
> -QEMU supports many disk image formats, including growable disk images
> -(their size increase as non empty sectors are written), compressed and
> -encrypted disk images.
> +QEMU supports many different types of storage protocols, disk image file
> +formats, and filter block drivers. *Protocols* provide access to storage such
> +as local files or NBD exports. *Formats* implement file formats that are useful

Do we want to spell out "Network Block Device" for those unfamiliar
with the acronym?

> +for sharing disk image files and add functionality like snapshots. *Filters*
> +add behavior like I/O throttling.
> +
> +These features are composable in a graph. Each graph node is called a
> +*blockdev*. This makes it possible to construct many different storage
> +configurations. The simplest example is accessing a raw image file::
> +
> +   --blockdev file,filename=test.img,node-name=drive0
> +
> +A qcow2 image file throttled to 10 MB/s is specified like this::
> +
> +   --object throttle-group,x-bps-total=10485760,id=tg0 \

Per block-core.json on ThrottleGroupProperties, x-bps-total is an
unstable alias for the @limits object; we should prefer the stable
spelling here.

> +   --blockdev file,filename=vm.qcow2,node-name=file0 \
> +   --blockdev qcow2,file=file0,node-name=qcow0 \
> +   --blockdev throttle,file=qcow0,throttle-group=tg0,node-name=drive0
> +
> +Blockdevs are not directly visible to guests. Guests use emulated storage
> +controllers like a virtio-blk device to access a blockdev::
> +
> +   --device virtio-blk-pci,drive=drive0
> +
> +Note that QEMU has an older ``--drive`` syntax that is somewhat similar to
> +``--blockdev``. ``--blockdev`` is preferred because ``--drive`` mixes storage
> +controller and blockdev definitions in a single option that cannot express
> +everything. When a "drive" or "device" is required by a command-line option or
> +QMP command, a blockdev node-name can be used.
> +
> +The remainder of this chapter covers the block drivers and how to work with
> +disk images.

Otherwise looks like a nice addition.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


