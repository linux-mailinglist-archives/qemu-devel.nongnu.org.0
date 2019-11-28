Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA55810CD78
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Nov 2019 18:08:06 +0100 (CET)
Received: from localhost ([::1]:51078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iaNGu-0002v2-RM
	for lists+qemu-devel@lfdr.de; Thu, 28 Nov 2019 12:08:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51194)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iaMRn-0007IS-HF
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 11:15:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iaMRm-0006jO-Ch
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 11:15:15 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43223
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iaMRm-0006hI-36
 for qemu-devel@nongnu.org; Thu, 28 Nov 2019 11:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574957713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+bDP5oFCBvi5+lV+5Z5d9WtQzIAgfQ56konHg87F73s=;
 b=ih6dcSAQFSxOzyXKMUIX9plm8EaKoI9ebwp8Da1n9+UCWUekV7YJs7UEAgPz1xSXzDR58j
 Nx1OtKuvNa7jIybjUSIqXAOXaPWqAabJXp+0Eyel0v8rCRH/6aHtcQY2zFAoPfjaNy0eGM
 qS4bS+Yamosvr2GVd8me1FA5p81AeLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-o3g9-AojNVSx7DKIUPSRlA-1; Thu, 28 Nov 2019 11:15:10 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5762E593D6;
 Thu, 28 Nov 2019 16:15:09 +0000 (UTC)
Received: from localhost (ovpn-116-90.gru2.redhat.com [10.97.116.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47F261001925;
 Thu, 28 Nov 2019 16:14:58 +0000 (UTC)
Date: Thu, 28 Nov 2019 13:14:57 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 2/2] Add -mem-shared option
Message-ID: <20191128161457.GB14595@habkost.net>
References: <20191128141518.628245-1-marcandre.lureau@redhat.com>
 <20191128141518.628245-3-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191128141518.628245-3-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: o3g9-AojNVSx7DKIUPSRlA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-devel@nongnu.org, stefanha@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Igor

On Thu, Nov 28, 2019 at 06:15:18PM +0400, Marc-Andr=E9 Lureau wrote:
> Add an option to simplify shared memory / vhost-user setup.
>=20
> Currently, using vhost-user requires NUMA setup such as:
> -m 4G -object memory-backend-file,id=3Dmem,size=3D4G,mem-path=3D/dev/shm,=
share=3Don -numa node,memdev=3Dmem
>=20
> As there is no other way to allocate shareable RAM, afaik.
>=20
> -mem-shared aims to have a simple way instead: -m 4G -mem-shared
>=20
> Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> ---
[...]
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index e3332a984f..6f72cddb1c 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -493,7 +493,8 @@ static void allocate_system_memory_nonnuma(MemoryRegi=
on *mr, Object *owner,
>      if (mem_path) {
>  #ifdef __linux__
>          Error *err =3D NULL;
> -        memory_region_init_ram_from_file(mr, owner, name, ram_size, 0, 0=
,
> +        memory_region_init_ram_from_file(mr, owner, name, ram_size, 0,
> +                                         mem_shared ? RAM_SHARED : 0,
>                                           mem_path, &err);
>          if (err) {
>              error_report_err(err);
> @@ -513,6 +514,19 @@ static void allocate_system_memory_nonnuma(MemoryReg=
ion *mr, Object *owner,
>  #else
>          fprintf(stderr, "-mem-path not supported on this host\n");
>          exit(1);
> +#endif
> +    } else if (mem_shared) {
> +#ifdef CONFIG_POSIX
> +        Error *err =3D NULL;
> +        memory_region_init_ram_from_file(mr, owner, NULL, ram_size, 0,
> +                                         RAM_SHARED, NULL, &err);
> +        if (err) {
> +            error_report_err(err);
> +            exit(1);
> +        }
> +#else
> +        fprintf(stderr, "-mem-shared not supported on this host\n");
> +        exit(1);
>  #endif
>      } else {
>          memory_region_init_ram_nomigrate(mr, owner, name, ram_size, &err=
or_fatal);

I'd really like make allocate_system_memory_nonnuma() just create
a memory backend object.  This way non-NUMA and NUMA
configuration would be able to use exactly the same set of
options.

I have the impression we tried to do this in the past.  Igor, do
you remember if we did?

--=20
Eduardo


