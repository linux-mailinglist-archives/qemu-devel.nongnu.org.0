Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9412719CC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 15:53:42 +0200 (CEST)
Received: from localhost ([::1]:42652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpvEc-0006az-4i
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 09:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40175)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hpvEP-0006CA-LH
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 09:53:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hpvEO-000695-Lw
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 09:53:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57882)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>)
 id 1hpvEO-00068W-Ga; Tue, 23 Jul 2019 09:53:28 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 30C4E30BA078;
 Tue, 23 Jul 2019 13:53:27 +0000 (UTC)
Received: from localhost (ovpn-116-40.gru2.redhat.com [10.97.116.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A7C91024804;
 Tue, 23 Jul 2019 13:53:25 +0000 (UTC)
Date: Tue, 23 Jul 2019 10:53:24 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20190723135324.GG11469@habkost.net>
References: <20190712134307.31112-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190712134307.31112-1-sw@weilnetz.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 23 Jul 2019 13:53:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] Remove old global variables max_cpus
 and smp_cpus
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Like Xu <like.xu@linux.intel.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 12, 2019 at 03:43:07PM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> v2: Remove also max_cpus (merci =E0 Laurent Vivier <laurent@vivier.eu>)
>=20
>  include/sysemu/sysemu.h | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 984c439ac9..e70edf7c1c 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -103,8 +103,6 @@ extern const char *keyboard_layout;
>  extern int win2k_install_hack;
>  extern int alt_grab;
>  extern int ctrl_grab;
> -extern int smp_cpus;
> -extern unsigned int max_cpus;
>  extern int cursor_hide;
>  extern int graphic_rotate;
>  extern int no_quit;
> --=20
> 2.20.1
>=20

Queued for 4.2, thanks!

--=20
Eduardo

