Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 055BB154A97
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 18:53:16 +0100 (CET)
Received: from localhost ([::1]:43870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izlL1-0001C1-2w
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 12:53:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46891)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1izlAH-0007ND-7x
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 12:42:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1izlAF-0002ih-W5
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 12:42:09 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42272
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1izlAF-0002eh-RU
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 12:42:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581010927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k6q1/0G+xAp7V3ub21reHauax8QDSnV0LuZ7UBk3rNc=;
 b=VfrU6GONyyqJquXuJcH29uop/KLF/6/o7cbo3H9wJpU6cz9JlS6oPiJ+04uWC4WoScxpnD
 dET1Q9EJud5DNrmQB7EH5UB4lE1zNeQzKfBRMJFqZC18vRMWJ/8/rVBkIXHsRX+eb8dskJ
 j1PygKJSU7OFkEv7cFPgJIKMuL2qwLQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-Vi1lqCUeONWJYR60eH2zGQ-1; Thu, 06 Feb 2020 12:42:05 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 451BF8010F1
 for <qemu-devel@nongnu.org>; Thu,  6 Feb 2020 17:42:04 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4850B10016DA;
 Thu,  6 Feb 2020 17:41:55 +0000 (UTC)
Date: Thu, 6 Feb 2020 17:41:52 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 2/2] virtiofsd: add it to the tools list
Message-ID: <20200206174152.GI3655@work-vm>
References: <20200206173631.752092-1-lvivier@redhat.com>
 <20200206173631.752092-2-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200206173631.752092-2-lvivier@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Vi1lqCUeONWJYR60eH2zGQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Laurent Vivier (lvivier@redhat.com) wrote:
> it will be built only when tools are enabled (always enabled by default)
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index 23342a433e11..484fbb737858 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -327,7 +327,7 @@ HELPERS-y +=3D vhost-user-gpu$(EXESUF)
>  vhost-user-json-y +=3D contrib/vhost-user-gpu/50-qemu-gpu.json
>  endif
> =20
> -ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yyy)
> +ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG)$(CONFIG_TOOLS)=
,yyyy)
>  HELPERS-y +=3D virtiofsd$(EXESUF)
>  vhost-user-json-y +=3D tools/virtiofsd/50-qemu-virtiofsd.json
>  endif
> @@ -681,7 +681,7 @@ rdmacm-mux$(EXESUF): $(rdmacm-mux-obj-y) $(COMMON_LDA=
DDS)
>  =09$(call LINK, $^)
> =20
>  # relies on Linux-specific syscalls
> -ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG),yyy)
> +ifeq ($(CONFIG_LINUX)$(CONFIG_SECCOMP)$(CONFIG_LIBCAP_NG)$(CONFIG_TOOLS)=
,yyyy)
>  virtiofsd$(EXESUF): $(virtiofsd-obj-y) libvhost-user.a $(COMMON_LDADDS)
>  =09$(call LINK, $^)
>  endif
> --=20
> 2.24.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


