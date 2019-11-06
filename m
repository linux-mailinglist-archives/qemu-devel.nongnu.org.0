Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E6BF1A27
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 16:38:14 +0100 (CET)
Received: from localhost ([::1]:60176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSNNt-0001cM-VP
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 10:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46944)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iSNMx-00013q-NX
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 10:37:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iSNMw-0001n2-NY
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 10:37:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60652
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1iSNMw-0001ml-KX
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 10:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573054634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wEb25XEn4oDnT3N4HrXGtodDG7mP4a3lIXES06R+Z9E=;
 b=HrYAXr3yyZ1sgBEsrA2bSIyiDSJYcngDFbi6eLsxkS1bxgr1GRNODQ/KTMLNO5dYDpczIt
 KM7LVJDo82swvdp1dIJvRybC+/Om+vwk5Km2bO4jE6ye3ZZZMP1zbBKy+zVEZIMpq9/SZf
 ZhxTz89u2/q2qh+EsoVnnXMktrNirjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-GgTrubLFM7SlS72eTt--3g-1; Wed, 06 Nov 2019 10:37:11 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2245A477;
 Wed,  6 Nov 2019 15:37:10 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4878C60CC0;
 Wed,  6 Nov 2019 15:37:07 +0000 (UTC)
Message-ID: <4bb66c49f0285c9a9c44f8c9c0973a6ace784f56.camel@redhat.com>
Subject: Re: [PATCH v2 01/21] iotests/qcow2.py: Add dump-header-exts
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Date: Wed, 06 Nov 2019 17:37:06 +0200
In-Reply-To: <20191015142729.18123-2-mreitz@redhat.com>
References: <20191015142729.18123-1-mreitz@redhat.com>
 <20191015142729.18123-2-mreitz@redhat.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: GgTrubLFM7SlS72eTt--3g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2019-10-15 at 16:27 +0200, Max Reitz wrote:
> This is useful for tests that want to whitelist fields from dump-header
> (with grep) but still print all header extensions.
>=20
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  tests/qemu-iotests/qcow2.py | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/tests/qemu-iotests/qcow2.py b/tests/qemu-iotests/qcow2.py
> index b392972d1b..d813b4fc81 100755
> --- a/tests/qemu-iotests/qcow2.py
> +++ b/tests/qemu-iotests/qcow2.py
> @@ -154,6 +154,10 @@ def cmd_dump_header(fd):
>      h.dump()
>      h.dump_extensions()
> =20
> +def cmd_dump_header_exts(fd):
> +    h =3D QcowHeader(fd)
> +    h.dump_extensions()
> +
>  def cmd_set_header(fd, name, value):
>      try:
>          value =3D int(value, 0)
> @@ -230,6 +234,7 @@ def cmd_set_feature_bit(fd, group, bit):
> =20
>  cmds =3D [
>      [ 'dump-header',          cmd_dump_header,          0, 'Dump image h=
eader and header extensions' ],
> +    [ 'dump-header-exts',     cmd_dump_header_exts,     0, 'Dump image h=
eader extensions' ],
>      [ 'set-header',           cmd_set_header,           2, 'Set a field =
in the header'],
>      [ 'add-header-ext',       cmd_add_header_ext,       2, 'Add a header=
 extension' ],
>      [ 'add-header-ext-stdio', cmd_add_header_ext_stdio, 1, 'Add a header=
 extension, data from stdin' ],
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
=09Maxim Levitsky


