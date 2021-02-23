Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2123227F8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 10:46:33 +0100 (CET)
Received: from localhost ([::1]:56902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEUH2-0008IY-5W
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 04:46:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEUFW-0007R7-A6
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:44:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lEUFT-00016d-QM
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 04:44:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614073495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6kZZ99oPbITrS1VmgsqQ3SuGnQHfBzpKPYJtEhzLrEA=;
 b=S9/LlRPcmXbAq1QT2WHvRRf644rfeAEUkQDldTVvxcD/Sn/vpNYcZrKdDk7rnVvG1gpXcZ
 y0kDK8C06HLWr6YhV9Mt1Pho5mky/CmcFxfq1KY1Mo+/H5oLVTcno3bfPnSdU+5ot2K1KL
 NxNQi/LM0ZlwwreVgJVXDjf+3JQV/hw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-2wDFe3nfNoO9A0QRlSBjzA-1; Tue, 23 Feb 2021 04:44:50 -0500
X-MC-Unique: 2wDFe3nfNoO9A0QRlSBjzA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BEB3100CA81;
 Tue, 23 Feb 2021 09:40:38 +0000 (UTC)
Received: from localhost (ovpn-114-203.ams2.redhat.com [10.36.114.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3D0319C45;
 Tue, 23 Feb 2021 09:40:34 +0000 (UTC)
Date: Tue, 23 Feb 2021 09:40:33 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jiahui Cen <cenjiahui@huawei.com>
Subject: Re: [PATCH v5 0/9] block: Add retry for werror=/rerror= mechanism
Message-ID: <YDTNkWsYbj3u5ejF@stefanha-x1.localdomain>
References: <20210205101315.13042-1-cenjiahui@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210205101315.13042-1-cenjiahui@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PYzMVp6S8urgC0iA"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, zhang.zhanghailiang@huawei.com,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 fangying1@huawei.com, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--PYzMVp6S8urgC0iA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 05, 2021 at 06:13:06PM +0800, Jiahui Cen wrote:
> This patch series propose to extend the werror=/rerror= mechanism to add
> a 'retry' feature. It can automatically retry failed I/O requests on error
> without sending error back to guest, and guest can get back running smoothly
> when I/O is recovred.

This patch series implements a retry followed by werror/rerror=report
after a timeout. This mechanism could be made more generic (and the code
could be simplified) by removing the new werror/rerror=retry action and
instead implementing the retry/timeout followed by *any* werror=/rerror=
policy chosen by the user.

In other words, if the retry interval is non-zero, retry the request and
check for timeouts. When the timeout is reached, obey the
werror=/rerror= action.

This is more flexible than hard-coding werror=retry to mean retry
timeout followed by werror=report.

For example:

  werror=stop,write-retry-interval=1000,write-retry-timeout=15000,
  rerror=report,read-retry-interval=1000,read-retry-timeout=15000

Failed write requests will be retried once a second for 15 seconds.
If the timeout is reached the guest is stopped.

Failed read requests will be retried once a second for 15 seconds. If
the timeout is reached the error is reported to the guest.

Stefan

--PYzMVp6S8urgC0iA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmA0zZEACgkQnKSrs4Gr
c8i5DggAi4peuZh0c66R1yoJ5C6rlS/FwzmHL9CGg9P+l6fFf0HEF8MEK5uh8FhT
hgnBIlQeQGZFbC3aHF0gdtA8h/2Dyy6VqEL7+fZmN1LlHLMUKHZIX7Ot6VNcaQ8H
fSwv3KPYFX4ct1WDWTPaJc1slyuepHBdkODQrFjcOAeFKlJdIZeq8H8EAcH9e8Kx
YEhRynvEBd4+MdpNkpxpp5RpGfsHB3ngsmzY1eIUb+5b2lFo8P9054/K/nM/8GzX
ZlZ1z52WFYKbHbi5aNTqRf9rivE2w9wjUNYbny3FvE+wSJkpJ1Xun2CL+WLApM1b
lQ9VGt+UTh8m89oBXjloXJ3zyh9OMQ==
=wG7z
-----END PGP SIGNATURE-----

--PYzMVp6S8urgC0iA--


