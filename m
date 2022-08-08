Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E7E58CB7D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 17:45:55 +0200 (CEST)
Received: from localhost ([::1]:45798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL4wz-00074K-V5
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 11:45:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL4v8-0004Gx-GH
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 11:43:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oL4v5-0005mO-2E
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 11:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659973434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uRf415FQebZQUh4mjP/4CtXS9msJ1/Q+zencFoCqJWw=;
 b=CKty9Ds4bjGfuKDmbCWarP8irAducDufT49lXUlcfUeosW1rkKl06YvXZ28BPM1LtrDx08
 cJzeLXbGo5Fl7VeHfBv1Ow0GVpM1OndS98/NpsxhNDJn1uN+GbEfj1w+ASuLHSddZF6SCe
 IicD26i6IO13Nm9u3pCPeVbHsDqDd0E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-kTMMwcPkMWSME4VvahPGDQ-1; Mon, 08 Aug 2022 11:43:51 -0400
X-MC-Unique: kTMMwcPkMWSME4VvahPGDQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0B27823F10;
 Mon,  8 Aug 2022 15:43:50 +0000 (UTC)
Received: from localhost (unknown [10.39.194.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4245440315F;
 Mon,  8 Aug 2022 15:43:49 +0000 (UTC)
Date: Mon, 8 Aug 2022 11:43:48 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] virtio-blk: replace dataplane_start/stopping/started
 with enum
Message-ID: <YvEvNL19ZnbK4f3z@fedora>
References: <20220808094147.612472-1-eesposit@redhat.com>
 <20220808094147.612472-3-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cJNvk/9aFLXqx5m+"
Content-Disposition: inline
In-Reply-To: <20220808094147.612472-3-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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


--cJNvk/9aFLXqx5m+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 08, 2022 at 05:41:47AM -0400, Emanuele Giuseppe Esposito wrote:
> Virtio-blk uses VirtIOBlockDataPlane and VirtIOBlock to keep track of
> the dataplane flags. This is completely unnecessary, as both structures
> are always accessed together and we can simplify the sages with an enum.

s/sages/stages/

--cJNvk/9aFLXqx5m+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmLxLzQACgkQnKSrs4Gr
c8iQrAgAu3CzihPIGeaDdPmz51FkoVDOOr1YHZ0vr/6eLaJtdEZ7XXbl/bCsn73O
OQey3wYMnJW+d3F+kt++nXef8mgSl5XoXsorT1NX58Gijl3eKiGnUzzCS8PNK01S
tAPWzhba0k6voRWk2EPKYBFATK9iV+KpQFc1Ug55Z5CZd+vX8ilIp8BNPfWAMely
dbe1IcNHjDZYUF4VaFp7TqbZx8SAsF6PINj6har2MVslGEt01znoYV5VW+J/hNhN
2TJrwbaqv7JhAc5euq3b930SGrKiwx3ftvvhjerl1FhzUkTPcKkpbtHEq/NzMULX
FkxWrOSTXtanL/Ztr+t3VAH6jqcZgg==
=eFV9
-----END PGP SIGNATURE-----

--cJNvk/9aFLXqx5m+--


