Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7EA5BBA4E
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 22:23:59 +0200 (CEST)
Received: from localhost ([::1]:47746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZeM2-0000VY-Ow
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 16:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oZeGG-0008Q8-25
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 16:18:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oZeGD-0001Ca-Iy
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 16:17:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663445876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6EMh6jFhMd4hky3/VA/63EgVbHnVnEiLt9FYy6j7A58=;
 b=SEd1Jf7N1LqBQxe0Xmt7Tk6Ta2zRUy8tBT8HDnKb/5GN7J5gWF3Zk5URmpmccmhiFJsU2d
 CNBU7s7xGldFzAQUobjH87GNiXKunjOXAEnWr5OhHtyxSTncFy2Hb7J1yTjDCNvqX7wP1b
 94zFJMwgZYIH7aOABBR8uEVNpziMOx4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-mdTw5meaP56Fx7Kt7purqw-1; Sat, 17 Sep 2022 16:17:53 -0400
X-MC-Unique: mdTw5meaP56Fx7Kt7purqw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2B5A29AA389;
 Sat, 17 Sep 2022 20:17:52 +0000 (UTC)
Received: from localhost (unknown [10.39.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC2FB17585;
 Sat, 17 Sep 2022 20:17:51 +0000 (UTC)
Date: Sat, 17 Sep 2022 16:14:55 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, pizhenwei@bytedance.com, dongli.zhang@oracle.com,
 armbru@redhat.com
Subject: Re: [PULL 0/3] hmp queue
Message-ID: <YyYqv9+BXicrKEMt@fedora>
References: <20220915154606.124713-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="25ZgROAgh7ZeoR9O"
Content-Disposition: inline
In-Reply-To: <20220915154606.124713-1-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--25ZgROAgh7ZeoR9O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--25ZgROAgh7ZeoR9O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMmKr4ACgkQnKSrs4Gr
c8jyLwgAtXL0KVKgt9ny6hVjw+YkiOaYYoWTL7ZTigeWSy/o9yOYNpRvCQ+CECSU
74OrWkKPF0SMN7bg/pTe8ezgwaDKDDwmu90+/mgmi3EGI3qlgJBzXJ9JbXgni1cM
vUgiTGtcBDvZS2ibthnOwzbRjKTFdt7cxVQ5PJH2LyFkefHNFzTPH2ZnpS21MMpp
WN/KhOY3b9Ys0rNPzVDSSmN6piRkB1bwUq2rZmV91rnpaNsd8maYTCEzgFebLORi
Hn8Hu3TzDwu58KmZKQ//PvylT3A2o8atEZ+JcrEJ8wIxnzK0e0o64AgeWckqT32Y
0BOiqyHl1D2wUEH7TwNGrT+YPI3lZQ==
=gCL3
-----END PGP SIGNATURE-----

--25ZgROAgh7ZeoR9O--


