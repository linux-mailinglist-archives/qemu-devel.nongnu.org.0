Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BF7403A1B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 14:44:53 +0200 (CEST)
Received: from localhost ([::1]:33648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNwwe-0003nC-G7
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 08:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNwvJ-0002N8-DY
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:43:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mNwvH-0005RD-3J
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 08:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631105006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HZCig9Q+1hiNeMFQSStn5dzKHW1tTZg3N2TPXr/3CRo=;
 b=F7QRwa1mQHF2ZIonjU7ImCD4kxVZgUfquLrDz0TxyCUv05sSXbop3VktA0kglYIaPWbX40
 GiK7dcAYK4Uo69VdrwHjB7bjLfgMb7HcPlTbglABHexg66JEERIn1z7qBR9hksvKvIqR3s
 M7RuBInVRorpu0a1DjhZCDr5xZS7Bxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-XtgDVk20OqaTHFUfz5Z1jA-1; Wed, 08 Sep 2021 08:43:23 -0400
X-MC-Unique: XtgDVk20OqaTHFUfz5Z1jA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D586E84A5E1;
 Wed,  8 Sep 2021 12:43:21 +0000 (UTC)
Received: from localhost (unknown [10.39.194.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A96D77C16;
 Wed,  8 Sep 2021 12:43:18 +0000 (UTC)
Date: Wed, 8 Sep 2021 13:43:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH RFC server v2 04/11] vfio-user: find and init PCI device
Message-ID: <YTiv5W6tj6cm6UZA@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <a7c0072a7232da2f3aa76d9cd4cdf415fd1127d1.1630084211.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <a7c0072a7232da2f3aa76d9cd4cdf415fd1127d1.1630084211.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IlstGuZ+BYkRgqMJ"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, philmd@redhat.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--IlstGuZ+BYkRgqMJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 27, 2021 at 01:53:23PM -0400, Jagannathan Raman wrote:
> @@ -96,6 +102,28 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
>                     strerror(errno));
>          return;
>      }
> +
> +    dev = qdev_find_recursive(sysbus_get_default(), o->devid);
> +    if (dev == NULL) {
> +        error_setg(&error_abort, "vfu: Device %s not found", o->devid);
> +        return;
> +    }
> +
> +    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        error_setg(&error_abort, "vfu: %s not a PCI devices", o->devid);
> +        return;
> +    }
> +
> +    o->pci_dev = PCI_DEVICE(dev);
> +
> +    ret = vfu_pci_init(o->vfu_ctx, VFU_PCI_TYPE_CONVENTIONAL,
> +                       PCI_HEADER_TYPE_NORMAL, 0);

What is needed to support PCI Express?

--IlstGuZ+BYkRgqMJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE4r+UACgkQnKSrs4Gr
c8iGnQgAxeXoSyVH1s+lJly8YOH7tCtpOUS76c2QG96Zfl9NqCh5VK92P4lsW3gA
PYTrAjtWyT9Gkb7h+vq+K2xDoEQ1VytWkAH9fHXCIX5IDPdmkg5t7YNtx9q3RqVT
Ciajp1Yk5VoD1MtKOQGKBp1xRrDW9sAvy/+ld8ubGyVT4XnmLrIt/bU1Ye569JrM
RnvIpNWWFXFuR+EMV0zNDYesxnF+RZcnqr/qsl2J6NtDNLDAkJA/VZSs3sR2Uh9u
c4JkIb7IWvqN/9duDz+VBAw+uI3brjS6xYBMhhcoNiCljfOA0nXtudrT21ZY8m5i
TNsZeB1DjTtXUrcZPD5ZORY0w00oHQ==
=C+ML
-----END PGP SIGNATURE-----

--IlstGuZ+BYkRgqMJ--


