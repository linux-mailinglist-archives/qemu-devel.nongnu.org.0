Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D516646FEB8
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 11:26:36 +0100 (CET)
Received: from localhost ([::1]:43836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvd6q-00087f-0F
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 05:26:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1mvd4b-0006ip-7j
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:24:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1mvd4Y-0003Lv-5Z
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639131852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uUj3t4l19Qw/ssQ5Il0C+p7LMF4iuAw+hKUhYzl8F5E=;
 b=TKfTa2SmkXhlDYLzkHxX0RPbfw6tmGjYdzThb1NJqM2sucTxnFlcZBj002ALlD1R9N7nZG
 PNxvy00u89xURiJ4/b3AHiz605JYve9SyOOfhuMXSp0JZZtqvjL6mUWAaGbi0p9D9ANQiw
 6MgIlce50V4fdSTTUWCgo0mt5Yx4fxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-1zULxvPlOqCN2JeFz-31og-1; Fri, 10 Dec 2021 05:23:05 -0500
X-MC-Unique: 1zULxvPlOqCN2JeFz-31og-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C32A1006AA1
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 10:23:05 +0000 (UTC)
Received: from fedora (unknown [10.40.193.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40C3445D72;
 Fri, 10 Dec 2021 10:23:04 +0000 (UTC)
Date: Fri, 10 Dec 2021 11:23:01 +0100
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] configure: remove dead variables
Message-ID: <YbMqhTA+kr7W5ZGv@fedora>
References: <20211210084718.24758-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211210084718.24758-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jtomko@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xrRHCwV/7BMcfNqT"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jtomko@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--xrRHCwV/7BMcfNqT
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On a Friday in 2021, Paolo Bonzini wrote:
>Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>---
> configure | 5 -----
> 1 file changed, 5 deletions(-)
>

Reviewed-by: J=E1n Tomko <jtomko@redhat.com>

$supported_os is unused since
commit f9332757898a764d85e19d339ec421236e885b68
     meson: move summary to meson.build

$haiku is unused since
commit d99e97e6912d90a55e9a92e004dd54513da2848a
     configure: Add a proper check for openpty() in libutil

CONFIG_HAIKU is unused since
commit 4348300e751df1cd24810fb5f699f1f85bbc2849
     net/tap: Replace tap-haiku.c and tap-aix.c by a generic tap-stub.c

Jano

--xrRHCwV/7BMcfNqT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE7DTm0WabvfIr7YZ4Ak1z5KIMl5QFAmGzKn8ACgkQAk1z5KIM
l5TRlwf+NPIjNFY3oai/HRf4AX6I3gA5MvUPgPMpCzpjXmU23cw/05PEYpKxlUuX
oV2tSZSMzQGsC6EzCrwUVmyAVGDlib4NGkcGNWWVw8EPA1sG2R5CbsKy4Tj0bh/6
cN7Mgi4CCW/pXdt+2/pEn7AHKJ/Atswljyy/wbdWPauze5pkZX7oihSrEIVnOZhU
OJldeEQEgt1b3gBXhtVFbm1vHsV/H8AfNsaKsymsH+iQs+3oH0hzpNQ+UJzTuDJQ
W3nnwJfuToVnD9SyyMv1Li4b8joTq1S18ep1skLv1Z+MXK2Pr3oQwI26vcAbzNvM
O8jKr+3K2+ktAwsKApwy9cs8HTVaVQ==
=HZxg
-----END PGP SIGNATURE-----

--xrRHCwV/7BMcfNqT--


