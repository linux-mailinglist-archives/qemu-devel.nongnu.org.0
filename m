Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F422DF9426
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Nov 2019 16:26:44 +0100 (CET)
Received: from localhost ([::1]:36606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUY44-0000iP-0n
	for lists+qemu-devel@lfdr.de; Tue, 12 Nov 2019 10:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43596)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iUY1z-0006fU-2t
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 10:24:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iUY1w-00051A-BJ
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 10:24:33 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34051
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iUY1w-00050z-50
 for qemu-devel@nongnu.org; Tue, 12 Nov 2019 10:24:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573572271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1S5uZn9nVF/MYEDjy+HnQn7FuR6x+DXCDMLzQqeO99U=;
 b=AA5fH37cjQp+uTPGNHKbR5dlIjiNG0oxj+USKs4ndimXFezckS9hL6n7V21qInjxHNmVAS
 iIkGqbgxWqChOcOUGUS8psWlghKVN34uj5wefs4Tl52QPmMmvnAxr1Fi2PcQ4l3MusZslR
 6kVEwosc1TzKeNDE2KYEM9vgMQ0lHXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-zzZ4Hkj3PSaAgjCwrVN70w-1; Tue, 12 Nov 2019 10:24:29 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36A448FB0C0;
 Tue, 12 Nov 2019 15:24:28 +0000 (UTC)
Received: from [10.3.116.242] (ovpn-116-242.phx2.redhat.com [10.3.116.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26C5166834;
 Tue, 12 Nov 2019 15:24:25 +0000 (UTC)
Subject: Re: [RFC PATCH] tests/vm: make --interactive (and therefor DEBUG=1)
 unconditional
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20191112151051.2205-1-alex.bennee@linaro.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <4ab19c3c-232e-d92b-e104-5562e9a55e41@redhat.com>
Date: Tue, 12 Nov 2019 09:24:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191112151051.2205-1-alex.bennee@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: zzZ4Hkj3PSaAgjCwrVN70w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/19 9:10 AM, Alex Benn=C3=A9e wrote:

In the subject: s/therefor/therefore/

> While the concepts of only dropping to ssh if a test fails is nice it

s/concepts/concept/

> is more useful for this to be unconditional. You usually just want to
> get the build up and running and then noodle around debugging or
> attempting to replicate.
>=20
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>   tests/vm/basevm.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
> index 91a9226026d..0b8c1b26576 100755
> --- a/tests/vm/basevm.py
> +++ b/tests/vm/basevm.py
> @@ -403,7 +403,7 @@ def main(vmcls):
>       exitcode =3D 0
>       if vm.ssh(*cmd) !=3D 0:
>           exitcode =3D 3
> -    if exitcode !=3D 0 and args.interactive:
> +    if args.interactive:
>           vm.ssh()
>  =20
>       if not args.snapshot:
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


