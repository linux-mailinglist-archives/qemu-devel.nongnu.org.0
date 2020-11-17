Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6442B5EBC
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:55:46 +0100 (CET)
Received: from localhost ([::1]:60814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezaL-0007rv-LM
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kezXw-0005pk-DE
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:53:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kezXu-0002Mr-Kc
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605613993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ORGIWbDZHVGHQKz+yXjGHqNxxtUKUaElXUNeXuBfTrk=;
 b=MkrUBti728nzp9WpB2n+gQN9WYWUfhNbkOtgov+AvB9BpZdJYopVn1k/6+MMMn5hVt0Pqv
 xmXff3UocDFOGZ9Z8irJVirKJA7hBxG8L1SY2pWkye91FXiXvNyxPdSI/tM5Dc9SXoJDv3
 b/SNDeI9aHxIO8WX7jduDmj5ohnlg6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-DCiX4ymnPyG1vYC0E1eKrQ-1; Tue, 17 Nov 2020 06:53:11 -0500
X-MC-Unique: DCiX4ymnPyG1vYC0E1eKrQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 286778018A1;
 Tue, 17 Nov 2020 11:53:10 +0000 (UTC)
Received: from localhost (ovpn-113-172.ams2.redhat.com [10.36.113.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC17010013D0;
 Tue, 17 Nov 2020 11:53:06 +0000 (UTC)
Date: Tue, 17 Nov 2020 11:53:05 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Mike Christie <michael.christie@oracle.com>
Subject: Re: [PATCH 1/1] qemu vhost scsi: add VHOST_SET_VRING_ENABLE support
Message-ID: <20201117115305.GJ131917@stefanha-x1.localdomain>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
 <1605223150-10888-2-git-send-email-michael.christie@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1605223150-10888-2-git-send-email-michael.christie@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Ublo+h3cBgJ33ahC"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, linux-scsi@vger.kernel.org, mst@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org,
 virtualization@lists.linux-foundation.org, target-devel@vger.kernel.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Ublo+h3cBgJ33ahC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 12, 2020 at 05:19:00PM -0600, Mike Christie wrote:
> +static int vhost_kernel_set_vring_enable(struct vhost_dev *dev, int enable)
> +{
> +    struct vhost_vring_state s;
> +    int i, ret;
> +
> +    s.num = 1;
> +    for (i = 0; i < dev->nvqs; ++i) {
> +        s.index = i;
> +
> +        ret = vhost_kernel_call(dev, VHOST_SET_VRING_ENABLE, &s);
> +        /* Ignore kernels that do not support the cmd */
> +        if (ret == -EPERM)
> +            return 0;
> +        if (ret)
> +            goto disable_vrings;
> +    }

The 'enable' argument is ignored and this function acts on all
virtqueues, while the ioctl acts on a single virtqueue only.

This function's behavior is actually "vhost_kernel_enable_vrings()"
(plural), not "vhost_kernel_set_vring_enable()" (singular).

Please rename this function and drop the enable argument.

--Ublo+h3cBgJ33ahC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+zuaEACgkQnKSrs4Gr
c8ggbgf/amsccaIgLNwt7fBI9E5/mNlfsgJGbQlcgWAJWJ6giGQfPamIN2qEFbS9
TbTbc8ng7fqj3q9VA/QSYqqGT4o4S3ejHaluLfL8OG3NQhjB1jl1tv1B1hqUpbjh
7BvoLZvmN4mEBCwTMInavK7mBXwgIJX6dxAZdU6ZGiW3KjlNQQK01erQax/PFvrz
siTJLUyQP6RiIctvZ3TREgvdoCo7iS1YkxcDtRQU3Y1aVUSg49pUaq/oeLg5FMDi
HoIqvlqazYoI/asj1Fgli1qtZMX2tPom7IwdxPc+5pmyHkh4lT1JR0wwulWnwapb
x/T7SH6sVbYXRrs+JlLTrw7yvtAZwg==
=9dMr
-----END PGP SIGNATURE-----

--Ublo+h3cBgJ33ahC--


