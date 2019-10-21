Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C914BDF3E7
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 19:12:28 +0200 (CEST)
Received: from localhost ([::1]:45792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMbEJ-00077f-T1
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 13:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42927)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iMbCQ-0006CH-0H
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:10:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iMbCP-0006dO-0T
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:10:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55838)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iMbCO-0006d2-Rj
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 13:10:28 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EB48683F40
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 17:10:27 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id x9so1303991wrq.5
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 10:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BIrk6bO3LLMP97s4TJTCTNSLhmbhrLzzF2ckRns4HKY=;
 b=R9swXbbhX3ahPk/mnBFw2YjNXRRrXgLrLEjtOFAxVfMvrG/DoYd4LzHTQChOh0vYNC
 5Hv8cpIzmpF1/k/btzQvhVyqaIMDlQGFpdIOfFdpWUdqF8THW3/FUYVYCz04OUCCdolB
 sl25nji5W49li8j4cQ8A+qapVuTjx4CPjWKyu7GIoiz/v1PM4sAdl8l1edrMNX4++v3O
 Tx9buMtP48vZw+zMJjLNLuNwAy8zoAdC+tssp0JwpWl/RGZsphXeyCPgXMUrFCsKfwOl
 tBFedtT4H2nZ4Y27qY2QiAKVVptqB2djBLjE13AlQjpSRyHvGXSnlGqNLJsBfomp4ufW
 PAzg==
X-Gm-Message-State: APjAAAUCJ+WbDYehVsy/yiRWwYls4PyqrGBnJOdSFH2cy6drgwBKOk4u
 oBzbRkiLxdPgKYrS04W2kz+DLSEcTpK1Ks1P7pijwMvGGLzGI8Iuv+pvKQylJlp74kjdfHmwrUe
 H8dT2ak0WgOy3Rr4=
X-Received: by 2002:adf:f101:: with SMTP id r1mr3156184wro.320.1571677826607; 
 Mon, 21 Oct 2019 10:10:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZ+RmX5noSUmDMGfhi0SOVz0q2yzLFyWgWyR4rflwQyKf5tQ+bQ5k5TTvXLhQIBfDJ9vR9FA==
X-Received: by 2002:adf:f101:: with SMTP id r1mr3156156wro.320.1571677826334; 
 Mon, 21 Oct 2019 10:10:26 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:847b:6afc:17c:89dd?
 ([2001:b07:6468:f312:847b:6afc:17c:89dd])
 by smtp.gmail.com with ESMTPSA id c14sm8432439wru.24.2019.10.21.10.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2019 10:10:25 -0700 (PDT)
Subject: Re: [RFC PATCH] hw/mem/Kconfig: NVDIMM device requires
 CONFIG_MEM_DEVICE
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191015164642.31069-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <684fb125-6370-23c2-7a3d-834ab5f742e2@redhat.com>
Date: Mon, 21 Oct 2019 19:10:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191015164642.31069-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: qemu-trivial@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/10/19 18:46, Philippe Mathieu-Daud=C3=A9 wrote:
> When selecting only the NVDIMM device with "NVDIMM y", the
> device is not compiled/linked because it does not select MEM_DEVICE
> and hw/mem/Makefile.objs is not included:
>=20
>   $ git grep mem/ hw/Makefile.objs
>   hw/Makefile.objs:39:devices-dirs-$(CONFIG_MEM_DEVICE) +=3D mem/
>=20
> Let NVDIMM config select MEM_DEVICE.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> I'm not sure this is the best fix, maybe we should simply include
> mem/ regardless of CONFIG_MEM_DEVICE (all mem devices use it).
> ---
>  hw/mem/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
> index 620fd4cb59..5da724d7a2 100644
> --- a/hw/mem/Kconfig
> +++ b/hw/mem/Kconfig
> @@ -7,5 +7,6 @@ config MEM_DEVICE
> =20
>  config NVDIMM
>      bool
> +    select MEM_DEVICE
>      default y
>      depends on PC
>=20

Queued, thanks.  As a follow-up, hw/mem/memory-device.c can be common-obj=
-y.

Paolo

