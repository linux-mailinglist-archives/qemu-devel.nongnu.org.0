Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB99375667
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:19:24 +0200 (CEST)
Received: from localhost ([::1]:32964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lefmd-0005oW-8k
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:19:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lefjY-0004A8-G1
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:16:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lefjW-0006S2-6i
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620314169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZwEVipBTyU2jiw/AeQMVFnvpOXqLrNTPIMY/ficnzb8=;
 b=bXcYE5F6u+isaoNlHD8BqBqtH6Uzw4dqUBI0fQdsQ3CsdiCATS1qBtot+ZcYwt7lsh5Ceq
 SEGmuL5aSoLDsS2g2Qs2BaR0cqZj391jYGD1RFbNu+1Z/OpI59+S3N0SgFGwJPiA0K12qc
 IcVI0ehKsoPehSwEmFTE+ImLCbqbkf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-Egxum5n1PQmUh11-uPNmVA-1; Thu, 06 May 2021 11:16:07 -0400
X-MC-Unique: Egxum5n1PQmUh11-uPNmVA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 587C318BA280;
 Thu,  6 May 2021 15:16:06 +0000 (UTC)
Received: from localhost (ovpn-115-109.ams2.redhat.com [10.36.115.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E9D863B8C;
 Thu,  6 May 2021 15:16:02 +0000 (UTC)
Date: Thu, 6 May 2021 16:16:01 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 18/26] DAX/unmap: virtiofsd: Add VHOST_USER_SLAVE_FS_IO
Message-ID: <YJQIMfU00U3ZR3BL@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-19-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-19-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="s+/LkN8WXC3Z886s"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--s+/LkN8WXC3Z886s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 28, 2021 at 12:00:52PM +0100, Dr. David Alan Gilbert (git) wrote:
> +    close(fd);

I looked back at the hw/virtio/vhost-user.c slave channel code and it
closes fds for us. Looks like this close(2) call should be removed, but
please double-check in case I missed something.

Stefan

--s+/LkN8WXC3Z886s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCUCDEACgkQnKSrs4Gr
c8j2mgf/T8Y9qq45TavKJizEPOE8iSWeTSoPKzJcQ7BfP3CLbMkubx35MNst6oXz
P2lJkq2+cmwPAOc8/bs7kRZU4s0pVki6bqQORaduoP2oEEsLVGZj89Wj/YbD9Lmf
R9Mdb5NPCK7O+6iws582cAPpTKU9Zb6ctcSKIMQfZqF8HVIra1CCAv8MDWv2CWEH
fQt+rVv6q4MKROijEQ/Ndd3of0hVtQ7LJmlXt2KjSd82ed5o9Jb9oQ3xdaB9pBLH
XAyiHnfWG14n7LCFH9xNLbaGvKOjZiceSgGnoKDT0xIMoAiQSV0Y3mszpXQsHW6s
iHxWG4w8TR9fTLivRTKqcZw96wWuBA==
=d7sN
-----END PGP SIGNATURE-----

--s+/LkN8WXC3Z886s--


