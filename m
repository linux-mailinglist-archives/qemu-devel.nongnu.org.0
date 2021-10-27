Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9028943CFDB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:37:28 +0200 (CEST)
Received: from localhost ([::1]:44554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfmrf-000404-LP
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfltf-0003u5-V9
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:35:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mfltc-0004wl-Kt
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:35:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635352520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kld8KPgFL+UyUMjRwrBr45ese7sWT/fK6K0oE/WLLhM=;
 b=E54GFfzThPxBuRePQ2pSXyE4nbdQrEGYtTjOiKdr9JJCxdcU9gaKclF8Pq57JTrYI4pDnF
 /7U7d6BmsPBNwtyQ/KcUdFzZqIiCsldNlyYgrS/pmKhSMqdPtVVjT9NpDrOll6JFMoWIs7
 vZB16psMa4YCnkSVyKQOQ+V4BSOY4Uc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101--w6KDGRoPV-TXgP9pkQ7Sw-1; Wed, 27 Oct 2021 12:35:18 -0400
X-MC-Unique: -w6KDGRoPV-TXgP9pkQ7Sw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBBFE10144EF;
 Wed, 27 Oct 2021 16:35:15 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DF465F4EE;
 Wed, 27 Oct 2021 16:35:15 +0000 (UTC)
Date: Wed, 27 Oct 2021 17:35:14 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v3 07/12] vfio-user: handle PCI config space accesses
Message-ID: <YXl/wsIYXBfuzuXU@stefanha-x1.localdomain>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <eb770c1ceab027917cafc235d41f33f42791ebec.1633929457.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <eb770c1ceab027917cafc235d41f33f42791ebec.1633929457.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wPpLb+saGr/LIXE1"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 thanos.makatos@nutanix.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--wPpLb+saGr/LIXE1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 11, 2021 at 01:31:12AM -0400, Jagannathan Raman wrote:
> +static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
> +                                     size_t count, loff_t offset,
> +                                     const bool is_write)
> +{
> +    VfuObject *o = vfu_get_private(vfu_ctx);
> +    uint32_t pci_access_width = sizeof(uint32_t);
> +    size_t bytes = count;
> +    uint32_t val = 0;
> +    char *ptr = buf;
> +    int len;
> +
> +    while (bytes > 0) {
> +        len = (bytes > pci_access_width) ? pci_access_width : bytes;
> +        if (is_write) {
> +            memcpy(&val, ptr, len);
> +            pci_host_config_write_common(o->pci_dev, offset,
> +                                         pci_config_size(o->pci_dev),
> +                                         val, len);
> +            trace_vfu_cfg_write(offset, val);
> +        } else {
> +            val = pci_host_config_read_common(o->pci_dev, offset,
> +                                              pci_config_size(o->pci_dev), len);
> +            memcpy(ptr, &val, len);
> +            trace_vfu_cfg_read(offset, val);
> +        }

pci_host_config_read/write_common() work with host-endian values. What
is the endianness of buf?

--wPpLb+saGr/LIXE1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF5f8IACgkQnKSrs4Gr
c8jDswgAposYf25MrHKoMMjneirIw2T/2JhB+wLo2AuEf07WTB5Gmz4q4ozCwSno
ynNxYHviGN7WIQP20ZEUUNkrdyu6eDl8D08sb7Jh7gV9+pXaJQUIEuW6YBcOl1S0
VhR8npoYbMFaz+hxqpHqYktg5RAUJAyLHxDbUcjoteiWmk8DKzmkfipDlKSdSCHT
R42vfHXOhJ5idevK7a/ErlrKUTrwTWlvevytjlrJv3AdMeRw/IWmASgSJW9voAWk
GLJgQE6AqrTB3p7YNkYUfQGG16XI3o9f/cENs/UYOb68YYf6gJScerbblYmyHFJx
ry8YvVXv0j9YhQIGwUbTftuAzTDyig==
=GR9r
-----END PGP SIGNATURE-----

--wPpLb+saGr/LIXE1--


