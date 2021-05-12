Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A300D37C76F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:21:12 +0200 (CEST)
Received: from localhost ([::1]:44208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrbj-0007ID-Ki
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgra4-0005Oo-0Z
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:19:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lgrZx-0004tA-V9
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620836360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R4xa8l4NsiRnXkHfLJ0MtU4VjOrS7GFvlq/3AoHR0fw=;
 b=UDZzuHdlU9n/UXD2dUsogSnc7fbAxC+VDcZCMzXpfa2VrQOCUXuTE8Tk2/IP6dA+xYQD+C
 OhN0sKKkJYfJEASCbl6XC6YoXSmuU3Pxbp6eeeCftm3ePIni7qJZTOdysQdus9qu1nj0Co
 uZAi/Scl01iKuZzEuk9bWSvTA62SJg8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-AXNdX3A4MBy1pMjG3IklpA-1; Wed, 12 May 2021 12:19:16 -0400
X-MC-Unique: AXNdX3A4MBy1pMjG3IklpA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BBC6195D561;
 Wed, 12 May 2021 16:19:14 +0000 (UTC)
Received: from localhost (ovpn-115-51.ams2.redhat.com [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EC3A60CE6;
 Wed, 12 May 2021 16:19:03 +0000 (UTC)
Date: Wed, 12 May 2021 17:19:02 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 07/22] cpr
Message-ID: <YJv/9uOKbYmhAyQp@stefanha-x1.localdomain>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-8-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1620390320-301716-8-git-send-email-steven.sistare@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QOWwRyHgJNb5sZe7"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--QOWwRyHgJNb5sZe7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 07, 2021 at 05:25:05AM -0700, Steve Sistare wrote:
> To use the restart mode, qemu must be started with the memfd-alloc machine
> option.  The memfd's are saved to the environment and kept open across exec,
> after which they are found from the environment and re-mmap'd.  Hence guest
> ram is preserved in place, albeit with new virtual addresses in the qemu
> process.  The caller resumes the guest by calling cprload, which loads
> state from the file.  If the VM was running at cprsave time, then VM
> execution resumes.  cprsave supports any type of guest image and block
> device, but the caller must not modify guest block devices between cprsave
> and cprload.

Does QEMU's existing -object memory-backend-file on tmpfs or hugetlbfs
achieve the same thing?

--QOWwRyHgJNb5sZe7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCb//YACgkQnKSrs4Gr
c8hCVgf/WOFBw0WYlB8ie88F+sh5RSuhKmk6EU+zkOpuKyvTI+Mbp/LZGOrYdngz
F7FAZd8/t6/iBpwM8SAuDmhCFjvm6Fez1jlMZqvRslJ1hfLDvwut5Z1xiHWjPuOm
6w0ygmZl3ICQq5s44yn/mJaByhHOK1MVHdXUdVUxMAuQ+hxD/9cSo0VWvh7/YCe8
72gyCrj4Wrn84StgyjSexgqpl2kQ7c/USPgm70V2d0+lFEZTl+y5xML0yN6zoy70
0Ji6hze5A8JJoz7JElSajhvMbzzV9lRIBOb1wFAhXbWXlIrdq5lhNSZg/0D68tjR
r9SIIdAbdD7LUsAxdBCCOk3q80HwrQ==
=zMNj
-----END PGP SIGNATURE-----

--QOWwRyHgJNb5sZe7--


