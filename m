Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 786961368E0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 09:19:22 +0100 (CET)
Received: from localhost ([::1]:42458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ippVp-0001sD-Ho
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 03:19:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48575)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ippR6-0004YT-8v
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 03:14:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ippR5-0001Bq-7k
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 03:14:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37682
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ippR5-00017Y-2w
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 03:14:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578644066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=jgp5gKbBlslujAG2vAcb+I8sH03el9vr56j1eXU8yDE=;
 b=LAsA1cv5dxK+1EJC2DTlliLJ5ebz0pppQ+pMNU1C1N/E9MW/WruRt9KmRS5yQ4xLibSqUJ
 vNpxJMI0uF92Q+sQ9wGVTEJgab8vBXAvvys3FiBovtcRe0y+dOTzzyYbqIcPlBSMnIPFHl
 1ta4ay5lakpEK0uk79VXLfWT5hkWX/c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-8y2IvR9ePA2Rp_Ch5zhhRA-1; Fri, 10 Jan 2020 03:14:22 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC884477;
 Fri, 10 Jan 2020 08:14:21 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-154.ams2.redhat.com [10.36.116.154])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0378786CA0;
 Fri, 10 Jan 2020 08:14:17 +0000 (UTC)
Subject: Re: [PATCH 3/4] Makefile: Restrict system emulation and tools objects
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200109153939.27173-1-philmd@redhat.com>
 <20200109153939.27173-4-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <fbc4e5a3-afb2-1a6e-5c22-30d2b91cd8db@redhat.com>
Date: Fri, 10 Jan 2020 09:14:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200109153939.27173-4-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 8y2IvR9ePA2Rp_Ch5zhhRA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/01/2020 16.39, Philippe Mathieu-Daud=C3=A9 wrote:
> Restrict all the system emulation and tools objects with a
> Makefile IF (CONFIG_SOFTMMU OR CONFIG_TOOLS) check.
>=20
> Using the same description over and over is not very helpful.
> Use it once, just before the if() block.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  Makefile.objs | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
>=20
> diff --git a/Makefile.objs b/Makefile.objs
> index 5aae561984..395dd1e670 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -4,16 +4,15 @@ stub-obj-y =3D stubs/
>  util-obj-y =3D crypto/ util/ qobject/ qapi/
>  qom-obj-y =3D qom/
> =20
> +#######################################################################
> +# code used by both qemu system emulation and qemu-img
> +
> +ifeq ($(call lor,$(CONFIG_SOFTMMU),$(CONFIG_TOOLS)),y)

That ",y" at the end looks wrong?

 Thomas


