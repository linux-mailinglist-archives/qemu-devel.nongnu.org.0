Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92B113A84E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 12:23:39 +0100 (CET)
Received: from localhost ([::1]:37314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irKIM-0001GC-UD
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 06:23:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50294)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1irK70-0004zC-RG
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:11:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1irK6y-0002fI-TU
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:11:54 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34082
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1irK6y-0002f6-QD
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:11:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579000312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=wQEgHAwTZxA6175tFs0uG/sfEIsHWv5KrlV7NaS3bPc=;
 b=d1oV/gY0ag+xmZfSCM8vfyeP5Nm8/vRhWYs/y/EGcXk+Gz2aCrRNe42BaLucYcSqisZVHs
 vl85HClYcD52HEYxg/8Roa1rMHdecjnZr+52QQyJ2bNNNEDeMk6r25N+R3K5EhxewoqmMb
 yrPX6gkWxIPllfGSm8rf1u3W0e0mL2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-dRBN32aGNQSVwjlF-qPmMg-1; Tue, 14 Jan 2020 06:11:40 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA70E184C707;
 Tue, 14 Jan 2020 11:11:39 +0000 (UTC)
Received: from thuth.remote.csb (unknown [10.36.118.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EBE55DA70;
 Tue, 14 Jan 2020 11:11:36 +0000 (UTC)
Subject: Re: [qemu-web PATCH] documentation: update links to readthedocs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
References: <20200113103550.1133-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <2331e0b7-cad9-7b53-3d30-7fb88d692c8a@redhat.com>
Date: Tue, 14 Jan 2020 12:11:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200113103550.1133-1-alex.bennee@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: dRBN32aGNQSVwjlF-qPmMg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/01/2020 11.35, Alex Benn=C3=A9e wrote:
> ..and extemporise a little about their state.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  documentation.md | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/documentation.md b/documentation.md
> index f4ef9f4..55d5db6 100644
> --- a/documentation.md
> +++ b/documentation.md
> @@ -3,9 +3,12 @@ title: QEMU documentation
>  permalink: /documentation/
>  ---
> =20
> -The [QEMU user manual](https://qemu.weilnetz.de/qemu-doc.html) can be re=
ad online, courtesy of Stefan Weil.
> -More documentation is found in the <a href=3D"https://git.qemu.org/?p=3D=
qemu.git;a=3Dtree;f=3Ddocs;hb=3Dmaster">`docs`</a>
> -directory of the QEMU git tree.
> +The [QEMU user manual](https://qemu.weilnetz.de/qemu-doc.html) can be
> +read online, courtesy of Stefan Weil. There is a partial set of
> +[developer documentation](https://qemu.readthedocs.io/en/latest/)
> +which is generated from the QEMU git tree. The process of converting
> +the rest of the [`docs`](https://git.qemu.org/?p=3Dqemu.git;a=3Dtree;f=
=3Ddocs;hb=3Dmaster)
> +directory is ongoing.

This has a conflict with Stefan's patch to point to our documentation on
www.qemu.org now instead:

 https://patchwork.kernel.org/patch/11234545/

... Stefan, looks like the index.html page is still not there yet,
although your other patch that includes index.html.in in the sources is
in the repository now? What's the status here?

 Thomas


