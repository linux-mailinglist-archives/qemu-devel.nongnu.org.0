Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505C85BF1EF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:26:10 +0200 (CEST)
Received: from localhost ([::1]:48700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oanZ3-0005Ke-DS
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oajjB-00069U-UP
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 16:20:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oajj3-0000rL-2q
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 16:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663705210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V9P3yZ6HwV7PaF2SgQi8ewBSSKSZC525WP+eBYriWWk=;
 b=B8u39hdREPCluIXHF4QffqtVh23pWbC4jkwQ489MtL5WUYd69y0i6XlHFLO/aAHDdBfbp4
 SLz+nUzTOEzlt7yOpZ6W3z28sPtv34ARwq3wBOm552mTZ0QIOk+tX3uqUdj16z4pFBK2ET
 5J4ctpcOOJbr5EzCtQRH54iylbXcWU8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-Az2CP58wMO-f9jf9APHb6Q-1; Tue, 20 Sep 2022 16:20:05 -0400
X-MC-Unique: Az2CP58wMO-f9jf9APHb6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 161D88630D7;
 Tue, 20 Sep 2022 20:20:05 +0000 (UTC)
Received: from localhost (unknown [10.39.192.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 982342166B2E;
 Tue, 20 Sep 2022 20:20:04 +0000 (UTC)
Date: Tue, 20 Sep 2022 16:19:55 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, stefanha@gmail.com
Subject: Re: [PULL v2 0/9] loongarch-to-apply queue
Message-ID: <YyogaycTLTCkWuv4@fedora>
References: <20220920095058.4124145-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FQX7fMs0yk90i7cI"
Content-Disposition: inline
In-Reply-To: <20220920095058.4124145-1-gaosong@loongson.cn>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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


--FQX7fMs0yk90i7cI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--FQX7fMs0yk90i7cI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMqIGsACgkQnKSrs4Gr
c8hSlQf8CnQ/iV0RPAn4624iriDJEKb9W4cZPP8vMfr9mQ9JnsWpKMKXwW8YiWA6
hf8NaKnR6OYa/TE2UBSsJ3gN/4e+C1x2sD4usHKCb8qYp34uevxdP3pYzqf3xl45
35BZE65MGfQpP1YBnir4lvqCjWbDwbOvSAZGjIviTDqrDklperiI+d1L6+OTATFs
tnW/VfqfwhJjcd0zUWVse+xdz3to/rlemQitFORGbq0FB5M4kUGMUBdb6h+NHrAy
G7XKeowE/K9GVO9DYZPopg0K7/cCKhLFrA34WtboOUdeZw6d8HKbVSxPSiSunoDX
FaLr7eug3CLswjxS1OeffH9vFFNZ4A==
=Tf3E
-----END PGP SIGNATURE-----

--FQX7fMs0yk90i7cI--


