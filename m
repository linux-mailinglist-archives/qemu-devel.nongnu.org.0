Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB1C3F5F92
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 15:54:18 +0200 (CEST)
Received: from localhost ([::1]:36464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIWsa-0000rr-UR
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 09:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIWrY-00084O-Ri
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:53:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mIWrX-0000uq-Cc
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 09:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629813190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sLT1ND8kO4ysHtumituM+TlV+nDtOiYIauJhd04mWck=;
 b=gE9lTt4UaUGYsjBB2mXbYxNKS3F/SZa/B7hcGJvlmjjb5y6txPQKQ9l3oxZQhpq/iRfFay
 +HsY0QrJL0/AyOiMyToVT1JLjvX5uJfArBHwqs6xRk3kwtbUQt9EqPeCrJSlI24odMb6i2
 mF5OjUmgPdahVf8HpiLhuZw7cy2vKko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-6g4aD96ZPZq42MKs4SaKqQ-1; Tue, 24 Aug 2021 09:53:07 -0400
X-MC-Unique: 6g4aD96ZPZq42MKs4SaKqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB286192FDA2;
 Tue, 24 Aug 2021 13:53:05 +0000 (UTC)
Received: from localhost (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6F995C1A3;
 Tue, 24 Aug 2021 13:52:59 +0000 (UTC)
Date: Tue, 24 Aug 2021 14:52:58 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Subject: Re: [PATCH RFC v2 03/16] vfio-user: Define type vfio_user_pci_dev_info
Message-ID: <YST5ul6WZ5tM38F5@stefanha-x1.localdomain>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <4153fb93ac5c353911a1321efc0a02f9f402acd5.1629131628.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <4153fb93ac5c353911a1321efc0a02f9f402acd5.1629131628.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jub6TsFtzL3WSwVG"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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
Cc: john.g.johnson@oracle.com, jag.raman@oracle.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--jub6TsFtzL3WSwVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 16, 2021 at 09:42:36AM -0700, Elena Ufimtseva wrote:
> +static Property vfio_user_pci_dev_properties[] = {
> +    DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
> +    DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),
> +    DEFINE_PROP_END_OF_LIST(),
> +};

Are we missing out on properties that could be common for all VFIO PCI
devices like x-pci-vendor-id, x-pci-device-id, etc?

Stefan

--jub6TsFtzL3WSwVG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmEk+boACgkQnKSrs4Gr
c8husAgAj4B0NDcL3pfhgd3kRX8M0tCEHeZqzLtWUPedtH+O+Lz92l6/2JzDEdxJ
wpTbt0971zeEmkA+hU9kgkUw7bEUXWMv4AkMKIrWlsyX2QxOXntBnsB+JeHUW14S
LMr/mMGy3OjFVBkb9k+4sKIpEOHxsDPXhNP4cQmca+SmKZEsRSzce6KKZ1RsIBs4
NcQd5R/F3U20ZQpqLQHcs8qQdRKAQOV+hP2RsGP9TsDBqRW8rcwd5CxldEALmg1E
bnpxavOEjSb5Ww/8a4juQIn7T4YV6O9htBTA6LMvAUsEXJTfETvW/DKFFdIanFzr
OnTELlQKyV/hKt5c8KT/feiCcBal3A==
=fwlM
-----END PGP SIGNATURE-----

--jub6TsFtzL3WSwVG--


