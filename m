Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C8F67E1AA
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 11:31:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLM04-0008M5-7h; Fri, 27 Jan 2023 05:30:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pLM01-0008Ln-7v
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 05:30:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pLLzz-0007h9-5y
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 05:30:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674815421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qAJjxH4056mS2hC4Dl+naq125voeuwyxSHx/fFJ1a1U=;
 b=VooJG1gTTMcRDedb+M6TFLvHrMNeQbFxls7790atWqnKZA2Xk3ig/VrlKlvlH3ilsy46Ti
 r7grjTqQlRNxWC+XXGwOmHULEb6PsftYTM3Y2jSEtMqbecnq2IEW3J7qhBOrpKloIELdBL
 +T2LvDhdq3G8HJx+Bnxru2GdUcUlxXE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-yAe9yX9xPLS11QAihDp9Og-1; Fri, 27 Jan 2023 05:30:18 -0500
X-MC-Unique: yAe9yX9xPLS11QAihDp9Og-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA413280BCBB;
 Fri, 27 Jan 2023 10:30:16 +0000 (UTC)
Received: from localhost (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 104C114171C0;
 Fri, 27 Jan 2023 10:30:15 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Sebastian Mitterle <smitterl@redhat.com>, qemu-devel@nongnu.org
Cc: thuth@redhat.com, clegoate@redhat.com, qemu-trivial@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v2] docs/s390x/pcidevices: document pci devices on s390x
In-Reply-To: <20230127084604.53175-1-smitterl@redhat.com>
Organization: Red Hat GmbH
References: <20230127084604.53175-1-smitterl@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 27 Jan 2023 11:30:13 +0100
Message-ID: <87h6wcuv62.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Jan 27 2023, Sebastian Mitterle <smitterl@redhat.com> wrote:

> Add some documentation about the zpci device and how
> to use it with pci devices on s390x.
>
> Used source: Cornelia Huck's blog post
> https://people.redhat.com/~cohuck/2018/02/19/notes-on-pci-on-s390x.html
>
> Signed-off-by: Sebastian Mitterle <smitterl@redhat.com>
> ---
> v2: move section below 'Device support'
> ---
>  docs/system/s390x/pcidevices.rst | 34 ++++++++++++++++++++++++++++++++
>  docs/system/target-s390x.rst     |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 docs/system/s390x/pcidevices.rst
>
> diff --git a/docs/system/s390x/pcidevices.rst b/docs/system/s390x/pcidevices.rst
> new file mode 100644
> index 0000000000..fec905d6e6
> --- /dev/null
> +++ b/docs/system/s390x/pcidevices.rst
> @@ -0,0 +1,34 @@
> +PCI devices on s390x
> +====================
> +
> +PCI devices on s390x work differently than on other architectures.

add "and need to be configured in a slightly different way." ?

> +
> +To start with, using a PCI device requires the additional ``zpci`` device. For example,

I think the "zpci" device is not technically "required" (ISTR that we
autogenerate it, if needed); however, you need it if you actually want
to specify uid/fid/... what about:

"Every PCI device is linked with an additional ``zpci`` device. While
the ``zpci`` device will be autogenerated if not specified, it is
recommended to specify it explicitly so that you can pass s390-specific
PCI configuration."

?

> +in order to pass a PCI device ``0000:00:00.0`` through you'd specify::
> +
> + qemu-system-s390x ... \
> +                   -device zpci,uid=1,fid=0,target=hostdev0,id=zpci1 \
> +                   -device vfio-pci,host=0000:00:00.0,id=hostdev0
> +
> +Here, the zpci device is joined with the PCI device via the ``target`` property.
> +
> +Note that we don't set bus, slot or function here for the guest as is common in other
> +PCI implementations. Topology information is not available on s390x. Instead, ``uid``

"Topology information is not available on s390x, and the guest will not
see any of the bus/slot/function information specified on the command
line."

?

> +and ``fid`` determine how the device is presented to the guest operating system.
> +
> +In case of Linux, ``uid`` will be used in the ``domain`` part of the PCI identifier, and
> +``fid`` identifies the physical slot, i.e.::
> +
> + qemu-system-s390x ... \
> +                   -device zpci,uid=7,fid=8,target=hostdev0,id=zpci1 \
> +                   ...
> +
> +will be presented in the guest as::
> +
> + # lspci -v
> + 0007:00:00.0 ...
> + Physical Slot: 00000008
> + ...
> +
> +Finally, note that you might have to enable the ``zpci`` feature in the cpu model in oder to use
> +it.

I'm wondering what the current state of that feature is -- is it present
by default in the newer named models? (My original blog entry was
written nearly five years ago ;)


