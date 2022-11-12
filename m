Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BA26269D9
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 15:17:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otrIK-0002Vd-08; Sat, 12 Nov 2022 09:15:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1otrIE-0002OR-CC
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 09:15:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1otrIC-0001MO-Fb
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 09:15:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668262529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WLv9aAgV6DV7arzF1F/D3RwSJHZyVmSOKD74NXUpCg8=;
 b=cHS/TEfJSfr1cQ9a+qBN8ir2Rv7eZnLBnaosfOtx2Du7VYX+2iDQ8enaXCYhny0HAqnLV0
 GJi2DGyAt9tQWojTfZVnxr7Hbx7Pc45jtqWEe1CxEUubB0DAoxjhcPzXfZG/OCJ8lOYMf6
 Q+3cvc03TQxIMMmU35F1zsm0kY4bp64=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-9GumWu5oMoen6TRsDImwOQ-1; Sat, 12 Nov 2022 09:15:26 -0500
X-MC-Unique: 9GumWu5oMoen6TRsDImwOQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48D4E85A583
 for <qemu-devel@nongnu.org>; Sat, 12 Nov 2022 14:15:26 +0000 (UTC)
Received: from localhost (unknown [10.39.192.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B265E40C2066;
 Sat, 12 Nov 2022 14:15:25 +0000 (UTC)
Date: Fri, 11 Nov 2022 21:32:17 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PULL 0/8] Misc fixes
Message-ID: <Y28FsebouRt72Ty6@fedora>
References: <20221111103048.202519-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LvNJvbD37iy6zzma"
Content-Disposition: inline
In-Reply-To: <20221111103048.202519-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--LvNJvbD37iy6zzma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--LvNJvbD37iy6zzma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNvBbAACgkQnKSrs4Gr
c8iT/Qf+LZ4Vw6QgKyPHYXh2y3fmJMxOKzDql8HUrOs731CXLyzpUlLEW6NCa3LO
18PwlB9Geu0XoCaCkSmLaZMcsgOotGURHomeeHGJqjYTy5Aj/CJmRbSc+wtrhSif
jJvZJjkf3DvW9FXAntKiXNE2uhXx3Ts4F1CuJkrK5nqI+ezN5VJWs4qqv1+lsR6A
mhBK3wImRPv/7ODG2YvAxsxLYuZOZKxnhhk70fuXSMjTlJuS7ck3AN40/RJxcftp
Kvs4fwxq9ykM7lfQn1jiBK0h7V627nanLYoJKZWt2A55MtI6woMhRHegdRpYLl08
bLCUSCs2v8OY3NOxMGdpFyikB6WHCw==
=jRVY
-----END PGP SIGNATURE-----

--LvNJvbD37iy6zzma--


