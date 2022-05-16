Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EA352867D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 16:08:21 +0200 (CEST)
Received: from localhost ([::1]:52774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqbOW-0005Dc-AU
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 10:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1nqbNA-0004Wg-8s
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:06:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1nqbN8-0001b3-P0
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652710011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AfcLZjGGfKFTFkYqKjKsZ1knrAbt/4I4zRfTd8UEYkg=;
 b=TrlRQdKZWYxl3b7XHrEPqIK9vHiJikLlxzdslU0xQWn3yQ/0V04L7xxExgm5hG1apU4upI
 x5Jsx/80AHjyUJ0TV6SlV1e5q6uhJzLwGkhf/PnNfTiRWQpn/oZe5we9WH1F/TqnAoYXWc
 OkRVfaQauCpcJBS+QdISiaRxjImyJaY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-3CTL_iKYOHqaoqw1_9ZC1w-1; Mon, 16 May 2022 10:06:47 -0400
X-MC-Unique: 3CTL_iKYOHqaoqw1_9ZC1w-1
Received: by mail-wm1-f71.google.com with SMTP id
 bi5-20020a05600c3d8500b0039489e1d18dso10410286wmb.5
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 07:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AfcLZjGGfKFTFkYqKjKsZ1knrAbt/4I4zRfTd8UEYkg=;
 b=yUo7Tv9iLBYp9cDI4lW1lsRdd32QD1vMVOquwjDUJapQbnETrRZmU/3DOnq17SxrXq
 EqhwtlfB6hsvy1xSdmriOZI/f6is9jpb5B3ZtFtPbxzq1KRATUWIamtI73pKW5Wp2Xjs
 JJNcvsacHZZg1TwIaeMTLlSATBAeCeA5mvO5w2LRWLj6Wi0yx2Ck0CDXqmTgRvB5v1oV
 iYnXfuXwj6m3Xy2EOFaXc32n5HX95bHp7km4ndkYrxFBmJfxAT//Wq/sh5fI5JL8kSft
 aI8hJJqRj/GRl/rQgtYL9QZvhHoPhZZHVD+R/tPgLUoHIskOnb38tQ+cmdrd92vTv3bs
 l2eQ==
X-Gm-Message-State: AOAM530Ly9EJRBW0BG3IanCtiKNTPn0NBrmTlA9EWWf0RGDzYjm1yJbl
 BpXQJBi5YnCvgxm4ueWdINkYfKqvUw8PwHAEVwDS0nRAad9jf/JDUUhGi2AMouG5RUxJzbTDFkK
 3JIyA2/gF5Yrsy0CRbgmOQjdDObh3m7b5W384yZla29THtUhvA+P1XkBzPaRaTM9qVmE=
X-Received: by 2002:adf:e292:0:b0:20c:fdae:465d with SMTP id
 v18-20020adfe292000000b0020cfdae465dmr8698797wri.644.1652710006400; 
 Mon, 16 May 2022 07:06:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy8UmcZ6FQjRxOi7LcgQAbQogZvG1Ozd61XbelCDiFPQF3foh1/P3ZP2SLi2PpsitkEslReQ==
X-Received: by 2002:adf:e292:0:b0:20c:fdae:465d with SMTP id
 v18-20020adfe292000000b0020cfdae465dmr8698764wri.644.1652710006064; 
 Mon, 16 May 2022 07:06:46 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 l18-20020adfb112000000b0020c5253d8d3sm9574471wra.31.2022.05.16.07.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 07:06:45 -0700 (PDT)
Received: by wheatley.localdomain (Postfix, from userid 1000)
 id 7731D6E5F3FC; Mon, 16 May 2022 16:06:44 +0200 (CEST)
Date: Mon, 16 May 2022 16:06:44 +0200
From: Martin Kletzander <mkletzan@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, berrange@redhat.com
Subject: Re: [RFC PATCH 4/6] soundhw: unify initialization for ISA and PCI
 soundhw
Message-ID: <YoJadBA4oeJ5z8RC@wheatley>
References: <20220427113225.112521-1-pbonzini@redhat.com>
 <20220427113225.112521-5-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HeeZVB7Ohy/xiBP/"
Content-Disposition: inline
In-Reply-To: <20220427113225.112521-5-pbonzini@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--HeeZVB7Ohy/xiBP/
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2022 at 01:32:23PM +0200, Paolo Bonzini wrote:
>Use qdev_new instead of distinguishing isa_create_simple/pci_create_simple.
>
>Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

By trying to rebase my series on top of this series I noticed this patch
breaks almost everything.

>---
> hw/audio/soundhw.c | 26 ++++++++++++++------------
> 1 file changed, 14 insertions(+), 12 deletions(-)
>
>diff --git a/hw/audio/soundhw.c b/hw/audio/soundhw.c
>index 0fb64bdc8f..a9d8807b18 100644
>--- a/hw/audio/soundhw.c
>+++ b/hw/audio/soundhw.c
>@@ -114,25 +114,27 @@ void soundhw_init(void)
>     struct soundhw *c =3D selected;
>     ISABus *isa_bus =3D (ISABus *) object_resolve_path_type("", TYPE_ISA_=
BUS, NULL);
>     PCIBus *pci_bus =3D (PCIBus *) object_resolve_path_type("", TYPE_PCI_=
BUS, NULL);
>+    BusState *bus;
>
>-    if (!c) {
>-        return;
>-    }

This can still happen if there is no -audio.  Without this check and
without any -audio parameter qemu obviously crashes.

>-    if (c->typename) {
>-        warn_report("'-soundhw %s' is deprecated, "
>-                    "please use '-device %s' instead",
>-                    c->name, c->typename);
>-        if (c->isa) {
>-            isa_create_simple(isa_bus, c->typename);
>-        } else {
>-            pci_create_simple(pci_bus, -1, c->typename);
>+    if (c->isa) {
>+        if (!isa_bus) {
>+            error_report("ISA bus not available for %s", c->name);
>+            exit(1);
>         }
>+        bus =3D BUS(isa_bus);
>     } else {
>-        assert(!c->isa);
>         if (!pci_bus) {
>             error_report("PCI bus not available for %s", c->name);
>             exit(1);
>         }
>+        bus =3D BUS(pci_bus);
>+    }
>+
>+    if (c->typename) {
>+        DeviceState *dev =3D qdev_new(c->typename);
>+        qdev_realize_and_unref(dev, bus, &error_fatal);
>+    } else {
>+        assert(!c->isa);
>         c->init_pci(pci_bus);
>     }
> }
>--=20
>2.35.1
>
>

--HeeZVB7Ohy/xiBP/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiXAnXDYdKAaCyvS1CB/CnyQXht0FAmKCWnQACgkQCB/CnyQX
ht28OBAAhDnfAF0D5ocKU7BicsE6P6R7IBnfJAtXTU2Jx3sl+gwX5WMenqI8plqc
yIHnMN8PM8nxiLaOQROvYnPM9sZURPgbpP2l6x4gNzpOdGutaadEul6aW+/FWbyi
ao+lxw8sz06+w4JoF/QeuNTlp1u4/Fw4MlSRJcYP1IyObBUY0YAlEuMz9IhMz0L5
Gfr+mXUlTeH9VgPkzn66x/f6AKUjqO/cp+wdidBJ/zwhRA+OvyO5VT1hHw0EyqQR
FUCjv7SOjD82HNsFsvLElWTWWe7DNIhlCc85aA66wr6P7F8oDRn1w4v5/ETw7ouH
IMMDjcvygWledc2r8j1cEHMRSb+qkhE66+t+boy97s+froxPqijlox9TYzhccWTh
1X4m5v+++AACNf2jIq6/z58fuv3hifmPYy1SKXuOZd5GbURY9XwBvVPWfcDXuPP8
qGnErbVJjbzSzrhhii87aZgQezAzy1QsWKGlx/2cvQ/XqslXOOrowu6wdckRvxW7
Bu9i+2XyXeGSYiEnM1JWEvYJQtxkKeSkJcE1BwrKS2usfHEzj4ek9K18ika11y1N
CqU40hXFW94vowUyNdJW6bJpUHCnWaoR8ShpErk2g8FkpDsdhDxwnfOQZTj9HApO
Av6LMBn8wFh/73HSc457se3C/sFT3UTh8hsjzXz8ZUU+9/0j1KQ=
=UFkm
-----END PGP SIGNATURE-----

--HeeZVB7Ohy/xiBP/--


