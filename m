Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B35036D4C0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 11:28:00 +0200 (CEST)
Received: from localhost ([::1]:48846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbgUB-0008QY-3v
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 05:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lbgQw-0007T1-Kw; Wed, 28 Apr 2021 05:24:40 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:43874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lbgQs-0006Nf-Vx; Wed, 28 Apr 2021 05:24:38 -0400
Received: by mail-ed1-x52c.google.com with SMTP id e7so73252714edu.10;
 Wed, 28 Apr 2021 02:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mDettADL3XJXJwZlGpknwPNZAKEhctfi4Im+IbFrLl4=;
 b=oie2j8JFig6kX+w5e9wJ/nybRoMxRQh2I3IfU3O/KyViDGuYBYHfQN1KU4uqwOyze3
 4cmo/2l24GHmw0YyqRFdaxSNEucVp5u6E5xmpTSZkVL06yWmdClq/KIL0TesDWkPE2pF
 FObTgNeb9WjRUCePSbWrMuPZizaSYsjNK7J3HIei8aZ+nhBdpYlyl5nAgUUH9hGC/Ial
 jKu776qSGVByrshzZ4AIXcT+4wthxSOtl93j96Z7Ueb7OqW4NnWb5gJ4HShhHD0MxU21
 42DfEL8i8gsn9Gm9eiQUNC0bwiQqvgosllmf3WZE0se7+dLx7sFU6i7VgJ0LYQXdkVyP
 HwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mDettADL3XJXJwZlGpknwPNZAKEhctfi4Im+IbFrLl4=;
 b=PZqw+iq6BMzKsPjTAjEQJwnu1HTa/9Z7CsCyJLLpO2j2m+YYV0tY9zGLXZR8ZZRPau
 a/hETO35gXR5LxK27bqplJ925wjLZ4B8KLpHTYThqkWX5JxlxndnhziVlhdicKBdBWmL
 mWIn132MMgED3ypYO6gD1ptI6Fw8BMnGa86yXflypkDLXf3fXf4gSnOAFogxG8oYNuxV
 QotcVfTX3vCIkNge77to881yoG+I05VLT4LonKxxil2Z+/AZeebfS1WsO54FUPOZarNB
 yS7RBVdEW/fUP6GHtIxtcY3MWJcCKFXcGWkfp/pURiTA2S0UPdg0/h7aS+YxehcsdIE1
 8SRA==
X-Gm-Message-State: AOAM530Sm5DdRD5IuBmh8HgrAebjL9BhdjdEuXNrJ+/UkVyWii7ZotiY
 NyqP4/xGrCz/KaNecmervjQ=
X-Google-Smtp-Source: ABdhPJxFI47Nzp45Gu6WiyyVD/NQiPE8wEOnt071yI0lO3cHkObP8MvTFiuJJAesLYgvV1iEXypWBA==
X-Received: by 2002:aa7:cb97:: with SMTP id r23mr9784190edt.106.1619601871773; 
 Wed, 28 Apr 2021 02:24:31 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id c19sm4399676edu.20.2021.04.28.02.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 02:24:31 -0700 (PDT)
Date: Wed, 28 Apr 2021 10:24:29 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] hw/ide: Fix crash when plugging a piix3-ide device into
 the x-remote machine
Message-ID: <YIkpzdUkgHs4vYCe@stefanha-x1.localdomain>
References: <20210416125256.2039734-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IwN6cEKJGjUJSRFI"
Content-Disposition: inline
In-Reply-To: <20210416125256.2039734-1-thuth@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=stefanha@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IwN6cEKJGjUJSRFI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 02:52:56PM +0200, Thomas Huth wrote:
> @@ -158,7 +166,11 @@ static void pci_piix_ide_realize(PCIDevice *dev, Err=
or **errp)
> =20
>      vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
> =20
> -    pci_piix_init_ports(d);
> +    rc =3D pci_piix_init_ports(d);
> +    if (rc) {
> +        error_setg_errno(errp, -rc, "Failed to realize %s",
> +                         object_get_typename(OBJECT(dev)));
> +    }

Is there an error message explaining the reason for the failure
somewhere. I can't see one in the patch and imagine users will be
puzzled/frustrated by a generic "Failed to realize" error message. Can
you make it more meaningful?

Thanks,
Stefan

--IwN6cEKJGjUJSRFI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCJKc0ACgkQnKSrs4Gr
c8gSDQgAomA+hWywvnr8txju6b+YmrpPEdEMdaPpngTq76U1fClXbve+NG0MOHMu
zJaJzxU3UE30AyQIvVOp8ZURyzUcvaEvbWjp8QBctoCmoS7MgqBo2W91kThE7rJo
VkURdgjR/6fdRFto4aa5iqQfsZb1y0LJJnwGck7/c+mccgqOb8ygsPPf2cZjmWBe
SjTth6w+kaGLSrb9eqruI26d+vlU+LcnmyfrPn/eu4HRx4M4magmTsSXHDqNS2cc
oYze4bbjONMwLLoLi6XJZxuHta8LLvUFyJDdVWKAJneCtCJ1QymlO2vlvq1iBRIU
I2KRV9bcySyzfGzRUU7boOC0bAFz8g==
=MfFt
-----END PGP SIGNATURE-----

--IwN6cEKJGjUJSRFI--

