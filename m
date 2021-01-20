Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6792FD9BB
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 20:36:36 +0100 (CET)
Received: from localhost ([::1]:38336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2JHP-0003oI-36
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 14:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2JCb-0001sL-7T
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:31:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l2JCZ-0004GB-3n
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 14:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611171092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DxaeJrJ4DtdixS+BGTBFjaanfeUNN7SJp/R7cGyiy7U=;
 b=TN6bDdtLmGOJSS4p7BDW0OYEPMr5r7TNW0auQdWcYON8kD2rW7eNtp8GLHYdq0GDMHKyPx
 Bcgt+2P9UbrMRwWyg4egjsQvApBYFdTfYLaDU4ZqYUeqzECqMDxn7+eCfNxR4f1ynl1axz
 7n9u+jJ1qUU7mjpNKxS/Wzmhm5LH1pA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-ei3pC7AROoWXiZkZ-Q4NUw-1; Wed, 20 Jan 2021 14:31:30 -0500
X-MC-Unique: ei3pC7AROoWXiZkZ-Q4NUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 765C380A5C0
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 19:31:29 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A2D219811;
 Wed, 20 Jan 2021 19:31:23 +0000 (UTC)
Date: Wed, 20 Jan 2021 20:31:22 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] Deprecate pmem=on with non-DAX capable backend file
Message-ID: <20210120203122.6c037b5b@redhat.com>
In-Reply-To: <20210111203332.740815-1-imammedo@redhat.com>
References: <20210111203332.740815-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: libvir-list@redhat.com, pbonzini@redhat.com, thuth@redhat.com,
 philmd@redhat.com, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Jan 2021 15:33:32 -0500
Igor Mammedov <imammedo@redhat.com> wrote:

> It is not safe to pretend that emulated NVDIMM supports
> persistence while backend actually failed to enable it
> and used non-persistent mapping as fall back.
> Instead of falling-back, QEMU should be more strict and
> error out with clear message that it's not supported.
> So if user asks for persistence (pmem=3Don), they should
> store backing file on NVDIMM.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> v2:
>   rephrase deprecation comment andwarning message
>   (Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>)

I've posted as v1 though it's v2 and it looks like it fell through cracks,

can someone pick it up if it looks fine, please?

> ---
>  docs/system/deprecated.rst | 17 +++++++++++++++++
>  util/mmap-alloc.c          |  3 +++
>  2 files changed, 20 insertions(+)
>=20
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index bacd76d7a5..e79fb02b3a 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -327,6 +327,23 @@ The Raspberry Pi machines come in various models (A,=
 A+, B, B+). To be able
>  to distinguish which model QEMU is implementing, the ``raspi2`` and ``ra=
spi3``
>  machines have been renamed ``raspi2b`` and ``raspi3b``.
> =20
> +Backend options
> +---------------
> +
> +Using non-persistent backing file with pmem=3Don (since 6.0)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +This option is used when ``memory-backend-file`` is consumed by emulated=
 NVDIMM
> +device. However enabling ``memory-backend-file.pmem`` option, when backi=
ng file
> +is (a) not DAX capable or (b) not on a filesystem that support direct ma=
pping
> +of persistent memory, is not safe and may lead to data loss or corruptio=
n in case
> +of host crash.
> +Options are:
> +    - modify VM configuration to set ``pmem=3Doff`` to continue using fa=
ke NVDIMM
> +      (without persistence guaranties) with backing file on non DAX stor=
age
> +    - move backing file to NVDIMM storage and keep ``pmem=3Don``
> +      (to have NVDIMM with persistence guaranties).
> +
>  Device options
>  --------------
> =20
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index 27dcccd8ec..0388cc3be2 100644
> --- a/util/mmap-alloc.c
> +++ b/util/mmap-alloc.c
> @@ -20,6 +20,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/mmap-alloc.h"
>  #include "qemu/host-utils.h"
> +#include "qemu/error-report.h"
> =20
>  #define HUGETLBFS_MAGIC       0x958458f6
> =20
> @@ -166,6 +167,8 @@ void *qemu_ram_mmap(int fd,
>                      "crash.\n", file_name);
>              g_free(proc_link);
>              g_free(file_name);
> +            warn_report("Using non DAX backing file with 'pmem=3Don' opt=
ion"
> +                        " is deprecated");
>          }
>          /*
>           * if map failed with MAP_SHARED_VALIDATE | MAP_SYNC,


