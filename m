Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BADC14E357
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 20:44:53 +0100 (CET)
Received: from localhost ([::1]:38326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixFkC-0000c4-4F
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 14:44:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46219)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1ixFjR-00005n-E3
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 14:44:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1ixFjP-00035K-V8
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 14:44:04 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:40629
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1ixFjP-000341-I2
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 14:44:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580413442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=tHR4iOC+PQVjoqHhZzueiYxVpdB2UATxhzn2PP7//Ns=;
 b=M9aISAfvIaIR/+uK8+mJWGbxpmgJ04NF9vz0hZP593ayzL4KpoyQt+blkdXSwBQnaNpnV3
 ECGS9+tny+WRrrEnxpybp1kRg/0TwXaK51QWKLpESpw/vm3/C60gUDhUJAUbdNQzQcC1BG
 iucLC3NEDJ4ACkBMPzjQ7Gw5Q6oglJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-FRRvP1PmPA-P8lZc19WGOQ-1; Thu, 30 Jan 2020 14:44:00 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A493107ACCC;
 Thu, 30 Jan 2020 19:43:59 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-117-117.ams2.redhat.com [10.36.117.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C9A560BE1;
 Thu, 30 Jan 2020 19:43:48 +0000 (UTC)
Subject: Re: [PATCH v2 12/12] .travis.yml: limit the arm64 target list
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20200130113223.31046-1-alex.bennee@linaro.org>
 <20200130113223.31046-13-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <cec32483-f133-f40b-a89d-29d8f3ec7980@redhat.com>
Date: Thu, 30 Jan 2020 20:43:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200130113223.31046-13-alex.bennee@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: FRRvP1PmPA-P8lZc19WGOQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 stefanha@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/01/2020 12.32, Alex Benn=C3=A9e wrote:
> Even though we can do a good multi-threaded build we are still
> exceeding the 50 minute build time while running the tests.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  .travis.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/.travis.yml b/.travis.yml
> index a600f508b0..71bf650b1d 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -426,7 +426,7 @@ matrix:
>            - genisoimage
>        env:
>          - TEST_CMD=3D"make check check-tcg V=3D1"
> -        - CONFIG=3D"--disable-containers --target-list=3D${MAIN_SOFTMMU_=
TARGETS}"
> +        - CONFIG=3D"--disable-containers --target-list=3Daarch64-softmmu=
,aarch64-linux-user,arm-softmmu,arm-linux-user"

Maybe still include x86_64-softmmu? (I assume arm folks might be
interested in that?)

 Thomas


