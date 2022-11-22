Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42160634239
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 18:10:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxWm3-0006oE-JK; Tue, 22 Nov 2022 12:09:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oxWm1-0006nr-HO
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 12:09:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oxWm0-00080f-0v
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 12:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669136962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LYzT4/vBryMawDzAN8BpFfrpOZNtUGvR7R4e88OqJlY=;
 b=jI6uzMgoUGttk+2gI81T+TjqX3vcjr41tU/7q3uiLF+dowp3LXRbdnECv6s2TjmT5NRdBP
 RUgt0YOzCUT8wsqHlg+pYU8wpXji7DOtjLZz/qA3wuWWboCNjmwKCNN0/bXLhp1bJxApoh
 IQSg9lFw6OxYNVR/tlQTxhHPotR9GGM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-S-L3uIUrPgWiTm7irIRmJw-1; Tue, 22 Nov 2022 12:09:18 -0500
X-MC-Unique: S-L3uIUrPgWiTm7irIRmJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E83429AB418;
 Tue, 22 Nov 2022 17:09:18 +0000 (UTC)
Received: from localhost (unknown [10.39.194.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A451AC1908D;
 Tue, 22 Nov 2022 17:09:17 +0000 (UTC)
Date: Tue, 22 Nov 2022 12:09:14 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PULL v2 for 7.2-rc2 00/11] testing and doc updates
Message-ID: <Y30COjFSebiDtrKw@fedora>
References: <20221122095610.3343175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xqms6H0qPf8Tqgep"
Content-Disposition: inline
In-Reply-To: <20221122095610.3343175-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--xqms6H0qPf8Tqgep
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.2 for any user-visible changes.

--xqms6H0qPf8Tqgep
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmN9AjkACgkQnKSrs4Gr
c8hzEgf/bdnvVs8cMctUaa57fIZAZlyxZEsrRCg83TiK7c9reibOlOQ0DH3J3uQ+
wr122Soz3ke/k8djgPbHYwlpnpQ6zv8IJ8xMsRlP9MKQbIbeIEeIBkpaFPSVgdun
t+bYfiy28ZzlXEdT2fvhBl2YbS48W576yEcUVXtsvHsKabuFgNPj1x7UwwarvmK5
pJVKHH1uyTbnYRH7baNQjR1IaIqV/LCsmehHT/CCKaFfsRGpIFI5XFITDbQ5JTSK
2ZJt87ua7FY8jwzQ9mrTyWfEE9L6Mh1+oXWNP5QOFNrfyjywDG++s+WPGTqaHYFa
IPJlNFsb/7i7uLUSEZAXn3rw0kyAzA==
=jgzb
-----END PGP SIGNATURE-----

--xqms6H0qPf8Tqgep--


