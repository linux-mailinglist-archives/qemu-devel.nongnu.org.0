Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6B940C7B4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 16:48:04 +0200 (CEST)
Received: from localhost ([::1]:33920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQWCh-00088S-OE
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 10:48:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQWAD-0006SH-FZ
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:45:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mQWAB-0004lp-EB
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 10:45:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631717126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yJRkwbVUByjh5WONlZj9FOIcYoE41vFunsqmujy1iPo=;
 b=NBON6aGAQtISywWg4hW5VtwBJ5ouapvc6VwGCEg2qZ3U+SAFX8uWxhSabIuB83PeW0Z2PL
 WE297tn6+udgG4QEJLRjwOjXLQqfProazXbVDu7swKxMDElp9u1DZTq6u+XBOqS+HQTsMy
 PI9VQ+QvOdpgRmIqUrcPbn/kh05e8mY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-ANUYfstIO5ebiR3ocTJ29g-1; Wed, 15 Sep 2021 10:45:25 -0400
X-MC-Unique: ANUYfstIO5ebiR3ocTJ29g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DFB81060DF8;
 Wed, 15 Sep 2021 14:45:24 +0000 (UTC)
Received: from localhost (unknown [10.39.194.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E504D6A908;
 Wed, 15 Sep 2021 14:45:19 +0000 (UTC)
Date: Wed, 15 Sep 2021 15:45:18 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] tools/virtiofsd: Add fstatfs64 syscall to the seccomp
 allowlist
Message-ID: <YUIG/s7hrJLtGiXZ@stefanha-x1.localdomain>
References: <20210914123214.181885-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210914123214.181885-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JyxRkJI0/G7zwlE3"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Vivek Goyal <vgoyal@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--JyxRkJI0/G7zwlE3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2021 at 02:32:14PM +0200, Thomas Huth wrote:
> The virtiofsd currently crashes on s390x when doing something like
> this in the guest:
>=20
>  mkdir -p /mnt/myfs
>  mount -t virtiofs myfs /mnt/myfs
>  touch /mnt/myfs/foo.txt
>  stat -f /mnt/myfs/foo.txt
>=20
> The problem is that the fstatfs64 syscall is called in this case
> from the virtiofsd. We have to put it on the seccomp allowlist to
> avoid that the daemon gets killed in this case.
>=20
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D2001728
> Suggested-by: Vivek Goyal <vgoyal@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tools/virtiofsd/passthrough_seccomp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--JyxRkJI0/G7zwlE3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFCBv4ACgkQnKSrs4Gr
c8isvwf/TinaF8f4yLc4IqxLf6wS4JtXdLaxXpZLZHHlU1NURkxIXD8a7XncQvHp
51IILqi4LgHPNHDdTBNFupE7tDwPjRzhueuMaOxo+aQJg+NI0j0kYaeR05jocoEL
AERlNu66XVR10DPaja9O1blOxxF2sou+C2MYDSV7lHYWs2g8iS9t9hEO77zF+VHB
VhL0jCt5GCdfQyME1wljLcXoHQWgBTArF7s/STjWWFaha+QoP6Ns/HyXqY7EbxIM
3uMxAPyypTCcrsi/2CNIOVyXmbUSzXPfG/Q+bbp6PNJDJ05UAfAxmavX3mqmCelh
SlGhr+pwvaAPRkVDAUeXZ3+tVqzAaA==
=jpo1
-----END PGP SIGNATURE-----

--JyxRkJI0/G7zwlE3--


