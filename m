Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923C3539414
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 17:35:59 +0200 (CEST)
Received: from localhost ([::1]:39894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw3uY-0004PA-7A
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 11:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nw3rb-0003Tp-Fp
 for qemu-devel@nongnu.org; Tue, 31 May 2022 11:32:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nw3rX-0005M0-Ti
 for qemu-devel@nongnu.org; Tue, 31 May 2022 11:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654011169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pXp4lypBbsjPb+dxwi9LrUgxAJBU8ToPEaqCybu8n3M=;
 b=JwtAlxlrKq1xsFs+9FefGpNLEWw1mqPJ0/XuIqgtBfcsnk5E1INxAia6v7PYBxLxEHbkya
 ZKdnQ+kdeX4Ngnas8KBNH4C0Saruhs7Yw97zp+Rnysf7UNyIYlohD33HcqTy/7fs1Ncvxh
 xlGcGy0unC3ezR+AJmGG52p6qjd3Sn8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-o_XSLOFmMw-bbMkzaTalHQ-1; Tue, 31 May 2022 11:32:47 -0400
X-MC-Unique: o_XSLOFmMw-bbMkzaTalHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 573DE1C1377B;
 Tue, 31 May 2022 15:32:13 +0000 (UTC)
Received: from localhost (unknown [10.39.193.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0BB8B1731B;
 Tue, 31 May 2022 15:32:12 +0000 (UTC)
Date: Tue, 31 May 2022 16:32:12 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Cc: qemu-devel@nongnu.org, Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
Message-ID: <YpY0/Pc3uoA9QQD/@stefanha-x1.localdomain>
References: <20220531145147.61112-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TTCSCgCQiWWzfyFo"
Content-Disposition: inline
In-Reply-To: <20220531145147.61112-1-jusual@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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


--TTCSCgCQiWWzfyFo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2022 at 04:51:47PM +0200, Julia Suvorova wrote:
> In the ACPI specification [1], the 'unarmed' bit is set when a device
> cannot accept a persistent write. This means that when a memdev is
> read-only, the 'unarmed' flag must be turned on. The logic is correct,
> just changing the error message.
>=20
> [1] ACPI NFIT NVDIMM Region Mapping Structure "NVDIMM State Flags" Bit 3
>=20
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  hw/mem/nvdimm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--TTCSCgCQiWWzfyFo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKWNPsACgkQnKSrs4Gr
c8h8wQgAiGKA4cHDZvqM/kA2OjjHdaiIudpvn/kX67AI29iXOkU3jNmAXUuel5Jd
ZPrgnlWtbe7DnicLzjFz9jooLO4uIBU60+GZbFSRjEM90wDfDQ2sOmff+OdFlmOZ
Xc/NkBjW+gbtVTqB+U33ejFIhhp0bDxxtL6LyWp7Ql5ZCr31yxRUgb0/cNZrDP14
DAL6pCKiHqG7bilT8WfrI9w1rw9hbvXCqDOT1kWfbDuEM5arpDuiH/xNSLdYphLu
vlRPvXHo0d8ipmJctIRaSpo0z7tMPE6JBfa7jNo1BXU+Y8eRyRU33fgAbPMMeCCM
8TAHNlGcDMbWPBIP5sgPgb+PTZgvsA==
=8g+h
-----END PGP SIGNATURE-----

--TTCSCgCQiWWzfyFo--


