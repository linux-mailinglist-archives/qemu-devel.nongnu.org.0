Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEAB2AEE7E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 11:07:47 +0100 (CET)
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcn2Y-0003Wm-29
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 05:07:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcn16-0002qP-P6
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 05:06:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kcn12-0005TI-Lk
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 05:06:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605089171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xPX+oTQamXv4uNIj2cWOArnTHO3k+FQ7Ufk9/nkrkhM=;
 b=Pdi4uYOOgxlTlVnQpDXkWDi2fOsdbRakaxUE+RtcoC1cjtGqrNjkOFEdM3psGZ2J4clQu1
 sQQpuWYL+DreLSSBSr0J9r/ZBL29TJek72RojlBESziSdpXOd+w/u839B4WmxO/gsdbbfI
 EGjXBu1QmmLqMQeHAx1jL5JNugpwZ+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-VtEDCAflPqCIzrY5U79d8g-1; Wed, 11 Nov 2020 05:06:07 -0500
X-MC-Unique: VtEDCAflPqCIzrY5U79d8g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41BB9801F9A;
 Wed, 11 Nov 2020 10:06:06 +0000 (UTC)
Received: from localhost (ovpn-112-222.ams2.redhat.com [10.36.112.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F6B76EF5B;
 Wed, 11 Nov 2020 10:06:05 +0000 (UTC)
Date: Wed, 11 Nov 2020 10:06:04 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Harshavardhan Unnibhavi <harshavardhan.unnibhavi@gmail.com>
Subject: Re: Qemu first time contribution
Message-ID: <20201111100604.GD1275139@stefanha-x1.localdomain>
References: <CA+8xkr4ABLeYam6EPBdMKkX=HB3gik079zxUyo1TF91sCXmoQg@mail.gmail.com>
 <e84575ae-4eee-ca5a-e4ca-9b1660a8799d@redhat.com>
 <CA+8xkr4t4s8=dCp6MjcH59y_6KPO0a7-pNi0-A-8Ft14kP6F2Q@mail.gmail.com>
 <20201109101729.GD783516@stefanha-x1.localdomain>
 <CA+8xkr7YSv7v0=SquA-bdOOivqsBEnuUEa35BXzLsRuNte8xqQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+8xkr7YSv7v0=SquA-bdOOivqsBEnuUEa35BXzLsRuNte8xqQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="n/aVsWSeQ4JHkrmm"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--n/aVsWSeQ4JHkrmm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 10, 2020 at 10:07:44AM +0000, Harshavardhan Unnibhavi wrote:
> This looks interesting, let me take a look at it. Thank you!

Okay, great. Feel free to email qemu-devel and CC me if you have
questions. We can also chat on #qemu irc.oftc.net (my nick is
"stefanha").

You can configure QEMU to use Linux AIO (block/linux-aio.c) like this:

  $ qemu-system-x86_64 -M accel=kvm -m 1G -cpu host \
        -drive if=virtio,file=test.img,format=raw,aio=native,cache=none

This will boot from the test.img image file using an emulated virtio-blk
device.

Stefan

--n/aVsWSeQ4JHkrmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl+rt4wACgkQnKSrs4Gr
c8jZxQf/ZxmzERdCz0kkYOWq2YnrcG338uhVbMsC0omM7SCYkRp6mEkvdeCPrYht
B7xf4CqYPnqXWeQkenA2DzsdcYRSTwt80j3rl8zoCLR9C+3/FkajRCGyEBSByj/w
7LLK1k1djpKtbgvjt4sy2oVEGfp3V0yqBUKuUt6qZSJVI0+yLgB2e64N2unzCcdU
+WqLTzoKPsnmHygMwo3oee5uTpMn7nZrz0h7yrD78pkEzbqadrsb5uT54cuv/lwH
XC7sCzfBM/jSKP6CqX2+55A7FSJg/wmmpTTbOSr+jW4XVvNc9dAvWN037W/aahz3
qxgf216j46Yre9VK3WC01sX9mtQrmg==
=UwyW
-----END PGP SIGNATURE-----

--n/aVsWSeQ4JHkrmm--


