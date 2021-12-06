Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720B2469904
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 15:30:57 +0100 (CET)
Received: from localhost ([::1]:59738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muF16-0005GQ-9P
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 09:30:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dankamongmen@gmail.com>)
 id 1muARA-0001Jd-KX
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 04:37:32 -0500
Received: from [2607:f8b0:4864:20::82d] (port=43545
 helo=mail-qt1-x82d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dankamongmen@gmail.com>)
 id 1muAR4-0008KC-Lr
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 04:37:32 -0500
Received: by mail-qt1-x82d.google.com with SMTP id q14so10183049qtx.10
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 01:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=RvIn+Y4cp5aMU3O4yNQCNE+mPQaxsr6Ga47orz6G1KE=;
 b=XKtkLG5UkaSGhnyIJUPQeroN/6oHVTTo0r3D6KacogRpJXuLEaVSRMOYhwDL34OJV9
 KVD+TPPkn9Avkq7vHrecztZazx8fYC4l3BXNUX3kD0yffMatJfYbtZQy+LRg72xj7PY2
 EBw6dmnag2JTAwbEQ4+u6VIc6HgYhd5tejxGQ46swGWkRmwcLSCPPZEaRF0Aw0CtO5fF
 szVzp/kFN0ySanB3hUNuszZrmgxgUHUcUeZOBImPw8vhPtuSI88O+cVGVHsRKRcgDVIb
 genqPZaFYnrOSCcXPN60YH3+7YQPWIM5wMGvSxsYTqPS7JjaM1VelyhO2Mk0BgQZpNWN
 V7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=RvIn+Y4cp5aMU3O4yNQCNE+mPQaxsr6Ga47orz6G1KE=;
 b=NZk2YMa87czjG8dSVMyQI+dpXOeQBNYlCYk8qEV1tyEiyBfuUDHyeoaYqOPWcjPDOJ
 1x4ZZRvC+XyKU8j9yRl5YxWPnIMaQFqNzQ2KQtWzef3nyzUElTCW17B/EnB7Afu+DOYd
 txbGU6aLBFVDdWf35IK5r156IvSFLOokL7m8TZtpwc7RYuxnSwIcrFvea8h5rf5SX8tV
 kfSA5z5/mE1PrgBDmfGIdJ5XYQVXKmo2oaZofZ7BEj4pGkdQzb/AdMfHsnOFkp0UuL0h
 PqS60QXz/ZXTY2bV2T/2E6mGigPTem6UovjYfVQn1sq4n5hP3toJoOUqve715SXqs6xj
 mI1w==
X-Gm-Message-State: AOAM5303/5LG6TFweW5/Iy2MtfIB31y/4ECY31V9Ns9ZL9RuiRiYDq/z
 xpZoGFCvgiJzvItBD/yLD+uKJZS2Xq8=
X-Google-Smtp-Source: ABdhPJz1LSBGhMOO/eTKYMZRBqVyH7tySrpm3jTUWGUNnfoXJx1Hy+3wfZBjAmIvBUX15T/58EqkjQ==
X-Received: by 2002:a05:622a:1a03:: with SMTP id
 f3mr38329931qtb.141.1638783445082; 
 Mon, 06 Dec 2021 01:37:25 -0800 (PST)
Received: from vps.qemfd.net (vps.qemfd.net. [173.230.130.29])
 by smtp.gmail.com with ESMTPSA id x16sm6383839qko.15.2021.12.06.01.37.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 01:37:24 -0800 (PST)
Received: from schwarzgerat.orthanc (schwarzgerat.danknet [192.168.128.2])
 by vps.qemfd.net (Postfix) with ESMTP id 41FE42B12A
 for <qemu-devel@nongnu.org>; Mon,  6 Dec 2021 04:37:24 -0500 (EST)
Received: by schwarzgerat.orthanc (Postfix, from userid 1000)
 id 343176003D2; Mon,  6 Dec 2021 04:37:24 -0500 (EST)
Date: Mon, 6 Dec 2021 04:37:24 -0500
From: nick black <dankamongmen@gmail.com>
To: qemu-devel@nongnu.org
Subject: request for wiki account
Message-ID: <Ya3Z1McSWa1kwr0V@schwarzgerat.orthanc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pGcYPbteG+Zixq3E"
Content-Disposition: inline
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=dankamongmen@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 06 Dec 2021 09:26:36 -0500
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


--pGcYPbteG+Zixq3E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hello there! i've been using qemu since about 2005, but somehow
never needed to make an account on the wiki. i now do. can i
get an account created for 'dankamongmen' or, if you prefer real
names, 'nickblack'? thanks!

--=20
nick black -=3D- https://www.nick-black.com
to make an apple pie from scratch,
you need first invent a universe.

--pGcYPbteG+Zixq3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEmi//dHmU4oe+xCLxX0NADCHL+swFAmGt2dEACgkQX0NADCHL
+sz2xg/8DPSLx33hLwujMLmhz3tE7MW2erjA4pcVfoiSD5yB0x7TI1ivY2+A9/a4
D+IOujL5TiRKw+i8nZ/4e8h4VaUIEonosn7VBuazji8L3tJAv505aWrN+022k0R5
y10c+G31iJJVxJXjVpB29gnwnZRQP30FS/RQTb2JtzYBg2Sr90NfCQiI1Qu03C4n
OBQkhZfPmpS4RK/aQML6F37EGLPqDwlBFSckGwqoWe3B9rymSlpOfDSseFHPvcUr
N2ywCq9Vht3twdVxLENguWAhw8oQqFqysDHoIrisL4YGOMB6NBLgUKbuAPcqw3OI
6c9SiO9Vn2bfjbCPw5I6Ahvwz1pvIfgtE5dXqIlL5Xb0qjPat6ieIUrkaoC0QJhC
l4x1on3er1IGgihQfSWrsVriMqqrQbs3JR6vwkGZSbP28gTB0TDBoFoQv+24ev/x
8W3xDe8+WXv1MKMEIcNKP7ZyAnLTvVsHBw/rMfBbrDW2bD8ALQrQ1LtQxqBHjUYQ
dBcARLUqypMMpYCIqTp0PAS494HobgP1JzMXrN6oucAANcA/cT4q2r/T1+VKg561
M0zpEpP6PYYmXvV5LzIMCSKUbA62TYDwraywAjEO1NeZcou/cYgUFD8jXlMiLOLV
YLFzQBCyiCeuSa4EtdUbTmRsGcjff0YdlBxgCN6j3mO6zzgKOdc=
=O7G9
-----END PGP SIGNATURE-----

--pGcYPbteG+Zixq3E--

