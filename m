Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92264BDA95
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 16:35:40 +0100 (CET)
Received: from localhost ([::1]:34854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMAix-0000tP-TK
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 10:35:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMAek-0006N7-HJ
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:31:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMAeh-0006JX-MR
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:31:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645457475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aD52SklpkryFhaNG0Wh0y9Ip+sYkNdFh8yCn0O2pyQg=;
 b=RcK1BMCzgB3ochYe0uWe2Dr+rl4rSlStRyJLIxipqUz5oNoddm985VZ/CVMvHQx4uYGAfq
 pflpKYymgHxbDpMdyo1q41eGeCLjtuwyDTxYryPCChtRnrqdqtvvvgrrgUe0F5BHEou1Xf
 DgO79C7F7dMUwdmqN8zdiT4fCGbdDjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-JG3KSEmvNDKEWszaaMs1Jg-1; Mon, 21 Feb 2022 10:31:11 -0500
X-MC-Unique: JG3KSEmvNDKEWszaaMs1Jg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19BD9180A0A3;
 Mon, 21 Feb 2022 15:31:10 +0000 (UTC)
Received: from localhost (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D484E76108;
 Mon, 21 Feb 2022 15:30:35 +0000 (UTC)
Date: Mon, 21 Feb 2022 15:30:34 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 03/19] qdev: unplug blocker for devices
Message-ID: <YhOwGkAa7uYdS2r/@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <5acc81b16d52949a47cbcbfcc2eacc0e4f3a5687.1645079934.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Vxc3Oce5KEzCZLkO"
Content-Disposition: inline
In-Reply-To: <5acc81b16d52949a47cbcbfcc2eacc0e4f3a5687.1645079934.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Vxc3Oce5KEzCZLkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 02:48:50AM -0500, Jagannathan Raman wrote:
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 01f3834db5..69d9cf3f25 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -945,10 +945,36 @@ void qmp_device_del(const char *id, Error **errp)
>              return;
>          }
> =20
> +        if (qdev_unplug_blocked(dev, errp)) {
> +            return;
> +        }
> +
>          qdev_unplug(dev, errp);

Can qdev_unplug() check this internally?

--Vxc3Oce5KEzCZLkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmITsBoACgkQnKSrs4Gr
c8jLRwgArrlgn3qslHWQdcAK/EFiuBmiEFLfnp/PIiMTVwpxqUTg+mcjJ6qYBcNT
tvTugD2hz6gl+EaUPgU5l/F6FGljd9F9f1Vegy1Z4XIoQkB/tRKVU290kM3xO4es
hs6cllDuneXddOinA1hKcrz6CXj6d9e0Kc3AAf4Kt/dSZLzYOx1zIIwyntGHP18z
Q/cm89LXIdIUUdnf5Qrs45p9ueqcSkCi5KZSaRseoxiSgJs0lQdR+KH2JUcbkc7E
6FVZZdFKixwT3p2sO1sQU3ocC+SD/0x9QwaOyjrAwYPK1omk5g8PfWD1p10JNFkQ
muY04pa5fGxFqxYWhdLAb/oeMC7zcw==
=w8WR
-----END PGP SIGNATURE-----

--Vxc3Oce5KEzCZLkO--


