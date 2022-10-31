Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02226613DDA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 19:55:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opZuh-0001gq-PT; Mon, 31 Oct 2022 14:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZu2-0001BF-Ij
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opZu1-0003io-1S
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 14:52:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667242372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cz76TzPOUrYAj/wlaE93+pmcHjaHEgAtPfhqha69Hds=;
 b=OFywL3RqiBZghnwi/wOFOyxdEgi6/cQ1w5tsDj0iFfjuf7fBTYcAddsjQFJ5YsHqE1ifmn
 JLAMier1d2JS8WmQThE2p6GD3MpLFZpX8mPG/tr890+Go13u54a8AvM2XMSZ4TCDdwguaV
 DAyLQNPcuZTbaXyOwUACZj6uo2c5oHg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-EhLOzmWaN9qV7Z2J3C16yA-1; Mon, 31 Oct 2022 14:52:51 -0400
X-MC-Unique: EhLOzmWaN9qV7Z2J3C16yA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACE233800C23;
 Mon, 31 Oct 2022 18:52:50 +0000 (UTC)
Received: from localhost (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 292E717584;
 Mon, 31 Oct 2022 18:52:49 +0000 (UTC)
Date: Mon, 31 Oct 2022 14:39:24 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefan Weil via <qemu-devel@nongnu.org>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: Re: [PULL 0/4] Patches for Windows
Message-ID: <Y2AWXKMg+yaNgczQ@fedora>
References: <20221031091406.382872-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Xau50rIbizgYlI/V"
Content-Disposition: inline
In-Reply-To: <20221031091406.382872-1-sw@weilnetz.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org


--Xau50rIbizgYlI/V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--Xau50rIbizgYlI/V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmNgFlwACgkQnKSrs4Gr
c8h3ngf+K0k4akM5cvaueyS7XCH7ufDGy3rFycsF5wvXfQtqm7nAHUhgW4qYgkAn
kjZ/AUfmZzMPXhrftV2PUWPGoHxgFciGI2+oZATTTKahNCrBLbjjKO+A8NQdwiWD
zX1I5xd2QLox4qKGASReL0ZcYqmqZNVgp1+w4vrzL+L5q980mjJAkxSYO1lzcIgN
iK5iuRkv8hFUV0/vN3sIEwgsIaZV8s4Nk9my50TvsbDxcvOvsiAFzx8beJBWUhW4
E7mHqraKXF0bpVlhA4frhUFmUMJa6LDcmVdwoEuyNQZ84IdftM05XwmG90seRqfK
l6e2FF+kKMrSmRuWVuv2cGuMUrFXOg==
=fNSY
-----END PGP SIGNATURE-----

--Xau50rIbizgYlI/V--


