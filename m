Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D448410B76
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 18:41:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:36553 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLsIZ-00065e-37
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 12:41:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hLsHJ-0005VL-Lc
	for qemu-devel@nongnu.org; Wed, 01 May 2019 12:40:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hLsHF-0005xE-Rk
	for qemu-devel@nongnu.org; Wed, 01 May 2019 12:40:17 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:41748)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1hLsHD-0005ip-Qt
	for qemu-devel@nongnu.org; Wed, 01 May 2019 12:40:13 -0400
Received: by mail-io1-xd31.google.com with SMTP id r10so15267436ioc.8
	for <qemu-devel@nongnu.org>; Wed, 01 May 2019 09:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3P5Kdtdo12sDuaawJQikrH5MjeLdJngQSAP5kEZ5xOE=;
	b=ZdZjk0BXsspT3ipM1lCvd/bhP7Jq7RxhnIIPy6Wgz0Yaj2nu60mqIj0/NzwfD3FDws
	WP56VOnwaBmny9q6BXXKRHQaHhBBcG6wzXVMXfNWNBf9til09+gyr+KSvlf3XceihfMa
	1SasSVqjHhhpkV7Jhd+kak8nIHaIVnuEfMhC8rDt/cZG4BvVldlJvX0K+3eaXi0PvLtO
	cHRSUzng1Fg6I2wh9HBmi1ZFCAEJvpge/Cu1HlMUsAEByKew1UQCk9PWdJvf4hhhZWiO
	EIAI/8pq7uGBnvuiFoQlf5Cz+L63YjxtLPTJO28kroanUAPOuntv876YbFBYfhRkJMZi
	0ANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3P5Kdtdo12sDuaawJQikrH5MjeLdJngQSAP5kEZ5xOE=;
	b=Sh7ntlqi22rzUEES9T8X5l+5zdZgcmloFT3yy8iBKbUu9EJM7NuuU+WLA8b9w+yPOF
	8PHhLhdnNb0Y8iab4+KYeUVdf4/lJB5qvyiYk5vW44DaQIEdEF890WF4wvJ1eCgHQmqA
	NYl5q+QLV/DMLFeYz+Rl3c9yBo9vsL0g6DDOyEyZ+p01ZRj4gGQocuCyOMYtPPmewCJn
	qGS/YW4y09KD+ves0FG0o2frAfBwHu4aQJcldsDBFLv6se4D7XJO+JbgPXuga2/yolN3
	r/UaTHzsg7tIy/flagthdvz6xAecyTTpgktWALVdc5F88JswJQ8Ug7I62nZiSxTR1vW4
	MCHg==
X-Gm-Message-State: APjAAAUtrrj+syIBdE+yB8zVj37HeWb66hNmnKlcBDuRrGmzK1Znc6M9
	ULG9vyIxBGOdwfuLPTMUDAU=
X-Google-Smtp-Source: APXvYqy7AwHqPwHHJktkhcA3dmyKRo6AZkEWUzBiP1FSOB0q6TUg+/3ADmz9ALA7l+ZcIIA+XMckjw==
X-Received: by 2002:a5d:8b42:: with SMTP id c2mr14006601iot.192.1556728808865; 
	Wed, 01 May 2019 09:40:08 -0700 (PDT)
Received: from localhost
	(CPE64777d5479c3-CM64777d5479c0.cpe.net.cable.rogers.com.
	[99.228.64.175])
	by smtp.gmail.com with ESMTPSA id s8sm8409770iot.55.2019.05.01.09.40.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 May 2019 09:40:07 -0700 (PDT)
Date: Wed, 1 May 2019 12:40:06 -0400
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jie Wang <wangjie88@huawei.com>
Message-ID: <20190501164006.GH21155@stefanha-x1.localdomain>
References: <1556608500-12183-1-git-send-email-wangjie88@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bpVaumkpfGNUagdU"
Content-Disposition: inline
In-Reply-To: <1556608500-12183-1-git-send-email-wangjie88@huawei.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d31
Subject: Re: [Qemu-devel] [PATCH] vhost: fix memory leak in
 vhost_user_scsi_realize
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, wu.wubin@huawei.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--bpVaumkpfGNUagdU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2019 at 03:15:00PM +0800, Jie Wang wrote:
> fix memory leak in vhost_user_scsi_realize
>=20
> Signed-off-by: Jie Wang <wangjie88@huawei.com>
> ---
>  hw/scsi/vhost-user-scsi.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--bpVaumkpfGNUagdU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAlzJy+YACgkQnKSrs4Gr
c8jdTAf/XASDBhfsUuQ2Eg2K16EIYqccv1L6AWfV9aAIzlXP7wOdQmqpad1Fwq0u
gXJ5Hs64+dJfJt14pGPVoK1Jkics7ll1lykjrVuOR5kD2+3j7YadbTvbHa5T52a+
s+RcW3xtb2KwAugoaBPH3+GS8/aaYGfgkRxAVWh150bpmFVcI19Rc8f9ZxlNqiBZ
gIPB8kwbg0gDYj54nF6AV+iD49ifYuEWYtDEKIJXbJTtUWJigZqkxKM+qGKxhLn4
4aydVzUWLJJ2W3O2sS5HUBKHVXcAcnbFCRD0dvW2W5leTfRM0aVQ2ce4zcq3i7DF
VYThl2NMVK7l5QbVXupoLB3OyUESGg==
=I4BG
-----END PGP SIGNATURE-----

--bpVaumkpfGNUagdU--

