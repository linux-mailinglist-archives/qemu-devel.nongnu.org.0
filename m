Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D0611B86A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 17:19:12 +0100 (CET)
Received: from localhost ([::1]:45364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if4hj-0003hs-AS
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 11:19:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43672)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1if4ca-0000bv-8H
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:13:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1if4cY-0006wv-Vc
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:13:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20994
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1if4cY-0006wW-R9
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 11:13:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576080830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OL0aRlGSKpSoTMVlNBUVPkab/a9UZhPdcE01fU1VNlQ=;
 b=IGUNXuEHyHXQlzhvQ9u+cOBNVhbas8KUEUsvpFO9TJqrjNt4E7ETavEcA0h/MEaJXaCPoK
 kIuovr5zYMPMsqfQuHBuqJcolwBpBlPd/Dpvbw9pAX6BCsUUOI40UWAbuGyLeNkH9mNElL
 HxAQIkz/y/vWqGrMQkL0O3ktdj7zIas=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-W44nSYBONOGd_0gddWO91g-1; Wed, 11 Dec 2019 11:13:49 -0500
Received: by mail-wr1-f71.google.com with SMTP id o6so10590002wrp.8
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 08:13:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3Dk48f+905tu40fuiA0Wi7X06wQ57iExGYr6Vzkp7Jc=;
 b=T5aWtFfdv2hVFpXw0h5L6OO/xnZH3+7deRI7nEK09wZHIXlBzLuOLHg7POEYxN+Dh+
 GgGLdQ3aIpybZ3XxVHsKDTtB3Evt2iNoL9amahYyBOg55PCwHnqS3G9PHiVGnf3toLVj
 ap5Ble60mRJ8m4IBo/OeSdoa11r2gBZDdAb4R6iD4hEUEbm7+Ec1j5WMrI7nGW0gQ9r2
 zD0nsSpnMyUUzlN61v7IhFz4lU4CJ7Uud/8vRjjOJEaiEdznpKJG4C5YkDBIDaNlKyLa
 X67ryPrQr+c/zenc/gw6WOmj8iC/5r5q9g7GEapZc2j+z3iA4UseSitRmxoUj3Rbjmfx
 iEqw==
X-Gm-Message-State: APjAAAWS3DBjbM7pEgKKcpBcVusMVfhFApczZTzRVtHm5dxXTREzLuMs
 en29Wv50J8THd4qeEpFGsWVPceGlKY2hNTGNZlgEz/Sg1SE8zYXr80tNu4Mf9UVd939yAFCdSyl
 5D/na9hSVSvoMBcE=
X-Received: by 2002:a7b:ce81:: with SMTP id q1mr640975wmj.47.1576080827637;
 Wed, 11 Dec 2019 08:13:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqzl5+3whZ0/OuGxpc8u0LnfF1Ws2r7sjoBSBqIbMs0bMprtY7HI0bVfZS5qZDM6nzJc2c2RPw==
X-Received: by 2002:a7b:ce81:: with SMTP id q1mr640944wmj.47.1576080827391;
 Wed, 11 Dec 2019 08:13:47 -0800 (PST)
Received: from [10.201.33.164] ([195.166.127.210])
 by smtp.gmail.com with ESMTPSA id b185sm3028847wme.36.2019.12.11.08.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 08:13:46 -0800 (PST)
Subject: Re: [PATCH v2] ppc/pnv: Make PnvXScomInterface an incomplete type
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <157608025541.186670.1577861507610404326.stgit@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <be09c897-d982-e6ff-0997-61693b34be74@redhat.com>
Date: Wed, 11 Dec 2019 17:13:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <157608025541.186670.1577861507610404326.stgit@bahia.lan>
Content-Language: en-US
X-MC-Unique: W44nSYBONOGd_0gddWO91g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/19 5:04 PM, Greg Kurz wrote:
> PnvXScomInterface is an interface instance. It should never be
> dereferenced. Drop the dummy type definition for extra safety,
> which is the common practice with QOM interfaces.
>=20
> While here also convert the bogus OBJECT_CHECK() to INTERFACE_CHECK().
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> ---
> v2: convert OBJECT_CHECK() to INTERFACE_CHECK()
> ---
>   include/hw/ppc/pnv_xscom.h |    6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
> index 1c1d76bf9be5..306c22461587 100644
> --- a/include/hw/ppc/pnv_xscom.h
> +++ b/include/hw/ppc/pnv_xscom.h
> @@ -22,13 +22,11 @@
>  =20
>   #include "qom/object.h"
>  =20
> -typedef struct PnvXScomInterface {
> -    Object parent;
> -} PnvXScomInterface;
> +typedef struct PnvXScomInterface PnvXScomInterface;
>  =20
>   #define TYPE_PNV_XSCOM_INTERFACE "pnv-xscom-interface"
>   #define PNV_XSCOM_INTERFACE(obj) \
> -     OBJECT_CHECK(PnvXScomInterface, (obj), TYPE_PNV_XSCOM_INTERFACE)
> +    INTERFACE_CHECK(PnvXScomInterface, (obj), TYPE_PNV_XSCOM_INTERFACE)
>   #define PNV_XSCOM_INTERFACE_CLASS(klass)                \
>       OBJECT_CLASS_CHECK(PnvXScomInterfaceClass, (klass), \
>                          TYPE_PNV_XSCOM_INTERFACE)
>=20
>=20


