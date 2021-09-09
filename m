Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634F0404661
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 09:39:15 +0200 (CEST)
Received: from localhost ([::1]:47632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOEeS-0007LZ-1e
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 03:39:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOEd4-0005wm-Ft
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:37:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mOEcz-0003jB-FW
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 03:37:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631173063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6v4lVeUpuGrKMtq5uD3BM/uEgETSzS/sQ6YNMTQ61pA=;
 b=aylOCWDTMx2gL38+NRF3cFiIMkUB0rlzlMjZBXlnMiuSspQOIavHsViq5pxi7QlGrt7XAB
 L3CpbKP5eXwYKletvy7i58zGVvLGzZTXm0MlIw7wptg3sIgC2UTE2pFZFMu4l3vHJLC0qM
 znq3lN5X0t0E4lLjlOIdWQ9QC5bAVfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-hSvW6llgPjuPbGeOWlPDkQ-1; Thu, 09 Sep 2021 03:37:42 -0400
X-MC-Unique: hSvW6llgPjuPbGeOWlPDkQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 927168464D5;
 Thu,  9 Sep 2021 07:37:40 +0000 (UTC)
Received: from localhost (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53F5026DF6;
 Thu,  9 Sep 2021 07:37:35 +0000 (UTC)
Date: Thu, 9 Sep 2021 08:37:34 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH RFC server v2 08/11] vfio-user: handle PCI BAR accesses
Message-ID: <YTm5vhhceiHHl0IN@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <8dde83642333cbe5e616a619507697dcfd315a10.1630084211.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <8dde83642333cbe5e616a619507697dcfd315a10.1630084211.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="T4BN8iQrp7VZ00sE"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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

--T4BN8iQrp7VZ00sE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 27, 2021 at 01:53:27PM -0400, Jagannathan Raman wrote:
> +/**
> + * VFU_OBJECT_BAR_HANDLER - macro for defining handlers for PCI BARs.
> + *
> + * To create handler for BAR number 2, VFU_OBJECT_BAR_HANDLER(2) would
> + * define vfu_object_bar2_handler
> + */
> +#define VFU_OBJECT_BAR_HANDLER(BAR_NO)                                         \
> +    static ssize_t vfu_object_bar##BAR_NO##_handler(vfu_ctx_t *vfu_ctx,        \
> +                                        char * const buf, size_t count,        \
> +                                        loff_t offset, const bool is_write)    \
> +    {                                                                          \
> +        VfuObject *o = vfu_get_private(vfu_ctx);                               \
> +        hwaddr addr = (hwaddr)(pci_get_long(o->pci_dev->config +               \
> +                                            PCI_BASE_ADDRESS_0 +               \
> +                                            (4 * BAR_NO)) + offset);           \

Does this handle 64-bit BARs?

> +/**
> + * vfu_object_register_bars - Identify active BAR regions of pdev and setup
> + *                            callbacks to handle read/write accesses
> + */
> +static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
> +{
> +    uint32_t orig_val, new_val;
> +    int i, size;
> +
> +    for (i = 0; i < PCI_NUM_REGIONS; i++) {
> +        orig_val = pci_default_read_config(pdev,
> +                                           PCI_BASE_ADDRESS_0 + (4 * i), 4);

Same question as in an earlier patch: should we call pdev->read_config()?

--T4BN8iQrp7VZ00sE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmE5ub4ACgkQnKSrs4Gr
c8iMfggAn4ebUD13Gx2lAfoIBRLavfGqIxqhKyl+5M8Aj/3qJ8WHmxrQvEqzCx9m
QkCMYO/8wiCP6pqXtJKHZzrmmjuEUhVG39pzMThY+KuLiA4y7Zx7zOoyt2BNhlsG
41dhYSLWf9ZqKi14T+T0IWUjKUnpD861sAYGucX1zLfKDdo9hCWsRW+GwUv9ZdPx
lV82ZPBXl+BP7jy8d1/KqEjr1xxFdbyx17lTsxDp3JRto74ugsV0OQKhwYw3oVp5
J1w7K07lAgeLuDfcARxINuQj0kX0b4EbhlXqu2k7MeitcM4T/SQxEGA3IkUV+X5R
/EIXHTFqcucquQZfjC6CFt/OXCqOwA==
=s4yY
-----END PGP SIGNATURE-----

--T4BN8iQrp7VZ00sE--


