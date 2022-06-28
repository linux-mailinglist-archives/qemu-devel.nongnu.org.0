Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC3255BF91
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:43:36 +0200 (CEST)
Received: from localhost ([::1]:57384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66op-00089C-AN
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o66SW-0003s7-NE
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:20:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1o66SV-0003Ku-5H
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656404429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PKW1qxe32vaQi6ctGmaJQhGhmXzVFu7373j6crrdyBk=;
 b=VNFMZcJEV9rFFo5QBf4dooAvXzhzK5EF7NPXw8vH1cZIfBqNI5pBZbi17MGoenz3k4+CkB
 xRF59bETKAB2JrVXjPKCqM+fUoo1W5I8f4JJ4iiVshc4ZdZXCMEwJHUAZyhZiaGa736GDu
 Ve39QS5aqtGPKfLqdo7xupTvloBQQUc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-lMPLdcDUM9CDJSmA5tE4Fw-1; Tue, 28 Jun 2022 04:20:23 -0400
X-MC-Unique: lMPLdcDUM9CDJSmA5tE4Fw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3740C811E80;
 Tue, 28 Jun 2022 08:20:23 +0000 (UTC)
Received: from localhost (unknown [10.39.195.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF6E11121314;
 Tue, 28 Jun 2022 08:20:22 +0000 (UTC)
Date: Tue, 28 Jun 2022 09:19:27 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com,
 qemu-block@nongnu.org
Subject: Re: [RFC v3 5/5] qemu-iotests: add zone operation tests.
Message-ID: <Yrq5j3TQs8crLRVn@stefanha-x1.localdomain>
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-6-faithilikerun@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="oGqZyyPiqIb/cBdo"
Content-Disposition: inline
In-Reply-To: <20220627001917.9417-6-faithilikerun@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


--oGqZyyPiqIb/cBdo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 27, 2022 at 08:19:17AM +0800, Sam Li wrote:
> diff --git a/tests/qemu-iotests/tests/zoned.sh b/tests/qemu-iotests/tests/zoned.sh
> new file mode 100755
> index 0000000000..262c0b5427
> --- /dev/null
> +++ b/tests/qemu-iotests/tests/zoned.sh
> @@ -0,0 +1,49 @@
> +#!/usr/bin/env bash
> +#
> +# Test zone management operations.
> +#
> +
> +QEMU_IO="build/qemu-io"
> +IMG="--image-opts driver=zoned_host_device,filename=/dev/nullb0"
> +QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT
> +
> +echo "Testing a null_blk device"
> +echo "Simple cases: if the operations work"
> +sudo modprobe null_blk nr_devices=1 zoned=1

Please use bash's "trap" command to remove null_blk on exit. That way
cleanup happens whether the script exits successfully or not. See
tests/qemu-iotests/108 for an example.

> +# success, all done
> +sudo rmmod null_blk
> +echo "*** done"
> +#rm -f $seq.full

Why is this commented out?

--oGqZyyPiqIb/cBdo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmK6uY8ACgkQnKSrs4Gr
c8hSCwf/XQUJFAix1h3Jj1kWd8SGVAbfmwFPU1HHIGSEocHRLD+6plLJjDW5Rq+l
EzO3TCuJtUVyJ5CmhuHUFoTATcta2FEYtk2na2ET75hSx28omA89W7hyCGAyeHR9
zaGur7rsJnJISiJUvC9YyPHH1CwicwyXjUO/wqGJBl2s55leU7+1F7/au4Y4CFsN
rpBpfLJYVkN2+nuH3qCdi6FIjV2xbixdqEaWC8ceGbJ+3PMdTaxIgs24/GCrYCa7
O9FKxRsJyXh2mWu0iAP5JiRc5gPPwpCi8VZ8pX3sZ6RJJvgtn6/uELeXoyuGbk12
s89ih70xPEO8yteu/BHiwR/mP3CVLQ==
=m8YQ
-----END PGP SIGNATURE-----

--oGqZyyPiqIb/cBdo--


